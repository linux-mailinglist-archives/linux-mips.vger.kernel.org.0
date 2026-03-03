Return-Path: <linux-mips+bounces-13325-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEBIEgEzp2kjfwAAu9opvQ
	(envelope-from <linux-mips+bounces-13325-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:14:09 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCB91F5C2A
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E52F7306C7DD
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 19:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B93426EBE;
	Tue,  3 Mar 2026 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ksl3EWxV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27F0382F12;
	Tue,  3 Mar 2026 19:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565025; cv=none; b=MVWl1cljSsJwcE3P3exKDskZ1p/W/U25s5srXwVlR/KXVgiIs772PoMS4xue7iTgA0Vj76ACga0GGBJEwp2MgWJ1s0RXpFKQGOur5aMPRyTIzmyruxoSZw8aB3o9XC9pp8DvhWG6jiANL6oisIPfdXlX1h8v/95NTpujDOUnVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565025; c=relaxed/simple;
	bh=n91FalRZ1EC02YLJrRvyn2sLuZTyyP4MPd/eqNnP1Kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rm7O9J+Q+JCUykb7GRJvNroBmtmqYA8VqoGKgx2f0eZMTuECtQATHO+TXzAWS2BCckvw7whLlIVn1ojKaxc0R8gHlSC8q/R0/T3ZcYTJDlXRHuQRkv0RNPlfA4mLTDVVVxq/4wVZ0BM7Tzo8Ppc/eXwsQ4CRQgZoN0+SdB7sLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ksl3EWxV; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FC0420CBF0;
	Tue,  3 Mar 2026 20:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772565021; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=A82tQnKaCSOjoGsjoAObd55xvw1zvDTyvCELotse1aY=;
	b=ksl3EWxV8AvEJZydZKYVMHd5VL7PqR+R/Hz9AtHHhreh2w+gwnprRJJvKu9UmT77gJZz/F
	8Hdv5j7NpYjcB8ga7uTIQj9B4ytT6G2aTg5i8eSgiTuI2CAOvEhSZFnCjTq6bRJxksVfmF
	ul9KJoIWT9iUTgw4PpbbbUXDxOIcwb7QjSTLl8jE8Xn2TR9+4c/QLKP5pV6DBSLf9U177c
	IeVyu11DuEkyf59/+OcxODzLcNRZyWJCfLSLlHWXLpoIbH60i2xrf74r5N7E8Hj8c6AG4+
	K9VP3sG9lbIJYV/+1OhlhGyK+E1U/oMyNlYtS7zTebAsIUcSHWy/GGK6Lz6mdA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: naseefkm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cjd@cjdns.fr,
	tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nbd@nbd.name,
	ansuelsmth@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/8] dt-bindings: clock, reset: Add econet EN751221 bindings
Date: Tue,  3 Mar 2026 19:09:41 +0000
Message-Id: <20260303190948.694783-2-cjd@cjdns.fr>
In-Reply-To: <20260303190948.694783-1-cjd@cjdns.fr>
References: <20260303190948.694783-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: ADCB91F5C2A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13325-lists,linux-mips=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tyhicks.com:email,devicetree.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cjdns.fr:dkim,cjdns.fr:email,cjdns.fr:mid,1fa20000:email]
X-Rspamd-Action: no action

Add clock and reset bindings for EN751221 as well as
a "chip-scu" which is an additional regmap that is used
by the clock driver as well as others. This split of the
SCU across two register areas is the same as the Airoha
AN758x family.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 19 ++++++-
 .../mips/econet,en751221-chip-scu.yaml        | 41 ++++++++++++++++
 MAINTAINERS                                   |  3 ++
 .../dt-bindings/clock/econet,en751221-scu.h   | 15 ++++++
 .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
 5 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index a8471367175b..e60e54273393 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -32,6 +32,7 @@ properties:
       - enum:
           - airoha,en7523-scu
           - airoha,en7581-scu
+          - econet,en751221-scu
 
   reg:
     items:
@@ -67,7 +68,10 @@ allOf:
   - if:
       properties:
         compatible:
-          const: airoha,en7581-scu
+          items:
+            - enum:
+                - airoha,en7581-scu
+                - econet,en751221-scu
     then:
       properties:
         reg:
@@ -98,3 +102,16 @@ examples:
               #reset-cells = <1>;
       };
     };
