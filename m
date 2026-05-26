Return-Path: <linux-mips+bounces-14743-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONZ3C57+FGqMSAcAu9opvQ
	(envelope-from <linux-mips+bounces-14743-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:59:58 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 324995CFA1D
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9A713005338
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 01:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA65B2E11D2;
	Tue, 26 May 2026 01:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AcVXVdnU"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A3921D3E4;
	Tue, 26 May 2026 01:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760792; cv=fail; b=ejzF/I1QJYHiObhzXJGNcmVEcT4cUPvX/g77UwawHHxYlNBqxzLcg6ZjuYEgYbiial4KPp4NMrhEjd0ByThdVlUrdY85pHqLVq/my81OFonbYD/HQ44DNKogM4053n7lXk++mU1dHiK7evF8EKgMn1twRXWix7P0mu8zNSVVmIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760792; c=relaxed/simple;
	bh=Z66WUTZn/pTwG+Veurbu8lqflwcqgfxddfzcax2SzaA=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cTAFPQLyB+5yGtQFbdYu9TvAZu6P3eHM/jTfBnM7ZIGYJc71NGwIA6RdNzWoPe8Xz8+4vCIvTGMLDc565SHJPZh8G8FipQGXqmDaJOdLT3D9pTsNsjFtvMAe7xexRERK0tAy7hSVoLdxazSgJ9apybGKf7mfbQ73WrRHNTqr1M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AcVXVdnU; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap9MeA4AKR1pDauI28jZF2C+Dqi71wUUiujO2gd4rWrtV+lT6wm0t3Bh6vqKEvBwNZWdL/tgjZChFWqKD26uGnQok2qF5C8gJBVOl+1lOZ54GE2VN2KelERNRpvfDYaPSTCOQyT2Gj41d+KCqvXXMTzkV5SfDbYCWlzBs/io8gMJWEk140LBOzFpnwCMde8H+dhQraTXvbzuujG9T072nL5ZXMQsL0rSDAsY3APsNdYmyfvC67e8wJgdcw9ydWbexPVYicRQK4ASxPxLvfgKOhL4L6l40NVKWdDZ5OZeJnc4jP1u2vXMnxpN9+OvRunx+ygNgHJar7md42lbzhtzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI/kj2eikx2g0kpeRXX+NvbCBoy1xH5d0/ujTztOKGc=;
 b=P/A3zbojOMEZi5I7aQR0IhGcXPfqW9ylaJU6NBYkyJ6O4NRdUObaL7h4lkBuDkHm/TqUDlU2VcVDuhwczG6TGsneAApFn10XfdK7M6hFGbSNCP63zsmqYEKY2Nu9Iw6YgI+sN5U3mYHGYvh87XbPeRrVWpkgq69LQREGpEfgr65ru0pkQAy6D0M/S0B4ADDU8CE1/Kh3qt/RyCaAK43nN06K+cWq0JH7jPyIM19URg3Z5dUSztIuDkL5n3Bf0Q2Nsb+zyUQPX2TK492pBHff8ILn0kBqO4Vo4DV9wIrQ657ZfJjlDaBbyIWWmfDYn9xQmzJ7C3gA5hPc0Vqb/qKdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI/kj2eikx2g0kpeRXX+NvbCBoy1xH5d0/ujTztOKGc=;
 b=AcVXVdnU6U7sttzY/hjO2yhYO9If2OTdcP21rkzYbDPFNvfo01c0WMgFpH2G/UBFTVtibmcEmGiwZF6JfMaRfRc4MCcJwOZ1vb1hGxs3++tnho/zJ+aUYIsMhPaOa6orPRUQGHDX+9W6qBP6djOWMd9Fm0jcVWqGrSq7KA2bdlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15186.jpnprd01.prod.outlook.com (2603:1096:604:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:59:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:59:43 +0000
Message-ID: <87v7cbhqx6.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Alvin_=A9ipraga=22?= <alsi@bang-olufsen.dk>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>, =?ISO-8859-2?Q?=22Martin_?=
 =?ISO-8859-2?Q?Povi=B9er=22?= <povik+lin@cutebit.org>,
 =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>, =?ISO-8859-1?Q?=22?=
 =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Bartosz
 Golaszewski <brgl@kernel.org>, Ben Bright <ben.bright@cirrus.com>, Benson
 Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Binbin
 Zhou <zhoubinbin@loongson.cn>, Bram Vlerick
 <bram.vlerick@openpixelsystems.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi
 Chiang <cychiang@chromium.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Mack
 <daniel@zonque.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Guenter Roeck
 <groeck@chromium.org>, Guoqing Jiang <guoqing.jiang@canonical.com>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, HariKrishna Sagala
 <hariconscious@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Herve Codina
 <herve.codina@bootlin.com>, Hsieh Hung-En <hungen3108@gmail.com>, James
 Ogletree <jogletre@opensource.cirrus.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Kevin Cernekee <cernekee@chromium.org>, Kevin
 Hilman <khilman@baylibre.com>, Kevin Lu <kevin-lu@ti.com>, Kirill
 Marinushkin <k.marinushkin@gmail.com>, Kiseok Jo
 <kiseok.jo@irondevice.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, Mark
 Brown <broonie@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Oder
 Chiou <oder_chiou@realtek.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>, Peter
 Rosin <peda@lysator.liu.se>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Qianfeng Rong <rongqianfeng@vivo.com>, Ray
 Jui <rjui@broadcom.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland
 <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden
 <sbranden@broadcom.com>, Sen Wang <sen@ti.com>, Sharique Mohammad
 <sharq0406@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>, Support Opensource
 <support.opensource@diasemi.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Yixun Lan <dlan@kernel.org>, Zhang Yi
 <zhangyi@everest-semi.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sound@vger.kernel.org,
 spacemit@lists.linux.dev
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/83] ASoC: codecs: ak4619: update auto select format
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 01:59:20 +0000
X-ClientProxiedBy: MA5P287CA0320.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15186:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb353b3-3cd3-40fd-c6ad-08debaca74a2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014|11063799006|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	ysbcArKJbnJf1thdWCyIFSHsiwbA4y3KA8ORNnWCghIMIhcAO22GyCYgYAL5R2Ke3xRrZQapYlmyyIW3T8If2US0tZlCf5ARxX+NFsuZxfrOPArEq5qf2bFNePaMr7/tdU2ZAIuwcuI6o700WmV+ElbiQUVSgl9gtLJXMqh/tYbXFny4SyoqYyq+VuPEyA51cPAk31ZiXqFASfPWiZ79MaMMrj7w+T2St4tECUymUgaAiXaZdxHnoxkCaxcQE3GalXXmbIozgvo8G3vRvUm9kIFhdMGsW1ZnSePKRBTr1Bmx0PDr7waUaGXmHNPpNAeGDuuMWyk/7dwy2a9MXN0iBuVfz57of7fy0pSmDMcMEacJ796IMFd814+G1NaMwfB6c8Jzvq7rO7ZUtTTLuymO3ZWEA+hIi2UuRd/PJnvgDY9mhr+zGB52KYH/cc/BYixklSXT8PzKf1ucYiUHjBIQAxkCord4yY+pmQfCfXRaqs93Yf6YucEWBkgqKEfEPuwE5WKHcAfeUEBBHE5loT/aE7Eit59E/20JKzlCMzesYK9fg5nd1obC0RE05DRoDAsMLfkqgxFEDxJvmJkKmkuMQlsDRO7PzSWg6CHwC/sgcVbXU6XTtzU4e3F/IxXEnbQVQEVk5IAW8rCLn+MtpPSxqtg+k31ax+rg3aXn+dSeczj17Yjfm/OI7Bo2xcshdwWtnnE0oTCRGJNkubiRSCs5u3SCn02qlx02jqOA4Qq0qZznvIdr/lKHISGlCWju6tk5NzsFA1KwHyEzEn/2aZeYyZWsbsz7pFDNW68B79fLsWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YQBFJqxcjAD4CKad3Naw1AV7Bs/ICw4znBreNUfVRrhSvs4OXaWBL66rXjEE?=
 =?us-ascii?Q?a0uZ9mQngXkBczktQ3odPxNHzpdXNGss3BaDFfI9UlLvszBHTwt0+ctbk4CU?=
 =?us-ascii?Q?5z4Iun+sxq5rcEQRkq0eOJtnba17Q/+asnS5c0v5xuSc5XbnkTm521DiVijL?=
 =?us-ascii?Q?7t1xp5cqUDPalDEqmDia5AmAREXjT5TTWaenei6yTcOfbSLrPSwQJ+m1ppwy?=
 =?us-ascii?Q?khf7jdLei1eisj8T2VmhGbk18/2stD7jmnP9yyXsyp3fgiAb559+loHLfs8V?=
 =?us-ascii?Q?la2/mYvlfr9dYY/AnTM87Net/30eNPkUizL2Txo/UTLTB4plT8imrXKGt2Y4?=
 =?us-ascii?Q?5LcVgPV2BpyC0hML9khzvShc8obFbrWt0aym922i8v4VWdIybcW0PYkCO0so?=
 =?us-ascii?Q?fDVuKcx1OmYTb3/F5fqgGCZa4H5C+ZH6I3I6mMtI1QfAM6Mu+B16JEx+K/kb?=
 =?us-ascii?Q?qoHN7OntF+W8+Y9G2Bg7E1zbf6xQfayw/2iLr8tnmGb2k506n6pyvq3i+cVP?=
 =?us-ascii?Q?DXphTXuHDcN+87u+ZHUw44bk9o8agD/+akpBUyLg6/RTaxSblcVS1QYFWfWh?=
 =?us-ascii?Q?a6P+YjmWAA8HdC2vdhKlsN2nOXw7OcVAuD/7EDIZe8drdSDSWxIAi+iOT1aS?=
 =?us-ascii?Q?GBWIIkVyF+rV+V0z2ie0IpC+jWiOvf0YuvxAT6cgOJ+RPJfya9TCLc2zR+jZ?=
 =?us-ascii?Q?JQyOgYdiYDIeDRaFvrfylqYR3fR4lsQkO2ZEsinIbVWy4aq8hghg7gjaReQL?=
 =?us-ascii?Q?9hWH7MyJ3VDUiAgQK6An6XbWfQ3bfcBH23XdyNvXuLuWQYfyo4gFXnuQ0L3q?=
 =?us-ascii?Q?GSZIErJXpkDVUQTpP2JiHoywSphaCaImXIzAk13gA6IfAY0NO6D3I0wYs3Yk?=
 =?us-ascii?Q?YR8a6FlxvhNmVs1lHZigeY+u+1+T1rWxq/o8ISIHTkztmkw36Pkr66r0d4qo?=
 =?us-ascii?Q?qBafXrdReExV0jncirV2TjgK0Krhz9SjDFrJNBSDtQksxZlJS1JdIYoHqjgi?=
 =?us-ascii?Q?cfTM/J3BlSeELgnINHkUzT6zs/r14xoz5X8LzKY2CJFpCzq3e31HjMtdXMPt?=
 =?us-ascii?Q?HAS8V0WXUux5LNLs0jtiKNRyEMYdLNFmwX++Rvee0kFf/xSiAcjx7fGrIseT?=
 =?us-ascii?Q?ZxB88t8YYWLfGko7Ni4QYirOsGwYFV0tHBuA9CFdWF5yUZ4/XIsDQe84wh3q?=
 =?us-ascii?Q?Maga3ASIF8tDaybidmUe0oOe8cJy4Owl5J95YERYvnRUAGIjEhjVjQdVAJnO?=
 =?us-ascii?Q?OYETFTe+MYF9NgO9XLpJ3lJ30jyGHBsCCQ3vKkHW0G3stafddXS7RiLO17EO?=
 =?us-ascii?Q?MreJQKB9LZl257aum1SSdTKHNXz2sgDyRG/jWnWCYWAknu1SYe6qN+oROR+V?=
 =?us-ascii?Q?/jNKXc5bpk9q9JJz1uIgPjqi3oTvNXhrfISJ0sdEwxHGLbNRRFDXwbypH21T?=
 =?us-ascii?Q?PSkPP/9gzsHLiwGRuRJa10+4m9tus8P4GPyfFyJLrsbJ09UBtayEQmIGZ5Ao?=
 =?us-ascii?Q?NWbsodJ+FLjD66qv3mFmtK0hWwWBnMcBFLscE5HcNubqL5HVOg71oupNt16s?=
 =?us-ascii?Q?j7jqC9/LV3ZT94N1n/KjX3KoKPY+vRTTRdndep2rZ5gO89YiAA5Jzyu5Xetf?=
 =?us-ascii?Q?pI3YE6Y+CbGX2zrzoBazN2n0gzVzgcINiHLcNVTyjMFA/q3xinD2026sq6h6?=
 =?us-ascii?Q?a3QhfxQLhp9pIRh2oZFTnam3abhNp+IHfykEsg+BLJrCQbNPz9mt/MZoDzSk?=
 =?us-ascii?Q?mjmDwkgMZlg9tO7K3RR6IJbc1g+tArYeQcQ/+2RQ/J3OBM94bVu9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb353b3-3cd3-40fd-c6ad-08debaca74a2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:59:43.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pnVL35wYusDxhr90Jl6zjC2Jvhv5Xe1V8MHiU2+orUJMTghWCRW8RltaxkBq4jkSzA/2odZXppZbCxyDYle1SM0W2mlf+tg4r1iMtuKpdqb1agLntlQZrvEk1afalgJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15186
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14743-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_GT_50(0.00)[104];
	TAGGED_RCPT(0.00)[linux-mips,lin,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 324995CFA1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current auto select format start with the highest priority format and
gradually add lower priority formats one by one, and search matched
format. Like A+X -> A+B+X -> A+B+C+X+Y... (a)

But in this method, we can't handle format if HW has some kind of
patterns, like A+X or B+Y etc (b).

Current drivers are using (a) style, this patch switch to use (b) style.
This is needed before update auto select format method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4619.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 192b0c3413968..d9c9f6b200284 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -783,6 +783,8 @@ static u64 ak4619_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
 
 	/* Second Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
-- 
2.43.0


