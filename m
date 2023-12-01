Return-Path: <linux-mips+bounces-445-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE98009A5
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 12:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A301C20FC6
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1C0219FF;
	Fri,  1 Dec 2023 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QZmxOaxh"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1651730;
	Fri,  1 Dec 2023 03:15:39 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96FE11C0007;
	Fri,  1 Dec 2023 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyCSrF1JgQ4iScyRiIk/6IapzgqC+RV3b88nNkBvQYI=;
	b=QZmxOaxha3J1voxMaFielxEq/+hof2N5RHZyW3Z8Iy/MMXyAxXMCYKJCoIFZ+xYQzRQODu
	olkA2N2qFOaqwLnErpSlidG00C8QDbj2oGHeGVeUuJ7U/iJVslgnrvSczGChI1N813OGpT
	zejPu19DcMZC9OslYXZ/RiGPb/JwiCIyuySE1R1id5zMHBBHw5Ys0IF1J1IOqJpMTqh50s
	zfDSTrasSluKKUsFtukdKJle8PIMtHmIJzsKrI6hIeVYJNBHwTjs5z45uD3o9ReZfzH7Ea
	Hfu8f/I0rn0+l7KcpfmAAli/wct+50JEie0K1/aZ14X4usS1neMpWhKp9m/JTQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 20/22] MIPS: mobileye: Add EPM5 device tree
Date: Fri,  1 Dec 2023 12:15:03 +0100
Message-ID: <20231201111512.803120-21-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201111512.803120-1-gregory.clement@bootlin.com>
References: <20231201111512.803120-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

Add a device tree for the Mobileye EPM5 evaluation board.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/Makefile       |  4 ++++
 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 24 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/mips/boot/dts/mobileye/Makefile
 create mode 100644 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts

diff --git a/arch/mips/boot/dts/mobileye/Makefile b/arch/mips/boot/dts/mobileye/Makefile
new file mode 100644
index 0000000000000..b6fa261f0a3a0
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2023 Mobileye Vision Technologies Ltd.
+
+dtb-$(CONFIG_SOC_EYEQ5)		+= eyeq5-epm5.dtb
diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
new file mode 100644
index 0000000000000..ff16c3c760a19
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2023 Mobileye Vision Technologies Ltd.
+ */
+
+/dts-v1/;
+
+#include "eyeq5.dtsi"
+
+/ {
+	compatible = "mobileye,eyeq5-epm5", "mobileye,eyeq5";
+	model = "Mobile EyeQ5 MP5 Evaluation board";
+
+	chosen {
+		bootargs = "earlycon";
+		stdout-path = "serial2:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x08000000 0x0 0x08000000>,
+		      <0x8 0x00000000 0x0 0x78000000>;
+	};
+};
-- 
2.42.0


