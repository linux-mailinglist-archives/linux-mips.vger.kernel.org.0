Return-Path: <linux-mips+bounces-7517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E0A162CA
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 16:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BC4F1885E9A
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 15:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5F81E0081;
	Sun, 19 Jan 2025 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VW/IzFF2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC9C1E0084;
	Sun, 19 Jan 2025 15:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301505; cv=none; b=t6OBXXobHpFSc8xgLPxicfKqXFAFnAmsfyDwsagjWtVketvIkFEz1pQ8xSuURY7huqlA/denX3Lprmz0kOyxWVC9PS55VLWLsvgWshM+gVRWW5u5clVQCh4IkJCjEzj6Q1NrzC38hm8Izng2osXYbphTt5R3lILSwPfBo2reZg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301505; c=relaxed/simple;
	bh=IBymv+5TDEmYwyqmdDX890Yd5LAsscouFSa+tmi6vWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mi31NBtRyeQ2F8iow0QcX33ZnlZ8HGj6bHLwfQfEnCfrDVpqQW4ysJegrAF6JHDo/eiedUMI0HhweJ5yg46ZCzDSvNasq+1RKTCj9c2QlBLDkmKzIO2QVd6x/xbTmQ0Z2iXgTnaEhOnIk9V0zzawnDX94eoOI8kHIDD4EZi0p8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VW/IzFF2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso22729035e9.1;
        Sun, 19 Jan 2025 07:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301501; x=1737906301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB2oi9UW0AgG+WyHwVHLYuh2/7vA+ejEkotzlNh3+0A=;
        b=VW/IzFF2Ia/uiYNUuc2wEtrwiY9xLcjuATQKLhmvaxK8/Pm+NwSU0E7oxVsEcs38tS
         TLJDnAbmx/TB7C4nL5/ijZEMpTqXnb/W/STvqufgSHwYx91OdTIqKE8JwSlAmOOjEhra
         dalsbKcAG9/vnuwVf8SSKWzDzSZRwHMbRM20pH4eqD/PvvbkuQ5DJx40J5r+st6hY4t/
         bQXyON8hBq01XvNk8b8Eow9tPk6GQQhRlUdnMrlWMrkbugafAzRjgWvF5CfHOuoByXY6
         GG+Aeu3kd1lTTaVxUEZA4DFDUjNW6IZy75UqPyc8jx1Irhavorx9a5vSN5mLjOExuXip
         hQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301501; x=1737906301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB2oi9UW0AgG+WyHwVHLYuh2/7vA+ejEkotzlNh3+0A=;
        b=li+UXh1+A5MGfZdj4ekwi5N+CCeB7qAg5CrLmkI9ACMm8dwamKjXJYPhi08bTBcnAI
         j9fWryF1jcDIj9ZanCo3W+EczJnaAm75tPyWD8c2RFbXwpUtScNeitSEHqj5dIyXvNil
         13areEOsvBbESR33d3Tf2WtbPyAGZm9/iEBYBxv+Rvn2qrBf5W4Uv2F9yNFHtmdnOZov
         87UEJa3tpFE2P5IA4VatXPo18G42TugYfvmhDw1DxZyn14iiqr3HNszcmN/fXnf0ECZu
         TDi4Q8Y08tG0vV23J4tLk9ZbruWzkjLEH5E3mAbihdmo9sSgEnKhKa8C5smzRyssag0B
         7fXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUadWrslpTa8dMGceGgh/cRs8vJ+va2k3zQXSd4WmdlPakgV/KYW6brTFDuLJXF8Pdu2mB6giSTGngAeA==@vger.kernel.org, AJvYcCV4/Mz772hO4HDg5Wa9J1FKX/zRoDCAP4jetFuKQLiH5jVNQvS7K7Ag+lIB4P4sDqldH7jC8nEEJX4gAaMy@vger.kernel.org, AJvYcCX8Wy13MYmctjzDhhYYHEEM9wk9GzAYKpcN5mUeBquDG1dAmOX8gXNnShR/dnqCZxBInEUrvjU+WqPy@vger.kernel.org
X-Gm-Message-State: AOJu0YzinzEIZ1kx7rfiH83SuAD20jMjsM+6GmPrvZ0NA/zybwxGG0JW
	62MT2LZro2Musfl5CzILdbIapKBjQtjogEWy2nZvi6wY9yM6OcB+0tw0Gg==
X-Gm-Gg: ASbGncsWh32eMDUiZgg0Kad2+OnwhUzlqUtyZ3dFA+i3t0qalMOCqwJeqLc+wAMXGxY
	0ZNhlQXssbgdVt0lgsCVGCFdmxjJepv2/bNcaQZm41UGlvKJYBmtbUs56CfX3k+yAk5BYLVDolX
	Y4ntT6LZXECQlozC9SW9Z2QeWmxdkwyB3CMqxgaLl86ZH6aq0naTshGI9DC1o7GtxudmeNdF7QT
	YtmBGr8TiyzC3U5xW+UTenNkhQYV+xipvkviPXR2wBysPllAM+oPqVaaR3FJraDsHvCOfXDuiqK
	NRLAW+d3xSTtccv3L+78jhuB3cOV9oueG3dCPoVJmf3snIh4zPs8qL6QXKj2
X-Google-Smtp-Source: AGHT+IG4OZ1690iwftC0cKNvWGezwc8KjmFsKGz73HBEG0+WiykY2102VOI4tbtQFLIDooxMFr4Jjg==
X-Received: by 2002:a05:600c:218e:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-437c6ae9bdcmr162684545e9.3.1737301501403;
        Sun, 19 Jan 2025 07:45:01 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm104532655e9.36.2025.01.19.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:45:00 -0800 (PST)
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
Subject: [PATCH v2 6/6] mips: dts: ralink: mt7628a: update system controller node and its consumers
Date: Sun, 19 Jan 2025 16:44:47 +0100
Message-Id: <20250119154447.462857-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
References: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current MT7628A device tree file system controller node is wrong since it is
not matching bindings. Hence, update it to match current bindings updating
it also to use new introduced clock and reset constants.

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


