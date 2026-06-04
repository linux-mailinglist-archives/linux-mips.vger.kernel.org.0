Return-Path: <linux-mips+bounces-14885-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SX8/Oe+AIWpJHgEAu9opvQ
	(envelope-from <linux-mips+bounces-14885-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:43:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F146406ED
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 15:43:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=SlLDjXLX;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14885-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-14885-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B11B43119D17
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 13:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BB747B42F;
	Thu,  4 Jun 2026 13:26:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0F4478E2B
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 13:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579596; cv=none; b=kgRiFdGTwVMxX0DeqzQ8a3AMaoiKSG/gcMgRx29sus8l7r3UsXePXaKn1DikoJHqAGrDuSzBDdKptr+Dn5z/z2vdxVWwlOKi7cB76BzaGL8Q7Cz5ZRtj7pUoFjzDTz4Qw/bwkQjRMkb4HDCNi5COi6/TDwhrnhiDtllHIXrzs9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579596; c=relaxed/simple;
	bh=0yEB1VRx+BhUukphFfkpRM8R29Qf0lvpljYa2FTp5ZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GuOoVcuYcVob3NGam2qNDfjyB6D7OBGhfLy1P5m9tmXE/O6JE5ebnRphPno2MiOYbay1XttseYuTCBfPydP3qRH27G/ubXG3HdEw6eE5sPxdx/Rp+1cnrffNKeueJuuF8jh3ha+iFAf41q8z9c3diGVXwcuOqDl6rjC4jHocvTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SlLDjXLX; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D8324E4062A;
	Thu,  4 Jun 2026 13:26:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E011E5FEF7;
	Thu,  4 Jun 2026 13:26:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5F30106A1B0D;
	Thu,  4 Jun 2026 15:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780579591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xfd3WnP2DqLvbnytiE6CadS+H4S7uD87MeB857iqQeY=;
	b=SlLDjXLXf8T1qf7wBAfUZtoWIxZcTHsXsoSTnTrWYvaM2MCMxMWz6HT6oRfZ+nzQthRL+9
	TPJkv/lzPR04QtF09tmDKDc9/5OqjiavYNx9Uv5UegM4313wwOk7YtRhJ1Q6yGaMY4uM25
	cIxQrwPHWmeWfWecH/6Vzjn6sXY+E/RTo1gQoWELC/fViFWyHUE80llHkkMW0Y3IRGlmCi
	HyqLcv+OXkiT2x9t+WAu24PM1B8Z3gGW2+DxLVgGR1QDPMhBSyDaDYu3oa6IfR1S87sxo0
	7PmvFT/on4hlyYvNGy3+jKLXGfiJobxX3IFnbtWe2hN3df65k6u/EEhY0hadpQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 04 Jun 2026 15:26:09 +0200
Subject: [PATCH v8 1/9] dt-bindings: soc: mobileye: Add EyeQ7H OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-clk-eyeq7-v8-1-53f618174cf6@bootlin.com>
References: <20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com>
In-Reply-To: <20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14885-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.kondratiev@mobileye.com,m:gregory.clement@bootlin.com,m:theo.lebrun@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:benoit.monin@bootlin.com,m:thomas.petazzoni@bootlin.com,m:linux-mips@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,bootlin.com:mid,bootlin.com:dkim,bootlin.com:from_mime,bootlin.com:email,mobileye.com:email,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55F146406ED

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
2.54.0


