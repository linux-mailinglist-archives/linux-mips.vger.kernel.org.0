Return-Path: <linux-mips+bounces-14330-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJvgISkN72kq4wAAu9opvQ
	(envelope-from <linux-mips+bounces-14330-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 09:15:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A61146E321
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 09:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8308D3003E98
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 07:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0965E39099B;
	Mon, 27 Apr 2026 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GIQVFyPz"
X-Original-To: linux-mips@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ACA2857C7;
	Mon, 27 Apr 2026 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777274041; cv=fail; b=W/2c9ptQ13uD4q9jA3wzwvlP5AcwghsxTvzvxaEkPn5mEa07hMdRW++l6F8UGFsHnCUuH46VR82hdEIUB0Em474RPRXQEw8GJkIynXhPXZWEbGWoqtMj5bEKjp/bEv5kRGJpFP/1ADESVO7ZPvBWvil0strZkm/czciY/pUDO6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777274041; c=relaxed/simple;
	bh=db5JkrKlCd9dkIz2of+guID6dzomm/7yZx2cmKW3Yg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M0qRuALOF7POAHjejb4PvOT1Pd7Dh27Ee/KaiHNXo8UJrQ0ImKFMru/1MRSv8AOol7DB7+ezvrz2mjrRJMX6lsc111A9SIWuqGOm5OXwsfvTdl9bBa3nQ7LGOeutpUlO8eG7XYxeXd/d35CsMvc+UfF0aP+YsptD5RtQwBvP1W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GIQVFyPz; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEng9Ww5yqkqCOLg9x27rp1EfDEjAXl4p+mDgZJfBPiTm44d0WSoXUVZHgdOCqcsVMcGTAmRcK+PjjQ1MhfI7W/AZXtcWzHhi6fgo9cystks4BDjxje8p4iUy8A+36J5C/j+9NOLFRYUm5pXo9f5ih27Zpoh35ue4fUqBtLTgPUTznKXNVEY/9sBrQgTIaUQL2ey3agOe4mAOY139OP2+2pxdvWbunjCRkXAEzuUIEh1Y5ocTu+jFqKb4u60uUPtQZ5OWJr0hBTPEjpNyKlXjykqEz9TDaeOYK4zTi+x3eZC3Myjz3UuGFeWwQNrUN4zlI0km02BCcCW4u5szFs6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UxvBUVWJXuEj3j3j0WXhoX5RINdSvWVBF0Y4Q6PtCA=;
 b=L9nKF4PtJJ3OQLMfyTPxV8UEStRXC7ZLMCmlRjNCWDF+ehtIaNdp69O77S28+xFFvWAR6r1eKPtjI3X16uqHzmAaupmm82cpN/IDSEi8NU2BENOUqK92fFCcSB840iJ2jXgHHPa16DFgVXjehIluFesqq/H0gb50kP5IiuzENs+e/BoG9OYfd4u3N2UcG6GNjvvFkd6DL9/m+bkXqRrA0HG/02BSKRoRD9QaRdkNSaehB5WFo5vSmeE9YjtGufblbCGokIPvbO/vlHrPa012UTafZ+YvBEs8pMhBS+/+83Ul0phLI/v7bvA2c8P1QCP++Hi1JyEgIPL8jmF3U2QncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UxvBUVWJXuEj3j3j0WXhoX5RINdSvWVBF0Y4Q6PtCA=;
 b=GIQVFyPzb4Jb9BQXgvVnHeD+mGEEGyIi1YCjFQUbmrBSI1BKqRtem5Q0+k5yGljX+zf0u4VaxPoHK9STytVk5cd7WpWprWqdhHboPyfnc4RwCigO5F0ESJHJIaYzW+PGt2+hAvKTaVeHDyXCP6yOdSjGLWAnO0udwgtTOw7jFv+uHwXKJPh8H2Ydub57JUeI+eTO9rcXNTJIjm6C2JdORcE2qNdXFKm3cf+JGTv9EikVrmKFTiB7yru0XmlKj4K72+z4ipVsYmfDE8AT7SBjW/tKS8zQawrB3b+ThKlGhlvWb4REs5dGto/hVhVkOTr/knRdTW6O8yKm856WTH9+QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by PAWPR04MB11648.eurprd04.prod.outlook.com (2603:10a6:102:50e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:13:56 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 07:13:56 +0000
Date: Mon, 27 Apr 2026 15:14:49 +0800
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
Subject: Re: [PATCH v2 04/41] drm/bridge: ite-it6263: remove now-redundant
 call to drm_connector_attach_encoder()
Message-ID: <ae8M6QZHRJueeDBQ@raspi>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-4-2ae6ca69b390@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-4-2ae6ca69b390@bootlin.com>
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|PAWPR04MB11648:EE_
X-MS-Office365-Filtering-Correlation-Id: 382d1cda-4af3-4e1a-0fb3-08dea42c8b74
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 3nWIA7tf94yldf0lQZDw2XbnX0xvGAWZu/vAXOGg5Vehbzubj4n37PS7fnKtFwOSaM1hWmCwlBlnt1XsE31m1zWk/JpslmOcwrT0X8W/NlJ+CV98/ioWeCurvTc3fCNZdr0txy1mhwceJLibPb3Ea4l17iADukBhJl7JmnvEvlrdX/YXmfdOcLTEV+g1yRhEypTKMVzLQTrvLv1P8aZ+rD18As8vWo6qPo5VVSggTirXWmM+2H7uSz3n9K80B/dzXc+wxtJu2g6urNTW0hyOJp4oyafIOZmR79gS0j+qoZvi/KhqwUtukjxW+hARnp3WaenR5mdSCcFmwaoo8FoY/sosCldX/kqEC+lngIfspNfmS9uYUiZPIRwXlqcCKAz1OBICNL+lNpvfinWxvasrDPhhJ8GxfDR0Z0kuToKOFqV5TDplPF1xNzcb+DVSNRIx1ejEeOM1+BD3S4kEumyA5PJLp2XxLIXuFYV1EwVudB67cbQjWM6Xe7XjBcG6M1cJTIRiu0A9OOWAB+B3hv2CraqJhHfBtzGA8M/d9787GkDTO1KKggTNNNq3Xr1H7wDaVbNWpF7M0Fm5HD1xO23TmMI6tE53+yxEcChEQ8aHfl2QTN2QbdLdsmLb0BYz7y/QrPgqRF4pVGxoAMwaeEx4WcrDU0QuCwX8405bzUQXdHqol9Zj1I8EPahbXFABmjsKfHHO743okAbuQoPRxMzrC3SxuxL7zPIuqXocJJxJcaI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ezkD9YeZawPcjD5We9kRvzFgx69RffO2WyaYt2LWnD/S+XESYgdfwxCZp1SG?=
 =?us-ascii?Q?w3KOfZvdW87GHJU70Xmw1FnqyHu9xu+ZytsZcutsVIffGFQTnNh8BuFkLHJu?=
 =?us-ascii?Q?To/pjCuHsSPRKjKSThukCjU2JYnVnaNgvwEc3+Ybcb7Bs70jULHTo4TzxKEJ?=
 =?us-ascii?Q?5XDslpP3JMdgN5vERbOlZcir5a7yLVsLJsktC1kj7T2dXSOSP/IBTDxtjaRW?=
 =?us-ascii?Q?FojX2O5yMZyflqbsw1Agtizb0qpvAi3P7U4NzDAJEcOCnLAGCSvE1QcaRr02?=
 =?us-ascii?Q?HBe2orKXQKvphVUUgRyg/Zy1p7rD+5vSxIIl76x7kenosdMfGhhZ62vBFrYu?=
 =?us-ascii?Q?VmyFErruiJpffrmuxmPJnRt6GGHPMblC/wrf3ACmWm4dSajDL/Ex6hmM53j/?=
 =?us-ascii?Q?nNc1czifunTOUMvWw+8WO3jmg7d3fNPm8Y3gvULcRoPawZM2TaukWUoGwBfB?=
 =?us-ascii?Q?YDeszN2CtEv6GixlksgyEpaS0R+hJyMc2qMmGeI86ufHWsG9bwM6ufJMXlEK?=
 =?us-ascii?Q?zoi8WN9QuTb6seM0ZuzOrWkH94WhDo+7NpW+QfV0eUhqLs+TdVBRFb1DyrV1?=
 =?us-ascii?Q?SH0JCCSD3KlwSIp7aMJuedjt1rPTJDNBqwHE8cxp25RLQzCgerIN2+ki0ZQ7?=
 =?us-ascii?Q?kf/0pD7F+UJBGEr9UPbx8sv4r9v4F+O5cvGl2RB5G3nnqFta3xXHdbwYhXKo?=
 =?us-ascii?Q?pdCYLVclfvzZ6bODs3s9Ax08kNI6Bna0xBYm3ubxBKekYlY+3uRnQ/lTJ3Zs?=
 =?us-ascii?Q?v4VXnXNEuEza2sQ9seAzgMsEIh5TDY5IQ656Bl0l12p9Wq6JLTh3emIn8nds?=
 =?us-ascii?Q?6uJglbBfJLKj6VZTqiYiKRmfFDrKVlrFiQvhff34R1DIl+KixSheH2BM7z2f?=
 =?us-ascii?Q?q/9UK6TgmGJFg4SKk2jWNklZDwIRWJJwRtqyd/Za8GMxEioy/rVpdGquWuQL?=
 =?us-ascii?Q?0OWOCguMKRuLZnL9G8FHtMbpHg7nidk80C5fk4i0xiK+Ev7kjZUw2bVspR0j?=
 =?us-ascii?Q?R2FQcDc4cQmJkaLkviHuJ17LkDqAQNFAKeaw/K2K5Abr+Ab/wT5VjOKa9IHQ?=
 =?us-ascii?Q?pvYUVOqHjYJnwoXyYLwZTKv7F6CrcZf1Ro9zIL/EMgwGggztJ7YN+SIwIHfj?=
 =?us-ascii?Q?H8iM1byqTQYBn/PJkCR8pCc1cJgMSJPbDvqVe8YLzK/AhKfxX0oE6wAaR1OK?=
 =?us-ascii?Q?DE7ZQySLBEhyONNvfR644dVnKOuBE9SHFlRSp+8/NZ3zyDbH9Oe9hpLaPxZ/?=
 =?us-ascii?Q?DbuGkjhVIz6DXzxHHHqWHrUPuiCEE27nLGSX6vO79h5nlyOazoFQqWKN+erF?=
 =?us-ascii?Q?7/xdcMB/hFTgsi8xLDfpds/yMFJc6hEcFE7+awl9cx4+ZjWmFC+OxRSo8mgl?=
 =?us-ascii?Q?TOQUURhHijvIMSCFOgMdiz/kOGCYzNg/JsRKP+XoaBK82GDzXL3C2e7rummr?=
 =?us-ascii?Q?aUOx6XBLcHkN6jW5+rLipT1I4C19WmDwvzvx+kQOmATaNifX9RjRavW+NbIp?=
 =?us-ascii?Q?tH0qkjHXIi46IYWcqX+ejLO3Nqwc2oDYUqq1EsNxtpgiZ1+eqj2C69fBt03x?=
 =?us-ascii?Q?VqDqH3Ce3FgU7zctfcHf6T0L+m0LBMbI7sWa9qjZU229IgfIVwGV3OeDiaQ7?=
 =?us-ascii?Q?3jSqJOBKnNAtMoRYAHwKTvWHXfzyzvbqxAdKHWMGJFPZzpSvwuTxRodlOBUP?=
 =?us-ascii?Q?fbMAtzOyMjbz5R/8zVwFhV2mzzrS5fEFZgrMNFpvsxA5mqgDQSWLIBFIRQpk?=
 =?us-ascii?Q?zwWxU9MY9Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382d1cda-4af3-4e1a-0fb3-08dea42c8b74
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:13:56.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5n3mmGI98D1yIJSrWSWWcFnwKUi7dq8Gvw08b/VK1BSK3Z7axZqaLXn+VMKUlETsqnJ6rXbKFzOKqw5SFcnqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11648
X-Rspamd-Queue-Id: 2A61146E321
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
	TAGGED_FROM(0.00)[bounces-14330-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, Apr 23, 2026 at 11:16:58AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

-- 
Regards,
Liu Ying

