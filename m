Return-Path: <linux-mips+bounces-10694-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A4B38E67
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 00:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 729D61884047
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 22:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63E02F3601;
	Wed, 27 Aug 2025 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3nSP7Gc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2927935C
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333647; cv=none; b=qCRf1n/bd+kwT48PoPT7ddm97AOgOtmzXRJQjq16qYsF3/8Q1HnsDwB13mY+0m1bNLKRJt2XwlzyB8vVcOkiGtpxrIfe0qYTWznJAWuK3SZkbzIHw8YkEIZukSOIMoE3drsznDpRKiL7YFODuGlU4OyhmgxoOecQKcfsuLQN2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333647; c=relaxed/simple;
	bh=39TfirOm0CvaijkhQPEcSMxZAXyiBUqSqGTWwYkVIEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGTazWLwIxTV3jSrXoeynY+urcxVK6GGHyAx+HD7oXtp2ipHW66jCqetuEKp3Ldko+qXjuskTxfbkwuQEGHkCon83Rcc+KxU6FtPynGJmfiPk79nZEbXG+vyZwBtSfHb/noTdEFxDtF4e5MYXWdmvdTA5ebp9m6nKzywcFOtS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3nSP7Gc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGXIbD027576
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 22:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=coI2WbZxINU7lzeYxnfoWTr2
	sAMMNa2PgUU+5RmzHvA=; b=N3nSP7Gc5TMt+IIn+qZ9uGuYzVafaBp1ac2JStUp
	K7rRbNrItFfkrE4pn3NSwfK3EJKU+G54f3mtlHj6FVmTiyk34UhAcW763bLSlDn6
	lE8nZPvaSrrbDD1z8NV8GMsE+EejI9+PUuTSSHiKEagz9bQN6sfvpB5/sPOKcU3B
	hixfH4Wr/PN3um5++i/3CX9NXOAeLZ9SXBULzqfYPbTbm7cJ0YT0lWqwC5hM7lYu
	l1sOWd/H9mcZguQFv0ANnTeWef+C8qNF9wb0KmfE+GAKuhHp+eDVTrDi1PKjuj3Y
	LyVxJjOjvzkfxEw8ajNN66YMc9YGBbuSSUh3zv0iLcgaEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16w492-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 22:27:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2f9e8dca6so8235191cf.3
        for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 15:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333644; x=1756938444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coI2WbZxINU7lzeYxnfoWTr2sAMMNa2PgUU+5RmzHvA=;
        b=IGYDtZXNbRnEK+asLnaKzFpBE11pCw2rlCm0lHEy3K+tYECNtvwKB1tYJVgOtlS7K/
         8W8V73J2pPJLw46TzcZXf3quVFVxlSoJB2FoA1kmhuYxFNU+vA+ItS30BmNJafIwiNxi
         X76pvTN5YlSyOtprPMSUynk6uzKv3VoOUB44IxHhl5XFZqbQW83jSqPd4cra5wmFITKY
         s6Fe8xIVXpEGvrJLUvkJSt/ePnh3wd0/YwRhTIsXjAt1pEhuaIYe3dugitxLxv6FxdkW
         f0ky17mUXhH6HAx1eGa1merPxkNpXpvTSn5c4ysTMHEdfSr/BgxrjGMXsXwAfjUOEpSf
         a0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpFIdX2wSeT9LJ6OBrf07WOcxtXwgshsGFVFT7YrCrSyV2MuBfMOc0lCcD4uby17uoDm3jJyCxsMAF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3eYOccLUcIRMbDmBBYHZzN6OEnljCSpzOydfNhfgC832gZVEA
	wsOIQwr1AwE4X3Lve1bEoQ2aMdn5vgnxtv5aJi5v4fZ8Xb6uUll5/Bc0bizEimARUJ2b385p+z/
	/amYJbxDJvXxq6to0DqAQ7RJgW34KtOv9JdY/gRcqoP+Yzgyz9UKYHybywO8cmgYR
