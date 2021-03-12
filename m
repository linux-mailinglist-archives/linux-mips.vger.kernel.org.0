Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B33338FC5
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 15:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhCLOWq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 09:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhCLOW0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Mar 2021 09:22:26 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF23CC061574;
        Fri, 12 Mar 2021 06:22:25 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v4so1869999wrp.13;
        Fri, 12 Mar 2021 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+hYBdQtD1kvHY3itnyV4r/pAOywMq3KjiiJrNDj4dt8=;
        b=pppS/qVUSnEY4MY262cIQ8T5gm8QsBc+E6QBbUrw2NYYp29gVTFpdFAyvkUgV+Hz7b
         8RjUw4oPoGpe1X7s+Wpn8+9q823QlGQg+QFtSKInmww3nweVODJw+7JI6bHBreUQeMcc
         MzRs8+dabQgerv1l1z/v4s+V8LS0tSdjEr83SUdWv0RNFPcueodOeGQznM8L7W3SsxH2
         YzEw40dqaapjTjz7krIfyLUz0FEgp0u8tQymdgn0kgjKswT/9zjuklKfnobwQCgc9QOl
         fngd6LUeuFHFRQ0+Z+QMI32RL7ZbLu7+vEIMFkZAEw6kdpV8RoSZDw/Vi5Qz7J1K7CrP
         +wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+hYBdQtD1kvHY3itnyV4r/pAOywMq3KjiiJrNDj4dt8=;
        b=bzmyVNA7aGujNzvW6cCrNpA/sotRmHPFlVHyjaBWu+njDKUdnGhcbdz4helT/PQvnS
         KNH+Xrfvt/vE86l0BGMT2O+g98SvI3aLHn5RBRNeSeJNxBMD2Wt06EmrZ08Bf0H54ssm
         Um79p86dvDDOci8yrTrmD70aZ3XHjmJ032bAdtb5uSccON1vDFix8AzHvdzIHECz6XXs
         oMuU2VUkMns60G+RK4YgPgZdh2RpaROcexHvr+n9ZNOx5NAawl1AcpliktQ0PqaBiP9K
         fP0VUYoTzQBw+7UjUH8xiC5NV7HGK3CNTa6V1Hr9SdQm8UO4QeyC0Hhj+Jy3mkgHHzJO
         jk4Q==
X-Gm-Message-State: AOAM532OYzOcJuiurLSiacc6n026Nb9cR/wmC43GtIIaqzhFO2WjEERn
        iZvRT7fd0TbWykUK9UzwAJQ=
X-Google-Smtp-Source: ABdhPJyiJ3JllaWBfhjuuWB1hp0JIHrff1mpxj6hNYsNQxiAPrW2S0YXI3Xl/d9tY+/GbAcRjLaLtQ==
X-Received: by 2002:adf:a302:: with SMTP id c2mr14251966wrb.212.1615558944564;
        Fri, 12 Mar 2021 06:22:24 -0800 (PST)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id w6sm8235644wrl.49.2021.03.12.06.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:22:24 -0800 (PST)
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
Subject: [PATCH] mips: bmips: fix and improve reboot nodes
Date:   Fri, 12 Mar 2021 15:22:22 +0100
Message-Id: <20210312142222.29643-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit a23c4134955e added the clock controller nodes, incorrectly changing the
syscon reboot nodes addresses.

- Fix syscon reboot nodes addresses (commit a23c4134955e added the clock
controller nodes, incorrectly changing the syscon reboot nodes addresses).
- Rename periph_cntl to pll_cntl and timer_cntl to soft_reset (bcm6328).
- Make syscon-reboot nodes childs of the syscon node, so that we no longer
need a phandle.

Fixes: a23c4134955e ("MIPS: BMIPS: add clock controller nodes")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm3368.dtsi  | 15 +++++++--------
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 15 +++++++--------
 arch/mips/boot/dts/brcm/bcm6328.dtsi  | 15 +++++++--------
 arch/mips/boot/dts/brcm/bcm6358.dtsi  | 15 +++++++--------
 arch/mips/boot/dts/brcm/bcm6362.dtsi  | 15 +++++++--------
 arch/mips/boot/dts/brcm/bcm6368.dtsi  | 15 +++++++--------
 6 files changed, 42 insertions(+), 48 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/brcm/bcm3368.dtsi
index db7e801dad55..8842ce221582 100644
--- a/arch/mips/boot/dts/brcm/bcm3368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -60,17 +60,16 @@
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@fff8c008 {
+		pll_cntl: syscon@fff8c008 {
 			compatible = "syscon";
-			reg = <0xfff8c000 0x4>;
+			reg = <0xfff8c008 0x4>;
 			native-endian;
-		};
 
-		reboot: syscon-reboot@fff8c008 {
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
 
 		periph_intc: interrupt-controller@fff8c00c {
diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index 575c9d3eb4c8..fabee40a3bd1 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -62,17 +62,16 @@
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@10000008 {
+		pll_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0xc>;
+			reg = <0x10000008 0x4>;
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
diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/brcm/bcm6328.dtsi
index fe93f2692281..393751aa3b0b 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -100,17 +100,16 @@
 			status = "disabled";
 		};
 
-		timer: syscon@10000040 {
+		soft_reset: syscon@10000068 {
 			compatible = "syscon";
-			reg = <0x10000040 0x2c>;
+			reg = <0x10000068 0x4>;
 			native-endian;
-		};
 
-		reboot: syscon-reboot@10000068 {
-			compatible = "syscon-reboot";
-			regmap = <&timer>;
-			offset = <0x28>;
-			mask = <0x1>;
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				mask = <0x1>;
+			};
 		};
 
 		leds0: led-controller@10000800 {
diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/brcm/bcm6358.dtsi
index f8753becc164..8c2cb80c5b20 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -61,17 +61,16 @@
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@fffe0008 {
+		pll_cntl: syscon@fffe0008 {
 			compatible = "syscon";
-			reg = <0xfffe0000 0x4>;
+			reg = <0xfffe0008 0x4>;
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
diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index a2dbbf062cd8..1c42cbc654e4 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -62,17 +62,16 @@
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@10000008 {
+		pll_cntl: syscon@10000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0xc>;
+			reg = <0x10000008 0x4>;
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
diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/brcm/bcm6368.dtsi
index c4eb4b67ecbd..166dfb54f9aa 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -61,17 +61,16 @@
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@100000008 {
+		pll_cntl: syscon@100000008 {
 			compatible = "syscon";
-			reg = <0x10000000 0xc>;
+			reg = <0x10000008 0x4>;
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
-- 
2.20.1

