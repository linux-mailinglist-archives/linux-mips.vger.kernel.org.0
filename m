Return-Path: <linux-mips+bounces-12581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFBECDBE94
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 11:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C4D8303659F
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E953346A5;
	Wed, 24 Dec 2025 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hD0IPcRZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58C333431;
	Wed, 24 Dec 2025 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570869; cv=none; b=p07CSype1n/GYuwwHN/VrPDi7/yReCGNtI4YVYbarKfKwn8PfigA4w1AMC3kJ0fBOuwaq4841Exsqe8G+v06q7wlgnim/wz1g46WUe/ZREQpyeYbyG6Bt7FKdkjS0UCTPZKUBklprwD5lhEN2Ak+T/hKnccYL0TnhDWcwqyQvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570869; c=relaxed/simple;
	bh=q8mMkseya0QQCnebWdfz77ZlKQ6/alMZLBbnSZjNOlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uHtHEKCPuIM4R9ynn9b4myg8mW/n0kYrlisFZI4+bsmWOp+1NIYkXN2yogP7FQCFOp4p1t5R1nbFDB20aqeyrbRaAFMcw866uuCWkoo4NyHsi4Xt8QaYy/ns9N2cn+WplJDEa6DM0rr3wqSEVIx7f6HUpKPR3+ROu3PhcIXT1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hD0IPcRZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AAC761A23D2;
	Wed, 24 Dec 2025 10:07:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D59D6073D;
	Wed, 24 Dec 2025 10:07:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A307210AB1100;
	Wed, 24 Dec 2025 11:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9cGSQUOPami21JKYzTAQly4985AoCx2g8aSgCFVLsj8=;
	b=hD0IPcRZDkGk7N9we1hfkj4Xgpfq+Vvn5EHij8xd+1Op/t1XbNALX89dlGd4eLGSiLT5Yw
	CxdxqTEDF+A8GBsvgqzmGeI3ntatoYmy5BJKgeF15aUfaU3+/XWXKYDN89EBeLObnwEGHM
	Do9QjbcIyERbDErxuqiFMJwxo45vhSqEtfpIAjvOnqk6WzGYF47ZFmioXlp4UK1NOHIlvB
	fJKNWGgv43Ox+s+mhIqdin5UU6X6Fxi1huhFXOh2iaVDi2tkxRaNkc4MUCHtOtDvcqBNZi
	i1PHprQO82QYcdTnO1f79CUDgz0jQ1JYUPjlLFXHC956zyUWS3u0vb3+xGhDIw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:14 +0100
Subject: [PATCH v2 01/10] dt-bindings: soc: mobileye: Add EyeQ7H OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-clk-eyeq7-v2-1-81744d1025d9@bootlin.com>
References: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
In-Reply-To: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The Other Logic Blocks (OLB) found in Mobileye SoCs contain hardware
sub-functions grouped in a logical device.

The EyeQ7H features 14 such OLB. The main differences with the previous
generation of SoC are that some blocks have two clock sources instead
of one and that the clock source can be the one of the clock output of
another OLB instead of the main oscillator.

For the blocks with a single parent clock, the name of that clock is
"ref", similar to what is done for the OLB of the previous SoC. The
blocks with two parent clocks use either "ref" for the main oscillator,
"ref_100p0" for a 100MHz reference clock or "ref_106p6" for 106.6MHz
reference clock.

Some OLB also contain a reset controller with one or more reset domain,
like the blocks found in the EyeQ6H.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml | 192 +++++++++++++++++++++
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h    | 119 +++++++++++++
 2 files changed, 311 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml
