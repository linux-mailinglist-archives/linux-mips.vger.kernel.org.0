Return-Path: <linux-mips+bounces-14865-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Vy8Ek4gIGr4wAAAu9opvQ
	(envelope-from <linux-mips+bounces-14865-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 14:38:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B0637935
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 14:38:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=oDjwgWv0;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14865-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14865-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DEDF3052E75
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 12:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39225367B90;
	Wed,  3 Jun 2026 12:18:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8562264A7
	for <linux-mips@vger.kernel.org>; Wed,  3 Jun 2026 12:18:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489130; cv=none; b=ZMg0J1GMxMk2NlRBUA8BdARt8mCd1zaCu5m5QcOP/QdAqAblgQ1byTF6UvS7JB3V7ZyrY5frxz2eW0Guw11//G9jjYCL02IYEM7u0vYwnw4mF9eOlL6eN6YpxuC42/9HX2QQtbwdM6bsVQ+t9G/Oa+xw96o76sHZgujNUwUXEu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489130; c=relaxed/simple;
	bh=cVsIIY8CxED8IOMY5ucOvvvxSDQam/aTs0S98YZ83H4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfNttlq6MLlFzeIE7JCE3j/Es60aP9M/kopfyeMkhkRRrTZcH4FByd+jtx+MS0RzcsjofGYQqpQlm9za4OSAlXGwsTHgXVHyxQ3xvul7sjRHH8ibcGtG8/lTGGwfF0iL9spmEqik2cKnXbTbADHD5ZERKhIRysYW3E13dTOpSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oDjwgWv0; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C5A6B1A010B;
	Wed,  3 Jun 2026 12:18:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A67C6073E;
	Wed,  3 Jun 2026 12:18:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA06610888413;
	Wed,  3 Jun 2026 14:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780489120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zFi/fGH5JDn5JO2RB9yxgU6c2Ow81xQ2uZUvm6i/E1g=;
	b=oDjwgWv0v2GgyX3pUULcD12EPMMUfgyJz9dBcXuV+rHROoWzoTs8xUfKvHan7sDmS4CabP
	L+IrQHrvnK0vVMlJcr6wVI29ruHN0LlRTpSAbksHJDQU4x6/AUscYD365MmPH4Ai9RHUD3
	INZ8kgugtku7ob0NW+Ab7SNI9LVONJhSV2/Jk11qsbj+crVHJ9NJj1exILul60PuVPHkKS
	HfTz8P9kfZEod84fwQjR8JESyd/TGvwRHW/nVKN9n20yx7yviIrbsYx2VG2qWDRMnUj3ZS
	NEQxmhhJHdJjDyxCCsVL18Z9rUUNa16rIZrNpUha+f5Agkx9HJ0YQZpZ489vRg==
Date: Wed, 3 Jun 2026 14:17:57 +0200
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
Subject: Re: [PATCH 04/83] ASoC: codecs: peb2466: don't use array if single
 pattarn
Message-ID: <20260603141757.451cad7b@bootlin.com>
In-Reply-To: <87wlwrhqxf.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87wlwrhqxf.wl-kuninori.morimoto.gx@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14865-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:from_mime,bootlin.com:email,renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D49B0637935

Hi Kuninori,

On Tue, 26 May 2026 01:59:08 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Because it is confusable during debugging ASoC FW update, tidyup
> auto format style not to use array if single pattern case.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/codecs/peb2466.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Same typo in the commit title as in patch 2:
s/pattarn/pattern/

Or even
s/pattarn/item/

With that fixed,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

