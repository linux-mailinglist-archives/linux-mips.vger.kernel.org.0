Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32998A4A42
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728644AbfIAPwm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:52:42 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:57010 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbfIAPwm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:52:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 945B53F73E
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:52:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FIlQnHnI_MeK for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:52:39 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E798D3F708
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:52:39 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:52:39 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 041/120] MIPS: PS2: ROM: Resolve the name for the type in the
 ROMVER file
Message-ID: <6a096d0e6a7532194907863bc0286059fddb7bef.1567326213.git.noring@nocrew.org>
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

'C' indicates CEX for retail, 'D' indicates DEX for debug, and 'T'
indicates a TOOL machine.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/rom.h |  4 ++++
 arch/mips/ps2/rom.c                  | 20 ++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-ps2/rom.h b/arch/mips/include/asm/mach-ps2/rom.h
index 42e520f32f65..0b0e7c4162f5 100644
--- a/arch/mips/include/asm/mach-ps2/rom.h
+++ b/arch/mips/include/asm/mach-ps2/rom.h
@@ -135,6 +135,8 @@ struct rom_extinfo rom_read_extinfo(const char *name,
  * @date.month: month ROM was created
  * @date.day: day ROM was created
  *
+ * The @type name can be resolved with rom_type_name().
+ *
  * Note that the Namco System 246 arcade systems are TOOL types as well.
  *
  * A ROM version is considered to be invalid if @number is zero, in which
@@ -153,6 +155,8 @@ struct rom_ver {
 
 struct rom_ver rom_version(void);
 
+const char *rom_type_name(char type);
+
 bool rom_empty_dir(const struct rom_dir dir);
 
 bool rom_terminating_file(const struct rom_file file);
diff --git a/arch/mips/ps2/rom.c b/arch/mips/ps2/rom.c
index 32ae8ec839c4..9adea705cbca 100644
--- a/arch/mips/ps2/rom.c
+++ b/arch/mips/ps2/rom.c
@@ -383,6 +383,22 @@ struct rom_ver rom_version(void)
 }
 EXPORT_SYMBOL_GPL(rom_version);
 
+/**
+ * rom_type_name - name for the ROM type character in the ROMVER file in ROM0
+ * @type: &rom_ver.type type character.
+ *
+ * Context: any
+ * Return: ROM type name, ``"-"`` if undefined or ``"?"`` if unrecognised
+ */
+const char *rom_type_name(char type)
+{
+	return type == 'C' ? "CEX" :
+	       type == 'D' ? "DEX" :
+	       type == 'T' ? "TOOL" :
+	       type == '-' ? "-" : "?";
+}
+EXPORT_SYMBOL_GPL(rom_type_name);
+
 /**
  * find_reset_string - find the offset to the ``"RESET"`` string, if it exists
  * @rom: ROM to search in
@@ -659,8 +675,8 @@ static int __init ps2_rom_init(void)
 	rom1_dir = rom_dir_init("rom1", ROM1_BASE, ROM1_SIZE);
 
 	v = rom_version();
-	pr_info("rom0: Version %04x %c %c %04d-%02d-%02d\n",
-		v.number, v.region, v.type,
+	pr_info("rom0: Version %04x %c %s %04d-%02d-%02d\n",
+		v.number, v.region, rom_type_name(v.type),
 		v.date.year, v.date.month, v.date.day);
 
 	return 0;
-- 
2.21.0

