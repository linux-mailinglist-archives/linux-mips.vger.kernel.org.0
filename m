Return-Path: <linux-mips+bounces-10254-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE2B24BDE
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 16:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DDE4587C4C
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 14:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6430B2F0673;
	Wed, 13 Aug 2025 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="KyBvHBKY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8EA2F747A
	for <linux-mips@vger.kernel.org>; Wed, 13 Aug 2025 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755095379; cv=none; b=Suc0G1sySr1jKrAM1m9muhVKm4nha71r7f386jp32hiH+Co9/eT+V4KKmi8+/o35EY3X1ZBcWWpMF7QCCUuw4GUsu/+TG1lClP5pXYp/ZYPlA+whZL7hc30JHoi4IdSBEO1WevDr51GJDIK217G7ySsVl2zq/6ml0NjcSSnTEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755095379; c=relaxed/simple;
	bh=5xb3XAIsBA4uXznagMet3Y7OCW4TBLdKgnOQfmITL+w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYTai7OLNJ6JDIZIQBxEK6shjf9wPdcvHuZX3GrTM9Z6NcBjYGSUQviZAC45rLIQNLuPBSaTpvdMPh4vYUfi0czHFD4A7M+u0XJjCT4pDJ1sGnoM+YiZ6hObg1kbC++uFF9Erqm2TEQAT+Zg22kxjFXbm/Xwb3kYwl9QBA6Qd38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=KyBvHBKY; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 9444 invoked from network); 13 Aug 2025 16:29:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755095366; bh=C3JC11q6gynIkFGz9glj6QTKBr9kbWxa0alG+KPQ0aE=;
          h=From:To:Subject;
          b=KyBvHBKYlC8X3ffxnXU5ot2ERq0JaZSmrOUnW0vF98mbRvYwNkSnnVjVDtntYBbxV
           H3dRity8oG1gIgV8CA9FUIJlRycexkc4r+omGgXUMU5Lh93PDlSeYNK//amTs6W+w9
           dYhbtS3CdyaA6e5SukPIFxR7blpWn9LeF80mtIrIP/zxqOpfWQTLex3CVGVZsXCcFy
           vUpZJ2Iish+qzmuA9y6igs5DKcUBmlk//n44mTf58drT/XIHuEuijqrV/MMgDNHwrQ
           /zwRRUEOg+XzJMkcYwEJH8TwsN5eUOXZbcP5IH6/wwRgcDEzNNGn8iQee75TvHzQET
           fkIWiKYDUKEiQ==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 13 Aug 2025 16:29:26 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	kever.yang@rock-chips.com,
	mani@kernel.org,
	tsbogend@alpha.franken.de,
	john@phrozen.org,
	masahiroy@kernel.org,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mips: lantiq: add British Telecom Home Hub 5A dts
Date: Wed, 13 Aug 2025 16:21:33 +0200
Message-ID: <20250813142917.2053814-3-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813142917.2053814-1-olek2@wp.pl>
References: <20250813142917.2053814-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 788f148100455ac45f150d703ee7d6a6
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [QbPB]                               

This patch adds minimal dts for BT Home Hub 5A. The provided dts
allows to boot the initramfs image. Nodes for other peripherals
inside the SoC will be added in the future.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/Makefile            |   1 +
 arch/mips/boot/dts/lantiq/xrx200.dtsi         | 104 ++++++++++++++++++
 .../boot/dts/lantiq/xrx200_bt_homehub-v5a.dts |  17 +++
 arch/mips/lantiq/Kconfig                      |  10 ++
 4 files changed, 132 insertions(+)
 create mode 100644 arch/mips/boot/dts/lantiq/xrx200.dtsi
 create mode 100644 arch/mips/boot/dts/lantiq/xrx200_bt_homehub-v5a.dts

