Return-Path: <linux-mips+bounces-9624-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24022AF92BA
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 14:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B00501C87FCC
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 12:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462D72E9742;
	Fri,  4 Jul 2025 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I2NU57WR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58A42D780F;
	Fri,  4 Jul 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632492; cv=none; b=JXaO9PR1CaZDfHVpKYjfE+6vpZqYFYU0LsTuiJRnlIeSak42tVEV2uQCrJR2rgQxwPm122pcpSb3gp1v0AYCVRWtQdtqmbi3VZ3bctugEQ8wM5JhOZzWDLLl12Nm5U8lxO3QG9g9KwF5YAgrE9qEsfzm8OPqRRxZO+4/ghzeCrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632492; c=relaxed/simple;
	bh=OvquuHVICDQ9XundXMM5947JvWF+4DgoayME0Jx/qJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUnzI7tgGWDB95ZIStKStthxoQSms2Ek5Ag/vt57VcIb3J675mzOyWDFpx218C9pVfV/ndgJj5XuL1n7r1SMbHaN8GCzqdwlllGV/yYGSkzPAd1KuuuI3ijYBC8cm9m4SKreMwMv5jTqqpqtnk4DeyrNA/fE+yq4zMa1Ya54+Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I2NU57WR; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 8CEF8582FC8;
	Fri,  4 Jul 2025 11:47:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 029AC1F433;
	Fri,  4 Jul 2025 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751629632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBz2O02Tt4mWeplOHbeNiFeXMoyO2YXfDzvyEphZrEY=;
	b=I2NU57WRV/5ZwcQyU1TiL6jD76BY4z3K6ljjuhSLWFwBHcHrs+sdxaTwmqx6939wyCpU7P
	TQFrlHPX0zAVP+ziuRUgfrq+usBwivCE5j+yl+KY5UyCdwloE7kWpdOyXWoNzfCLJkqOcY
	z9xyzANk0C3Uz2FGqiA1JfbruGqUWurTLrnvQHOnNfuofEg1q/MAY9e9hh1gU1b+d2rkM9
	mQhb84OEtESzeB7Wj4pPubrThXJPcN7iHgTMTSP7tl0zVoa2K1QwmXckP2WjqQ3IG4SMtU
	ELyEVLo3EmtXojTyET/FQR/0Q4TiVFPGBaEBVk2l1NzMtThr5AkH/tS63cWevw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 04 Jul 2025 13:47:09 +0200
Subject: [PATCH 4/6] MIPS: mobileye: eyeq5: add two GPIO bank nodes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250704-of-commits-v1-4-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
In-Reply-To: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudeingdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

This platform uses the same GPIO controller as Nomadik. It however has
its own pinconf & pinmux controller. EyeQ5 is the first platform to use
gpio-nomadik independently from pinctrl-nomadik.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index b9b6f2684e675020d0377147a04d7ad5bfc272c1..b8df7906231d065032b12d0ffdc93a75c8f3e822 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -253,6 +253,36 @@ timer {
 				clocks = <&olb EQ5C_CPU_CORE0>;
 			};
 		};
+
+		gpio0: gpio@1400000 {
+			compatible = "mobileye,eyeq5-gpio";
+			reg = <0x0 0x1400000 0x0 0x1000>;
+			gpio-bank = <0>;
+			ngpios = <29>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 14 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&olb 0 0 29>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			resets = <&olb 0 26>;
+		};
+
+		gpio1: gpio@1500000 {
+			compatible = "mobileye,eyeq5-gpio";
+			reg = <0x0 0x1500000 0x0 0x1000>;
+			gpio-bank = <1>;
+			ngpios = <23>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 14 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&olb 0 29 23>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			resets = <&olb 0 26>;
+		};
 	};
 };
 

-- 
2.50.0


