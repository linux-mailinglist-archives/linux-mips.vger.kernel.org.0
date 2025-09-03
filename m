Return-Path: <linux-mips+bounces-10994-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1089EB41FA7
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4C4B1BA2555
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB453019C1;
	Wed,  3 Sep 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kVKBigKN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF432FC876;
	Wed,  3 Sep 2025 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903663; cv=none; b=AwubQIzvHrkFYolfbM5kW5iosg23RyZ/Ij178lpaRPicQ8FVAx2VS8g5hdzXxcT1bak6vnGSbMRGYnLlhBsGu3/ZDLJIIlRE0K5cLkbdEz5jL/DGAwfPD/gMeHu4tfuK5rBJcn4h7HdoDyps1A1laJ/SOwTomGwrAlvILmf6Hm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903663; c=relaxed/simple;
	bh=VNuLiSygwxmgYwmleuSLXCuPI5cvRlnKciRPEbwy97g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APKyJ+nfO/7BFpSvzqdeJVK2BWLYyMQwJcS9NaPWIwcdHyGp4X75tJDYmL4nPACJMctccyFG8zaWxDIcl59Q0gpxqJnH7skBzy5MqKzpfHZ0kjJ0DvvA8HLlej2letdm6P8dmAsIjfYDr/gbgOD9CyGWg/g/OVEDv8e7pJTb4Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kVKBigKN; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 834EC4E40C12;
	Wed,  3 Sep 2025 12:47:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B189606C3;
	Wed,  3 Sep 2025 12:47:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 240181C22CCD6;
	Wed,  3 Sep 2025 14:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CvWsUbWQSdNgJusFenlHc7IBkEUqAY4aanAKhM5h1HM=;
	b=kVKBigKNZtOzY/QhvAUkK41mqalkDBNwtVTAbHn52rvB2DLYza9YPHPeMDw3uyy1ztYKnJ
	A/jIMojl7J2plGICszXuoc87TSChcN7O57lj1G34lVamMxaJ398C1SjYCDsVk7MGr2+kUp
	dTXHvvH8K2pm19yUB1I8ghUsa1Ljus2YSGYqQ/0Nq/DXh/U6f217X0VdycsDm6mBwlvARY
	f5H0luHwTOb70qFkwgfrGSLorvYBhraLXYPqG4RmTHf9/6bttPoo/N480TMFttfMUxLkv6
	9Lu+tMHu9+05TmTT8xsR6T18mGRb1ImBK7e9ecEa6LY5TwV+49ybBG2XWzPVCA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:09 +0200
Subject: [PATCH 02/19] dt-bindings: clock: mobileye: rename to eyeq-clk.h
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-2-3f5024b5d6e2@bootlin.com>
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

Rename the header from mobileye,eyeq5-clk.h to mobileye,eyeq-clk.h as
it covers more SoCs than just the eyeQ5, but also the eyeQ6L and
eyeQ6H.

Also changes all includes to point to the renamed header.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 MAINTAINERS                                                           | 2 +-
 arch/mips/boot/dts/mobileye/eyeq5.dtsi                                | 2 +-
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi                               | 2 +-
 drivers/clk/clk-eyeq.c                                                | 2 +-
 .../dt-bindings/clock/{mobileye,eyeq5-clk.h => mobileye,eyeq-clk.h}   | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef87927041f5cf58d70633dbb4b18d..c56f17e4c585fe3e719fbae18b70a0c132c5da48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17112,7 +17112,7 @@ F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c
-F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
+F:	include/dt-bindings/clock/mobileye,eyeq-clk.h
 
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>
diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 36a73e8a63a1ab32d1c300d17c4491b175428cdf..206afeff80ccf618fae80a832ee2268cad598f71 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 
-#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
+#include <dt-bindings/clock/mobileye,eyeq-clk.h>
 
 / {
 	#address-cells = <2>;
diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 5ae939d25ea87ddc15cb848c249beed3d07e32e0..a6ffdf1764b3e66295ee17b2d0d2eee8024f95f3 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/mips-gic.h>
 
-#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
+#include <dt-bindings/clock/mobileye,eyeq-clk.h>
 
 / {
 	#address-cells = <2>;
diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index ea1c3d78e7cd47c2698483f58ae1d691ce6d399d..8fbc8eb31185a9e82216a38a81dfbdaa1a700858 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -44,7 +44,7 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include <dt-bindings/clock/mobileye,eyeq5-clk.h>
+#include <dt-bindings/clock/mobileye,eyeq-clk.h>
 
 /* In frac mode, it enables fractional noise canceling DAC. Else, no function. */
 #define PCSR0_DAC_EN			BIT(0)
diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq-clk.h
similarity index 93%
rename from include/dt-bindings/clock/mobileye,eyeq5-clk.h
rename to include/dt-bindings/clock/mobileye,eyeq-clk.h
index f353c2988035f7c9fb84e4b59c6c4a220436454b..8424ec59a02d037ddd5b049cb4b7f26764ae2542 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq-clk.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2024 Mobileye Vision Technologies Ltd.
  */
 
-#ifndef _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ5_CLK_H
-#define _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ5_CLK_H
+#ifndef _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ_CLK_H
+#define _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ_CLK_H
 
 #define EQ5C_PLL_CPU		0
 #define EQ5C_PLL_VMP		1

-- 
2.51.0


