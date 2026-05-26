Return-Path: <linux-mips+bounces-14751-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDPNBBoAFWq0SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14751-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:06:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BF05CFB89
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48E4E3004631
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510692E091B;
	Tue, 26 May 2026 02:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QYlsqPpj"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22302E228D;
	Tue, 26 May 2026 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761173; cv=fail; b=Y9T25KekWpC+gZ32NPTYhndaxM5pywJNecFfIOSZ3gsok6n+qYGijlbXlJHYMhtmDwymz59gYcSIRL86Kv2bpLB4WNbo46o95/+fAafCezq/EqUW09pSpsH+RAJdHSD9/wz4DnM9LDbQ0EyV7UNn+G+RqpMaJKSXnRIc8XlowyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761173; c=relaxed/simple;
	bh=4+UwookT1kl0cOOoikvOSSFzph/iCvxQtXESofcjL/U=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DJ6REwfpohv64xOtUXTEiO8mE3BfwJgE+p3nob8gowy91upj7NdyzxaZh/2WU0jrwUdaawDtYzKdHgvkN2TSLNlpzD6ZCIXkQqT9RFl5bWpd7wrQm0OyAWFq0ylbVCKIVW/DMboYatjinY/rIYUJD9X0rY6v/uRFyovWozNMDAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QYlsqPpj; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZkl9lx87358jfImvdw3kmiIFjEstcbvaW4l8r+/vrV3My14TuXO1kvyIYgt9YC3YEM1jSF2Cjsp9WBtyKS5Fco02ONgIyqhgpuHBr3gjLzfRTrBM+lX/NbyXe8zUjZ1GDqYAa3WozUVBYXhe6G6o/URLwi1gwo/Q/fXKmj9u92Ib/UKoeGI7Xl8YMNgvPIq0tH9Yuzdt+HuabTUSm5tVwdk8hsK3PDzvy7yPSAetAmYvVsAx0Eg3WhKPYk5aL905GBT4hYI0chKYT1d72AiwV8R8V95Y7PbN6STt/bT+ttQGbzYFnVDzpHqlKlJ6XfOmMX6HPncS0mkROLFAn6uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrQYqYdY3f4xnEcB6xflbiDbBL7aqfxVZTwiRizhWdQ=;
 b=EdkViLeO6x321fBsbRzSVx2aeCjtuGEqgR8Q1GQxdoTPA9WFot+D2gHhneUZTIUkL6eceWLYS+EEO2kyo0Exvp3q756dxPoA+U5K6XUmFjTp0uaNiHRkbKfTQwsHAQhZQKLqlglt+cxAIXHlO7CkcfFDaHRPf/yL+mwShdFHmsY8xTEGnefuStHYx+D0ng72OzgcyGdgnbNIkdRsz9+9noPehQaa8mzxNvpcAScuTt7id3Ar+caMfuaXqrjXjzZkZOiXgMk1Xtpx4DNoL/aTSYBdJuILqkNN7Gro2DknBRr3gomtkDIEPz8ikctH6TvqmBtYnZtwb2akeNHNfSAWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrQYqYdY3f4xnEcB6xflbiDbBL7aqfxVZTwiRizhWdQ=;
 b=QYlsqPpjOePfMTg05saxSGuT8N0zTCk2wto5nsE4SL3EUQHH8ckPp6h1fU14V0f9TxUdt3RSTX3b7EaxAJbc0aTPZkUNY17SveBv4dNwnGwWLEwv7FFD8uTixzrgSdtJGQS2hraW1zNmzGy/rc9VIMIcnHeHSDt7ZNIk1+cTsW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14087.jpnprd01.prod.outlook.com (2603:1096:405:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:06:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:06:08 +0000
Message-ID: <87jysqj569.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 13/83] ASoC: au1x: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:06:07 +0000
X-ClientProxiedBy: TYCP286CA0317.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14087:EE_
X-MS-Office365-Filtering-Correlation-Id: f074db4b-e678-4787-b32a-08debacb59a6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|6133799003|11063799006|56012099003|18002099003|22082099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	aEFrEXUhdN3GfgRjB8HNXz6HR7LrI44Kx33+IAHZzbAgqsTbFrXpCKDlEh2N9y1e8XOvKjKJ6CnnsX5Z4KrPmoyKsIvspODALyPx0Wlyla9gBeVphJLFt+PDBrqrRFUgEsFM6raqgeTghjdu5y9OOSa01s9wZc2Xao3dZ5lnOBHrrNNam3dYdg7s+pnaljeb5ke983PywiYCYn+DFRz2yUhDr3RFm2oFIWkQZAVQdR63YE05BHNr1rWVR/VKi6XIixqgDmzSPBiVyxyE8E+tqV9TpKrha58YIJLGKRZ7ygNF8z1+ytsSZ18PXZ+GFXqVhyDAr1NoZeuBe0SJNWv9MoANnA3YVKwwjlnxV1lx3u/IHXecjXWQCtS2qWHY1EQsDK4p0z8403Y1rI+h/DJPl8qDFZtac/keXRvH29Xd61weqBKgaU0nj+DXR9C7Bo/6L6IGMHBtZFpsnXpDmoyHid94/fShVU6kyiGDovwAtJyGjKXC4d+KPKPuv1pDqSq9aH2hOB4cKBTAaUwA7vA0iBT9G/pD7OWe4DwdRGllYdtBcUoEmDbYL/+kzGCTbkTsQSOYs+PwrY+Iuo3CgYDfqGe1MVu6wk152kwhbfGHjXzwC1AzPh6F8/z08DAyhbKZrg+u7zOi8C/R5RUxSjGmAiEMxz1kQzXz5HKQBqxgOgUuX8zH4oeAyBYTXPz04h+WDdedPUuowip6aR6maMef/FxwJ7EUQvu7mwURPozoAYAONgbMotAexSbZtQyucIUuqh/viqkt//S6UumRbNVeS+Q176ezfmPz1pc4mXDYp2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(6133799003)(11063799006)(56012099003)(18002099003)(22082099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WW5Zvka5SLSv+aa9+3jyYqceHcZRo+GNb4AATY82YEVAKb2iM/1zluZSWgBd?=
 =?us-ascii?Q?77KPyunDr3FFCbmIz81Q94e4r6Ep4Qyya8ffj2aTA8r6dKec+2VUnrwxQMB+?=
 =?us-ascii?Q?MuIoCzDxWH0BMlfiArxVypYZPORGhHLpIok7kqScxenvSdFPuoK0r6LcIJzB?=
 =?us-ascii?Q?7nRFqGnHJj7ZPYv8sK35qURDGoGAOneKWT5r3Jx7cdqEy1UuxdzH/q+Tljhu?=
 =?us-ascii?Q?FMPIqLQEm4EeEKyfR9xZr/ruYASVDKZGuoVICvZZGDGVZUh612Ad1UYvWC5x?=
 =?us-ascii?Q?Lp8ffWlFuSoVyG+EyO5DdY71Cby012bHEknTPWKf7szYYopm31HAPO+B6f/2?=
 =?us-ascii?Q?bgOW2j8yamI0DwpYA4Vzz7g8mfOYdBtX9QA/G0XAD44r6fMi//XiDZtXt+xy?=
 =?us-ascii?Q?DPREmiOD4tOOiBZpwlUZTn9pbW1D2y0Oy/EFJVK8lL2qmw7D4ObDcnimNWFw?=
 =?us-ascii?Q?KDq7zc0WEZEWhOlmFuiSRU3maDK135hGaSi2XXiyqqrVdsUKaA2AEK+1nDWL?=
 =?us-ascii?Q?ZS0N7OSinC44SfQFA2kt3gFlr1b70Fy+mhJgaSeejAeufvqJDx77SmaXtuqq?=
 =?us-ascii?Q?mRbQbhpBHHR+JMAyDK0+FYl7TdTIdnfjzMYkvF1wNMY6f/RPb8mRkYAOJDnt?=
 =?us-ascii?Q?l44eDGyD9ZEn56QkjL1YBus40hwLbQmCnSucp8xzZTSIugT6u6cWD+B8erRX?=
 =?us-ascii?Q?tjzuPlyGql54vdaA2tx8xc2is4GOmxM7hDERXeowCGtiygwQbEO1HKr6ajmM?=
 =?us-ascii?Q?bNKMMaV6bTSutXTNyE2FTWz9rcd68duMJBo3WMsLo412TXIsMrDl2e1YH2PL?=
 =?us-ascii?Q?s9ZcdCN86DNT4w5I+JzA09/69A9ggBzzToNGl8mqnkbjXQWYcXOtWsrr8V4b?=
 =?us-ascii?Q?UBl4ywg5UALtTWjQ6Ioh+kkQtOrxQINTZl3G8QwHlmMsFkJq0WMNjxesPcN0?=
 =?us-ascii?Q?Mh4oZaDMicUZqIyEyG4mFgmOAjlw/4HvnyufXF0CzD3fLsbrYki5ckVd5qdH?=
 =?us-ascii?Q?glXdWLDVDZHoBqbn6qWX4sjKnptDuTtHSwmHb0tIn2147vH6jR+REARWEEDo?=
 =?us-ascii?Q?KpdOk1WA04xtpu/UFMo1ImNEehNM7+CItp379YxH3ZMMAuCrKR7Jl+UF9Iyr?=
 =?us-ascii?Q?nvBVhx6u12VBG/MGhvL+QYWAgnQm9Z0gZq7s3LGI63wEwO51viX86J8uOHy3?=
 =?us-ascii?Q?oskSiAe/Jh58KP5x4EzIJl2DLfOGPjruBiE8a99kKiyZdRY9rjbQUqzUT/yq?=
 =?us-ascii?Q?HZhC9e6AdQ2m0gQGMfkk3aUkJbh5jd9I4bl539MT+DSgFtWSzE8L1mmEVpud?=
 =?us-ascii?Q?LJXsZ3qhYrCGIX8bJGuUWPTzcCBlEKozCMeHMvMI3SkOG2w4pHCjcxcrky1g?=
 =?us-ascii?Q?ESD2GtJkjmkX5cdYszoJNIw8FikzM8OP0JuGOm1WU2DFOywm3M2Z73OmDiHM?=
 =?us-ascii?Q?umrmChRjjPxoEO0UFWr4HA/3/oluvRuvqo71JcLnT4dy0JwXg+ZIdDfKZpbd?=
 =?us-ascii?Q?G1Bk93y5z0420L2bgS6Sac4aSFbRzHlPlueMWSHT1fjRGRrwn5jqDpEzjw2Q?=
 =?us-ascii?Q?G1fA+0WI7Iy4lB/e+1yF9c3U6I1QwYjEgZBKrkB4L7Peim8bkAy3IqXySC3e?=
 =?us-ascii?Q?7wrMwSfwVHodImkFg+PNkuR+EW6rUjBh41NlvB+3EG4EuosBRel97DbvWfbQ?=
 =?us-ascii?Q?35xU2oTrH7T53WDs9sxZyW7NkU+Zg2PDNANlpnVoow4wRToobS3P0VlPHtWC?=
 =?us-ascii?Q?efZHsAIhGQEsYhhwfnHGY+mIxXGtZJaZqWOfesZ38qfObqBI8IOY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f074db4b-e678-4787-b32a-08debacb59a6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:06:07.9871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD5HCtOZE7foofVNMTX/27XJceWSzxFSJy7fCYSVilb+g+pv8m+hFrAj1pfwUncgAKtgW3iXHMNrwRRFgNTTCMqYti9uOrbpv2ZGA7LBbaAcBdcc3gEIUSr8CPQQW4RE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14087
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14751-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 33BF05CFB89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/i2sc.c    | 11 +++++++++++
 sound/soc/au1x/psc-i2s.c | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 57735004f4166..0e9c7eef9ee84 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -202,11 +202,22 @@ static int au1xi2s_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 au1xi2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops au1xi2s_dai_ops = {
 	.startup	= au1xi2s_startup,
 	.trigger	= au1xi2s_trigger,
 	.hw_params	= au1xi2s_hw_params,
 	.set_fmt	= au1xi2s_set_fmt,
+	.auto_selectable_formats	= &au1xi2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver au1xi2s_dai_driver = {
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index bf59105fcb7a6..72aa5177147f7 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -262,11 +262,22 @@ static int au1xpsc_i2s_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 au1xpsc_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops au1xpsc_i2s_dai_ops = {
 	.startup	= au1xpsc_i2s_startup,
 	.trigger	= au1xpsc_i2s_trigger,
 	.hw_params	= au1xpsc_i2s_hw_params,
 	.set_fmt	= au1xpsc_i2s_set_fmt,
+	.auto_selectable_formats	= &au1xpsc_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
-- 
2.43.0


