Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E111C887E
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 13:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgEGLkT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 07:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgEGLkT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 07:40:19 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778B9C05BD43
        for <linux-mips@vger.kernel.org>; Thu,  7 May 2020 04:40:18 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6572:4a1f:d283:9ae8])
        by michel.telenet-ops.be with bizsmtp
        id bngG2200E3ZRV0X06ngGdk; Thu, 07 May 2020 13:40:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWesy-0007KV-Iw; Thu, 07 May 2020 13:40:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jWesy-0006NG-Gt; Thu, 07 May 2020 13:40:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: ocelot: Add platform dependency
Date:   Thu,  7 May 2020 13:40:15 +0200
Message-Id: <20200507114015.24461-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Microsemi Ocelot pin controller is only present on Microsemi Ocelot
and Jaguar2 SoCs.  Add a platform dependency to the PINCTRL_OCELOT
config symbol, to avoid asking the user about it when configuring a
kernel without Ocelot or Jaguar2 support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index f0ce4ce3e0f52456..bed67c08a0892240 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -394,8 +394,8 @@ config PINCTRL_RK805
 
 config PINCTRL_OCELOT
 	bool "Pinctrl driver for the Microsemi Ocelot and Jaguar2 SoCs"
-	depends on OF
-	depends on HAS_IOMEM
+	depends on OF && HAS_IOMEM
+	depends on MSCC_OCELOT || COMPILE_TEST
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select GENERIC_PINCONF
-- 
2.17.1

