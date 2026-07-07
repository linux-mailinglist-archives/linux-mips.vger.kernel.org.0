Return-Path: <linux-mips+bounces-15561-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j1hxNTpYTGrNjQEAu9opvQ
	(envelope-from <linux-mips+bounces-15561-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 03:36:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C106F716A17
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 03:36:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15561-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15561-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94EF4300B28D
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 01:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EFA30C16A;
	Tue,  7 Jul 2026 01:36:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022105.outbound.protection.outlook.com [40.107.75.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD3B22301;
	Tue,  7 Jul 2026 01:36:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388209; cv=fail; b=DmQSGmWDNO22WLtwpqPOrNq80k83ex7fFKrhLC/OK9v5Qc5cuXNorkf0kFCVf3U5zKlWSGjdcfMHP/yC3Fsa4t6uuWARcevD0o/JBrILIR7dzfpRPvut6PqLtb9z3cLsRvYZkDiiFJpEA3tuM5zRHmJAtWOC5b32uMyPwZXKrP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388209; c=relaxed/simple;
	bh=91Je8gFr6JB5PfNsNijcj8PMTQF0z+oCEFcEsEaHduc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IphIjPLLIAUIkMZiaybcsWieVip9KVp2b8BRuQsFlplh9c3ov5vxFFp8V65CZTgXMPJEp1bEn3JpY1CTL4Y8kPeU5SZQ8Tay0uYSEI6K/2UPgLPIktUjiBX0SMk9kNz1rh6a436Hw3c92RY/r917fBsbvcXz+giMx0N1ZJufKoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.105
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enilA8zYZzVL1Y1E8qXyS7/jZFIXtdnJgPiYOmK83r9gOPTKJqwAyI7CyKQs+aKJ1M+HROiyeuGbdPHmRVnJhy8f9qATTUWW/dR+MGYmZboIEBamyfvWeCtG4iGsKDHMY2kTdJvNX5nHkKeH7TKowAy9NEs1b0yc3CF/5K1y/QsnJDJ3tJKH2NOWanUBrhBBdaKZhZN/Ldv5hNETIzEw1qS3ZklECAswkfAwdyvZsZb6Z0hIrUVzYZFStGf3lUW33Dk6c2R8Dsy3z4d2cRMJHVFhIL64JDowVSpYTgqbLqB1q7KSMChujI+tLRZo//qeztXYZaGviP1AgewKeZG6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVAt++BBwa9Lp7CQU3w81aHy4kuxWu8xS5VkSssx/8s=;
 b=SfMp+HnA/nq59x5AwpIC0k7qpcQi7ldLr+1t2moMNCA4VpXIRK3jyw4SzceIhwaMHBE62OTqFCusu/qV9Hq8mUU68M1RknexNMQwMUDWX/+KLaLBBZyVNSNGSGqQm3zZgCj9USN3uKolqS4FnPJiwobgFokr8JLFK3TBIPxfdipT4A8d5ADV0EfacqXDymSeClaJP+h3oiNPCUqGtmh3/j8fLFwEOVTATcnMN4cKKHaV2K0LTEk6qNqFqsL9MlYAmlqdDk0UAPnSHh+/XIkw/3D+bp8Tt4mg8bzdqVe0S5tO/Hr939ErpSqiU5v4MfF4esSzg4pG1LLn6dbXRZrL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0003.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::7)
 by SEZPR06MB5992.apcprd06.prod.outlook.com (2603:1096:101:f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 01:36:42 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::97) by PUVP216CA0003.outlook.office365.com
 (2603:1096:301:16f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 01:36:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 01:36:41 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 15ED34351F23;
	Tue,  7 Jul 2026 09:36:40 +0800 (CST)
Date: Tue, 7 Jul 2026 09:34:46 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ge Gordon <gordon.ge@bst.ai>,
	Adrian Hunter <adrian.hunter@intel.com>,
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
	Fugang Duan <fugang.duan@cixtech.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
	imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 31/42] ASoC: cix-ipbloq: Use
 devm_of_reserved_mem_device_init()
Message-ID: <akxXtlUYtT3T-huE@gary-System-Product-Name>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-32-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703193855.110619-32-mukesh.ojha@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|SEZPR06MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b0bcd8-fc53-439a-90a3-08dedbc83256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|1800799024|36860700016|376014|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PbsmJJUC3r+PSMHFYv1/5KAHLPksanDfP7Pr+9GjfsZBINxm7MQ/6oaciRBlKjgm8PiiDmCKpLrQa3R0g79rj/OxhD1HdasUwlMwOHrf0JU8wHBBXuG3hdrKLpnv3P2vBaYKWkRyc7YH5GxFLqRfvvRthoAbKoabp1FOx4VB5JAj7OOr80zr2tzMjzlR47UUAXdphACxz6nv6LEjFZjw5nkP/Lfsoqsy57C1SI/3g+k5VsMhfKjzOnAQN3EyPypuAs7HBnj/AgliW+5HrJP1s74vhFuGt9CA1adcAJymarP4P5Nu6rX/AGOmLp1FnrjZvD2gczG1qUGKllxinGTkHAq4cqKLnqUQi8kaQUtaGx1KVfb86Qb1Z9CU5EFISIvQPEeR4m6sVRd3OljqlwtBXwmq8NH0FKD6SzKRqX4kD7GACn0dK6g6lsKQaR0sduqxWfqLbbg995xOWjawLEAXZ5XeivDMAZdOzhoR1hZr9DyJLv97YF00hvFCX5vTY7XkkngNF6u6oJDxRFbKaxRldx2PRzrbyC1rKEQxL5IX49C9fw7ENvTpNXgi0JPL/z+qTwPIgc77MJq1fRsrgmnB0IzA4DF+dUOpoKdg8bFdE74+HkbQgvupu+ng7tbGCb//sb+zUbDWK84eo+dJfWy2FVgLDQ3OEd3TdRSJu+GPRJAWAcu149u8rXkMyUlF6D54k0cbFWV3qZoNda129jn/Gg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YQP9tmTZsZsst2XVhSMEt6ze26TOYYsaRySCTBU4b2JeGgsxxgjlxfxR5rqo9srtq52gxFXeRrAQpizWmq4rnR131aJL0yADN5UOJK5lOhRoyD34mXpqnTYllYtoO8lT3DKhABUr/r2VCTrknBLHcdjkvQxRqySLGfkJL2ujdOo/T6nQjmBRjqZerpuQXpvNUbQjY+9vRg32YosHnAcL16AMcUeJKjcxDswM9WRodsARyKalf+gPqZeGfVvQ8KBlfqwwBXHZU+z4FORlOWYRleGy1UUtXHCYuF2zFO2AEVXiVpYxVmrrfudDWbEcZaDDnNgniI5tZ2x+7qCWJ2wsDNzhdk4pdS+t1rXnoA677qfpLmy+0wLuODVSDADMZKXY1btJl1j4/a4CCslM/GsYj2UZ3ZJuQONRDXT5z0louJEFMWXX8aZh++Us93/xLCDu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 01:36:41.4300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b0bcd8-fc53-439a-90a3-08dedbc83256
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5992
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15561-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gary-System-Product-Name:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,aka.ms:url];
	DMARC_NA(0.00)[cixtech.com];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.or
 g,m:jonathanh@nvidia.com,m:srini@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linu
 x-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com,oss.qualcomm.com,bstai.top,linux.dev,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,alsa-project.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gary.yang@cixtech.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[93];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary.yang@cixtech.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C106F716A17

On 2026-07-04 01:08, Mukesh Ojha wrote:

> [Some people who received this message don't often get email from mukesh.ojha@oss.qualcomm.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing cleanup in the original code.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  sound/hda/controllers/cix-ipbloq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/hda/controllers/cix-ipbloq.c b/sound/hda/controllers/cix-ipbloq.c
> index c1084a915c13..815932e5c58b 100644
> --- a/sound/hda/controllers/cix-ipbloq.c
> +++ b/sound/hda/controllers/cix-ipbloq.c
> @@ -257,7 +257,7 @@ static int cix_ipbloq_hda_probe(struct platform_device *pdev)
> 
>         dma_set_mask_and_coherent(hda->dev, DMA_BIT_MASK(32));
> 
> -       err = of_reserved_mem_device_init(hda->dev);
> +       err = devm_of_reserved_mem_device_init(hda->dev);
>         if (err < 0 && err != -ENODEV) {
>                 dev_err(hda->dev,
>                         "failed to init reserved mem for DMA, err = %d\n", err);

Reviewed-by: Gary Yang <gary.yang@cixtech.com>

> --
> 2.53.0
> 

