Return-Path: <linux-mips+bounces-6762-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE39CEFFD
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 16:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 877AE1F22CE7
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 15:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708841E1A3D;
	Fri, 15 Nov 2024 15:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L69+Ttyz"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990E1DFDB1;
	Fri, 15 Nov 2024 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684623; cv=none; b=X8tvEKUeiuGLYY42w8cgk2e5DOkzeV+rbcYphvUnW8U6zJN5TUzX39xzN7RA5HxX1n8vkNwiQufemR8mB2X+XCEiOAy5Bo3KfrgadU9LdbtT4WJyYvkIHzxkxBBKPNWe0HlCoNfEyFG3fHg7IPpaJxOecFbZW/tqPWtwWpefxnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684623; c=relaxed/simple;
	bh=rcLw8UU9Jp5A5RZQ8av4V49LPxylNIxppm2k4MDo8m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRXObV26EomXG6gGpKmIB5fgQoYnHQwKP4VZb8ZVwNi5an6GO6gxsyYeR7Y68Cqa74xwQesAfPabBFgS24kZiNm+yOFzpYLyfHZftmir9KNKgyy4TYezSoI20W1IDcYrJUXMEXT3FqJ+DHtiij5at+u9Z77DAminvhGksxgn6ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L69+Ttyz; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CB7320008;
	Fri, 15 Nov 2024 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731684612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pceyd0h6XHg/DFWUpf8mY+3nyC6bAPKNaNi+3u32HGA=;
	b=L69+TtyzVjGtce4XBia4Pini3CIbBOAXNIBQ/hldCEnREU7zmG9y5FQcIhbtfM1dbV7Y3w
	YAZPMWsObh2fJ1qXEsJ2/9avTMgzO1lr1ZOJHcv2hr+M8OK42QPtil20RaFqTxk+HvMsZh
	BVArkUF6agclX+UF9HKXVDgTrF8+ywUCz6x/EuzQTHHkfzl8OjslluI6AVaXYOViRbhjP9
	hywpKAO8a1b7cLGoKzC1afGKePPLqP64CVkyvcaFNgPIc0ALa/Ji367fZK79Kw1RUhCL/N
	eHqzmnP3Z11+CI69xPhvhZUs8GNfvaeMQFHB6O2I8VXKnMcq8zeosfQjxWegrA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 15 Nov 2024 16:29:58 +0100
Subject: [PATCH 5/5] MIPS: mobileye: dts: eyeq6h: Enable cluster support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-cluster-hci-broken-v1-5-00636800611d@bootlin.com>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
In-Reply-To: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: gregory.clement@bootlin.com

The CM3.5 device used in EyeQ6H SoCs incorrectly reports the status
for Hardware Cache Initialization (HCI). This commit adds a property
to acknowledge this issue, which enables the use of the second CPU
cluster.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 1db3c3cda2e395025075387bcb66ea0737fd37f6..0195b5e5227c60031607a1707f152910ab610d4c 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -32,6 +32,11 @@ cpu_intc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
+	coherency-manager {
+		compatible = "mti,mips-cm";
+		cm3-l2-config-hci-broken;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.45.2


