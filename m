Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B45F2AF67D
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgKKQaj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbgKKQa0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:26 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE55FC0613D1;
        Wed, 11 Nov 2020 08:30:25 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p22so2803935wmg.3;
        Wed, 11 Nov 2020 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FYKOUWD0OJw73iZ7JD4H1o7QmbZcn/nhEwwRlMzqiAE=;
        b=L8SwnQiC1gEWAQMAmdLFvvbpMlKy/y5IyRJEQipiXdWeEqtzVNZrYHFyr1VWxIsSol
         cEiJcGB56zoTuiNf+pJMdlW5X5arw+R4k/wnjRVlT+Lid5YS5MuxRf+ZtkGo+Z1ST7Hd
         gRrCWt8Fs7kZkRwy6ckIIdK8UuJqFIlS3VtM2YBPWeG0yYDZgX+qphamlWvZ8eh+XTQO
         OqZM0pd525lEAVKH3m9z+86KgnTmucbckaktA8G4oRUOUuQnRL+KGXzjNsHVft82LmKo
         92iqmluN1pcw6mLuPy8Bh2sDJvbBpQzUGP1xh46UW0d6q0+VOMOptVzF98uGdvI+BD+0
         N1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FYKOUWD0OJw73iZ7JD4H1o7QmbZcn/nhEwwRlMzqiAE=;
        b=kgAetXV5v3pbz8a+A0BJnGlvragcv7Ywp+qfnpVhhgUm+lGst6ZogJlltc6wW7Dtsk
         ZciBhrwNlsu8sZq2CiNyWQ83MPYNDDkHIHu7TImsmwinvI4EFSLBDwrpKJKEwt/LPvwn
         UzR1jy6ePNWDfMob1dpRxx1FS2IDGH8FFqR8gZUhWHoo/NrEOjE/7xDVZ1V0FcSP1zAh
         Vo4hUA8GHi/NRlypmXk4XDPVo3fvhRFZFB0B+uWwA2fsbvKB7vR19i6H/bBnYsQlk7T0
         t6Ed94dmv/JsCI8MtaF4jDrjWq29NhyTMH2p+deJvkarA57MLQbI90y3z7zrTAbbKCLZ
         0gaw==
X-Gm-Message-State: AOAM5304uYKML21kJHpeNc4f1AObOwAD2lcBgKHlPT3r3B8GOdXoVPw0
        gXJNahX2mR6pdSA+O8KpKkQ=
X-Google-Smtp-Source: ABdhPJzGnoLjgNUq+bouW7p8xVRr2Jpc+VKbjdQa4AJBHypdOVF7BcMeR6QuYHGiHnAAkWXizxg/JA==
X-Received: by 2002:a1c:7303:: with SMTP id d3mr5374141wmb.152.1605112224529;
        Wed, 11 Nov 2020 08:30:24 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:24 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 6/7] staging: mt7621-dts: make use of new 'mt7621-pll' and 'mt7621-clk'
Date:   Wed, 11 Nov 2020 17:30:12 +0100
Message-Id: <20201111163013.29412-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clocks for SoC mt7621 have been properly integrated so there is
no need to declare fixed clocks at all in the device tree. Remove
all of them, add new device tree nodes for new mt7621-pll and mt7621-clk
and update the rest of the nodes to use them.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/gbpc1.dts   | 11 ----
 drivers/staging/mt7621-dts/mt7621.dtsi | 71 ++++++++++++--------------
 2 files changed, 34 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index a7c0d3115d72..7716d0efe524 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -100,17 +100,6 @@ partition@50000 {
 	};
 };
 
-&sysclock {
-			compatible = "fixed-clock";
-			/* This is normally 1/4 of cpuclock */
-			clock-frequency = <225000000>;
-};
-
-&cpuclock {
-			compatible = "fixed-clock";
-			clock-frequency = <900000000>;
-};
-
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 82aa93634eda..e615139d2ccb 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -1,5 +1,6 @@
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/mt7621-clk.h>
 
 / {
 	#address-cells = <1>;
@@ -27,26 +28,16 @@ aliases {
 		serial0 = &uartlite;
 	};
 
-	cpuclock: cpuclock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-
-		/* FIXME: there should be way to detect this */
-		clock-frequency = <880000000>;
-	};
-
-	sysclock: sysclock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-
-		/* This is normally 1/4 of cpuclock */
-		clock-frequency = <220000000>;
+	pll: pll {
+		compatible = "mediatek,mt7621-pll";
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "ahb", "apb";
 	};
 
