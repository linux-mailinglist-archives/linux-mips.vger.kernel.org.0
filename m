Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D19A933A6CA
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbhCNQoZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbhCNQoA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:44:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884A8C061574;
        Sun, 14 Mar 2021 09:43:58 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso18833204wme.0;
        Sun, 14 Mar 2021 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oOHRHIh2fmr6lmlJ1aaC0Gh0HhK4E74RXaOUomRw6kc=;
        b=pIfb+GOr4Xk27baJptLx8E/GcQH3Oa2ADpdXInuq2V+QdZM+nYnLwCe45OhkNqQ+u7
         40BkwIxuBIhnbwiP/rMDZU/HU+IR/m3B6qt5oQ+DZ7PJEzsqU+A0XSP6nGkExaAh8G2j
         bJYCr15xzC9n28j2HJ6ww7np0Sdl8QzUg/jzhX9L4lD2misTEkMvn69hNJPTjRJhymFQ
         BnHnTTqll+pluQBzqw7pXdB7ubvgHa4iOhVwsvcahMSfWA+huwi7QtukBUSbsFbx2g4c
         8GX7wBVRlThloMdieMGNMXYQ6KefCmoEKWNb5KRCXpefYBkvk4N7+6YA5cTaNzoJCu1a
         NNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oOHRHIh2fmr6lmlJ1aaC0Gh0HhK4E74RXaOUomRw6kc=;
        b=QxijN90SVpeJhmJUfzJqBhTRPiRjZvkMP8inEshnID+W46a5urvYvZppYwxKOCJbjC
         hFkCMevW+HqpiRVPjShiGeMdgywTp7A5C5kuCLsUTEPfeUhlf4Wtu7c0NgQfQHdPUpCk
         7wA0PLPEOilWaNEd5E72P1U02gB8xwjcHh9KFXzKLqWRPZKgGuwgLqTgqCySMkNx2Bqq
         W8RwRqCyVG0yRjPI1BpmU6sttCBTS86vGtE1rHq+f9L5HyD1h4sOXWXj7Ywj5anNJhMO
         gSuXhX8VsbhNZ0qa59HGqc4QqiVUiHgbV8McfRpdkvtphHcLTWRjNE3DW8J+LSmzFIR5
         1MMw==
X-Gm-Message-State: AOAM530MCCMhh+3SAdmhtaWdrIakRNm730xHWUJqavSbj9fFu67Ineym
        osHHRKmxQ/iiVD/ntDgCRTA=
X-Google-Smtp-Source: ABdhPJzan0kvjm859Z0DqUQkt44h84FJTFYcatDUBcHO6FD9mCGB7hcweVLJ3ZA2KmyQD917VPGtuA==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr22509920wma.80.1615740237261;
        Sun, 14 Mar 2021 09:43:57 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a12sm15146071wrx.5.2021.03.14.09.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:43:56 -0700 (PDT)
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
Subject: [PATCH v2 4/6] mips: bmips: bcm6362: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:43:49 +0100
Message-Id: <20210314164351.24665-5-noltari@gmail.com>
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
- Add SPI controller.
- Add HS SPI controller.
- Add NAND controller.
- Add USBH PHY.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes

 arch/mips/boot/dts/brcm/bcm6362.dtsi | 127 ++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 50c287bedc37..d74021925c53 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -29,16 +29,29 @@
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
+
+			#clock-cells = <0>;
+
+			clock-frequency = <400000000>;
+			clock-output-names = "hsspi_osc";
 		};
 	};
 
 	aliases {
+		nflash = &nflash;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		spi0 = &lsspi;
+		spi1 = &hsspi;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -56,23 +69,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		clkctl: clock-controller@10000004 {
+		periph_clk: clock-controller@10000004 {
 			compatible = "brcm,bcm6362-clocks";
 			reg = <0x10000004 0x4>;
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@10000008 {
+		pll_cntl: syscon@10000008 {
 			compatible = "syscon";
 			reg = <0x10000008 0x4>;
 			native-endian;
-		};
 
-		reboot: syscon-reboot@10000008 {
-			compatible = "syscon-reboot";
-			regmap = <&periph_cntl>;
-			offset = <0x0>;
-			mask = <0x1>;
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				mask = <0x1>;
+			};
 		};
 
 		periph_rst: reset-controller@10000010 {
@@ -93,6 +105,16 @@
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
 		uart0: serial@10000100 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000100 0x18>;
@@ -100,7 +122,7 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <3>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
@@ -113,12 +135,72 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <4>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
 		};
 
+		nflash: nand@10000200 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm6368",
+				     "brcm,brcmnand-v2.2",
+				     "brcm,brcmnand";
+			reg = <0x10000200 0x180>,
+			      <0x10000600 0x200>,
+			      <0x10000070 0x10>;
+			reg-names = "nand",
+				    "nand-cache",
+				    "nand-int-base";
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <12>;
+
+			clocks = <&periph_clk BCM6362_CLK_NAND>;
+			clock-names = "nand";
+
+			status = "disabled";
+		};
+
+		lsspi: spi@10000800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm6358-spi";
+			reg = <0x10000800 0x70c>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <2>;
+
+			clocks = <&periph_clk BCM6362_CLK_SPI>;
+			clock-names = "spi";
+
+			resets = <&periph_rst BCM6362_RST_SPI>;
+			reset-names = "spi";
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
+			interrupts = <5>;
+
+			clocks = <&periph_clk BCM6362_CLK_HSSPI>,
+				 <&hsspi_osc>;
+			clock-names = "hsspi",
+				      "pll";
+
+			resets = <&periph_rst BCM6362_RST_SPI>;
+			reset-names = "hsspi";
+
+			status = "disabled";
+		};
+
 		periph_pwr: power-controller@10001848 {
 			compatible = "brcm,bcm6362-power-controller";
 			reg = <0x10001848 0x4>;
@@ -142,6 +224,9 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <10>;
 
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
 			status = "disabled";
 		};
 
@@ -154,6 +239,26 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <9>;
 
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
+			status = "disabled";
+		};
+
+		usbh: usb-phy@10002700 {
+			compatible = "brcm,bcm6362-usbh-phy";
+			reg = <0x10002700 0x38>;
+
+			#phy-cells = <1>;
+
+			clocks = <&periph_clk BCM6362_CLK_USBH>;
+			clock-names = "usbh";
+
+			power-domains = <&periph_pwr BCM6362_POWER_DOMAIN_USBH>;
+
+			resets = <&periph_rst BCM6362_RST_USBH>;
+			reset-names = "usbh";
+
 			status = "disabled";
 		};
 	};
-- 
2.20.1