+
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      scuclk2: clock-controller@1fb00000 {
+        compatible = "econet,en751221-scu";
+        reg = <0x1fb00000 0x970>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
new file mode 100644
index 000000000000..7c7c8cf8d2a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/econet,en751221-chip-scu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet Chip SCU Controller for EN751221 SoC
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The EcoNet chip-scu block provides a configuration interface for clock,
+  io-muxing and other functionalities used by multiple controllers (e.g. clock,
+  pinctrl, ecc) on EN751221 SoC.
+
+properties:
+  compatible:
+    items:
+      - const: econet,en751221-chip-scu
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      syscon@1fa20000 {
+        compatible = "econet,en751221-chip-scu", "syscon";
+        reg = <0x1fa20000 0x388>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 14899f1de77e..56cf73ce91b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9113,12 +9113,15 @@ M:	Caleb James DeLisle <cjd@cjdns.fr>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
+F:	Documentation/devicetree/bindings/mips/econet,en751221-chip-scu.yaml
 F:	Documentation/devicetree/bindings/mips/econet.yaml
 F:	Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
 F:	arch/mips/boot/dts/econet/
 F:	arch/mips/econet/
 F:	drivers/clocksource/timer-econet-en751221.c
 F:	drivers/irqchip/irq-econet-en751221.c
+F:	include/dt-bindings/clock/econet,en751221-scu.h
+F:	include/dt-bindings/reset/econet,en751221-scu.h
 
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
diff --git a/include/dt-bindings/clock/econet,en751221-scu.h b/include/dt-bindings/clock/econet,en751221-scu.h
new file mode 100644
index 000000000000..34179b8fe2f9
--- /dev/null
+++ b/include/dt-bindings/clock/econet,en751221-scu.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_
+#define _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_
+
+#define EN751221_CLK_PCIE	0
+#define EN751221_CLK_SPI	1
+#define EN751221_CLK_BUS	2
+#define EN751221_CLK_CPU	3
+#define EN751221_CLK_HPT	4
+#define EN751221_CLK_GSW	5
+
+#define EN751221_MAX_CLKS	6
+
+#endif /* _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_ */
diff --git a/include/dt-bindings/reset/econet,en751221-scu.h b/include/dt-bindings/reset/econet,en751221-scu.h
new file mode 100644
index 000000000000..bad499d4d50a
--- /dev/null
+++ b/include/dt-bindings/reset/econet,en751221-scu.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_ECONET_EN751221_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_ECONET_EN751221_H_
+
+#define EN751221_XPON_PHY_RST		 0
+#define EN751221_PCM1_ZSI_ISI_RST	 1
+#define EN751221_FE_QDMA1_RST		 2
+#define EN751221_FE_QDMA2_RST		 3
+#define EN751221_FE_UNZIP_RST		 4
+#define EN751221_PCM2_RST		 5
+#define EN751221_PTM_MAC_RST		 6
+#define EN751221_CRYPTO_RST		 7
+#define EN751221_SAR_RST		 8
+#define EN751221_TIMER_RST		 9
+#define EN751221_INTC_RST		10
+#define EN751221_BONDING_RST		11
+#define EN751221_PCM1_RST		12
+#define EN751221_UART_RST		13
+#define EN751221_GPIO_RST		14
+#define EN751221_GDMA_RST		15
+#define EN751221_I2C_MASTER_RST		16
+#define EN751221_PCM2_ZSI_ISI_RST	17
+#define EN751221_SFC_RST		18
+#define EN751221_UART2_RST		19
+#define EN751221_GDMP_RST		20
+#define EN751221_FE_RST			21
+#define EN751221_USB_HOST_P0_RST	22
+#define EN751221_GSW_RST		23
+#define EN751221_SFC2_PCM_RST		24
+#define EN751221_PCIE0_RST		25
+#define EN751221_PCIE1_RST		26
+#define EN751221_CPU_TIMER_RST		27
+#define EN751221_PCIE_HB_RST		28
+#define EN751221_SIMIF_RST		29
+#define EN751221_XPON_MAC_RST		30
+#define EN751221_GFAST_RST		31
+#define EN751221_CPU_TIMER2_RST		32
+#define EN751221_UART3_RST		33
+#define EN751221_UART4_RST		34
+#define EN751221_UART5_RST		35
+#define EN751221_I2C2_RST		36
+#define EN751221_XSI_MAC_RST		37
+#define EN751221_XSI_PHY_RST		38
+#define EN751221_DMT_RST		39
+#define EN751221_USB_PHY_P0_RST		40
+#define EN751221_USB_PHY_P1_RST		41
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_ECONET_EN751221_H_ */
-- 
2.39.5


