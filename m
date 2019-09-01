Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95D5AA4A63
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbfIAQKm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:10:42 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:58412 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfIAQKm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:10:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A76E23F73E;
        Sun,  1 Sep 2019 18:10:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yzvVOPONVFVy; Sun,  1 Sep 2019 18:10:40 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 671063F752;
        Sun,  1 Sep 2019 18:10:39 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:10:39 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 066/120] FIXME: Export _dma_cache_{wback,wback_inv,inv}
Message-ID: <dc3929c899b9fa3eaada3c67493369ae515346fb.1567326213.git.noring@nocrew.org>
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

Commit e58cfbfb32d1 ("MIPS: remove the _dma_cache_wback_inv export")
removes EXPORT_SYMBOL(_dma_cache_wback_inv) but what are the acceptable
alternatives? Streaming DMA mappings?

dma_cache_wback_inv() and dma_cache_inv() are used in subsequent changes,
but I suppose these must be changed to something appropriate. The current
DMA handling is very simple, although the hardware is quite capable (for
example, with scatter-gather lists, chaining and so on).

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/mm/cache.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 33b409391ddb..a01923b30086 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -62,6 +62,10 @@ void (*_dma_cache_wback_inv)(unsigned long start, unsigned long size);
 void (*_dma_cache_wback)(unsigned long start, unsigned long size);
 void (*_dma_cache_inv)(unsigned long start, unsigned long size);
 
+EXPORT_SYMBOL(_dma_cache_wback_inv);
+EXPORT_SYMBOL(_dma_cache_wback);
+EXPORT_SYMBOL(_dma_cache_inv);
+
 #endif /* CONFIG_DMA_NONCOHERENT */
 
 /*
-- 
2.21.0

