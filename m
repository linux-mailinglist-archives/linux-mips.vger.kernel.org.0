Return-Path: <linux-mips+bounces-15461-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QmT2M6ERSGrTlgAAu9opvQ
	(envelope-from <linux-mips+bounces-15461-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:46:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39253705423
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jKWf2GSY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iJmS+ghg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15461-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15461-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DE163023366
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 19:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD2D33291F;
	Fri,  3 Jul 2026 19:42:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B4F433E63
	for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2026 19:42:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107761; cv=none; b=dKE4bJo+1jLLAPFrdSV+DDwiuqOjQ4a7It/bECaHXbdZiiHiUxn5BDMvU6MU3gEsdDNB6Qz3aJ3faCscsemhQwZU1MY+M0j3DKDc+ZpTit7dgz6g6RoV/bGaajzlIB5zhkHsOa0OTqaOc8OksG5NYPhQqdkdE1V4QjaqC5oU1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107761; c=relaxed/simple;
	bh=HRbjhWrQ/b1BPdLECUGZ1vj1pvlPVpDo/p/rUJhwlC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+vzdUg7XUOKTt4tP+La/Ar6LYRNqMBnwYAHE+dM7EJJo3NDwm/1FDHqB7seKu3h5TrjkQk78PHt5LQL74EQBO4+8oHEB7OhAJobvey0gBkDE1ICLoRRrtanb1CxW/fPzEU+phFWS62CKOCxn50l1zQaFRZ8IGRKnwrQKwcN/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKWf2GSY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJmS+ghg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiG3C546498
	for <linux-mips@vger.kernel.org>; Fri, 3 Jul 2026 19:42:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BM7jtgPz5pu
	XtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=; b=jKWf2GSYBWt0WCeSTarF/ZyxiwK
	ySviO6bqYuR7hXocJXWdOzctBTkhr9x7EBJtne4ZOFmY2TQnOa/Gh839O06jG1Z7
	dooiFHxttTiabG9BCsQjg42O4/YG3Njl/KqjnIDTpKtWlrEa7Oz6uExs+CjZECUi
	xjJD6IMEajr2OkDLA3WKBxxOfzl0dQqBxjqVSPjOoU9RaH/p2EFT7u56Y4OH0mzN
	ZRdyYM3r4dJMbR3VmiLwRyPjjK7ZwaTZ5+BWp14AX1vqD6b0N/1+keNALbhSW6GJ
	73bXzhYTiDhE7iSf9SrCIj4lzRwnt5YUmTfWTl/y5PQ/BXjK1zfMPAEFh9Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02vhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 19:42:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fc0aaa94cso1428843a91.1
        for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 12:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107758; x=1783712558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM7jtgPz5puXtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=;
        b=iJmS+ghgMizG9kVSRHSMzad/PhRTEhvVr2TTiLal7O2hPWDev/jBOZV/s8usK1IGj5
         jFMCxMrLk0RyQZMwj6tNiGpDa1HPIjEwBMPj0G3UmDBZwolDNPiygW3VBcmfPhHNG++N
         LtWummM/aq2Mx39wwyV65KoG1wtICvt/r59QymsiD5mcVm56sFsOfwbVKRIiPxt0lbpD
         6kLsy46D/IQkSw048I8Q3L/STlTAvaLTSDw8wICi04/mjNShlNb12uhhQUFsR39+qTtx
         /+7NGgyGb9uTHA70PArfC+HYS1gwSNiq87ieuysCHWfut4yn7YaayImnGT5XjwJZWaWs
         hRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107758; x=1783712558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BM7jtgPz5puXtMgobfAPTx0DKFPGBIZQqDVHqsjFOZI=;
        b=cJVXBCarVdXeNQj46+zysvoFBY6tlILm1Zm9LLFndlQtML+BHF3M53CkP/m/vnSMfX
         MowYiDaCT2tbJCcf2RPdslLqwzdD6mZJmaXhAXVrm+JwmmxBdTyTEFhqCdXfDu9kNF3t
         l406ivdS79Cqp3mz05cQ9yRLXRDUtNUmefVVQj8/Qmg/XYilQw5XnsLiuoPiH1M/5LN6
         Pqv0zly+o5R279YjBUEEHpgJvp4cZZuOr84aoOWyJRR7KTNhmrauOvRuvQb0SDnoUYMz
         1oY34kDlhUuhoS2L1wtfDNVY4GI4U+fakZCq1LZ5/X0g/55WUA5TQ4sieoqpdTpFxtBh
         nTqA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo3cS1YEdY8i/tWhkxoVrvP/TC/i7ek7A0hUqDPzW+CM5ImwFrWsnItxJXajlIRDQFtb5syBwkHaxq@vger.kernel.org
X-Gm-Message-State: AOJu0YxH7TPpSIxdgt3n55lYB7IT1yF+BzDDeJuacEFGbJfhXUU4kO2o
	HzoXM01Tmd/3WMuSbXgP0Ow4MfLKjnvy7XErp+9TSCHsPHh9bQN4xHH0/5nMQ7FWV01wfeDp2rZ
	aG+owkgrhiqrhg+EEK3XzvDn64yPoYxyVJ4LGmoKhcpN3UNrShRoo8wu901Jt8WlR
X-Gm-Gg: AfdE7clU8Ynf1wU5cUPrMk4YWZaJl+mlIar0Wj5hc9g+20TQOpJ/Bx7/QU+UDciY2vw
	GiWpjZmq4+/OQ7cst1fHTPRqlvMuaYrET2Ov3IbnpU2K1dp+VjnNwktvdLFXtdwruofpaDCcVr/
	kkJyxOSnToBSna9SP2jwxtPcI0m1iV6GHw0VB6Hn9iRfVbC0ATHWuyqAUlUNkH7XlK3H+fDXXpI
	Sv2RIdjjERfVKfWq8gYKr85gwLanYLNP2O0ezxq/CMlFLSImDdkwHSUuzOxSvakAyilRWLpMAv9
	s0McKOBQtw+k70pbvmXsP9fxsqz8ID97OdwH8nlyJWRdp6FJ0PfH8PD1vbWYwtaiAEsSR8bio1z
	wBtbzDVQKankXfhU4bc4LBZcpWu8qp6QxydtRZQ==
X-Received: by 2002:a17:90a:e708:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-382807ae330mr703132a91.7.1783107758432;
        Fri, 03 Jul 2026 12:42:38 -0700 (PDT)
X-Received: by 2002:a17:90a:e708:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-382807ae330mr703088a91.7.1783107757826;
        Fri, 03 Jul 2026 12:42:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:42:37 -0700 (PDT)
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
Subject: [PATCH 08/42] drm: logicvc: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:21 +0530
Message-ID: <20260703193855.110619-9-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: K9utOTFmcs7Zjm16dgReY7yaa-RYtmWQ
X-Proofpoint-ORIG-GUID: K9utOTFmcs7Zjm16dgReY7yaa-RYtmWQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX+M6bq+vjF5nE
 UyhQRbiKXfAFj0KSKZfR578Ii8QinJp+jyglUEd4ctMcursuGcTMfou7SIBN0gtvPtMLu3T0eUz
 FQQJHtaDvmZfhj3cq8IeJobO7bTgrHQ=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4810af cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ReI0EElcLHst8dYcsfAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX9pH4HGuw3xhC
 Iz32H+7DVg/xI0suVI00UTTDAuDyMdtd/Ei+toUQG43brbHXyHsQgnX82QYSXHRDC7UIdXUiKV+
 JrGHz6riVmvkjTMFR9iE1iheZ/u4bzvsQKY2Ariau8qAVu0dHFdiyDZU0v/9mkAdcDr1d0LdumE
 81E3nzEWBOoHb5AZzI2QIaGcRs1nn0Qb0OPyVNqV4DDghaOAUzAA8E9TRNmHSHKLkq4yf/EjNnT
 dFFP8+Y3lrkEDvQmn3LmzXn2ORrc/TPV+0Gx7lKj+6CPvV5C6L4CzeLSDk8MVnQnMAA1oc7Wzzt
 ae6o0xrBJLmuXWfJfGMSi+KJlB0RmlDuB3xwCcczQSvuxwvHhUTiT0lKyxMD7qLgyGhTnTJB6ty
 isnLdc/w2kajIO2HANFtctrEZHNIyitHA/UImgmTNrkEKEEGrLOIBlUvx5CIicdJe0A+f2KIFIU
 hylRB/wXhQgsdTISKww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bstai.top,gmail.com,pengutronix.de,linux.intel.com,linux.dev,amd.com,cixtech.com,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,collabora.com,alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15461-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:srin
 i@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.or
 g,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 39253705423

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Replace all error paths that jumped to error_reserved_mem: with
error_early: since the manual cleanup label is no longer needed, and
remove the explicit of_reserved_mem_device_release() call in the remove
function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..d6dbe52ff0a9 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -306,7 +306,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "Failed to init memory region\n");
 		goto error_early;
