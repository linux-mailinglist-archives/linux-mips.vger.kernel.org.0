Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A981A4A67
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbfIAQLx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:11:53 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:59704 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIAQLx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:11:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0DEEF3FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:11:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3rd1GH9mSbm4 for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:11:49 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 36DBF3F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:11:49 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:11:49 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 070/120] MIPS: PS2: IOP: Avoid linking already linked library
 modules
Message-ID: <7030b6576dad761807bcaf047c9dda404a6d1016.1567326213.git.noring@nocrew.org>
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

As a simplification the IOP module linker assumes that modules with
exported libraries are resident. The primary effect is that it refuses
to link modules exporting libraries with the same names more than once,
even if the they may have been unlinked in the IOP. This is because the
IOP module linker maintains its own list of exported libraries, rather
than asking the IOP about them, which remains to be implemented. For now
it is assumed that modules do not unlink themselves.

The IOP module linker also assumes that if a module exports a library it
has the same name as the module. The simplifies resolving dependencies.
In general, and with most ROM modules, the module name is not the same
as the exported library names. A single module may export multiple
libraries, but that is currently not not fully supported with IOP
modules for Linux, due to dependency resolving limitations.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/iop-module.c | 282 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/drivers/ps2/iop-module.c b/drivers/ps2/iop-module.c
index 532b3cce91c0..ef7b254bb2cf 100644
--- a/drivers/ps2/iop-module.c
+++ b/drivers/ps2/iop-module.c
@@ -29,6 +29,20 @@
  * The modules can either stay resident in the IOP, and provide services, or
  * unlink themselves when exiting the entry function. Many modules provide
  * remote procedure call (RPC) services via the sub-system interface (SIF).
+ *
+ * As a simplification the IOP module linker assumes that modules with
+ * exported libraries are resident. The primary effect is that it refuses to
+ * link modules exporting libraries with the same names more than once, even
+ * if the they may have been unlinked in the IOP. This is because the IOP
+ * module linker maintains its own list of exported libraries, rather than
+ * asking the IOP about them, which remains to be implemented.
+ *
+ * The IOP module linker also assumes that if a module exports a library it
+ * has the same name as the module. The simplifies resolving dependencies. In
+ * general, and with most ROM modules, the module name is not the same as the
+ * exported library names. A single module may export multiple libraries, but
+ * that is currently not not fully supported with IOP modules for Linux, due
+ * to dependency resolving limitations.
  */
 
 #include <linux/bcd.h>
@@ -70,12 +84,15 @@ static DEFINE_MUTEX(iop_module_lock);
 
 static struct device *iop_module_device;
 static struct sif_rpc_client load_file_rpc_client;
+static LIST_HEAD(linked_libraries);
 
 #define IOPMOD_MAX_PATH		252
 #define IOPMOD_MAX_ARG		252
 #define IOPMOD_MAX_LIBRARY_NAME	8
 
 #define IOPMOD_NO_ID		0xffffffff
+#define IOPMOD_IMPORT_MAGIC	0x41e00000
+#define IOPMOD_EXPORT_MAGIC	0x41c00000
 
 #define SHT_IOPMOD		(SHT_LOPROC + 0x80)
 
@@ -101,6 +118,93 @@ struct irx_iopmod {
 	char name[0];
 };
 
