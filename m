Return-Path: <linux-mips+bounces-5690-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C2E98853E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58DF61C210B2
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605F718CC1A;
	Fri, 27 Sep 2024 12:43:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524CE18CBEE
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440989; cv=none; b=LFqWCsSKy+VIUAd3RHcrv2VSdgNByHb2T3RMblapy8gZCNqBQIJQyUHfgEAmwPfMFdExKtjXBu3z58YspfhCR9cURpYzc5z9baNs3FfrAvToBQ2CMiHtl2tM0fZYve6ctpOz+TOV8mezlIliXUoMekESnA0otjdIhQotQMJnec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440989; c=relaxed/simple;
	bh=ysNXCS5d03ZwzODzN3Ux5C/aLATkpUW/PgOS0n4jwzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EcEYMcEcZpcrxCsrpQOjfrc/GX+IEiqcAkhf77RMcJcOX1nxWjZk1m9CGsG4Zu2lpcw+bcWWxzj6OXUwwznoBAc3PFPJuaDZrWizvse66ibVDsJLAbNbKDmIgiUDs2YfuDxtezeYgut/4ZXoEZf2NEjwtyxyduqnofd994bSXVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00D3BfLyr01Qicjt; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPs-HD;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDj-Vr;
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
Subject: [PATCH treewide 03/11] ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
Date: Fri, 27 Sep 2024 14:42:18 +0200
Message-Id: <7b4d7d735189fb346175a95e29db33f01c8cf93d.1727438777.git.geert+renesas@glider.be>
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
"hp-det-gpios" resp. "mic-det-gpios" in Audio Graph Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
index 55ea87870af3e039..86c425b72fa711b5 100644
--- a/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts
@@ -113,8 +113,8 @@ sound-card {
 			  "Headphones", "HPOR",
 			  "MIC2", "Mic Jack";
 		widgets = "Headphone", "Headphones", "Microphone", "Mic Jack";
-		hp-det-gpio = <&gpio 97 GPIO_ACTIVE_HIGH>;
-		mic-det-gpio = <&gpio 96 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio 97 GPIO_ACTIVE_HIGH>;
+		mic-det-gpios = <&gpio 96 GPIO_ACTIVE_HIGH>;
 	};
 
 	soc {
-- 
2.34.1