diff --git a/arch/mips/boot/dts/lantiq/Makefile b/arch/mips/boot/dts/lantiq/Makefile
index d8531b4653c0..9b43a7518bdc 100644
--- a/arch/mips/boot/dts/lantiq/Makefile
+++ b/arch/mips/boot/dts/lantiq/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_DT_EASY50712)	+= danube_easy50712.dtb
+dtb-$(CONFIG_DT_HH5A)		+= xrx200_bt_homehub-v5a.dtb
diff --git a/arch/mips/boot/dts/lantiq/xrx200.dtsi b/arch/mips/boot/dts/lantiq/xrx200.dtsi
new file mode 100644
index 000000000000..7e7cb6264e6f
--- /dev/null
+++ b/arch/mips/boot/dts/lantiq/xrx200.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "lantiq,vr9";
+
+	aliases {
+		serial0 = &asc1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "mips,mips34Kc";
+			reg = <0>;
+		};
+	};
+
+	cpuintc: cpuintc {
+		compatible = "mti,cpu-interrupt-controller";
+
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+
+		interrupt-controller;
+	};
+
+	localbus@1f800000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		reg = <0x1f800000 0x800000>;
+		ranges = <0x0 0x1f800000 0x7fffff>;
+
+		icu0: icu@80200 {
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>, <3>, <4>, <5>, <6>;
+			compatible = "lantiq,icu";
+			reg = <0x80200 0xc8	/* icu0 */
+			       0x80300 0xc8>;	/* icu1 */
+		};
+	};
+
+	localbus@1f000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		reg = <0x1f000000 0x800000>;
+		ranges = <0x0 0x1f000000 0x7fffff>;
+
+		pmu@102000 {
+			compatible = "lantiq,pmu-xway";
+			reg = <0x102000 0x1000>;
+		};
+
+		cgu@103000 {
+			compatible = "lantiq,cgu-xway";
+			reg = <0x103000 0x1000>;
+		};
+
+		rcu0: rcu@203000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "lantiq,xrx200-rcu", "simple-mfd", "syscon";
+			reg = <0x203000 0x100>;
+			ranges = <0x0 0x203000 0x100>;
+			big-endian;
+		};
+	};
+
+	localbus@10000000 {
+		compatible = "lantiq,xrx200-fpi", "simple-bus";
+		ranges = <0x0 0x10000000 0xf000000>;
+		reg =	<0x1f400000 0x1000>,
+			<0x10000000 0xf000000>;
+		regmap = <&rcu0>;
+		offset-endianness = <0x4c>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		asc1: serial@e100c00 {
+			compatible = "lantiq,asc";
+			reg = <0xe100c00 0x400>;
+			interrupt-parent = <&icu0>;
+			interrupts = <112 113 114>;
+		};
+
+		ebu@e105300 {
+			compatible = "lantiq,ebu-xway";
+			reg = <0xe105300 0x100>;
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/lantiq/xrx200_bt_homehub-v5a.dts b/arch/mips/boot/dts/lantiq/xrx200_bt_homehub-v5a.dts
new file mode 100644
index 000000000000..ce1aae34adc9
--- /dev/null
+++ b/arch/mips/boot/dts/lantiq/xrx200_bt_homehub-v5a.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+#include "xrx200.dtsi"
+
+/ {
+	compatible = "bt,homehub-v5a", "lantiq,vr9";
+	model = "BT Home Hub 5A";
+
+	chosen {
+		bootargs = "console=ttyLTQ0,115200";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x8000000>;
+	};
+};
diff --git a/arch/mips/lantiq/Kconfig b/arch/mips/lantiq/Kconfig
index 6c6802e482c9..3376ac595b8c 100644
--- a/arch/mips/lantiq/Kconfig
+++ b/arch/mips/lantiq/Kconfig
@@ -46,6 +46,16 @@ config DT_EASY50712
 	bool "Easy50712"
 	depends on SOC_XWAY
 	select BUILTIN_DTB
+
+config DT_HH5A
+	bool "BT Home Hub 5A"
+	depends on SOC_XWAY
+	select BUILTIN_DTB
+	help
+	  The BT Home Hub 5A is a device based on the VRX268 SoC. It has 128MB
+	  of memory and 128MB of NAND flash. This kernel needs only an appended
+	  initramfs to boot. It can be loaded through tftp and booted from
+	  memory in the bootloader.
 endchoice
 
 config PCI_LANTIQ
-- 
2.47.2


