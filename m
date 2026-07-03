Return-Path: <linux-mips+bounces-15457-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5XvyLWQQSGrRlQAAu9opvQ
	(envelope-from <linux-mips+bounces-15457-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:41:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31682705298
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:41:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BWHUaZWv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OpI0Sutj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15457-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15457-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8715A3011C72
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 19:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02695332EA2;
	Fri,  3 Jul 2026 19:41:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011A331EBC
	for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2026 19:41:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107665; cv=none; b=Cwnv/1PVMBa/3ErysTKVQco6wkQQyTySvWCB8v45SHaLYTZoKtrMRntQbeuBCr71PFMfHI+21XxBvX1J8f6ynONNQ/7xBTcwgCPKeqvf2ASzA/gOSWy1ZJViJ1aelNWYNzO+KgmiklRCpWBVoRDK12TfF7WxToN8i2gyQ9oUHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107665; c=relaxed/simple;
	bh=petPHqnrzINJgJVsEujeJj9Mg/pmjka7fhYUQ3WA6Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnZWL7WMvTcC/p6DuZ/zt6EH2a1toLKsa3Xupw8F11vdl8M6lJRwZdgB65FFc4EBYZdC9FYmF3SXxH3t+bnkPr7eaE1V2+nxtkn1U9dysWouEUTVTh1nv0KNGCAfRqBFbkktUMMndI0Mzqgd1F65vcC0UMVYW+680wkqxtVz+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWHUaZWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OpI0Sutj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiO61695391
	for <linux-mips@vger.kernel.org>; Fri, 3 Jul 2026 19:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7S6HE1h6m9l
	hE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=; b=BWHUaZWv+bF9yKBF+/TmAfINoX/
	JDQrYh1NjTGMSYWenUzFcBW7g0gbb+J+tyyNa56aj4sFeHGr3rPjjEDb8QbkBV3h
	KI3Vv8WYnY+o+4H00pvmBAdFK0PUp1dOXrM7+u3zuzfdWIdWke9AUcUJH3uUSxPT
	vQqu36jx0ftIDpgqrT4zTl9ahgQOi0NiCOdoTQREaXeNRfTSMs5kjjOCwlH5Ue1k
	zLbyHuCkxdDFhfryu5s/sG/7LZMR1EHCn6DL8cTFv+HpaM0WeShlHADd+PvnW8Xv
	B2oy+EBhx3rxbvnLnT43149pGltQRY09RsmrapivIiWSZbFohMSsgSevu5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a577-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 19:41:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e24235ce1so1244127a91.0
        for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107662; x=1783712462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S6HE1h6m9lhE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=;
        b=OpI0Sutj5W87f9z7cL3dTYkqjbhfPf2lbTNisSNyH7Rf7iGaJjDJ9C7YxUvKSOlPz5
         262EIiNIHcuL4EcKz6tWcg/wsYKqBJ3AeEyX3DLM/C9sRmGYn/kcwx3rXhrIKG3uqp9o
         iZgC3EhzBZPs5NjUNEzNMU1Uk13z4i9hMmNjRiMVI6Ebpv7zexThe3oh5mEr/q+9l5Yi
         6mKxiD6QGdm85GLCO+Uy+laRKbZF/NuBdGcBUuxWP4oCf5ZuuCFzHEyMdn//11zvw7WJ
         xMhNEZNvEkFzHsevBM5BQPkpP45DW18Hza76NhHszN+TZpzBXyUuf0VbEpDm/Wn9aKZ7
         3uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107662; x=1783712462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7S6HE1h6m9lhE60GLkuRwg8Afko2RFFjs4EYPEG7HaI=;
        b=nrEFiksmefXFcwdmU0gunkRNG93raF3aOk4YZByPu0ak406/luRYRRjOiKiEy9xpUc
         RMWUgVGUtut97GP++t4H7Y3r99uDQkHVlYLqPX7iQ4nLhda7pHeeY6/rUHnGWwaUfQqX
         ckRNCLHFdzOpY8J3Ag5zAVH4Ozc9KYoEDvQ7ZQ6f691jIZPPJ3/tD/eyGNwHeTq1sQ4J
         IBMKLU7aoDtIl4VHLpYeWJ+Dx498Yn76JYd5UDZ2bsFdtHz+InKaMc60LeZXwOUTRnfA
         bAqGpmTxfQxiwPADlhV38qH7rNLt9EP6fAPdVEFVbmewG44Ezs2qd3dWHq4IK1G47epu
         9F7g==
X-Forwarded-Encrypted: i=1; AHgh+RqD2g6j19y4LjZIGrvBSQ9KGbVqG+1LnxPTTLwMSwHJooJu5ACWqk6GbeOWaN3iUdICUBJ35Jb0SKSz@vger.kernel.org
X-Gm-Message-State: AOJu0YxwQZAhLq3KG/jAdUBi1N/6Z5Kw0TZqJFUDUCQfyW1xyfnl3grJ
	uq3L6fb3ySq7w5CMFIB5/2U3rzKKn+gFHhw3MiB/zWsvpYVby28Kg4ZboIf/1lzFJQpWaP16Mrh
	bP5tEkZo+2A6a1nyDDbMHxM9TH1nzfds/XSqZgHlpLUsS5vLOorV/020EksQqie0U
X-Gm-Gg: AfdE7ckghHvGv7q3bE/ZWQAo7odsW7YL5GgpMXd2zfjfIW+bUKheJ/Wkt/2PwXwh988
	AJUsFXJI9t//yNcPOCgLneAF19eBcrMPYtRccyjft7uTaihGUJuxb1D1WDhOrsq4xs35U/Pf9xY
	fRemikTWFi0P6FnxC5EjrehBCUYGFlIIBo99f/x1eTsSsCNk9Diaa7hOSJdG0BdC6Er8RLFN1pZ
	KjycLbBCB6H5u8F+KOdTs09SjRCTasRUdowXEU+E3++gkUDeTxY9fdcMVSJX2oJkOV6SCdl1p75
	XJ1ruS1lhJBGo5F2AO7po1JR3rAs9OukwQLNLVz4xWPPYk2r7fZG30UZRaBuEjd+q/4ht3fDNIe
	6R6O6ycQSRbOUaNoQ/9hANbC2YDQ4uBRUru6QjA==
X-Received: by 2002:a17:90a:ec8d:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-3829f7e92d6mr770770a91.27.1783107662216;
        Fri, 03 Jul 2026 12:41:02 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-3829f7e92d6mr770661a91.27.1783107661655;
        Fri, 03 Jul 2026 12:41:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:01 -0700 (PDT)
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
Subject: [PATCH 04/42] remoteproc: da8xx: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:17 +0530
Message-ID: <20260703193855.110619-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: CCe9n285Fz9Z51o1Fy0RG9WC7NsLPs5v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX/VT6C7p6S7jF
 mutzCztTFxK7fUSfo54SDuGGFO+i1NsoAyvgv3B8ubnlAFhcwyZXJFYNeeRD3rigyUYJ1FDIoK0
 wJUM6kC3uptZy3SohYUCa25phalVDXU=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a48104f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MiZJTWugLlTGxHTZgFEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXxOxlYvoOZrvS
 dPsflygetWdql+8xnBFaCDT97xQxwWm7ZtPFeDxhUlh9veb4q+gdJr8Bu+meBe7wTDtJNgRPoBF
 kTaVswRoMMCzmTWr+j5ETytx0vo1lALYMiphFBnsBPZpDBdY2nE4piWqx3sOrM2hjt9ZF4vo0/t
 ywJUPMuljuvXVAerNU+c6v2BRqcEYUnLO96vfx0yqZgMeOPiPr8CvLKaoNTsx89GnBUcmJ0FYYg
 dY6a3HxQIj8oUvaOcAXOuylhPG+rZdyULZQtxx2yYL+KSK5V6sxBLUzNYsjwqWawS1BwVVeuQHI
 7FrpPei0PmH8wi38aHr4xDFSre4+42nglh4MGb75aX+ZV9VcNyTO1phWa7VfyYm+5xowbbb9e5F
 VzomUmCNBjhJhsW/mgX9qhk0xCZwpBz7c7FUIrR9EKx92MhSpXmr+3/aTo6nkEzeE8BHw9LCXdB
 Efg7WX1/dFLv2oVq+BQ==
X-Proofpoint-ORIG-GUID: CCe9n285Fz9Z51o1Fy0RG9WC7NsLPs5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bstai.top,gmail.com,pengutronix.de,linux.intel.com,linux.dev,amd.com,cixtech.com,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,collabora.com,alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15457-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:srin
 i@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.or
 g,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 31682705298

Replace the hand-rolled da8xx_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 23fca7176539..cd9a8f2b3163 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -230,13 +230,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
 	return 0;
 }
 
-static void da8xx_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int da8xx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -267,10 +260,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 				     "unable to get reset control\n");
 
 	if (dev->of_node) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 		if (ret)
 			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
-		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
 	}
 
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
-- 
2.53.0


