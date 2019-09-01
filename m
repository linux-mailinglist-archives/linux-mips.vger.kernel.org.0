Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FFEA4A33
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbfIAPtu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:49:50 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57714 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfIAPtu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:49:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id A5F844036B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ACefYi-2gaLe for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:49:48 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 081F43FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:49:47 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:49:47 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 037/120] MIPS: PS2: ROM: Find ROM files with a given name, if
 they exist
Message-ID: <34f0675b7e66bf672ff043e8f66c2c2364cd9880.1567326213.git.noring@nocrew.org>
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

rom_find_files() searches for files in the given ROM directory. Most ROM
files have unique names, but certain special files named for example "-"
appear multiple times.

The "continue; else" construction is used to avoid an if-else ambiguity
warning from GCC, when the loop has an if-else statement.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/rom.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/rom.h b/arch/mips/include/asm/mach-ps2/rom.h
index 063c8b6acf15..8794bd13184e 100644
--- a/arch/mips/include/asm/mach-ps2/rom.h
+++ b/arch/mips/include/asm/mach-ps2/rom.h
@@ -85,6 +85,19 @@ extern struct rom_dir rom1_dir;		/* ROM1 directory (DVD) */
 	     !rom_terminating_file(file);				\
 	     (file) = rom_next_file(file))
 
+/**
+ * rom_find_files - find ROM files with the given name, if they exist
+ * @file: &struct rom_file to use as a ROM file match cursor
+ * @dir: &struct rom_dir with ROM directory to search in
+ * @filename: file name to look for
+ *
+ * The statement following the macro is executed for ROM files having the
+ * given name.
+ */
+#define rom_find_files(file, dir, filename)				\
+	rom_for_each_file((file), (dir))				\
+		if (strcmp((file).name, filename) != 0) continue; else
+
 bool rom_empty_dir(const struct rom_dir dir);
 
 bool rom_terminating_file(const struct rom_file file);
-- 
2.21.0

