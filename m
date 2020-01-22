Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9507E145347
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 11:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbgAVK7n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 05:59:43 -0500
Received: from mail.dlink.ru ([178.170.168.18]:55022 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgAVK7m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 05:59:42 -0500
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id 324241B217CB; Wed, 22 Jan 2020 13:59:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 324241B217CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1579690780; bh=ZEJs7Ofvumd4HgCuDKzNlbT1obTfsLuvRcS9WcKspuA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WQCLpI/wNeTHSbQbLwvlWZFRrOinAJXEaWoVXHlEHqj0dt/HAqg3mnLUDQ5rucnVr
         BwcemHfcr1UetiFa8Gm+H5GZX0ISiixoPxcGAfiC+bdxXV/UgLfSMn4IQ4LVcPX9BJ
         wd8yP2dGoYTH0uy5Z/HxqmoFrNPeIkf/iZ/AjDsI=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,URIBL_BLOCKED,
        USER_IN_WHITELIST autolearn=disabled version=3.4.2
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 472F21B2130C;
        Wed, 22 Jan 2020 13:59:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 472F21B2130C
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTP id 325901B217F1;
        Wed, 22 Jan 2020 13:59:20 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA;
        Wed, 22 Jan 2020 13:59:20 +0300 (MSK)
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Michal Simek <michal.simek@xilinx.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH mips-next 1/5] MIPS: don't explicitly select LIBFDT in Kconfig
Date:   Wed, 22 Jan 2020 13:58:48 +0300
Message-Id: <20200122105852.8788-2-alobakin@dlink.ru>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122105852.8788-1-alobakin@dlink.ru>
References: <20200122105852.8788-1-alobakin@dlink.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It gets selected anyway through USE_OF -> OF_EARLY_FLATTREE ->
OF_FLATTREE -> LIBFDT, no need to double-check.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 arch/mips/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4b83507499f4..b937a883b029 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -111,7 +111,6 @@ config MIPS_GENERIC
 	select DMA_PERDEV_COHERENT
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
-	select LIBFDT
 	select MIPS_AUTO_PFN_OFFSET
 	select MIPS_CPU_SCACHE
 	select MIPS_GIC
@@ -404,7 +403,6 @@ config MACH_INGENIC
 	select GENERIC_IRQ_CHIP
 	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
 	select USE_OF
-	select LIBFDT
 
 config LANTIQ
 	bool "Lantiq based platforms"
@@ -511,7 +509,6 @@ config MACH_PISTACHIO
 	select DMA_NONCOHERENT
 	select GPIOLIB
 	select IRQ_MIPS_CPU
-	select LIBFDT
 	select MFD_SYSCON
 	select MIPS_CPU_SCACHE
 	select MIPS_GIC
@@ -549,7 +546,6 @@ config MIPS_MALTA
 	select I8253
 	select I8259
 	select IRQ_MIPS_CPU
-	select LIBFDT
 	select MIPS_BONITO64
 	select MIPS_CPU_SCACHE
 	select MIPS_GIC
@@ -981,7 +977,6 @@ config CAVIUM_OCTEON_SOC
 	select ZONE_DMA32
 	select HOLES_IN_ZONE
 	select GPIOLIB
-	select LIBFDT
 	select USE_OF
 	select ARCH_SPARSEMEM_ENABLE
 	select SYS_SUPPORTS_SMP
-- 
2.25.0

