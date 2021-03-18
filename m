Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C6533FE8A
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 06:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhCRFAQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 01:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCRE7w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 00:59:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0C9C06174A;
        Wed, 17 Mar 2021 21:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=D+S8wlSiI4RJjZ5iJm2sxYRqVVY2Unydlyni8O7HV7o=; b=pzJ0Yf2lHvDqADXeBYbA1uMzpD
        I6mDgP2SEN/7rGW4D7M0Ki28esLEuHEzgcaB+m4I0HZb9ICnfb8uKmfHkgbct9yI3HZpieLHqlQEh
        8ZbEn5zQGPKudyNhU8V8cHI31vqq6hKIZ1nqgkPeMR1uuWM6Oxoidcm4R8IxXu0YYrCico+vv8b0e
        k+rwed8gxoGnWEhv0Hg3mbM4FuSQJxw8Qo8gIeaBe+lgf/aXSBWdZLIDAFI/vcihYht+9pWlSAmEG
        4Th3oOBd6lEMeB1Lb+YDe+H2jNV89dT/d7RDozI5Gdo0MLhPGOE1hDuCpQQpdvquZpbflKIZbTYYf
        bGwozUuw==;
Received: from [2001:4bb8:18c:bb3:e1cf:ad2f:7ff7:7a0b] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMkk1-002ZIG-2u; Thu, 18 Mar 2021 04:58:40 +0000
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
Subject: [PATCH 07/10] MIPS: disable CONFIG_IDE in bigsur_defconfig
Date:   Thu, 18 Mar 2021 05:57:03 +0100
Message-Id: <20210318045706.200458-8-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

bigsur_defconfig enables CONFIG_IDE for the tc86c001 ide driver, which
is a Toshiba plug in card that does not make much sense to use on bigsur
platforms.  For all other ATA cards libata support is already enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/configs/bigsur_defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/configs/bigsur_defconfig b/arch/mips/configs/bigsur_defconfig
index eea9b613bb7402..d83e7d600b0a56 100644
--- a/arch/mips/configs/bigsur_defconfig
+++ b/arch/mips/configs/bigsur_defconfig
@@ -105,10 +105,6 @@ CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_BLK_DEV_NBD=m
 CONFIG_EEPROM_LEGACY=y
 CONFIG_EEPROM_MAX6875=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_IDETAPE=y
-CONFIG_BLK_DEV_TC86C001=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=y
 CONFIG_BLK_DEV_SR=y
-- 
2.30.1

