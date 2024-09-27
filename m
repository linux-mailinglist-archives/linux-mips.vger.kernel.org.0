Return-Path: <linux-mips+bounces-5696-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B7988559
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E56F51F2701A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FCC18E744;
	Fri, 27 Sep 2024 12:43:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF27A18DF90
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440994; cv=none; b=LdpQqSkj3aVXJhmVm+Es16huGpY6jDsrqwv/t1jd2yfEC1jcBU6dByTMeSgbbsvT/5VKqrWUNG4udva1X7rN3ajt1MrabPn4WeawS8GTv+e4TGWUWvQbgyaaCBSnQXo4rRf/zUnxoElyg+1/plZXu2ZfcSJmtPj3WxpVb+5i6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440994; c=relaxed/simple;
	bh=2QXljp1dC/8iHwUW7hKb7vZR7RspRKinKvyyOkLSgtI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WUfnTX9F4f7dkMUCTlQy5BfEqhrQupH58+LPWELi8e7QOWloG1rtd4RtxoCN4vwa0MNsOpZ3PUqOxVKW5/hbFXPILRxIY7hzoz1XCzfWylxhUdKzbQFIrX9TuuL7HrbRKf6MfX5ZQ9CEqTSMt62MHqPJScOR2lcABGo6rtYQ1Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4XFVVt5jMdz4xLdv
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 14:43:02 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00C3BfLyr01Qicjs; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPq-HD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDa-TV;
	Fri, 27 Sep 2024 14:42:30 +0200
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
Subject: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
Date: Fri, 27 Sep 2024 14:42:15 +0200
Message-Id: <cover.1727438777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

The "gpio" suffix for GPIO consumers was deprecated a while ago, in
favor of the "gpios" suffix.  However, there are still several users of
the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
drivers, and DT source files.

Drivers that use gpiolib handle both the deprecated and new properties
transparently, but that is not the case when using of_property_*() calls
directly.

  - The first patch fixes a bug, as the Freescale Generic ASoC Sound
    driver handles only the deprecated properties, while there is
    already a user of the new variants,
  - The second patch updates the Audio Graph and Simple Audio Card DT
    bindings,
  - Patches 3-9 converts various DTS files to use the new properties,
  - The last 2 patches convert Freescale sound device nodes to use the
    new properties.

All patches can be applied independently, except for the last two, which
depend on the first patch to avoid regressions.
This series was compile-tested only.

Thanks for your comments!

Geert Uytterhoeven (11):
  ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
  ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
  ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
  arm64: dts: freescale: imx: Switch to simple-audio-card,hp-det-gpios
  arm64: dts: renesas: beacon-renesom: Switch to mic-det-gpios
  arm64: dts: rockchip: Switch to simple-audio-card,hp-det-gpios
  arm64: dts: rockchip: Switch to hp-det-gpios
  arm64: dts: uniphier: Switch to hp-det-gpios
  mips: dts: ingenic: Switch to simple-audio-card,hp-det-gpios
  ARM: dts: nxp: imx: Switch to {hp,mic}-det-gpios
  arm64: dts: freescale: imx: Switch to hp-det-gpios

 .../devicetree/bindings/sound/audio-graph.yaml       |  6 ++++++
 .../devicetree/bindings/sound/simple-card.yaml       | 12 ++++++++++++
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts      |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi       |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts              |  2 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts     |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi    |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts         |  2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts        |  2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts    |  2 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi   |  2 +-
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi    |  2 +-
 .../arm64/boot/dts/rockchip/rk3326-gameforce-chi.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts  |  2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts     |  2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts   |  2 +-
 .../boot/dts/rockchip/rk3399-sapphire-excavator.dts  |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg-arc.dtsi    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts     |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353ps.dts    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts     |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353vs.dts    |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts    |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts     |  2 +-
 .../dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts     |  2 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts      |  2 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts      |  2 +-
 .../boot/dts/socionext/uniphier-ld11-global.dts      |  2 +-
 .../boot/dts/socionext/uniphier-ld20-global.dts      |  2 +-
 arch/mips/boot/dts/ingenic/gcw0.dts                  |  2 +-
 arch/mips/boot/dts/ingenic/rs90.dts                  |  2 +-
 sound/soc/fsl/fsl-asoc-card.c                        |  8 +++++---
 50 files changed, 72 insertions(+), 52 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