-	mmc_clock: mmc_clock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <48000000>;
+	clkctrl: clkctrl {
+		compatible = "mediatek,mt7621-clk";
+		#clock-cells = <1>;
+		ralink,sysctl = <&sysc>;
 	};
 
 	mmc_fixed_3v3: fixedregulator@0 {
@@ -76,7 +67,7 @@ palmbus: palmbus@1E000000 {
 		#size-cells = <1>;
 
 		sysc: sysc@0 {
-			compatible = "mtk,mt7621-sysc";
+			compatible = "mtk,mt7621-sysc", "syscon";
 			reg = <0x0 0x100>;
 		};
 
@@ -100,8 +91,8 @@ i2c: i2c@900 {
 			compatible = "mediatek,mt7621-i2c";
 			reg = <0x900 0x100>;
 
-			clocks = <&sysclock>;
-
+			clocks = <&clkctrl MT7621_CLK_I2C>;
+			clock-names = "i2c";
 			resets = <&rstctrl 16>;
 			reset-names = "i2c";
 
@@ -118,8 +109,8 @@ i2s: i2s@a00 {
 			compatible = "mediatek,mt7621-i2s";
 			reg = <0xa00 0x100>;
 
-			clocks = <&sysclock>;
-
+			clocks = <&clkctrl MT7621_CLK_I2S>;
+			clock-names = "i2s";
 			resets = <&rstctrl 17>;
 			reset-names = "i2s";
 
@@ -155,8 +146,8 @@ uartlite: uartlite@c00 {
 			compatible = "ns16550a";
 			reg = <0xc00 0x100>;
 
-			clocks = <&sysclock>;
-			clock-frequency = <50000000>;
+			clocks = <&clkctrl MT7621_CLK_UART1>;
+			clock-names = "uart1";
 
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SHARED 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -172,7 +163,7 @@ spi0: spi@b00 {
 			compatible = "ralink,mt7621-spi";
 			reg = <0xb00 0x100>;
 
-			clocks = <&sysclock>;
+			clocks = <&pll MT7621_CLK_AHB>;
 
 			resets = <&rstctrl 18>;
 			reset-names = "spi";
@@ -188,6 +179,8 @@ gdma: gdma@2800 {
 			compatible = "ralink,rt3883-gdma";
 			reg = <0x2800 0x800>;
 
+			clocks = <&clkctrl MT7621_CLK_GDMA>;
+			clock-names = "gdma";
 			resets = <&rstctrl 14>;
 			reset-names = "dma";
 
@@ -205,6 +198,8 @@ hsdma: hsdma@7000 {
 			compatible = "mediatek,mt7621-hsdma";
 			reg = <0x7000 0x1000>;
 
+			clocks = <&clkctrl MT7621_CLK_HSDMA>;
+			clock-names = "hsdma";
 			resets = <&rstctrl 5>;
 			reset-names = "hsdma";
 
@@ -315,11 +310,6 @@ rstctrl: rstctrl {
 		#reset-cells = <1>;
 	};
 
-	clkctrl: clkctrl {
-		compatible = "ralink,rt2880-clock";
-		#clock-cells = <1>;
-	};
-
 	sdhci: sdhci@1E130000 {
 		status = "disabled";
 
@@ -338,7 +328,8 @@ sdhci: sdhci@1E130000 {
 		pinctrl-0 = <&sdhci_pins>;
 		pinctrl-1 = <&sdhci_pins>;
 
-		clocks = <&mmc_clock &mmc_clock>;
+		clocks = <&pll MT7621_CLK_APB>,
+			 <&pll MT7621_CLK_APB>;
 		clock-names = "source", "hclk";
 
 		interrupt-parent = <&gic>;
@@ -353,7 +344,7 @@ xhci: xhci@1E1C0000 {
 		       0x1e1d0700 0x0100>;
 		reg-names = "mac", "ippc";
 
-		clocks = <&sysclock>;
+		clocks = <&pll MT7621_CLK_AHB>;
 		clock-names = "sys_ck";
 
 		interrupt-parent = <&gic>;
@@ -372,7 +363,7 @@ gic: interrupt-controller@1fbc0000 {
 		timer {
 			compatible = "mti,gic-timer";
 			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-			clocks = <&cpuclock>;
+			clocks = <&pll MT7621_CLK_CPU>;
 		};
 	};
 
@@ -385,6 +376,9 @@ nand: nand@1e003000 {
 			0x1e003800 0x800>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+
+		clocks = <&clkctrl MT7621_CLK_NAND>;
+		clock-names = "nand";
 	};
 
 	ethsys: syscon@1e000000 {
@@ -398,8 +392,9 @@ ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
 
-		clocks = <&sysclock>;
-		clock-names = "ethif";
+		clocks = <&pll MT7621_CLK_AHB>,
+			 <&clkctrl MT7621_CLK_ETH>;
+		clock-names = "ethif", "eth";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -532,7 +527,9 @@ GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH
 
 		resets = <&rstctrl 24 &rstctrl 25 &rstctrl 26>;
 		reset-names = "pcie0", "pcie1", "pcie2";
-		clocks = <&clkctrl 24 &clkctrl 25 &clkctrl 26>;
+		clocks = <&clkctrl MT7621_CLK_PCIE0>,
+			 <&clkctrl MT7621_CLK_PCIE1>,
+			 <&clkctrl MT7621_CLK_PCIE2>;
 		clock-names = "pcie0", "pcie1", "pcie2";
 		phys = <&pcie0_phy 1>, <&pcie2_phy 0>;
 		phy-names = "pcie-phy0", "pcie-phy2";
-- 
2.25.1

