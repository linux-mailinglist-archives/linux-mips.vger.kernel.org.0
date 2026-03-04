Return-Path: <linux-mips+bounces-13367-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDUzLmNRqGnUtAAAu9opvQ
	(envelope-from <linux-mips+bounces-13367-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:36:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4F202E1C
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A48C3013C75
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 15:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267E533C19E;
	Wed,  4 Mar 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pGco7t5F"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF7E33C1BD
	for <linux-mips@vger.kernel.org>; Wed,  4 Mar 2026 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637964; cv=none; b=L7C2Xp3wCcPM3YbkxbxHbQwrdFS4UFfHRjFyNyWGjcUES9qweOpicQja+4ffrO2+AvpjKSshUBBYhjY2DeXEU9zeokLtdzN5bhhy0WZ5WaTMGXXZ/2t3/WwjkvPkXhIdJvoOyuKAQiBwU9xoni4rTsbVcWYinhrqK1RvZqa9tHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637964; c=relaxed/simple;
	bh=F8JawxO+mIIoZ8mYoUUc54WkUzEr4ysxEtWr9HwiTXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHeR9NgXP22XfiDPU9nRHKXTRgTzpaOz2W2Yaa9L7HeTQFEVk8+YelJAnOy+u6XNJEqgpE+vLgelZEqcAsj9/BYmT8pEdxjYZbq/sXIaDKAeLSK/UgJrmNkvCsfqMBJUfRiibAN+hc8Vvm5kv4ept08KlhMtJNweFHfCXP4w8Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pGco7t5F; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C0276C143D8;
	Wed,  4 Mar 2026 15:26:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 989ED5FF5C;
	Wed,  4 Mar 2026 15:26:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8067C103697E4;
	Wed,  4 Mar 2026 16:25:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9UHr3CNt/FyTmL3vNkKdZbRX+TRoGerGvEUkQpApgYA=;
	b=pGco7t5FG/VkYl7tIFmtq733OHgXy/Sn8nJr2IHmt2wxIjK4aJpKz0Y3rVmgSv+3IudBvp
	gQ3pojUDJyUXE9n/2I2ZtaUqwGkmx+fQsY0Pjo8FpMhAdvKP2GJR+C46dth2SvElbnQTlD
	E6qXuzUQ1PKg8p2beOgD6XxISABeoh3vp5insMpIb1LTwI2D+MxmXBFPVMIcQ8sQw7R/sh
	G58Q1hQsIBQOkpSAh8HntU/3AoTZBcTBhQYwVdExK9YArNB1XdMaQkRMCYVFxhfzfS2rEw
	eO1O0IXHTCSaQSsxBLq9P7hTcsDe4DPD9Sp4ymFLM68XU/fer3ba0PKopXbuiA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:15 +0100
Subject: [PATCH v4 01/10] dt-bindings: soc: mobileye: Add EyeQ7H OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-clk-eyeq7-v4-1-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
In-Reply-To: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
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
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: B6C4F202E1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13367-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,mobileye.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,2.174.165.64:email]
X-Rspamd-Action: no action

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml | 192 +++++++++++++++++++++
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h    | 119 +++++++++++++
 2 files changed, 311 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml
new file mode 100644
index 000000000000..2958ca9e330b
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
+          items:
+            - description: Reference input clock.
+        clock-names:
+          items:
+            - const: ref
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
+additionalProperties: false
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
2.53.0


