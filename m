Return-Path: <linux-mips+bounces-11633-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D90BC65BC
	for <lists+linux-mips@lfdr.de>; Wed, 08 Oct 2025 20:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E8F41881AAD
	for <lists+linux-mips@lfdr.de>; Wed,  8 Oct 2025 18:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440232BEFE6;
	Wed,  8 Oct 2025 18:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm35HvVw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB1C19755B
	for <linux-mips@vger.kernel.org>; Wed,  8 Oct 2025 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949461; cv=none; b=qy4kKfVmClZZ66mW/DHxFCwwPyhQAdjVp9rB2NAvEylpXpKk3RdDCUwb4VVOQtPC1KINkMoCaFl7IR8Lctf1U3ryjjwuL7QYPyyvYzb0ZNmDp2NxnKE1BhHwjnABc+5badT01YflWZQ7ydI61x5HHzeiYK79e6+ht9/1KaNE7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949461; c=relaxed/simple;
	bh=Uwtcwj4f82dR/Xb31dkLDXy2J2UiBKZZOdOAbbwHbIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9Kk/gxgvmDYjizl8obB0GkiEOS50ad2jy6RfbIBNLxuq4dXFsg1cegAwvIC48b1rE0kBAvVuueqmraw+JoJWrm2W0ufZYRoxYUuGYlTeZ/YjAk6Nem/WLGapPp9iMfMBOBHMH+KsiOGQxBUOho9/ypKo9Vu1pXjcE+O7rOu7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pm35HvVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HTx012814
	for <linux-mips@vger.kernel.org>; Wed, 8 Oct 2025 18:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=; b=pm35HvVwKYtocXkC
	KgBjxl7KJX/a84PN3g7r4RKb4r25FiSljFfF0+W+PA8oUpzKh7i19OAwbJAeQwCr
	uK4H5eZoRKU5++bwJFddNVJd+ffIZEZTvGMqtUvedUt4Vtp77DThSZmodrglKARL
	FQetzyS0hXMvZCfYIRLI51jKH9BSPfL7W9Yfsl94SY1qy7SGCRajgJyFEJcZboHR
	993RwCxyAeMkuFZlhjJtL5Bu7ESP8uLnmbefsmT9ZbgN3gS6r3Br47WlCrPpyOMn
	yDv33Tiwo6b3L3xKLwUMFrw2332qL/ViUXzWVX0/lNZsOsx3odEH5pHneOK2jail
	wvpZ8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j09hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 08 Oct 2025 18:50:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de53348322so7496461cf.0
        for <linux-mips@vger.kernel.org>; Wed, 08 Oct 2025 11:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949457; x=1760554257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=;
        b=Xc+Is978rUOmuDAVOZ+hXywb3fJVVuERNdlK6hHMl4gTw995mS9fR5hBfWEOr9kyRB
         LxaN02c52BEQdkwxr/KHlLudk3NCn+jhqh3bjfQJ1oiUVdk+rkJ2F/30a80VUxr6Y1DL
         lGMMgl1VxPXvBFlNNjKrrYXMCugXxwbbawu0mRmwfRED/UScJooOJeFuQs8KxFLHv+Eo
         jBGkdjjUPaAppGKTYyd2N3P3Txir4CsuOHpbIxKhRtFZB2CKw9vzdvrhCy++f5XiVKFU
         o2dkb0sE3lBaVnflQOqIGGaKkdqH6h1JosjIjfNt837Rbop7yAHQIV+ufKgmr0otNxBc
         Kcmw==
X-Forwarded-Encrypted: i=1; AJvYcCVikRrCWRmGBtAD086FborBoHjAsKzqRuxncMNYIVbxRdSWfKad38EU9ae+FqHW8LrJnp+8LfMCq0nO@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYK3XTMpkCzStlbRA0yTAqajTU5eo34HD5D15GkTIzRjlSMLY
	3JhSgagPKKJz6aS23uXJ/CpqF5jFGOlCgGAIXM23hkN9lSs/OH7YNzm3WpDksSYGPCtA5hgUT6o
	3OQdkvM4BbWfo7Rg1gTEgXFUFWEQNFFCMUPO2EcG6sml7gbc8EupLEdaSAs5VpBW8
