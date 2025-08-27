Return-Path: <linux-mips+bounces-10695-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14047B38E76
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 00:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36D93AE412
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 22:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558A92D9ECD;
	Wed, 27 Aug 2025 22:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksBOx0Fa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C02ECE91
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 22:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333716; cv=none; b=ES/9Rthsrttt8ZZ4gWUhwMSOqdKbPCqugKNeXfkYisl+ty/WaLonJTRW7+RRrSurshn5jVxbU6H3d44jilcOUGpvdNA488hrh4JKvj+cJI32Vv+Wf+3bxE8tZlARG5JH1LSfUTos0CfRgUXjzZhGh8uyb5W9gK+NdNpNXMEXgfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333716; c=relaxed/simple;
	bh=Enfpdt0lrNqevhutRfiz1sNVpTDatf+D/XBiia59tWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oA3DWHVY8Rpe2RUM9il6QJFTPXfx4ByO+qAg/o7cw5pgRQ4E/IpN/QtnbDZ7S1ATw7VwOxFzEZq0wPYPJq136cYNEePhWYkdSqLpVEV75+FvjjBQ9MJuZI0UWbQjvv68uKYXuoBg+2lzRa7FkLR4hDBVRrKxxNmzmBxROcyL8GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksBOx0Fa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RGJ75D014879
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 22:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcrLZoaMuieBwoDNhdy1YKKE
	PmtaqIZQcasiCx3hw8M=; b=ksBOx0FaLwkdk0t38aj7T0xGmpchr04zFiJSkZgZ
	Ba64KDw1scqklvR5h9sPhUMIU5Lm2ULbS+dB0sk27byD5zxz1LdT8vRZaUw1mIEL
	xh0i2qoc9SiowpsxDWLGj59eU9BUKYNTd+Lt+SZ/9us8XpkdePkPbROX9L0c1Nis
	xuzdRsy97JbgBGv09uGR8V2gtRSajQOd+AstxEjUOr+Q/Lp78EBk7+sbA+6J7rxg
	ssnXa5MEdmfrn2nI2mdVDxwzLzHHqhlfufrgyew42L4gAJrqTf9p2WsvRy8xNAKa
	HZ7JFU2mS/Vczvql0G9Re9yqBmoUE7SgnNjvTTRqpyeYxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we5umh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 22:28:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109c7ad98so12391421cf.3
        for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 15:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756333713; x=1756938513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcrLZoaMuieBwoDNhdy1YKKEPmtaqIZQcasiCx3hw8M=;
        b=JnZAnN7L4SczD5KaySkGbmazQsehDOpEOaQXE8/LSuRjcsS39d5tBQGmxVmILMrwQl
         JN1n81/8VYKrHffdM9GpCvgXynZym9GH4wkFtJEvG92Pp1yVue4d2EBl4F+ZeW8k6FEW
         wIsQz1tPfb3qWTjQOXLiIOA+yDurOSenlqUavOekmsz1fm6y3PzLYy8Y8DQYh8oVCzGf
         b6P3j2nMKXf0BN5A29GCvh6fe+SAcN5MVylF31NX2tONsQgj3G16xEIv+AUQs5hNWqx6
         rS4zB1ayFR+0PgGNuMNR9xoSvJK71jvU9ZCwNGLwG65A8L+ajFfNDKS3V8jRePrvZmuz
         s3QA==
X-Forwarded-Encrypted: i=1; AJvYcCVcDXMyYWQmx6+Rzp6oduKYTy/VJOVyUHA2EbtbMH3KlhuhNQSE3su29WBt+RN1mVFAN56qa2c9t61C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UsrELwtbHuKH+tIgmm0JUhsCzV8pZBtQ7MrksjBIp5/X/six
	9GFlINvfEOdFpXh/aCD2LXo0i3zNqfEJtIt0CylB1+Gv0ZUqcmuDkcGwgqL2Xmjzd1VFTV1g+Wc
	1G1pT072qh+MZHI9rcxwje1LYspF4XlZi1yAK64BT901WGjwhHDET5iYppyJN3ydB
X-Gm-Gg: ASbGncsc+f3EUzo7fodhrAiwWlwsj5OtzFbyMC8mLkh9RFZ+iDkRVqMKo23mJD4P/53
	yLkuNcbYW864acORKZgOs/Q8xyjevUxpt1irNNq2XfEamZVTmSw9K1+AoGAmFmboXuATLurR5xU
	snr9APJ/rZqJsIS7MplJ42MtZHU1/WQK0cCuGRaKesZRl/FQ/Wd/1Wdi9sd2KcxhUoxQkz/sfwp
	8LOO6eSK3z8PKyp+6jfAT6uTwMUxl76fiKxEo6e8UpLaO3rZrDp0F/nK464rqEW+ljuLLd/pYBM
	x5xPspU73jDBkRg7D/mI8yeEHuA6wam4nqWbckNM3CDEMUvQDE+J14Mb0mhQGdz3Ljq+hS3oz9R
	FHAHzGVkmvFmLo0ZAgLO49xGfr0N6oGy3uYD3HBy6Y9kkquEaAneb
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105542031cf.32.1756333712559;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5nmdIbVBTqmW1BSWH9OY/lezBX2PorYOAsLp+HwXKOdiRgVyGEp2e8fxZ/9eVS1zmC9A+GQ==
X-Received: by 2002:a05:622a:cd:b0:4b2:dfc5:fbee with SMTP id d75a77b69052e-4b2dfc5fdb1mr105541351cf.32.1756333712052;
        Wed, 27 Aug 2025 15:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c13debsm2882288e87.57.2025.08.27.15.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 15:28:31 -0700 (PDT)
Date: Thu, 28 Aug 2025 01:28:27 +0300
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
Subject: Re: [PATCH 04/39] drm/atomic: Remove unused
 drm_atomic_get_existing_connector_state()
Message-ID: <a3hwkno4nemddbmaz6dayd24rmqcr3zxujrvsspnulrivntxjz@o3tm6o4mc6nt>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-4-f08ccd9f85c9@kernel.org>
X-Proofpoint-GUID: fJE9ja9AiyMHjKoCP1fSqOa5OGfpVJcQ
X-Proofpoint-ORIG-GUID: fJE9ja9AiyMHjKoCP1fSqOa5OGfpVJcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9NuUX0MAG7pi
 7ISx5RQc4NfevdD8pUCPkJD6X03PZxCEr/vHPbf7zYm3Dwlf23RZlDlT/u1MsOt0jdbhdR4c9XC
 9VwrwgOYpY1iGcEszONFYsDAaw1w9jvskLdXt6BG1+Yh4W3FBkGDtCqCmDo0ua9rMKbcBdngp3o
 xRMeACw0DIRURtHW+/Mnp1+Z9SUQoQtdsP+pR3SvtxoMluHNraJnIfZBT0ltZcCSz+ME6wFu5b5
 KAbo50mFM0mXWn/6n65Xzba0GMi4bR96UZyeSpdv37qnLofKAxlPUcjK2yrl2r0NGNhr4rOwRb8
 QzIpOBp31hXFzzWx7cccT6HmHyYbmtCD3Lf7vQCfO5+4JClhvCDpvG+7xqFcOU1E2r2squgOB1F
 EEoYtXhR
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68af8691 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ROUmOPvenB7E6LXmrzQA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 03:43:09PM +0200, Maxime Ripard wrote:
> The drm_atomic_get_existing_connector_state() function is deprecated and
> isn't used anymore, so let's remove it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

