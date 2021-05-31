Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0204339681E
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhEaSvG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:51:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:40002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230289AbhEaSvE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 14:51:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80F776135C;
        Mon, 31 May 2021 18:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622486964;
        bh=CjtccExGdEjqd7ZBav8OsgNzxL/PiG1ahhPgaXxezeE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oT4hnyqHfyVQDA94H5JilIJndUMJw1CcyPRPd4GSAdeKn/6T8pTrXExT7LJnZpmx2
         oa3JTalsLbCed2Me8y72B/7iPGyGC4Fj97Xawik57WshSMduUmKb9V4LPx+97so+qi
         fCdzYHxADfRMHb2+/Dj+paRWcoOkRSThhHzLriu+5MTb+gKG/pm0wKDLoC/7ZTmkd3
         kQlFlT6qr81CI01JAQs8iVXLMGZmDgxA8wwIgWm3+Y28kIt1tChrpNmBpY3+Q8FVJT
         r4jaeJXCeZfCaKrYJ8EwAaFZL66W4Zpqq4yPW2IIvtU+WqHbkRti9no379/s51Cs3V
         Ywb55LB+QgKtA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Subject: [PATCH 1/7] mips: ar7: convert to clkdev_lookup
Date:   Mon, 31 May 2021 20:47:43 +0200
Message-Id: <20210531184749.2475868-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531184749.2475868-1-arnd@kernel.org>
References: <20210531184749.2475868-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

ar7 is one of only two platforms that provide the clock interface but
implement a custom version of the clkdev_lookup code.

Change this to use the generic version instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig     |  1 +
 arch/mips/ar7/clock.c | 32 ++++++++++++--------------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed51970c08e7..1cc03a7652a9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -215,6 +215,7 @@ config AR7
 	select SYS_SUPPORTS_ZBOOT_UART16550
 	select GPIOLIB
 	select VLYNQ
+	select CLKDEV_LOOKUP
 	select HAVE_LEGACY_CLK
 	help
 	  Support for the Texas Instruments AR7 System-on-a-Chip
diff --git a/arch/mips/ar7/clock.c b/arch/mips/ar7/clock.c
index 95def949c971..c614f254f370 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2009 Florian Fainelli <florian@openwrt.org>
  */
 
+#include <linux/clkdev.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -14,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/clk.h>
+#include <linux/clkdev.h>
 
 #include <asm/addrspace.h>
 #include <asm/mach-ar7/ar7.h>
@@ -424,27 +426,15 @@ unsigned long clk_get_rate(struct clk *clk)
 }
 EXPORT_SYMBOL(clk_get_rate);
 
-struct clk *clk_get(struct device *dev, const char *id)
-{
-	if (!strcmp(id, "bus"))
-		return &bus_clk;
+static struct clk_lookup ar7_clkdev_table[] = {
+	CLKDEV_INIT(NULL, "bus", &bus_clk),
 	/* cpmac and vbus share the same rate */
-	if (!strcmp(id, "cpmac"))
-		return &vbus_clk;
-	if (!strcmp(id, "cpu"))
-		return &cpu_clk;
-	if (!strcmp(id, "dsp"))
-		return &dsp_clk;
-	if (!strcmp(id, "vbus"))
-		return &vbus_clk;
-	return ERR_PTR(-ENOENT);
-}
-EXPORT_SYMBOL(clk_get);
-
-void clk_put(struct clk *clk)
-{
-}
-EXPORT_SYMBOL(clk_put);
+	CLKDEV_INIT("cpmac.0", "cpmac", &vbus_clk),
+	CLKDEV_INIT("cpmac.1", "cpmac", &vbus_clk),
+	CLKDEV_INIT(NULL, "cpu", &cpu_clk),
+	CLKDEV_INIT(NULL, "dsp", &dsp_clk),
+	CLKDEV_INIT(NULL, "vbus", &vbus_clk),
+};
 
 void __init ar7_init_clocks(void)
 {
@@ -462,6 +452,8 @@ void __init ar7_init_clocks(void)
 	}
 	/* adjust vbus clock rate */
 	vbus_clk.rate = bus_clk.rate / 2;
+
+	clkdev_add_table(ar7_clkdev_table, ARRAY_SIZE(ar7_clkdev_table));
 }
 
 /* dummy functions, should not be called */
-- 
2.29.2

