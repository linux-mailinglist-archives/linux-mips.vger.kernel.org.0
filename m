Return-Path: <linux-mips+bounces-15220-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ejZHJvJ0PmrAGQkAu9opvQ
	(envelope-from <linux-mips+bounces-15220-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:47:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 079C96CD210
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 14:47:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="cfxGAN/j";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15220-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15220-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11632301025D
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 12:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20FF3F5BC2;
	Fri, 26 Jun 2026 12:47:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885C3F54C9;
	Fri, 26 Jun 2026 12:47:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478061; cv=none; b=twlpgxBL6cHMxi5RcQBIcNu4VPKEkFHj+YV616IEsbvBAS4pmZiV9TJPrRCf1/MA4BEfVo8A6mjTpgMECpyjmlCsMRHFz8dCytgWExsq1qRlkw3RWncoTNBzsP3Vcrem7qUKVmMSbKGbSsfsXXLiTr8Q8aZgBrEYRfhA0EvdN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478061; c=relaxed/simple;
	bh=d+LWMOcyZyTXzD9/HUFkvzlnP4bg7RRXDRK8N9avc7c=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=TXz3QyHJ7I3CsM8xtH25uqH6wQxSnmKkTs8ex6rzJR/hFr4Urpa94pZ+caPcwnMnmUcZARJiQhvzo626HCz1ARkxjAY72vGh+CJgH2/mlgnA7Fon/ga17xmHrLxF6tr+6bbBDC8QCfE/jF7TeHu4lG57ap2VmMhsa0o2eESiqIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfxGAN/j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D421F000E9;
	Fri, 26 Jun 2026 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478051;
	bh=gcyGrresjTTPmNzfpyIyHzXr15imrzLhXIY91GPffew=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=cfxGAN/jcCri326WXf34xWET6jX2QyOm4MN8pOKcqeKKkNBjEv6dqSXeKvaCEjiqQ
	 xMUnaQaNuIQ/CQpLmGf1YlXqiGM0E0hqnbxoXWt1LrQHDTq2J3OIjNE3S2u9Xn/5ix
	 oK+DP1AL9NHLm/+ebKyBGxhWgla2EUstpziga4oibOgZCkFVMReghKfhD46XkJseIF
	 4XVC8j4IST/6OWvdETIEQ6EjrbCmQnuVJeZuoqmH1cmfRtKD2cnh8CooWMpcUWm9DM
	 tqoCryTCxfyH5x8StBEipzh+MB2ezInl6ba2yu/4cYIqDp4Gf/3f7LbllTeUaSycd1
	 37NkVCXO7+daQ==
Message-ID: <f183d0ba167f71e0555814f7447f46e0@kernel.org>
Date: Fri, 26 Jun 2026 12:47:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH 1/5] drm/panel: have drm_panel_add/remove manage a list
 reference
In-Reply-To: <20260626-drm_refcount_wiring-v1-1-cca1a7b3bdef@redhat.com>
References: <20260626-drm_refcount_wiring-v1-1-cca1a7b3bdef@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Alison Wang" <alison.wang@nxp.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Chen-Yu Tsai" <wens@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Jingoo Han" <jingoohan1@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Laurentiu
 Palcu" <laurentiu.palcu@oss.nxp.com>, "Linus Walleij" <linusw@kernel.org>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Peter Griffin" <peter.griffin@linaro.org>, "Philippe
 Cornu" <philippe.cornu@foss.st.com>, "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thierry
 Reding" <thierry.reding@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Yannick Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15220-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aesteve@redhat.com,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:alain.volmat@foss.st.com,m:alexandre.torgue@foss.st.com,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:andrzej.hajda@intel.com,m:andy.yan@rock-chips.com,m:biju.das.jz@bp.renesas.com,m:wens@kernel.org,m:airlied@gmail.com,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:geert+renesas@glider.be,m:heiko@sntech.de,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:jernej.skrabec@gmail.com,m:jesszhan0024@gmail.com,m:jingoohan1@gmail.com,m:jonas@kwiboo.se,m:jonathanh@nvidia.com,m:jyri.sarha@iki.fi,m:kieran.bingham+renesas@ideasonboard.com,m:krzk@kernel.org,m:kyungmin.park@samsung.com,
 m:Laurent.pinchart@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:laurentiu.palcu@oss.nxp.com,m:linusw@kernel.org,m:luca.ceresoli@bootlin.com,m:l.stach@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:magnus.damm@gmail.com,m:m.szyprowski@samsung.com,m:marex@denx.de,m:mcoquelin.stm32@gmail.com,m:mripard@kernel.org,m:mperttunen@nvidia.com,m:neil.armstrong@linaro.org,m:paul@crapouillou.net,m:paulk@sys-base.io,m:kernel@pengutronix.de,m:peter.griffin@linaro.org,m:philippe.cornu@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:rgallaispou@gmail.com,m:rfoss@kernel.org,m:samuel@sholland.org,m:hjc@rock-chips.com,m:s.hauer@pengutronix.de,m:sw0312.kim@samsung.com,m:simona@ffwll.ch,m:stefan@agner.ch,m:thierry.reding@kernel.org,m:tzimmermann@suse.de,m:tomi.valkeinen@ideasonboard.com,m:yannick.fertre@foss.st.com,m:geert@glider.be,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,foss.st.com,samsung.com,nxp.com,intel.com,rock-chips.com,bp.renesas.com,kernel.org,gmail.com,glider.be,sntech.de,amarulasolutions.com,kwiboo.se,nvidia.com,iki.fi,ideasonboard.com,oss.nxp.com,bootlin.com,pengutronix.de,linux.intel.com,denx.de,linaro.org,crapouillou.net,sys-base.io,sholland.org,ffwll.ch,agner.ch,suse.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[68];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 079C96CD210

On Fri, 26 Jun 2026 14:03:23 +0200, Albert Esteve wrote:
> The global panel_list holds raw pointers to drm_panel objects.
> Nothing prevents a panel from being freed while it is still linked
> in the list: if a driver's probe calls drm_panel_add() and then
> fails at a later step, panel->list remains in panel_list. Any
> subsequent call to of_drm_find_panel() that iterates the list will
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