@@ -327,14 +327,14 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		ret = of_address_to_resource(of_node, 0, &res);
 		if (ret) {
 			dev_err(dev, "Failed to get resource from address\n");
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		base = devm_ioremap_resource(dev, &res);
 		if (IS_ERR(base)) {
 			dev_err(dev, "Failed to map I/O base\n");
 			ret = PTR_ERR(base);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		logicvc_drm_regmap_config.max_register = resource_size(&res) -
@@ -345,21 +345,21 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "Failed to create regmap for I/O\n");
 			ret = PTR_ERR(regmap);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc = devm_drm_dev_alloc(dev, &logicvc_drm_driver,
 				     struct logicvc_drm, drm_dev);
 	if (IS_ERR(logicvc)) {
 		ret = PTR_ERR(logicvc);
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	platform_set_drvdata(pdev, logicvc);
@@ -371,7 +371,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	caps = logicvc_drm_caps_match(logicvc);
 	if (!caps) {
 		ret = -EINVAL;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc->caps = caps;
@@ -382,7 +382,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	ret = logicvc_clocks_prepare(logicvc);
 	if (ret) {
 		drm_err(drm_dev, "Failed to prepare clocks\n");
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
@@ -450,9 +450,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 error_clocks:
 	logicvc_clocks_unprepare(logicvc);
 
-error_reserved_mem:
-	of_reserved_mem_device_release(dev);
-
 error_early:
 	return ret;
 }
@@ -469,8 +466,6 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static void logicvc_drm_shutdown(struct platform_device *pdev)
-- 
2.53.0


