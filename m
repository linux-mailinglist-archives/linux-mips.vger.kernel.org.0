Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6659B33FE6D
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 05:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhCRE6l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 00:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhCRE62 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 00:58:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A498C06174A;
        Wed, 17 Mar 2021 21:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=XEzjoFaNLLzmVwwbnoy2Bul8yVzxins+1j9osZi/Pvo=; b=hNLYS6B20vnw5ApBEcCoV8gBs/
        U3iimCh4WdMAg+a8JX3jlBt/oK3auUbK9TlCE/iZq6tMxlcOHdWejcsrcI94trVU49pHWy7w68AM3
        2I4kmi5MFwcQ/vPp5fLI923OhE2qUxbJ/IpWZN9CYuuu3RP44KZPg7+HZUvZLGXKoom3c0fMABmlw
        EUrx6cqyd+PZsNsj5FuUSk6ilNDn6BdoeA3RleyBQdbSdXAwg0RmpWK606K3RdfWqMLeM+geVUBX0
        wUdrZbOn87+880UpFP/KuoSzihVYHUMUaP0lEF8L1LbenliEjDmcUqiC8+cyJ9ZuHR5khI9CXG+I2
        jHZgSDfQ==;
Received: from [2001:4bb8:18c:bb3:e1cf:ad2f:7ff7:7a0b] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMkj9-002ZDP-RC; Thu, 18 Mar 2021 04:57:46 +0000
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
Subject: [PATCH 03/10] ARM: disable CONFIG_IDE in pxa_defconfig
Date:   Thu, 18 Mar 2021 05:56:59 +0100
Message-Id: <20210318045706.200458-4-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

pxa_defconfig already enables libata including the pata_pcmcia driver, so
drop the legacy ide driver and idecs host driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/configs/pxa_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index bd7dd81c9c5441..c82b8a1d6e84f6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -215,8 +215,6 @@ CONFIG_IIO=m
 CONFIG_AD5446=m
 CONFIG_EEPROM_AT24=m
 CONFIG_SENSORS_LIS3_SPI=m
-CONFIG_IDE=m
-CONFIG_BLK_DEV_IDECS=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=m
 CONFIG_CHR_DEV_ST=m
-- 
2.30.1

