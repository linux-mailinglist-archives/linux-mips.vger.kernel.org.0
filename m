Return-Path: <linux-mips+bounces-9350-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD08ADCD2B
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 15:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2CA91635AA
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 13:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B2D2EB5C2;
	Tue, 17 Jun 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jIclc5On"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6392E06DB;
	Tue, 17 Jun 2025 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166780; cv=none; b=G1oFMj903ONP6OKfyhwvNu1HDXrDRy45GV8Egn51+xgx/Svv2Sc7RRTe3gbNBROSi81QqTPbxLv1stM7Oc2ztk42mZiDnm1UFPhQ5ikDFN+ZDmlB2HU/YTbNKa1eUIMSlqQwMvSIqY6LTVm2NuGY8yBAJdhSIDZqpiUWSoIPVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166780; c=relaxed/simple;
	bh=/PwIrXHKsekaTOtUAKwZ3fI6+uz0OpAG9bccR7KLoRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fW+j1zgzimHcII7tKOKljdzvbI0QxNtiypKUgkCTABLl/r2zVwnQb8NV6khQowRksYOFEIQ65rH5o030MLTQV4FoqyEGOHl7ShbGi1d78PVwpxWDagkActbUBH/RNrVoH04MijtEvZkGCXgUhHNBD4qQxu4tkLeTOQks1C1zxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jIclc5On; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8134A44366;
	Tue, 17 Jun 2025 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750166771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UuUbDQ77v0Yk2YTtdmfjftSGpOtzNg2ucow3Et6vyQ=;
	b=jIclc5Onln67ME0cmXr2LbgczHn7hfujLyhEsctiMnXt2XzFvMx4d12Itrv9MTpDk2FvlO
	8ZgsyXhPeLPZZx9zoOby7pnKyzwZTLCRbqqPVqXEnFYXnpD5qmE+je+ErRRi/mRsIM9K2z
	y3hoFbW3kyzQw85lRCRb5WqpMPYz5rYc8vF0NMN6qVyrp1CYcpLkaNaJkupBpxW9lmmnS+
	yuDka9Bu57CJxhxrdCgigNuE2iyEYn8Zh7Z8IPKRFyT/NYDUF3J0yDs6S1i7+NN82MGX1J
	RtMRm1HwKAL3htpmg0Bi9kgKWWBUVeW+NiDobQ26vK5Z+4E07d005iZkDdgzNA==
From: =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	"Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: [PATCH 5/6] MIPS: mobileye: dts: eyeq5: add the emmc controller
Date: Tue, 17 Jun 2025 15:25:55 +0200
Message-ID: <1846b26773eb48cc970bba1524e9d2a7a612a2e3.1750156323.git.benoit.monin@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750156323.git.benoit.monin@bootlin.com>
References: <cover.1750156323.git.benoit.monin@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdfffeeiieejkeevuefhvdeggeefudffueeuffehffehffevjedugfdtueegtddvnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvhedphhgvlhhopehfrhgrmhgvfihorhhkrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhepsggvnhhoihhtrdhmohhnihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughts
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggv
X-GND-Sasl: benoit.monin@bootlin.com

Add the MMC/SDHCI controller found in the eyeQ5 SoC. It is based on the
cadence sd4hc controller and support modes up to HS400 enhanced strobe.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index a84e6e720619..e15d9ce0bdf4 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -178,6 +178,28 @@ timer {
 				clocks = <&olb EQ5C_CPU_CORE0>;
 			};
 		};
+
+		emmc: sdhci@2200000 {
+			compatible = "mobileye,eyeq-sd4hc", "cdns,sd4hc";
+			reg = <0 0x2200000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&olb EQ5C_PER_EMMC>;
+			bus-width = <8>;
+			max-frequency = <200000000>;
+			mmc-ddr-1_8v;
+			sd-uhs-ddr50;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			cdns,phy-input-delay-legacy = <4>;
+			cdns,phy-input-delay-mmc-highspeed = <2>;
+			cdns,phy-input-delay-mmc-ddr = <3>;
+			cdns,phy-dll-delay-sdclk = <32>;
+			cdns,phy-dll-delay-sdclk-hsmmc = <32>;
+			cdns,phy-dll-delay-strobe = <32>;
+		};
 	};
 };
 

