Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5F833A6C6
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhCNQoY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbhCNQn5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:43:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4559C061574;
        Sun, 14 Mar 2021 09:43:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id z2so4503507wrl.5;
        Sun, 14 Mar 2021 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lRhmU+iyZ+dB0A8b9RIMviiu29qYoNywdX7E0vujxS0=;
        b=K+bYi19MzgilzK/FT54UO2O5A9T7K75jil6hCeL4rm3gWaqyGecQ3lcxrWFPUWkQEL
         Sd6hpX81YSmBJADdWL7Kr1emw8OpI272aqahy89SFu8vLhbzbr6xQu/RiRT/5hx++QXC
         3Z2NKgpDUXyLCJvvZ49QZdSSFNL1enoAGAJPm25FM+aCKYNiKpZWeRhKXactm+8iIEur
         ELIWj7IPc0pNa/vAlMYbyBe5EHXCLrvZEJjaX9ISpTFlb3h3WxEYrDLEIdZ26RLGPB1f
         nGvbils4CBAuu9oL5UuinR3cX2YzacJD8H4KBjruy1L3VpOxbDdR5uN0USDR0rzKFIVp
         Y/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lRhmU+iyZ+dB0A8b9RIMviiu29qYoNywdX7E0vujxS0=;
        b=AeO1hQ7tNcLLPdDQ4cikJvJ5+HZ1kf4err0zQ3xuCG7LmvwK7FVRQzBodoFC6m8xCw
         GPoVIWfakajFA1wvqSBD33KrSY0PUyfb7xuZEwfv6W08OWTTQfWU3qFZXW0SIxBSeW7S
         rTwrHf3vHtzssK7pXZNL/pYrwf2vq1ADaSLhhr59sMoVzIbfoHJnxOLYqS2dAbLztn3R
         aneNxYqA1qmClxVPi5qs7Pvrfy8sZCad6C5ptseGPW227/W+nH0b2knROIoSxLT+UD8k
         RRKg23e/RUxNumQ1LNQQ3fgPy29b3EmxDXjmdt3omZiA6zjAETQGwIPLmK04l4HfEQkC
         oEOw==
X-Gm-Message-State: AOAM532hgwUdPFjNPNO8T3z45h8rhSJPJ8Zur5gr8Qb0ded6KnWg60tg
        JE2SZ+j86UpjVdVgzjMeoDw=
X-Google-Smtp-Source: ABdhPJxj2ZRNh+NRlc/50duUFuuCMHpymf4dVJmPTKp+pZh76yhmLlLmDXbm1OD/ZX4kIhx6h+R7LA==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr22947013wrr.81.1615740235449;
        Sun, 14 Mar 2021 09:43:55 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a12sm15146071wrx.5.2021.03.14.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:43:55 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 2/6] mips: bmips: bcm6328: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:43:47 +0100
Message-Id: <20210314164351.24665-3-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210314164351.24665-1-noltari@gmail.com>
References: <20210314164351.24665-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

- Rename periph_clk to periph_osc.
- Rename clkctl to periph_clk.
- Move syscon-reboot to subnode.
- Add hsspi-osc clock.
- Add watchdog.
- Add HS SPI controller.
- Add NAND controller.
- Add USBH PHY.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes

 arch/mips/boot/dts/brcm/bcm6328.dtsi | 119 +++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 14 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index fe93f2692281..634618d4377e 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -29,16 +29,26 @@
 	};
 
 	clocks {
-		periph_clk: periph-clk {
+		periph_osc: periph-osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <50000000>;
+			clock-output-names = "periph";
+		};
+
+		hsspi_osc: hsspi-osc {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <133333333>;
+			clock-output-names = "hsspi_osc";
 		};
 	};
 
 	aliases {
+		nflash = &nflash;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		spi1 = &hsspi;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -56,7 +66,7 @@
 		compatible = "simple-bus";
 		ranges;
 
-		clkctl: clock-controller@10000004 {
+		periph_clk: clock-controller@10000004 {
 			compatible = "brcm,bcm6328-clocks";
 			reg = <0x10000004 0x4>;
 			#clock-cells = <1>;
@@ -80,37 +90,71 @@
 			interrupts = <2>, <3>;
 		};
 
+		wdt: watchdog@1000005c {
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x1000005c 0xc>;
+
+			clocks = <&periph_osc>;
+			clock-names = "refclk";
+
+			timeout-sec = <30>;
+		};
+
+		soft_reset: syscon@10000068 {
+			compatible = "syscon";
+			reg = <0x10000068 0x4>;
+			native-endian;
+
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				mask = <0x1>;
+			};
+		};
+
 		uart0: serial@10000100 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000100 0x18>;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <28>;
-			clocks = <&periph_clk>;
+
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
+
 			status = "disabled";
 		};
 
 		uart1: serial@10000120 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000120 0x18>;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <39>;
-			clocks = <&periph_clk>;
+
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
+
 			status = "disabled";
 		};
 
-		timer: syscon@10000040 {
-			compatible = "syscon";
-			reg = <0x10000040 0x2c>;
-			native-endian;
-		};
+		nflash: nand@10000200 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm6368",
+				     "brcm,brcmnand-v2.2",
+				     "brcm,brcmnand";
+			reg = <0x10000200 0x180>,
+			      <0x10000400 0x200>,
+			      <0x10000070 0x10>;
+			reg-names = "nand",
+				    "nand-cache",
+				    "nand-int-base";
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <0>;
 
-		reboot: syscon-reboot@10000068 {
-			compatible = "syscon-reboot";
-			regmap = <&timer>;
-			offset = <0x28>;
-			mask = <0x1>;
+			status = "disabled";
 		};
 
 		leds0: led-controller@10000800 {
@@ -118,6 +162,27 @@
 			#size-cells = <0>;
 			compatible = "brcm,bcm6328-leds";
 			reg = <0x10000800 0x24>;
+
+			status = "disabled";
+		};
+
+		hsspi: spi@10001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm6328-hsspi";
+			reg = <0x10001000 0x600>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <29>;
+
+			clocks = <&periph_clk BCM6328_CLK_HSSPI>,
+				 <&hsspi_osc>;
+			clock-names = "hsspi",
+				      "pll";
+
+			resets = <&periph_rst BCM6328_RST_SPI>;
+			reset-names = "hsspi";
+
 			status = "disabled";
 		};
 
@@ -131,8 +196,13 @@
 			compatible = "brcm,bcm6328-ehci", "generic-ehci";
 			reg = <0x10002500 0x100>;
 			big-endian;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <42>;
+
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
 			status = "disabled";
 		};
 
@@ -141,8 +211,29 @@
 			reg = <0x10002600 0x100>;
 			big-endian;
 			no-big-frame-no;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <41>;
+
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
+			status = "disabled";
+		};
+
+		usbh: usb-phy@10002700 {
+			compatible = "brcm,bcm6328-usbh-phy";
+			reg = <0x10002700 0x38>;
+			#phy-cells = <1>;
+
+			clocks = <&periph_clk BCM6328_CLK_USBH>;
+			clock-names = "usbh";
+
+			power-domains = <&periph_pwr BCM6328_POWER_DOMAIN_USBH>;
+
+			resets = <&periph_rst BCM6328_RST_USBH>;
+			reset-names = "usbh";
+
 			status = "disabled";
 		};
 	};
-- 
2.20.1

