Return-Path: <linux-mips+bounces-14333-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHf0NkMO72l25AAAu9opvQ
	(envelope-from <linux-mips+bounces-14333-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 09:20:35 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CBF46E443
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 09:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7EE23002B39
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 07:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721E5370D65;
	Mon, 27 Apr 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qZbHVvQj"
X-Original-To: linux-mips@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D1347500;
	Mon, 27 Apr 2026 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777274433; cv=fail; b=ETW/l4LHNNZtAzoJa8QIqN5Y94gqvNBZJmFs2lTXr/GUmLY46CcJC3Ec9KQDAuxrbbSVAEdh+j2E8UtrsKO7tP0OOp/J+s5rk4rAfeL/bhYh7CVXmXrlvUxh4Q114yxlkYOJ7IZec97g4G1tvEB052jWr6c7r87WcqZXqNitN/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777274433; c=relaxed/simple;
	bh=AYA9KP7/rjGvvoaV7zrXVKpG/fxEopdho3BSgUyEVCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d+nPKnEqlB5oqxc7v3AyCeJpPMb6tcmVL8xrv46fdFktHU9QxOGkwsItNV/mf5ciLLFCpcMEyN1oOFKonMAWON70vqaGq1pfEAhv/iSiAvhZ87+Tao+Rk8yWypdkASdN27fwtWHby1Rk0M7+KhIRSLJ4ODIkzvMWXbA699IVG5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qZbHVvQj; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfKrQ9XrVv+L2gYC4xCYDY9dymdJ0qC84B3UUhSFFzLO5ol6aNDqoLMIDRPp5Z1tC9iDxrXi29zqSqQkj+sb7iaZjYQPxQ26NBBzzGYdHwssStG05IDnK9Ar63W2AHA41OlL/3OP1+IFyneq489lY5IdUcZa4gev++LH5b2hZMPqafFMpqpvVacOtaXHX+HJXaede2TFx0JfzkaNANYFrAmp/IdOCSVdqnjREPGpFf0S8jRTlBoj/x78xe+RQaYJSvBiGcdAH0ALqnAIj+Qae61GJwoJpAxu5fyG4yCaoltCVHAPj6MxlbX5AxxZI2t7v7Aj6uq6qR0JM+PlRirW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBhaC1RBr5+6/NYOOt7Qzlu1aHl7Fqeg/S9CESwLIE4=;
 b=kB8Ls+APomvF5SGytNOccnd4YLFIc3rGtqebvUaQEk+58ydXop54/e3GoeADfS7k1lllcacMPd0QTCBIXVQg5ymsd3e7TPLryiouWmzHK2hAceTL5lkQggYYT/B6Vg0x9p5n33wGY8d6N2Zyn3nJAoIdXOOnR0ezLK0UrPjW1/18/trPMN7kdY1wCAF2xXk5FHOfd4S7T1y0U5FcnYrPiFvPU3RUz43El8vzu33vMSEoWBFjX97Kl8YPWUJR9GhVk09FlBW7UqqnmIyP820Mip7HEeItzIa5p+cUrKan11qGGIpJ05SHsGpBWJFbP9Wpul1abawCDVDZTfPI01XhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBhaC1RBr5+6/NYOOt7Qzlu1aHl7Fqeg/S9CESwLIE4=;
 b=qZbHVvQjwWsc5VAB5eHvIJaUqmFtFy07HZxd3D1IHIeNg5OH4UF2KWQvVq2EV3AnKyA2RvJgkrHD6nZvBrqgxU/JeaNN6/EPwgLjCVZYjCverIJYddf289rscOClfD/V0VLdkCCdsvMswFtO2rRWQdCEMSIQhJFT1rwbfYQniGy+V7zcZyoTsymWD5bcwr33LOhdsunC+i1/5Up8k+Cna8N7JYhSdvmkkwiBP8zYiOeJ2HJpftt1TNHhZ8MAEZy91TmYrrMTCUJB4PziOoxwaIZt94fq4qKdBqeg3OBt5qWgcbFVm2x8pPmFt3xCei3icy01c1rg0KJ8iRh6oU1wCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB12299.eurprd04.prod.outlook.com (2603:10a6:10:62b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:20:26 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 07:20:26 +0000
Date: Mon, 27 Apr 2026 10:20:15 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/41] drm/imx/dcss: remove now-redundant call to
 drm_connector_attach_encoder()
Message-ID: <ybgfrjkjwbjcpc2aw24kodcim2lf7c37qlwwh67as5otiogxp3@c2ndw3f2d6qr>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-6-2ae6ca69b390@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-6-2ae6ca69b390@bootlin.com>
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB12299:EE_
X-MS-Office365-Filtering-Correlation-Id: 3821bb78-7613-4c75-2784-08dea42d73ba
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 db5x2kgA0DkMV/TxDKBe/q1GDNYIluCduHX1TZx6q+OwEo35vzqDtS0jNL3+8sSsiGlr+Lyc+X54v0ecOua+L1zIsUUU2XX0tly0B/y0f2LhDFOcnJDcz9KtgxlQCbfOgd769Y09J9gg1NPdByD9D4ir+5hj9BVkxpQ3VFkJNvDMSOOwPS079+WaCdSfvmKjmrAjWjritmwcGLBfAUk92kmm+IwZpKl+E8p4mNsERRLXuP5AGgoSR5P47ei/V8U9eAbJyuMUp0M7a/9wHVnMRiUwncBeB+4q2qi5tS4NCW7I4EvOjX0KlELlh0ljoN9x9ildugSGf3MDMrsSrtUe+VT9c0c6C8g/nWuKQ9Lu18VJvsgrldkMxeEw6FOXIBP9VjbscehehYLMCoYBdxRL9RZStXxxEwebmcuUDF/wX7dfmv//YQhd7RcY60HKfxptHx9h/hPHwJ9e4l5nc1uz1/2xzE0i5NPIpZ7XtxfLaQJL500YRfmtO23/eNH5kHZ6T7dpNjw980SqU7TFxKqOdT7S99bSpR98s3Pzoe8GdJp5EBgbF6QCaVDfMsqnLw/4wmBwOB+9YH8k3mewFu1AyItnbBo4+GnvH+anojLAQwWeZsylNvyOdIdVXLJLB/9Nytk0gMlOAbuNX7the2allNR+V/cufTRfHgRICtgc8Pxv1sQbK/XReXAEBwKTHJT2tPZ7JiXCzHYjcn5FoWP5DC2yY7CKixFFV2NTaEMMhss=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9WLRojYWt9FM4ds6PakXqpZ/2Btox4BFPoY/7PrkDv72XGQeOQX5e18winbF?=
 =?us-ascii?Q?bDIWynbRD5L3+N2gvMfdM6yUaIIQ8tEZZE+RQ/ZHnZwvlCY4TlVys3DsUAtJ?=
 =?us-ascii?Q?PjcinghyI1BYDGEBaPyvqAFUj9Nc6mamszc3Hgq/rw9IBZE2QcgEBkLEIYTc?=
 =?us-ascii?Q?B9HNfDLLSIyHndp8AMbHhD1zbCMY2/GtK9WEYUZy3gqdK+LWOb143bMpgkZV?=
 =?us-ascii?Q?JX82/MfhkyQk1in6pa7epTVk7KJ8EOBpHcTNnW4Je/SzxnjVFRXZjJ1cv223?=
 =?us-ascii?Q?lb6m1fGCGVN0ryGCieWHTSAaGJotHoaLCOfO8Qxi7fpXvBD0Q8Fk2jUzmaqW?=
 =?us-ascii?Q?Wx9veG2JiQKcukhn10UKwoHInr2NhHULJkVJkvrWI3LkWNCApj2/D1/2F01L?=
 =?us-ascii?Q?Q40Qcf0gj6W+3PkmyG6+6QeHD4ROIffTCYJX4R1QQ8JDFzqfPyuZK2oWxcet?=
 =?us-ascii?Q?HIkqScKFbnRNhW1+sBjaTL32msbUlz7XT6RXNP0av7Xjao64imu19jOJoLfK?=
 =?us-ascii?Q?ltMumOQu92mn5/QOn8hU9s/dtajHauGLxfBVUVSuKl3Xg9yVuOZ77e4bJAGN?=
 =?us-ascii?Q?/jLDlhWfPd/NU5Ss3O1tVOZKxdTqjiD4rxXeR3H25YXQmFGpacxGrdvv8cVL?=
 =?us-ascii?Q?LVyuWVizkw5/Qp33w2FfvgUVz9XhPrw9TcsSJRzz80DnV4cZOstHj5Ocs02P?=
 =?us-ascii?Q?aikUnB+sNBWMP++SuEf00AXgPr38uDZRxQ1q/QWM+82U5Qa4Js+9ZlmCkpF1?=
 =?us-ascii?Q?hNWwE7kDEy50s3GVoKoBUyKRcmbaHuysTkATdxr2+auCDR/ZhFP+My7AEnD9?=
 =?us-ascii?Q?u5NlwndzSYWboMUdGCsIeY+kj74G6hiZuthbfCwuCovEB1kFzRV57pt174qI?=
 =?us-ascii?Q?n9vgbdjZ3rsNSYED2TFWhaJb/CWKPFU/z70ic9hprjpknihXiZHjSX4JdFO3?=
 =?us-ascii?Q?tsfncGNfmYHnREJnunn0cGTZ2N1RAp55e55+OcvRBthvvCl/1dmskEKpIoTQ?=
 =?us-ascii?Q?g8Wsc2Z6IXRKlmuFEVjFf1PWbTwk0a3vRexuLbYiaIs7pW4uVx+qI4Zep6Cj?=
 =?us-ascii?Q?daF90p55pIUjmY3X7KXvCkxD5gPIR4yxUtLmXbR3pC/FgYBGI6dmH2M8zgcM?=
 =?us-ascii?Q?P5xuO9JDZgXd3dLhiYkFHhHDaCLihKU/qUxeTkzisvwTSPTQaIhHJcBUkP3U?=
 =?us-ascii?Q?6hwE1HU5btuYsZ+2mPrU6FQzGu+SCvkvi+YRaWQiSvjAqusdd7wmefDdJGCV?=
 =?us-ascii?Q?pX4NrUtpombBX5YN8CB0lNwmFST1HgfWCHv+Yp31EBAXv9CZXm6eZwcdoney?=
 =?us-ascii?Q?ff2yuC8N0DuCLgY7maXfOSyf/4EBcUzJqsWjodLaZmT6OzdVr/R1UepIwAdK?=
 =?us-ascii?Q?gk8MLdEhnykQkuyWR5eGMrqZU1gf01wi46WG7JDYksX7Mwlqakm/CAEAx+W1?=
 =?us-ascii?Q?RoFP8CqVgqWUHy+GkMIoPLxnYvJ7jtvfSRA/v+ZVIarDtWrUiifRuods3dD4?=
 =?us-ascii?Q?E5p4eQrH/jzWl7gcoXSJkeMxT9raEvxJrsoOozgSFyveU9b8PR4OROz1eJI2?=
 =?us-ascii?Q?lmIAPrtoWbBHAtA/bBuFVS3ciRWx7G47+iT4n9XxQgwk5ABdwTmKntWSQ4cJ?=
 =?us-ascii?Q?6Dde5modogh6WxtPa1ZOiqCA5eOJO3RI075zqq7OuYH1HsDETASdJXD8ibPM?=
 =?us-ascii?Q?ELn376Q35sf4aL4z59bx8vOY8H1ANWeIsPUJ14fDBdoSqwoxd9Ol+iaEXuUD?=
 =?us-ascii?Q?RWHPOOWUapMPCb5MQ3AS0XSGyaUgscs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3821bb78-7613-4c75-2784-08dea42d73ba
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:20:25.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8NBPTOAP+2fWpIT/IlNAsTt+NqRAYj4JNbe01eF1VaHlIR1ntfYyC/e+faaIGHZOrz/43r6IBn+j0mS7fhfPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12299
X-Rspamd-Queue-Id: 83CBF46E443
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14333-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurentiu.palcu@oss.nxp.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_GT_50(0.00)[78];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,bootlin.com:email,NXP1.onmicrosoft.com:dkim]

Hi Luca,

On Thu, Apr 23, 2026 at 11:17:00AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

-- 
Thanks,
Laurentiu

