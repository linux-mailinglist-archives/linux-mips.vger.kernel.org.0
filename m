Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4CBC33A66F
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234580AbhCNQfc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbhCNQex (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:34:53 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5991C061574;
        Sun, 14 Mar 2021 09:34:51 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id g25so6721887wmh.0;
        Sun, 14 Mar 2021 09:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mVOZaCx8DEtNn99HLWoL7tuZLw1L8TaYhsCI+LeWDX0=;
        b=bIds6aiFDK2J0SMqCKgGoJPJia8bIilg9c3eLHeo2/t68d5KxRIy5wfF3+uYjm42Ty
         U4AE8eT6QEyMwWaasvm9uKYmZleQJ8MM/2vdT+j9BGaAGpE6q4XZY6DfYAxZB3D0WQad
         hKEH/HMW4tVyZHVE+HlRjI1Te2cQ/u81k6KRuZZJ/sAgcb+WPcNatwUw4gfdbRc6NvB6
         gTgfWtXqdQcjflKYkYNuOeEiTi856etvsE2ioVsuPfK3RCXScpR/5agbHVYj3STed+3a
         TmhUIQKwz/msevGzfU78L6mGIobn5GBUPt59VFnFlJpbCHXUomQ2LHuqh3Zw7Se7xzIQ
         xRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVOZaCx8DEtNn99HLWoL7tuZLw1L8TaYhsCI+LeWDX0=;
        b=fL6MFlr4EW+F8p2u0YLVWoIIfSPVdUt6cLpR4h1WXdJ7scHtzXM70+xdGgzBPb2EKZ
         LbNlbgPZLQjk+pSzqqvosZHjsDQmt9LQTShGDrFd93qnJ1XIXwGJcF0g7aeDhqsb2KuT
         8pAmvT22MeRwGmt77Ys48bULz7BIlzFMhwC6DAv9PWMigkCdmrw+Iq5vUy6z13YACzCn
         dYgstmHCZmRAZwZpY4XTOVIKSgaxwffmVtYlZIJyQxu0Srqu+so1+/PGL42Bep+L6DJH
         hbOX76CcBOvF/Q97kJfMp+fORx30VhXHRuSRNnnTXnMtyoS8TY2wxjZGrKxrkbfo6EiO
         LEcg==
X-Gm-Message-State: AOAM530cRI6VDSAM6cDCTPkVaj5JpgE6Nk1oGWl0kVifPb7gA4TivvlY
        2gX1Ch3+ZsNHoEwxwxmioMc=
X-Google-Smtp-Source: ABdhPJxHUVhUZ+4hD9GrKNFOG/ygDXMV76TqtwR4CA+mxKpRRln6eOn9Q2n0wr3glYSrL3h9k+NW7w==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr22679695wmk.184.1615739690633;
        Sun, 14 Mar 2021 09:34:50 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id h62sm10547804wmf.37.2021.03.14.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:34:50 -0700 (PDT)
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
Subject: [PATCH 3/5] mips: bmips: bcm6358: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:34:43 +0100
Message-Id: <20210314163445.6976-4-noltari@gmail.com>
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
- Add watchdog.
- Add SPI controller.
- Add USBH PHY.
- Add cfi-flash.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
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

