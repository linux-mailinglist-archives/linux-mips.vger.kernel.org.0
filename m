Return-Path: <linux-mips+bounces-13224-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CqrG9Eqn2kkZQQAu9opvQ
	(envelope-from <linux-mips+bounces-13224-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 18:01:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179819B1FC
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 18:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 058FB3130201
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 16:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AB83E9F69;
	Wed, 25 Feb 2026 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QI9mEvyJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32093E8C5B;
	Wed, 25 Feb 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038533; cv=none; b=d0INBkxjj/wU761lGAGNczMb8B7Ccon1hSO9KXQ1tO6DKX4Bz3AGnLZC8r0jk/KDZArjNRUpyxIIRQmSTl616kkaslJlcVDJl5X/xgH4B3b18lmnYw69Y5RFqPFBLY93abtStWEwTlSwbma4sj/fSjqpWYuhLEFHb9QTmL92is0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038533; c=relaxed/simple;
	bh=dqQlFOLNKCzxUjTLp8e0xQ3g5gTV0hV+3qhAGQv1U00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZnTjM/N+8qkLQ+jF+JKGpnFrW0L/3zJQJG8dQLIAyVPmYLS3VQMr1XaJqTnWLKUeT8BFlldnzl80hYrTPZ3m4RbBtXFglAxK/FKz5EtXU3vgdK6FYCL0AEwq3iehb6H8JMUPBddU8vYOrw5LHf+RHaitAf0UvLAb6RhmmFTyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QI9mEvyJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 688761A1352;
	Wed, 25 Feb 2026 16:55:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38D965FDE6;
	Wed, 25 Feb 2026 16:55:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6627103692EB;
	Wed, 25 Feb 2026 17:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772038529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j+Jb1w0Df1lPZ9Z1w2OV+edF6GnVPq+ijZ497yS48L8=;
	b=QI9mEvyJTDu5mLGHAii+P0ko70C+fzfgFlv/CPUFLNqv+OxVZmN3RlSMljs0BJbQRsu6vE
	o+alAo03+J8pgsFAXXxEWUeDOsBLoeh1AXuyl4RNKCqEHG17R2tfJr9rdEyWiLvcQ6RtcS
	RG74LapEBekV12OLCk53+zZp3zGVBf1kKM5S60FbQa4B9grI4T3aBhhSMi3RCE3hrH2oCM
	Ie/uFUGG+vVYIONPJ0I6teggX5ipINJOcpSknAyFSsHPLTAR0F/r8tVAPKw4W/yQmS6dIW
	gZFiqAWkerxLdVDSjrsxbAMtXlU2ltQW/k3o7L6rO/vkqgyzcfomY14hAGfcgg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 25 Feb 2026 17:55:23 +0100
Subject: [PATCH v7 2/3] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet
 controllers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260225-macb-phy-v7-2-d3c9842ec931@bootlin.com>
References: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
In-Reply-To: <20260225-macb-phy-v7-0-d3c9842ec931@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13224-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e00000:email,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.2.34.224:email,0.22.227.96:email]
X-Rspamd-Queue-Id: 0179819B1FC
X-Rspamd-Action: no action

Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 36a73e8a63a1..cec5ad875228 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -77,6 +77,8 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
+		ethernet0 = &macb0;
+		ethernet1 = &macb1;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -231,6 +233,7 @@ olb: system-controller@e00000 {
 			#clock-cells = <1>;
 			clocks = <&xtal>;
 			clock-names = "ref";
+			#phy-cells = <1>;
 		};
 
 		gic: interrupt-controller@140000 {
@@ -305,6 +308,48 @@ gpio1: gpio@1500000 {
 			#interrupt-cells = <2>;
 			resets = <&olb 0 26>;
 		};
+
+		iocu-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-coherent;
+			dma-ranges = <0x10 0x00000000 0x0 0x0 0x10 0>;
+
+			macb0: ethernet@2a00000 {
+				compatible = "mobileye,eyeq5-gem";
+				reg = <0x0 0x02a00000 0x0 0x4000>;
+				interrupt-parent = <&gic>;
+				/* One interrupt per queue */
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "pclk", "hclk", "tsu_clk";
+				clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+				nvmem-cells = <&eth0_mac>;
+				nvmem-cell-names = "mac-address";
+				phys = <&olb 0>;
+			};
+
+			macb1: ethernet@2b00000 {
+				compatible = "mobileye,eyeq5-gem";
+				reg = <0x0 0x02b00000 0x0 0x4000>;
+				interrupt-parent = <&gic>;
+				/* One interrupt per queue */
+				interrupts = <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "pclk", "hclk", "tsu_clk";
+				clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+				nvmem-cells = <&eth1_mac>;
+				nvmem-cell-names = "mac-address";
+				phys = <&olb 1>;
+			};
+		};
+
 	};
 };
 

-- 
2.53.0


