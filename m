Return-Path: <linux-mips+bounces-5705-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD399885A9
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D8A2841FA
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9C518DF71;
	Fri, 27 Sep 2024 12:53:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E9218D629
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441585; cv=none; b=DdULykBHqquMYBUGrFZyDjZEfYoBKUgn32J9lagEsCuQDYzbMfQq+AFTAyQsEH6A20XZJB3AUF2WSqyGnQZ+L4J+wp3gikXUIIMs///xGuZldkfdyQbS/iaxb9NKGbnd3oTmEQtFgP+/+O6eW4a7Pkl7Z+em2fqNDsjDeA91j/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441585; c=relaxed/simple;
	bh=fFwOydodvGzrVUxGuXyql5v+dNBY/AhGrBKKVlxe1Tg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lhFw4ZrPkiMMBJywPPQkvOuH1HmmJ0xV0mlXAABm+9L8HKOBWdV/m4W1LnFaHh+/dVFHceWNrislCwKJEsqQicKmDwtXtgAtB0Su1gwzughF8Qo1JirQOcH8R8tMOhoQpmD2QhtFRUNogGHkFIu1vaMBXuv7nYd3/MTs6heJEF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4XFVkQ0T5Tz4xJP5
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 14:53:02 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00G3BfLyr01Qicjv; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPp-H7;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IDs-1v;
	Fri, 27 Sep 2024 14:42:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Adam Ford <aford173@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH treewide 06/11] arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:21 +0200
Message-Id: <c976b09c6048564737321cf91c3f97b9da5dbfe8.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated "simple-audio-card,hp-det-gpio" property by
"simple-audio-card,hp-det-gpios" in Simple Audio Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts             | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts                | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts                | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts             | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts          | 2 +-
 21 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi b/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
