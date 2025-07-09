Return-Path: <linux-mips+bounces-9691-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFFFAFE705
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 13:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7E103A5211
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 11:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7670D28E604;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLuKIkOX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C228DF23;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059248; cv=none; b=clm8FJoBn41UkwxkeDX13A6sBPHJYc5HFOKVZdaqZHrYv7XeM59Aq9HhJ4Nvx0+kO7IYmT7bIfXjm9TG8OtXXVvrK4sFUDG13+pCrpM7tuO+6NocRAVvXW+GxtQC9pVUp/azlCrsxb22Xz72NIgTAlTOcEHtJ8XhaoGxc7bnPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059248; c=relaxed/simple;
	bh=p3gqDDozT1tHdoNTaSrcl2OgIn3GfMXEeXdgcjaWDrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lKG++ooYeth586ZOviihql+j3iVNHGCVVMq5KocKmk5NJFc+duXUApJ0SDePgoTMdX6DGVP8O/ODUZfuUS6RcpuhgisINUJ4RW5A1k9PYehCdko3YiXdio1UmQ2NXDnMe77nbzMzqeOCpXG9ayDzXBjFLtX9YQaPJ04kQD4nlEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLuKIkOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6554C4CEFE;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059247;
	bh=p3gqDDozT1tHdoNTaSrcl2OgIn3GfMXEeXdgcjaWDrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eLuKIkOXpZvG4lwFK/HDSlLiD+CbvV4dRTaHgNGttnIgIXqrzDEz5CgJ4/qEDQLGF
	 9424/VtT/nL0K6QtgeXVEXdrsPEvGFdAEbCN3G0ZwERqfHnEWvi8y4sNzk5BwgGXpX
	 UwAwe0xqWEmhBiWFigYpsCf4SEMQr8n78wrxX0ihx0G2AjnnfitQpoLlpo63KABmTp
	 s8zJLKM2dUrusK83dKtGWFTKmSAaAFV1IZTjb3ZiT/RUhm9isK/1jZAeBaf0HoWx6r
	 oi79r0KUapr/cbg3fJcycMA0omTzZNcA3Q8pofOzVjXK7csEvPnjbeD9HXHWGD5Iyf
	 VnhJ4up+5k/Mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7C0C83F09;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Jul 2025 19:05:57 +0800
Subject: [PATCH v2 6/9] MIPS: dts: loongson: Add CQ-T300B board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-loongson1-arch-v2-6-bcff6e518c09@gmail.com>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
In-Reply-To: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059245; l=2574;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=CirtBr6NDZ066YElVjV3KiB97Vdt6gZ9zvL1Pmzb1hg=;
 b=kvAfWR6SSXvzg0B4jrlBM7okim7IrA65cnw88olc57ShmHBgOaK55pbGYG9DuAS3SLIuHcX29
 +kDMrNP3ukaCXJUHlzM3crOpjqZQjngKO9v/4EJV5Zobd2AFVqhxdmS
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
 arch/mips/boot/dts/loongson/Makefile     |  1 +
 arch/mips/boot/dts/loongson/cq-t300b.dts | 93 ++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 633d95848f76..66d65a56a491 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -9,6 +9,7 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
 ifneq ($(CONFIG_BUILTIN_DTB_NAME),)
 dtb-y	:= $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
 else
+dtb-$(CONFIG_MACH_LOONGSON32)	+= cq-t300b.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= lsgz_1b_dev.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= smartloong-1c.dtb
diff --git a/arch/mips/boot/dts/loongson/cq-t300b.dts b/arch/mips/boot/dts/loongson/cq-t300b.dts
new file mode 100644
index 000000000000..78a3d7d83aff
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/cq-t300b.dts
@@ -0,0 +1,93 @@
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
+		bootargs = "mtdparts=ls1x-nand:16m(kernel),-(rootfs)";
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
+&xtal {
+	clock-frequency = <24000000>;
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
+&watchdog {
+	status = "okay";
+};

-- 
2.43.0



