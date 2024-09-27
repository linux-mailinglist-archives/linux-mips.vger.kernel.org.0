Return-Path: <linux-mips+bounces-5692-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B719988548
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 265F61F2515A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFF018D629;
	Fri, 27 Sep 2024 12:43:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942018C936
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440990; cv=none; b=mebKa8uh3G8CuYBxIheRPa5+V1hQRSEHR+ykQLUaVERh0bWwDN6GHZPpIoCn0TlnqzY9eWkvpxx7e0DoScIlw83D1GKxUNQeIOMzuAl7eJigDSv+5Ah5VDGm2APId7SZEqq8RamwHZaMTVDE3gcV7R+46jbEJhWipk5ewye+Z9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440990; c=relaxed/simple;
	bh=gFzWTvfAcB8evQtYGWDacqU3trX8Q3qpt11KSqg6udw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kjQaPCtQnfZRmyxKCw8m3z2oD3AjKeqG7xeQt4X7HJVU6lCE+u6/iMoD1Gb3T8S7te7M8qnHBdaY4DIwJPT4aIdAGlM0zSsFEcwLawt93uUVmbu1CwYI380zFblExmAdaNrDtX3/THftj/QQlDs45vUPHvCQK94D87mE5ieVKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by andre.telenet-ops.be with cmsmtp
	id HQic2D0053BfLyr01Qicif; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fQB-JD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IED-5c;
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
Subject: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
Date: Fri, 27 Sep 2024 14:42:25 +0200
Message-Id: <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
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

Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
"hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
handling of {hp,mic}-dt-gpios".
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index 8f4f5fba68cc5f4f..86a86dc370c4a9fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -113,8 +113,8 @@ sound {
 			"DMICDAT", "DMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio7 8 GPIO_ACTIVE_LOW>;
-		mic-det-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio7 8 GPIO_ACTIVE_LOW>;
+		mic-det-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	};
 
 	backlight_lvds: backlight-lvds {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
index 7c899291ab0dada4..542d633651f24575 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts
@@ -108,7 +108,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio4 19 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
 	};
 
 	panel {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index febc2dd9967de69e..c5383158e25c959b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -157,7 +157,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <3>;
-		hp-det-gpio = <&gpio4 24 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio4 24 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
index 277a6e039045b575..ddd01b6dee5a9976 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -167,7 +167,7 @@ sound {
 			"IN3R", "AMIC";
 		mux-int-port = <2>;
 		mux-ext-port = <6>;
-		hp-det-gpio = <&gpio1 17 GPIO_ACTIVE_LOW>;
+		hp-det-gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 	};
 
 	panel {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index b74ee8948a781762..0e839bbfea082140 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -68,7 +68,7 @@ sound-wm8960 {
 		audio-cpu = <&sai2>;
 		audio-codec = <&codec>;
 		audio-asrc = <&asrc>;
-		hp-det-gpio = <&gpio5 4 0>;
+		hp-det-gpios = <&gpio5 4 0>;
 		audio-routing =
 			"Headphone Jack", "HP_L",
 			"Headphone Jack", "HP_R",
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index f712537fca161ab9..6cde84636900bb00 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -169,7 +169,7 @@ sound {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&codec>;
-		hp-det-gpio = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
 		audio-routing =
 			"Headphone Jack", "HP_L",
 			"Headphone Jack", "HP_R",
-- 
2.34.1


