Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76259A4A68
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbfIAQME (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:12:04 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:59714 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIAQME (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:12:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 472053FC34
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:12:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DqmCMQl7jYQL for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:12:01 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8AA0F3F53F
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:12:01 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:12:01 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 071/120] MIPS: PS2: IOP: Resolve module dependencies
Message-ID: <94f1123ecafe2bab02de14ba3e516a957ee16c34.1567326213.git.noring@nocrew.org>
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

As a simplification it is assumed that if a ROM file provides the given
library dependency, then the ROM file has been prelinked into the IOP.

Hopefully, ROM file dependencies will be kept to a minimum, and new
modules are instead tailored for Linux.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 drivers/ps2/iop-module.c | 166 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/drivers/ps2/iop-module.c b/drivers/ps2/iop-module.c
index ef7b254bb2cf..bb4814b5d3c4 100644
--- a/drivers/ps2/iop-module.c
+++ b/drivers/ps2/iop-module.c
@@ -375,6 +375,64 @@ static const void *library_entry(const void *library, u32 magic,
 	return NULL;
 }
 
+/**
+ * irx_first_import_library - first imported library entry
+ * @ehdr: ELF header of module
+ *
+ * Return: first imported library entry, or %NULL
+ */
+static const struct irx_import_library *irx_first_import_library(
+	const struct elf32_hdr *ehdr)
+{
+	return library_entry(NULL, IOPMOD_IMPORT_MAGIC, ehdr);
+}
+
+/**
+ * same_import_library - are the two imported libraries the same?
+ * @a: first imported library
+ * @b: second imported library
+ *
+ * Return: %true if the libraries have the same name, otherwise %false
+ */
+static bool same_import_library(
+	const struct irx_import_library *a,
+	const struct irx_import_library *b)
+{
+	return strncmp(a->name, b->name, sizeof(a->name)) == 0;
+}
+
+/**
+ * irx_next_import_library - next imported library entry
+ * @library: current library entry
+ * @ehdr: ELF header of module
+ *
+ * Return: imported library entry following the current library entry, or %NULL
+ */
+static const struct irx_import_library *irx_next_import_library(
+	const struct irx_import_library *library, const struct elf32_hdr *ehdr)
+{
+	const struct irx_import_library *next = library;
+
+	while (next) {
+		if (!same_import_library(next, library))
+			return next;
+
+		next = library_entry(next, IOPMOD_IMPORT_MAGIC, ehdr);
+	}
+
+	return next;
+}
+
+/**
+ * irx_for_each_import_library - iterate over imported libraries
+ * @library: &struct irx_import_library loop cursor
+ * @ehdr: ELF header of module to iterate
+ */
+#define irx_for_each_import_library(library, ehdr)			\
+	for ((library) = irx_first_import_library((ehdr));		\
+	     (library);							\
+	     (library) = irx_next_import_library((library), (ehdr)))
+
 /**
  * irx_first_export_library - first exported library entry
  * @ehdr: ELF header of module
@@ -488,6 +546,45 @@ static bool irx_identify(const void *buffer, size_t size)
 	return elf_identify(buffer, size) && irx_iopmod(buffer) != NULL;
 }
 
+/**
+ * library_provided_by_module - is the library provided by the module?
+ * @name: name of the library to search for
+ * @ehdr: ELF header of module
+ *
+ * Return: %true if the module provides the library, otherwise %false
+ */
+static bool library_provided_by_module(const char *name,
+	const struct elf32_hdr *ehdr)
+{
+	const struct irx_export_library *library;
+
+	irx_for_each_export_library (library, ehdr)
+		if (strncmp(name, library->name, sizeof(library->name)) == 0)
+			return true;
+
+	return false;
+}
+
+/**
+ * library_provided_by_rom - is the library provided by the ROM directory?
+ * @name: name of the library to search for
+ * @dir: ROM directory
+ *
+ * Return: %true if some ROM file in the ROM directory provides the library,
+ * 	otherwise %false
+ */
+static bool library_provided_by_rom(const char *name, const struct rom_dir dir)
+{
+	struct rom_file file;
+
+	rom_for_each_file (file, dir)
+		if (irx_identify(file.data, file.size))
+			if (library_provided_by_module(name, file.data))
+				return true;
+
+	return false;
+}
+
 /**
  * library_provided_by_firmware - is the library provided by linked firmware?
  * @name: name of the library to search for
@@ -506,6 +603,24 @@ static bool library_provided_by_firmware(const char *name)
 	return false;
 }
 
+/**
+ * library_provided - is the library provided?
+ * @name: name of the library to search for
+ *
+ * As a simplification it is assumed that if a ROM file provides the given
+ * library, then the ROM file has been prelinked into the IOP.
+ *
+ * The IOP linker will deal with issues related to version compatibility.
+ *
+ * Return: %true if the library is provided, otherwise %false
+ */
+static bool library_provided(const char *name)
+{
+	return library_provided_by_rom(name, rom0_dir) ||
+	       library_provided_by_rom(name, rom1_dir) ||
+	       library_provided_by_firmware(name);
+}
+
 /**
  * register_libraries - register libraries provided by the given module
  * @ehdr: IOP module
@@ -615,6 +730,52 @@ static int iop_module_link_buffer(const void *buf, size_t nbyte,
 static int iop_module_request_firmware(
 	const char *name, int version, const char *arg);
 
+/**
+ * iop_module_request_dependencies - resolve and prelink dependencies for
+ * 	requested IOP module
+ * @ehdr: IOP module to request dependencies for
+ * @requesting_name: name of IOP module requesting dependencies
+ *
+ * Return: 0 on success, otherwise a negative error number
+ */
+static int iop_module_request_dependencies(const struct elf32_hdr *ehdr,
+	const char *requesting_name)
+{
+	const struct irx_import_library *library;
+
+	irx_for_each_import_library (library, ehdr) {
+		char library_name[sizeof(library->name) + 1] = { };
+		int err;
+
+		/* Convert the library name to a NUL-terminated string. */
+		memcpy(library_name, library->name, sizeof(library->name));
+
+		if (library_provided(library_name)) {
+			pr_debug("iop-module: %s dependency on %s provided\n",
+				requesting_name, library_name);
+			continue;
+		}
+
+		pr_debug("iop-module: %s module depends on %s library version %u.%u\n",
+			requesting_name, library_name,
+			major_version(library->version),
+			minor_version(library->version));
+
+		err = iop_module_request_firmware(
+			library_name, library->version, NULL);
+		if (err < 0) {
+			pr_err("iop-module: %s dependency on %s failed to resolve with %d\n",
+				requesting_name, library_name, err);
+			return err;
+		}
+
+		pr_debug("iop-module: %s dependency on %s resolved\n",
+			requesting_name, library_name);
+	}
+
+	return 0;
+}
+
 /**
  * iop_module_request_firmware - link IOP module as firmware
  * @name: name of requested module
@@ -669,8 +830,13 @@ static int iop_module_request_firmware(
 		goto err_incompatible;
 	}
 
+	err = iop_module_request_dependencies(ehdr, name);
+	if (err < 0)
+		goto err_dependency;
+
 	err = iop_module_link_buffer(fw->data, fw->size, arg);
 
+err_dependency:
 err_incompatible:
 err_identify:
 err_request:
-- 
2.21.0

