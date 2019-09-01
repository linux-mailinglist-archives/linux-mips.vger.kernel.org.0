Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E709A4AAB
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 18:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfIAQgh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 12:36:37 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:33614 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728764AbfIAQgh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 12:36:37 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3A1BC3FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:36:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8EQrpcWt9muu for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 18:36:35 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8BA313F52B
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 18:36:35 +0200 (CEST)
Date:   Sun, 1 Sep 2019 18:36:35 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 119/120] MIPS: PS2: Initial support for the Sony PlayStation 2
Message-ID: <eb5e9ca1a172732d94d74d608b3bbbf196ffeb34.1567326213.git.noring@nocrew.org>
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

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/Kconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 88d6c13260e1..f90af3fd31d3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1011,6 +1011,27 @@ config MIPS_PARAVIRT
 	help
 	  This option supports guest running under ????
 
+config SONY_PS2
+	bool "Sony PlayStation 2"
+	select BOOT_ELF32
+	select CEVT_R4K
+	select CSRC_R4K
+	select DMA_NONCOHERENT
+	select HARDIRQS_SW_RESEND
+	select HAVE_PATA_PLATFORM
+	select IRQ_MIPS_CPU
+	select MIPS_L1_CACHE_SHIFT_6
+	select NO_IOPORT
+	select SYS_HAS_CPU_R5900
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_ZBOOT
+	select USB_ARCH_HAS_OHCI
+	select USB_OHCI_LITTLE_ENDIAN
+	help
+	  This enables support for the Sony PlayStation 2.
+
 endchoice
 
 source "arch/mips/alchemy/Kconfig"
@@ -1037,6 +1058,7 @@ source "arch/mips/loongson32/Kconfig"
 source "arch/mips/loongson64/Kconfig"
 source "arch/mips/netlogic/Kconfig"
 source "arch/mips/paravirt/Kconfig"
+source "arch/mips/ps2/Kconfig"
 
 endmenu
 
-- 
2.21.0

