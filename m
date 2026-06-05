Return-Path: <linux-mips+bounces-14910-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rlZMbxsImoTXAEAu9opvQ
	(envelope-from <linux-mips+bounces-14910-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 08:29:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B92136457EF
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 08:29:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="M/ktB3sD";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D+iPx4bI;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aDw1UW+A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vDZD0R3r;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14910-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14910-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 336DE30095C2
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 06:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1423A9DB9;
	Fri,  5 Jun 2026 06:26:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE14403E93
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 06:26:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640786; cv=none; b=Xfg99iHTqwhRxbYLgXnuWm8rh2jETMsIvKMLEq4iKjjlUk6qCUyeF6V6FZKkdalVSH7lTSX1eosDqu1EaATr/vtGV8AkTpzPymSBtXzuqolSr6+SgCxpJhGNEQ0icDd3Dg7xik5Q60KZ5VfQXfgwpY5eY+TxHRzfkCv9RhgsJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640786; c=relaxed/simple;
	bh=38RGnRd1NueJdGc+q/2t2brBx7jhkq43ny3lgu2xz6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzC/Jg4QGGwMSsbHTG+49ZzwEIJ6zpQGf9zVNo9muyjCw787olgpI31D9ijSB64wIF6oytR0uICyn8cqHoEYZFTExdBvSujazzA+Hd7+3HWkoyfqfPHhjAqNgEC66g4wkrA5oPMu8zyEpzSJpSRai0BK0OdiUrxKTLz8fj1uXLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M/ktB3sD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D+iPx4bI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aDw1UW+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vDZD0R3r; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 24F686B166;
	Fri,  5 Jun 2026 06:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780640782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HDeTQz58PcqGgdo96oHM1bAJcR1truedFGkSCcBXtWU=;
	b=M/ktB3sDGmweoVLgNXTldix/Xe30DbDNLuF62jskgLSpIFP7B4UDIS4DEc9GWvlaocwIkh
	MzYsboaSx1lq9NL9w3sbKI15lcCvSzUUgy7ZrTTgOWI5JEeGHQVF+Ws2+Lxwav5KmNURWj
	H7HdUv9yY3M5Yo7/TUsecdXNj6mQIjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780640782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HDeTQz58PcqGgdo96oHM1bAJcR1truedFGkSCcBXtWU=;
	b=D+iPx4bIg0cPuvx5LRbbICTL22xfS2wQ++R9gmSJNJXGkWLeJOe6PCy7H2nCTjiItAfI+1
	cns0pwNXGHlJ7fBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780640781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HDeTQz58PcqGgdo96oHM1bAJcR1truedFGkSCcBXtWU=;
	b=aDw1UW+A6yqS0t9biGU1kM/uDWClp4JVjfCpCKKYRPoi7hW5ZUoHfFiOFzrKmoJNc0yU2M
	uuYUkV1jhYjR/HyaqMqsUUErX8NJH9lMYGWAImrkVnWSpH3rCgRPaSTi+JaduzU9ke3yFG
	pPaTRpMgw/hnrLvIzrceR6N8QmELCxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780640781;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HDeTQz58PcqGgdo96oHM1bAJcR1truedFGkSCcBXtWU=;
	b=vDZD0R3ry92z2A2yziaUK6wGo4KqKPNJ0t6eVE3IfNyctjPaz+BMIL6O1fwV+VQF5YMMcs
	Mw015zl7yJbuC7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD5B6779A8;
	Fri,  5 Jun 2026 06:26:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KbQCKQpsImrNcwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 05 Jun 2026 06:26:18 +0000
Message-ID: <dce03a80-3d6b-4792-9868-d6052fa3ea77@suse.de>
Date: Fri, 5 Jun 2026 08:26:17 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/76] drm/bridge: Convert all reset users to create_state
To: Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, Liu Ying <victor.liu@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Phong LE <ple@baylibre.com>, Douglas Anderson <dianders@chromium.org>,
 Inki Dae <inki.dae@samsung.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Michal Simek <michal.simek@amd.com>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,amarulasolutions.com,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,rock-chips.com,baylibre.com,chromium.org,samsung.com,crapouillou.net,vger.kernel.org,collabora.com,googlemail.com,ideasonboard.com,glider.be,bp.renesas.com,sntech.de,foss.st.com,st-md-mailman.stormreply.com,iki.fi,raspberrypi.com,igalia.com,iscas.ac.cn,amd.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14910-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:lumag@kernel.org,m:dri-devel@lists.freedesktop.org,m:jagan@amarulasolutions.com,m:victor.liu@nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:andy.yan@rock-chips.com,m:ple@baylibre.com,m:dianders@chromium.org,m:inki.dae@samsung.com,m:m.szyprowski@samsung.com,m:p.zabel@pengutronix.de,m:paul@crapouillou.net,m:linux-mips@vger.kernel.org,m:chunkuang.hu@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:l
 inux-amlogic@lists.infradead.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kieran.bingham+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:zhengxingda@iscas.ac.cn,m:michal.simek@amd.com,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid,suse.de:dkim,suse.de:from_mime,suse.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B92136457EF

