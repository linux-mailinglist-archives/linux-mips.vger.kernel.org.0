Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E13933FE7E
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 06:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhCRE7o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 00:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCRE7j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 00:59:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9432EC06174A;
        Wed, 17 Mar 2021 21:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=mqH6KDuSstLwS39mT0ePczEWX69vnztcqDBkxHzfniM=; b=XBg+7ubmm0t37QrQPz2c/WBvY8
        dtC3YDhxAjwUy5cpxnsuc7SSgT2hSLYEPvDEojx3Tu9mcNdlsPGRRKAG2Tbh6jwi43kGQuQdkFVrf
        WY+HgMNS+eg1fSCzaFR0We3k2NYO1O0rjRgFE+xXDAHiUH+5U+3QchcrRtvl/teL5iBosG83fzId1
        XpnaIH/FG+me/vASAybRjn/xx98rhf8RnRJLIKEIEZS5pmNb+2bS0TvfQvwLuhO4nO7RIKbq1vDfO
        BdEkIYSSJMqaM6ClR+wYqkb3IF3hYlVaURNyWrZlUIyhSktoDyaacNTD4I+eu9iJ1Wrd2PfjQJaGh
        0F8gRMlg==;
Received: from [2001:4bb8:18c:bb3:e1cf:ad2f:7ff7:7a0b] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMkjp-002ZH2-Nk; Thu, 18 Mar 2021 04:58:28 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/10] MIPS: disable CONFIG_IDE in rbtx49xx_defconfig
Date:   Thu, 18 Mar 2021 05:57:02 +0100
Message-Id: <20210318045706.200458-7-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

rbtx49xx_defconfig enables CONFIG_IDE for the tx4938 and tx4939 ide
drivers, but those aren't actually used by the last known remaining user:

https://lore.kernel.org/lkml/20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp/

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/configs/rbtx49xx_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
index 5e389db35fa746..69f2300107f961 100644
--- a/arch/mips/configs/rbtx49xx_defconfig
+++ b/arch/mips/configs/rbtx49xx_defconfig
@@ -44,9 +44,6 @@ CONFIG_MTD_NAND_TXX9NDFMC=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDE_TX4938=y
-CONFIG_BLK_DEV_IDE_TX4939=y
 CONFIG_NETDEVICES=y
 CONFIG_NE2000=y
 CONFIG_SMC91X=y
-- 
2.30.1

