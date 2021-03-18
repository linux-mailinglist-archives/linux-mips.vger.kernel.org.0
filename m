Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCE533FE8C
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 06:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhCRFAR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 01:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhCRFAN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 01:00:13 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571B6C06174A;
        Wed, 17 Mar 2021 22:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=+nlm279ylA5Av6DETMBos1RXabjczdpECnt3hiQJvZw=; b=ANHvQI4KxYoaApzwlvQSBMTCk7
        3OYutmcg+lJh5H8kXsn8/neUqT/z8/2CNM82ZKJ31TSj6XcNA3WDJI7ExWvcJ2LHE1O2hrNyg/TgA
        BTHnGkvkU7VTBvt7G3sWB3hroM6qKXfvCLsOp3dz6FOGKOV+4v9ioq6WGotQo4Rgi14fbssLpC87H
        yHZJDIBrypvHfnYpCpB5IvDJIblOipSQsWP4GfuOx/bmxat4IGvgwaXA+RD9njBrxHQ5+2sZPrXU2
        6f0S0z1ppLOpYf0cQjLRmtF5T5ob+YY39FR20C8tkjisYerK6eoM5VxlESMaN9dUevpycm+fsD1EH
        SeXneIoA==;
Received: from [2001:4bb8:18c:bb3:e1cf:ad2f:7ff7:7a0b] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMkkO-002ZJq-GS; Thu, 18 Mar 2021 04:59:10 +0000
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
Subject: [PATCH 08/10] MIPS: disable CONFIG_IDE in malta*_defconfig
Date:   Thu, 18 Mar 2021 05:57:04 +0100
Message-Id: <20210318045706.200458-9-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Various malta defconfigs enable CONFIG_IDE for the tc86c001 ide driver,
hich is a Toshiba plug in card that does not make much sense to use on
bigsur platforms.  For all other ATA cards libata support is already
enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/configs/malta_kvm_defconfig       | 3 ---
 arch/mips/configs/malta_kvm_guest_defconfig | 3 ---
 arch/mips/configs/maltaup_xpa_defconfig     | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 62b1969b4f55b9..b4f9f3d4bd5d34 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -239,9 +239,6 @@ CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_TC86C001=m
 CONFIG_RAID_ATTRS=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=m
diff --git a/arch/mips/configs/malta_kvm_guest_defconfig b/arch/mips/configs/malta_kvm_guest_defconfig
index 9185e0a0aa4551..4d415145d1163e 100644
--- a/arch/mips/configs/malta_kvm_guest_defconfig
+++ b/arch/mips/configs/malta_kvm_guest_defconfig
@@ -237,9 +237,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_VIRTIO_BLK=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_TC86C001=m
 CONFIG_RAID_ATTRS=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=m
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 636311d67a533c..cd536086dca4a4 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -237,9 +237,6 @@ CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_TC86C001=m
 CONFIG_RAID_ATTRS=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=m
-- 
2.30.1

