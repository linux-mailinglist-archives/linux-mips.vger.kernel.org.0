Return-Path: <linux-mips+bounces-10641-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 299E6B3776B
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 03:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC9851B26516
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 01:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4A61DE8AF;
	Wed, 27 Aug 2025 01:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtohOwq/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C2DF49
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 01:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259451; cv=none; b=m2cKMo7aukIdWB2ME6irbKC1eA2jJiA7Rh/IUgfNp4F7oasSpHYC2sqHk0d6iQEM1AnvFEAVA/9UZcCcwdPfykAVrYnu2GTAZGF/5P+K9UmumLT1+w1gjo2UrSgqEyvmNDzOVlP1PNK139cmjDqcZ8uJI+zzsr3JszZY+GpY9LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259451; c=relaxed/simple;
	bh=HZCUzkkrDtoFfybmi/wQUgDLYhcZj2oCbu0jLkMK5WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVXx7aAQPayuSKZINWwi3ZhX9gl3ozjwEyiTWB5vaKT1qNmXOU0N3opW9FeyKCX7HP95uxKlmoAUyUkdBCXToeu0Iu8+XoShV2rT2Is/4rr/vkzWhGK+g82w/YyaL/qER34Iv5LjQ9hSKP0JYuM5tvEw2OoRxUPmaA55eIDS0i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtohOwq/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QK1hYb031245
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 01:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0laXQCaNkR8BdkTEIAIjvxkP
	U6e+xAcI3sMZOZG++40=; b=RtohOwq/mGWF5aMn8hEPDpMx/rZR9xAALF19Kgyn
	ABnotCfpABau8JwSOXOICFi9m0+JYeo5KRmxM7/PZXvfAVZ+xkORF/VXDwTNR3Ph
	HPx+mTISivbCf4otlZINmlEZaKzFvdI6E4ajQHq9yVGAUfZo4nLChDdFD8U1iaE4
	IS1qmtCDKjKe0bte0kvKERccexJ6lHl808lZOQbURByejcjFT3WTBN/nsM8JSd+g
	k1B3AWzsQK6lbv1D9bzTVgUEmdbFOgAkV//+43Xv1+qkGLvzB6NM7Z7dZU1NecZ0
	guNgLQYiFnm+R6mcteg49ubo9IpFgtLwxmbQpqJPkNbHbw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2u3ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 01:50:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2dab82f70so62268191cf.3
        for <linux-mips@vger.kernel.org>; Tue, 26 Aug 2025 18:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259448; x=1756864248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0laXQCaNkR8BdkTEIAIjvxkPU6e+xAcI3sMZOZG++40=;
        b=ijI5ySbkRKn0uRW2qP0Tc83FlVYaMTpZ9HR7qUok/kYdrJAAkLSNyDUThNZQEhieEr
         fRh/e5F6fHNiZRwnuZaemziPvS4q06mFSdn/QyIk0C6ZM2mYac0zvCXdwLIZrLpZDCf7
         MkKKqzGibzmBHQBzIxzxoFl3IHmDx19aJVBg4pIoaassZTdNx8UJ8Shc0Oo3YUM2GvI3
         BpgLa6d5zZXQiTwjEzXbSVCMM8rz9tpTHLzYnLoU1xFa4QrkJ14qAG/79NdU8SaO/RZO
         JTAjttsC3wphfUnZQQyllXJ0tNA1m1tUBwYoCCHAfKQIeP+EfCW692RnTGt+ExRdbYmG
         8bOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmkR92pUzz1DSlMoj+ymDB4Tp4Xs8AeRq13PiGvbAs6UmEkzeCrAOKy7OxW0xF+/HXLeMZK/QLOYNf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+evYWC/HMrbcySaEwPYv9SC0W6G7L8/6hqFGEqG2vizU11tNG
	L524U0cUFteAon3yBLh2n1+DQ1uLR19LrBIIJ8ixrt18+I0f9z5/bgueKdhgpR9svy5qgZjrVI1
	RHsTUtejEZ1afA8Y9noS8U3f6WVYODqttQEaxBkZgPp6uO7AYAOTJg8NuJpK1jrEB
X-Gm-Gg: ASbGnctsrx446mWHgtrBdhlInosCHMVgQXZ8puMsHgwUuk9yO5uLhgw3xWkwD/cmJEg
	74akM8HkQk7FFEZ/GyOWTNp407hnwnTpSBgk2Jl48H6DCRR18k69UKoxzTYqz76Fb+G6/cAMK1c
	HC9jIr+2VwocC8f27KrV9ITWSy55RI6e32/mBAJCU4WycfGoEusF2uKvzvUaC48yumSDnTTbz2L
	zXeyRvxn5ehkI3dhd0TR+sW0tS8v+6rI/rSKD11yr2NsWfzm3nFoPvQ76Gbi55dlapBgOVcicjJ
	ejc4XpsVx9BfjNy+EI1HZ916X47iyEmGnwt8rDkGW0gpT3P5CkCvexo6DjrMKjDEP+y+QeNXAa2
	zoNA1W5gJ9rz7776E5zAysSIFFzGfIR+/L1Bg0215NKLJ6dyy72Vt
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id d75a77b69052e-4b2aaacef55mr186157091cf.40.1756259448020;
        Tue, 26 Aug 2025 18:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxKJaOrtRDBj0yHJf7PhiEmF+htiaol/DYqvG4rG8Xn2tdgOPzsKsBrI5J0XgVP0gDX2TkA==
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id d75a77b69052e-4b2aaacef55mr186156351cf.40.1756259447377;
        Tue, 26 Aug 2025 18:50:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f4b46d050sm989200e87.150.2025.08.26.18.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:50:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:50:44 +0300
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
Subject: Re: [PATCH 26/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <dc2sfo6edj4w3qiwldoglaanbi2h7mmev7x4pklwbl7x6x6rah@kjyc52pv2xqy>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ae6479 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=viL_tbrIvFpnGUkEXy0A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXynofni7K6Xaz
 xz5izvgin6eg8LTsxlpKyXDgC9j8A6cf5191Vn9JlGCMeL+i/97IC+tGSSon0kKSgURUUzJ1iCY
 saQJ3BoSxkHRXRPSHzxyPaf8J+6S39L211CqLNzCe3Xw9ZyWsnZBI3+EPRwkIohCuMxqq4h6zht
 wepEzDqVkeOQxiqpbPKmH2BIQpjN2IbbpgR9Lm12XuuK2NPDkRPRqE5cnOwsmnMMRGBQkH5b5Tc
 Pm0jUsSPdn12+ekvnOv07l+GYD450mkUuOJ9G/sYmUxAG9OlDS+ur2imP4eEBvxNICC7HSaSXqk
 nooUHhQjepZNq2e3m1/YB6m2GErxE7ZhuPQdud0rDpPkttnZ0/NMqErpna2PvildnhvgzmYL2Gw
 hF0rXSF/
X-Proofpoint-GUID: AoeSyEj_A2aYN8osD6MWabia3KQENd05
X-Proofpoint-ORIG-GUID: AoeSyEj_A2aYN8osD6MWabia3KQENd05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 03:43:31PM +0200, Maxime Ripard wrote:
> The msm atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

To merge through drm-misc-next:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

