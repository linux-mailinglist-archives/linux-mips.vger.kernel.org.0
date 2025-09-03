Return-Path: <linux-mips+bounces-10996-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1BB41FB7
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF0D33B6932
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C26C302CDF;
	Wed,  3 Sep 2025 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g898dpFT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72EB30274C;
	Wed,  3 Sep 2025 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903666; cv=none; b=LG2nJplcJvtpfxliyZ5K+o1VZL7xnDQ8YBDdZJ72BavwvNrhsmUsTiTdfBSjSOVXliBhiHLPP3q6Qm90pJMWOX50SNauAOtWM3lrQ6GVEc1DTFNXHiPkndNs0dC6HEhkuLoQ6appUarb2W3qvqbHjYjVdT4CeR3BE3zo2/CXr+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903666; c=relaxed/simple;
	bh=mvgo3A42kq20HDxbEhdc5uVZRhhpfxw9I9kuq6ttNgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcrE2+vNloOW2YSTllvMl7d3unBKTYFNIueE5pozk8/Rp1oEbKS74EW5C4melO3m7CU5RSIwqEaCEhRG8QCa9FVibpC9LcrbdYLQ/59o72R0n1ngrbimb3Fp9XfSgZkjw6Rcte8KWbr4dSlSmeaoDa65lSbCtX7Mj6yV4b1Mxro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g898dpFT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 71B701A08EC;
	Wed,  3 Sep 2025 12:47:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A6AF606C3;
	Wed,  3 Sep 2025 12:47:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 932821C22DB0A;
	Wed,  3 Sep 2025 14:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HASba0lkYrgQRr4XGbui0JEcE9buZeXXfsQR2uXbBSQ=;
	b=g898dpFThGiVgyu9ccsVPVWwRO7+EqYeusPAZcQYr2Rqkb3q3BEDinA9Wi6t9RKo7avK7j
	iVfoUZ1sroTg4VzeWFhM6PLou58xhFR9yxFoqjwXV07BLUqhCV8OTg1c98XsxumwgZZP/G
	3DpyRwMfgJNfCLYqAfHzZ5QchSAsNgafYH3ksnQiz/2S08+tPupq2pbxdqtGNgbvmVs/sJ
	s/oVg/ETirqkPis4YzH99Y0/oI90gRD8/s/xZ3iw+bAWirk5ty9/cEvOa8/vTVhyQiqS/X
	5HsRLPBoioP7o27Kd28Mb28hvbMnxfPetF+i+IrrQZtnLkU933UyB1H+gW1y5Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:11 +0200
Subject: [PATCH 04/19] dt-bindings: clock: mobileye: add eyeQ7H clock
 indexes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-4-3f5024b5d6e2@bootlin.com>
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

Add the clock indexes for the various OLB found in the eyeQ7H SoC.
For some of the OLB, the indexes are common between two or three
blocks:
* EQ7HC_DDR defines the clock indexes of DDR0 and DDR1 OLB.
* EQ7HC_MIPS defines the clock indexes of MIPS0, MIPS1, and MIPS2 OLB.
* EQ7HC_ACC defines the clock indexes of ACC0 and ACC1 OLB.
* EQ7HC_XNN defines the clock indexes of XNN0 and XNN1 OLB.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 include/dt-bindings/clock/mobileye,eyeq-clk.h | 110 ++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/include/dt-bindings/clock/mobileye,eyeq-clk.h b/include/dt-bindings/clock/mobileye,eyeq-clk.h
index 8424ec59a02d037ddd5b049cb4b7f26764ae2542..0fe9b98c940cbc479ce46fc83fc651101bf1b86a 100644
--- a/include/dt-bindings/clock/mobileye,eyeq-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq-clk.h
@@ -62,4 +62,114 @@
 #define EQ6HC_ACC_PLL_MPC		3
 #define EQ6HC_ACC_PLL_NOC		4
 
