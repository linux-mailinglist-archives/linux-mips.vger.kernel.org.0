Return-Path: <linux-mips+bounces-14863-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rk3HGK8eIGqlwAAAu9opvQ
	(envelope-from <linux-mips+bounces-14863-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 14:31:43 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A9637888
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 14:31:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=sQWX1YqA;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14863-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-14863-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D7F83168431
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 12:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B1947A0A7;
	Wed,  3 Jun 2026 12:10:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA047A0A2
	for <linux-mips@vger.kernel.org>; Wed,  3 Jun 2026 12:10:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488637; cv=none; b=Pxpv3ERjcml36/h1dBFkQ4sKW9PH8ifs1sWXOb7VVc9lfbFBGK1mbz8W97M3geuxBdionTUr33PXgXgvcCHaFaOQWLhhHz1pEEuVch6NG6jCsMQZC01AWwOC+k7oZus812glq3utCI2sJqy48yreRbengcnYL+w7h/GRc1hy5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488637; c=relaxed/simple;
	bh=51meKYxHboFRTdLIUD63N1JVy8fR+xdqrlSt88R88ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UrwMw4xXWo4aYT93Z26CfG1t/0g3yM+RcdvpXFLSJTwIa8bf9fKaNL9u/YiXT57S1AT9nZ3aTpCnwneaooenp1ehlK0ejhzEeXznzAylFQGQmjwQgnfLXUzCZyqm2RHzFyDzjdtEx2bBVRjMk/r2aJF9dLctMv9FudfzVg495mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sQWX1YqA; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C41A34E400BF;
	Wed,  3 Jun 2026 12:10:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70F7C6073E;
	Wed,  3 Jun 2026 12:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B352C10888413;
	Wed,  3 Jun 2026 14:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780488628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PreqYMBr0Ka5dN41Clt2LWnr3PiSIQBHEiKpFY9pyZU=;
	b=sQWX1YqA6zcSbVeDj7lWc5CeZcf9eoO3G688GSALeSPtusWjW+Q9KBqpKG0heQV2+TstA1
	c8jQ9OyBWwECfv/PHSX1LLl6srWAnxH/N5z+c07Vghr7gOdduiivBi59q8cdvD+3kLiFP1
	/0s02v5pvhT6/9EvSRzYTPzVQfIUIpilWScE8RH9GBIP9SyhRZEwqNIz+hCNseOvgTvtSN
	eIic0ThoTceGH5dauhsCfZToflRtQ6uGsESdz1KP1NIgJ0LBSWpd2F3IeOmwB40R+Q8WGj
	cMoiZH0WvbgKnHMnJVXcUrxKL5ejS5hYvjpaKKGH2SAvCuutWaVX7eVBWJiEjw==
Date: Wed, 3 Jun 2026 14:09:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Alvin =?UTF-8?B?xaBpcHJhZ2E=?=" <alsi@bang-olufsen.dk>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>, "Martin =?UTF-8?B?UG92acWhZXI=?="
 <povik+lin@cutebit.org>, "Nuno =?UTF-8?B?U8Oh?=" <nuno.sa@analog.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Bartosz
 Golaszewski <brgl@kernel.org>, Ben Bright <ben.bright@cirrus.com>, Benson
 Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Binbin
 Zhou <zhoubinbin@loongson.cn>, Bram Vlerick
 <bram.vlerick@openpixelsystems.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi
 Chiang <cychiang@chromium.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Mack
 <daniel@zonque.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck
 <groeck@chromium.org>, Guoqing Jiang <guoqing.jiang@canonical.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, HariKrishna Sagala
 <hariconscious@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Hsieh Hung-En
 <hungen3108@gmail.com>, James Ogletree <jogletre@opensource.cirrus.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kevin Cernekee <cernekee@chromium.org>,
 Kevin Hilman <khilman@baylibre.com>, Kevin Lu <kevin-lu@ti.com>, Kirill
 Marinushkin <k.marinushkin@gmail.com>, Kiseok Jo
 <kiseok.jo@irondevice.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Mark
 Brown <broonie@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Oder
 Chiou <oder_chiou@realtek.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>, Peter
 Rosin <peda@lysator.liu.se>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Ray
 Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland
 <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden
 <sbranden@broadcom.com>, Sen Wang <sen@ti.com>, Sharique Mohammad
 <sharq0406@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>, Support Opensource
 <support.opensource@diasemi.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Yixun Lan <dlan@kernel.org>, Zhang Yi
 <zhangyi@everest-semi.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org,
 spacemit@lists.linux.dev
Subject: Re: [PATCH 02/83] ASoC: codecs: framer-codec: don't use array if
 single pattarn
Message-ID: <20260603140939.091f126f@bootlin.com>
In-Reply-To: <87zf1nhqxx.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87zf1nhqxx.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14863-lists,linux-mips=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[herve.codina@bootlin.com,linux-mips@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:alsi@bang-olufsen.dk,m:jonathan.downing@nautel.com,m:povik+lin@cutebit.org,m:nuno.sa@analog.com,m:u.kleine-koenig@baylibre.com,m:alexandre.belloni@bootlin.com,m:alexandre.torgue@foss.st.com,m:angelogioacchino.delregno@collabora.com,m:arnaud.pouliquen@foss.st.com,m:baojun.xu@ti.com,m:brgl@kernel.org,m:ben.bright@cirrus.com,m:bleung@chromium.org,m:biju.das.jz@bp.renesas.com,m:zhoubinbin@loongson.cn,m:bram.vlerick@openpixelsystems.org,m:ckeepax@opensource.cirrus.com,m:wens@kernel.org,m:cychiang@chromium.org,m:claudiu.beznea@tuxon.dev,m:cristian.ciocaltea@collabora.com,m:daniel@zonque.org,m:dario.binacchi@amarulasolutions.com,m:david.rhodes@cirrus.com,m:festevam@gmail.com,m:florian.fainelli@broadcom.com,m:Frank.Li@nxp.com,m:fred.treven@cirrus.com,m:geert+renesas@glider.be,m:groeck@chromium.org,m:guoqing.jiang@canonical.com,m:haojian.zhuang@gmail.com,m:hariconscious@gmail.com,m:heiko@sntech.de,m:hungen3108@gmail.com,m:jogletre@
 opensource.cirrus.com,m:jarkko.nikula@bitmer.com,m:perex@perex.cz,m:jernej.skrabec@gmail.com,m:jbrunet@baylibre.com,m:jihed.chaibi.dev@gmail.com,m:jonathanh@nvidia.com,m:cernekee@chromium.org,m:khilman@baylibre.com,m:kevin-lu@ti.com,m:k.marinushkin@gmail.com,m:kiseok.jo@irondevice.com,m:krzk@kernel.org,m:hayashi.kunihiko@socionext.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:lars@metafoo.de,m:lgirdwood@gmail.com,m:luca.ceresoli@bootlin.com,m:mr.swami.reddy@ti.com,m:broonie@kernel.org,m:martin.blumenstingl@googlemail.com,m:mhiramat@kernel.org,m:matthias.bgg@gmail.com,m:jcmvbkbc@gmail.com,m:mcoquelin.stm32@gmail.com,m:neil.armstrong@linaro.org,m:nicolas.ferre@microchip.com,m:frattaroli.nicolas@gmail.com,m:nicoleotsuka@gmail.com,m:oder_chiou@realtek.com,m:olivier.moysan@foss.st.com,m:paul@crapouillou.net,m:peda@lysator.liu.se,m:piotr.wojtaszczyk@timesys.com,m:rongqianfeng@vivo.com,m:rjui@broadcom.com,m:rf@opensource.cirrus.com,m:robert.jarzmik@free.fr,m:samuel@sholland.org,m:s.hauer
 @pengutronix.de,m:sbranden@broadcom.com,m:sen@ti.com,m:sharq0406@gmail.com,m:shenghao-ding@ti.com,m:shengjiu.wang@gmail.com,m:steven.eckhoff.opensource@gmail.com,m:support.opensource@diasemi.com,m:s.nawrocki@samsung.com,m:tiwai@suse.com,m:thierry.reding@kernel.org,m:tim.bird@sony.com,m:troy.mitchell@linux.spacemit.com,m:tzungbi@kernel.org,m:venkataprasad.potturu@amd.com,m:Vijendar.Mukunda@amd.com,m:vishwas.a.deshpande@ti.com,m:vz@mleia.com,m:Xiubo.Lee@gmail.com,m:dlan@kernel.org,m:zhangyi@everest-semi.com,m:chrome-platform@lists.linux.dev,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[104];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,lin,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:mid,bootlin.com:dkim,bootlin.com:from_mime,bootlin.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 602A9637888

Hi Kuninori,

On Tue, 26 May 2026 01:58:50 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Because it is confusable during debugging ASoC FW update, tidyup
> auto format style not to use array if single pattern case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/codecs/framer-codec.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Just a typo in the commit title:
s/pattarn/pattern/

Or even
s/pattarn/item/

With that fixed,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

