Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C8939FA69
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 17:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhFHP0O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 11:26:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:46362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232000AbhFHP0C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 11:26:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8845461285;
        Tue,  8 Jun 2021 15:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623165849;
        bh=ELZCBk9k9CjOt6JF1iTN+mUu2Bg/5DcQP0fFqbodGNY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TlBiZm/gJ1ShFMmHANGZbT+zZ1liz8j5kWd/hC6Avp3nmFRmG60FOLETd0qmhjLAy
         2TcOce8KBvsOwKpZnFGRXlo3iFuC84KXhuqC+9Um7TEPItBwzIStJYANReBSc8EAOf
         UvaEQGBh07RbHqYfGjDCUZOWKldPWNKzMQqywLLhL2IiWqQIZmHfBaMnAPFCwBkfv4
         PqEqP+EYEI74M6m3/f6RMeAhlgDQA0GqIpG80X6A74TKpQuE7M+T+A7tzv7QnIeL9O
         b/WNOSbvchpkbFuTNvhQFttYe/PH3iogBIVvpOA1wMECyksX6L+xGvbMhN1OcYRCme
         jlMfd2T/wTKCw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] mips: ar7: convert to clkdev_lookup
Date:   Tue,  8 Jun 2021 17:22:08 +0200
Message-Id: <20210608152214.1231666-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210608152214.1231666-1-arnd@kernel.org>
References: <20210608152214.1231666-1-arnd@kernel.org>
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
 arch/mips/ar7/clock.c | 31 +++++++++++--------------------
 2 files changed, 12 insertions(+), 20 deletions(-)

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
index 95def949c971..e8648e3eb27b 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -13,6 +13,7 @@
 #include <linux/gcd.h>
 #include <linux/io.h>
 #include <linux/err.h>
+#include <linux/clkdev.h>
 #include <linux/clk.h>
 
 #include <asm/addrspace.h>
@@ -424,27 +425,15 @@ unsigned long clk_get_rate(struct clk *clk)
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
@@ -462,6 +451,8 @@ void __init ar7_init_clocks(void)
 	}
 	/* adjust vbus clock rate */
 	vbus_clk.rate = bus_clk.rate / 2;
+
+	clkdev_add_table(ar7_clkdev_table, ARRAY_SIZE(ar7_clkdev_table));
 }
 
 /* dummy functions, should not be called */
-- 
2.29.2

