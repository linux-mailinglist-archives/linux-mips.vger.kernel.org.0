Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D99FFA4A32
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbfIAPtl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:49:41 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56792 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728667AbfIAPtl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:49:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id B69363F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5DIXbrUndGYR for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:49:36 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 84BB63F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:36 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:49:36 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 036/120] MIPS: PS2: ROM: Iterate over the files in a given
 ROM directory
Message-ID: <335c94c5e90f1422b7512c3a1ef1da4f0f1b212a.1567326213.git.noring@nocrew.org>
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

All PlayStation 2 machines have at least two read-only memories (ROMs)
called ROM0 and ROM1. A ROM consists of concatenated files forming a
directory.

The rom_for_each_file() iterator will be used to search for certain
ROM files in subsequent changes. The rom0:ROMVER file, for example,
contains information on the ROM version, the machine region, the
machine type (CEX for retail, DEX for debug, or TOOL), etc.

The input/output processor (IOP) of the PlayStation 2 links several
of its modules by reading ROM files. When the kernel links additional
modules to handle relayed interrupt services, for example, the kernel
module linker must resolve dependencies by identifying whether
libraries are linked as ROM or firmware files.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/rom.h |  79 +++++
 arch/mips/ps2/Makefile               |   1 +
 arch/mips/ps2/rom.c                  | 501 +++++++++++++++++++++++++++
 3 files changed, 581 insertions(+)
 create mode 100644 arch/mips/ps2/rom.c

diff --git a/arch/mips/include/asm/mach-ps2/rom.h b/arch/mips/include/asm/mach-ps2/rom.h
index 6760be183696..063c8b6acf15 100644
--- a/arch/mips/include/asm/mach-ps2/rom.h
+++ b/arch/mips/include/asm/mach-ps2/rom.h
@@ -8,10 +8,89 @@
 #ifndef __ASM_MACH_PS2_ROM_H
 #define __ASM_MACH_PS2_ROM_H
 
+#include <linux/types.h>
+
 #define ROM0_BASE	0x1fc00000	/* ROM0 base address (boot) */
 #define ROM0_SIZE	0x400000	/* ROM0 maximum size */
 
 #define ROM1_BASE	0x1e000000	/* ROM1 base address (DVD) */
 #define ROM1_SIZE	0x100000	/* ROM1 maximum size */
 
+struct rom_dir_entry;
+
+/**
+ * struct rom_dir - ROM directory
+ * @size: size in bytes of all files combined
+ * @data: pointer to data of all files combined
+ * @extinfo: extended information of all files combined
+ * @extinfo.size: size in bytes of all extended information combined
+ * @extinfo.data: pointer to data of all extended information combined
+ * @entries: pointer to array of ROM directory entries, with the terminating
+ * 	file as the last entry
+ *
+ * A directory is considered to be empty if @size is zero, in which case all
+ * members are zero.
+ */
+struct rom_dir {
+	size_t size;
+	const void *data;
+
+	struct {
+		size_t size;
+		const void *data;
+	} extinfo;
+
+	const struct rom_dir_entry *entries;
+};
+
+/**
+ * struct rom_file - ROM file
+ * @name: name of file, or the empty string for the terminating file
+ * @size: size in bytes of file
+ * @data: pointer to data of file
+ * @extinfo: extended ROM file information
+ * @extinfo.size: size in bytes of extended file information
+ * @extinfo.data: pointer to data of extended file information
+ * @next: pointer to next file, unless this is the terminating file
+ *
+ * A file is considered to be a terminating file if @name is the empty string.
+ * A terminating file is the last file in a &struct rom_dir directory.
+ */
+struct rom_file {
+	const char *name;
+	size_t size;
+	const void *data;
+
+	struct {
+		size_t size;
+		const void *data;
+	} extinfo;
+
+	const struct rom_dir_entry *next;
+};
+
+extern struct rom_dir rom0_dir;		/* ROM0 directory (boot) */
+extern struct rom_dir rom1_dir;		/* ROM1 directory (DVD) */
+
+/**
+ * rom_for_each_file - iterate over files in given ROM directory
+ * @file: &struct rom_file to use as a ROM file loop cursor
+ * @dir: &struct rom_dir with ROM directory to iterate over
+ *
+ * The statement following the macro is executed for ROM files in the
+ * directory.
+ */
+#define rom_for_each_file(file, dir)					\
+	for ((file) = rom_first_file(dir);				\
+	     !rom_terminating_file(file);				\
+	     (file) = rom_next_file(file))
+
+bool rom_empty_dir(const struct rom_dir dir);
+
+bool rom_terminating_file(const struct rom_file file);
+
+struct rom_file rom_next_file(const struct rom_file file);
+
+struct rom_file rom_first_file(const struct rom_dir dir);
+
 #endif /* __ASM_MACH_PS2_ROM_H */
