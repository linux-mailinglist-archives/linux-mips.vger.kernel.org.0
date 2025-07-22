Return-Path: <linux-mips+bounces-9869-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5F9B0E029
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jul 2025 17:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 287043B1B3B
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jul 2025 15:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D0B24466A;
	Tue, 22 Jul 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G3IVhQtk"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E123B639;
	Tue, 22 Jul 2025 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197353; cv=none; b=QO5S9hRgRJ/GrJIOeHIJBdmngo0EwDEoxiRTY6y03QvYrxfDQYhr8bqg9J2vfcmKviBt1wyYMKYEq94VnKWFhXEffUdR3KSL/NEMhtfOoeE5ZKr8yHij1MikpwjbYd2waFizqnmaJbY0c3LtUUsWE3Ja5f+y/+BtvRKCqhRZD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197353; c=relaxed/simple;
	bh=DGLHMrDrJZFJp0aKJwOBpnRmD79nS+Di1V7NTCbAkBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdZ1RVyv9mJreesx0tT/j0EXmVMZb/+E4cyq7pYQHGxKD6AlZS3qMJyMb1yTg9n0we5oFxelNAyc74CvUX5CI0hvmH7qhUDGUaDzDaUH5N/pM3pUWAyRt8EAJYT5d3vm81d7eurl87jdDT+9V1kmbzWznOxVK4cedvDFI88EXYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G3IVhQtk; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 986D9441C6;
	Tue, 22 Jul 2025 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753197349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbyGkyMHlLfNG05F1/Xl9AvyOxk34Xf2L8vifAoZ5zI=;
	b=G3IVhQtkRsK7TBW66v9yqpSf2oak0jeWxJv4+x7VDSsuWB+f3cNsCD2ZyFn8sg7XnukMOc
	rLsrBA73SpRrIIv/q1yK1MmXxgCfenBVqvJvtdxI8Yv2lQ3X9Hd0VQTA2Ffw43w/5B4OJV
	Sq1UynY4YUhKau47hutBc616pPfzXexXMTLp5RtnEcNpII4fb449p+cLr6fbW3Zt+d5bOY
	XNkF+uaR+kzUlFfvbyVs/q3hbrzw31eeghvDhUpBtPAecIAwLmQFhwqPDb4rVFYM1XaZqF
	PAtPls+dblZPUVXD56T+OBqbuHvd1Rr05MRIubFcRVeNUovqMiHyCUiTK/QbdQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 22 Jul 2025 17:15:20 +0200
Subject: [PATCH 1/2] MIPS: mobileye: dts: eyeq5: rename the emmc controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-mmc_dts_warnings-v1-1-8a8a1594dfd2@bootlin.com>
References: <20250722-mmc_dts_warnings-v1-0-8a8a1594dfd2@bootlin.com>
In-Reply-To: <20250722-mmc_dts_warnings-v1-0-8a8a1594dfd2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejhedvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfefvdejledtvddvudehueejjeelhedtgfdvueffiedtieeutdegueetteejgeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehpdhhvghloheplgduledvrdduieekrddutddrudejvdgnpdhmrghilhhfrhhomhepsggvnhhoihhtrdhmohhnihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvg
X-GND-Sasl: benoit.monin@bootlin.com

The name should match the pattern defined in the mmc-controller binding.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507220336.JhvVLL7k-lkp@intel.com/
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 699eeb30ced8159b6a0b5d75541f1e6cb6ef4e5e..36a73e8a63a1ab32d1c300d17c4491b175428cdf 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -254,7 +254,7 @@ timer {
 			};
 		};
 
-		emmc: sdhci@2200000 {
+		emmc: mmc@2200000 {
 			compatible = "mobileye,eyeq-sd4hc", "cdns,sd4hc";
 			reg = <0 0x2200000 0x0 0x1000>;
 			interrupt-parent = <&gic>;

-- 
2.50.1


