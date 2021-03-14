Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7208733A676
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234625AbhCNQfh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234119AbhCNQey (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:34:54 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C588C061574;
        Sun, 14 Mar 2021 09:34:53 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso18825678wme.0;
        Sun, 14 Mar 2021 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vv2EglTLcmQSIZYRnnry38+UZpZIKT0Tfqm1rBAVpBg=;
        b=gpLQQbx5dqRnCMDTiZPcs3ZXak2itPM7CQ+ZxRbllsio1l8vT2JKeCY+yW75HDSgxS
         kpEcIVccECtSU3SYX8mBStsx4vQ5rpJy/MgjbTw4DBvZUXwziGVVRX6bOhkFyYJTtlNg
         AUdJbg+KDSQjAOfQwIChYGmHBFTC4C5Bj/hKQmVsRPX00DhEbt89uAV64nFfPnMYjsWX
         R0K63eVIjMcB1NRTcjC8lxAeSkPlZY2xTpNRsWBZqbmt+PebJND7ypVpu7WDPhvWUdQJ
         5B8WLaY5PI/vYpoZ0NU82HplyCb3/MdeQaqhUViCSDHOaf53D2+DcG6KBMe6kpTLGadI
         aQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vv2EglTLcmQSIZYRnnry38+UZpZIKT0Tfqm1rBAVpBg=;
        b=mOIVX7py99Ho3N32WqwaXBrRYUHWNtxm+hoESwBA/CCrvaJDLiFumcwQvjA1yW+5Nk
         VPiyIxznODf7yJMzo5KEYaQ1DrwkVtob3S9rSNvUV6AKvLT9llSu7ok97nSEF5Unmvsh
         rnE1B+x+L6eBRtQ7ZbprqfsxkuJuxKvLKt3a2w6XSK9Gf7FCRI2C8iZLz8hskN0vwVur
         9ZOAOPFiVl4Y4Nr7Alud+rkP/21HTHF1NJkju4HgpnWREGAG+F1BJy5IDkH3Sl2syCH+
         LKjDpHGhPLkDYLqGyR7YumNb+tJgbkTMPlWjmlYuN9ER9/Vnl3wiNRerq/tdkIU8MD1I
         SMDA==
X-Gm-Message-State: AOAM533m2TKdTly7cxElgXphA1hZGyAU+kSeUleZgx/4/m7YxvXWL9tW
        yYMYYCcCFcR0MCUZBVZZVsY=
X-Google-Smtp-Source: ABdhPJzWtOBW835d8ZwaFKfWtZ1n4/RdqgRu6atxmSunCB0jiQxr47LVWN0VHUA0aTnbMC9dAjMifQ==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr22131872wmk.139.1615739692285;
        Sun, 14 Mar 2021 09:34:52 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id h62sm10547804wmf.37.2021.03.14.09.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:34:52 -0700 (PDT)
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
Subject: [PATCH 5/5] mips: bmips: bcm6368: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:34:45 +0100
Message-Id: <20210314163445.6976-6-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210314163445.6976-1-noltari@gmail.com>
References: <20210314163445.6976-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

- Rename periph_clk to periph_osc.
- Rename clkctl to periph_clk.
- Move syscon-reboot to subnode.
- Add watchdog controller.
- Add SPI controller.
- Add NAND controller.
- Add USBH PHY controller.
- Add RNG controller.
- Add cfi-flash controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6368.dtsi | 127 ++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index 4837b1436714..fc15e200877d 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -28,16 +28,20 @@
 	};
 
 	clocks {
-		periph_clk: periph-clk {
+		periph_osc: periph-osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <50000000>;
+			clock-output-names = "periph";
 		};
 	};
 
 	aliases {
+		nflash = &nflash;
+		pflash = &pflash;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		spi0 = &lsspi;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -55,23 +59,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		clkctl: clock-controller@10000004 {
+		periph_clk: clock-controller@10000004 {
 			compatible = "brcm,bcm6368-clocks";
 			reg = <0x10000004 0x4>;
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@100000008 {
+		pll_cntl: syscon@100000008 {
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
@@ -92,31 +95,88 @@
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
 		leds0: led-controller@100000d0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "brcm,bcm6358-leds";
 			reg = <0x100000d0 0x8>;
+
 			status = "disabled";
 		};
 
 		uart0: serial@10000100 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000100 0x18>;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <2>;
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
 			interrupts = <3>;
-			clocks = <&periph_clk>;
+
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
+
+			status = "disabled";
+		};
+
+		nflash: nand@10000200 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm6368",
+				     "brcm,brcmnand-v2.1",
+				     "brcm,brcmnand";
+			reg = <0x10000200 0x180>,
+			      <0x10000600 0x200>,
+			      <0x10000070 0x10>;
+			reg-names = "nand",
+				    "nand-cache",
+				    "nand-int-base";
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <10>;
+
+			clocks = <&periph_clk BCM6368_CLK_NAND>;
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
+			interrupts = <1>;
+
+			clocks = <&periph_clk BCM6368_CLK_SPI>;
+			clock-names = "spi";
+
+			resets = <&periph_rst BCM6368_RST_SPI>;
+			reset-names = "spi";
+
 			status = "disabled";
 		};
 
@@ -124,8 +184,13 @@
 			compatible = "brcm,bcm6368-ehci", "generic-ehci";
 			reg = <0x10001500 0x100>;
 			big-endian;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <7>;
+
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
 			status = "disabled";
 		};
 
@@ -134,9 +199,49 @@
 			reg = <0x10001600 0x100>;
 			big-endian;
 			no-big-frame-no;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <5>;
+
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
+			status = "disabled";
+		};
+
+		usbh: usb-phy@10001700 {
+			compatible = "brcm,bcm6368-usbh-phy";
+			reg = <0x10001700 0x38>;
+			#phy-cells = <1>;
+
+			clocks = <&periph_clk BCM6368_CLK_USBH>;
+			clock-names = "usbh";
+
+			resets = <&periph_rst BCM6368_RST_USBH>;
+			reset-names = "usbh";
+
 			status = "disabled";
 		};
+
+		random: rng@10004180 {
+			compatible = "brcm,bcm6368-rng";
+			reg = <0x10004180 0x14>;
+
+			clocks = <&periph_clk BCM6368_CLK_IPSEC>;
+			clock-names = "ipsec";
+
+			resets = <&periph_rst BCM6368_RST_IPSEC>;
+			reset-names = "ipsec";
+		};
+	};
+
+	pflash: nor@18000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "cfi-flash";
+		reg = <0x18000000 0x2000000>;
+		bank-width = <2>;
+
+		status = "disabled";
 	};
 };
-- 
2.20.1