diff --git a/arch/mips/ps2/Makefile b/arch/mips/ps2/Makefile
index d90d3e06387f..1101ad0d702b 100644
--- a/arch/mips/ps2/Makefile
+++ b/arch/mips/ps2/Makefile
@@ -2,5 +2,6 @@ obj-y		+= dmac-irq.o
 obj-y		+= intc-irq.o
 obj-y		+= irq.o
 obj-y		+= memory.o
+obj-y		+= rom.o
 obj-y		+= scmd.o
 obj-y		+= time.o
diff --git a/arch/mips/ps2/rom.c b/arch/mips/ps2/rom.c
new file mode 100644
index 000000000000..12a57f24bd63
--- /dev/null
+++ b/arch/mips/ps2/rom.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PlayStation 2 read-only memory (ROM)
+ *
+ * Copyright (C) 2019 Fredrik Noring
+ */
+
+/**
+ * DOC: PlayStation 2 read-only memory (ROM) layout and handling
+ *
+ * All PlayStation 2 machines have at least two ROMs called ROM0 and ROM1.
+ * A ROM consists of concatenated files. All known ROMs have the three files
+ * named RESET, ROMDIR and EXTINFO at the very beginning of the ROM:
+ *
+ *	- RESET: The internal structure of this file is currently unknown.
+ *	- ROMDIR: Array of 16-byte &rom_dir_entry directory entries. The file
+ *		name of the last entry is empty and this file is designated
+ *		the terminating file.
+ *	- EXTINFO: Concatenated variable length extended information entries,
+ *		where &rom_dir_entry.extinfo.size gives the size in bytes of
+ *		each entry.
+ *
+ * Since the internal layout of the RESET file is unknown, this implementation
+ * searches for the ROMDIR file by looking after the ``"RESET"`` string that
+ * is always the first entry of the ROMDIR file directory structure.
+ *
+ * Then the ROMDIR and EXTINFO files, and finally the whole ROM, are validated.
+ * The ROM is accepted if no structural errors are found. Otherwise the ROM is
+ * discarded and an error message is printed.
+ *
+ * Example of a ROM0 directory structure, as decoded from the ROMDIR file:
+ *
+ *	=================== =========================== ===================
+ *	&rom_dir_entry.name &rom_dir_entry.extinfo.size &rom_dir_entry.size
+ *	              RESET                          12               10048
+ *	             ROMDIR                          80                1584
+ *	            EXTINFO                           0                2028
+ *	             ROMVER                           0                  16
+ *	               SBIN                          12               28576
+ *	               LOGO                          12               83604
+ *	          IOPBTCONF                           8                 234
+ *	          IOPBTCON2                           8                 195
+ *	             SYSMEM                          40                4625
+ *	           LOADCORE                          32                9597
+ *	                ...                         ...                 ...
+ *	            PS2LOGO                          12              216260
+ *	             OSDSYS                          12              336808
+ *	             KERNEL                          12               93736
+ *	                                              0                   0
+ *	=================== =========================== ===================
+ *
+ * In this example the RESET file is 10048 bytes, which means that the offset
+ * to the ROMDIR file is 10048 bytes. This is also the location of the
+ * ``"RESET"`` string. The size of the ROMDIR file is 1584 bytes, which means
+ * there are 1584 / 16 = 99 files, including the terminating file. Thus there
+ * are 98 normal files, excluding the terminating file.
+ *
+ * The sum of all &rom_dir_entry.extinfo.size correspond to the size of the
+ * EXTINFO file, which is 2028 bytes in this case. The sum of all
+ * &rom_dir_entry.size is the size of the ROM, which is 3900816 bytes in this
+ * case.
+ *
+ * Files are padded to align with 16 byte boundaries. The EXTINFO file, in
+ * this example, is therefore padded to 2032 bytes. Some files named ``-``
+ * contain zeros only and seem to be padding to align the following file to
+ * a specific address.
+ */
+
+#include <linux/build_bug.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/types.h>
+
+#include <asm/io.h>
+
+#include <asm/mach-ps2/rom.h>
+
+struct rom_dir rom0_dir;
+struct rom_dir rom1_dir;
+EXPORT_SYMBOL_GPL(rom0_dir);
+EXPORT_SYMBOL_GPL(rom1_dir);
+
+/**
+ * struct rom - ROM object
+ * @name: name of ROM, for example "rom0" or "rom1"
+ * @base: virtual address of ROM
+ * @size: ROM size in bytes
+ */
+struct rom {
+	const char *name;
+	const void *base;
+	size_t size;
+};
+
+/**
+ * struct rom_dir_entry - raw 16-byte ROM directory entry of the ROMDIR file
+ * @name: file name; the empty string for the last terminating file
+ * @extinfo: extended ROM file information
+ * @extinfo.size: size in bytes of extended ROM file information
+ * @size: file size in bytes
+ */
+struct rom_dir_entry {
+	char name[10];
+	struct {
+		u16 size;
+	} extinfo;
+	u32 size;
+};
+
+/**
+ * rom_align_file_size - align ROM file size to 16 byte boundaries
+ * @size: possibly unaligned ROM size in bytes
+ *
+ * The aligned file size is used to obtain the offset to the subsequent file
+ * in a ROM.
+ *
+ * Return: padded file size in bytes, aligned to 16 byte boundaries
+ */
+static size_t rom_align_file_size(size_t size)
+{
+	return ALIGN(size, 16);
+}
+
+/**
+ * rom_next_extinfo_data - pointer to the EXTINFO entry for the subsequent file
+ * @file: file to find the next EXTINFO entry pointer for
+ *
+ * Return: pointer to the following EXTINFO entry
+ */
+static const void *rom_next_extinfo_data(const struct rom_file *file)
+{
+	const u8 *d = file->extinfo.data;
+
+	return &d[file->extinfo.size];
+}
+
+/**
+ * rom_next_data - pointer to the data for the subsequent file
+ * @file: file to find the next data pointer for
+ *
+ * Return: pointer to the data for the subsequent file
+ */
+static const void *rom_next_data(const struct rom_file *file)
+{
+	const u8 *d = file->data;
+
+	return &d[rom_align_file_size(file->size)];
+}
+
+/**
+ * rom_empty_dir - is the ROM directory empty?
+ * @dir: ROM directory to check
+ *
+ * Context: any
+ * Return: %true if the ROM directory is empty, else %false
+ */
+bool rom_empty_dir(const struct rom_dir dir)
+{
+	return !dir.size;
+}
+EXPORT_SYMBOL_GPL(rom_empty_dir);
+
+/**
+ * rom_terminating_file - is this a terminating ROM file?
+ * @file: ROM file to check
+ *
+ * Context: any
+ * Return: %true if the ROM file is a terminating entry, else %false
+ */
+bool rom_terminating_file(const struct rom_file file)
+{
+	return file.name[0] == '\0';
+}
+EXPORT_SYMBOL_GPL(rom_terminating_file);
+
+/**
+ * rom_next_file - advance to next ROM file, unless terminating file is given
+ * @file: ROM file to advance from
+ *
+ * Context: any
+ * Return: next ROM file, or a terminating file
+ */
+struct rom_file rom_next_file(const struct rom_file file)
+{
+	if (rom_terminating_file(file))
+		return file;
+
+	return (struct rom_file) {
+			.name = file.next->name,
+			.size = file.next->size,
+			.data = rom_next_data(&file),
+			.extinfo = {
+				.size = file.next->extinfo.size,
+				.data = rom_next_extinfo_data(&file)
+			},
+			.next = &file.next[file.next->name[0] != '\0' ? 1 : 0]
+		};
+}
+EXPORT_SYMBOL_GPL(rom_next_file);
+
+/**
+ * rom_first_file - first ROM file of a ROM directory
+ * @dir: ROM directory to retrieve the first file for
+ *
+ * Context: any
+ * Return: first ROM file, or a terminating file if the directory is empty
+ */
+struct rom_file rom_first_file(const struct rom_dir dir)
+{
+	if (rom_empty_dir(dir))
+		return (struct rom_file) { .name = "" };
+
+	return (struct rom_file) {
+			.name = dir.entries->name,
+			.size = dir.entries->size,
+			.data = dir.data,
+			.extinfo = {
+				.size = dir.entries->extinfo.size,
+				.data = dir.extinfo.data
+			},
+			.next = &dir.entries[1]
+		};
+}
+EXPORT_SYMBOL_GPL(rom_first_file);
+
+/**
+ * find_reset_string - find the offset to the ``"RESET"`` string, if it exists
+ * @rom: ROM to search in
+ *
+ * The ``"RESET"`` string that is always the first entry of the ROMDIR file
+ * directory structure.
+ *
+ * Return: byte offset to ``"RESET"``, or the size of the ROM on failure
+ */
+static loff_t __init find_reset_string(const struct rom rom)
+{
+	const char *s = rom.base;
+	size_t i;
+
+	for (i = 0; i + sizeof(struct rom_dir_entry) <= rom.size; i++)
+		if (s[i + 0] == 'R' &&
+		    s[i + 1] == 'E' &&
+		    s[i + 2] == 'S' &&
+		    s[i + 3] == 'E' &&
+		    s[i + 4] == 'T' &&
+		    s[i + 5] == '\0')
+			return i;
+
+	return rom.size;
+}
+
+/**
+ * rom_addr - pointer at offset within a given ROM object
+ * @rom: ROM object
+ * @offset: offset in bytes for the pointer location
+ * @size: size in bytes of the data at the given offset
+ *
+ * Return: ROM pointer, or %NULL if @size at the @offset is outside of the ROM
+ */
+static const void * __init rom_addr(
+	const struct rom rom, loff_t offset, size_t size)
+{
+	const u8 *b = rom.base;
+
+	return offset + size <= rom.size ? &b[offset] : NULL;
+}
+
+/**
+ * valid_rom_dir_entry_name - does the ROM directory entry has a valid name?
+ * @entry: ROM directory entry
+ *
+ * Return: %true if the ROM directory entry has a valid name, otherwise %false
+ */
+static bool __init valid_rom_dir_entry_name(const struct rom_dir_entry *entry)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(entry->name); i++)
+		if (entry->name[i] == '\0')
+			return true;
+
+	return false;
+}
+
+/**
+ * rom_dir_entry - ROM directory entry for a given ROM index
+ * @rom: ROM object
+ * @reset_offset: offset in bytes from ROM object start to the RESET file
+ * @entry_index: file index starting from zero
+ *
+ * Return: ROM directory entry for the given index
+ */
+static const struct rom_dir_entry * __init rom_dir_entry(
+	const struct rom rom, loff_t reset_offset, size_t entry_index)
+{
+	return rom_addr(rom,
+		reset_offset + entry_index * sizeof(struct rom_dir_entry),
+		sizeof(struct rom_dir_entry));
+}
+
+/**
+ * valid_rom_dir_header - is the ROM object valid?
+ * @rom: ROM object
+ * @reset_offset: offset in bytes from ROM object start to the RESET file
+ * @reset: the RESET ROM file
+ * @romdir: the ROMDIR ROM file
+ * @extinfo: the EXTINFO ROM file
+ *
+ * This verifies some of the assumptions that are made about read-only memories.
+ *
+ * Return: %true if the ROM appears to have a valid header, otherwise %false
+ */
+static bool __init valid_rom_dir_header(const struct rom rom,
+	const loff_t reset_offset,
+	const struct rom_dir_entry *reset,
+	const struct rom_dir_entry *romdir,
+	const struct rom_dir_entry *extinfo)
+{
+	size_t aligned_rom_header_size;
+
+	if (!reset || !romdir || !extinfo) {
+		pr_debug("%s: Missing RESET, ROMDIR or EXTINFO\n", rom.name);
+		return false;
+	}
+
+	if (strcmp(reset->name, "RESET") != 0 ||
+	    strcmp(romdir->name, "ROMDIR") != 0 ||
+	    strcmp(extinfo->name, "EXTINFO") != 0) {
+		pr_debug("%s: Misnamed RESET, ROMDIR or EXTINFO\n", rom.name);
+		return false;
+	}
+
+	if (rom_align_file_size(reset->size) != reset_offset) {
+		pr_debug("%s: Unaligned RESET %zu != %llu\n", rom.name,
+			rom_align_file_size(reset->size), reset_offset);
+		return false;
+	}
+
+	if (romdir->size % sizeof(struct rom_dir_entry) != 0) {
+		pr_debug("%s: ROMDIR unaligned %zu\n", rom.name, romdir->size);
+		return false;
+	}
+
+	aligned_rom_header_size =
+		rom_align_file_size(reset->size) +
+		rom_align_file_size(romdir->size) +
+		rom_align_file_size(extinfo->size);
+	if (aligned_rom_header_size > rom.size) {
+		pr_debug("%s: ROM header to large %zu > %zu\n", rom.name,
+			aligned_rom_header_size, rom.size);
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * rom_dir_size - total ROM object file size in bytes
+ * @rom: ROM object
+ * @reset: the RESET ROM file
+ * @romdir: the ROMDIR ROM file
+ * @extinfo: the EXTINFO ROM file
+ *
+ * Return: total size in bytes of all files for the ROM object
+ */
+static size_t __init rom_dir_size(const struct rom rom,
+	const struct rom_dir_entry *reset,
+	const struct rom_dir_entry *romdir,
+	const struct rom_dir_entry *extinfo)
+{
+	const size_t n = romdir->size / sizeof(struct rom_dir_entry);
+	const struct rom_dir_entry *entries = reset;
+	size_t extinfo_size = 0;
+	size_t size = 0;
+	size_t i;
+
+	if (!n) {
+		pr_debug("%s: Missing terminating entry\n", rom.name);
+		return 0;
+	}
+
+	if (entries[n - 1].name[0] != '\0') {
+		pr_debug("%s: Nonterminating name: \"%s\"\n", rom.name,
+			entries[n - 1].name);
+		return 0;
+	}
+
+	for (i = 0; i < n; i++) {
+		if (!valid_rom_dir_entry_name(&entries[i])) {
+			pr_debug("%s: Invalid entry name\n", rom.name);
+			return 0;
+		}
+
+		extinfo_size += entries[i].extinfo.size;
+		size += rom_align_file_size(entries[i].size);
+	}
+
+	if (extinfo_size > extinfo->size) {
+		pr_debug("%s: EXTINFO too large %zu > %zu\n", rom.name,
+			extinfo_size, extinfo->size);
+		return 0;
+	}
+
+	if (size > rom.size) {
+		pr_debug("%s: ROM size too large %zu > %zu\n", rom.name,
+			size, rom.size);
+		return 0;
+	}
+
+	pr_info("%s: Found %zu files in %zu bytes\n", rom.name, n - 1, size);
+
+	return size;
+}
+
+/**
+ * extinfo_data - data for the EXTINFO ROM file
+ * @rom: read-only memory object
+ * @reset: the RESET ROM file
+ * @romdir: the ROMDIR ROM file
+ *
+ * The EXTINFO file comes as the third file after RESET and ROMDIR.
+ *
+ * Return: EXTINFO ROM file data
+ */
+static const void * __init extinfo_data(const struct rom rom,
+	const struct rom_dir_entry *reset,
+	const struct rom_dir_entry *romdir)
+{
+	const u8 *b = rom.base;
+
+	return &b[rom_align_file_size(reset->size) +
+		  rom_align_file_size(romdir->size)];
+}
+
+/**
+ * rom_dir_for_rom - the ROM directory for a given ROM object
+ * @rom: ROM object
+ *
+ * Return: ROM directory
+ */
+static struct rom_dir __init rom_dir_for_rom(const struct rom rom)
+{
+	const loff_t reset_offset = find_reset_string(rom);
+	struct rom_dir dir = { };
+	size_t size;
+
+	/* RESET, ROMDIR and EXTINFO always come at indices 0, 1, 2. */
+	const struct rom_dir_entry
+		*reset   = rom_dir_entry(rom, reset_offset, 0),
+		*romdir  = rom_dir_entry(rom, reset_offset, 1),
+		*extinfo = rom_dir_entry(rom, reset_offset, 2);
+
+	if (!valid_rom_dir_header(rom, reset_offset, reset, romdir, extinfo))
+		return dir;
+
+	size = rom_dir_size(rom, reset, romdir, extinfo);
+	if (!size)
+		return dir;
+
+	dir.size = size;
+	dir.data = rom.base;
+	dir.extinfo.size = extinfo->size;
+	dir.extinfo.data = extinfo_data(rom, reset, romdir);
+	dir.entries = reset;
+
+	return dir;
+}
+
+/**
+ * rom_dir_init - the ROM directory for a given physical address
+ * @name: name of the ROM object
+ * @rom_phys_base: physical address of the ROM
+ * @rom_size: maximum size in bytes of the ROM
+ *
+ * The ROM directory is adjusted to the actual total size of the ROM files.
+ *
+ * Return: ROM directory
+ */
+static struct rom_dir __init rom_dir_init(const char *name,
+	phys_addr_t rom_phys_base, size_t rom_size)
+{
+	const struct rom rom = {
+		.name = name,
+		.base = phys_to_virt(rom_phys_base),
+		.size = rom_size
+	};
+
+	return rom_dir_for_rom(rom);
+}
+
+static int __init ps2_rom_init(void)
+{
+	BUILD_BUG_ON(sizeof(struct rom_dir_entry) != 16);
+
+	rom0_dir = rom_dir_init("rom0", ROM0_BASE, ROM0_SIZE);
+	rom1_dir = rom_dir_init("rom1", ROM1_BASE, ROM1_SIZE);
+
+	return 0;
+}
+arch_initcall(ps2_rom_init);
-- 
2.21.0

