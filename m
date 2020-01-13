Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 391E0138EC7
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 11:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgAMKPY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 05:15:24 -0500
Received: from forward105p.mail.yandex.net ([77.88.28.108]:56124 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725992AbgAMKPY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 05:15:24 -0500
Received: from mxback6j.mail.yandex.net (mxback6j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10f])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id 0AE774D41389;
        Mon, 13 Jan 2020 13:15:21 +0300 (MSK)
Received: from myt4-ee976ce519ac.qloud-c.yandex.net (myt4-ee976ce519ac.qloud-c.yandex.net [2a02:6b8:c00:1da4:0:640:ee97:6ce5])
        by mxback6j.mail.yandex.net (mxback/Yandex) with ESMTP id sDXEVUDOTj-FK50ht9Q;
        Mon, 13 Jan 2020 13:15:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578910521;
        bh=SmZj3mYxPN02iCgwmcokvO3bplgROVcs4GPwKV2RwOE=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=h/SuUs9YevoVdhD5o6oTtoRlH9z9DsNQqIbJp9u+S0MYcq8QoDGW90dbl5QRnxdPY
         29r+GjuQkFw/SbXGMY5QdKCuXnIVDOORfnYl5MMgej/YFy7V1zf85FJCZN3VxeO5WO
         3+kSF6p31dCUEud3B+0aVxFGAPmSsNXLVsLwNtPo=
Authentication-Results: mxback6j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt4-ee976ce519ac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 2dzM4Y3ZVr-FGWK30Uk;
        Mon, 13 Jan 2020 13:15:19 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/3] MIPS: Make DIEI support as a config option
Date:   Mon, 13 Jan 2020 18:14:59 +0800
Message-Id: <20200113101501.37985-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DI(Disable Interrupt) and EI(Enable Interrupt) instructions is required by
MIPSR2/MIPSR6, however, it appears to be buggy on some processors such as
Loongson-3A1000. Thus we make it as a config option to allow disable it at
compile time with CPU_MIPSR2 selected.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                | 9 +++++++++
 arch/mips/include/asm/irqflags.h | 6 +++---
 arch/mips/lib/mips-atomic.c      | 4 ++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4b83507499f4..c3103f4eeafa 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2111,12 +2111,14 @@ config CPU_MIPSR2
 	bool
 	default y if CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_CAVIUM_OCTEON
 	select CPU_HAS_RIXI
+	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
 	select MIPS_SPRAM
 
 config CPU_MIPSR6
 	bool
 	default y if CPU_MIPS32_R6 || CPU_MIPS64_R6
 	select CPU_HAS_RIXI
+	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
 	select HAVE_ARCH_BITREVERSE
 	select MIPS_ASID_BITS_VARIABLE
 	select MIPS_CRC_SUPPORT
@@ -2579,6 +2581,13 @@ config XKS01
 config CPU_HAS_RIXI
 	bool
 
+config CPU_HAS_DIEI
+	depends on !CPU_DIEI_BROKEN
+	bool
+
+config CPU_DIEI_BROKEN
+	bool
+
 config CPU_HAS_LOAD_STORE_LR
 	bool
 	help
diff --git a/arch/mips/include/asm/irqflags.h b/arch/mips/include/asm/irqflags.h
index c4728bbdf15b..47a8ffc0b413 100644
--- a/arch/mips/include/asm/irqflags.h
+++ b/arch/mips/include/asm/irqflags.h
@@ -18,7 +18,7 @@
 #include <asm/compiler.h>
 #include <asm/hazards.h>
 
-#if defined(CONFIG_CPU_MIPSR2) || defined (CONFIG_CPU_MIPSR6)
+#if defined(CONFIG_CPU_HAS_DIEI)
 
 static inline void arch_local_irq_disable(void)
 {
@@ -94,7 +94,7 @@ static inline void arch_local_irq_restore(unsigned long flags)
 void arch_local_irq_disable(void);
 unsigned long arch_local_irq_save(void);
 void arch_local_irq_restore(unsigned long flags);
-#endif /* CONFIG_CPU_MIPSR2 || CONFIG_CPU_MIPSR6 */
+#endif /* CONFIG_CPU_HAS_DIEI */
 
 static inline void arch_local_irq_enable(void)
 {
@@ -102,7 +102,7 @@ static inline void arch_local_irq_enable(void)
 	"	.set	push						\n"
 	"	.set	reorder						\n"
 	"	.set	noat						\n"
-#if   defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
+#if defined(CONFIG_CPU_HAS_DIEI)
 	"	ei							\n"
 #else
 	"	mfc0	$1,$12						\n"
diff --git a/arch/mips/lib/mips-atomic.c b/arch/mips/lib/mips-atomic.c
index 5530070e0d05..de03838b343b 100644
--- a/arch/mips/lib/mips-atomic.c
+++ b/arch/mips/lib/mips-atomic.c
@@ -15,7 +15,7 @@
 #include <linux/export.h>
 #include <linux/stringify.h>
 
-#if !defined(CONFIG_CPU_MIPSR2) && !defined(CONFIG_CPU_MIPSR6)
+#if !defined(CONFIG_CPU_HAS_DIEI)
 
 /*
  * For cli() we have to insert nops to make sure that the new value
@@ -110,4 +110,4 @@ notrace void arch_local_irq_restore(unsigned long flags)
 }
 EXPORT_SYMBOL(arch_local_irq_restore);
 
-#endif /* !CONFIG_CPU_MIPSR2 && !CONFIG_CPU_MIPSR6 */
+#endif /* !CONFIG_CPU_HAS_DIEI */
-- 
2.24.1

