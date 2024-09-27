Return-Path: <linux-mips+bounces-5695-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7681988555
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2347D1C22121
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338DE18E377;
	Fri, 27 Sep 2024 12:43:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926818DF84
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440994; cv=none; b=do/crk0xIBPeflPD7Cre71O2zzBj8kzafhk9nnGl2AYAeNJwnAlLthxyjU/hr90cQBT8xR9k7XVP3cZPYvre7dz9doDwfjWLmcyjTG8ShdXo/qftHxJkWok826W7E90BWV4TNmhmLSjhW+Y2Gc/QvF6E3IWHkHYOG3qjuuJSPWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440994; c=relaxed/simple;
	bh=0oT8HubRYLhka+374/lmmpGRB4f0urrBFL2k7RW0Wp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F0iiyTzn7zRv835vU2a+/XPf0LQU1PtEL99pvzcuvsNMp+a2nta3hf5Pprwul+lk3XR011gaZ+z5WvHrpWd7OEfwWPZgMxaKy9Ij+3JY0XVuIJRCZLOXWMTUUu8fg0SVsj7HmjaklYc9/ulb6vr0Gc8NNRRT+8YreWVCbRM98YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4XFVVt53r5z4xJ2j
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 14:43:02 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00F3BfLyr01Qicju; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fQE-K6;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IEH-6X;
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
Subject: [PATCH treewide 11/11] arm64: dts: freescale: imx: Switch to hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:26 +0200
Message-Id: <9e9dde7e770a1787742a88685a258730ec50cd93.1727438777.git.geert+renesas@glider.be>
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

Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in
Freescale Generic ASoC Sound Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
handling of {hp,mic}-dt-gpios".
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 62203eed6a6cb144..12b36418fb44f49e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -217,7 +217,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
 		audio-routing =	"Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 936ba5ecdcac76fd..c0782124aad69db3 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -50,7 +50,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
 		audio-routing = "Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 37a1d4ca1b207988..a69ba75ed41bda65 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -160,7 +160,7 @@ sound-wm8962 {
 		model = "wm8962-audio";
 		audio-cpu = <&sai3>;
 		audio-codec = <&wm8962>;
-		hp-det-gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		audio-routing = "Headphone Jack", "HPOUTL",
 				"Headphone Jack", "HPOUTR",
 				"Ext Spk", "SPKOUTL",
-- 
2.34.1


