Return-Path: <linux-mips+bounces-5687-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8247988538
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 851FF283FB3
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F1418C911;
	Fri, 27 Sep 2024 12:43:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF4618C901
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440987; cv=none; b=PgW4pOrlF92jlCTrsHo3UU7vVFCg+kTyv5YkIB6dsikAM+d9H87+slnIQXOi2hG5kWSlySalkwZCExcFRQOVlRAzeazdvP7pX03UsTz3z0g8SwxnzT2YLCB1LEPLNqb/oL7/1OkPsv7Dc+W+18MeMJIYuS77RkLO3KpTmHNpwZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440987; c=relaxed/simple;
	bh=CIM20nnnU7Jhf6dFh8JPiIIE/fCG4cgWx70W9ajo49Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M1LZLX3tU4kIju1y6Je0EW/2gpLUUDgYDdBvPsiE4g+h4UFgRN9DPJSrpIZabqfCpGdb1w6tvst6ky3iawwzItE+hSJ9RUKhez3I8mwmL2lB2JW8qcOPrgDc7c5I1uJ8ZTMz4XObfg3ELBdZk79t6zEHVF1ScIxczwSYYPyTTRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by xavier.telenet-ops.be with cmsmtp
	id HQic2D0093BfLyr01QicD3; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPw-HG;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IDv-2h;
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
Subject: [PATCH treewide 07/11] arm64: dts: rockchip: Switch to hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:22 +0200
Message-Id: <717e7c9527139c3a3e5246dd367a3ad98c5c81b6.1727438777.git.geert+renesas@glider.be>
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

Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in Audio
Graph Card and Realtek RT5651 Audio Codec device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts            | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
index e0cc4da7f392daf9..c08687df326ddc21 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
@@ -47,7 +47,7 @@ button-recovery {
 	analog-sound {
 		compatible = "audio-graph-card";
 		dais = <&i2s_8ch_p0>;
-		hp-det-gpio = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
 		label = "alc5640";
 		routing = "Mic Jack", "MICBIAS1",
 			  "IN1P", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
index 4feb78797982baa5..8c46bee077f3cfc2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts
@@ -545,7 +545,7 @@ rt5651: audio-codec@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
-		hp-det-gpio = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
 		spk-con-gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		#sound-dai-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
index 725ac3c1f6f6501d..4fc9c13dbec12390 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
@@ -21,5 +21,5 @@ &es8316 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
index 682e8b7297c180b6..9c741d1a3047e758 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
@@ -39,7 +39,7 @@ brcmf: wifi@1 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
 
 &uart0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
index 82ad2ca6b5c2fc92..5dc5505b58e2ee10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts
@@ -40,7 +40,7 @@ brcmf: wifi@1 {
 };
 
 &sound {
-	hp-det-gpio = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
+	hp-det-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_HIGH>;
 };
 
 &spi1 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
index 31ea3d0182c062ef..fdaa8472b7a72075 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
@@ -167,7 +167,7 @@ rt5651: rt5651@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_I2S_8CH_OUT>;
 		clock-names = "mclk";
-		hp-det-gpio = <&gpio4 RK_PC4 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 RK_PC4 GPIO_ACTIVE_LOW>;
 		spk-con-gpio = <&gpio0 RK_PB3 GPIO_ACTIVE_HIGH>;
 		#sound-dai-cells = <0>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index c667704ba985e463..aefa0d376dd8af20 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -23,7 +23,7 @@ analog-sound {
 		compatible = "audio-graph-card";
 		dais = <&i2s0_8ch_p0>;
 		label = "rk3588-es8316";
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 		routing = "MIC2", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index d0b922b8d67e85a0..e4e6c23c66845066 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -46,7 +46,7 @@ analog-sound {
 		compatible = "audio-graph-card";
 		label = "rk3588-es8316";
 		dais = <&i2s0_8ch_p0>;
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 		routing = "MIC2", "Mic Jack",
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 966bbc582d89b89c..8d3bbfd996560289 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -32,7 +32,7 @@ analog-sound {
 			  "Headphones", "HPOR";
 
 		dais = <&i2s0_8ch_p0>;
-		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
 	};
-- 
2.34.1


