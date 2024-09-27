Return-Path: <linux-mips+bounces-5697-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB1988565
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C414E281ED5
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4C518C923;
	Fri, 27 Sep 2024 12:43:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D596F18C341
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440996; cv=none; b=JRtPMGEHloHUjIQiflRSm+3GBUcsI0eo2Xs4J0gKUsx+wdYhdeNDIng6dy1c6lTrPX0CK5IfR2u1rBNEMieIqrwDV8eTAmlSStDGiih4wdzzcMcW/01Cur1IDE2O3UzmWzotktYr457mc8Rft+dzaB0vfqa7SA1UWHmViB3DeKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440996; c=relaxed/simple;
	bh=hMSQBIK69XhiQuKN80DdfClsFEKyUwfCRw2R5VKzLTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uuPkjc2yyg/tSm5Eap5iMRJLnZwVK7q4I8Y+gQl1r+qJVugbSXy4U+zKfaa8deQOUiw9xfUzIrjrFItCJ6sx6zV/C4zVfE/Pw7H8cSPPluTgB8Q63dZovtDLEU3K/jguegW6tJqhlocy/d7ZYq10PCxUmNNr0zG39JIvfiY8uyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4XFVW13K0Kz4xMhv
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 14:43:09 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by michel.telenet-ops.be with cmsmtp
	id HQic2D00L3BfLyr06Qicqj; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPv-HG;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDd-UI;
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
Subject: [PATCH treewide 01/11] ASoC: fsl-asoc-card: Add missing handling of {hp,mic}-dt-gpios
Date: Fri, 27 Sep 2024 14:42:16 +0200
Message-Id: <dbcb5bfea005a468ec6dc38374fe6d02bc693c22.1727438777.git.geert+renesas@glider.be>
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

The DT bindings deprecated the "hp-det-gpio" and "mic-det-gpio"
properties in favor of "hp-det-gpios" and "mic-det-gpios", but the
driver was never updated to support the latter.

Even before, there existed users of "hp-det-gpios" and "mic-det-gpios".
While this may have been handled fine by the ASoC core, this was missed
by the Freescale-specific part.

Fixes: 4189b54220e5af15 ("ASoC: dt-bindings: fsl-asoc-card: convert to YAML")
Fixes: 40ba2eda0a7b727f ("arm64: dts: imx8mm-nitrogen-r2: add audio")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Noticed accidentally.
Compile-tested only.
---
 sound/soc/fsl/fsl-asoc-card.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6c3aeff0d8eafd7..a0c2ce84c32b1d06 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -1033,14 +1033,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * Properties "hp-det-gpio" and "mic-det-gpio" are optional, and
+	 * Properties "hp-det-gpios" and "mic-det-gpios" are optional, and
 	 * simple_util_init_jack() uses these properties for creating
 	 * Headphone Jack and Microphone Jack.
 	 *
 	 * The notifier is initialized in snd_soc_card_jack_new(), then
 	 * snd_soc_jack_notifier_register can be called.
 	 */
-	if (of_property_read_bool(np, "hp-det-gpio")) {
+	if (of_property_read_bool(np, "hp-det-gpios") ||
+	    of_property_read_bool(np, "hp-det-gpio") /* deprecated */) {
 		ret = simple_util_init_jack(&priv->card, &priv->hp_jack,
 					    1, NULL, "Headphone Jack");
 		if (ret)
@@ -1049,7 +1050,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_jack_nb);
 	}
 
-	if (of_property_read_bool(np, "mic-det-gpio")) {
+	if (of_property_read_bool(np, "mic-det-gpios") ||
+	    of_property_read_bool(np, "mic-det-gpio") /* deprecated */) {
 		ret = simple_util_init_jack(&priv->card, &priv->mic_jack,
 					    0, NULL, "Mic Jack");
 		if (ret)
-- 
2.34.1