Hi

Am 30.05.26 um 15:59 schrieb Maxime Ripard:
[...]
>        drm/bridge: adv7511: Switch to atomic_create_state
>        drm/bridge: analogix_dp: Switch to atomic_create_state
>        drm/bridge: anx7625: Switch to atomic_create_state
>        drm/bridge: chipone-icn6211: Switch to atomic_create_state
>        drm/bridge: display-connector: Switch to atomic_create_state
>        drm/bridge: fsl-ldb: Switch to atomic_create_state
>        drm/bridge: imx8mp-hdmi-pvi: Switch to atomic_create_state
>        drm/bridge: imx8qm-ldb: Switch to atomic_create_state
>        drm/bridge: imx8qxp-ldb: Switch to atomic_create_state
>        drm/bridge: imx8qxp-pixel-combiner: Switch to atomic_create_state
>        drm/bridge: imx8qxp-pixel-link: Switch to atomic_create_state
>        drm/bridge: imx8qxp-pxl2dpi: Switch to atomic_create_state
>        drm/bridge: inno-hdmi: Switch to atomic_create_state
>        drm/bridge: ite-it6263: Switch to atomic_create_state
>        drm/bridge: ite-it6505: Switch to atomic_create_state
>        drm/bridge: ite-it66121: Switch to atomic_create_state
>        drm/bridge: lontium-lt9211: Switch to atomic_create_state
>        drm/bridge: lontium-lt9611: Switch to atomic_create_state
>        drm/bridge: lvds-codec: Switch to atomic_create_state
>        drm/bridge: nwl-dsi: Switch to atomic_create_state
>        drm/bridge: panel: Switch to atomic_create_state
>        drm/bridge: parade-ps8640: Switch to atomic_create_state
>        drm/bridge: samsung-dsim: Switch to atomic_create_state
>        drm/bridge: sii902x: Switch to atomic_create_state
>        drm/bridge: ssd2825: Switch to atomic_create_state
>        drm/bridge: dw-dp: Switch to atomic_create_state
>        drm/bridge: dw-hdmi-qp: Switch to atomic_create_state
>        drm/bridge: dw-hdmi: Switch to atomic_create_state
>        drm/bridge: dw-mipi-dsi: Switch to atomic_create_state
>        drm/bridge: dw-mipi-dsi2: Switch to atomic_create_state
>        drm/bridge: tc358762: Switch to atomic_create_state
>        drm/bridge: tc358767: Switch to atomic_create_state
>        drm/bridge: tc358768: Switch to atomic_create_state
>        drm/bridge: tc358775: Switch to atomic_create_state
>        drm/bridge: ti-dlpc3433: Switch to atomic_create_state
>        drm/bridge: ti-sn65dsi83: Switch to atomic_create_state
>        drm/bridge: ti-sn65dsi86: Switch to atomic_create_state
>        drm/bridge: ti-tdp158: Switch to atomic_create_state
>        drm/bridge: ti-tfp410: Switch to atomic_create_state
>        drm/imx: parallel-display: Switch to atomic_create_state
>        drm/ingenic: Switch to atomic_create_state
>        drm/mediatek: dp: Switch to atomic_create_state
>        drm/mediatek: dpi: Switch to atomic_create_state
>        drm/mediatek: dsi: Switch to atomic_create_state
>        drm/mediatek: hdmi: Switch to atomic_create_state
>        drm/mediatek: hdmi_v2: Switch to atomic_create_state
>        drm/meson: encoder_cvbs: Switch to atomic_create_state
>        drm/meson: encoder_dsi: Switch to atomic_create_state
>        drm/meson: encoder_hdmi: Switch to atomic_create_state
>        drm/msm: dp: Switch to atomic_create_state
>        drm/msm: hdmi: Switch to atomic_create_state
>        drm/omap: hdmi4: Switch to atomic_create_state
>        drm/omap: hdmi5: Switch to atomic_create_state
>        drm/renesas: rcar-du: lvds: Switch to atomic_create_state
>        drm/renesas: rcar-du: mipi_dsi: Switch to atomic_create_state
>        drm/renesas: rz-du: mipi_dsi: Switch to atomic_create_state
>        drm/rockchip: cdn-dp: Switch to atomic_create_state
>        drm/rockchip: rk3066_hdmi: Switch to atomic_create_state
>        drm/rockchip: lvds: Switch to atomic_create_state
>        drm/stm: lvds: Switch to atomic_create_state
>        drm/tests: bridge: Switch to atomic_create_state
>        drm/tidss: encoder: Switch to atomic_create_state
>        drm/tidss: oldi: Switch to atomic_create_state
>        drm/vc4: dsi: Switch to atomic_create_state
>        drm/verisilicon: Switch to atomic_create_state
>        drm/xlnx: zynqmp_dp: Switch to atomic_create_state

