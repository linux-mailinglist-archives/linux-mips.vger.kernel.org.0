Return-Path: <linux-mips+bounces-239-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4A7F62EB
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 16:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD2111C20EA9
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 15:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADA73D3BC;
	Thu, 23 Nov 2023 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I5spGNdD"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60BB172D;
	Thu, 23 Nov 2023 07:27:13 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22F76240003;
	Thu, 23 Nov 2023 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700753232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyCSrF1JgQ4iScyRiIk/6IapzgqC+RV3b88nNkBvQYI=;
	b=I5spGNdDTyZF9Px7uya/D2or4dtiHN02/WkO8SnPHN0g1AX8FAUVCvkqT/Yur+qZAnwYi7
	XTljlHbR6aSs7FX9K+qtoKTbTYqmKcwB1ieU3pOejSZruFDP4lRrK3z/w8MIVICr3O1krB
	duGvfscdAtGK76E5/jvtxaCCEDWnTQVmzcwuofATN02q5t08pa0K5HhWltr4jGFWr0uOBK
	gx55k2gdPLNEVYoVMUbWpz0/ynl/I3AJwmZjTMuJ1Q68mFiNs5T/qe8ogSs1y5DQqXrsql
	+6iLO/BpCnHcgQ1cx684Se83hG5chH0pYSh9g3kgkk/47po5XxXGG1ZvwuT5vw==
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
Subject: [PATCH v2 19/21] MIPS: mobileye: Add EPM5 device tree
Date: Thu, 23 Nov 2023 16:26:36 +0100
Message-ID: <20231123152639.561231-20-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231123152639.561231-1-gregory.clement@bootlin.com>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
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


