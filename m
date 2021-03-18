Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19A133FE98
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 06:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhCRFCy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 01:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCRFC3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 01:02:29 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90A9C06174A;
        Wed, 17 Mar 2021 22:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=ZwLwotB3kh/Ng3fVpJhH1YpMv+tnI82qlLtcss1Rdic=; b=Gz4KcM7fijZ9HnYE/1O9zLpm23
        FLRIlhRapQ3L6mImDyYDqogBRO1xih/55s5q8yrkAkUTIeCmS86c+NxO4lhmDFvK9KjHnXtkO68Ig
        xqNhSHQSIzlI/oCcjiizOUaosVV6iMLxCr9guT4ETAKBEFz/vuNYcJ1iNtADBtlzZ8WV0CAYsN+lI
        eWplMrkTksgJ4TabNxfYRosgEmWvMPDRVrT3lZTlZqDvLz416mPMUaz4FipJMmnokO0TuR+wPC5Jb
        MU6MLo1F0xIN2GGlunb1lcUcQVIxF6a2e/1SB1KjOa3c6kc2dd/FKiQhKpUPj2VA79iQ7B2xAyXef
        1ldvEoGg==;
Received: from 089144199244.atnat0008.highway.a1.net ([89.144.199.244] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMkn8-002ZYN-0v; Thu, 18 Mar 2021 05:01:53 +0000
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
Subject: [PATCH 09/10] m68k: use libata instead of the legacy ide driver
Date:   Thu, 18 Mar 2021 05:57:05 +0100
Message-Id: <20210318045706.200458-10-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Switch the m68 defconfigs from the deprecated ide subsystem to use libata
instead.  The gayle and buddha and falcon drivers are enabled for libata,
while support for the q40 and macide drivers is lost.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/m68k/configs/amiga_defconfig | 10 +++++-----
 arch/m68k/configs/atari_defconfig |  8 ++++----
 arch/m68k/configs/mac_defconfig   |  5 -----
 arch/m68k/configs/multi_defconfig | 15 ++++++---------
 arch/m68k/configs/q40_defconfig   |  4 ----
 5 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 786656090c5029..fba7275de0fb5f 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -323,11 +323,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_GAYLE=y
-CONFIG_BLK_DEV_BUDDHA=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
@@ -344,6 +339,11 @@ CONFIG_GVP11_SCSI=y
 CONFIG_SCSI_A4000T=y
 CONFIG_SCSI_ZORRO7XX=y
 CONFIG_SCSI_ZORRO_ESP=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_GAYLE=y
+CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 413232626d9d57..235d038be94444 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -324,10 +324,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_FALCON_IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
@@ -339,6 +335,10 @@ CONFIG_SCSI_SAS_ATTRS=m
 CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_ATARI_SCSI=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_FALCON=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index bf15e6c1c939bb..cc92cc4601cb1f 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -315,11 +315,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_PLATFORM=y
-CONFIG_BLK_DEV_MAC_IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 5466d48fcd9d51..9be9f2ad4ddb84 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -344,15 +344,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_PLATFORM=y
-CONFIG_BLK_DEV_GAYLE=y
-CONFIG_BLK_DEV_BUDDHA=y
-CONFIG_BLK_DEV_FALCON_IDE=y
-CONFIG_BLK_DEV_MAC_IDE=y
-CONFIG_BLK_DEV_Q40IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
@@ -376,6 +367,12 @@ CONFIG_MVME147_SCSI=y
 CONFIG_MVME16x_SCSI=y
 CONFIG_BVME6000_SCSI=y
 CONFIG_SUN3X_ESP=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_ATA_BMDMA is not set
+CONFIG_PATA_FALCON=y
+CONFIG_PATA_GAYLE=y
+CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
 CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 3ae421cb24a439..ac35e448b1c58f 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -314,10 +314,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_CDROM_PKTCDVD=m
 CONFIG_ATA_OVER_ETH=m
 CONFIG_DUMMY_IRQ=m
-CONFIG_IDE=y
-CONFIG_IDE_GD_ATAPI=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_Q40IDE=y
 CONFIG_RAID_ATTRS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
-- 
2.30.1