+#define EQ7HC_SOUTH_PLL_XSPI	0
+#define EQ7HC_SOUTH_PLL_VDIO	1
+#define EQ7HC_SOUTH_PLL_PER	2
+#define EQ7HC_SOUTH_PLL_100P0	3
+
+#define EQ7HC_SOUTH_DIV_VDO_DSI_SYS	4
+#define EQ7HC_SOUTH_DIV_PMA_CMN_REF	5
+#define EQ7HC_SOUTH_DIV_REF_UFS		6
+#define EQ7HC_SOUTH_DIV_REF_100P0	7
+#define EQ7HC_SOUTH_DIV_XSPI_SYS	8
+#define EQ7HC_SOUTH_DIV_XSPI_MBITS	9
+#define EQ7HC_SOUTH_DIV_NOC_S		10
+#define EQ7HC_SOUTH_DIV_PCIE_SYS	11
+#define EQ7HC_SOUTH_DIV_PCIE_SYS_MBITS	12
+#define EQ7HC_SOUTH_DIV_PCIE_GBE_PHY	13
+#define EQ7HC_SOUTH_DIV_UFS_CORE	14
+#define EQ7HC_SOUTH_DIV_UFS_SMS		15
+#define EQ7HC_SOUTH_DIV_UFS_ROM_SMS	16
+#define EQ7HC_SOUTH_DIV_ETH_SYS		17
+#define EQ7HC_SOUTH_DIV_ETH_MBITS	18
+#define EQ7HC_SOUTH_DIV_CFG_S		19
+#define EQ7HC_SOUTH_DIV_TSU		20
+#define EQ7HC_SOUTH_DIV_VDIO		21
+#define EQ7HC_SOUTH_DIV_VDIO_CORE	22
+#define EQ7HC_SOUTH_DIV_VDIO_CORE_MBIT	23
+#define EQ7HC_SOUTH_DIV_VDO_CORE_MBITS	24
+#define EQ7HC_SOUTH_DIV_VDO_P		25
+#define EQ7HC_SOUTH_DIV_VDIO_CFG	26
+#define EQ7HC_SOUTH_DIV_VDIO_TXCLKESC	27
+
+#define EQ7HC_EAST_PLL_106P6	0
+#define EQ7HC_EAST_PLL_NOC	1
+#define EQ7HC_EAST_PLL_ISP	2
+#define EQ7HC_EAST_PLL_VEU	3
+
+#define EQ7HC_EAST_DIV_REF_DDR_PHY	4
+#define EQ7HC_EAST_DIV_REF_106P6	5
+#define EQ7HC_EAST_DIV_CORE		6
+#define EQ7HC_EAST_DIV_CORE_MBITS	7
+#define EQ7HC_EAST_DIV_ISRAM_MBITS	8
+#define EQ7HC_EAST_DIV_CFG		9
+#define EQ7HC_EAST_DIV_VEU_CORE		10
+#define EQ7HC_EAST_DIV_VEU_MBITS	11
+#define EQ7HC_EAST_DIV_VEU_OCP		12
+#define EQ7HC_EAST_DIV_LBITS		13
+#define EQ7HC_EAST_DIV_ISP0_CORE	14
+
+#define EQ7HC_WEST_PLL_106P6	0
+#define EQ7HC_WEST_PLL_NOC	1
+#define EQ7HC_WEST_PLL_GPU	2
+#define EQ7HC_WEST_PLL_SSI	3
+
+#define EQ7HC_WEST_DIV_GPU		4
+#define EQ7HC_WEST_DIV_GPU_MBITS	5
+#define EQ7HC_WEST_DIV_LBITS		6
+#define EQ7HC_WEST_DIV_MIPS_TIMER	7
+#define EQ7HC_WEST_DIV_SSI_CORE		8
+#define EQ7HC_WEST_DIV_SSI_CORE_MBITS	9
+#define EQ7HC_WEST_DIV_SSI_ROM		10
+#define EQ7HC_WEST_DIV_SSI_ROM_MBITS	11
+#define EQ7HC_WEST_DIV_REF_DDR_PHY	12
+#define EQ7HC_WEST_DIV_REF_106P6	13
+#define EQ7HC_WEST_DIV_CORE		14
+#define EQ7HC_WEST_DIV_CORE_MBIT	15
+#define EQ7HC_WEST_DIV_CFG		16
+#define EQ7HC_WEST_DIV_CAU		17
+#define EQ7HC_WEST_DIV_CAU_MBITS	18
+
+#define EQ7HC_PERIPH_EAST_PLL_PER	0
+
+#define EQ7HC_PERIPH_EAST_DIV_PER	1
+
+#define EQ7HC_PERIPH_WEST_PLL_PER	0
+#define EQ7HC_PERIPH_WEST_PLL_I2S	1
+
+#define EQ7HC_PERIPH_WEST_DIV_PER	2
+#define EQ7HC_PERIPH_WEST_DIV_I2S	3
+
+#define EQ7HC_DDR_PLL		0
+
+#define EQ7HC_DDR_DIV_APB	1
+#define EQ7HC_DDR_DIV_PLLREF	2
+#define EQ7HC_DDR_DIV_DFI	3
+
+#define EQ7HC_MIPS_PLL_CPU	0
+
+#define EQ7HC_MIPS_DIV_CM	1
+
+#define EQ7HC_ACC_PLL_VMP	0
+#define EQ7HC_ACC_PLL_MPC	1
+#define EQ7HC_ACC_PLL_PMA	2
+#define EQ7HC_ACC_PLL_NOC	3
+
+#define EQ7HC_ACC_DIV_PMA	4
+#define EQ7HC_ACC_DIV_NCORE	5
+#define EQ7HC_ACC_DIV_CFG	6
+
+#define EQ7HC_XNN_PLL_XNN0	0
+#define EQ7HC_XNN_PLL_XNN1	1
+#define EQ7HC_XNN_PLL_XNN2	2
+#define EQ7HC_XNN_PLL_CLSTR	3
+
+#define EQ7HC_XNN_DIV_XNN0	4
+#define EQ7HC_XNN_DIV_XNN1	5
+#define EQ7HC_XNN_DIV_XNN2	6
+#define EQ7HC_XNN_DIV_CLSTR	7
+#define EQ7HC_XNN_DIV_I2	8
+#define EQ7HC_XNN_DIV_I2_SMS	9
+#define EQ7HC_XNN_DIV_CFG	10
+
 #endif

-- 
2.51.0