X-Gm-Gg: ASbGncvgS+M1Tg+hU2+DpZxG8PDwUy3NN3vPSuAQFzihH+QongY736rAp8ifBXCSuCw
	/qRf7KMGK8QJtCoYQ0+hPH5nxcuntip2In7V0gX2Q8Yf8QfkWNmk8HJIJ40e3bpS2lhDmwK+17r
	GTdNZX3aECk325c3sgMnXgPR5YbKqAQTdYMq8gouF6yUhCOfOu5j1xvF8DS1gSTozhc/KuUMt1D
	dx/+yxS8IVc0c6h8Y88PqfVuV96ak7YC1l1xqiCTKLuYJvrW0OzHErMTDzunVwzzKQc4rsIENjN
	BBYazErNWgM7zGM9EDvG4BCGY5+vOMdrkLtAyJb8eq0ohI3FcogbL1Q3TyO66H5TkPIMpE1ce1h
	xjBFsZby0crrIyypzCM+ZsdUmiZ1/PCcalcrcWUN8XjpLdUvpC32XQGpw5g==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id d75a77b69052e-4e6ead76f15mr74281651cf.38.1759949457192;
        Wed, 08 Oct 2025 11:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUO4IzyC2eM+Rm083vlD0OKO2yWrQqJ+L80WsUVjuOU8S6+ZWJh0vpPqNVGqSnwQ0XcRPA2Q==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id d75a77b69052e-4e6ead76f15mr74280941cf.38.1759949456598;
        Wed, 08 Oct 2025 11:50:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39d509bsm22551021fa.12.2025.10.08.11.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:50:55 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:50:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 15/16] drm/atomic: Remove state argument to
 drm_atomic_private_obj_init
Message-ID: <wy7atek2mqkfg2nkawobibq7abt3w6g5wiu4d25nkctkxwkce4@mffhmrlfrqdy>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
X-Proofpoint-GUID: LoBpcXSDWLspRXQq2x2mhjVUvUcreb8S
X-Proofpoint-ORIG-GUID: LoBpcXSDWLspRXQq2x2mhjVUvUcreb8S
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e6b292 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=ER_8r6IbAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=Ikd4Dj_1AAAA:8 a=RF00TdSWAAAA:8 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=4fa6rhvZphqvzmXW0hwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=9LHmKk7ezEChjTCyhBa9:22 a=D0XLA9XvdZm18NrgonBM:22
 a=_nx8FpPT0le-2JWwMI5O:22 a=Z31ocT7rh6aUJxSkT1EX:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2FpvxDDKe9FO
 YvnpeEtBsZbz2VmE0Us6UpgDvlu1RBOHvaZgtR4uvKfF0IXvyBzou/kTvGWpLy6Fx5E9u64d+BO
 Sia4K9mQ9QaNn/7VwscZ14uxG/QXC8e6qEMgzLE3bmit8URH/aB1O3/v1NLP2Q7DF5GbGn1FD56
 gsmECQ3hLxWTJPPhqpoc3NGU+7BE6pFg/WI1R5/tOCrPy6NOiApgp2HLE3gnuubfKP7e8U5W8ln
 mK5atRKmFAeZSLEQ3NXo4UpOzVFl/hURZNQtE14OM2w0wZ0aLO1Pi6MzWRj2YF3gbU38d4z8c2C
 vifRYY5Hbh8d8LJQ/eW+idKuA6Y9kHVibB73XRhSOfierbYOYaXefNv85k70UMUaJTncO4DDRdK
 OPpTfWtBLXeHodG49n0cFpNhULqH9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 02:04:13PM +0200, Maxime Ripard wrote:
> Now that all drm_private_objs users have been converted to use reset
> instead of the old ad-hoc initialization, we can remove the state
> parameter from drm_private_obj_init and the fallback code.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> To: Liviu Dudau <liviu.dudau@arm.com>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Paul Cercueil <paul@crapouillou.net>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       |  1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 16 ++++++++--------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c           |  1 -
>  drivers/gpu/drm/display/drm_dp_tunnel.c                 |  2 +-
>  drivers/gpu/drm/drm_atomic.c                            | 17 ++---------------
>  drivers/gpu/drm/drm_bridge.c                            |  1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c               |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c                   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                 |  1 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                |  1 -
>  drivers/gpu/drm/omapdrm/omap_drv.c                      |  2 +-
>  drivers/gpu/drm/tegra/hub.c                             |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                           |  4 +---
>  include/drm/drm_atomic.h                                |  1 -
>  14 files changed, 16 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

