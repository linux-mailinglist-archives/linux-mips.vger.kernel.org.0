Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D04CA4A44
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728874AbfIAPxA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:53:00 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:41972 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbfIAPxA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:53:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 0C12F3F695
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:52:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4qlIxCNUCWes for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:52:57 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 6749D3F684
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:52:57 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:52:57 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 042/120] MIPS: PS2: ROM: Resolve the name for the region in
 the ROMVER file
Message-ID: <938c0cf921142d71b832d0c062503aeff71c103f.1567326213.git.noring@nocrew.org>
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

'J' indicates Japan, 'E' indicates Europe, 'C' indicates China and
'A' and 'H' indicate the USA.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/rom.h |  5 ++++-
 arch/mips/ps2/rom.c                  | 22 ++++++++++++++++++++--
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-ps2/rom.h b/arch/mips/include/asm/mach-ps2/rom.h
index 0b0e7c4162f5..43770fd62a2e 100644
--- a/arch/mips/include/asm/mach-ps2/rom.h
+++ b/arch/mips/include/asm/mach-ps2/rom.h
@@ -135,7 +135,8 @@ struct rom_extinfo rom_read_extinfo(const char *name,
  * @date.month: month ROM was created
  * @date.day: day ROM was created
  *
- * The @type name can be resolved with rom_type_name().
+ * The @region and @type names can be resolved with rom_region_name() and
+ * rom_type_name().
  *
  * Note that the Namco System 246 arcade systems are TOOL types as well.
  *
@@ -155,6 +156,8 @@ struct rom_ver {
 
 struct rom_ver rom_version(void);
 
+const char *rom_region_name(char region);
+
 const char *rom_type_name(char type);
 
 bool rom_empty_dir(const struct rom_dir dir);
diff --git a/arch/mips/ps2/rom.c b/arch/mips/ps2/rom.c
index 9adea705cbca..7cdc4962069e 100644
--- a/arch/mips/ps2/rom.c
+++ b/arch/mips/ps2/rom.c
@@ -383,6 +383,24 @@ struct rom_ver rom_version(void)
 }
 EXPORT_SYMBOL_GPL(rom_version);
 
+/**
+ * rom_region_name - name for the ROM region character in the ROMVER file
+ * @region: &rom_ver.region region character.
+ *
+ * Context: any
+ * Return: ROM region name, ``"-"`` if undefined or ``"?"`` if unrecognised
+ */
+const char *rom_region_name(char region)
+{
+	return region == 'J' ? "Japan" :
+	       region == 'E' ? "Europe" :
+	       region == 'C' ? "China" :
+	       region == 'A' ? "USA" :
+	       region == 'H' ? "USA" :
+	       region == '-' ? "-" : "?";
+}
+EXPORT_SYMBOL_GPL(rom_region_name);
+
 /**
  * rom_type_name - name for the ROM type character in the ROMVER file in ROM0
  * @type: &rom_ver.type type character.
@@ -675,8 +693,8 @@ static int __init ps2_rom_init(void)
 	rom1_dir = rom_dir_init("rom1", ROM1_BASE, ROM1_SIZE);
 
 	v = rom_version();
-	pr_info("rom0: Version %04x %c %s %04d-%02d-%02d\n",
-		v.number, v.region, rom_type_name(v.type),
+	pr_info("rom0: Version %04x %s %s %04d-%02d-%02d\n",
+		v.number, rom_region_name(v.region), rom_type_name(v.type),
 		v.date.year, v.date.month, v.date.day);
 
 	return 0;
-- 
2.21.0

