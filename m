Return-Path: <linux-mips+bounces-7468-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D183A1278E
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 16:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619C816255B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 15:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126C31AB50C;
	Wed, 15 Jan 2025 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnh2OOMr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C061991A8;
	Wed, 15 Jan 2025 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955035; cv=none; b=dfD/et06IJ/xT1s31XQXk3fCaaTTjwIMwmcLjlp46k121dC9cwz1lyvYmGyMLpnnUq9VHBYcT8oN2Hoe6fVX1NhcmEG4s4caWUn9Zdso2J0S13B6OzYhjU/n53n5dtwfVAiaOWqyhRmr3umCpv22DJRz2C+83mnl6ErxHRhbc9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955035; c=relaxed/simple;
	bh=VJCMQ3LdytF99k+ZjaqHTO9vURJBmWDtrFvLagS9m6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QV7LzxFwgoWsTG+1+Fp0etvbh4yOS1nbSAFLoJjpYozEE+qG7xUqnQmtmv2pdN6NGmwhbXV4k2piSYS9tH2b38dVQDZylkbOrp837Ta/GWVU+oM1RRcsKRrlMFM8L4KIlgloTxDsFzxzd9ADiL93qs8/Sm5wppfOfxqHS6Y3Dm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnh2OOMr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f796586so72636215e9.3;
        Wed, 15 Jan 2025 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955030; x=1737559830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhsHMzC9Z/DuOqJyrMa8rNmS3dp3ki/KF11rGLRbkUc=;
        b=Fnh2OOMrjC2OdIN6S5u45XSM0NH+6hS6gsXFQQZ5999WAed7sn7ERHzYlJJWWRxv0v
         6cl2RYST0rb5kZpv69NiEVIZv94WIX6S/KCeuR+8vGzupsNzg97BH6WtPd5hvtLX8MNv
         2px3r+CBcseT+mE7bxPeLCy0DdTcjJ1GPhSzQ02yzVnpJ4YwTcMGLEglUOrVrQBXO6E2
         KokDLox2dj/TPHE8mMlP3CAZ/RNnPHt9QZ7VpMHI0zh+RbnJguq5dRWjO/sQrBlWQ6uW
         maLYLlV8zTLIyRRhw+FyNkw4oF8CKxOC15r8sRQqdazaoVJW9KzqcUhx6gjVyeh105Pc
         XgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955030; x=1737559830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhsHMzC9Z/DuOqJyrMa8rNmS3dp3ki/KF11rGLRbkUc=;
        b=r9zC7SNRCsQ7vTDZA+vb+ZqyTjMCfebGJFaMxEd7Pnuooug3IDHYecK6Sob2zSNt37
         dUuYXLLRiyQ4x4amXBIdIyDluqSsIl08+gbOGdVM7/gB24Y7BXH2CUfDR38CgVAzxWNJ
         ELO3NLSpsRcBjOBSYlKa09dCihFXPMDY0nWxAb5OOC9FBH1xIYoDYS+7fqKhv1dpL2WO
         AYmPvbWTRlnJp2YZYveKpFikKrZnhGE9ebxAFGQQnBIRoBJH+vq65hsZ0WMg2JLH/aV5
         9+c5GrjeD9J1t7WiSk2+YMEy6mlVO4xYY8NkhkPWe3W4cLySMuiexYBo4qGam5sclxV3
         hcvg==
X-Forwarded-Encrypted: i=1; AJvYcCVKcKCHuBNxbY+HLWbh3NVXxcKe0Ppld0199KXyFr+tAL2QE6kjupiUiCeE0Yv2Nyzd/76F+NAbVQEzDayR@vger.kernel.org, AJvYcCVnH0MPQejQ6pE7F5zND6B4CIgl2Jji/L1M4qNz3JHAEKrWUYIFxzKu+ZuWcl5Qt7Fz5EtXQY+OP6ZK@vger.kernel.org, AJvYcCXBy86WqGa3Sn96Nj71Qq5uT/7xUuHPvheAhgUd9EGWU/cHyeotMLvvZIGEzPdE1RIHCnM6VHYPaYgSGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykGxvV28j7xa1BrMUAynB1GMjJlaDVCBGZNCehC1IhcwehaPve
	awlUfVwo7lNYe0maNX9hcw19oYbGf7jT4HX+tcjUT7tCgB9NWjFX00DZ9g==
X-Gm-Gg: ASbGncvUZ0De7r1RO85GFPzf8Mwjw2gJnWIOoNKtWLI4AkvI28gAz8667RV4vcoOerf
	o1KitC4zIpGDm7og1omnyxLSnc2fjDMXh16S6SFoGDzPNOLr7XFpjCOQ/pgS9e/C/UpGeOrJumt
	S/axqxNtBtzHvM8imD/FwCgMSX7iUDq9MGOGo8OVtQEpTHeIACs3E5R8mbD5dJmDBzwPc0UW7NZ
	xz2Dp72GRmdCQMXD1D0J9VudE6C+t+8q2/D4ljeFSlImylbA4gz3LOxnUFwaePdkHsljK/ByF6f
	z/552W6rAlxpBi+pVavbYWJr4jLxlMwtdK4AFarlysjAhSw=
