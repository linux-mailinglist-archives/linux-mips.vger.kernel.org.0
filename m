Return-Path: <linux-mips+bounces-5694-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD9988552
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F653283F70
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564F318E03F;
	Fri, 27 Sep 2024 12:43:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC78188CBE
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440993; cv=none; b=PUMC4Vb0oYlXJkWkLghShwwi4AV++PM304+8AHihy2HvhEACVV5DyX8zzl2DGIjGl/7Pw79BdT4H+MBwoWiEDG/InjxNb430r7doTfRxrjKbfmkOgn4zsmcUO5uFivygDE/ye1tS2kveVRomopnj3PnFsOgHABQVO/r5vOrfLL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440993; c=relaxed/simple;
	bh=gJF6Vp8OyXRl1gBpDJQDv5Bh3hk35GPxQbTUGGKRpag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJL3CdMIT4jNzHGTLJLI92a/npOa6QYiN6Uvr66XSwLV+XqO6BDia1EmfJSYmoVTvgdYmU9+C19gTYcDcGuDS1fJGpchpMOtXt71lvX1aCImO7FsfCDKB3qRgLbvgHLz6nfZORdgkQyLlm5dZpYXpLiyj5/GtUwwPd5L/Do2leU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4XFVVt4fFVz4wyVl
	for <linux-mips@vger.kernel.org>; Fri, 27 Sep 2024 14:43:02 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b47d:fd74:3975:15b7])
	by baptiste.telenet-ops.be with cmsmtp
	id HQic2D00E3BfLyr01Qicjw; Fri, 27 Sep 2024 14:43:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIj-000fPr-HE;
	Fri, 27 Sep 2024 14:42:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1suAIo-008IDg-V7;
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
Subject: [PATCH treewide 02/11] ASoC: dt-bindings: Deprecate {hp,mic}-det-gpio
Date: Fri, 27 Sep 2024 14:42:17 +0200
Message-Id: <833d5d9560339bf39a125914225c9a0930e134cc.1727438777.git.geert+renesas@glider.be>
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

Commit 2071d0968e564b4b ("Documentation: gpio: guidelines for bindings")
deprecated the "gpio" suffix for GPIO consumers in favor of the "gpios"
suffix.  Update the Audio Graph and Simple Audio Card DT bindings to
reflect this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No driver changes needed, as gpiod_get_optional() as called from
simple_util_init_jack() tries all suffixes.
---
 .../devicetree/bindings/sound/audio-graph.yaml       |  6 ++++++
 .../devicetree/bindings/sound/simple-card.yaml       | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index 71f52f7e55f6ce72..9899d9d1958d9d93 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -37,8 +37,14 @@ properties:
   pa-gpios:
     maxItems: 1
   hp-det-gpio:
+    deprecated: true
+    maxItems: 1
+  hp-det-gpios:
     maxItems: 1
   mic-det-gpio:
+    deprecated: true
+    maxItems: 1
+  mic-det-gpios:
     maxItems: 1
 
 required:
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 59ac2d1d1ccfa4ce..533d0a1da56e34eb 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -207,8 +207,14 @@ properties:
   simple-audio-card,pin-switches:
     $ref: "#/definitions/pin-switches"
   simple-audio-card,hp-det-gpio:
+    deprecated: true
+    maxItems: 1
+  simple-audio-card,hp-det-gpios:
     maxItems: 1
   simple-audio-card,mic-det-gpio:
+    deprecated: true
+    maxItems: 1
+  simple-audio-card,mic-det-gpios:
     maxItems: 1
 
 patternProperties:
@@ -256,8 +262,14 @@ patternProperties:
       pin-switches:
         $ref: "#/definitions/pin-switches"
       hp-det-gpio:
+        deprecated: true
+        maxItems: 1
+      hp-det-gpios:
         maxItems: 1
       mic-det-gpio:
+        deprecated: true
+        maxItems: 1
+      mic-det-gpios:
         maxItems: 1
 
     patternProperties:
-- 
2.34.1


