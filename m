Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90C8A4A35
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfIAPuP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:50:15 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41670 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAPuO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:50:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 0893E3F684
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:50:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Y3EikCEZws4j for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:50:12 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 65A0F3F672
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:50:12 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:50:12 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 038/120] MIPS: PS2: ROM: Read data for a given ROM file name
Message-ID: <69a1b78886392bca426ac6f521197af06d768042.1567326213.git.noring@nocrew.org>
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

Reading ROM files is trivial since they are permanently available in
memory. Having rom_read_file() is a convenient when for example
resolving the machine region in subsequent changes.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/rom.h |  3 +++
 arch/mips/ps2/rom.c                  | 33 ++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/rom.h b/arch/mips/include/asm/mach-ps2/rom.h
index 8794bd13184e..f2c35788ddfb 100644
--- a/arch/mips/include/asm/mach-ps2/rom.h
+++ b/arch/mips/include/asm/mach-ps2/rom.h
@@ -98,6 +98,9 @@ extern struct rom_dir rom1_dir;		/* ROM1 directory (DVD) */
 	rom_for_each_file((file), (dir))				\
 		if (strcmp((file).name, filename) != 0) continue; else
 
+ssize_t rom_read_file(const struct rom_dir dir,
+	const char *name, void *buffer, size_t size, loff_t offset);
+
 bool rom_empty_dir(const struct rom_dir dir);
 
 bool rom_terminating_file(const struct rom_file file);
diff --git a/arch/mips/ps2/rom.c b/arch/mips/ps2/rom.c
index 12a57f24bd63..840d37a199d8 100644
--- a/arch/mips/ps2/rom.c
+++ b/arch/mips/ps2/rom.c
@@ -224,6 +224,39 @@ struct rom_file rom_first_file(const struct rom_dir dir)
 }
 EXPORT_SYMBOL_GPL(rom_first_file);
 
+/**
+ * rom_read_file - read ROM file data
+ * @dir: directory to read the file from
+ * @name: file name to read
+ * @buffer: pointer to buffer to store data that is read
+ * @size: size in bytes to read
+ * @offset: offset in bytes to start reading
+ *
+ * Context: any
+ * Return: on successful completion, a nonnegative integer indicating the
+ * 	number of bytes actually read; otherwise, a negative error number
+ */
+ssize_t rom_read_file(const struct rom_dir dir,
+	const char *name, void *buffer, size_t size, loff_t offset)
+{
+	struct rom_file file;
+
+	rom_find_files(file, dir, name)
+		if (offset < file.size) {
+			const u8 *b = file.data;
+			size_t remaining = file.size - offset;
+			size_t n = min(size, remaining);
+
+			memcpy(buffer, &b[offset], n);
+
+			return n;
+		} else
+			return 0;
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(rom_read_file);
+
 /**
  * find_reset_string - find the offset to the ``"RESET"`` string, if it exists
  * @rom: ROM to search in
-- 
2.21.0

