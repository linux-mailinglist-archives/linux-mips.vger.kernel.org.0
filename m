Return-Path: <linux-mips+bounces-15481-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aPjQLaISSGq/lwAAu9opvQ
	(envelope-from <linux-mips+bounces-15481-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:50:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E086705599
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:50:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TvyBZCsm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kWzfI4bY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15481-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15481-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90D053031FD8
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 19:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4792C343890;
	Fri,  3 Jul 2026 19:50:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE24329E5A
	for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2026 19:50:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108247; cv=none; b=QzpRwJuf52f/TUnnG4O9ESPboPondd8POxQ69jESEA3uu3bMZNmXKXObgta5xiOJeq2VjBon/twYYtHX7aMnvPRVm11VRvFUjcUfqtqN7ldVd7/iGdJR4nVVnFEvGFjWieIrqF+QBzSBH/ETXapvInkjcd4dQsu2+t2YeDszVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108247; c=relaxed/simple;
	bh=NWi6l4/8Jc3AuxfmSZP8tVGdvqvPdnyt+pTMQKXFWbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+X1Mp0552pxRxZz4kzDD8jbuU7VDA52EbiCt6fi3n0BgCQ2e5QEpGIScphPUSKH8Cm8k/ani0m7nfmmWmPrzSpfNoCrogo2S59arEK2/D/hpq5T3Q2x+livvdjMAkBWcBmF4lb2mFlwWLZ2jqf3K1i0MYwXoq4AaQQ+hLddivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvyBZCsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWzfI4bY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Hid03676687
	for <linux-mips@vger.kernel.org>; Fri, 3 Jul 2026 19:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=71ffIbujQRJ
	pACfwswiC++PljuSs1fWY5AHxmQ6jcq4=; b=TvyBZCsmUFb6XP0nyeMDmZUr0d6
	QfdM5q7XKtRLmhSCsR87R7n24zAgPbqwXHbQbpbBrAfJN/3BoE2r95vk71p3+CBB
	ObOCk69OylcINhIYVL4FrfDARu/c4LAUFcKEv/9v6uWS8ukaPAWQuL8QDl4PNDO6
	WjFZPBHuitcjlSddKO9eskwZfTMHVM8nPVQ4qxvV0m/4929WyXvRmCnqcdLKEtVF
	BRpK7IT2oKjC1GZwOGyeLt9zFZnQ6XcJ6WQmmdDcXj7k39CKJTR5ZgMjHxxCKGYB
	3+KiUYnJ/K88oHwqwdihUAZhPh+yEQ4A7N5sgC8Y0wHfiGLi9JI0wWQhoHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh9pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 19:50:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso771367a91.0
        for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108243; x=1783713043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71ffIbujQRJpACfwswiC++PljuSs1fWY5AHxmQ6jcq4=;
        b=kWzfI4bYaMUOU8SdFce04ASyBURZdUH/sOTHcfMtuPf0w+U1dR6Vxz3b6MRCKvvB5W
         PFwQZc6XzrPKLZGljAD/hT1iaxR4UnGnFPBWzlENIZVL81fCxatWlauH/R92xP4dBfN3
         Nv8OJw5fdP+uJghS6mgu8Gz/EpWb6j4qxDYH95q3BW/kJAZ+rClZV4YCiLzlgapw9DOI
         bEmSjORjq4zhY+foPc5cnfAStQnzvPZh0fZrcNJELD0moWBPqr2Mq/HLMYV92A+HNLy2
         yL1UxGgUmesmzTooNFEdh/UcflpyvlC3FXDXQw1ayqn0qJmvhsE32lfHhbzQDtPAZHj5
         AQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108243; x=1783713043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71ffIbujQRJpACfwswiC++PljuSs1fWY5AHxmQ6jcq4=;
        b=JDCPp8nIj3tFhPBtiE14z5c32oI+DIijRgMgDA8QDcOLyY0/52cYXEld5utYmrfAdr
         GJ6GzdSqt4xH17Y/PSBEzhk6CgxE9M3Aut4ZkUM5oyn7tvxfDz6W9YyduYrDSroIWhGI
         oDwi6L6N/5ahteiRQ+b2uXRPCrAC1IviyNQgBTjA06iZecQYW/DDqN2zgHQkKU1VwNda
         OdkA0S3Y/hICBVZVu6sQB0aKgA45JboNkP2V5hvAB5LNu+7/UpIOCbnjzfsWeUvI6vwX
         Iw3c8UVSc1ufx8JOb4BXFwmG0WYsFlwT/bvy5pj3kvpWRo9PONEeWIVc+VBD5qPHTJsD
         28ag==
X-Forwarded-Encrypted: i=1; AHgh+Rq42eNkS1DdQcjPemvBeyt10I4FVukNxAflmCuTWA8ytYvnsQnxiJXWFgUUiQGl4yD3417RfvX3Co86@vger.kernel.org
X-Gm-Message-State: AOJu0YycIrDkuguAEepbvDMTqLXUBcEkDkhToDXzC5daQvO3PceDrIjX
	LzZcuiZQ3o3o/LauoR39rGaBe+SGHD1vp+i7a6JCmBxbh4OszNjt9vJ3kuCUlPLwK6gGccXO2lf
	77eOsEhzlD8KPueCxbPdkJ5QzR74XhE3/wli7Kazu217aH7IU/KPJ4DMfi9HUU0oS
X-Gm-Gg: AfdE7cm9SxbqbjcZxTGQtY1x7LBeMPd3wv/ChVZA2A9V14UFsv5vcs47nPLa62mTRTP
	C6PV3kwK2Uwi10sT5VjSOka1127oM4nixq7EPHd8xUaoypEHVHq3pVDKWpmDj3ko1lVmktOV0sX
	kFjqCDyS4dOTJ2KZlMSInCPBXFKycc7TGiEmZlIgnz0nskSrV3oZNyJICpJmbgbGHbBvT479k6X
	1oU2qwV04Zes/QnS619CE0xeB5B1drAjtXHxxbiJC2ALmBiN8o+u0agBaog+3cupWcWvvIFR3MW
	FRPHY3Bm+wvcDOCATbmg0uPcUw/K9+UDge8vNtuYt+yO9j9JMc8mLzwnNn2xQ1K8WfdeNDGD3Ay
	rKPlZbIxjla+X7B96vNBfFhxN4A7kb9LdCv8rAg==
X-Received: by 2002:a17:90b:1dd0:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38293b9946cmr729497a91.20.1783108243298;
        Fri, 03 Jul 2026 12:50:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd0:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38293b9946cmr729426a91.20.1783108242651;
        Fri, 03 Jul 2026 12:50:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 28/42] ASoC: mediatek: mt8189: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:41 +0530
