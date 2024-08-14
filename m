Return-Path: <linux-mips+bounces-4895-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241149518E8
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 12:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4EDC282B0B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2024 10:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F331AE841;
	Wed, 14 Aug 2024 10:36:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF771AD9ED
	for <linux-mips@vger.kernel.org>; Wed, 14 Aug 2024 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631760; cv=none; b=Yg1MYWV4xekPp2+MwnC9u4/gqGUVJGrPgiThJI3g8nY8vORmtP8a7vR3nf09DO0j4HTuha36TvU0IRWVvJODXb/1+TBFpMAeBtpbf0j0g+DwfadSZc9eSTfsgoNDLowVzTmxQ/tw+3WeYDYNz+Q2egu7/kxVHR/INI6Tw/A/1CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631760; c=relaxed/simple;
	bh=ZAclk7V+Jf5ylAAVV2zBI3JOc3K4A7oQgMm1geLPWnw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KTNfJnvLBrpZlWdkUm1YP0albrULlMh5LGtEF83lXW035LJyEYrSvObQGiJo+DXFbhaG61xl0NaEn56Sg6GjyYyVGaIevyDoaGmxnGqB2TcMBqNeUHS4LCrl7xYwE2/gZX6x3nGNa/MnO35Az06nwIExh44TWx1rUI+XC7+PWcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WkPgD410zzQpk9;
	Wed, 14 Aug 2024 18:31:20 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id E8DD4180105;
	Wed, 14 Aug 2024 18:35:54 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 14 Aug 2024 18:35:54 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <tsbogend@alpha.franken.de>, <cuigaosheng1@huawei.com>,
	<rdunlap@infradead.org>, <bhelgaas@google.com>
CC: <linux-mips@vger.kernel.org>
Subject: [PATCH -next] MIPS: Remove unused function dump_au1000_dma_channel() in dma.c
Date: Wed, 14 Aug 2024 18:35:53 +0800
Message-ID: <20240814103553.2053235-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The dump_au1000_dma_channel() has not been used since
commit d56b9b9c464a ("[PATCH] The scheduled removal of some OSS
drivers"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/mips/alchemy/common/dma.c                | 23 -------------------
 .../mips/include/asm/mach-au1x00/au1000_dma.h |  1 -
 2 files changed, 24 deletions(-)

diff --git a/arch/mips/alchemy/common/dma.c b/arch/mips/alchemy/common/dma.c
index 973049b5bd61..44d8433b1f45 100644
--- a/arch/mips/alchemy/common/dma.c
+++ b/arch/mips/alchemy/common/dma.c
@@ -131,29 +131,6 @@ static const struct dma_dev dma_dev_table_bank2[DMA_NUM_DEV_BANK2] = {
 	{ AU1100_SD1_PHYS_ADDR + 0x04, DMA_DS | DMA_DW8 | DMA_DR }	/* coherent */
 };
 
-void dump_au1000_dma_channel(unsigned int dmanr)
-{
-	struct dma_chan *chan;
-
-	if (dmanr >= NUM_AU1000_DMA_CHANNELS)
-		return;
-	chan = &au1000_dma_table[dmanr];
-
-	printk(KERN_INFO "Au1000 DMA%d Register Dump:\n", dmanr);
-	printk(KERN_INFO "  mode = 0x%08x\n",
-	       __raw_readl(chan->io + DMA_MODE_SET));
-	printk(KERN_INFO "  addr = 0x%08x\n",
-	       __raw_readl(chan->io + DMA_PERIPHERAL_ADDR));
-	printk(KERN_INFO "  start0 = 0x%08x\n",
-	       __raw_readl(chan->io + DMA_BUFFER0_START));
-	printk(KERN_INFO "  start1 = 0x%08x\n",
-	       __raw_readl(chan->io + DMA_BUFFER1_START));
-	printk(KERN_INFO "  count0 = 0x%08x\n",
-	       __raw_readl(chan->io + DMA_BUFFER0_COUNT));
-	printk(KERN_INFO "  count1 = 0x%08x\n",
-	       __raw_readl(chan->io + DMA_BUFFER1_COUNT));
-}
-
 /*
  * Finds a free channel, and binds the requested device to it.
  * Returns the allocated channel number, or negative on error.
diff --git a/arch/mips/include/asm/mach-au1x00/au1000_dma.h b/arch/mips/include/asm/mach-au1x00/au1000_dma.h
index b82e513c8523..18c24051a1f2 100644
--- a/arch/mips/include/asm/mach-au1x00/au1000_dma.h
+++ b/arch/mips/include/asm/mach-au1x00/au1000_dma.h
@@ -124,7 +124,6 @@ extern int request_au1000_dma(int dev_id,
 extern void free_au1000_dma(unsigned int dmanr);
 extern int au1000_dma_read_proc(char *buf, char **start, off_t fpos,
 				int length, int *eof, void *data);
-extern void dump_au1000_dma_channel(unsigned int dmanr);
 extern spinlock_t au1000_dma_spin_lock;
 
 static inline struct dma_chan *get_dma_chan(unsigned int dmanr)
-- 
2.25.1


