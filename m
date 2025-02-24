Return-Path: <linux-mips+bounces-7910-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C21A414C4
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 06:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C40493A6D10
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2025 05:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47293126F0A;
	Mon, 24 Feb 2025 05:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BK1EBv8n"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A14A1D;
	Mon, 24 Feb 2025 05:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740375254; cv=none; b=ZgdfJl1u2xE++OWjBUL0/ddN8ItDo2x7NdfxhzEGamavTIqU9pcO0xgrxYu5O49gdfBHjMyu7sjW7IgOhxhu77+K/98nUTN/h6wVar7gFlKetIphES3UlY/3zEYGs6hZ1vwrkVAfKTIOiuC5UAUYetxOk2SI9m2X40yyymI2Lh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740375254; c=relaxed/simple;
	bh=o0mNt8DLxtw07fV1+vosL8V0dTtj2M4jY53u1buWuVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DFwP85BgQAbgiMvxwTvEiA8vV2mzoK4Q3LxWXCmmxoqkRZAsCQNp7mFuyjujba8NOzWtupOYXoAota2BitusLzLBiuIUW3S4eou0qcD6DEaM6uqYE22Dcgz1rKb8h0Jwifqj/6/aAF+iPaTXOxvnjxI8Ji83nHlvNbjcUARubU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK1EBv8n; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4399deda38cso23251495e9.1;
        Sun, 23 Feb 2025 21:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740375250; x=1740980050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hovVMzLzvLv50Bh+e9VDe4ZEqsDfzzqLzPF1Hj3K1cE=;
        b=BK1EBv8nmWcdHJD/TXJpd8nN6UI2Ak7RPkD/3FTWnCyTy92JCcWl4DsPytbz5J4p7k
         +STUsxMFSd0HtXgEfBK1jcA/NIPX8ueLbfsTaXxEFbM2ex0qULq69EufhDTHekWiPx9l
         d6BmHXfru5GL50/5IGnxre9p+tGChC4UAQNHG62AagP79h4NjkD+qL91AtwFsn2NTL1L
         BUnFz4rzW0e1YtU07FlMNP1EYGfE41ek5lnNvq6aM6tUpe3CFT3Sdr8Yc+EWAII9gaUi
         RL9zkcT3h0fyu/ieDJIHdG9QYL4n2FrHN7sEcgwjsYuCNSFTL/VhMbKb5LJ72n6gZlEI
         XbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740375250; x=1740980050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hovVMzLzvLv50Bh+e9VDe4ZEqsDfzzqLzPF1Hj3K1cE=;
        b=SG3OgCvuOAjVsPf4Wg86gSFrHJi0QVcMD/EgQ9V7K1lG55KtnyLMGIqvl/1E6k8hM5
         cE6AtmspPL/JZ8lJuKoGs6076FsehofqQQhbMTsPxBJeKn73sr171i3ZwJSrJzvNzR8c
         bWQO0JBxI0nIHUTNeYRaAzFxFB5yXYyOjfhYBSDgOScMcNREDY/2GrXnHQrE6AVvo38s
         1ILo3i2+qZVx84TDedrUq7rAygRtxRsmlHfiv5T0pK/sLGY0ke7b1dsEIWOo+low+8WY
         CZxvYfB9XLzzjE3SzMQsC0wgIZuS0jjlCnurF74n9cVtmt4KSnZ/Svhwjdgfd3PZnMKi
         Cj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiXR0xlWbEnWg3bQCDzOWXjdYsiA4aBUU5OUC+/cMhldI0W5XZ/b17HqDgQxDAfthd4++TC9FzggAYPMRN@vger.kernel.org, AJvYcCVnvGbgPSWtU+i8eTeipB9Vn+fwO4ytYyWdrx0FF5ODKlpDBxyPpaNlYXbKLij29MEHQvO7qJ7I307Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyVT/aP/J/qTKkkr5w8WnalObBUiwcsbTpVHlYqZYLFXlsDh/kE
	C+oUYJjgggVuTdKbyFyL4ZI02z6cFnNAZ1vE5YqcU6h7RmRIkO93EKRngg==
X-Gm-Gg: ASbGncupEvGlufOOLvky9Fdv/sZXSZoNcHEjG+s1OkRwEyq0KmicZ0hnpTP774okY4U
	8OBN+dKroyNowKAqcykhBiyywt67NQtD6aL5KW3j0SUWJ7DWIBgZcDlA4Idg7+wXcC2iPSPqoUA
	/DmfZELOvoFsiWU94Rm6QAepHkXGCNma6xgMob4tuYrHskalAmEia1bgZ0J9/HiTsoe9wS9IQ08
	sSrXLcvT0nWc8hm8ulUZxzQhIJYse/a0/30x6V26KiwbHsPiqYQArQipJqunMdp80zRNVmHZDAe
	v5EknePVd858xUCYpNgcWEkH+gE4+PtCUJJFyVj2oCUP0bYMNyuJh/5f5D/bKNP0TAWl2MHlgi4
	nFjFKLYgnEQIeVVOu
X-Google-Smtp-Source: AGHT+IEQTu/rmtnoSlqIIUihb2tMIDfl2UQ8f9IYf/tsrTRuzsDJxc+1QdJsEUMs77i493Pzo2FwgQ==
X-Received: by 2002:a05:600c:3513:b0:439:8a8c:d3d8 with SMTP id 5b1f17b1804b1-439ae21d3e1mr85818965e9.29.1740375250069;
        Sun, 23 Feb 2025 21:34:10 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce735sm95101525e9.3.2025.02.23.21.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 21:34:09 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-mips@vger.kernel.org
