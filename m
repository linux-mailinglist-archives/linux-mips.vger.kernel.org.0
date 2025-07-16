Return-Path: <linux-mips+bounces-9832-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34651B074B0
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B288189C088
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93D12F430C;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3q5Y5Ga"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8292F3C22;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=GSFGuQMn1z2m36VgM/mk7L3SA/IlAz3VAXU/Ww6EYV0+sg1HJU/T7358uEyfqJMdk6A/a2koYDddfK6XJGoe1lUY60a0n2bqvcQRcedPBvRYBg4QuM+vnQOuVRwvROTEbJU6ziMWtiiwF6xxYWM0EFJ/axCjBOqWPHsk2SHlhjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=5/w7EYkirJgKQapb83idD4IR85mkJOnW7w6eVIv19eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fM9OQm2nKqqChinDTHfFemmQ9gF8m0tqr+7wHTE2KMhS5fLX3SK1ldTe2/DwyQSbEwm0Ou8eW8RYz2sUPs9qetJsHPWE+voFOrbLVLrfBO+s/21aNue5E5VQsaGAXzwjkXbzcfDtvKozT+DSxEKk6IETO7hRbtwY/1X95QOCxiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3q5Y5Ga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A2D9C113CF;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=5/w7EYkirJgKQapb83idD4IR85mkJOnW7w6eVIv19eE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K3q5Y5Ga21uiLCz7LvaydLJ+VINd2x3NAFGidO0SaWIHRngoZwEqV+anm2Ng2K6xP
	 GrTMpOUxS8CDLjyDRHZQvadvweQoHBFv+/V8S5doHIatdsqo71G4BdtJpgm5tBqXiR
	 d2AcaO93VF1MfJ6G0gSk6m88itK0KlOBaIKHGM7nkSLsgJf97Kcmr7yBQrJGGnKdJq
	 jztuDBdwRNMEafnSU9YaiuPUY3u5bRGB1U42nZtWY8dOBnfPyzXOReLIyzPKd2BXu+
	 HxknTKgB+URngx6xJqqk2p+adPNBGQHZ5PEuPLS4vCLR0TWnQ73j+0AOC6ckc+KX2X
	 ZPbC7nUOA1AZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D3EC83F27;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:14 +0800
Subject: [PATCH v3 5/9] MIPS: dts: loongson: Add CQ-T300B board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-loongson1-arch-v3-5-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=2858;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=XttapQaz5tbqpiYUJ3NCDcmUjVIV/5rxCCiXN6plXoU=;
 b=3FcqK53IOcHkSeCcRK5D7QswnYAyrHfUyM/W4DqaGTMaRfgTZoSsfscsHBt2gXFirZXrDkeLU
 AY7TSZ+VMxpCwPkzCInQuBthXhKgTBclawyaC6HS6GF+7VqBNVtzC7O
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add a device tree for CQ-T300B board.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 arch/mips/boot/dts/loongson/Makefile     |   1 +
 arch/mips/boot/dts/loongson/cq-t300b.dts | 110 +++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index de4570380c3e..e8f76e7ac303 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
 
+dtb-$(CONFIG_MACH_LOONGSON32)	+= cq-t300b.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= lsgz_1b_dev.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= smartloong-1c.dtb
diff --git a/arch/mips/boot/dts/loongson/cq-t300b.dts b/arch/mips/boot/dts/loongson/cq-t300b.dts
new file mode 100644
index 000000000000..5244fab2496d
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/cq-t300b.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "loongson1c.dtsi"
+
+/ {
+	compatible = "loongson,cq-t300b", "loongson,ls1c";
+	model = "CQ-T300B Board";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			label = "led0";
+			gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led1 {
+			label = "led1";
+			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "nand-disk";
+		};
+	};
+};
+
+&xtal {
+	clock-frequency = <24000000>;
+};
+
+&emac {
+	phy-handle = <&phy0>;
+	phy-mode = "rmii";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@13 {
+			reg = <0x13>;
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
+				reg = <0x1000000 0x3f000000>;
+			};
+		};
+	};
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
+&watchdog {
+	status = "okay";
+};

-- 
2.43.0