Message-ID: <20260703193855.110619-29-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfXxDYFezS1HJF+
 GsNY0PYrOQ9EGCd1x1D2e+CJUHFH0r1UUyvqMM1Ps878xMFWGoPskgFz3mGKVMou5ezXnOTGPmI
 URaaLX4mVWpwtdx2D6ZK0pIpad6nSfFu+vLJjp/pC6ba/4jKuyD2xiG+/bXGN7kw513gFLT/5hb
 AwrCKSsL0Kx0h/85yLCTzWQUmwrIqwHi/XFqbezswLh8alsOPI5ppumcaQoL3szuRESS14hBbEh
 HKWTzLHnWJ0bqjOS2jICO4TsV6QHGdcVHodIsOl1b/RIvApmhxXV05q+p2ZZ4uxUv4TIcpC3hpB
 0cvH/mfjGTZ+1iZMrb9A166SVFN7c7DtTc91edOzS4mQ0yJiWzsVTcC9mRLv6RfPiYOMiqg2J19
 gjp9fV2TqcdEl/wmBO8SFvEE3Xtz69q3UTJoBAQOWeJzcb4Icr481oxs4QVAi87jTHlsX8oLLTB
 TmAwGP7e14zlsbcD7RQ==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a481294 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vpwXisbvDR7QvT6TCt8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 4jjXl4qyN_bK1MOIL89GAFO7PMwtBYR4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX6DD5f/drGXu5
 Wggc2KANgu0LPIzKAw1Jyjcx11EJyHCaTn2bABeiCzRLn4VmTfhBe4amgtAuVfaNZQzidhB/Ao5
 WZEiQkGbRN0GlZZ5Es/CyXrAK/JA//s=
X-Proofpoint-GUID: 4jjXl4qyN_bK1MOIL89GAFO7PMwtBYR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bstai.top,gmail.com,pengutronix.de,linux.intel.com,linux.dev,amd.com,cixtech.com,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,collabora.com,alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15481-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:srin
 i@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.or
 g,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_GT_50(0.00)[93];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E086705599

Replace the hand-rolled devm wrapper (mt8189_afe_release_reserved_mem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource manager
handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..04baf7d9132a 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2421,11 +2421,6 @@ static const struct reg_sequence mt8189_cg_patch[] = {
 	{ AUDIO_TOP_CON4, 0x361c },
 };
 
-static void mt8189_afe_release_reserved_mem(void *data)
-{
-	of_reserved_mem_device_release(data);
-}
-
 static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	int ret, i;
@@ -2439,16 +2434,9 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "failed to assign memory region: %d\n", ret);
-	} else {
-		ret = devm_add_action_or_reset(dev,
-					       mt8189_afe_release_reserved_mem,
-					       dev);
-		if (ret)
-			return ret;
-	}
 
 	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
-- 
2.53.0


