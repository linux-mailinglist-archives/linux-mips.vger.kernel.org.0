Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79DD3C43F2
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jul 2021 08:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhGLGOV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jul 2021 02:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhGLGOV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jul 2021 02:14:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE0AC0613DD;
        Sun, 11 Jul 2021 23:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=jTSpsfbeUBiXIkaUfKiy7vmPb51VTyDHzceMaIu2ymQ=; b=UXkAaONGpPUpgxf2/whJ2gbE9t
        B83f01b92QycwvpcKm64yxW2cKM7jwck0texO/19ot0/PNgSGIO1Kl5NuzzxDWgHVTS/88gRsqEAC
        j4+Mzo7xDhHg9zC3TGORuMSbvnaRpgbrg9ZlFJ95inWQvnOSTwz7E0aLZzvPlw/MIzz02ilJS1Qxk
        fteQgbkq5p6kpFbIEtFAc7OscrvI7jMgHhIPA6c0fqdfyQuyBODYq/40v88//XxbkpkX2kHp7UYyQ
        5ULujre0UbacgHOsIaSAq93vNgu5oxOSlPijZHoLRkB8jbakNMEXjvvl/hIMa7gcbHuWNbb2wsUD9
        sDtHXKeg==;
Received: from [2001:4bb8:184:8b7c:bd9:61b8:39ba:d78a] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m2p8a-00GwCG-LO; Mon, 12 Jul 2021 06:09:58 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/6] mmc: mmc_spi: replace flush_kernel_dcache_page with flush_dcache_page
Date:   Mon, 12 Jul 2021 08:09:24 +0200
Message-Id: <20210712060928.4161649-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210712060928.4161649-1-hch@lst.de>
References: <20210712060928.4161649-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Pages passed to block drivers can be mapped page cache pages, so we
must use flush_dcache_page here instead of the more limited
flush_kernel_dcache_page that is intended for highmem pages only.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mmc/host/mmc_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
index 65c65bb5737f..3d28a3d3001b 100644
--- a/drivers/mmc/host/mmc_spi.c
+++ b/drivers/mmc/host/mmc_spi.c
@@ -948,7 +948,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
 
 		/* discard mappings */
 		if (direction == DMA_FROM_DEVICE)
-			flush_kernel_dcache_page(sg_page(sg));
+			flush_dcache_page(sg_page(sg));
 		kunmap(sg_page(sg));
 		if (dma_dev)
 			dma_unmap_page(dma_dev, dma_addr, PAGE_SIZE, dir);
-- 
2.30.2

