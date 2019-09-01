Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE7AA4A65
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfIAQLI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:11:08 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:43518 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIAQLH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:11:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 8C4D73F615
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:11:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EWSrkz_Cubo7 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:11:04 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id C89273F58C
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:11:04 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:11:04 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 068/120] MIPS: PS2: IOP: Verify that modules are IRX objects
Message-ID: <f18c07fe41b5d5dd31bc625bd90222fb03505943.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

IOP modules are checked, mainly to print helpful error messages in case
of mistakes. IOP modules must have an .iopmod section with the special
ELF type SHT_LOPROC+0x80.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/iop-module.c | 154 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/drivers/ps2/iop-module.c b/drivers/ps2/iop-module.c
index 0e4a2173c001..d332a7d1af60 100644
--- a/drivers/ps2/iop-module.c
+++ b/drivers/ps2/iop-module.c
@@ -69,6 +69,140 @@ static struct sif_rpc_client load_file_rpc_client;
 
 #define IOPMOD_MAX_PATH		252
 #define IOPMOD_MAX_ARG		252
+#define IOPMOD_MAX_LIBRARY_NAME	8
+
+#define IOPMOD_NO_ID		0xffffffff
+
+#define SHT_IOPMOD		(SHT_LOPROC + 0x80)
+
+/**
+ * struct irx_iopmod - special .iopmod section with module name, version, etc.
+ * @id_addr: address of a special identification structure, or %IOPMOD_NO_ID
+ * @entry_addr: module entry address to begin executing code
+ * @unknown: FIXME
+ * @text_size: size in bytes of text section
+ * @data_size: size in bytes of data section
+ * @bss_size: size in bytes of BSS section
+ * @version: module version in BCD
+ * @name: NUL-terminated name of module
+ */
+struct irx_iopmod {
+	u32 id_addr;
+	u32 entry_addr;
+	u32 unknown;
+	u32 text_size;
+	u32 data_size;
+	u32 bss_size;
+	u16 version;
+	char name[0];
+};
+
+/**
+ * elf_ent_for_offset - pointer given an ELF offset
+ * @offset: ELF offset
+ * @ehdr: ELF header of module
+ *
+ * Return: pointer for a given ELF offset
+ */
+static const void *elf_ent_for_offset(Elf32_Off offset,
+	const struct elf32_hdr *ehdr)
+{
+	return &((const u8 *)ehdr)[offset];
+}
+
+/**
+ * elf_first_section - first ELF section
+ * @ehdr: ELF header of module
+ *
+ * Return: pointer to the first ELF section, or %NULL if it does not exist
+ */
+static const struct elf32_shdr *elf_first_section(const struct elf32_hdr *ehdr)
+{
+	return ehdr->e_shnum ? elf_ent_for_offset(ehdr->e_shoff, ehdr) : NULL;
+}
+
+/**
+ * elf_next_section - next ELF section
+ * @shdr: header of current section
+ * @ehdr: ELF header of module
+ *
+ * Return: section following the current section, or %NULL
+ */
+static const struct elf32_shdr *elf_next_section(
+	const struct elf32_shdr *shdr, const struct elf32_hdr *ehdr)
+{
+	const struct elf32_shdr *next = &shdr[1];
+	const struct elf32_shdr *past = &elf_first_section(ehdr)[ehdr->e_shnum];
+
+	return next == past ? NULL: next;
+}
+
+/**
+ * elf_for_each_section - iterate over all ELF sections
+ * @shdr: &struct elf32_shdr loop cursor
+ * @ehdr: ELF header of module to iterate
+ */
+#define elf_for_each_section(shdr, ehdr)				\
+	for ((shdr) = elf_first_section((ehdr));			\
+	     (shdr);							\
+	     (shdr) = elf_next_section((shdr), (ehdr)))
+
+/**
+ * elf_first_section_with_type - first section with given type
+ * @type: type of section to search for
+ * @ehdr: ELF header of module to search
+ *
+ * Return: pointer to the first occurrence of the section, or %NULL if it does
+ * 	not exist
+ */
+static const struct elf32_shdr *elf_first_section_with_type(
+	Elf32_Word type, const struct elf32_hdr *ehdr)
+{
+	const struct elf32_shdr *shdr;
+
+	elf_for_each_section (shdr, ehdr)
+		if (shdr->sh_type == type)
+			return shdr;
+
+	return NULL;
+}
+
+/**
+ * elf_identify - does the buffer contain an ELF object?
+ * @buffer: pointer to data to identify
+ * @size: size in bytes of buffer
+ *
+ * Return: %true if the buffer looks like an ELF object, otherwise %false
+ */
+static bool elf_identify(const void *buffer, size_t size)
+{
+	const struct elf32_hdr *ehdr = buffer;
+
+	if (size < sizeof(*ehdr))
+		return false;
+
+	return ehdr->e_ident[EI_MAG0] == ELFMAG0 &&
+	       ehdr->e_ident[EI_MAG1] == ELFMAG1 &&
+	       ehdr->e_ident[EI_MAG2] == ELFMAG2 &&
+	       ehdr->e_ident[EI_MAG3] == ELFMAG3 &&
+	       ehdr->e_ident[EI_VERSION] == EV_CURRENT;
+}
+
+/**
+ * irx_iopmod - give .iopmod section pointer, if it exists
+ * @ehdr: ELF header of module
+ *
+ * The .iopmod section is specific to IOP (IRX) modules.
+ *
+ * Return: .iopmod section pointer, or %NULL
+ */
+static const struct irx_iopmod *irx_iopmod(const struct elf32_hdr *ehdr)
+{
+	const struct elf32_shdr *shdr =
+		elf_first_section_with_type(SHT_IOPMOD, ehdr);
+
+	return shdr ? elf_ent_for_offset(shdr->sh_offset, ehdr) : NULL;
+}
 
 /**
  * major_version - major version of version in BCD
@@ -92,6 +226,18 @@ static unsigned int minor_version(unsigned int version)
 	return bcd2bin(version & 0xff);
 }
 
+/**
+ * irx_identify - does the buffer contain an IRX object?
+ * @buffer: pointer to data to identify
+ * @size: size in bytes of buffer
+ *
+ * Return: %true if the buffer looks like an IRX object, otherwise %false
+ */
+static bool irx_identify(const void *buffer, size_t size)
+{
+	return elf_identify(buffer, size) && irx_iopmod(buffer) != NULL;
+}
+
 /**
  * iop_module_link_buffer - link IOP module given in buffer
  * @buf: buffer containing the IOP module to link
@@ -189,10 +335,18 @@ static int iop_module_request_firmware(
 	if (err < 0)
 		goto err_request;
 
+	if (!irx_identify(fw->data, fw->size)) {
+		pr_err("iop-module: %s module is not an IRX object\n",
+			filepath);
+		err = -ENOEXEC;
+		goto err_identify;
+	}
+
 	ehdr = (const struct elf32_hdr *)fw->data;
 
 	err = iop_module_link_buffer(fw->data, fw->size, arg);
 
+err_identify:
 err_request:
 err_name:
 
-- 
2.21.0

