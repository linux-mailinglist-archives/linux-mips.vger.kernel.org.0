Return-Path: <linux-mips+bounces-15231-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IIJ1HKB6PmotGwkAu9opvQ
	(envelope-from <linux-mips+bounces-15231-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:12:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFE66CD4F9
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:11:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=cLmglm0f;
	dkim=pass header.d=redhat.com header.s=google header.b=MgiDcA2I;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15231-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15231-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 769E63007F59
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE66F3AC0F6;
	Fri, 26 Jun 2026 13:11:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDA73F4DCD
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 13:11:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479517; cv=pass; b=WOLi4Cc6C0pgd3Lrx/fRj7m1QlTVarZHDBws5S+Gg8wqgWUMNZk9mvKfm3z5zxb1mwwOcpT49qpnk1ZCQubvmbnihwrQvIMDV4Zgw0FHnsmRbkPXieUgV+zQyTraJltLM9lLZ4kmfYQJ6mp5/KHCHD2LPZ5pVp5w9KJATfeWCjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479517; c=relaxed/simple;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arqJNAQDYPTZvVufNOw9LY1U7mba0GPQ3sWGHusE2fw1HGQatNtEGzsbnd8nbjsB5fjsOKM2kpmuzngF8Rlc7qCWJV6aCess1AeIKKYijq2zh1iLdGXkBI1DNlC1K/TsKwUdizae1O+xzGQy7hREQffOr1DvFEmgoTWG4Zk/jsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLmglm0f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgiDcA2I; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782479515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	b=cLmglm0fFtdT+tIAZb6uKVEXMr65V0gMWXMmZyYqtbeIF6nMdAu+bEKeh2VZ+R1JfpLlrc
	pU7ZGeCtvqzRnHmVrQsaAAOCvrSNFIjeCgKSqIqGo84Yq7T70fQAU4eNrDSa/MAhN2vjmY
	3rFzQKQT3MKDDLHfxYtEgTvV8Ku8MIo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-zo6J45WFOjmWe3BenDwHQw-1; Fri, 26 Jun 2026 09:11:54 -0400
X-MC-Unique: zo6J45WFOjmWe3BenDwHQw-1
X-Mimecast-MFC-AGG-ID: zo6J45WFOjmWe3BenDwHQw_1782479513
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8003dfff66dso18517097b3.1
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 06:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782479513; cv=none;
        d=google.com; s=arc-20260327;
        b=nv6vhC8GIGYyul621fgOuOgzhUJR9U8uyOGpOF3F9bhyEXvNTebaLIHZG1a3MRpJ1B
         fhzzbN1bBNwXWkJA/IpmkQEhSaYiNo5E94ijvmZjqzVBXV2utu1XH/F0oj7EqyIotsaE
         sM8hDEuB3WUn+rRc08aec9rASZlwfegwasOksx6H1aNQ48E/dM4GvsSNQuYRbwCRdtC4
         BDpt/S/YTHnGkcVzYIF0cXT9PXvNs5HPAHtiFrNNkir3Jwq+6z3UnhZIRWBAAM8HKDFw
         4YSWmrAY49uuc4bYbiXBsjKx+nLowXVuhfPm7TYmxczlB3nhm4lE+2NbadidgOno3bIw
         rjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        fh=uwk2Stpj0/kpwXhFDHHX/MIFuF4A9m2K9W6lDLzfQyk=;
        b=dftDRv1DXM4eeg9/FVPQN/9UcDVoE0G2YdLXmgumaykLj9fUFiUVaXRTAl1HEVIe7+
         OiaOtCpyUKxgGL3VYvwkkHrNmprqO+RzbQFgyjauO49BtsKmfWzQFbgXENKQCIV1VZlR
         9ytErW8yxg+XrqGaTAotvWv7INlm9hyOy32o5eQ+axuSiw2Z8AI7giiqIz9/kdCTBEDy
         lM4am+Vt3KM7dx15y6slho0/ZlPA9gdUYB/+7vgBNsM5cz+/mXqH2e1WVgid2HU7qf/f
         OY6Dwbei8mgOITzTqCJLnWN8DEwQLucbxyEWZnxSf/zIVFBD8xj/P6ZovgQ1fuLTNQQf
         /REA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782479513; x=1783084313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=MgiDcA2IyareaUA8F+1bCR7ftoqsrzWDFpj/gpuOfEOqoQPeNn42ZtbsRBhxd96I4h
         KWAQtmWsLUa62XFLjckKGf55gTDDeM6hEcNDKfBw2VsHS+lMHjFvYm9SMMeWPQdy1DH7
         8nvtHcJKtEmzvz3ziDLdNO4xnwMS7DoiJsvf1ZG/CWZIVEIx0tARXyN3tu5LaM3W7gkq
         C4Uw0hk539NerXaKHjW6QeyQ1A5enFtd8XGchAufxt0XH+2WbgDbiBooZB9KKcxXYgGM
         nWZMRERb2hEYXxG/68R8DT74ScM2JnjBlsEV4H5Auwsf2+LhCNy4Q1rDCEMvz6/qOeMn
         rN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479513; x=1783084313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=Vqz9L3hfG0d0UYOVHRhAvu5sJIcwfxqJsLLEECLt7BTtmg8SSVSfKa4MYdtAuFDoWP
         3qIf3PEkATXRFPkXTe8L2FNjd7bpjOTkslqOh/5YgaVFz8HrZ02Q0dpZghq9RU3esFIr
         N9RU/zzDn5/kht7HM26jl4Jx4SKwTSGGh1/6naGBGNyJ6S7MY8Zg8v6O1n3/MQj1uRYX
         /DJyvbGqNWf1SZnp0gY7jVEx9wEUch1tuFLo8lgTULo+fhP82UQPAOQWzXzY/3KDJuY5
         0H6iLuyFah2NkQjYydOzPVUC2HMq+1n5HPYYEv+WO/y7bEUu6GIT/OIUfpTll/7C4dHr
         Fxhw==
X-Forwarded-Encrypted: i=1; AHgh+RoF8EujLD+e0Q/VGtCO3vgmadx9vu1cIEGKV01zFi3yWWKkFFo2ONO4TVcroglH540dNgc4AoeaD+A3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3yOBGKIIjvnPvOeyckDuxRmBFou4dKRQgzUg7wR/r2Q0vICW+
	y1lanfPsXnR/RQ1pL/ZLeYBXoSo9dNDVUweJOv2H6/bk2riaKU38AWPU9a9GFPRrbp34mpprkju
	ZYP9c0zFRWvicBuu4fbdv1iMnvHExDfYCMmCY3uwQcvC2npFJ5fXpUatkFHMdKDc59ShdayU0iX
	OnGj6k8woqb1ddriVUZsd9y7BbbZIeBie7z6JQ+A==
X-Gm-Gg: AfdE7cn9OQqArta8+iFPJkw0fhkAl/kEigBz479CsShPhY5P4pV2qNcHWueEK7tKDXs
	MlKIwSJLca2pbB/smzsZC8BCZ4YlO3eFravx9GuSxQhagSpy5jYVASBmuzdlsY7y0SKyK+drIXP
	sk35HcD/sesMipTS0hJ5t5zYrrCZcbw0DPj84lgDu1287VrEO4odU8tvPzOQQDztGj
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id 00721157ae682-80bef0a8585mr15809817b3.31.1782479513449;
        Fri, 26 Jun 2026 06:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id
 00721157ae682-80bef0a8585mr15808937b3.31.1782479512984; Fri, 26 Jun 2026
 06:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-4-cca1a7b3bdef@redhat.com> <20260626-manipulative-rainbow-rhino-d73b65@houat>
In-Reply-To: <20260626-manipulative-rainbow-rhino-d73b65@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 15:11:41 +0200
X-Gm-Features: AVVi8CcW-L7vrM5Bm_e3_mA7DiL0CVsM1LDa8FwSzsOcNktoquvN-pr6tbwgp5U
Message-ID: <CADSE00+1m1ASzJzefO2bLuMYAJa3kSmW4py7Qng70VnZSUv0sg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge: release panel reference on all lookup
 exit paths
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,intel.com,kernel.org,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-15231-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFFE66CD4F9

On Fri, Jun 26, 2026 at 2:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:26PM +0200, Albert Esteve wrote:
> > of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> > counted reference that the caller must release with drm_panel_put().
> >
> > For bridge drivers that immediately wrap the panel in a panel_bridge
> > (which acquires its own reference), release the lookup reference right
> > after the bridge creation call.
> >
> > For analogix-anx6345, which stores the panel for direct use, release
> > the reference in the i2c remove path.
> >
> > For platform drivers using analogix_dp_core with a component lifecycle
> > (exynos_dp, rockchip analogix_dp), release the lookup reference in the
> > platform remove() function. The panel_bridge created during bind() hold=
s
> > a separate reference that devm cleanup releases after remove() returns.
> >
> > Also fix devm_drm_of_get_bridge() and drmm_of_get_bridge() in
> > bridge/panel.c itself: both call drm_of_find_panel_or_bridge() and
> > then pass the panel to devm/drmm_panel_bridge_add(), which acquires
> > its own reference via drm_panel_bridge_add_typed(). The lookup
> > reference was never released; add drm_panel_put() after each bridge
> > creation call.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> I think this one should be either split into one patch per driver, or
> merged with the of_drm_find_panel patch. I'm still not quite sure which
> would be the best, maybe the latter?

I have spent some time myself thinking about how to approach this.
Initially I thought about doing one patch per driver as you suggested,
but since there are many similar fixes that are mostly one-liners, In
the end I decided that grouping them would make the review easier and
result in a less inflated series. Maybe merging with of_drm_find_panel
patch makes sense to avoid having one patch introducing a transient
reference leak (even if it is fixed right after and is bisectable).
But that will also create a giant patch (harder to review?). Another
option could be to merge patches 4 and 5, which basically update all
callers, and keep the API update separated. Either way, I am happy
with whatever you decide is better. I will take note of this for v2.

>
> Maxime


