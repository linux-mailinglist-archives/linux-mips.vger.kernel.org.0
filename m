Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E69B33A6C3
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbhCNQoZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbhCNQoB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:44:01 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999FEC061762;
        Sun, 14 Mar 2021 09:43:59 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v4so4495142wrp.13;
        Sun, 14 Mar 2021 09:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WF00a8+WYL0JjC2ZtT3YIRiHSqlksYijHnc2IiCkLaw=;
        b=KHdfBbe1GQuiZZ5ZIjgFmW6soBHYi/dfMaqtFwdg5o+s1Tb+M68Mi5ngO9r+hWbGhr
         ioTlHjceSL8Ar6R03/ZBDclye8LJE+ZIih+DOv6nYpUcI3w6z+bizOiyoDm1k5pt4TEB
         y9Kkks72KrGH8RVBr+LAQzGvy86+Mz1x1sBR9vVBx7TBcGb2serlMXisKIMwgthY8x3Y
         o3b5cIUOkyeHj5ky0JWY411Yjo1m9r9V2LNubgqJAiIRgJ0rdW51uNXr13iYHmkmrZ/8
         TmLZFUxS33y/jytw/OiWNOQ7RfZhndOoH1se/T3CMLho90KbSM2QYsZb83aY6ZMa2iD6
         HnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WF00a8+WYL0JjC2ZtT3YIRiHSqlksYijHnc2IiCkLaw=;
        b=jOY8hqO36ikGwACaw09PFydL2lDL7MmrvfEhWgSidx2tztIH/yRhQ+wfqVMy3X2lS8
         2OyVo0zMpUOW8VKpn4OCO268binTCPFNeJGhGXJ2kz5MhO14ZJMSMrlSANXRKSrTkhQp
         CeqKkCrlPcZ4LGNCR/YQfH+QZCp5h8md1tQM5GHXNTU/2fGqGEraea0sx5RbUqMo5GnN
         JFMUdO+sGY9/fTKPzfFYOh0vt9sSiQi8XnvWhMVAXzM0PF+NXTP5fajE+fdaMSI9yb0o
         ULE/Egk0v5X586YgZ0di5NIueIalTFe5BVctdlrPZBIWzMjtqDXGnVcpervvqbfiW834
         ZhoQ==
X-Gm-Message-State: AOAM532siX4jTTe7cTb8oG2+/wDUnoLqXPPXf2Fl4+gVhpbh/R2LSrtU
        A//H6Dz5zi8taWaP1Ohho6Ikj9BH/Tygnw==
X-Google-Smtp-Source: ABdhPJzwrvDCMfXyI6wFYGMeEQT2aGzBltkiSttzG9IvQeO1NJrN9ZsEHWfvbGHyN1ib75KBz+3OXg==
X-Received: by 2002:adf:c752:: with SMTP id b18mr23305740wrh.233.1615740238282;
        Sun, 14 Mar 2021 09:43:58 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a12sm15146071wrx.5.2021.03.14.09.43.57
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
Subject: [PATCH v2 5/6] mips: bmips: bcm6368: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:43:50 +0100
Message-Id: <20210314164351.24665-6-noltari@gmail.com>
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
- Add watchdog controller.
- Add SPI controller.
- Add NAND controller.
- Add USBH PHY controller.
- Add RNG controller.
- Add cfi-flash controller.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes

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

