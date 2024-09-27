Return-Path: <linux-mips+bounces-5693-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97D98854F
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18C29283D30
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CE218E04F;
	Fri, 27 Sep 2024 12:43:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00E418D64E
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440992; cv=none; b=UQ/FWjk85dOJqITzR/alHa96HpAEtWNFiv7YxFjYMjnAxaR5ECinDqKrON+zCO6IuI9xThUgguKSdUolzSy5zXNwkF+DlnRpjODHWyv7nQckl46IzO8o0Ga3wlI6H9vAVez0/QSmplb6Y1jADhUdWA8D/fJkyquEPuOdutNRr6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440992; c=relaxed/simple;
	bh=iT5rXWgkVPcbkFWW81Uc2zGRtQvQkpapAwr3dLRdXHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nOGBkDeJNvDj2gGZa+294sNeW+zPrhpm9ltCdjZRqd6wLnmEt3D0jVV5D70vJ6uDu2+a9I1FO8JVQXfBuSjVrb0j2mdeTKwIR8oagFBLxNgxD+h4T/u8pDCkiAtvnWp4q1cXLoDypXKFdQUd5fVu4GDmguzshwEBrUV+dLG5Teo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by albert.telenet-ops.be with cmsmtp
	id HQic2D00E3BfLyr06Qiclu; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPu-HI;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIp-008IDm-0M;
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
Subject: [PATCH treewide 04/11] arm64: dts: freescale: imx: Switch to simple-audio-card,hp-det-gpios
Date: Fri, 27 Sep 2024 14:42:19 +0200
Message-Id: <b38545c29d6cbf0b394ddb4747ce810c679f95d1.1727438777.git.geert+renesas@glider.be>
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
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index b268ba7a0e12a3f8..9d8e7231b7c63742 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -172,7 +172,7 @@ sound {
 			"Headphones", "HP_OUT",
 			"Builtin Speaker", "Speaker Amp OUTR",
 			"Speaker Amp INR", "LINE_OUT";
-		simple-audio-card,hp-det-gpio = <&gpio3 20 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio3 20 GPIO_ACTIVE_HIGH>;
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai2>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 1b39514d5c12aafc..bb37a32ce4616d9f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -241,7 +241,7 @@ sound {
 			"Headset Mic", "MICBIAS",
 			"IN3R", "Headset Mic",
 			"DMICDAT", "Digital Mic";
-		simple-audio-card,hp-det-gpio = <&gpio3 9 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,hp-det-gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai2>;
-- 
2.34.1


