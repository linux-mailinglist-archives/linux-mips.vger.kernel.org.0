Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855EFA4A36
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfIAPu3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:50:29 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:56864 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAPu3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:50:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id BCC1B3F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:50:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aKX_22ltDbSv for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:50:26 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E90993F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:50:26 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:50:26 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 039/120] MIPS: PS2: ROM: Read extended information for a
 given ROM file
Message-ID: <5ea0f2d9e2cb3475661c922ee1b1b05367293c63.1567326213.git.noring@nocrew.org>
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

The extended information (EXTINFO) is metadata about ROM files, often
but not always containing file date, version and brief comments.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/rom.h |  22 ++++++
 arch/mips/ps2/rom.c                  | 106 +++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/rom.h b/arch/mips/include/asm/mach-ps2/rom.h
index f2c35788ddfb..4cc3fcffaa59 100644
--- a/arch/mips/include/asm/mach-ps2/rom.h
+++ b/arch/mips/include/asm/mach-ps2/rom.h
@@ -69,6 +69,25 @@ struct rom_file {
 	const struct rom_dir_entry *next;
 };
 
+/**
+ * struct rom_extinfo - extended ROM file information
+ * @version: version number
+ * @date: date ROM was created
+ * @date.year: year ROM was created
+ * @date.month: month ROM was created
+ * @date.day: day ROM was created
+ * @comment: comment or the empty string
+ */
+struct rom_extinfo {
+	int version;
+	struct {
+		int year;
+		int month;
+		int day;
+	} date;
+	const char *comment;
+};
+
 extern struct rom_dir rom0_dir;		/* ROM0 directory (boot) */
 extern struct rom_dir rom1_dir;		/* ROM1 directory (DVD) */
 
@@ -101,6 +120,9 @@ extern struct rom_dir rom1_dir;		/* ROM1 directory (DVD) */
 ssize_t rom_read_file(const struct rom_dir dir,
 	const char *name, void *buffer, size_t size, loff_t offset);
 
+struct rom_extinfo rom_read_extinfo(const char *name,
+	const void *buffer, size_t size);
+
 bool rom_empty_dir(const struct rom_dir dir);
 
 bool rom_terminating_file(const struct rom_file file);
diff --git a/arch/mips/ps2/rom.c b/arch/mips/ps2/rom.c
index 840d37a199d8..a510832e26d7 100644
--- a/arch/mips/ps2/rom.c
+++ b/arch/mips/ps2/rom.c
@@ -66,6 +66,7 @@
  * a specific address.
  */
 
+#include <linux/bcd.h>
 #include <linux/build_bug.h>
 #include <linux/errno.h>
 #include <linux/init.h>
@@ -108,6 +109,32 @@ struct rom_dir_entry {
 	u32 size;
 };
 
+/**
+ * enum rom_extinfo_entry_type - EXTINFO &rom_extinfo_entry.type for a ROM file
+ * @rom_extinfo_entry_date: BCD of day, month and year follows as 4 byte data
+ * @rom_extinfo_entry_version: version number is in &rom_extinfo_entry.value
+ * @rom_extinfo_entry_comment: NUL terminated comment string follows as data
+ * @rom_extinfo_entry_unknown: Unclear, but seems to indicate file is aligned
+ */
+enum rom_extinfo_entry_type {
+	rom_extinfo_entry_date		= 1,
+	rom_extinfo_entry_version	= 2,
+	rom_extinfo_entry_comment	= 3,
+	rom_extinfo_entry_unknown	= 0x7f
+};
+
+/**
+ * struct rom_extinfo_entry - raw 4-byte EXTINFO entry for a ROM file
+ * @value: only known use is the version number for &rom_extinfo_entry_version
+ * @size: size in bytes of following data
+ * @type: &rom_extinfo_entry_type type
+ */
+struct rom_extinfo_entry {
+	u16 value;
+	u8 size;
+	u8 type;
+};
+
 /**
  * rom_align_file_size - align ROM file size to 16 byte boundaries
  * @size: possibly unaligned ROM size in bytes
@@ -257,6 +284,84 @@ ssize_t rom_read_file(const struct rom_dir dir,
 }
 EXPORT_SYMBOL_GPL(rom_read_file);
 
+/**
+ * rom_read_extinfo - read EXTINFO for a ROM file
+ * @name: name of ROM file, used for error reporting
+ * @buffer: pointer to EXTINFO data
+ * @size: size of EXTINFO data
+ *
+ * Return: EXTINFO for ROM file, where undefined members are zero or the empty
+ * 	string in the case of the comment
+ */
+struct rom_extinfo rom_read_extinfo(const char *name,
+	const void *buffer, size_t size)
+{
+	struct rom_extinfo ei = { .comment = "" };
+	struct rom_extinfo_entry entry;
+	const u8 *buf = buffer;
+	size_t i = 0;
+
+	/*
+	 * As an example, three EXTINFO entries for a ROM file might look
+	 * like this in binary form:
+	 *
+	 * 00 00 04 01 03 04 02 20 01 01 00 02 00 00 08 03  ................
+	 * 53 74 64 69 6f 00 00 00                          Stdio...
+	 *
+	 * The first entry is the date 2002-04-03, the second entry is the
+	 * version 0x101, and the last entry is the comment "Stdio".
+	 */
+
+	while (i + sizeof(entry) <= size) {
+		const u8 *data = &buf[i + sizeof(entry)];
+
+		memcpy(&entry, &buf[i], sizeof(entry));
+		i += sizeof(entry) + entry.size;
+
+		if (i > size) {
+			pr_debug("%s: %s: Invalid entry size %zu > %zu\n",
+				__func__, name, i, size);
+			break;
+		}
+
+		switch (entry.type) {
+		case rom_extinfo_entry_date:
+			if (entry.size == 4) {
+				ei.date.day   = bcd2bin(data[0]);
+				ei.date.month = bcd2bin(data[1]);
+				ei.date.year  = bcd2bin(data[2]) +
+						bcd2bin(data[3]) * 100;
+			} else
+				pr_debug("%s: %s: Invalid date size %u\n",
+					__func__, name, entry.size);
+			break;
+
+		case rom_extinfo_entry_version:
+			ei.version = entry.value;
+			break;
+
+		case rom_extinfo_entry_comment:
+			if (entry.size > 0 && data[entry.size - 1] == '\0') {
+				ei.comment = (const char *)data;
+			} else
+				pr_debug("%s: %s: Malformed comment\n",
+					__func__, name);
+			break;
+
+		case rom_extinfo_entry_unknown:
+			/* Ignore */
+			break;
+
+		default:
+			pr_debug("%s: %s: Invalid type %d\n",
+				__func__, name, entry.type);
+		}
+	}
+
+	return ei;
+}
+EXPORT_SYMBOL_GPL(rom_read_extinfo);
+
 /**
  * find_reset_string - find the offset to the ``"RESET"`` string, if it exists
  * @rom: ROM to search in
@@ -525,6 +630,7 @@ static struct rom_dir __init rom_dir_init(const char *name,
 static int __init ps2_rom_init(void)
 {
 	BUILD_BUG_ON(sizeof(struct rom_dir_entry) != 16);
+	BUILD_BUG_ON(sizeof(struct rom_extinfo_entry) != 4);
 
 	rom0_dir = rom_dir_init("rom0", ROM0_BASE, ROM0_SIZE);
 	rom1_dir = rom_dir_init("rom1", ROM1_BASE, ROM1_SIZE);
-- 
2.21.0

