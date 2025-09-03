Return-Path: <linux-mips+bounces-10997-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B0B41FB2
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2666F1BA28BD
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AEB3043CA;
	Wed,  3 Sep 2025 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A41XRiLx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ECB302CD0;
	Wed,  3 Sep 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903668; cv=none; b=ZMkSZESRjoJR3UD63zrebqg8XMjiVansjQ02teCQ/S3a/YUHlYh9anipjOriye+0sP8/mhF53FmW92QF1Fv/HDd4hFeWf8QSW6MweT2qkpRyFdqHkfDgMsuQ16kWedAYYm+dd6AJY6Y5MZAmBrENDxDZtGxXi3d69a6RF65j8aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903668; c=relaxed/simple;
	bh=PgOES7Ac1xUOjEyzw95I56CWyH2IDlrdYkxnvVUdyxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agQfbGAsmyDOU6nR68jwl43vI/NKnPD1V8C7kPok9yHzho2YJYdA6DG9wQTTFdT/TVjURdeQXeCW2tSAAt+G31lwZGdaD6tV6R7+4g0yD0vu7G3nJZByzRBCbLdeNB+IsQlsx831aYxH+uslruvG2poBarkLTBvqLurauMd3IbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A41XRiLx; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A2361A08CE;
	Wed,  3 Sep 2025 12:47:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2355E606C3;
	Wed,  3 Sep 2025 12:47:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3DDC1C22DA0C;
	Wed,  3 Sep 2025 14:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y5x1FnQLW3FxdXiusLS7AQ0y+ufAoMqHxcSYyDkM4aQ=;
	b=A41XRiLxfcBZ1dfmVrMlj36XiCwCROy9D2a2mOfRfFAjqdznh0essjUxvI2fUGqI3AqDz2
	f7LoKCGvTP6nrhutjcKrUDttAMPHcsc3KnVVtz4At7MeIBqjbFkObs7zI0TdzSAeHJihfG
	ceVQ6OZTHu7otssM54cleU4CW4jtDtQr1sZATwNpaEG80kDYysi6ig0irb5WQIkuLg3fb5
	cuIBZH/ANKH2fF42Q+pXz0lxcKfQYiaxhYx55UDNz/+dH1VQ0CJrYMFHFFtqYy94n6BvV5
	uDP6APHafLI27ayar+zr2WXIo1dNpBoG2Jbk7bHOE6PA1pRLBjfc2X7lAc5Rvg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:12 +0200
Subject: [PATCH 05/19] dt-bindings: reset: add Mobileye eyeQ
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-5-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
In-Reply-To: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Sari Khoury <sari.khoury@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Define the indexes of the reset controllers present in 11 of the OLB
found in Mobileye eyeQ7H SoC. The define names start with EQ7HR, which
is the abbreviation of EyeQ7H Reset.

For the OLBs with multiple reset domains, the domain number is in the
define name (DOMx) and should also be passed in the device tree:

    resets = <&olb_south 0 EQ7HR_SOUTH_DOM0_PCI_CTL>;

For the OLBs with a single reset domain, only the reset index is needed:

    resets = <&olb_periph_west EQ7HR_PERIPH_UART>;

Some reset indexes are common between two OLB:
* EQ7HR_PERIPH defines the reset indexes of OLB periph_east and
  periph_west.
* EQ7HR_DDR defines the reset indexes of OLB ddr0 and ddr1.
* EQ7HR_ACC defines the reset indexes of OLB acc0 and acc1.
* EQ7HR_XNN defines the reset indexes of OLB xnn0 and xnn1.

Signed-off-by: Sari Khoury <sari.khoury@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 MAINTAINERS                                     |  1 +
 include/dt-bindings/reset/mobileye,eyeq-reset.h | 75 +++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c56f17e4c585fe3e719fbae18b70a0c132c5da48..6e6bf23e988ad9b8d77268f680ea4dee0489684f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17113,6 +17113,7 @@ F:	drivers/clk/clk-eyeq.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c
 F:	include/dt-bindings/clock/mobileye,eyeq-clk.h
