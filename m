Return-Path: <linux-mips+bounces-9351-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5006ADCD47
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 15:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EBCA188561B
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 13:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D242EBDC9;
	Tue, 17 Jun 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qw0Tf1MS"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE34F2DE20F;
	Tue, 17 Jun 2025 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166781; cv=none; b=KjDU/WnokFDDhDR0ZdbyxqsrlU5gtPY1k02ZA2PZfeC8W4Q0FPEqpgVG14lF65G2TAv+tskbjP/30OVRRCMVK0EYhNBx1QlOAMk4b92T0l/N9ASzxBUcjzDdCz2zB8wGHoFiv9qlz5h0/AEZo4YojeIDmm6oYt8II7ZEMe6/mEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166781; c=relaxed/simple;
	bh=57dggzw2T6pyelDs4MZNPa4a4VhFuF/7yGNWm6ASIVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AGXRG6yj/PVoON3DmDokPqzVtSlEvFIt62u4+7EbojeCGm2ozB6hb1XLlx61BZqK7UhTVWmzJezKQ8ccEXdnThUrqSqu1XDypcODXDY7jrjQbnIN0sqv1QgHp1mQCVJdnXSGqM/NHURWcpeDgsSfDLraG98dZKg/xIK5yZJXjGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qw0Tf1MS; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBE8143B15;
	Tue, 17 Jun 2025 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750166769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glk/OwejqhkRZSqbsrxolLDDbkvejcmIfKpjFozQd28=;
	b=Qw0Tf1MSwnXCdVU9BAINY6MrEbWZlGgPuiaN+UA+xnaQ8kV+Z5mVAFtRcCOHhe1NQ6WzsO
	xBovLYuT26u7apVoLOtOG5i/c9K+ChiKvjIfPBLSaOLjfWSte3SWLik3K9VfVZ56ynqAQ4
	DaP/8b7fC+1LtyL8Vc2ULjF0CB99SQwG0V+h5t8bs+PB5Erhi6E6d3xFvaZkHpJZzzxcWn
	DoXlQZIahYdM6JWGUb5I3uZ2WoShB+WRoAJhbzEpR85XGerPHZDCVppFLNVhUOlQYu2zd3
	V+aN733MXy97LXVcgCHrpQwHxgsj9sXhG7bhaFr5bmuegZepn0hlGy3vjnfV2w==
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
Subject: [PATCH 3/6] MIPS: mobileye: dts: eyeq6h: add the emmc controller
Date: Tue, 17 Jun 2025 15:25:53 +0200
Message-ID: <9b482b7469695b303269dba26b476ac70695dc3a.1750156323.git.benoit.monin@bootlin.com>
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

Add the MMC/SDHCI controller found in the eyeQ6 SoC. It is based on the
cadence sd4hc controller and support modes up to HS400 enhanced strobe.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
index dabd5ed778b7..bbd463435ad6 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
@@ -109,6 +109,28 @@ olb_east: system-controller@d3358000 {
 			clock-names = "ref";
 		};
 
+		emmc: sdhci@d8010000 {
+			compatible = "mobileye,eyeq-sd4hc", "cdns,sd4hc";
+			reg = <0 0xd8010000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&olb_south EQ6HC_SOUTH_DIV_EMMC>;
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
+
 		olb_south: system-controller@d8013000 {
 			compatible = "mobileye,eyeq6h-south-olb", "syscon";
 			reg = <0x0 0xd8013000 0x0 0x1000>;