new file mode 100644
index 000000000000..796dd2fa9538
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq7h-olb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ7H SoC system controller
+
+maintainers:
+  - Benoît Monin <benoit.monin@bootlin.com>
+  - Grégory Clement <gregory.clement@bootlin.com>
+  - Théo Lebrun <theo.lebrun@bootlin.com>
+  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+
+description:
+  OLB ("Other Logic Block") is a hardware system controller grouping
+  smaller blocks. Clocks and resets are generated by those blocks and
+  used by internal controllers of the SoC. The EyeQ7H SoC hosts 14
+  different OLB.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mobileye,eyeq7h-acc0-olb
+          - mobileye,eyeq7h-acc1-olb
+          - mobileye,eyeq7h-ddr0-olb
+          - mobileye,eyeq7h-ddr1-olb
+          - mobileye,eyeq7h-east-olb
+          - mobileye,eyeq7h-mips0-olb
+          - mobileye,eyeq7h-mips1-olb
+          - mobileye,eyeq7h-mips2-olb
+          - mobileye,eyeq7h-periph-east-olb
+          - mobileye,eyeq7h-periph-west-olb
+          - mobileye,eyeq7h-south-olb
+          - mobileye,eyeq7h-west-olb
+          - mobileye,eyeq7h-xnn0-olb
+          - mobileye,eyeq7h-xnn1-olb
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      First cell is domain and optional if compatible has a single reset domain.
+      Second cell is reset index inside that domain.
+    enum: [ 1, 2 ]
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-ddr0-olb
+              - mobileye,eyeq7h-ddr1-olb
+              - mobileye,eyeq7h-mips0-olb
+              - mobileye,eyeq7h-mips1-olb
+              - mobileye,eyeq7h-mips2-olb
+              - mobileye,eyeq7h-periph-east-olb
+              - mobileye,eyeq7h-south-olb
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+          description:
+            Reference input clock.
+        clock-names:
+          const: ref
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-east-olb
+              - mobileye,eyeq7h-west-olb
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Reference input clock from the main oscillator.
+            - description: 100MHz reference input clock.
+        clock-names:
+          items:
+            - const: ref
+            - const: ref_100p0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-acc0-olb
+              - mobileye,eyeq7h-acc1-olb
+              - mobileye,eyeq7h-periph-west-olb
+              - mobileye,eyeq7h-xnn0-olb
+              - mobileye,eyeq7h-xnn1-olb
+    then:
+      properties:
+        clocks:
+          items:
+            - description: 100MHz reference input clock.
+            - description: 106.6MHz reference input clock.
+        clock-names:
+          items:
+            - const: ref_100p0
+            - const: ref_106p6
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-ddr0-olb
+              - mobileye,eyeq7h-ddr1-olb
+              - mobileye,eyeq7h-east-olb
+              - mobileye,eyeq7h-periph-east-olb
+              - mobileye,eyeq7h-periph-west-olb
+              - mobileye,eyeq7h-west-olb
+    then:
+      properties:
+        '#reset-cells':
+          const: 1
+      required:
+        - '#reset-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-acc0-olb
+              - mobileye,eyeq7h-acc1-olb
+              - mobileye,eyeq7h-south-olb
+              - mobileye,eyeq7h-xnn0-olb
+              - mobileye,eyeq7h-xnn1-olb
+    then:
+      properties:
+        '#reset-cells':
+          const: 2
+      required:
+        - '#reset-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-mips0-olb
+              - mobileye,eyeq7h-mips1-olb
+              - mobileye,eyeq7h-mips2-olb
+    then:
+      properties:
+        '#reset-cells': false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      system-controller0@45000000 {
+        compatible = "mobileye,eyeq7h-acc0-olb", "syscon";
+        reg = <0x0 0x45000000 0x0 0x1000>;
+        #reset-cells = <2>;
+        #clock-cells = <1>;
+        clocks = <&olb_south 7>, <&olb_east 5>;
+        clock-names = "ref_100p0", "ref_106p6";
+      };
+    };
diff --git a/include/dt-bindings/clock/mobileye,eyeq7h-clk.h b/include/dt-bindings/clock/mobileye,eyeq7h-clk.h
new file mode 100644
index 000000000000..76e06a0abd02
--- /dev/null
+++ b/include/dt-bindings/clock/mobileye,eyeq7h-clk.h
@@ -0,0 +1,119 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Mobileye Vision Technologies Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ7H_CLK_H
+#define _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ7H_CLK_H
+
+/* ACC0 and ACC1 OLBs PLL and dividers */
+#define EQ7HC_ACC_PLL_VMP	0
+#define EQ7HC_ACC_PLL_MPC	1
+#define EQ7HC_ACC_PLL_PMA	2
+#define EQ7HC_ACC_PLL_NOC	3
+#define EQ7HC_ACC_DIV_PMA	4
+#define EQ7HC_ACC_DIV_NCORE	5
+#define EQ7HC_ACC_DIV_CFG	6
+
+/* DDR0 and DDR1 OLBs PLL and dividers */
+#define EQ7HC_DDR_PLL		0
+#define EQ7HC_DDR_DIV_APB	1
+#define EQ7HC_DDR_DIV_PLLREF	2
+#define EQ7HC_DDR_DIV_DFI	3
+
+/* east OLB PLL and dividers */
+#define EQ7HC_EAST_PLL_106P6		0
+#define EQ7HC_EAST_DIV_REF_106P6	1
+#define EQ7HC_EAST_PLL_NOC		2
+#define EQ7HC_EAST_PLL_ISP		3
+#define EQ7HC_EAST_PLL_VEU		4
+#define EQ7HC_EAST_DIV_REF_DDR_PHY	5
+#define EQ7HC_EAST_DIV_CORE		6
+#define EQ7HC_EAST_DIV_CORE_MBIST	7
+#define EQ7HC_EAST_DIV_ISRAM_MBIST	8
+#define EQ7HC_EAST_DIV_CFG		9
+#define EQ7HC_EAST_DIV_VEU_CORE		10
+#define EQ7HC_EAST_DIV_VEU_MBIST	11
+#define EQ7HC_EAST_DIV_VEU_OCP		12
+#define EQ7HC_EAST_DIV_LBITS		13
+#define EQ7HC_EAST_DIV_ISP0_CORE	14
+
+/* MIPS0, MIPS1 and MIPS2 OLBs PLL and dividers */
+#define EQ7HC_MIPS_PLL_CPU	0
+#define EQ7HC_MIPS_DIV_CM	1
+
+/* periph east OLB PLL and dividers */
+#define EQ7HC_PERIPH_EAST_PLL_PER	0
+#define EQ7HC_PERIPH_EAST_DIV_PER	1
+
+/* periph west OLB PLL and dividers */
+#define EQ7HC_PERIPH_WEST_PLL_PER	0
+#define EQ7HC_PERIPH_WEST_PLL_I2S	1
+#define EQ7HC_PERIPH_WEST_DIV_PER	2
+#define EQ7HC_PERIPH_WEST_DIV_I2S	3
+
+/* south OLB PLL and dividers */
+#define EQ7HC_SOUTH_PLL_100P0		0
+#define EQ7HC_SOUTH_DIV_REF_100P0	1
+#define EQ7HC_SOUTH_PLL_XSPI		2
+#define EQ7HC_SOUTH_PLL_VDIO		3
+#define EQ7HC_SOUTH_PLL_PER		4
+#define EQ7HC_SOUTH_DIV_VDO_DSI_SYS	5
+#define EQ7HC_SOUTH_DIV_PMA_CMN_REF	6
+#define EQ7HC_SOUTH_DIV_REF_UFS		7
+#define EQ7HC_SOUTH_DIV_XSPI_SYS	8
+#define EQ7HC_SOUTH_DIV_XSPI_MBIST	9
+#define EQ7HC_SOUTH_DIV_NOC_S		10
+#define EQ7HC_SOUTH_DIV_PCIE_SYS	11
+#define EQ7HC_SOUTH_DIV_PCIE_SYS_MBIST	12
+#define EQ7HC_SOUTH_DIV_PCIE_GBE_PHY	13
+#define EQ7HC_SOUTH_DIV_UFS_CORE	14
+#define EQ7HC_SOUTH_DIV_UFS_SMS		15
+#define EQ7HC_SOUTH_DIV_UFS_ROM_SMS	16
+#define EQ7HC_SOUTH_DIV_ETH_SYS		17
+#define EQ7HC_SOUTH_DIV_ETH_MBIST	18
+#define EQ7HC_SOUTH_DIV_CFG_S		19
+#define EQ7HC_SOUTH_DIV_TSU		20
+#define EQ7HC_SOUTH_DIV_VDIO		21
+#define EQ7HC_SOUTH_DIV_VDIO_CORE	22
+#define EQ7HC_SOUTH_DIV_VDIO_CORE_MBIST	23
+#define EQ7HC_SOUTH_DIV_VDO_CORE_MBIST	24
+#define EQ7HC_SOUTH_DIV_VDO_P		25
+#define EQ7HC_SOUTH_DIV_VDIO_CFG	26
+#define EQ7HC_SOUTH_DIV_VDIO_TXCLKESC	27
+
+/* west OLB PLL and dividers */
+#define EQ7HC_WEST_PLL_106P6		0
+#define EQ7HC_WEST_DIV_REF_106P6	1
+#define EQ7HC_WEST_PLL_NOC		2
+#define EQ7HC_WEST_PLL_GPU		3
+#define EQ7HC_WEST_PLL_SSI		4
+#define EQ7HC_WEST_DIV_GPU		5
+#define EQ7HC_WEST_DIV_GPU_MBIST	6
+#define EQ7HC_WEST_DIV_LBITS		7
+#define EQ7HC_WEST_DIV_MIPS_TIMER	8
+#define EQ7HC_WEST_DIV_SSI_CORE		9
+#define EQ7HC_WEST_DIV_SSI_CORE_MBIST	10
+#define EQ7HC_WEST_DIV_SSI_ROM		11
+#define EQ7HC_WEST_DIV_SSI_ROM_MBIST	12
+#define EQ7HC_WEST_DIV_REF_DDR_PHY	13
+#define EQ7HC_WEST_DIV_CORE		14
+#define EQ7HC_WEST_DIV_CORE_MBIST	15
+#define EQ7HC_WEST_DIV_CFG		16
+#define EQ7HC_WEST_DIV_CAU		17
+#define EQ7HC_WEST_DIV_CAU_MBIST	18
+
+/* XNN0 and XNN1 OLBs PLL and dividers */
+#define EQ7HC_XNN_PLL_XNN0	0
+#define EQ7HC_XNN_PLL_XNN1	1
+#define EQ7HC_XNN_PLL_XNN2	2
+#define EQ7HC_XNN_PLL_CLSTR	3
+#define EQ7HC_XNN_DIV_XNN0	4
+#define EQ7HC_XNN_DIV_XNN1	5
+#define EQ7HC_XNN_DIV_XNN2	6
+#define EQ7HC_XNN_DIV_CLSTR	7
+#define EQ7HC_XNN_DIV_I2	8
+#define EQ7HC_XNN_DIV_I2_SMS	9
+#define EQ7HC_XNN_DIV_CFG	10
+
+#endif

-- 
2.52.0


