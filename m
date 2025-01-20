Return-Path: <linux-mips+bounces-7546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA54FA16952
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44133A77E0
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDCF1BC09A;
	Mon, 20 Jan 2025 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ+HzOp3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8441B87D5;
	Mon, 20 Jan 2025 09:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364924; cv=none; b=mSEBkT5thv5ceF2+jzEFFmUXAeIO/NTurGFeg6xmQy1pMMm0XM8JRbvYJ8LFoY830FQHzNRl1H01/Ug5pL3FUiver+CSeY2V/NxC7Q+dowWcCt/h2XA7K1BO0X4OhvfdD8E0TVGBZuuNpFD4uvTfgLh1P/WwvaOJ5NTj3WrkHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364924; c=relaxed/simple;
	bh=0Ib6CCZCXGLLnxvNMqthiY5L7ImeJqbIkZLt8Kg4k+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rygq/FNDL9ET9brmoljv1wDvTX5w+rdNQZ9wUDRbYKBJVEb3C3nHNNP5NDifTTyEhEz0kPGUGXDAp0gCaMWrgLl7coPY8sH/wfjR1kdPCKc3e4xKSlDhPEQ/9T3y1hHsVDBDPGpUyCjQjGDolmFMO2UkiOryoMx0w4Lpv9C/r+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ+HzOp3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso28618025e9.3;
        Mon, 20 Jan 2025 01:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364920; x=1737969720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SYOrmjXULZWrV3aYpbPZPuiNow+yUL2z22OQoOzio8=;
        b=aJ+HzOp3CFwDNKkMfO2d78qzEMg8pU2hzQiTEYMTEGW2ZLKJp3nSTbIZpS0gEhrZBk
         hn73Y5Qr//QpkqX6/YLmJey0wpqIW7AqSzhVyj3a2UeAWNobhjL/goWNQUg66w8f3ik2
         lKwfAmJbPe60HrnXogAFi7Unol9QM3SkoasanYshmJ8VYC7WAip1dOihoX2TwTz2NcIU
         PWmdKKeB+CPmzSnMOzncF7PLCsrdGSStlTlPdQtaPgJ61LWWHP9lfifBXA4GsdSyVEFO
         NVDFOlL3nxhv4Z1JU5Dw9LKG4k7mq+9lMtmzD+KhhH3llEfyM1eCehCkp9DR/dbjdgfV
         Vh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364920; x=1737969720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SYOrmjXULZWrV3aYpbPZPuiNow+yUL2z22OQoOzio8=;
        b=GRiAdApbNYYQEMBMvJkoMHR2FThBPaLHKENymggMuCpQeRzVvB0PlY1ddfX1Yw2AON
         6xoN0N9gvWO+++TR5qGro0Z2+ZydMhwgOdtkp/EaNdo8o351QnLFdSMsKUd9i7Y8M/ML
         7MbZ3sKWFa18XLDWxu6nV635wXY8xqizAdPyu4JUuyKLoAgo4NHsTSJphQmTbeFDgFUw
         ZYvC9CwXtdTtC/SpIDyZTFIrMEKS3FeRX/utUxfVw5pbhgOe5tnQg8SJ0W0oZ3Cdrde5
         +8Elf6fusg5Jv/yCxvYZ0N0xhy/dNJ8Ti1fr41Lo4leMN+Y1antDxRoHwXfSee8Q+msH
         OnCg==
X-Forwarded-Encrypted: i=1; AJvYcCV1bC0U/54yugQU2oa454XWgRykgKd7F7vcL0A7vI3NIyZm5y3FckteezomkA6aG5rIqbiqPA2Vc9TJ7FvR@vger.kernel.org, AJvYcCVgLxgT6QsczGET7Y9djr8NsCJhP1LCVMkVVr+d9IAhISz5ue9mCNsk8zCSiv+unC46npcGSpgHc8lG@vger.kernel.org, AJvYcCX0QW3htkDZ18KC4vZMURC7ndSZ41lDXOwnEFHgIbduwt59XkfQ/vEQ2t3lt7YItvRjpbTSiaHx4gdcqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqxevh/i66oNaxMPIOwy42ZKMA5ciLY//z7v0iCqzSn60KnfkT
	FXSlvPW06rEzq8kND2MDferqBkVIrDVGovclKqpLY+v2uAtKG90DD3TRtA==
X-Gm-Gg: ASbGncvoK+j5ALb2ZcdzNO2fd7zV6Gfv/Wa/EDtyq+O2HXENni7u0xrFACDP26Pc+/o
	df0r5CUbN2iFEFxdMs6Pzp2fWeZgrBgR368mdY8waVzlbF+AuyOyJIH3/XPPUz8sU3+luWU/Ye7
	WH6F3kBzawSkMUyDzgznWaJY+aLIMGEouccuJakqyN1L7SOwpx5miDAe6n4ca/NZh0nLxnaWXW0
	sSRTOBnDFaAl/B72IvwjvL0QZFNJY5pQpDQiCnn3Vl1f1T1uqg667hGSEZJbYTW4tovse09Yiec
	/SoCjPaxE5/awcmp/MahoJV1JWRkcYXYI4S8pUmwFTJhce2Zk0MmfbtMVW3C
X-Google-Smtp-Source: AGHT+IHesuI++LiyfBLPMict7L94Ay4gDQBJEaEzfY+4QdPcPx0zi/sAUAqEQhwYiVXRVfds4GFb3g==
X-Received: by 2002:a05:600c:46cb:b0:434:f1e9:afb3 with SMTP id 5b1f17b1804b1-438913bea88mr108869335e9.3.1737364920277;
        Mon, 20 Jan 2025 01:22:00 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1ec39a3sm80680175e9.16.2025.01.20.01.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:21:59 -0800 (PST)
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
Subject: [PATCH v3 6/6] mips: dts: ralink: mt7628a: update system controller node and its consumers
Date: Mon, 20 Jan 2025 10:21:46 +0100
Message-Id: <20250120092146.471951-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
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
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 38 ++++++++++++++++----------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 45a15e005cc4..309966049c56 100644
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
@@ -290,6 +298,8 @@ wmac: wmac@10300000 {
 		compatible = "mediatek,mt7628-wmac";
 		reg = <0x10300000 0x100000>;
 
+		clocks = <&sysc MT76X8_CLK_WMAC>;
+
 		interrupt-parent = <&cpuintc>;
 		interrupts = <6>;
 
-- 
2.25.1


