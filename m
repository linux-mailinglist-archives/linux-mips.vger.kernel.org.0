Return-Path: <linux-mips+bounces-13695-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPyQK5kjuGk8ZgEAu9opvQ
	(envelope-from <linux-mips+bounces-13695-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:36:57 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015129C871
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAAE3312C51C
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9A03A7F61;
	Mon, 16 Mar 2026 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lbph7C6D"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51C3A7823;
	Mon, 16 Mar 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674773; cv=none; b=mmXTEecoZ7vpwmjSCRzHsrvxfhqOvu0wdvy3/yD+Kk1yWKYEzZQOiupoQlXW6stx8F/rR1VzG5Xq8bRur8sDTjym0/hxG2XrI26bDLDOk+r1x8XfI3cN4Pi7aVt8wUv4RWozQeecR5iBy4XnV2B3ffxAUZ4SdtZ5RG1bvFjQ14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674773; c=relaxed/simple;
	bh=qu1qfic7KBLY7EWIiL3AaAuZ07Rjx+XJtSK4llNtxTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCIxzqAiwMWh7klYBhaTUEcrB5Pv2CIhA3QME4u/5tM5MYTG1u+LDHNVTs6PFkMfLdVw8CpKJV0eov0WpZo5QImaeKbT7a/yjr5Oox/UR1MtRejUIB11kBrulL0hqqKExzvdUIIqB8H4hhtCpcUejL11PgTQspFlQnp5mCy00q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lbph7C6D; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7A5234E40B37;
	Mon, 16 Mar 2026 15:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 505A35FC4A;
	Mon, 16 Mar 2026 15:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B35A6103721F7;
	Mon, 16 Mar 2026 16:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RynMD57QmlInHCRSqrRnZ8BdOyZAlob/tJmmv4olNGM=;
	b=lbph7C6DybpVHHQcsArG93jXN21QS2ayHM1QzSs2yRKgDRkYKZLEQ8EXGYayUZbb/TbsJn
	h7C4XkE/VQ7EQMkynAidDV0Am6TKrGLJY8eUULDvvh6D2mBdyZqDWEkeZZ13RPbL3cHsfU
	4KNnXFe+AzJoH0QNo4ett/L6XLJgmU5jio1Q12hxJBONK86qo/239msPUpsskvE1BNtkHT
	fArlgR5T4pTbJvifAuiwcJLU8X9uCKu4zK+CfD9+Gz/mI7InW5WCGyJ+w4sZh+EC5sMAfh
	kmHwRIdYHe1in0c0qyi1MMOPwKKaJH1rtxb/y0UQ9QihXXfY3Sg0IdruvIlK1A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:48 +0100
Subject: [PATCH v4 11/13] MIPS: Add Mobileye EyeQ6Lplus evaluation board
 dts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-11-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13695-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,48.13.162.192:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,47.251.83.64:email,47.236.17.0:email]
X-Rspamd-Queue-Id: 1015129C871
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the device tree of the evaluation board of the EyeQ6Lplus SoC.

The board comes with 2GB of RAM and an SPI NAND connected to the octoSPI
controller The UART of the SoC is used as the serial console.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/Makefile            |   1 +
 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts | 103 ++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/Makefile b/arch/mips/boot/dts/mobileye/Makefile
index 7cc89968aaac..9305dd01f4c8 100644
--- a/arch/mips/boot/dts/mobileye/Makefile
+++ b/arch/mips/boot/dts/mobileye/Makefile
@@ -3,3 +3,4 @@
 
 dtb-$(CONFIG_MACH_EYEQ5)		+= eyeq5-epm5.dtb
 dtb-$(CONFIG_MACH_EYEQ6H)		+= eyeq6h-epm6.dtb
+dtb-$(CONFIG_MACH_EYEQ6LPLUS)		+= eyeq6lplus-epm6.dtb
diff --git a/arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts
new file mode 100644
index 000000000000..404d0ff09f5a
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Mobileye Vision Technologies Ltd.
+ */
+
+/dts-v1/;
+
+#include "eyeq6lplus.dtsi"
+
+/ {
+	compatible = "mobileye,eyeq6lplus-epm6", "mobileye,eyeq6lplus";
+	model = "Mobileye EyeQ6Lplus Evaluation board";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* These reserved memory regions are also defined in bootmanager
+		 * for configuring inbound translation for BARS, don't change
+		 * these without syncing with bootmanager
+		 */
+		mhm_reserved_0: the-mhm-reserved-0 {
+			reg = <0x1 0x00000000 0x0 0x0000800>;
+		};
+		bm_logs_reserved: bm-logs-reserved {
+			reg = <0x1 0x0000800 0x0 0x000f800>;
+		};
+		shmem0_reserved: shmem@804000000 {
+			reg = <0x1 0x04000000 0x0 0x1000000>;
+		};
+		shmem1_reserved: shmem@805000000 {
+			reg = <0x1 0x05000000 0x0 0x1000000>;
+		};
+		mini_coredump0_reserved: mini-coredump0@806200000 {
+			reg = <0x1 0x06200000 0x0 0x100000>;
+		};
+		mailbox_reserved: mailbox-reserved {
+			reg = <0x1 0x06300000 0x0 0x000300>;
+		};
+		sys_logs_reserved: sys-logs-reserved {
+			reg = <0x1 0x10000000 0x0 0x800000>;
+		};
+		csl_policy_logs_reserved: csl-policy-logs-reserved {
+			reg = <0x1 0x10800000 0x0 0x10000>;
+		};
+	};
+};
+
+&ospi {
+	status = "okay";
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		cdns,read-delay = <0>;
+		cdns,tshsl-ns = <400>;
+		cdns,tsd2d-ns = <120>;
+		cdns,tchsh-ns = <40>;
+		cdns,tslch-ns = <20>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <8>;
+	};
+};
+
+&spi0 {
+	pinctrl-0 = <&spi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};

-- 
2.53.0


