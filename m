Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA051A68C7
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731026AbgDMP2H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:28:07 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40438 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgDMP2F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791635; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hq1R/JeoDhW7Pa8Ev1pNcoqxg2JBSBhp75ldOvTZde0=;
        b=VRXCHzZ6IAShTUFSpRVnLsp3nrWzUKOByc70+AV8wBwT5POwikPPsIpK+H3vjgEmxXeqcu
        JXD1XJASWg/pIhOT+GQDWpoVNNDuJ15YfFKY39AjiybMqg2374qvQzbXoonSYSTrIvGFux
        SEzYXDwk+V+cqNzEWGlJZYkS+Bx499s=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 07/13] MIPS: ingenic: DTS: Respect cell count of common properties
Date:   Mon, 13 Apr 2020 17:26:27 +0200
Message-Id: <20200413152633.198301-7-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If N fields of X cells should be provided, then that's what the
devicetree should represent, instead of having one single field of
(N*X) cells.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/jz4740.dtsi | 19 +++++++++----------
 arch/mips/boot/dts/ingenic/jz4770.dtsi | 12 +++++-------
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 24 +++++++++++-------------
 arch/mips/boot/dts/ingenic/x1000.dtsi  |  9 ++++-----
 4 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
index a3301bab9231..b56671157bbd 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -55,10 +55,10 @@ tcu: timer@10002000 {
 
 		#clock-cells = <1>;
 
-		clocks = <&cgu JZ4740_CLK_RTC
-			  &cgu JZ4740_CLK_EXT
-			  &cgu JZ4740_CLK_PCLK
-			  &cgu JZ4740_CLK_TCU>;
+		clocks = <&cgu JZ4740_CLK_RTC>,
+			 <&cgu JZ4740_CLK_EXT>,
+			 <&cgu JZ4740_CLK_PCLK>,
+			 <&cgu JZ4740_CLK_TCU>;
 		clock-names = "rtc", "ext", "pclk", "tcu";
 
 		interrupt-controller;
@@ -241,10 +241,10 @@ nemc: memory-controller@13010000 {
 		reg = <0x13010000 0x54>;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges = <1 0 0x18000000 0x4000000
-			  2 0 0x14000000 0x4000000
-			  3 0 0x0c000000 0x4000000
-			  4 0 0x08000000 0x4000000>;
+		ranges = <1 0 0x18000000 0x4000000>,
+			 <2 0 0x14000000 0x4000000>,
+			 <3 0 0x0c000000 0x4000000>,
+			 <4 0 0x08000000 0x4000000>;
 
 		clocks = <&cgu JZ4740_CLK_MCLK>;
 	};
@@ -258,8 +258,7 @@ ecc: ecc-controller@13010100 {
 
 	dmac: dma-controller@13020000 {
 		compatible = "ingenic,jz4740-dma";
-		reg = <0x13020000 0xbc
-		       0x13020300 0x14>;
+		reg = <0x13020000 0xbc>, <0x13020300 0x14>;
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 3805816cea2e..9a25a6f7a48d 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -55,9 +55,9 @@ tcu: timer@10002000 {
 
 		#clock-cells = <1>;
 
-		clocks = <&cgu JZ4770_CLK_RTC
-			  &cgu JZ4770_CLK_EXT
-			  &cgu JZ4770_CLK_PCLK>;
+		clocks = <&cgu JZ4770_CLK_RTC>,
+			 <&cgu JZ4770_CLK_EXT>,
+			 <&cgu JZ4770_CLK_PCLK>;
 		clock-names = "rtc", "ext", "pclk";
 
 		interrupt-controller;
@@ -219,8 +219,7 @@ uart3: serial@10033000 {
 
 	dmac0: dma-controller@13420000 {
 		compatible = "ingenic,jz4770-dma";
-		reg = <0x13420000 0xC0
-		       0x13420300 0x20>;
+		reg = <0x13420000 0xC0>, <0x13420300 0x20>;
 
 		#dma-cells = <2>;
 
@@ -234,8 +233,7 @@ dmac0: dma-controller@13420000 {
 
 	dmac1: dma-controller@13420100 {
 		compatible = "ingenic,jz4770-dma";
-		reg = <0x13420100 0xC0
-		       0x13420400 0x20>;
+		reg = <0x13420100 0xC0>, <0x13420400 0x20>;
 
 		#dma-cells = <2>;
 
diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index bb89653d16a3..51ea764101aa 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -58,9 +58,9 @@ tcu: timer@10002000 {
 
 		#clock-cells = <1>;
 
-		clocks = <&cgu JZ4780_CLK_RTCLK
-			  &cgu JZ4780_CLK_EXCLK
-			  &cgu JZ4780_CLK_PCLK>;
+		clocks = <&cgu JZ4780_CLK_RTCLK>,
+			 <&cgu JZ4780_CLK_EXCLK>,
+			 <&cgu JZ4780_CLK_PCLK>;
 		clock-names = "rtc", "ext", "pclk";
 
 		interrupt-controller;
@@ -196,8 +196,7 @@ spi_gpio {
 		gpio-miso = <&gpe 14 0>;
 		gpio-sck = <&gpe 15 0>;
 		gpio-mosi = <&gpe 17 0>;
-		cs-gpios = <&gpe 16 0
-			    &gpe 18 0>;
+		cs-gpios = <&gpe 16 0>, <&gpe 18 0>;
 
 		spidev@0 {
 			compatible = "spidev";
@@ -362,12 +361,12 @@ nemc: nemc@13410000 {
 		reg = <0x13410000 0x10000>;
 		#address-cells = <2>;
 		#size-cells = <1>;
-		ranges = <1 0 0x1b000000 0x1000000
-			  2 0 0x1a000000 0x1000000
-			  3 0 0x19000000 0x1000000
-			  4 0 0x18000000 0x1000000
-			  5 0 0x17000000 0x1000000
-			  6 0 0x16000000 0x1000000>;
+		ranges = <1 0 0x1b000000 0x1000000>,
+			 <2 0 0x1a000000 0x1000000>,
+			 <3 0 0x19000000 0x1000000>,
+			 <4 0 0x18000000 0x1000000>,
+			 <5 0 0x17000000 0x1000000>,
+			 <6 0 0x16000000 0x1000000>;
 
 		clocks = <&cgu JZ4780_CLK_NEMC>;
 
@@ -376,8 +375,7 @@ nemc: nemc@13410000 {
 
 	dma: dma@13420000 {
 		compatible = "ingenic,jz4780-dma";
-		reg = <0x13420000 0x400
-		       0x13421000 0x40>;
+		reg = <0x13420000 0x400>, <0x13421000 0x40>;
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 147f7d5c243a..59a63a0985a8 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -58,9 +58,9 @@ tcu: timer@10002000 {
 
 		#clock-cells = <1>;
 
-		clocks = <&cgu X1000_CLK_RTCLK
-			  &cgu X1000_CLK_EXCLK
-			  &cgu X1000_CLK_PCLK>;
+		clocks = <&cgu X1000_CLK_RTCLK>,
+			 <&cgu X1000_CLK_EXCLK>,
+			 <&cgu X1000_CLK_PCLK>;
 		clock-names = "rtc", "ext", "pclk";
 
 		interrupt-controller;
@@ -239,8 +239,7 @@ uart2: serial@10032000 {
 
 	pdma: dma-controller@13420000 {
 		compatible = "ingenic,x1000-dma";
-		reg = <0x13420000 0x400
-			   0x13421000 0x40>;
+		reg = <0x13420000 0x400>, <0x13421000 0x40>;
 		#dma-cells = <2>;
 
 		interrupt-parent = <&intc>;
-- 
2.25.1

