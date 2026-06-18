Return-Path: <linux-mips+bounces-15141-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sdeAJvf0M2oGJwYAu9opvQ
	(envelope-from <linux-mips+bounces-15141-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 15:39:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E06A0A15
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 15:39:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=PUOZ5Di9;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15141-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15141-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5FEC300D4FA
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 13:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C6A2C11D6;
	Thu, 18 Jun 2026 13:39:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39DA2BDC28
	for <linux-mips@vger.kernel.org>; Thu, 18 Jun 2026 13:38:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789941; cv=none; b=gQA86s4gs5Q3gY7wCiS0PluP/OIBvdH9U97BoFJc6UaVnIzPz7BpRAivkjweyM5jclNNi3lh/U5f+v1sw77/JxSk+xxSfjzopTiMXiX34EpweeJjRsq1bBNjRRWTR627m2BSDbJEOtGK57Gcon98wM4cuVAHQgcuA8uImlNCfR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789941; c=relaxed/simple;
	bh=q17Yakrk0jyin/K7MigNcOnMz+6gtRbwepNdHP9jFKM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=caLFDR9ubBMW8fg0CUA6GIpzM/IKpKt+N5oateWGA9CuSVleeQmHWzjW5C7eKcU7b9QmpB6i0/femNZcR9z4aincPjqtMrmyccY6iVf+rnLEy793k7UrjMOhn9xpv69KTNqWsze/MTBBWgXyjP/AqE8whop+Uq/TCrhW4kBRqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PUOZ5Di9; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C27FC06CD1;
	Thu, 18 Jun 2026 13:39:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E97F5601AE;
	Thu, 18 Jun 2026 13:38:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E90E5106C8181;
	Thu, 18 Jun 2026 15:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781789933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q17Yakrk0jyin/K7MigNcOnMz+6gtRbwepNdHP9jFKM=;
	b=PUOZ5Di9LG9HfrQqQCFFBVq94tgu/N/628JI3wjlG+04IUEZ/TDfwfWPiCYIYoY01Ml/zT
	u6fzfs/sOXhZCzpGZcGWKrttnj2hg362abIuU+SlEEsUQGe8DjkMXc8FOQFe+vm08MjMCD
	q4ik5cK5VDldEGCZCpBmhx07jaHCoG868HTUDceg1cGMzWrhvEOeO+nri9uBQ9XxJlsEEd
	kFcTWnviop36LYp6WwxAMULWvuPB1A6oFC1kNXA6jr27XI08XezUNwOxPYoBipe1i/JzdI
	5yYVYBawm+zEtwTD77BtUYcO3v4DG3A1Zq8nGdrWLS8BS2P5ZVV6JJvam6Mhog==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 15:38:33 +0200
Message-Id: <DJC7T6B6DCZI.3F29YF2M1ZCAF@bootlin.com>
Subject: Re: [PATCH v2 00/78] drm/bridge: Convert all reset users to
 create_state
Cc: "Dmitry Baryshkov" <lumag@kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Liu Ying" <victor.liu@nxp.com>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Phong LE" <ple@baylibre.com>, "Douglas
 Anderson" <dianders@chromium.org>, "Inki Dae" <inki.dae@samsung.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Cercueil" <paul@crapouillou.net>,
 <linux-mips@vger.kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, <linux-amlogic@lists.infradead.org>,
 "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>,
 <linux-renesas-soc@vger.kernel.org>, "Biju Das"
 <biju.das.jz@bp.renesas.com>, "Heiko Stuebner" <heiko@sntech.de>, "Sandy
 Huang" <hjc@rock-chips.com>, <linux-rockchip@lists.infradead.org>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>, "Raphael Gallais-Pou"
 <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, =?utf-8?q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, "Raspberry Pi Kernel Maintenance"
 <kernel-list@raspberrypi.com>, "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Michal Simek" <michal.simek@amd.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
 <20260618-terrestrial-abiding-tamarin-01befc@houat>
In-Reply-To: <20260618-terrestrial-abiding-tamarin-01befc@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15141-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,ideasonboard.com,amarulasolutions.com,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,rock-chips.com,baylibre.com,chromium.org,samsung.com,crapouillou.net,vger.kernel.org,collabora.com,googlemail.com,glider.be,bp.renesas.com,sntech.de,foss.st.com,st-md-mailman.stormreply.com,iki.fi,raspberrypi.com,igalia.com,iscas.ac.cn,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:laurent.pinchart+renesas@ideasonboard.com,m:jagan@amarulasolutions.com,m:victor.liu@nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:andy.yan@rock-chips.com,m:ple@baylibre.com,m:dianders@chromium.org,m:inki.dae@samsung.com,m:m.szyprowski@samsung.com,m:p.zabel@pengutronix.de,m:paul@crapouillou.net,m:linux-mips@vger.kernel.org,m:chunkuang.hu@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kieran.bingham+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m
 :heiko@sntech.de,m:hjc@rock-chips.com,m:linux-rockchip@lists.infradead.org,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:zhengxingda@iscas.ac.cn,m:michal.simek@amd.com,m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:laurent.pinchart@ideasonboard.com,m:matthiasbgg@gmail.com,m:martinblumenstingl@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[62];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-mips@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 373E06A0A15

Hi Maxime,

On Thu Jun 18, 2026 at 1:20 PM CEST, Maxime Ripard wrote:
> Hi,
>
> On Mon, Jun 08, 2026 at 04:35:42PM +0200, Maxime Ripard wrote:
>> Hi,
>>
>> All the bridges use reset to create a blank state only and don't use it
>> to reset the hardware at all. This is what the new atomic_create_state
>> is exactly supposed to be doing, so we can convert all existing bridge
>> users to it, and remove the reset hook and helpers.
>>
>> Let me know what you think,
>> Maxime
>>
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> FTR, Thomas on IRC yesterday[1] added
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Unless another review shows up, I intend to merge this tomorrow

Did you have a look at my questions for patches 7 and 8?

I was planning to review the following patches but that would be based on
what I asked there.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

