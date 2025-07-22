Return-Path: <linux-mips+bounces-9870-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99214B0E039
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jul 2025 17:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BB4D1883D95
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jul 2025 15:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010A9245033;
	Tue, 22 Jul 2025 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DycZFgPq"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5923B62B;
	Tue, 22 Jul 2025 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197353; cv=none; b=ANhmYwGP5uDyJDLUEbZkTO/ewacVJZ1t2Yl16WizxNvUUDnbY3Ghz5ZuumEOL8S6EhW3WsHK8qtGvM7HA4inXCGcJ9G2OW4UF27LDdANrhCzjAJAnfmcuQsl2dTaimNuL4OaSpji157rEPageWRlyWIKd2eXbUbrmKXpcN9feEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197353; c=relaxed/simple;
	bh=uk8lMsAdJeKUbDd8hlCoUXYBYkf+zJJniYwJBxbKCps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsVdlNri7owPYfI2SZJbvpQwJYJm5oIFrXY+gMJGrl6SX/p/FXIMOeNqtoF0nEr48A8/eSGbN3yXVUbDGP3YYhtEVRzYUJsGhYw8XAmrtDAYqz4Zw//gR4y5FegVcyQxkzZ/qd55I9YLUbTbAwR8JjhyzkdKvrnvA6KTvOHI4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DycZFgPq; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 420A0438DC;
	Tue, 22 Jul 2025 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753197349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ggz89UiruJ+IKaN9iykZ93xSbQgCXL3G5HnjNJV4Ruk=;
	b=DycZFgPqUJO1s7o1dKpaCc7NJ8sV4IseRQyuTonuGnk+GcQwJuoxCx9l9oI9wqa+bTg7dS
	E2aJPqTJvRPRIo6LQZ9WLcU7wX03RiFzXnxZxd+p8h85dc9rQfGeo97W+nIOWoABlaJQeP
	ysEDPWqMk9T3/i5Sv201t873pFHs3PHzxjx0/frsd6dmnJkvtbCZBkZB+MgaZuDVMIX8Lq
	EkZtdpDPtnQG26Qn9LBvdDMo3sQDuD5XAVmUk4has2gHCsI9ovt5H90XJeTOwT2r9Cv5R2
	NBNbRNrqokwFBoDIVvSDIUG/IHYjJnLLPmAha1wnSeaYTSbROHJeezuD+U0BnQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 22 Jul 2025 17:15:21 +0200
Subject: [PATCH 2/2] MIPS: mobileye: dts: eyeq6h: rename the emmc
 controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250722-mmc_dts_warnings-v1-2-8a8a1594dfd2@bootlin.com>
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
Closes: https://lore.kernel.org/oe-kbuild-all/202507220215.wVoUMK5B-lkp@intel.com/
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index bbd463435ad658105a862c5b550d21e1110e7c8c..5ae939d25ea87ddc15cb848c249beed3d07e32e0 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -109,7 +109,7 @@ olb_east: system-controller@d3358000 {
 			clock-names = "ref";
 		};
 
-		emmc: sdhci@d8010000 {
+		emmc: mmc@d8010000 {
 			compatible = "mobileye,eyeq-sd4hc", "cdns,sd4hc";
 			reg = <0 0xd8010000 0x0 0x1000>;
 			interrupt-parent = <&gic>;

-- 
2.50.1