Cc: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	harveyhuntnexus@gmail.com,
	devicetree@vger.kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] mips: dts: ralink: mt7628a: update system controller node and its consumers
Date: Mon, 24 Feb 2025 06:34:11 +0100
Message-Id: <20250224053411.924015-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current MT7628A device tree file system controller node is wrong since it is
not matching bindings. Hence, update it to match current bindings updating
it also to use new introduced clock constants.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Hi Thomas,

This is the missing patch to be applied in the series [0] because of some
build errors.

Changes in v4:
- update syntax in mail file from /include/ to #include.
- Fix build errors in 'usb-phy' node.

Thanks a lot.

Best regards,
    Sergio Paracuellos

[0]: https://lore.kernel.org/linux-mips/CAMhs-H-8N766PMZMwmV8B3e=65pPZHA4ntnRWDMoqR-U_xULfA@mail.gmail.com/T/#mab23157e03609456bb59d3b5dfc71fe16359a419

 .../ralink/gardena_smart_gateway_mt7688.dts   |  2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi        | 40 ++++++++++++-------
 arch/mips/boot/dts/ralink/omega2p.dts         |  2 +-
 3 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
index 18107ca0a06b..7743d014631a 100644
--- a/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
+++ b/arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-/include/ "mt7628a.dtsi"
+#include "mt7628a.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 45a15e005cc4..0212700c4fb4 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
 
 / {
 	#address-cells = <1>;
@@ -16,11 +17,6 @@ cpu@0 {
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
@@ -36,9 +32,11 @@ palmbus@10000000 {
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
@@ -138,7 +136,7 @@ watchdog: watchdog@100 {
 			compatible = "mediatek,mt7621-wdt";
 			reg = <0x100 0x30>;
 
-			resets = <&resetc 8>;
+			resets = <&sysc 8>;
 			reset-names = "wdt";
 
 			interrupt-parent = <&intc>;
@@ -154,7 +152,7 @@ intc: interrupt-controller@200 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			resets = <&resetc 9>;
+			resets = <&sysc 9>;
 			reset-names = "intc";
 
 			interrupt-parent = <&cpuintc>;
@@ -190,7 +188,9 @@ spi: spi@b00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_spi_spi>;
 
-			resets = <&resetc 18>;
+			clocks = <&sysc MT76X8_CLK_SPI1>;
+
+			resets = <&sysc 18>;
 			reset-names = "spi";
 
 			#address-cells = <1>;
@@ -206,7 +206,9 @@ i2c: i2c@900 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_i2c_i2c>;
 
-			resets = <&resetc 16>;
+			clocks = <&sysc MT76X8_CLK_I2C>;
+
+			resets = <&sysc 16>;
 			reset-names = "i2c";
 
 			#address-cells = <1>;
@@ -222,7 +224,9 @@ uart0: uartlite@c00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_uart0_uart>;
 
-			resets = <&resetc 12>;
+			clocks = <&sysc MT76X8_CLK_UART0>;
+
+			resets = <&sysc 12>;
 			reset-names = "uart0";
 
 			interrupt-parent = <&intc>;
@@ -238,7 +242,9 @@ uart1: uart1@d00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_uart1_uart>;
 
-			resets = <&resetc 19>;
+			clocks = <&sysc MT76X8_CLK_UART1>;
+
+			resets = <&sysc 19>;
 			reset-names = "uart1";
 
 			interrupt-parent = <&intc>;
@@ -254,7 +260,9 @@ uart2: uart2@e00 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinmux_uart2_uart>;
 
-			resets = <&resetc 20>;
+			clocks = <&sysc MT76X8_CLK_UART2>;
+
+			resets = <&sysc 20>;
 			reset-names = "uart2";
 
 			interrupt-parent = <&intc>;
@@ -271,7 +279,7 @@ usb_phy: usb-phy@10120000 {
 		#phy-cells = <0>;
 
 		ralink,sysctl = <&sysc>;
-		resets = <&resetc 22 &resetc 25>;
+		resets = <&sysc 22 &sysc 25>;
 		reset-names = "host", "device";
 	};
 
@@ -290,6 +298,8 @@ wmac: wmac@10300000 {
 		compatible = "mediatek,mt7628-wmac";
 		reg = <0x10300000 0x100000>;
 
+		clocks = <&sysc MT76X8_CLK_WMAC>;
+
 		interrupt-parent = <&cpuintc>;
 		interrupts = <6>;
 
diff --git a/arch/mips/boot/dts/ralink/omega2p.dts b/arch/mips/boot/dts/ralink/omega2p.dts
index 5884fd48f59a..51a40ab6df2b 100644
--- a/arch/mips/boot/dts/ralink/omega2p.dts
+++ b/arch/mips/boot/dts/ralink/omega2p.dts
@@ -1,6 +1,6 @@
 /dts-v1/;
 
-/include/ "mt7628a.dtsi"
+#include "mt7628a.dtsi"
 
 / {
 	compatible = "onion,omega2+", "ralink,mt7688a-soc", "ralink,mt7628a-soc";
-- 
2.25.1


