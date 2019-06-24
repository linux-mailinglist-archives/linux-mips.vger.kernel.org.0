Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF6F451D1A
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbfFXV2M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:28:12 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:38598 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbfFXV2L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 17:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561411688; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=puJ99lwUGHhSpkDabEU3pkH3/u+/y3Vkk9IT4/u7QyA=;
        b=ATR+cDulZXVLVT+nsjoQuY+seoKtye7vjLsEJMM/pAh6TF3RPVpxJhNSL0jDEmOSsqkxcQ
        mhGHegRJ+4g4MGTLUzFPoSo2tgniMii/6ZfzqFrcTf27gx6odOf+O/FEVLMAVO869O9NSa
        mb4U1Ga+XiffGsp3XxvIZW/NzJhHJLM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] MAINTAINERS: Add myself as Ingenic SoCs maintainer
Date:   Mon, 24 Jun 2019 23:27:52 +0200
Message-Id: <20190624212752.6816-2-paul@crapouillou.net>
In-Reply-To: <20190624212752.6816-1-paul@crapouillou.net>
References: <20190624212752.6816-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add myself as the maintainer of the arch code, devicetree files and
drivers related to the JZ47xx family of SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 MAINTAINERS | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dfedde2f5720..3ee871404aba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7796,6 +7796,33 @@ M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
 S:	Maintained
 F:	drivers/dma/dma-jz4780.c
 
+INGENIC JZ47xx SoCs
+M:	Paul Cercueil <paul@crapouillou.net>
+S:	Maintained
+F:	arch/mips/boot/dts/ingenic/
+F:	arch/mips/include/asm/mach-jz4740/
+F:	arch/mips/jz4740/
+F:	drivers/clk/ingenic/
+F:	drivers/dma/dma-jz4780.c
+F:	drivers/gpu/drm/ingenic/
+F:	drivers/i2c/busses/i2c-jz4780.c
+F:	drivers/iio/adc/ingenic-adc.c
+F:	drivers/irqchip/irq-ingenic.c
+F:	drivers/memory/jz4780-nemc.c
+F:	drivers/mmc/host/jz4740_mmc.c
+F:	drivers/mtd/nand/raw/ingenic/
+F:	drivers/pinctrl/pinctrl-ingenic.c
+F:	drivers/power/supply/ingenic-battery.c
+F:	drivers/pwm/pwm-jz4740.c
+F:	drivers/rtc/rtc-jz4740.c
+F:	drivers/tty/serial/8250/8250_ingenic.c
+F:	drivers/usb/musb/jz4740.c
+F:	drivers/watchdog/jz4740_wdt.c
+F:	include/dt-bindings/iio/adc/ingenic,adc.h
+F:	include/linux/mfd/ingenic-tcu.h
+F:	sound/soc/jz4740/
+F:	sound/soc/codecs/jz47*
+
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.21.0.593.g511ec345e18

