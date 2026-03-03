Return-Path: <linux-mips+bounces-13332-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC6DDaQyp2k/fwAAu9opvQ
	(envelope-from <linux-mips+bounces-13332-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:12:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A96071F5BC7
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 20:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B05B3096DAD
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 19:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625FF48C8CD;
	Tue,  3 Mar 2026 19:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="bRsYtwyu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2230EF92;
	Tue,  3 Mar 2026 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565069; cv=none; b=p4ljKp+c4T0opJG8oJmnRhFXen7WH9b13op0L/wOx7R+sZYn60BRnc1QHRuetVRzEziWmZTsIL+gkkKtM5zfvEeAjdRqAr2gPHL6+VxnVCgktKmVcruGY1mM5pRp1jYw7rK8DrP3+Nm5klQgneNObTW4PsE6dz7unHiFS9QRvfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565069; c=relaxed/simple;
	bh=YYdCNmICXyoE9G4Y7GKLEAq2DFORBQxJvXK7jOn4rz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ke9kMvo7p5qY98j3ibVeeq19jeqgNZkjccSZe/0Z5R12gEHbRaS0PK9juWYbdgq9USQ6Mz60gLxbNLiHLvyzO+yIxdjM3FKbvvtdOt+GSYzU4/m7N9/JNsbhfizmD10kYBzdDw0DAK24I4LTwDcmR1wnfNZh64wHnK8wf0fcdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=bRsYtwyu; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23B5F20DC57;
	Tue,  3 Mar 2026 20:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1772565064; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K0no2injFDHLVnfrCxmhoW8zcILT+gNWAee+yl4dH+g=;
	b=bRsYtwyu5VOOa4UQxgN/usRqhBSbS3J6drtmNGBxPTeANU5YzXDljSFJJ8rLS8OpMbDtNK
	oS76OoD2SqpVQWjBcgnyRqarWGk7adiHEP16ZsNH2XKgDXJ/P4A+O3ldqKi1TM/9FA7+Sh
	SdpLD45P/mk9GBRl0Wvf6bNGIMi8hlfI+nzl6iJPkcgX8Y90/0mdvwdJNmSxH/5+cljoR6
	gw9Nf7DGaOxctHbNWfHHavjgmD92r4dLX96wCwvC6u+A95NjzAKY71BsFaGoZhCf8cwJSS
	xDgvGZVK8eYH+D1ZbQ63Q4cTarjv9cMBKy5Q/0CiKRGuIqtiHFnCXD8CFG12IA==
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
Subject: [PATCH 8/8] mips: dts: Add PCIe to EcoNet EN751221
Date: Tue,  3 Mar 2026 19:09:48 +0000
Message-Id: <20260303190948.694783-9-cjd@cjdns.fr>
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
X-Rspamd-Queue-Id: A96071F5BC7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,cjdns.fr,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13332-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add PCIe based on EN7528 PCIe driver, also add two MT76 wifi devices
to SmartFiber XP8421-B.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 arch/mips/boot/dts/econet/en751221.dtsi       | 114 ++++++++++++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   |  21 ++++
 arch/mips/econet/Kconfig                      |   2 +
 3 files changed, 137 insertions(+)

diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
index 2abeef5b744a..5568486ad8b5 100644
--- a/arch/mips/boot/dts/econet/en751221.dtsi
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /dts-v1/;
 
+#include <dt-bindings/clock/econet,en751221-scu.h>
+
 / {
 	compatible = "econet,en751221";
 	#address-cells = <1>;
@@ -30,6 +32,30 @@ cpuintc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
+	chip_scu: syscon@1fa20000 {
+		compatible = "econet,en751221-chip-scu", "syscon";
+		reg = <0x1fa20000 0x388>;
+	};
+
+	pcie_phy1: pcie-phy@1fac0000 {
+		compatible = "econet,en751221-pcie-phy1";
+		reg = <0x1fac0000 0x1000>;
+		#phy-cells = <0>;
+	};
+
+	pcie_phy0: pcie-phy@1faf2000 {
+		compatible = "econet,en751221-pcie-phy0";
+		reg = <0x1faf2000 0x1000>;
+		#phy-cells = <0>;
+	};
+
+	scuclk: clock-controller@1fb00000 {
+		compatible = "econet,en751221-scu", "syscon";
+		reg = <0x1fb00000 0x970>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
 	intc: interrupt-controller@1fb40000 {
 		compatible = "econet,en751221-intc";
 		reg = <0x1fb40000 0x100>;
@@ -41,6 +67,94 @@ intc: interrupt-controller@1fb40000 {
 		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
 	};
 
+	pciecfg: pciecfg@1fb80000 {
+		compatible = "mediatek,generic-pciecfg", "syscon";
+		reg = <0x1fb80000 0x1000>;
+	};
+
+	pcie0: pcie@1fb81000 {
+		compatible = "econet,en7528-pcie";
+		device_type = "pci";
+		reg = <0x1fb81000 0x1000>;
+		reg-names = "port0";
+		linux,pci-domain = <0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+		interrupts = <23>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scuclk EN751221_CLK_PCIE>;
+		clock-names = "sys_ck0";
+		phys = <&pcie_phy0>;
+		phy-names = "pcie-phy0";
+		bus-range = <0x00 0xff>;
+		ranges = <0x01000000 0 0x00000000 0x1f600000 0 0x00008000>,
+			 <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+				<0 0 0 2 &pcie_intc0 1>,
+				<0 0 0 3 &pcie_intc0 2>,
+				<0 0 0 4 &pcie_intc0 3>;
+
+		pcie_intc0: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		slot0: pcie@0,0 {
+			reg = <0x0000 0 0 0 0>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
+	};
+
+	pcie1: pcie@1fb83000 {
+		compatible = "econet,en7528-pcie";
+		device_type = "pci";
+		reg = <0x1fb83000 0x1000>;
+		reg-names = "port1";
+		linux,pci-domain = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+		interrupts = <24>;
+		interrupt-names = "pcie_irq";
+		clocks = <&scuclk EN751221_CLK_PCIE>;
+		clock-names = "sys_ck1";
+		phys = <&pcie_phy1>;
+		phy-names = "pcie-phy1";
+		bus-range = <0x00 0xff>;
+		ranges = <0x81000000 0 0x00000000 0x1f608000 0 0x00008000>,
+			 <0x82000000 0 0x28000000 0x28000000 0 0x08000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+				<0 0 0 2 &pcie_intc1 1>,
+				<0 0 0 3 &pcie_intc1 2>,
+				<0 0 0 4 &pcie_intc1 3>;
+
+		pcie_intc1: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		slot1: pcie@1,0 {
+			reg = <0x0800 0 0 0 0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
+	};
+
 	uart: serial@1fbf0000 {
 		compatible = "ns16550";
 		reg = <0x1fbf0000 0x30>;
diff --git a/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
index 8223c5bce67f..c633bf73add6 100644
--- a/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
+++ b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
@@ -17,3 +17,24 @@ chosen {
 		linux,usable-memory-range = <0x00020000 0x1bfe0000>;
 	};
 };
+
+&pcie0 {
+	status = "okay";
+};
+&slot0 {
+	wifi@0,0 {
+		/* MT7612E */
+		compatible = "mediatek,mt76";
+		reg = <0x0000 0 0 0 0>;
+	};
+};
+&pcie1 {
+	status = "okay";
+};
+&slot1 {
+	wifi@0,0 {
+		/* MT7592 */
+		compatible = "mediatek,mt76";
+		reg = <0x0000 0 0 0 0>;
+	};
+};
diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
index fd69884cc9a8..b37b9d25d5a4 100644
--- a/arch/mips/econet/Kconfig
+++ b/arch/mips/econet/Kconfig
@@ -13,7 +13,9 @@ choice
 		bool "EN751221 family"
 		select COMMON_CLK
 		select ECONET_EN751221_INTC
+		select HAVE_PCI
 		select IRQ_MIPS_CPU
+		select PCI_DRIVERS_GENERIC
 		select SMP
 		select SMP_UP
 		select SYS_SUPPORTS_SMP
-- 
2.39.5