X-Gm-Gg: ASbGncvvExhCDIqWZczJ+1zujV9cAAcAS0dxbJrMrlJiKj/eF5M5CMUm1UAWHrp3ZT+
	K2g5i5DpquPkH69rKNekQrPt7UFAAq+3bdEqqR792dt7DsVL2QQ6JVBCjcUF887Sl4fvJFPgJK5
	bul2UjspXdBWAXiUgBT3viBmMoiceAd8tdz59RO75WKbshZVqhiQKRfxhrNqMy4rJ8U2sunoBLe
	wH91LgHLMLmMoKsuOE0mVuVQ4dfou6dNsIePey7lTZSMNB1S6cZS/tlZkR43iVNfAmWJvUgacIk
	/UH14xkzDxo73QP9z9znH674jEoU/N3muycErcRW8CCHytosU5RRb9iAHvosrsgiAm6ZUVQV0yq
	yjBcVWm219SMB4nfewbgVZqH7OW5+qbR9Xcbdbsmdyp9P5zyPotZz
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102607041cf.22.1756333644063;
        Wed, 27 Aug 2025 15:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfGaJaSCsOEz0+c7R0GpHgMKXCo1cAu/f4pCkJRC2KgnMVotYeSkSM/eNVsc6qfr/OnO8xNw==
X-Received: by 2002:a05:622a:4c8e:b0:4b0:8f6e:d70a with SMTP id d75a77b69052e-4b2de073d4amr102606571cf.22.1756333643552;
        Wed, 27 Aug 2025 15:27:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336818f1d41sm14139131fa.51.2025.08.27.15.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:27:21 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:27:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        Dharma Balasubiramani <dharma.b@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Sui Jingfeng <suijingfeng@loongson.cn>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hansg@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/39] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
Message-ID: <hab6s4wyauqiej5ankh3gppdqkm2ymlevhrnklfe76kqjmmjqy@fptmzxpqv5av>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-3-f08ccd9f85c9@kernel.org>
X-Proofpoint-GUID: s-zf_Gb4ftHbnLWX7rNJiiX8XSPADmac
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX0B6aQ7f402QD
 dEurHUcLXZ4+dzvBpTtNIKTgzznz3Hc5Y5BOXJK9VSxqoeqyPJpXYVg3eaJ8djcuB30YgAPH/Ye
 WQSiwdJYTzbGEut/eXCELpZ7Ek1EvseY0k+trnbQJFY4vTU2sDt/oWSc1yke6vLpinnWZjOqbTH
 1TEHlMcPNOxq60aMmDpXXqzmUyM3Kj8cl9pP77GwDK9l27EHYJgKAevCVGWqW5vOGp8QlCCv+7e
 RKhlMnWO0ueR/V3GoWoJA8XSbtu7C4ZvTArLjkYGssU1N9SAx/Wnu0uuZRtl7YOACukMPubO13g
 AtCRaGTQvHKTduuqAg/RfY6QIVKW9hN2iYxkUZr1x7mmeYAS4cDV40vvFk1eRrU+3Sx9WxNW2LK
 ii7MbaFr
X-Proofpoint-ORIG-GUID: s-zf_Gb4ftHbnLWX7rNJiiX8XSPADmac
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68af864d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=wpE8WlYdICmIRzy2dDcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On Mon, Aug 25, 2025 at 03:43:08PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_connector_state() function calls the deprecated
> drm_atomic_get_existing_connector_state() helper to get find if a
> connector state had already been allocated and was part of the given
> drm_atomic_state.
> 
> At the point in time where drm_atomic_get_connector_state() can be
> called (ie, during atomic_check), the existing state is the new state
> and drm_atomic_get_existing_connector_state() can thus be replaced by
> drm_atomic_get_new_connector_state().
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 660b081ff5d8c39061cebfb5ea122ac1e51677ad..30b7ec05a1af07075e40cd2822ecfd67df004ba2 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1128,11 +1128,11 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  	struct drm_mode_config *config = &connector->dev->mode_config;
>  	struct drm_connector_state *connector_state;
>  
>  	WARN_ON(!state->acquire_ctx);
>  
> -	connector_state = drm_atomic_get_existing_connector_state(state, connector);
> +	connector_state = drm_atomic_get_new_connector_state(state, connector);

I'd say, drop patches 1-2 and use this function directly as is now.

>  	if (connector_state)
>  		return connector_state;
>  
>  	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
>  	if (ret)
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

