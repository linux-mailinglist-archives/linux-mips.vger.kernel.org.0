Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FFCA4A87
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbfIAQXE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:23:04 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:59672 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbfIAQXE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:23:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 66EC83F752
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:23:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id odAujYT3b6KQ for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:23:01 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id A88653F393
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:23:01 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:23:01 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 087/120] MIPS: PS2: GS: Compute block count and indices
Message-ID: <afe499daf7605ced1373efafbc9c28a035d646df.1567326213.git.noring@nocrew.org>
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

The GS frame buffer is subdivided into rectangular pages, from left to
right, top to bottom. Pages are further subdivided into blocks, with
different arrangements for the PSMCT16 and PSMCT32 pixel storage modes.
Blocks are further subdivided into columns that are finally subdivided
into pixels[1].

References:

[1] "GS User's Manual", version 6.0, Sony Computer Entertainment Inc.,
    pp. 161-175.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/include/asm/mach-ps2/gs.h |  8 +++
 drivers/ps2/gs.c                    | 94 +++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/arch/mips/include/asm/mach-ps2/gs.h b/arch/mips/include/asm/mach-ps2/gs.h
index 9cb1b909ae9b..5429f52a4518 100644
--- a/arch/mips/include/asm/mach-ps2/gs.h
+++ b/arch/mips/include/asm/mach-ps2/gs.h
@@ -38,6 +38,14 @@ u32 gs_video_clock(const u32 t1248, const u32 lc, const u32 rc);
 
 u32 gs_video_clock_for_smode1(const struct gs_smode1 smode1);
 
+u32 gs_psm_ct16_block_count(const u32 fbw, const u32 fbh);
+
+u32 gs_psm_ct32_block_count(const u32 fbw, const u32 fbh);
+
+u32 gs_psm_ct32_block_address(const u32 fbw, const u32 block_index);
+
+u32 gs_psm_ct16_block_address(const u32 fbw, const u32 block_index);
+
 struct gs_synch_gen gs_synch_gen_for_vck(const u32 vck);
 
 u32 gs_rfsh_from_synch_gen(const struct gs_synch_gen sg);
diff --git a/drivers/ps2/gs.c b/drivers/ps2/gs.c
index 00bb36304ee6..a3cd1a6adfb7 100644
--- a/drivers/ps2/gs.c
+++ b/drivers/ps2/gs.c
@@ -48,6 +48,100 @@ u32 gs_video_clock_for_smode1(const struct gs_smode1 smode1)
 }
 EXPORT_SYMBOL_GPL(gs_video_clock_for_smode1);
 
+/**
+ * gs_psm_ct16_block_count - number of blocks for 16-bit pixel storage
+ * @fbw: buffer width/64
+ * @fbh: buffer height
+ *
+ * Return: number of blocks for 16-bit pixel storage of given width and height
+ */
+u32 gs_psm_ct16_block_count(const u32 fbw, const u32 fbh)
+{
+	const u32 block_cols = fbw * GS_PSM_CT16_PAGE_COLS;
+	const u32 block_rows = (fbh + GS_PSM_CT16_BLOCK_HEIGHT - 1) /
+		GS_PSM_CT16_BLOCK_HEIGHT;
+
+	return block_cols * block_rows;
+}
+EXPORT_SYMBOL_GPL(gs_psm_ct16_block_count);
+
+/**
+ * gs_psm_ct32_block_count - number of blocks for 32-bit pixel storage
+ * @fbw: buffer width/64
+ * @fbh: buffer height
+ *
+ * Return: number of blocks for 32-bit pixel storage of given width and height
+ */
+u32 gs_psm_ct32_block_count(const u32 fbw, const u32 fbh)
+{
+	const u32 block_cols = fbw * GS_PSM_CT32_PAGE_COLS;
+	const u32 block_rows = (fbh + GS_PSM_CT32_BLOCK_HEIGHT - 1) /
+		GS_PSM_CT32_BLOCK_HEIGHT;
+
+	return block_cols * block_rows;
+}
+EXPORT_SYMBOL_GPL(gs_psm_ct32_block_count);
+
+/**
+ * gs_psm_ct16_block_address - 16-bit block address given a block index
+ * @fbw: buffer width/64
+ * @block_index: block index starting at the top left corner
+ *
+ * Return: block address for a given block index
+ */
+u32 gs_psm_ct16_block_address(const u32 fbw, const u32 block_index)
+{
+	static const u32 block[GS_PSM_CT16_PAGE_ROWS][GS_PSM_CT16_PAGE_COLS] = {
+		{  0,  2,  8, 10 },
+		{  1,  3,  9, 11 },
+		{  4,  6, 12, 14 },
+		{  5,  7, 13, 15 },
+		{ 16, 18, 24, 26 },
+		{ 17, 19, 25, 27 },
+		{ 20, 22, 28, 30 },
+		{ 21, 23, 29, 31 }
+	};
+
+	const u32 fw = GS_PSM_CT16_PAGE_COLS * fbw;
+	const u32 fc = block_index % fw;
+	const u32 fr = block_index / fw;
+	const u32 bc = fc % GS_PSM_CT16_PAGE_COLS;
+	const u32 br = fr % GS_PSM_CT16_PAGE_ROWS;
+	const u32 pc = fc / GS_PSM_CT16_PAGE_COLS;
+	const u32 pr = fr / GS_PSM_CT16_PAGE_ROWS;
+
+	return GS_BLOCKS_PER_PAGE * (fbw * pr + pc) + block[br][bc];
+}
+EXPORT_SYMBOL_GPL(gs_psm_ct16_block_address);
+
+/**
+ * gs_psm_ct32_block_address - 32-bit block address given a block index
+ * @fbw: buffer width/64
+ * @block_index: block index starting at the top left corner
+ *
+ * Return: block address for a given block index
+ */
+u32 gs_psm_ct32_block_address(const u32 fbw, const u32 block_index)
+{
+	static const u32 block[GS_PSM_CT32_PAGE_ROWS][GS_PSM_CT32_PAGE_COLS] = {
+		{  0,  1,  4,  5, 16, 17, 20, 21 },
+		{  2,  3,  6,  7, 18, 19, 22, 23 },
+		{  8,  9, 12, 13, 24, 25, 28, 29 },
+		{ 10, 11, 14, 15, 26, 27, 30, 31 }
+	};
+
+	const u32 fw = GS_PSM_CT32_PAGE_COLS * fbw;
+	const u32 fc = block_index % fw;
+	const u32 fr = block_index / fw;
+	const u32 bc = fc % GS_PSM_CT32_PAGE_COLS;
+	const u32 br = fr % GS_PSM_CT32_PAGE_ROWS;
+	const u32 pc = fc / GS_PSM_CT32_PAGE_COLS;
+	const u32 pr = fr / GS_PSM_CT32_PAGE_ROWS;
+
+	return GS_BLOCKS_PER_PAGE * (fbw * pr + pc) + block[br][bc];
+}
+EXPORT_SYMBOL_GPL(gs_psm_ct32_block_address);
+
 static u32 div_round_ps(u32 a, u32 b)
 {
 	return DIV_ROUND_CLOSEST_ULL(a * 1000000000000ll, b);
-- 
2.21.0

