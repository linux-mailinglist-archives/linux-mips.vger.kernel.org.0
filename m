Return-Path: <linux-mips+bounces-14331-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCjGHsMN72kq4wAAu9opvQ
	(envelope-from <linux-mips+bounces-14331-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 09:18:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A446E3B7
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 09:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8013301177C
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 07:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1070A359A6B;
	Mon, 27 Apr 2026 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bPyFsK5+"
X-Original-To: linux-mips@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959D34DCE0;
	Mon, 27 Apr 2026 07:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777274192; cv=fail; b=RchxbCp/v76xvSWwp0c6nj4SZYcUIpXtDwHAKCV3lw6l6P0oU3T6oUWs7nVkvK5Yzfko3CleMInQ9+9fy7hw9Nteb1MfIrIYHVcbp87i1A8zpipiy7e4clDh6i51qmvFbOZ/FVLJ1RsevpVZ+V/jMBfr+rr+yYIXtSfBPfmJ+PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777274192; c=relaxed/simple;
	bh=kQcdjQmoeEJDP1tJBF2a2NYPg+cPpBypyq6aHSxE0XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ocQQSRGna7tTCHSO7lASDt4QsWQqWGnVnhCUUWioqjuoPAHgwQY/QUJCBuI3B7wrdW7QkqaudgVEfz8m0Tz5hLti+Dl7UyB41CtmkR4R+z4Ol0/wmVDoDbkDeyEMlJj6uHqssof3TLMYAjFq5Jy+hdsn16OcSW5vRxE4y9ayh6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bPyFsK5+; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O83lgBd4xTlYgnOpU/uOQkWyH41HsTM5lGgr2ELA5xRqglnB3t7jX7lWXs9N01COQfCuiP/061lWd1TMHhbiKkYTCTjRqqh0Dq7KC8z9IZpHBeVmDZhcf756dfiC/I6ZcmBML73bMX/5Jk/igtZAvKIBMk2mqX2Pj1EBFPkoJEWMSsoQbslB7l1UDnnwGFls2gfLVdY+n0Z5rAD1uxobh9axym4L9+Jq1yauMqY1Y0nqdaq8Oi4XcwsIE46RVBGkfb44SCcNBVkxUwDOonWW/7+CQ72Sr8Zp2AB9BwBfMJFYR3AG+ze7pWkhJPWZlPkyUBWllAooCWDx8E1dkYAPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TJkLOUWoQFG/7ufXtFkLiVGfR374H8yP507tqSacgo=;
 b=NNZV3X94wMQHZE3vt4QPWqGFV9KWwCqajNghKpIn7Kg6cocU8EzoN5NuVtmwtyek8J5DwGR7aen9MHhtuGolLY3KwVsL8c/IVjiVZRG33rLA60Ntew/96f3nk8y+RYfwlqCvDTpYSX8K9Ogj/3a7PfCNVlU0+CGdOg9HMVAm8BSGGuQyAbotfQn9Gb9K8HQSDkxSPYa3TlvrDakJLulZYz/anNqO4M80u1Y6uDlagDjrpGUfZNKoXuQCiUcASTrskTMPnhNQRo83Dw19ODE0S/dbnSacSknFc6yaPSfMHxN1YKF/YiUM8GjSK4ZLPJbQjmQLSNQBpqwepaqAKwOP6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TJkLOUWoQFG/7ufXtFkLiVGfR374H8yP507tqSacgo=;
 b=bPyFsK5+9hbrALHVM7gqbCGrwqetL/2LOQMxwKG/GI0wwZwmXXQV0qAXICrg32+pnKgcA+g7f58csyeBMpf273WeQh1tjvyndCoM+a11DBfmQz/VoBTpU8iF+WGmU1tHlQMx6Nb7bvkdXVEpKZDaWB5POScHm8kGN9kQdG6KHG8XLE37imU750gsFAGmmv4txrYdDEjcAj+z2N8qZNrZ+KF1ERiHbbe9b/AGaB5jxBDbpgMbVmoOnWtpAjYIW9OlcIG1ejCYQXaaBzxNGvKqntdK/6FrBowIhB++C58RkJSoTPA4N/Hk4DTzNByv+iEbvezGHzaaP8cgRMvn8lM+gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AM8PR04MB7761.eurprd04.prod.outlook.com (2603:10a6:20b:248::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:16:23 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 07:16:23 +0000
Date: Mon, 27 Apr 2026 15:17:24 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
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
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
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
	Michal Simek <michal.simek@amd.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 34/41] drm/mxsfb/lcdif: remove now-redundant call to
 drm_connector_attach_encoder()
Message-ID: <ae8NhEXU6rW2BF3f@raspi>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-34-2ae6ca69b390@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-34-2ae6ca69b390@bootlin.com>
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AM8PR04MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 744ca464-83ed-4c2a-edaf-08dea42ce34f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 6+3ibkXXk/Xhif+Wavh3QUlsL0GsRaIcuLpoSdcZLw0/BJsHV0muzZK6kHTnA7Fwa+VIU08xBDq9E4WugARawqjn/B7okj9/jSaCdC5cHbZylKqBrdUZa6gK9khAobwK3XFSESmE97KVu/HsnM4+t/Hzk16XAn+/f+4aMh271W+4bB+NcqNk1OsO5r0McV+evwDpWjqGyPHIlH1/pQZ3+ABDMoO50jtAia1K80Mzb+HTpXxYjXgJoPkquB4Dh8AA1jqkYzjDszpQWnibzHwpvXW9lx6Hc5xX90iWn0wBK8A0zI3Df34u8b+Ygvr81LC4J8DPY//5c/o1438vEXB+sG6oht8w/UgCZY+SkMCQn5KsRC5N6oDuc5NVPX4s+riUWnO35h6JuMiqxtm40MUTM5oRPUlML6EfazShNoiFv0VlIK2ZgGc9AqgpuYSwOb+LmavscZdpX0q+7Ut59/zRh+rFrJEhBVVkGKqda8YVRel56hk/u1rgX37A32ptUWOhZz9iuIbfQnAyHtXh6FXvjzK0gg51ENbdSirUEzzlBWZl1nCAn8ZDZALvSVNUOEElDIrVck8eWcH5VhiSeAaeMWT85eJWVEm2bZ4JdEywvbu3T21nat3RG9oKqFHHvEeWk9d5iDOW17/9i9NaeL01uRUwyukMF2Onx0l1Hp9Rl9I0BWwEU7MAMLJwASqLMdaKF3pabpiimltCxhvdcCVh4P+i9BJis6Kv2MrNryACza4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FPmkgXbeG4f39m+zDXRnewqBobi3cbj1lAzHsL8hVVTCKfxf1CZZbU6mp+tO?=
 =?us-ascii?Q?Z4Jo+gK9ppJbO8PqovhfGTN6yWwX7po2ORNNbyJsjMCFaKutGIrX4rkTC57X?=
 =?us-ascii?Q?0fA5SURdbTgCWee6t/tB066CY46dDh1gMPxspocpHDGOeamocn8+1hYs8Tr1?=
 =?us-ascii?Q?nIEjV8Ir2HZP//XjBuFnUtJhaWZ5tObmjon6jBmfGpCP7WroKfqqNGQyhT4q?=
 =?us-ascii?Q?ykIEx2J5zksu9eprrRmJ335U8oGKCWNdQANa/UDomIli7CqZnZILdrQZA3A5?=
 =?us-ascii?Q?johhYPSclvcB5RQPV1yNmYJiogSbMebAGGCwo3kmKBES+OUroTkdFn+zLn5o?=
 =?us-ascii?Q?G7rma9pR8y/iGk4eGOXverksqoD8InbIZrFM2kFIaT0Na0blZoYX0kbIIuFI?=
 =?us-ascii?Q?DAUbwzn+vJwVIJBSPHJg11CzlBLKuAIAb4gdbl3xYNaLgWOJXkfxTLJ8cv4C?=
 =?us-ascii?Q?Pcx34icWUJ4kYc/93aYLBSFett92AS543JMS+AhIHTjj9OBvCDyN5pv+ykL+?=
 =?us-ascii?Q?NZctXCBoSPUnvLJWfzlVz09M8Ug7aZxLmZPW5SIkPnxc4upKNXST3en/EPcQ?=
 =?us-ascii?Q?rQ7aseRpLldF733PZnN81QSW5Rs0ZX/7jlPX5Ykow28y2uxuSgULcnzd2Arc?=
 =?us-ascii?Q?j54vcqsHdUTjAtkylmSC0Q1XHtwHYKf0v4zoydXC3WWDbCMGwnOceXQAei14?=
 =?us-ascii?Q?WDmYFV6+tPF53D8UoTfQ7gkM7Io4TOeF9D3IIu75vZr6CTIUd+uuBe2Js208?=
 =?us-ascii?Q?RXFwrKeGpgkD6sr5dB5zwU0Hzz+nP+k63NX34tXQUb+Ah3MZOKhXYcjmrdYJ?=
 =?us-ascii?Q?fg2Nt/bVRKiJmOihsI7ML6de03ftNtGvh89dc2GRtVHEkQ9mao8uAeA4mbDI?=
 =?us-ascii?Q?smO/ewX4Rt7s3KTXvjIa1t/h2nhCV4VVZR3kDNSJiKaoiCo4tYdYdSQ2tynD?=
 =?us-ascii?Q?+QieM/wLTNmMPxO8GNm+Fv85dZeDFawUy4f/tRN0hBTn+GCFirT9hCtd6KMh?=
 =?us-ascii?Q?jchFGrDzxSXClHxmKVXbsYlJhXusSkus+4Vp7K8XMnRICcSKOpbfEHD5o7E8?=
 =?us-ascii?Q?0a/dBr9l97BfVCdzQfC4SP+RvNxCxNSSky7SHuGCXfeCsZdKHPxesbvhlWTu?=
 =?us-ascii?Q?HXO6PPHQ/lrbDGKshCM/S8DcbjnavFKoObnTFFgymTT3cGjojRrU2wmHmYo6?=
 =?us-ascii?Q?YN0A9/BGt/VTxjYdEEVpqeurBlqGCTVCU7wuQ2RkS74rOikrDEdnlc8xmHod?=
 =?us-ascii?Q?/DT/3uzHl77FN/d8xcZWValDida3W/v64nt4jdipeOPLLneHOGgw7SMDwwEp?=
 =?us-ascii?Q?Xym6uv/+/MuOMXao9KBSJeFmqV3739DLVIYdWKkCG3h7mCxT7/aP3Bzi5w11?=
 =?us-ascii?Q?IfOgjMasV6sBuGgLBKUxCjx9hSNz+XNet5iezFt5BT7uWcaPzbMwGLyDLLvS?=
 =?us-ascii?Q?pfz8DGtkuP49So8o7v+2d6W88cAA2oFsVcej7qkzNX57bV1uszgfxbYtoEge?=
 =?us-ascii?Q?5v78g6zQ9A3FUB3k1xgD6u4mRTbLgm7aiq5vLkLpmyiQL3w2Dvw76lRzvk4A?=
 =?us-ascii?Q?JRv6DfKQ1ersdcF7nDtXxCv3utURMD8rePZIIaubymGG1nlYOSolDh6+J4M2?=
 =?us-ascii?Q?MKwZe0oynzximTyCTsYZiubkvQYap8e/qOqkORAiFtv2yJTAPPA8c8h19BEE?=
 =?us-ascii?Q?48cMX2k8EFLMHKFJycN/AcP/N2imbC5B8zc0WGYVzGLjOpvldL2D8nIN/EpB?=
 =?us-ascii?Q?a4a43N6URA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 744ca464-83ed-4c2a-edaf-08dea42ce34f
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:16:23.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7cXetdhsJes3RahcDm+efn9W/ijWdmzxV95KrStgiU0jtvE/M1U6/UeXvaPCBsCHLSVw3oLFkculQ/BsNKpmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7761
X-Rspamd-Queue-Id: CD8A446E3B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,chromium.org,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,collabora.com,baylibre.com,googlemail.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14331-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCPT_COUNT_GT_50(0.00)[78];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,bootlin.com:email]

On Thu, Apr 23, 2026 at 11:17:28AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

-- 
Regards,
Liu Ying

