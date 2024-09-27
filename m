Return-Path: <linux-mips+bounces-5688-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FD98853A
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0633FB2117C
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB77B18CC08;
	Fri, 27 Sep 2024 12:43:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB218C355
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440987; cv=none; b=LYsE4EBpS1qVTrOt7RO3ksTN0jfhG++G+/v2Nc/Y3qgrqDAAJwh+JrsIa6rE8bN2PR5dbqP4XX0vdqcqiKsYHspTxt5amwKZ0kyJhyL+QZ8Ehz7qhhv5x6cdvTFQ9VBYNlIjR0WY4FNhayV9YAk28uM7WRuz9QJ6Cis5bKD/vRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440987; c=relaxed/simple;
	bh=Kkd9tSqRHa9vtAL1isGx0C8vpTPnoQQejNAyURUlpbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rWpen0CPcm9o+dnQCFPC9EOZ03c+G08dfXjKamTGHEPut2UDEv7/AEsnZ3GaRgaDW3zTzw4PvaXO8zIU2subOlUsi5vVUue/lBXcTJw+d9q1rKcQX+UbA6aWTjklrfNGjzslYSOQUuHkvG4gxI+apZcCTPYNeJY5lYnwUHw5cyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by xavier.telenet-ops.be with cmsmtp
	id HQic2D0083BfLyr01QicD2; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fQ0-IM;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IE1-4R;
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
Subject: [PATCH treewide 09/11] mips: dts: ingenic: Switch to simple-audio-card,hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:24 +0200
Message-Id: <0466c746d6276842d6993fae41efb315188e1f3f.1727438777.git.geert+renesas@glider.be>
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
 arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
 arch/mips/boot/dts/ingenic/rs90.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index 5d33f26fd28c8bd8..8455778928b71cee 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -91,7 +91,7 @@ sound {
 			"MIC1N", "Built-in Mic";
 		simple-audio-card,pin-switches = "Speaker", "Headphones";
 
-		simple-audio-card,hp-det-gpio = <&gpf 21 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpf 21 GPIO_ACTIVE_LOW>;
 		simple-audio-card,aux-devs = <&speaker_amp>, <&headphones_amp>;
 
 		simple-audio-card,bitclock-master = <&dai_codec>;
diff --git a/arch/mips/boot/dts/ingenic/rs90.dts b/arch/mips/boot/dts/ingenic/rs90.dts
index e8df70dd42bf8e4c..6d2c8aea5f499d34 100644
--- a/arch/mips/boot/dts/ingenic/rs90.dts
+++ b/arch/mips/boot/dts/ingenic/rs90.dts
@@ -148,7 +148,7 @@ sound {
 			"Speaker", "OUTR";
 		simple-audio-card,pin-switches = "Speaker";
 
-		simple-audio-card,hp-det-gpio = <&gpd 16 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpd 16 GPIO_ACTIVE_LOW>;
 		simple-audio-card,aux-devs = <&amp>;
 
 		simple-audio-card,bitclock-master = <&dai_codec>;
-- 
2.34.1


