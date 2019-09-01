Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75C63A4A37
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfIAPum (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:50:42 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57800 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfIAPum (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:50:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 37E20402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:50:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3ia7rdVHrTBq for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:50:40 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 85C8C3FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:50:40 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:50:40 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 040/120] MIPS: PS2: ROM: Read and decode the ROMVER file
Message-ID: <01d431fa1e7c4b03bb95d5a7016677958a09abd3.1567326213.git.noring@nocrew.org>
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

The ROMVER file contains information on the ROM version, the machine
region, the machine type (CEX for retail, DEX for debug, or TOOL) and
the date the ROM was created.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/rom.h | 30 ++++++++++++++++++++++++++++
 arch/mips/ps2/rom.c                  | 28 ++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/rom.h b/arch/mips/include/asm/mach-ps2/rom.h
index 4cc3fcffaa59..42e520f32f65 100644
--- a/arch/mips/include/asm/mach-ps2/rom.h
+++ b/arch/mips/include/asm/mach-ps2/rom.h
@@ -123,6 +123,36 @@ ssize_t rom_read_file(const struct rom_dir dir,
 struct rom_extinfo rom_read_extinfo(const char *name,
 	const void *buffer, size_t size);
 
+/**
+ * struct rom_ver - ROM version
+ * @number: ROM version number
+ * @region: ROM region with ``'J'`` for Japan, ``'E'`` for Europe,
+ * 	``'C'`` for China, and ``'A'`` or ``'H'`` for the USA
+ * @type: ROM type with ``'C'`` for retail (CEX), ``'D'`` for debug (DEX),
+ * 	and `'T'`` for TOOL, or ``'-'`` for undefined
+ * @date: date ROM was created
+ * @date.year: year ROM was created
+ * @date.month: month ROM was created
+ * @date.day: day ROM was created
+ *
+ * Note that the Namco System 246 arcade systems are TOOL types as well.
+ *
+ * A ROM version is considered to be invalid if @number is zero, in which
+ * case all members are zero except @region and @type that are ``'-'``.
+ */
+struct rom_ver {
+	int number;
+	char region;
+	char type;
+	struct {
+		int year;
+		int month;
+		int day;
+	} date;
+};
+
+struct rom_ver rom_version(void);
+
 bool rom_empty_dir(const struct rom_dir dir);
 
 bool rom_terminating_file(const struct rom_file file);
diff --git a/arch/mips/ps2/rom.c b/arch/mips/ps2/rom.c
index a510832e26d7..32ae8ec839c4 100644
--- a/arch/mips/ps2/rom.c
+++ b/arch/mips/ps2/rom.c
@@ -362,6 +362,27 @@ struct rom_extinfo rom_read_extinfo(const char *name,
 }
 EXPORT_SYMBOL_GPL(rom_read_extinfo);
 
+/**
+ * rom_version - read the ROMVER file in ROM0
+ *
+ * Context: any
+ * Return: ROM version; or, if reading failed, all members zeroed except
+ *      @region and @type that are set to ``'-'``
+ */
+struct rom_ver rom_version(void)
+{
+	struct rom_ver v = { };
+	char buffer[20] = { };
+	ssize_t r = rom_read_file(rom0_dir, "ROMVER",
+		buffer, sizeof(buffer) - 1, 0);
+
+	return r > 0 && sscanf(buffer, "%4x%c%c%4d%2d%2d",
+				&v.number, &v.region, &v.type,
+				&v.date.year, &v.date.month, &v.date.day) == 6 ?
+		v : (struct rom_ver) { .region = '-', .type = '-' };
+}
+EXPORT_SYMBOL_GPL(rom_version);
+
 /**
  * find_reset_string - find the offset to the ``"RESET"`` string, if it exists
  * @rom: ROM to search in
@@ -629,12 +650,19 @@ static struct rom_dir __init rom_dir_init(const char *name,
 
 static int __init ps2_rom_init(void)
 {
+	struct rom_ver v;
+
 	BUILD_BUG_ON(sizeof(struct rom_dir_entry) != 16);
 	BUILD_BUG_ON(sizeof(struct rom_extinfo_entry) != 4);
 
 	rom0_dir = rom_dir_init("rom0", ROM0_BASE, ROM0_SIZE);
 	rom1_dir = rom_dir_init("rom1", ROM1_BASE, ROM1_SIZE);
 
+	v = rom_version();
+	pr_info("rom0: Version %04x %c %c %04d-%02d-%02d\n",
+		v.number, v.region, v.type,
+		v.date.year, v.date.month, v.date.day);
+
 	return 0;
 }
 arch_initcall(ps2_rom_init);
-- 
2.21.0