index b6d041dbed94af85..9caf9dc13b230af7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
@@ -49,7 +49,7 @@ rk817-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "rk817_int";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
index 579261b3a474b9ba..08ed5b95bb6def21 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts
@@ -245,7 +245,7 @@ sound {
 		simple-audio-card,name = "rk817_ext";
 		simple-audio-card,aux-devs = <&spk_amp>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
index 80fc53c807a42c09..f585b46ceaf31fac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
@@ -144,7 +144,7 @@ rk817-sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "rk817_int";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio2 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index a5a7e374bc59478e..1b075072e8e8c17a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -150,7 +150,7 @@ es8316-sound {
 			"Speaker", "Speaker Amplifier OUTL",
 			"Speaker", "Speaker Amplifier OUTR";
 
-		simple-audio-card,hp-det-gpio = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,aux-devs = <&speaker_amp>;
 		simple-audio-card,pin-switches = "Speaker";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
index 7ba1c28f70a9a86b..2c41e017f4f402e9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
@@ -51,7 +51,7 @@ es8388-sound {
 			"Headphone Amp INR", "ROUT2",
 			"Headphones", "Headphone Amp OUTL",
 			"Headphones", "Headphone Amp OUTR";
-		simple-audio-card,hp-det-gpio = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio2 RK_PA6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,aux-devs = <&headphones_amp>;
 		simple-audio-card,pin-switches = "Headphones";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi
index a4a60e4a53d43106..0aa2694552ae5ed1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi
@@ -41,7 +41,7 @@ sound {
 		simple-audio-card,name = "rk817_ext";
 		simple-audio-card,aux-devs = <&spk_amp>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dts
index a73cf30801ec7f33..6f12a9e83cd6787e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dts
@@ -43,7 +43,7 @@ sound {
 		simple-audio-card,name = "rk817_ext";
 		simple-audio-card,aux-devs = <&spk_amp>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dts
index ca5284e4807d80b2..4fb712fe918c968e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dts
@@ -42,7 +42,7 @@ sound {
 		simple-audio-card,name = "rk817_ext";
 		simple-audio-card,aux-devs = <&spk_amp>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dts
index e9954a33e8cd31f2..2ea7007b41b86c6b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dts
@@ -42,7 +42,7 @@ sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "rk817_int";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dts
index 90da43855d1cbc54..5a30e3918c044144 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dts
@@ -41,7 +41,7 @@ sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "rk817_int";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
index 74cf313e06355570..4dcc0ea4cf0f02d2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dts
@@ -132,7 +132,7 @@ sound {
 		simple-audio-card,name = "rk817_ext";
 		simple-audio-card,aux-devs = <&spk_amp>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
index db40281eafbe5d45..d3709efd242e91ef 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi
@@ -121,7 +121,7 @@ rk817-sound {
 			"Internal Speakers", "Speaker Amplifier OUTR",
 			"Speaker Amplifier INL", "HPOL",
 			"Speaker Amplifier INR", "HPOR";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
 		simple-audio-card,aux-devs = <&speaker_amp>;
 		simple-audio-card,pin-switches = "Internal Speakers";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
index 5a648db41f355e87..e274f7bf9dfb3dd9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
@@ -269,7 +269,7 @@ sound {
 		simple-audio-card,name = "rk817_ext";
 		simple-audio-card,aux-devs = <&spk_amp>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Microphone", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index 6a02db4f073f296f..6f2533f29e8823fb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -84,7 +84,7 @@ rk809-sound {
 		pinctrl-0 = <&hp_det_pin>;
 		simple-audio-card,name = "Analog RK817";
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio0 RK_PB0 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,widgets =
 			"Headphone", "Headphones",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 00f660d50127f75e..df44dbc394ca54fa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -66,7 +66,7 @@ analog-sound {
 		simple-audio-card,bitclock-master = <&masterdai>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&masterdai>;
-		simple-audio-card,hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,pin-switches = "Headphones", "Speaker";
 		simple-audio-card,routing =
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 83103e4c7216fdef..411007cb8118a58e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -38,7 +38,7 @@ analog-sound {
 		pinctrl-0 = <&headphone_detect>;
 
 		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpio = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,name = "realtek,rt5616-codec";
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index fc131789b4c32721..560eeb56c804cc86 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -75,7 +75,7 @@ sound {
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
 
-		simple-audio-card,hp-det-gpio = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
 
 		simple-audio-card,widgets =
 			"Headphone", "Headphones",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts b/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
index c2a08bdf09e83977..b8c33052cd00fcd0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts
@@ -75,7 +75,7 @@ sound {
 		simple-audio-card,bitclock-master = <&masterdai>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&masterdai>;
-		simple-audio-card,hp-det-gpio = <&gpio1 RK_PB2 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PB2 GPIO_ACTIVE_HIGH>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,pin-switches = "Headphones", "Speaker";
 		simple-audio-card,widgets =
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index c3a6812cc93a2f90..805cf53b1ead6fa2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -120,7 +120,7 @@ sound {
 		simple-audio-card,aux-devs = <&speaker_amp>, <&headphone_amp>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,hp-det-gpio = <&gpio1 RK_PD3 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_LOW>;
 		simple-audio-card,bitclock-master = <&daicpu>;
 		simple-audio-card,frame-master = <&daicpu>;
 		/*TODO: SARADC_IN3 is used as MIC detection / key input */
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index e4a20cda65ed63f4..50c7a5e9af1904b8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -104,7 +104,7 @@ sound {
 		simple-audio-card,aux-devs = <&speaker_amp>, <&headphone_amp>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_LOW>;
 		simple-audio-card,bitclock-master = <&daicpu>;
 		simple-audio-card,frame-master = <&daicpu>;
 		/* SARADC_IN3 is used as MIC detection / key input */
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 467f69594089bf1f..cd9ad440f7298b37 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -122,7 +122,7 @@ analog-sound {
 		simple-audio-card,bitclock-master = <&masterdai>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&masterdai>;
-		simple-audio-card,hp-det-gpio = <&gpio3 RK_PA6 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,name = "rockchip,es8388-codec";
 		simple-audio-card,pin-switches = "Headphones", "Speaker";
-- 
2.34.1


