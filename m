Return-Path: <linux-mips+bounces-7585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902FA1A274
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 12:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6FC81887FCD
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 11:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AF620F070;
	Thu, 23 Jan 2025 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NeQmVH94"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C720E6E5;
	Thu, 23 Jan 2025 11:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630131; cv=none; b=bjO2Jpx7NFVlBJ+mdMzV8vBC8AE9J29TorMm9TUHnNb8BbWnaE7wlqpizck7BcQOuWEygJFWfe86l2Kb4/QbO0ZeSGMPqDyF18kKfb8IGG2syHKjO02IJEcWANkRUvYHjMyOy+s2Ny8DD24EtZByxxbChYpqXaqSEyCeHJxgewQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630131; c=relaxed/simple;
	bh=nyoBjJeplMqsP6hiHUlqfIT5u31Sy7DAgdVBnnvQX4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDfdA9CcXkGZtXE6YgxP5jeHrmNp56+9aTp3OJLNyabMzWYeVIK/RF740lw7X6G9IElze451tHONyaWaMLrFFEzIjFwXP5viPIbkUbuNsEEcPz+P1gduA5HhArPkeXjG1/Nqva8TRiDRoZL2ZfSw1QzTc+paC/QuyOuK7z/MbTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NeQmVH94; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2790C000B;
	Thu, 23 Jan 2025 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737630128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+xrqkHkD3Qz7CE8k+Ni75tjNz0Jjog+QmgQtGZGrmk=;
	b=NeQmVH94j1VwlXNf7q6BUMpHMqPqZ0A2CT7zkp+dnSTi79v4atNIi5fqZM2tCs5HTCrnox
	p50/3rp4TU0iWubfwfNUFukL/lF98sasoVmdLY7k/pNpWp4qk7FopG/cmF2IjULM8jv22L
	bb6WZhLeY+2rLf/EsZcKTlFxHiu9UmhTM0JZazTfw1au3RXMHpRSKwp+B/m7BL179PKfWy
	Jh+OzO66iH/NkRIwXxCT8WlV+2+KnQudzP0rNW1CvLcpRXcNGvCf+QiCU/Al1qq300Mmca
	Ss0R69NESEFTyqYJ4Dt2p8xOvIW6B1JIzHqjhkOYLceoJwG+6fKqW3pqnjTCpw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 23 Jan 2025 12:01:58 +0100
Subject: [PATCH v3 5/5] MIPS: mobileye: dts: eyeq6h: Enable cluster support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-cluster-hci-broken-v3-5-8a7ec57cbf68@bootlin.com>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
In-Reply-To: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
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
for Hardware Cache Initialization (HCI). This commit adds the
compatible string for the CM to acknowledge this issue, which enables
the use of the second CPU cluster.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index 4a1a43f351d39625b520a16d035cacd2e29d157c..dabd5ed778b739b62f5c6e7348f1837a207dbb6c 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -32,6 +32,10 @@ cpu_intc: interrupt-controller {
 		#interrupt-cells = <1>;
 	};
 
+	coherency-manager {
+		compatible = "mobileye,eyeq6-cm";
+	};
+
 	xtal: clock-30000000 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;

-- 
2.45.2


