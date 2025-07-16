Return-Path: <linux-mips+bounces-9825-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86727B074A3
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8791A3A709B
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827B52F3C06;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4PWJmx4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B87233156;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=DDb4UegcKHRagZq6K8iLigqN1agnRSdWjqCvO9GWKBA2AIoVUeZ5BSpKcPcX5l0nNa/CVgTRPMZiHvetwUPCiWKQhcLx+9R5d1i+1vCgeOpCN1Bd4VTU1f/aBZdNB9wqqzQH87UdszEoThIORjVYJohp7kuUWjvtrhjD30WtKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=Z/ogmTL/XwTlAGVxrQBIN0UZOAPXUFug2udSmAcrOLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GmCtBMcV6kH9wcHxpMKFDjuWc0fQclTtQqNIX6HR6mJpjPzNmD+FC0iWdZ/XKdVN4hxr8mLgr48BfAUitNuivN7BIj1lYjZEr4ygqlIRL4m/9aMj5chjv2/BWP0ChoeqvJvs0J/zx1gutOxp8QH/zoXxNDrvnUWAPSESh3Sbfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4PWJmx4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11554C4CEFB;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=Z/ogmTL/XwTlAGVxrQBIN0UZOAPXUFug2udSmAcrOLw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K4PWJmx4IiLZ8kWrGmpMmljUXNV8xo2hEYViupscEZ3bGrPObITCRZki3Im2W/Phl
	 Rtl/Gd9w+hwmcZJBS1oXHh8ngH9UgRvnslDkDnjN6qCD5NExxjQegJSPzjm9KCef7G
	 1p0d8XKuuNpnqcDej95psFJnmjCzIG+1okqCO7HC0PkSce8Q23/yW/6idO+U/X+6tL
	 3zBvb0QvaKBrtjGaYQDIjhw/N4bKO8L4oWpKYwQ57Yc/A2ZXOKKmXo3lba2DryWzRh
	 Egtag2nn5AV1zTox+oXitjmdPSTIC7C/QECUo+3oDI3m60SnFnrU5Ba3H0ZRR3ndHc
	 qEQ9x1CZ+8KWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0597BC83F1B;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:12 +0800
Subject: [PATCH v3 3/9] MIPS: dts: loongson: Add LSGZ_1B_DEV board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-loongson1-arch-v3-3-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=3677;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=wiZSXAnq9LUP/A9neq7bwgyCPMfuISQkRA8LZhDIlis=;
 b=LUQkl6mMHSbYnWSEY3s159jXGQVN/nkwUUysrqvOVNFEtx4tuMpRkeAqKRIGSr/XP2E2AxaRF
 X+dpF5yKCFXBBjbCAgErjVIB+n4pDF83r3JmYhXjrGWHRNMI6rRWA0F
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
 arch/mips/boot/dts/loongson/lsgz_1b_dev.dts | 162 ++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 88b87c94c545..1130efa12768 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -7,3 +7,4 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
 
 dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
+dtb-$(CONFIG_MACH_LOONGSON32)	+= lsgz_1b_dev.dtb
diff --git a/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts b/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts
new file mode 100644
index 000000000000..94ec151c0a94
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts
@@ -0,0 +1,162 @@
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
+&xtal {
+	clock-frequency = <33000000>;
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
+&nand {
+	status = "okay";
+
+	nand@0 {
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "kernel";
+				reg = <0x0 0x1000000>;
+			};
+
+			partition@1000000 {
+				label = "rootfs";
+				reg = <0x1000000 0x7000000>;
+			};
+		};
+	};
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



