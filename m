Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62774316800
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 14:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhBJN2k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 08:28:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbhBJN2h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 08:28:37 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B893C06174A
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 05:27:56 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id TRTt2400Q4C55Sk01RTtix; Wed, 10 Feb 2021 14:27:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l9pX7-005H6v-5T; Wed, 10 Feb 2021 14:27:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l9pX6-005y2T-H5; Wed, 10 Feb 2021 14:27:52 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: PINCTRL_MICROCHIP_SGPIO should depend on ARCH_SPARX5 || SOC_VCOREIII
Date:   Wed, 10 Feb 2021 14:27:51 +0100
Message-Id: <20210210132751.1422386-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

the Microsemi/Microchip Serial GPIO device is present only Microsemi
VCore III and Microchip Sparx5 SoCs.  Hence add a dependency on
ARCH_SPARX5 || SOC_VCOREIII, to prevent asking the user about this
driver when configuring a kernel without support for these SoCs.

Fixes: 7e5ea974e61c8dd0 ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 113073d5f89bbf70..3b75b1d7d3d1f1b0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -353,8 +353,8 @@ config PINCTRL_OCELOT
 
 config PINCTRL_MICROCHIP_SGPIO
 	bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
-	depends on OF
-	depends on HAS_IOMEM
+	depends on OF && HAS_IOMEM
+	depends on ARCH_SPARX5 || SOC_VCOREIII || COMPILE_TEST
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select GENERIC_PINCONF
-- 
2.25.1