+F:	include/dt-bindings/reset/mobileye,eyeq-reset.h
 
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>
diff --git a/include/dt-bindings/reset/mobileye,eyeq-reset.h b/include/dt-bindings/reset/mobileye,eyeq-reset.h
new file mode 100644
index 0000000000000000000000000000000000000000..70d3b7140f8d2599186c7ddff32b8131e90c644e
--- /dev/null
+++ b/include/dt-bindings/reset/mobileye,eyeq-reset.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
+ */
+
+#ifndef _DT_BINDINGS_MOBILEYE_EYEQ_RESET_H
+#define _DT_BINDINGS_MOBILEYE_EYEQ_RESET_H
+
+#define EQ7HR_SOUTH_DOM0_PCI_PHY	0
+#define EQ7HR_SOUTH_DOM0_PCI_CTL	1
+#define EQ7HR_SOUTH_DOM0_S_NOC		2
+#define EQ7HR_SOUTH_DOM0_GBE_PHY	3
+#define EQ7HR_SOUTH_DOM0_GBE_CTL	4
+
+#define EQ7HR_SOUTH_DOM1_XSPI		0
+#define EQ7HR_SOUTH_DOM1_UFS		1
+#define EQ7HR_SOUTH_DOM1_S_VDIO		2
+
+#define EQ7HR_EAST_ISP			0
+#define EQ7HR_EAST_VEU			1
+#define EQ7HR_EAST_LBIST		2
+
+#define EQ7HR_WEST_GPU			0
+#define EQ7HR_WEST_CAU			1
+#define EQ7HR_WEST_LBIST		2
+#define EQ7HR_WEST_GPU_LBIST		3
+
+#define EQ7HR_PERIPH_GPIO		0
+#define EQ7HR_PERIPH_EXT		1
+#define EQ7HR_PERIPH_UART		2
+#define EQ7HR_PERIPH_SPI		3
+#define EQ7HR_PERIPH_I2C0		4
+#define EQ7HR_PERIPH_I2C1		5
+#define EQ7HR_PERIPH_I2C2		6
+#define EQ7HR_PERIPH_I2S		7
+
+#define EQ7HR_DDR_APB			0
+#define EQ7HR_DDR_DMI			1
+#define EQ7HR_DDR_DFI			2
+#define EQ7HR_DDR_PHY_SMS		3
+#define EQ7HR_DDR_CTL_SMS		4
+
+#define EQ7HR_ACC_DOM0_VMP0		0
+#define EQ7HR_ACC_DOM0_VMP1		1
+#define EQ7HR_ACC_DOM0_VMP2		2
+#define EQ7HR_ACC_DOM0_VMP3		3
+#define EQ7HR_ACC_DOM0_MPC0		4
+#define EQ7HR_ACC_DOM0_MPC1		5
+#define EQ7HR_ACC_DOM0_PMA0		6
+#define EQ7HR_ACC_DOM0_PMA1		7
+
+#define EQ7HR_ACC_DOM1_NCORE0		0
+#define EQ7HR_ACC_DOM1_NCORE1		1
+#define EQ7HR_ACC_DOM1_NCORE0_M		2
+#define EQ7HR_ACC_DOM1_NCORE1_M		3
+#define EQ7HR_ACC_DOM1_NCORE_NOC	4
+#define EQ7HR_ACC_DOM1_VMP_NOC		5
+#define EQ7HR_ACC_DOM1_MPC_NOC		6
+#define EQ7HR_ACC_DOM1_PMA_NOC		7
+
+#define EQ7HR_XNN_DOM0_XNN0		0
+#define EQ7HR_XNN_DOM0_XNN1		1
+#define EQ7HR_XNN_DOM0_XNN2		2
+
+#define EQ7HR_XNN_DOM1_XNN0		0
+#define EQ7HR_XNN_DOM1_XNN1		1
+#define EQ7HR_XNN_DOM1_XNN2		2
+#define EQ7HR_XNN_DOM1_XNN3		3
+#define EQ7HR_XNN_DOM1_NCORE		4
+#define EQ7HR_XNN_DOM1_I2_0		5
+#define EQ7HR_XNN_DOM1_I2_1		6
+#define EQ7HR_XNN_DOM1_SMS_0		7
+#define EQ7HR_XNN_DOM1_SMS_1		8
+
+#endif

-- 
2.51.0


