Return-Path: <linux-mips+bounces-6849-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41F9E1E64
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 14:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028D82839B4
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 13:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA451F7095;
	Tue,  3 Dec 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GxS41E/f"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587221F4725;
	Tue,  3 Dec 2024 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234162; cv=none; b=h4kjEZAIjFepZ9WFDOrDKCpaPZAaUmxuVqSmNDJX8iV/mGox/A3Aqi8XGmG4nX2mLBP+Mc+LXBkYWVEjnw4VXea8OSgOVYZEcT+w3GskDTggGTqTNOrGlw8WFbmArQfYNDYnF8rYtPaE6M0XYjMtKNBN+M0anwULO1VRqcsVuN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234162; c=relaxed/simple;
	bh=pVnB3J68SJ5ZbxJrKUNajMzxZzFavA5FR2dTH5pwM0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoibZH4sweHxixtj1bs4CZ711f/8SdFoiBtN7JZfYSUNtpZGCOdhMyyjCqyWOVleoRGPHfXX5NPq58jEkJeoES6wBcWT3+W9ouLUNeoj8qkQzKHLPoWWSuc+0Z/3lqs3tpQzFKrWBlD8JcSFV5luV+eggw/C+whAv/3zLpX7TQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GxS41E/f; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 785EE60012;
	Tue,  3 Dec 2024 13:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733234152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o69Mz00pbhAuPCU0BiftNOE1d7MIT8r8LNe86G5wyqg=;
	b=GxS41E/fP4BUArZNLoPs+47NgNxZSk/SrDSF4rQwN3DJCqlfWXxiePM3CERDbbxvS5LGXR
	GqZS8SsUytpbJPkH1/tjzrwLBKjh5ysd4arKAHn3ru9CEdbLCCaaPkFF0Tkle1FQSfHdxk
	KDoslF8vQ7WXGWtYmEDV00oSU0s2fHdOKvyevQGaUaTSE4ZkwILDFy/8ZQRi2dZK8gqVod
	oxCPN+lGsYsFQ6pjQGLqi1cQvoY/JPjGx1+pfkArHszoKz/qy3hj3RFUxYv3cVBX6mXbdD
	w21RwZXjEMygK5KyiPODPs/FfvZlSVCI9koJkiMvliHiUIn5t8SVlS5LdFch7g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 03 Dec 2024 14:55:49 +0100
Subject: [PATCH 6/6] MIPS: mobileye: eyeq5: add bootloader config reserved
 memory
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-rmem-v1-6-24f4970cf14e@bootlin.com>
References: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
In-Reply-To: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Add a new reserved-memory node, containing bootloader config with MAC
addresses for both ethernet instances of the SoC.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 5d73e8320b8efc1b4f68923482bf188c4345f1cb..a84e6e720619ef99e1405ae6296d8bad1aa3fa23 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -49,6 +49,28 @@ mini_coredump0_reserved: mini-coredump0@806200000 {
 		mhm_reserved_0: the-mhm-reserved-0@0 {
 			reg = <0x8 0x00000000 0x0 0x0000800>;
 		};
+
+		nvram@461fe00 {
+			compatible = "mobileye,eyeq5-bootloader-config", "nvmem-rmem";
+			reg = <0x0 0x0461fe00 0x0 0x200>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			no-map;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				eth0_mac: mac@7c {
+					reg = <0x7c 0x6>;
+				};
+
+				eth1_mac: mac@82 {
+					reg = <0x82 0x6>;
+				};
+			};
+		};
 	};
 
 	aliases {

-- 
2.47.1


