Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED9B33A6BE
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbhCNQoY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbhCNQn6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:43:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E470C061762;
        Sun, 14 Mar 2021 09:43:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x13so4490972wrs.9;
        Sun, 14 Mar 2021 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZfdDGq7NHglSTOCwn9FIa2XbrtUUDl7W+z1y0XhXsZU=;
        b=uKNeErmURbriWBg4evAkVI/oip2CPkIbqqdGCLVzGEk3zdVhA8CKdjFTxUaJYuY5Kd
         jIFTP+McrWB7eM0FrILSlyjiyjgdXWF7AhqmNqLixoc2/66DApK3jS8Tn3Kd/MOSj2NN
         QA10aa7ApyQSaRUUQMFhhpElP0oV52ao3e3PypcpPbDQKrrlxo5hXf3lgD1OgX3L3zFA
         m1/64YGAIZAZDIbo5ax7IaQWuFFUW/qRXq66QXd6TAhVSc0Io46Rek5hPd71KXL2DLCD
         YR6OhngR+YZekunMCMQ3KZMCoUtUB4cEgwEqfY2bK09HxjmJWW11FD4JMYSHCsZaAuim
         PlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZfdDGq7NHglSTOCwn9FIa2XbrtUUDl7W+z1y0XhXsZU=;
        b=H31RbULcFQVZzs2rff/qhvKpKoHRVXuZ31YMNmkl9cRZYxsQQCA45ziJYqUtmm8T2y
         v2ONuwbLnAioq+ibZMlZTE4UOrHXkGd3iKT+mjnn+JblPP3F9UAD+uyj2tO4ALgRJgVU
         mmU07CPgCzCk8TmI82Smx1+hLhYyVjIboa/EXoR3zHTdwTIPBkq7nXam/vI6bX8qyP6F
         MPdt58YpYxUSvmL74IejZRvMnGRF8tCvwkAQ7ePC2215/sBTgVSTGfW76WdLe0yDWZ8F
         Tpadfn1+0HA5uARbNDVHVYxuXGMheUIqowYgBO04gOtyOS1FAeGSiUD0CwZ8G5FIrmjR
         efnQ==
X-Gm-Message-State: AOAM530hV6mYGYJkKHTN9g0HGCxfCTum/qqgdSP05+z2E9ztG6dE7+1y
        GRumaQ9Qt4lztY0/fs9jWrg=
X-Google-Smtp-Source: ABdhPJxh0U7NCucCOG2Pj9hwWlaXwRIrcec5AMy70XMFAjIDFE2i139o112eUPwuh/ZNAaucBde5nA==
X-Received: by 2002:adf:e38f:: with SMTP id e15mr22854697wrm.321.1615740236268;
        Sun, 14 Mar 2021 09:43:56 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a12sm15146071wrx.5.2021.03.14.09.43.55
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
Subject: [PATCH v2 3/6] mips: bmips: bcm6358: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:43:48 +0100
Message-Id: <20210314164351.24665-4-noltari@gmail.com>
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
- Add watchdog.
- Add SPI controller.
- Add USBH PHY.
- Add cfi-flash.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes

 arch/mips/boot/dts/brcm/bcm6358.dtsi | 83 ++++++++++++++++++++++++----
 1 file changed, 72 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index f5549a056bff..777c4379ed03 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -28,16 +28,19 @@
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
+		pflash = &pflash;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		spi0 = &lsspi;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -55,23 +58,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		clkctl: clock-controller@fffe0004 {
+		periph_clk: clock-controller@fffe0004 {
 			compatible = "brcm,bcm6358-clocks";
 			reg = <0xfffe0004 0x4>;
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@fffe0008 {
+		pll_cntl: syscon@fffe0008 {
 			compatible = "syscon";
 			reg = <0xfffe0008 0x4>;
 			native-endian;
-		};
 
-		reboot: syscon-reboot@fffe0008 {
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
 
 		periph_intc: interrupt-controller@fffe000c {
@@ -92,6 +94,16 @@
 			#reset-cells = <1>;
 		};
 
+		wdt: watchdog@fffe005c {
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0xfffe005c 0xc>;
+
+			clocks = <&periph_osc>;
+			clock-names = "refclk";
+
+			timeout-sec = <30>;
+		};
+
 		leds0: led-controller@fffe00d0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -108,7 +120,7 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <2>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
@@ -121,18 +133,41 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <3>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
 		};
 
+		lsspi: spi@fffe0800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm6358-spi";
+			reg = <0xfffe0800 0x70c>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <1>;
+
+			clocks = <&periph_clk BCM6358_CLK_SPI>;
+			clock-names = "spi";
+
+			resets = <&periph_rst BCM6358_RST_SPI>;
+			reset-names = "spi";
+
+			status = "disabled";
+		};
+
 		ehci: usb@fffe1300 {
 			compatible = "brcm,bcm6358-ehci", "generic-ehci";
 			reg = <0xfffe1300 0x100>;
 			big-endian;
+
 			interrupt-parent = <&periph_intc>;
 			interrupts = <10>;
+
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
 			status = "disabled";
 		};
 
@@ -141,9 +176,35 @@
 			reg = <0xfffe1400 0x100>;
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
+		usbh: usb-phy@fffe1500 {
+			compatible = "brcm,bcm6358-usbh-phy";
+			reg = <0xfffe1500 0x38>;
+			#phy-cells = <1>;
+
+			resets = <&periph_rst BCM6358_RST_USBH>;
+			reset-names = "usbh";
+
 			status = "disabled";
 		};
 	};
+
+	pflash: nor@1e000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "cfi-flash";
+		reg = <0x1e000000 0x2000000>;
+		bank-width = <2>;
+
+		status = "disabled";
+	};
 };
-- 
2.20.1