X-Google-Smtp-Source: AGHT+IE+vYikpEMKftBd4lyfoB4zEM1zy8GTjJ5yxzV6CkjC5Sb4r/djr0+8ZPKt/7Gwru0f7RctbQ==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436e25548e3mr182538165e9.0.1736955029623;
        Wed, 15 Jan 2025 07:30:29 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm7440771f8f.43.2025.01.15.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:30:29 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] mips: dts: ralink: mt7628a: update system controller node and its consumers
Date: Wed, 15 Jan 2025 16:30:19 +0100
Message-Id: <20250115153019.407646-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
References: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current MT7628A device tree file is out of date and must be merged with real
device tree file used in openWRT project [0]. As a first iteration for this
changes, align the current file with the needed changes for system controller
from '6f3b15586eef ("clk: ralink: add clock and reset driver for MTMIPS SoCs")'.

[0]: https://github.com/openwrt/openwrt/blob/main/target/linux/ramips/dts/mt7628an.dtsi

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 43 ++++++++++++++++----------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 45a15e005cc4..bc69866e2134 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
+#include <dt-bindings/reset/mediatek,mtmips-sysc.h>
 
 / {
 	#address-cells = <1>;
@@ -16,11 +18,6 @@ cpu@0 {
 		};
 	};
 
-	resetc: reset-controller {
-		compatible = "ralink,rt2880-reset";
-		#reset-cells = <1>;
-	};
-
 	cpuintc: interrupt-controller {
 		#address-cells = <0>;
 		#interrupt-cells = <1>;
@@ -36,9 +33,11 @@ palmbus@10000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		sysc: system-controller@0 {
-			compatible = "ralink,mt7620a-sysc", "syscon";
+		sysc: syscon@0 {
+			compatible = "ralink,mt7628-sysc", "syscon";
 			reg = <0x0 0x60>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		pinmux: pinmux@60 {
@@ -138,7 +137,7 @@ watchdog: watchdog@100 {
 			compatible = "mediatek,mt7621-wdt";
 			reg = <0x100 0x30>;
 
-			resets = <&resetc 8>;
+			resets = <&sysc MT76X8_RST_TIMER>;
 			reset-names = "wdt";
 
 			interrupt-parent = <&intc>;
@@ -154,7 +153,7 @@ intc: interrupt-controller@200 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			resets = <&resetc 9>;
+			resets = <&sysc MT76X8_RST_INTC>;
 			reset-names = "intc";
 
 			interrupt-parent = <&cpuintc>;
@@ -190,7 +189,9 @@ spi: spi@b00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_spi_spi>;
 
-			resets = <&resetc 18>;
+			clocks = <&sysc MT76X8_CLK_SPI1>;
+
+			resets = <&sysc MT76X8_RST_SPI>;
 			reset-names = "spi";
 
 			#address-cells = <1>;
@@ -206,7 +207,9 @@ i2c: i2c@900 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_i2c_i2c>;
 
-			resets = <&resetc 16>;
+			clocks = <&sysc MT76X8_CLK_I2C>;
+
+			resets = <&sysc MT76X8_RST_I2C>;
 			reset-names = "i2c";
 
 			#address-cells = <1>;
@@ -222,7 +225,9 @@ uart0: uartlite@c00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_uart0_uart>;
 
-			resets = <&resetc 12>;
+			clocks = <&sysc MT76X8_CLK_UART0>;
+
+			resets = <&sysc MT76X8_RST_UART0>;
 			reset-names = "uart0";
 
 			interrupt-parent = <&intc>;
@@ -238,7 +243,9 @@ uart1: uart1@d00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_uart1_uart>;
 
-			resets = <&resetc 19>;
+			clocks = <&sysc MT76X8_CLK_UART1>;
+
+			resets = <&sysc MT76X8_RST_UART1>;
 			reset-names = "uart1";
 
 			interrupt-parent = <&intc>;
@@ -254,7 +261,9 @@ uart2: uart2@e00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_uart2_uart>;
 
-			resets = <&resetc 20>;
+			clocks = <&sysc MT76X8_CLK_UART2>;
+
+			resets = <&sysc MT76X8_RST_UART2>;
 			reset-names = "uart2";
 
 			interrupt-parent = <&intc>;
@@ -271,8 +280,8 @@ usb_phy: usb-phy@10120000 {
 		#phy-cells = <0>;
 
 		ralink,sysctl = <&sysc>;
-		resets = <&resetc 22 &resetc 25>;
-		reset-names = "host", "device";
+		resets = <&sysc MT76X8_RST_UHST>;
+		reset-names = "host";
 	};
 
 	usb@101c0000 {
@@ -290,6 +299,8 @@ wmac: wmac@10300000 {
 		compatible = "mediatek,mt7628-wmac";
 		reg = <0x10300000 0x100000>;
 
+		clocks = <&sysc MT76X8_CLK_WMAC>;
+
 		interrupt-parent = <&cpuintc>;
 		interrupts = <6>;
 
-- 
2.25.1


