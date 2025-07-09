Return-Path: <linux-mips+bounces-9690-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E76AFE703
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 13:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF423B39FE
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 11:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B38328DF22;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKXJMcOr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB928D8FF;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059248; cv=none; b=roZ60hBTFvrsxiVVn7B4RHqWbbjdiYYEC4anMTsSQ4sVo+30AVG2CZ9zWOdtPht3u1UqIudMbStJrJWpA9wgNPIawq3K+CwzH8G/RpSnBhSNVebCr2UPXr4+Svx3I6tj+sBWSnZbiOy/smiKyG85D26Te4YQw6BwqYr+TakEBjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059248; c=relaxed/simple;
	bh=B7CgCdg3ONvtIDMHuDU4j5KTm5B5gN+n/DNoo7FIdNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJ6JWbWq1DPN8RDi1Pu29MXJ7bRAyYUY3ZUFquTwZ5aC68MyAEIjU6oJlMxW7gCNB6c0A4cfwDlIGaqgB9/Kd3iTu1VSWAPVlBtZMM2nEEy8fJfPs7YlkwD9O9hWL5kw7MFKFlHjL05ZMct5PupxY7k0ae0Q5tviImK8UI1/utI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKXJMcOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDE1BC4CEF9;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059247;
	bh=B7CgCdg3ONvtIDMHuDU4j5KTm5B5gN+n/DNoo7FIdNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hKXJMcOrv9aCcK5a2JrB56hapYtz0bAxdMbzYxPKfF4NJ7pPdP/eT1e2ES4MHLipp
	 9E6pm1KGsy7/8CaS8l5rDj3r8rq7d4AyV0/iKRkzw1T0fTX/ztXTc4Oshl0Rpcqt7c
	 OFhvluOMirulYXa4CHW/MzAGu/e50/DjXeCoILN6KBn7sYUWKBSAP2aSAsBwreMJL5
	 Kf89azIeZrAlXWYpEEhMz0ZktIe9zm7DdEKEm5M1KytTu67kyCprSzq97EJ/layJY2
	 C3Ty5rGL5GMRIzdUBAzc50tFkqt6I3CnNVHPrJjdZ5XSALvuXUl25pIblTxxYuYEEj
	 boPxJY9JBQnQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B448CC83F15;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Jul 2025 19:05:55 +0800
Subject: [PATCH v2 4/9] MIPS: dts: loongson: Add LSGZ_1B_DEV board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-loongson1-arch-v2-4-bcff6e518c09@gmail.com>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
In-Reply-To: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059245; l=3407;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=2bhEPmFaIZuk42qpq2GGxygw19k6CrRSCdaYJDRk9is=;
 b=meTphHFzCDa4sXNbWgmR8uaXFl26PDn5U4zGF38hz0eGSxixOOa8SzdGvJq15eR/NnIaPj/Q6
 HQdD4zZpox2CWU4FNsrzg6LD/gSnwmOy2u+e9YRRZbM5AVwDuxAabZC
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add a device tree for LSGZ_1B_DEV board.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 arch/mips/boot/dts/loongson/Makefile        |   1 +
 arch/mips/boot/dts/loongson/lsgz_1b_dev.dts | 145 ++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 2facf251fb6a..1123d08dbfbe 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -10,4 +10,5 @@ ifneq ($(CONFIG_BUILTIN_DTB_NAME),)
 dtb-y	:= $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
 else
 dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
+dtb-$(CONFIG_MACH_LOONGSON32)	+= lsgz_1b_dev.dtb
 endif
diff --git a/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts b/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts
new file mode 100644
index 000000000000..c4f9a4499fad
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "loongson1b.dtsi"
+
+/ {
+	compatible = "loongson,lsgz-1b-dev", "loongson,ls1b";
+	model = "LSGZ_1B_DEV Board";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x4000000>;
+	};
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		serial0 = &uart2;
+		serial1 = &uart3;
+	};
+
+	chosen {
+		bootargs = "mtdparts=ls1x-nand:16m(kernel),-(rootfs)";
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led9 {
+			label = "led9";
+			gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led6 {
+			label = "led6";
+			gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "nand-disk";
+		};
+	};
+
+	codec: audio-codec {
+		compatible = "realtek,alc203";
+		#sound-dai-cells = <0>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "ls1b-alc655";
+		simple-audio-card,format = "ac97";
+		simple-audio-card,widgets =
+			"Speaker", "Line Out Jack",
+			"Line", "Line In Jack",
+			"Microphone", "Microphone Jack";
+		simple-audio-card,routing =
+			"Line Out Jack", "TX",
+			"RX", "Line In Jack",
+			"RX", "Microphone Jack";
+
+		simple-audio-card,cpu {
+			sound-dai = <&ac97>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@0 {
+			reg = <0x0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-handle = <&phy1>;
+	phy-mode = "mii";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy1: ethernet-phy@0 {
+			reg = <0x0>;
+		};
+	};
+};
+
+&xtal {
+	clock-frequency = <33000000>;
+};
+
+&ac97 {
+	status = "okay";
+};
+
+&ehci {
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+};
+
+&nand {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};

-- 
2.43.0



