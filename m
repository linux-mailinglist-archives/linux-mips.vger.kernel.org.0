Return-Path: <linux-mips+bounces-15155-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z/GlALJ3NWqUxAYAu9opvQ
	(envelope-from <linux-mips+bounces-15155-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 19:09:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87D6A73B7
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 19:09:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=GtrXlAr8;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15155-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15155-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A3FB3007A58
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2026 17:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5E33C1081;
	Fri, 19 Jun 2026 17:08:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE83C109A;
	Fri, 19 Jun 2026 17:08:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781888939; cv=none; b=N4ooNyd+QUvagfZLlGOyUJ/wHrcIO63kQB/Rx1vljPbKjulXTM3VBcoEEMExJYsZ4FeSD6p6F+xvgEw3L85Mi51RGnhrQWJytZdue3I0oOJ2qnLx40V/zZPBsbc5V0545tj1XOd3LFY3vqUCLf6GufMemh/CppmGJBJHEcYWZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781888939; c=relaxed/simple;
	bh=mRl+p8NKZ4Uqi2DbJxfA0N/bImQMn69IfQP2gWfdIn0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=oSQwx9sJqCwgrI5JNC3OKrGeSpMv4wuhszex40BXxSYfWEh+zgFLal2sOCjScEiCN3SlZsWYfpFiNWy+2nnEoEameL9xg97BPf2qB/jh/sxUlog17TNWJRJqOnz2/shBWeFJ30PXs7jR2hM0CKw3W3iY7YPahjnoD7CmlGfK9zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GtrXlAr8; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CE5CEC06CD9;
	Fri, 19 Jun 2026 17:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D0853601B9;
	Fri, 19 Jun 2026 17:08:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABDCB106C81BC;
	Fri, 19 Jun 2026 19:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781888933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mRl+p8NKZ4Uqi2DbJxfA0N/bImQMn69IfQP2gWfdIn0=;
	b=GtrXlAr82THdxC+x0ULzqK2LukzejYV/HHoWOhy0rnLT9OCpYYx7DI0Ca2otXI9MC6rt/O
	PsvsTGMeYR1QQyMhXODXb0bsnVpo8b1AJ5+BgWuRE1TXpWDRyaaCCbnZP5H1KaZxDHKOq8
	LO9lu7HAld9YGGFAMtt1mZ3JVL+4nqR9ev+P20IAsV/TdprJ6Y3Ojqy3AdzA+jesc0ToOp
	juIU32H7fFGeN2OVgc7cbk8rehCcARkdf3oE9Mh7qI0ISz6SprChxJjgB103aMMhEs3RCn
	air8p6ZpJxAcff89Au6uOVPjVLW7KZvMw6SPD2Zm3W+p1HNv5XsA8iGWnatxuQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Jun 2026 19:08:35 +0200
Message-Id: <DJD6WITJWQHS.1XR1LK4S8N5H5@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 00/78] drm/bridge: Convert all reset users to
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
 <linux-mips@vger.kernel.org>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
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
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>
X-Mailer: aerc 0.21.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
 <DJD2IQSFENH4.337VSFOU7OJ29@bootlin.com>
In-Reply-To: <DJD2IQSFENH4.337VSFOU7OJ29@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15155-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,ideasonboard.com,amarulasolutions.com,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,rock-chips.com,baylibre.com,chromium.org,samsung.com,crapouillou.net,vger.kernel.org,collabora.com,googlemail.com,glider.be,bp.renesas.com,sntech.de,foss.st.com,st-md-mailman.stormreply.com,iki.fi,raspberrypi.com,igalia.com,iscas.ac.cn,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:laurent.pinchart+renesas@ideasonboard.com,m:jagan@amarulasolutions.com,m:victor.liu@nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:andy.yan@rock-chips.com,m:ple@baylibre.com,m:dianders@chromium.org,m:inki.dae@samsung.com,m:m.szyprowski@samsung.com,m:p.zabel@pengutronix.de,m:paul@crapouillou.net,m:linux-mips@vger.kernel.org,m:angelogioacchino.delregno@collabora.com,m:chunkuang.hu@kernel.org,m:matthias.bgg@gmail.com,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:khilman@baylibre.c
 om,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kieran.bingham+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:heiko@sntech.de,m:hjc@rock-chips.com,m:linux-rockchip@lists.infradead.org,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:zhengxingda@iscas.ac.cn,m:laurent.pinchart@ideasonboard.com,m:michal.simek@amd.com,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_GT_50(0.00)[63];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB87D6A73B7

On Fri Jun 19, 2026 at 3:42 PM CEST, Luca Ceresoli wrote:
> On Fri Jun 19, 2026 at 2:24 PM CEST, Maxime Ripard wrote:
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
> Whole series:
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

And now also:
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # imx8mp + sn65dsi84 +=
 bridge hotplug

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

