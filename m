Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52BA33A6C7
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbhCNQo0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbhCNQoB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:44:01 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6798C061763;
        Sun, 14 Mar 2021 09:44:00 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a18so7457167wrc.13;
        Sun, 14 Mar 2021 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3gDYkhk6/tbeNprlEIjGuI8i5dmAoV3NqfyHMWMcCm8=;
        b=rSVwropash0scW3EyYDUlKWjQWMAEe6okVSvBH7Syie81WNOzo8ur/+9c/4xhbbvp5
         xOJgHcr1QcbREYyXWi+CT399nNfTBl07Fv6HHz0BwsTSzIaWX9JFxhE4mzymh7liv/+2
         9WOYeH7/x9PccAYjmxfk9gvU9JkisIsx3g58hipSQ9SWWiIdvnT5pyXPVY3HSLY5BDYJ
         9HOhQ9VxWpyz6CKGp+bSz0Ioac5UcMGTN6aqk/KtgB0WrvUAQuyBbrs81f5H2hYwOMUW
         mIfiIQUB93K2iVBxEjbEuqvNa0Hz9plPcXltO5iYiEKzVvZBX95IeJ2Meu+fr1Yx5rqb
         VHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3gDYkhk6/tbeNprlEIjGuI8i5dmAoV3NqfyHMWMcCm8=;
        b=ozIgZSAkjzZZ5sIPIy7JJsH80NYnxSF8Ipc9QVdnwmsvhMlRl0ppM3t6OLh2DgDyDx
         ZijfzJWnYOprVMXoLFDAN8q3ezeLKtcWLUXZP5fL1gUf/Np3hVsrfeLUkIFM/qZWlLLL
         1ignx/MH+8HFdz4N56MAuqgKK5FuMZuU3xLfSO036zmP8ypwj+/v9ElqxYatc62uQjzP
         AWOiM85/H6meGRDCp29voGJ1oQ0R6AtOIyhCPUrkN+tppCiSA0dLP+knJmntD/PaFYsE
         wYQhQmPK9ghobC/q1lFGaMEJNRHfOeNQiSpm8Xi7lxoVMMKu2+Ith2xzMGXpHP/WHJKs
         YFdA==
X-Gm-Message-State: AOAM531j7GhMjUxZVS7OmmN2Ekp8s5X8ZV7zD9YPEp8kqT6S+TCuY9We
        7Zk4xODwoK6bWCS7S7wwjO8=
X-Google-Smtp-Source: ABdhPJza5OotSgubLmWC58X7VYOfw5MHhvfDGBkHL7RZUzYXZpSwV/ya40bFQaMzAQ4s7RmKqg3HcQ==
X-Received: by 2002:adf:8b0d:: with SMTP id n13mr24043069wra.94.1615740239165;
        Sun, 14 Mar 2021 09:43:59 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a12sm15146071wrx.5.2021.03.14.09.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:43:58 -0700 (PDT)
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
Subject: [PATCH v2 6/6] mips: bmips: bcm63268: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:43:51 +0100
Message-Id: <20210314164351.24665-7-noltari@gmail.com>
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
- Add HS SPI controller
- Add NAND controller.
- Add USBH PHY.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: add missing patch

 arch/mips/boot/dts/brcm/bcm63268.dtsi | 130 +++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 14 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 052d2032d4e4..c3ce49ec675f 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
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
 			compatible = "brcm,bcm63268-clocks";
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
 
+		wdt: watchdog@1000009c {
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x1000009c 0xc>;
+
+			clocks = <&periph_osc>;
+			clock-names = "refclk";
+
+			timeout-sec = <30>;
+		};
+
 		uart0: serial@10000180 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000180 0x18>;
@@ -100,12 +122,34 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <5>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
 		};
 
+		nflash: nand@10000200 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm6368",
+				     "brcm,brcmnand-v4.0",
+				     "brcm,brcmnand";
+			reg = <0x10000200 0x180>,
+			      <0x10000600 0x200>,
+			      <0x100000b0 0x10>;
+			reg-names = "nand",
+				    "nand-cache",
+				    "nand-int-base";
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <50>;
+
+			clocks = <&periph_clk BCM63268_CLK_NAND>;
+			clock-names = "nand";
+
+			status = "disabled";
+		};
+
 		uart1: serial@100001a0 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x100001a0 0x18>;
@@ -113,17 +157,44 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <34>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
 		};
 
-		leds0: led-controller@10001900 {
+		lsspi: spi@10000800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,bcm6328-leds";
-			reg = <0x10001900 0x24>;
+			compatible = "brcm,bcm6358-spi";
+			reg = <0x10000800 0x70c>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <80>;
+
+			clocks = <&periph_clk BCM63268_CLK_SPI>;
+			clock-names = "spi";
+
+			resets = <&periph_rst BCM63268_RST_SPI>;
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
+			interrupts = <6>;
+
+			clocks = <&periph_clk BCM63268_CLK_HSSPI>,
+				 <&hsspi_osc>;
+			clock-names = "hsspi",
+				      "pll";
+
+			resets = <&periph_rst BCM63268_RST_SPI>;
 
 			status = "disabled";
 		};
@@ -134,6 +205,15 @@
 			#power-domain-cells = <1>;
 		};
 
+		leds0: led-controller@10001900 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm6328-leds";
+			reg = <0x10001900 0x24>;
+
+			status = "disabled";
+		};
+
 		ehci: usb@10002500 {
 			compatible = "brcm,bcm63268-ehci", "generic-ehci";
 			reg = <0x10002500 0x100>;
@@ -142,6 +222,9 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <10>;
 
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
 			status = "disabled";
 		};
 
@@ -154,6 +237,25 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <9>;
 
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
+			status = "disabled";
+		};
+
+		usbh: usb-phy@10002700 {
+			compatible = "brcm,bcm63268-usbh-phy";
+			reg = <0x10002700 0x38>;
+			#phy-cells = <1>;
+
+			clocks = <&periph_clk BCM63268_CLK_USBH>;
+			clock-names = "usbh";
+
+			power-domains = <&periph_pwr BCM63268_POWER_DOMAIN_USBH>;
+
+			resets = <&periph_rst BCM63268_RST_USBH>;
+			reset-names = "usbh";
+
 			status = "disabled";
 		};
 	};
-- 
2.20.1

