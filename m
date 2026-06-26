Return-Path: <linux-mips+bounces-15233-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QrchFMeWPmqMIgkAu9opvQ
	(envelope-from <linux-mips+bounces-15233-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 17:12:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D25286CE5C2
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 17:12:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=hPM9TV7B;
	dkim=pass header.d=redhat.com header.s=google header.b=qUqywsK7;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15233-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15233-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B84D300D358
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667C637C108;
	Fri, 26 Jun 2026 15:12:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8AE37CD2E
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 15:11:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486724; cv=pass; b=S7m2nVZIcxgETiQC6wVGdcJwuZcxIvDPvQviMOZ9OgSZgV/icxBg/6p0LfNNg8zqyB02dviMabqRkQjwY726sYIOBLC+Lvh9A3Xln0hbiEKfglQmq1UE/AjnNbKwk9Q5q9tRRXk6Dvzb8lIPmDL+rPNgWplGYhZNhGFhHtQ2KFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486724; c=relaxed/simple;
	bh=Evlqo2mKiWd3GWD+tOTSIJ+Llo4YzdKnMs4LsgHm9FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bX0jME55kHAQbG8Gh8CKbtFJ8tH1I5jXP/lF7pk+mvQKGLubzJQBuojDHup3Jr0sEjWxojnuHCwJ63ikPr6J4ezhtazSY1jgZYXJkHb5oOqqjHseAplWv/9O+bS2s8anDw7DShw5fuZh3vEaA1xQf+BS21Ag+pN8HpKZAaQDADE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hPM9TV7B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qUqywsK7; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782486716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
	b=hPM9TV7BCHIdybqUCzr5pGdqGZaks8qnRCS/NAKH50BrkJMA9gZ7F6gq8D8btT0Ev3sNCj
	aU3EjI/PfTeaCvZE/OHPe8Nw3KEMpkVrItpQulKym8BuHzBbJitEbSrGWNNAhjjwFdaFuq
	6Xxps7w+JQS9NpwJCF7pVqoIChV8oM4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-_zQgfm03N6qII5_3Ajykkg-1; Fri, 26 Jun 2026 11:11:54 -0400
X-MC-Unique: _zQgfm03N6qII5_3Ajykkg-1
X-Mimecast-MFC-AGG-ID: _zQgfm03N6qII5_3Ajykkg_1782486714
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7fe0184fa91so20191637b3.2
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 08:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486714; cv=none;
        d=google.com; s=arc-20260327;
        b=RYVaSXey+eFCS1wEy9mf5RP5zxDgiipuqDu8YSRjIm/+AR2/D/MRBc0eGR+b54dMPs
         m4NECHguqWxLLg98C9GC4VAPOugXDV2vsFauhgz+cOJJWSLkfWO3zrdJqcjGFx1whC7U
         dEEpFPWsfclnSPpWgqpUKazA6gc4gLZw/4yDhmsqofNYaxm8PuUUo4eonCxWa6g0DrNG
         wYICZLLUatYiYJW/ZcCeUlM8No2DI0Dg5y5N/LLhgNpCIVmm5g2mazcpxbsRe1kJ+cxQ
         uiW7/O4aqDSsxwmjYVnZR8XsAzrIO3QiD8mRp7wnexzUi0t0rnxOqHZG/kIjXl4oeEhN
         dmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        fh=fotFZgTFpF7tBS+mNnI8p5jvB4SHKhoVFDCirRFZyhk=;
        b=M71p3yZpD0EIxnyGZ47u7pvMmQn+e5iSlflVL0WvckluuwInAMNrLqnDzZghqMVDhp
         1U3OaIy1NrfLVUH3eaOtiPnTVjItZEmkkaj2THWBhWseeHTv4jy3I2rx0zM+HbEbbRPH
         WTVJzKtvNq4M+kyUGaxapxulv0Xd1g+fmFpj3EeiB00HWOHu6yccAKjeofbJak1CTvOn
         Ql/Xkafjxdgav7AxD6IU8QXChMN9qgLARnKtfUuPa7muu39BQjuXH0z2wfte94lVS50l
         opMv/rJ9rQ6aDxeO5nLfGxYrwGeYr1RjdgNnd/4FwAQjjgJ6pFhbzU+Y3jzWoLvUjXkV
         qJZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782486714; x=1783091514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        b=qUqywsK75FJf1QrIm0fEU72pMXDjQUMdBuy5NaOdS+ylNmFxDSI/yKQU+tdCbNsOMr
         mIXjSZNn78h2dU6NFM2q0UdYYXLIz9/F0vxLaz/eQy//GfH2Ejs2LikJGXsz1xuHYktG
         P2uDJ7eCWLNsep0X+MOaPp7xgqsfyk9AiNpeILd6yuITy2z4t0vi0ByCuiZ9qRPMxivN
         jzaAHnLmXHKsxW9Q1U/0DjJRfUQWOKGkpAJyKxwLfyrNX5pVTRNOUImuQSn/TDTNmyZ0
         UHQtTKGIBNbvays1jYc9Tu0rbstVRSHnIs8V/upwCKGqGM2LIpWTDsYlEdrwn5YvE+bA
         /ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486714; x=1783091514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        b=DjgpRR233pf/pGVv0LOQKYoHnWPrRFdCdVwJyS2URy69SgjtUiBo6BEFhG1M+gvLAP
         /3ccVoA3anSV/rfAl55obwcro1raxQ42/bDp0vX1deUVxkgK1Y1Nb88YWeXWBfvqLWEC
         geXjFeinEVep3FRRm2D2Fn17IyyRMq8UWVFIOoKc7/6ettb2FhZjYTUfwPm/e2sUzsSz
         Je1ckujiIrf/q4pVUlYfXqrSJujKdbIOiWkZAzkx/PahHbLQYV9YoVNdAtOyJxnsVaX6
         0AZk5IejFi3T2OgHT/p52QbAwhtgnNVFUfHqG8AgHAv35PDXInHynt2wQ8rdVbeIb9kl
         levw==
X-Forwarded-Encrypted: i=1; AHgh+RqBtS+0QwwDq40jLzyAdmuns7DgWkS7OxaM9r+dGisgCjoSGJw72K1PgiFQVZHGk2r2EvMEaLm8nXJM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5s0fCHHHt/Q2J9EDW1QZpiEBNIsUfowsip0fv61PKa0RswBgx
	Q+OK9IN5Na1bRo+RksFgRkgZhpsTVGTBNJAjJEvGrDwKMRL3rWihBAGXdQEwzdXfUGkYPuxKBha
	ttUw/RD/aSRh6SZteLPJg8J86mXcAz7g2ttNdtfn89CiIbaa0O8iLD6F3Uoo6rlabba/SheMnPu
	uyagO0f69K4hiBqIMx2sj74qBTvu5B9rWwMrGlAA==
X-Gm-Gg: AfdE7cm3r0MpTIp2XuG1r5sVCUTVk+TwyA1j+je7uS71Gb42u2pR+LQHA1mUsTBcGGR
	sYi2wDwO87GeNETWgRwM8bkQW6SUHCZFlqE2nAZwlm09UoX3wUUCStdwTIxX5L6jVwnWjVd6fG2
	d8aolQrCzS4e4eoGy71OD3d7UV1eIXd4eoijVfL9mrPNCJIxBA34mJ8i9IVmgo+K2B
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id 00721157ae682-80c73fe6f4bmr9719367b3.42.1782486713987;
        Fri, 26 Jun 2026 08:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id
 00721157ae682-80c73fe6f4bmr9718797b3.42.1782486713496; Fri, 26 Jun 2026
 08:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com> <20260626-successful-badger-from-neptune-ae2bc6@houat>
In-Reply-To: <20260626-successful-badger-from-neptune-ae2bc6@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 17:11:42 +0200
X-Gm-Features: AVVi8CdeJARTOKb4ohxfJd8a69EdpRugjimEtA7qtwxmMR2cbKOdWmwQblTZgKI
Message-ID: <CADSE00LO98u6aDwvjijO_hAaMBXSGXaWPuFWiveQi_RWQ0MTVA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: make *find_panel*() return a counted reference
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,intel.com,kernel.org,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-15233-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-samsung-soc@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D25286CE5C2

On Fri, Jun 26, 2026 at 2:50=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:25PM +0200, Albert Esteve wrote:
> > Callers of of_drm_find_panel() receive a pointer with no reference
> > held, creating a window where the panel device can be unregistered
> > and freed between the lookup and first use (e.g., drm_panel_prepare()).
> >
> > find_panel_by_fwnode() is the fwnode counterpart of of_drm_find_panel()=
.
> > drm_panel_add_follower() worked around the missing panel kref by callin=
g
> > get_device() on the panel's underlying struct device. However, get_devi=
ce()
> > only prevents the device kobject from being freed. It does not prevent =
the
> > panel's kzalloc()'d container memory from being released when the kref
> > reaches zero.
> >
> > Fix both lookup functions by acquiring a reference with drm_panel_get()
> > before returning, under panel_lock. Callers are now responsible for cal=
ling
> > drm_panel_put() when they no longer need the pointer.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index 545fe93dc28fe..a00ae98ed0956 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -458,14 +458,17 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
> >
> >  #ifdef CONFIG_OF
> >  /**
> > - * of_drm_find_panel - look up a panel using a device tree node
> > + * of_drm_find_panel - look up and reference a panel by device tree no=
de
> >   * @np: device tree node of the panel
> >   *
> >   * Searches the set of registered panels for one that matches the give=
n device
> > - * tree node. If a matching panel is found, return a pointer to it.
> > + * tree node. If a matching panel is found, the panel's reference coun=
t is
> > + * incremented before returning a pointer to it. The caller must call
> > + * drm_panel_put() when it no longer needs the panel pointer.
> >   *
> > - * Return: A pointer to the panel registered for the specified device =
tree
> > - * node or an ERR_PTR() if no panel matching the device tree node can =
be found.
> > + * Return: A reference-counted pointer to the panel registered for the=
 specified
> > + * device tree node or an ERR_PTR() if no panel matching the device tr=
ee node
> > + * can be found.
> >   *
> >   * Possible error codes returned by this function:
> >   *
> > @@ -484,6 +487,7 @@ struct drm_panel *of_drm_find_panel(const struct de=
vice_node *np)
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (panel->dev->of_node =3D=3D np) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
> > @@ -538,7 +542,13 @@ int of_drm_get_panel_orientation(const struct devi=
ce_node *np,
> >  EXPORT_SYMBOL(of_drm_get_panel_orientation);
> >  #endif
> >
> > -/* Find panel by fwnode. This should be identical to of_drm_find_panel=
(). */
> > +/*
> > + * Find panel by fwnode, returning a counted reference.
> > + *
> > + * Behaves identically to of_drm_find_panel(). On success the returned
> > + * pointer has been passed through drm_panel_get(); the caller must ca=
ll
> > + * drm_panel_put() when done with it.
> > + */
> >  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_hand=
le *fwnode)
> >  {
> >       struct drm_panel *panel;
> > @@ -550,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const=
 struct fwnode_handle *fwnode
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
>
> This part should probably be in a separate patch

Yes. This is another place where I hesitated on organization, as it is
very similar to of_drm_find_panel() fix. But find_panel_by_fwnode() is
much more self-contained (it is declared static to begin with). So it
makes sense to split them. I will do so in the next version.

>
> > @@ -686,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_fol=
lower *follower)
> >       mutex_unlock(&panel->follower_lock);
> >
> >       put_device(panel->dev);
> > +     drm_panel_put(panel);
> >  }
> >  EXPORT_SYMBOL(drm_panel_remove_follower);
>
> together with this one?
>
> Maxime


