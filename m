Return-Path: <linux-mips+bounces-13585-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKswHszpsmljQwAAu9opvQ
	(envelope-from <linux-mips+bounces-13585-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:29:00 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5C275956
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B515E30BF41B
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 16:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7073F7A9C;
	Thu, 12 Mar 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="DUkyoAfk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798DA3F789C;
	Thu, 12 Mar 2026 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332701; cv=none; b=o4oC/XOZhas9oeRxNsi4Nb1cRwTkMMgGQc9TKwyzD8hH8onmKgH+8JB4gwbhIIkzwxu6hinoB9/AY11fNSR2apB4XVjFsAusvM+8cH5E8O27DABLhzvUeiq3Wy6AomW1rVqEPk06pfOD1d/Tz78ibH2xabJBurs3QZcmm2Yx7wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332701; c=relaxed/simple;
	bh=vnbHAZ8YESHdLK0o0YsvVRrGBy0eDEjOYkGlG2Cwnlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AmgVmTtfpis9cwgTLk8jUmHLD0KOFdp677KZXZHKvAiHbfP80xQeZbLmILsPnGgcn3No/BXcwMkMQGKxt6/X9zkSbiJFS6CTrH/H7KtengXs9IAHuvQ0JrrUlOGRihPV9e7+HTM44l64Nq2kS2CP8BtnB9snSu/fpwy2sWsEgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=DUkyoAfk; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EFA72C5779;
	Thu, 12 Mar 2026 17:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773332697; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hjHy1bWTlLpd2DD7hlVFwOo884ik+VgDoTcmEap/qBU=;
	b=DUkyoAfktV9bI1/nzYJQ9zfbZnF5jRMwF7eEOYsvdRncZAy9pmvCuN3fK9yjDu4DIjvi5c
	U0lAgtOz7u+wXyDDoONfqVlNzFP0rglqjk3B8bgNlZsEPjpS3zMYED94dDfL3IHHHtx55c
	xR/CLutvslDvzhAoGJiKTB+zPcXCwb4YjXPnnHIXedqeD36F4GJSvsUjtyIKrPMtftllG+
	bLvKB9fvHEBQ1h0GpwBV8Xp40qjPad2ayZLVUAhmfTJjqF66T3377wdN7MFmr5UMh0WbOS
	+D72rssXxzd/hWs5ZIlKnivc5LJFqI+L/G0ODksxcq3gZGz9BRAXereQOKnM1g==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-clk@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	bmasney@redhat.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	p.zabel@pengutronix.de,
	nbd@nbd.name,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 1/2] dt-bindings: clock, reset: Add econet EN751221
Date: Thu, 12 Mar 2026 16:24:48 +0000
Message-Id: <20260312162449.569359-2-cjd@cjdns.fr>
In-Reply-To: <20260312162449.569359-1-cjd@cjdns.fr>
References: <20260312162449.569359-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13585-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,baylibre.com,kernel.org,pengutronix.de,nbd.name,cjdns.fr];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0AB5C275956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
an additional regmap that is used by the clock driver as well as others.
This split of the SCU across two register areas is the same as the Airoha
AN758x family.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/clock/airoha,en7523-scu.yaml     |  6 ++-
 .../devicetree/bindings/mfd/syscon.yaml       |  2 +
 MAINTAINERS                                   |  2 +
 .../dt-bindings/clock/econet,en751221-scu.h   | 12 +++++
 .../dt-bindings/reset/econet,en751221-scu.h   | 49 +++++++++++++++++++
 5 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/econet,en751221-scu.h
 create mode 100644 include/dt-bindings/reset/econet,en751221-scu.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index a8471367175b..eb24a5687639 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -32,6 +32,7 @@ properties:
       - enum:
           - airoha,en7523-scu
           - airoha,en7581-scu
+          - econet,en751221-scu
 
   reg:
     items:
@@ -67,7 +68,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: airoha,en7581-scu
+          enum:
+            - airoha,en7581-scu
+            - econet,en751221-scu
     then:
       properties:
         reg:
@@ -98,3 +101,4 @@ examples:
               #reset-cells = <1>;
       };
     };
+
diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..e22867088063 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -61,6 +61,7 @@ select:
           - cirrus,ep7209-syscon2
           - cirrus,ep7209-syscon3
           - cnxt,cx92755-uc
+          - econet,en751221-chip-scu
           - freecom,fsg-cs2-system-controller
           - fsl,imx93-aonmix-ns-syscfg
           - fsl,imx93-wakeupmix-syscfg
@@ -173,6 +174,7 @@ properties:
               - cirrus,ep7209-syscon2
               - cirrus,ep7209-syscon3
               - cnxt,cx92755-uc
+              - econet,en751221-chip-scu
               - freecom,fsg-cs2-system-controller
               - fsl,imx93-aonmix-ns-syscfg
               - fsl,imx93-wakeupmix-syscfg
diff --git a/MAINTAINERS b/MAINTAINERS
index 14899f1de77e..3781d55db5bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9119,6 +9119,8 @@ F:	arch/mips/boot/dts/econet/
 F:	arch/mips/econet/
 F:	drivers/clocksource/timer-econet-en751221.c
 F:	drivers/irqchip/irq-econet-en751221.c
+F:	include/dt-bindings/clock/econet,en751221-scu.h
+F:	include/dt-bindings/reset/econet,en751221-scu.h
 
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
diff --git a/include/dt-bindings/clock/econet,en751221-scu.h b/include/dt-bindings/clock/econet,en751221-scu.h
new file mode 100644
index 000000000000..318ec8a4670e
--- /dev/null
+++ b/include/dt-bindings/clock/econet,en751221-scu.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_
+#define _DT_BINDINGS_CLOCK_ECONET_EN751221_SCU_H_
+
+#define EN751221_CLK_PCIE	0
+#define EN751221_CLK_SPI	1
+#define EN751221_CLK_BUS	2
+#define EN751221_CLK_CPU	3
+#define EN751221_CLK_GSW	4
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