+/**
+ * struct irx_import_link - link entry for an imported library
+ * @jr: unconditional MIPS I jump to return address instruction
+ * @jr.target: jump target, to be resolved by the IOP linker
+ * @jr.op: operation code for the jump register instruction
+ * @li: 16-bit load immediate pseudo-instruction
+ * @li.imm: index of the imported library link entry
+ * @li.rt: `$0` register
+ * @li.rs: `$0` register
+ * @li.op: operation code for the load immediate pseudo-instruction
+ */
+struct irx_import_link {
+	struct {
+		u32 target : 26;
+		u32 op : 6;
+	} jr;
+	struct {
+		u32 imm : 16;
+		u32 rt : 5;
+		u32 rs : 5;
+		u32 op : 6;
+	} li;
+};
+
+/**
+ * struct irx_import_library - link entry table for an imported library
+ * @magic: %IOPMOD_IMPORT_MAGIC marks the beginning of the link entry table
+ * @zero: always zero
+ * @version: 16-bit version in BCD, with 8-bit minor and 8-bit major
+ * @name: library name, not NUL terminated unless shorter than
+ * 	%IOPMOD_MAX_LIBRARY_NAME characters
+ * @link: array of imported link entries, with the terminating entry zero
+ *
+ * The &struct irx_import_library resides in the .text section of the module.
+ */
+struct irx_import_library {
+	u32 magic;
+	u32 zero;
+	u32 version;
+	char name[IOPMOD_MAX_LIBRARY_NAME];
+	struct irx_import_link link[0];
+};
+
+/**
+ * struct irx_export_link - link entry for an exported library
+ * @addr: address to link
+ */
+struct irx_export_link {
+	u32 addr;
+};
+
+/**
+ * struct irx_export_library - link entry table for an exported library
+ * @magic: %IOPMOD_EXPORT_MAGIC marks the beginning of the link entry table
+ * @zero: always zero
+ * @version: 16-bit version in BCD, with 8-bit minor and 8-bit major
+ * @name: library name, not NUL terminated unless shorter than
+ * 	%IOPMOD_MAX_LIBRARY_NAME characters
+ * @link: array of exported link entries, with the terminating entry zero
+ *
+ * The &struct irx_export_library resides in the .text section of the module.
+ */
+struct irx_export_library {
+	u32 magic;
+	u32 zero;
+	u32 version;
+	char name[IOPMOD_MAX_LIBRARY_NAME];
+	struct irx_export_link link[0];
+};
+
+/**
+ * struct library_entry - list of linked libraries
+ * @list: linked list of library entries
+ * @name: library name, not NUL terminated unless shorter than
+ * 	%IOPMOD_MAX_LIBRARY_NAME characters
+ * @version: 16-bit version in BCD, with 8-bit minor and 8-bit major
+ *
+ * The IOP module linker maintains its own list of linked libraries, rather
+ * than asking the IOP about them, which remains to be implemented.
+ */
+struct library_entry {
+	struct list_head list;
+
+	char name[IOPMOD_MAX_LIBRARY_NAME];
+	int version;
+};
+
 /**
  * elf_ent_for_offset - pointer given an ELF offset
  * @offset: ELF offset
@@ -151,6 +255,37 @@ static const struct elf32_shdr *elf_next_section(
 	     (shdr);							\
 	     (shdr) = elf_next_section((shdr), (ehdr)))
 
+/**
+ * elf_strings - base of ELF module string table
+ * @ehdr: ELF header of module
+ *
+ * Return: pointer to base of ELF module table
+ */
+static const char *elf_strings(const struct elf32_hdr *ehdr)
+{
+	const struct elf32_shdr *shdr;
+
+	if (ehdr->e_shstrndx == SHN_UNDEF)
+		return NULL;
+
+	shdr = &elf_first_section(ehdr)[ehdr->e_shstrndx];
+
+	return elf_ent_for_offset(shdr->sh_offset, ehdr);
+}
+
+/**
+ * elf_section_name - name of section
+ * @shdr: header of section to provide name for
+ * @ehdr: ELF header of module for section
+ *
+ * Return: name of given section
+ */
+static const char *elf_section_name(const struct elf32_shdr *shdr,
+	const struct elf32_hdr *ehdr)
+{
+	return &elf_strings(ehdr)[shdr->sh_name];
+}
+
 /**
  * elf_first_section_with_type - first section with given type
  * @type: type of section to search for
@@ -171,6 +306,26 @@ static const struct elf32_shdr *elf_first_section_with_type(
 	return NULL;
 }
 
+/**
+ * elf_first_section_with_name - first section with given name
+ * @name: name of section to search for
+ * @ehdr: ELF header of module to search
+ *
+ * Return: pointer to the first occurrence of the section, or %NULL if it does
+ * 	not exist
+ */
+static const struct elf32_shdr *elf_first_section_with_name(
+	const char *name, const struct elf32_hdr *ehdr)
+{
+	const struct elf32_shdr *shdr;
+
+	elf_for_each_section (shdr, ehdr)
+		if (strcmp(elf_section_name(shdr, ehdr), name) == 0)
+			return shdr;
+
+	return NULL;
+}
+
 /**
  * elf_identify - does the buffer contain an ELF object?
  * @buffer: pointer to data to identify
@@ -192,6 +347,69 @@ static bool elf_identify(const void *buffer, size_t size)
 	       ehdr->e_ident[EI_VERSION] == EV_CURRENT;
 }
 
+/**
+ * library_entry - find occurrence of 4-byte magic integer
+ * @library: import or export library starting pointer
+ * @magic: 4-byte magic integer to search for
+ * @ehdr: ELF header of module to search
+ *
+ * The %IOPMOD_IMPORT_MAGIC and %IOPMOD_EXPORT_MAGIC 4-byte integers are used
+ * to mark libraries that are imported and exported by the module.
+ *
+ * Return: library entry following the current library entry, or %NULL
+ */
+static const void *library_entry(const void *library, u32 magic,
+	const struct elf32_hdr *ehdr)
+{
+	const struct elf32_shdr *shdr =
+		elf_first_section_with_name(".text", ehdr);
+	const u32 *text = elf_ent_for_offset(shdr->sh_offset, ehdr);
+	const size_t length = shdr->sh_size / sizeof(*text);
+	const size_t index = library ? ((u32 *)library - text) + 1 : 0;
+	size_t i;
+
+	for (i = index; i < length; i++)
+		if (text[i] == magic)
+			return &text[i];
+
+	return NULL;
+}
+
+/**
+ * irx_first_export_library - first exported library entry
+ * @ehdr: ELF header of module
+ *
+ * Return: first exported library entry, or %NULL
+ */
+static const struct irx_export_library *irx_first_export_library(
+	const struct elf32_hdr *ehdr)
+{
+	return library_entry(NULL, IOPMOD_EXPORT_MAGIC, ehdr);
+}
+
+/**
+ * irx_next_export_library - next exported library entry
+ * @library: current library entry
+ * @ehdr: ELF header of module
+ *
+ * Return: exported library entry following the current library entry, or %NULL
+ */
+static const struct irx_export_library *irx_next_export_library(
+	const struct irx_export_library *library, const struct elf32_hdr *ehdr)
+{
+	return library_entry(library, IOPMOD_EXPORT_MAGIC, ehdr);
+}
+
+/**
+ * irx_for_each_export_library - iterate over exported libraries
+ * @library: &struct irx_export_library loop cursor
+ * @ehdr: ELF header of module to iterate
+ */
+#define irx_for_each_export_library(library, ehdr)			\
+	for ((library) = irx_first_export_library(ehdr);		\
+	     (library);							\
+	     (library) = irx_next_export_library((library), (ehdr)))
+
 /**
  * irx_iopmod - give .iopmod section pointer, if it exists
  * @ehdr: ELF header of module
@@ -270,6 +488,58 @@ static bool irx_identify(const void *buffer, size_t size)
 	return elf_identify(buffer, size) && irx_iopmod(buffer) != NULL;
 }
 
+/**
+ * library_provided_by_firmware - is the library provided by linked firmware?
+ * @name: name of the library to search for
+ *
+ * Return: %true if some previously linked firmware provides the library,
+ * 	otherwise %false
+ */
+static bool library_provided_by_firmware(const char *name)
+{
+	const struct library_entry *library;
+
+	list_for_each_entry (library, &linked_libraries, list)
+		if (strncmp(name, library->name, sizeof(library->name)) == 0)
+			return true;
+
+	return false;
+}
+
+/**
+ * register_libraries - register libraries provided by the given module
+ * @ehdr: IOP module
+ *
+ * FIXME: Libraries are maintained in a linked list by the kernel as a
+ * simplification. This list is not updated if the modules providing the
+ * libraries are unlinked. In principle one could query the IOP about its
+ * modules, but that has not been implemented yet. For now it is assumed
+ * the modules do not unlink themselves.
+ *
+ * Return: 0 on success, otherwise a negative error number
+ */
+static int register_libraries(const struct elf32_hdr *ehdr)
+{
+	const struct irx_export_library *library;
+
+	irx_for_each_export_library (library, ehdr) {
+		struct library_entry *entry =
+			kmalloc(sizeof(*entry), GFP_KERNEL);
+
+		if (!entry)
+			return -ENOMEM;
+
+		*entry = (struct library_entry) {
+			.version = library->version,
+		};
+		memcpy(entry->name, library->name, IOPMOD_MAX_LIBRARY_NAME);
+
+		list_add(&entry->list, &linked_libraries);
+	}
+
+	return 0;
+}
+
 /**
  * iop_module_link_buffer - link IOP module given in buffer
  * @buf: buffer containing the IOP module to link
@@ -327,9 +597,16 @@ static int iop_module_link_buffer(const void *buf, size_t nbyte,
 		goto err_out;
 	}
 
+	err = register_libraries(buf);
+	if (err < 0)
+		goto err_libraries;
+
 	iop_free(link.addr);
 	return 0;
 
+err_libraries:
+	/* FIXME: Unlink module here */
+
 err_out:
 	iop_free(link.addr);
 	return err;
@@ -355,6 +632,11 @@ static int iop_module_request_firmware(
 	char filepath[32];
 	int err;
 
+	if (library_provided_by_firmware(name)) {
+		pr_debug("iop-module: %s module is already provided\n", name);
+		return 0;
+	}
+
 	pr_debug("iop-module: %s module linking as firmware\n", name);
 
 	if (snprintf(filepath, sizeof(filepath),
-- 
2.21.0

