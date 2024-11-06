Return-Path: <linux-mips+bounces-6694-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C29BF28D
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB92628596D
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60C7206E8E;
	Wed,  6 Nov 2024 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BZ67JaIl"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE820495E;
	Wed,  6 Nov 2024 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909043; cv=none; b=U650FIAPWvS+Xq7u5iGSEHzc9k13caTab7crtJtEvUg4pOx4BAmDa1lGDhR3CvDKglapjus+tFraUdWr5Pn9pKLZUq6XKQIbVDIh3b9BM7j8hBCyM0LQ29UvqJeORtE94OmVUiE+knmVKsaT95IBccuDOKXvhYEE3pjPiWQ2mHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909043; c=relaxed/simple;
	bh=3woLQ1O5xn3KQhSqABRWdyezQL0RB3AHSxjAVr1Kar4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQ/r8OfCKXKixvgeBFurEik95jm3neNcBxqjgSNv3ppJjE1KXQOO+C3F7c+6L5puB0VuSl7gnPfFu+/RTqG++bnyAIwrk39c2hq+ODBOOpEOYEXDE1iSUSP+Vo83+qiKlTwRsAA5LNrdeVcXAX9QXZOLtGTPa8qzWYuGvr49DPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BZ67JaIl; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F76E4000E;
	Wed,  6 Nov 2024 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbSQpx6+P5te4JBOfJJ+Yvd01YB99e7I0NZ06uZJ9QI=;
	b=BZ67JaIlG3gOsJQ7UFS/LgdHQFisOepCXrAJKo38yPsnFzJOevKPFiFrleYEoczlhp6i8O
	iAgJFB/+1H4g7kU5Iqx4TjqXf0tpr3YBBxpULQVzc4v+73Q5kLbhjmu/EqV/fjsJVQRh+6
	/mujgXGxPJ9grQ8xnVvk26i+gSiCDW5x1z2IW3x0JTCIv9Xwt7JYUrpSo0OWeFdz7D8PqA
	r/0zjQkaxTA3ALSEDswlBDNkR1LMsFFQAYnB4IwkMAqUwpvM470cjcABC0mlCUU8MnmBXO
	IP2cbEwF3InywmQriZokF9o35byOxMpDKtiXa9QyWr1KumO7YlOnGRV842cNWw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:03:53 +0100
Subject: [PATCH v2 02/10] dt-bindings: clock: eyeq: add more Mobileye
 EyeQ5/EyeQ6H clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-2-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
In-Reply-To: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Add #defines for Mobileye clock controller:

 - EyeQ5 core 0 thru 3 clocks. Internally:

      EQ5C_PLL_CPU:           already exposed
      └── EQ5C_CPU_OCC:       unexposed, no reason to do so
          ├── EQ5C_CPU_CORE0: new!
          ├── EQ5C_CPU_CORE1: new!
          ├── EQ5C_CPU_CORE2: new!
          └── EQ5C_CPU_CORE3: new!

 - EyeQ5 peripheral clocks. Internally:

      EQ5C_PLL_PER:          already exposed
      ├── EQ5C_PER_OCC:      new!
      │   ├── EQ5C_PER_SPI:  new!
      │   ├── EQ5C_PER_I2C:  new!
      │   ├── EQ5C_PER_GPIO: new!
      │   └── EQ5C_PER_UART: new!
      ├── EQ5C_PER_EMMC:     new!
      └── EQ5C_PER_OCC_PCI:  new!

 - EyeQ6H central OLB. Internally:

      EQ6HC_CENTRAL_PLL_CPU:     new!
      └── EQ6HC_CENTRAL_CPU_OCC: new!

 - EyeQ6H west OLB. Internally:

      EQ6HC_WEST_PLL_PER:          new!
      └── EQ6HC_WEST_PER_OCC:      new!
          └── EQ6HC_WEST_PER_UART: new!

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq5-clk.h | 44 +++++++++++++++++++-------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index b433c1772c28fae818b3a6ba428d1f89000f9206..f353c2988035f7c9fb84e4b59c6c4a220436454b 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -6,24 +6,46 @@
 #ifndef _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ5_CLK_H
 #define _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ5_CLK_H
 
-#define EQ5C_PLL_CPU	0
-#define EQ5C_PLL_VMP	1
-#define EQ5C_PLL_PMA	2
-#define EQ5C_PLL_VDI	3
-#define EQ5C_PLL_DDR0	4
-#define EQ5C_PLL_PCI	5
-#define EQ5C_PLL_PER	6
-#define EQ5C_PLL_PMAC	7
-#define EQ5C_PLL_MPC	8
-#define EQ5C_PLL_DDR1	9
+#define EQ5C_PLL_CPU		0
+#define EQ5C_PLL_VMP		1
+#define EQ5C_PLL_PMA		2
+#define EQ5C_PLL_VDI		3
+#define EQ5C_PLL_DDR0		4
+#define EQ5C_PLL_PCI		5
+#define EQ5C_PLL_PER		6
+#define EQ5C_PLL_PMAC		7
+#define EQ5C_PLL_MPC		8
+#define EQ5C_PLL_DDR1		9
 
-#define EQ5C_DIV_OSPI	10
+#define EQ5C_DIV_OSPI		10
+
+/* EQ5C_PLL_CPU children */
+#define EQ5C_CPU_CORE0		11
+#define EQ5C_CPU_CORE1		12
+#define EQ5C_CPU_CORE2		13
+#define EQ5C_CPU_CORE3		14
+
+/* EQ5C_PLL_PER children */
+#define EQ5C_PER_OCC		15
+#define EQ5C_PER_UART		16
+#define EQ5C_PER_SPI		17
+#define EQ5C_PER_I2C		18
+#define EQ5C_PER_GPIO		19
+#define EQ5C_PER_EMMC		20
+#define EQ5C_PER_OCC_PCI	21
 
 #define EQ6LC_PLL_DDR		0
 #define EQ6LC_PLL_CPU		1
 #define EQ6LC_PLL_PER		2
 #define EQ6LC_PLL_VDI		3
 
+#define EQ6HC_CENTRAL_PLL_CPU	0
+#define EQ6HC_CENTRAL_CPU_OCC	1
+
+#define EQ6HC_WEST_PLL_PER	0
+#define EQ6HC_WEST_PER_OCC	1
+#define EQ6HC_WEST_PER_UART	2
+
 #define EQ6HC_SOUTH_PLL_VDI		0
 #define EQ6HC_SOUTH_PLL_PCIE		1
 #define EQ6HC_SOUTH_PLL_PER		2

-- 
2.47.0