You can also add my

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

to all these one-liners in the drivers.

Best regards
Thomas


>        drm/atomic-state-helper: Remove drm_atomic_helper_bridge_reset()
>        drm/bridge: cdns-dsi: Use __drm_atomic_helper_bridge_state_init()
>        drm/bridge: cdns-dsi: Switch to atomic_create_state
>        drm/bridge: cdns-mhdp8546: Switch to atomic_create_state
>        drm/bridge: Remove atomic_reset support
>
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  2 +-
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  2 +-
>   drivers/gpu/drm/bridge/analogix/anx7625.c          |  2 +-
>   drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  9 +++---
>   .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  8 +++---
>   drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
>   drivers/gpu/drm/bridge/display-connector.c         |  2 +-
>   drivers/gpu/drm/bridge/fsl-ldb.c                   |  2 +-
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  2 +-
>   drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |  2 +-
>   drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  2 +-
>   .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  2 +-
>   drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  2 +-
>   drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  2 +-
>   drivers/gpu/drm/bridge/inno-hdmi.c                 |  2 +-
>   drivers/gpu/drm/bridge/ite-it6263.c                |  2 +-
>   drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
>   drivers/gpu/drm/bridge/ite-it66121.c               |  2 +-
>   drivers/gpu/drm/bridge/lontium-lt9211.c            |  2 +-
>   drivers/gpu/drm/bridge/lontium-lt9611.c            |  2 +-
>   drivers/gpu/drm/bridge/lvds-codec.c                |  2 +-
>   drivers/gpu/drm/bridge/nwl-dsi.c                   |  2 +-
>   drivers/gpu/drm/bridge/panel.c                     |  2 +-
>   drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
>   drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
>   drivers/gpu/drm/bridge/sii902x.c                   |  2 +-
>   drivers/gpu/drm/bridge/ssd2825.c                   |  2 +-
>   drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  2 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  2 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  2 +-
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
>   drivers/gpu/drm/bridge/tc358762.c                  |  2 +-
>   drivers/gpu/drm/bridge/tc358767.c                  |  4 +--
>   drivers/gpu/drm/bridge/tc358768.c                  |  2 +-
>   drivers/gpu/drm/bridge/tc358775.c                  |  2 +-
>   drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  2 +-
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
>   drivers/gpu/drm/bridge/ti-tdp158.c                 |  2 +-
>   drivers/gpu/drm/bridge/ti-tfp410.c                 |  2 +-
>   drivers/gpu/drm/drm_atomic_state_helper.c          | 33 ++++++++++++----------
>   drivers/gpu/drm/drm_bridge.c                       |  4 +--
>   drivers/gpu/drm/imx/ipuv3/parallel-display.c       |  2 +-
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  2 +-
>   drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
>   drivers/gpu/drm/mediatek/mtk_dpi.c                 |  2 +-
>   drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
>   drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_dsi.c          |  2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  2 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c                    |  4 +--
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  2 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c                |  2 +-
>   drivers/gpu/drm/omapdrm/dss/hdmi5.c                |  2 +-
>   drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  2 +-
>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  2 +-
>   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |  2 +-
>   drivers/gpu/drm/rockchip/cdn-dp-core.c             |  2 +-
>   drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  2 +-
>   drivers/gpu/drm/rockchip/rockchip_lvds.c           |  2 +-
>   drivers/gpu/drm/stm/lvds.c                         |  2 +-
>   drivers/gpu/drm/tests/drm_bridge_test.c            |  2 +-
>   drivers/gpu/drm/tidss/tidss_encoder.c              |  2 +-
>   drivers/gpu/drm/tidss/tidss_oldi.c                 |  2 +-
>   drivers/gpu/drm/vc4/vc4_dsi.c                      |  2 +-
>   drivers/gpu/drm/verisilicon/vs_bridge.c            |  4 +--
>   drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  2 +-
>   include/drm/drm_atomic_state_helper.h              |  6 ++--
>   include/drm/drm_bridge.h                           | 33 ++++++++--------------
>   72 files changed, 111 insertions(+), 120 deletions(-)
> ---
> base-commit: 21fcb222f0d1e1c9f5b04c09e9fb3408e13a0264
> change-id: 20260530-drm-no-more-bridge-reset-ca20d5e22740
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



