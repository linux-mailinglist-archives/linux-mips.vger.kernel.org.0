Return-Path: <linux-mips+bounces-14290-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB8WKkwV6mmVtgIAu9opvQ
	(envelope-from <linux-mips+bounces-14290-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 14:49:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7445249F
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 14:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF4B9300E3A5
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2026 12:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87513EE1C7;
	Thu, 23 Apr 2026 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4KeQ6v7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbtvhBlB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680B3EDACB
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948320; cv=none; b=pOPIWRQIchlY/4QhEw9VlDOkBI66XahDoWGKkpUsEviaz5qoJCf1CTPB/2+460ZrN0puS3dFIrGU8rUD2/ZzTq8j/pZTXdcqOD6OSaZ0kGnEpFNAuH1mhRUv7THz9RPjlA2LRS3+WvQjLfhzHmWPhpEujhBtOTQFDOWxKqk8U9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948320; c=relaxed/simple;
	bh=BRXUU6ztqr1lsb3f4orzbSrY/H/lvrHRoUjqXtc+p8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBh0TjTnAAz05stWfL/pSqx4vsrBWwwfJkkz+hSFUXxz65QVaxgeo2AfcVGG8/S+soWkkZJHPSKh69+F7AMWeTwNqyi9IeS+zzeOPrhau+ORVlqEk+5VUzvmPc+0xN7yrNzDonrXfF+KfiQtLbRmtk459z2TdWorDSKsh1Sbaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4KeQ6v7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbtvhBlB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8toWe179234
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 12:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dRf9flM23evHV+dCjZ11/3wA
	eY0NjlVmUaCb2MHl7Rc=; b=f4KeQ6v7smM+6vkjRyPOX9wXEYAtm4U3Svh9O4LA
	F+Ut9ODMjODxPNbgXzx8vYsDdabudfLWLc0zHnFv+oEKiz89nUOO2sQPOHS/+ZM3
	zQT6oMIVkCq5Wp4R3VTgnkYwX6xePFRT1MC0rIMz32csoNRax4q/mT6Yr/+zL+9C
	7OuvYNvRF7g+TmXzCH7lNo60EkNeNnDFHwVPY44uYX+2fEK1axSGxBuE/TKbVwb/
	fm24A7Rzdi8ERqvvgbrmTj90vCgNjVgjSS7A0elPrw1hQn9gGEzfn8Ty8iz4A8An
	nqvE0T5Xjg8h9sNYtk4IJbU+TIpW+LIBNd98FbPRTRXSOQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hgcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 12:45:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f1fe60919so11761450e0c.2
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2026 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948317; x=1777553117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=JbtvhBlBjNtksg6F/W2dD7QD6yVL48MbpjPzt3iBjceZbCdgGJuXoLcc09417f6ZkR
         IHnKY2+d4zHgiZTsu2gUvGOyg1oXjk9Ht2lr7gVabwlUgk8NY5ewW9pOxfhWZ+TUojUs
         DeYG2TzP0ULHzkPzf07OT6o9ajtpeAp4nfLsw8D0Hl5kEJCA26OqCvYKwxRA77rZor3m
         LjB8x8MwTiNdnnt3pDw2TtRi5XlcJXxLgZ7BLiGsbnLAMbdetpgQ+AdxUTDW4oh2GE/q
         wAccZNrYK6ohAaAC5kaiua/WU3loQM4R3Dzk7TLUpD4vNtcyHy5qs3KuzULOzh8umYdI
         Duvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948317; x=1777553117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=WmzmbUARdknK3m0Vnl9To8cpCuOwuSNIIAgE1t1iBAAzHijoof/3O4PSNKXFdxNfOk
         WnMJgCexKbQwphcJoHGRPxE2yd4h8fQzD4VOIy86jizb0ggFQb429Nbz6VHcGmW3QDwx
         rpJvJc++BO+fF/l3yVzxxRWnVZ4Hswu5bqcrdDgpJ5Ysfshh1pW63iP24LJQ+ZxaTr28
         CxSo9giU/Bf/u5INyo3Hlr71CudJa57Hv4+ro7CS7fe11WmnAlU6uwvRWegGH0T16cjq
         rNBi3WCQgm9mBo4keIqMOTYYhTlFcYYGmw8hNzr74A99516KdFc6JQA3cTxfC89xonh/
         0Ouw==
X-Forwarded-Encrypted: i=1; AFNElJ/o2BlP8llnepscNo4/j/D8oDKG4MKkXI5NjLMCHr4bV/lJQNMNi5KL3iJbhA+EGcjk801MWkkwhqA2@vger.kernel.org
X-Gm-Message-State: AOJu0YxsF0DDrzrdHGAcAtEIJgIXLIsqk9f+UZJa3CkQAmlFpbRFknen
	HH+aLpaa2tcNXhVi4V5QxGGjIBUpGVVo7D+b97WT8H0higofkW+vtRHqv0TS3Dj6E1YkKwvYPhe
	vj272Qqgv3K8c4XjB9NBhARMnpEupnjJalWnFO+Bs7dbqDV1vHto9NsbqZQ0M2BI/
X-Gm-Gg: AeBDiesr4V7fpnt9/T8zqm/5azWfj618LJ+MVYWiFBTAyt2C9gQzyl7/wekT8Xhurqh
	lzqI+gJbI71oRE4By3T7hW6np9EF6sLh3U+9lg2Ky+X/TqVPzc3/hqNoipP31zHBdj/q+IWiRRj
	s9/wC4iqwiSnhxnV3/dkMthd38okEY6DTOIW/zbuwSCTSDZQqCWonbG4dOB9bbPo9200hoKYOsJ
	bMMpuv5yp+4e8zvMdYc+YvMZfiXtVFTd12gDPJMJC6ogf10Ounc1mhFzN5NN3YcOs12gCpwvnD5
	9ALB/xH4SWgXcIyLgeNR//9Ps+zWbSXvoD6hk2FRjuLGMSKlv2p2jaZTw618PAfBj1xwpuXnuCU
	yrjtAb9+g5nD/KBt9P5Mt6Oxf2onOFkscmYJCPvKrrCMfFYUEq++0J8TOqI69nh3HVG9PA7PaMm
	19hVJ9VMeNICoUJHYY9j/4Df4LNQEzDeUtrHdEb599+xg6nw==
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838609137.13.1776948317072;
        Thu, 23 Apr 2026 05:45:17 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838537137.13.1776948316554;
        Thu, 23 Apr 2026 05:45:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb75b033sm41855241fa.39.2026.04.23.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:45:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:45:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
Message-ID: <wanzalswb3lez6kyklprqojcnidab5fkxgu57lfka45w2rt4ic@xdatq5o7yiub>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
X-Proofpoint-GUID: IpExGk0eHybZmMBnP7WIqwHSfbQcIVup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNyBTYWx0ZWRfX2sqHH/xeCXSh
 jXgFuZntDzlkApnfPvs7sDTHbAk/atZ/y7H5FY3KdYjIk2viLtPJ19iiQacJ5lcupnzhLArKS4u
 8Oqu31RQZZDblv66j9w4wnDdwV5tCdOCStcFiSqin1TulZtiZZGRgb8ACkrF5o6rgT7dh1ZRWJq
 bf2LyGL2/SMwc+uWMKtwEXPhNdUl5fm8s5Qtiuw+fHtlKzSNY3eQCAub446EeGKOuW6we1IW0Db
 AlZaoYCu/qAvdgjEzHfIMS9ezYYdyzLmXkvP8N4Lux1OBFEoBfLAh6Qa7R9rXS5kbKmoanJxvcD
 vF41OLKt4nrvqd9Hd8IVcYTV0/+w75G6mtwFVhPmx5162OfTOeas2fOm4Xlj7AI6xyb3xIpUanG
 yp6plKgBYrr7vMmBw4gOJb6dN0kWQ33QpoDzX+vj0P7+D78/4HShHK7kDf72VC6J1NZwXd0whyQ
 9GSH7zRlgCbDe/TOtzQ==
X-Proofpoint-ORIG-GUID: IpExGk0eHybZmMBnP7WIqwHSfbQcIVup
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea145e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SkVVgs_SJVxU13IceqMA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230127
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14290-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[78];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CF7445249F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 11:16:54AM +0200, Luca Ceresoli wrote:
> This series simplifies using the bridge-connector by removing the need to
> attach the newly created connector to the encoder.
> 
> == Series description
> 
> Currently all users of the bridge-connector must call
> drm_connector_attach_encoder() immediately after a successful
> drm_bridge_connector_init().
> 
> This is an unnecessary burden for users. Move the call to the end of
> drm_bridge_connector_init() so all callers can be simplified.
> 

I don't know which one is more correct in this situation, but let it be
R-B for the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Feel free to take the msm patches through drm-misc-next (A-b).

-- 
With best wishes
Dmitry

