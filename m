Return-Path: <linux-mips+bounces-14753-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP/7JUUAFWq0SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14753-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:07:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D35B5CFBCF
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B3AA3006901
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A182E229F;
	Tue, 26 May 2026 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OXAQSnge"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1CE2E1C4E;
	Tue, 26 May 2026 02:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761217; cv=fail; b=SzrkqpZrM4/WdOe8EM7EM7f0UwmmOdvPdZeWfVbOfqr6NXdfU5a8ZMjdY/FSM/ulO3VggOesUCjCMInlN/8jzqq5F2HKpRrIEJRvOc3p3bnNhLOyOAJTmpbPE7Jb9urRDwvCSlPuV7bHN6uXjtpHWZB9ZpLEOCKtDsNH7fR8mh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761217; c=relaxed/simple;
	bh=/KIM3vhMOBNiudf8HURkvtAViN4Zbf0HKDmYepfufL0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MWgF2lVRIq123SAS0QY5AJc/na/Rs10KZ9j2X9SJCwdUlI+YzbbbFJvO5YFQdOkzlsj/DEFOcZvonwceFJzv9a1YpSXrQdEw1KQ8zK3nAf7J0g/tlLto+mKLzpSt3s8a7DJl51tdxlF6ex10PlisDT6smrfGbk7OXqztuBhtKvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OXAQSnge; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIVGI4ztAbc5hUtA0K/FMonIxRtBt5J6D1Y0aTM1vBR9HpqJYrqAb6OCg8iGJcCphcfJefhFGFbOn853TtYqKNqnWLilDx4AWEPtXwH8ikWZWPaXBLHQB0DEdyWm12DMfSpiQ4kNx+NlfjRD1kerta6hbugO6GtOhAPwNZL2ta23KcMgOgniiMQWnHHPJm1s1I5TkbdZY7mG0s1QUkeZWbkBXN+0v5bzCKDLANUQcampmbk0Vy4QmGa/MneDlAmEQ+U6BYfItocYbTd/kscHrR23B+RkQWnKm2jZKPHnungBnQLrzR/5uWtE93IHlXoZuxpsDzz+qUQwD+oAE2TVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RR16Ei8NEc1h0lyNrRayaE4Z1/geN9C7taTQJNefpnc=;
 b=URj7o2xrAgn26rrg3ClQnvIhtS0BZvqK28WzB66YzyhRRePzs/clTn8yG1IeMcPU/EK8Y+ivfH+5PizxRncJb6EhU8IMGG2wap6mZpfKm64sD8Sd+J0stdt7CFnuGRhIjuwwVmRGDkIb6IdRCC9RWK1+bOrdaoe17/Wtpp32WAi7hCeKbxYOEAdwyaOF6Df6e4osBHxsWQr0l/mBU4NGfDwrmr08E2G24sIMQXNaIw3Hq1c3OQ6mVymzVDBUaqOXaXL2TpzkuJb+xk9qFkIQlv9ulDN6K0cRKKWC3XV5TUhRhCQWAvX/EuYyjSZB6R4lHqm64TdubByZ3ZCDBxM1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR16Ei8NEc1h0lyNrRayaE4Z1/geN9C7taTQJNefpnc=;
 b=OXAQSngeA0EnBW9u9Sb4pqqGglN/baM3TCnCUJbULZFM1itIgiLL41DAVU8Tgw/TbTfGRCbbrAWb5qgFQINM6IFEN3UfXH7kOSKZ9RT70+mNIcMdNz0nZ1SH6dicXdEHcYINClrO2sWRMPA3eaLcsIUul6vnOinrZ8hLPZ0NzAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16102.jpnprd01.prod.outlook.com (2603:1096:405:2a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:06:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:06:52 +0000
Message-ID: <87h5nuj557.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 15/83] ASoC: cirrus: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:06:45 +0000
X-ClientProxiedBy: SE2P216CA0187.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16102:EE_
X-MS-Office365-Filtering-Correlation-Id: 3933c525-74f3-4f9a-3c8e-08debacb742c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|11063799006|22082099003|56012099003|18002099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	G3oNQItS9jTkKPqmWhrACEmk/8B1WwFePx3Y+pNcOBcvz46qxz+tvCuaWfk7AvntYbH+mqgB0emlJ1vNCOvr2uGPqp5GZch576SbvuaearEGs2R0WBDCOgQwD/QJA0nOwqIVUX7rSX/6AvQubogG7ZeU0XAr+f68WwjlEYwSkAJiczmNavTIqSTRrUU+dAHX+rx9CbJQip7fyBjXvjzuGZeOJbHbYliUwdiFLJuPyeFewtr/gL8ycR9zQ6bB2NL53RnnqDEb7CEerPAUBNDJCh6SawxE9nLR0sQ6rkgf2p6Uqdg+QkxVsdGMG7T4bUiTQCYbnP4q+6W0zkwox+ap4hHVoR7iOYScNOgsdMQrt0GsHvoc/Y6mkURbwYdxR9lTS3K1NU54gya4vK3ZOszoVktUA5RFPbhrUQHMIW0pRYlKiUBKLkkjs1T6D4MOX7g7k0PerZB/etu9yujiCvVuJGGGGSAVR4pUVZdxtI5oDifQDmA1prMTE+ZoQC7dT0Zw5mG7JRjZb0SBHkJMDGVfzE6Dgat20aZA5F7VHg1DdUI1o61S8HsVX9cVMs3sZZ80YO4ty/hGQvHF1YZN7t2pdoL4JyIewYjIqJJiH4sBVlTCoz/WH9RvX19Nu5YQGT9uxsHl1uzHhpI0oQeZsIRzEZwRYSB0q64m5m2/7DycajfiNisuzaIHQlMoycSHCmxu9/Sv1r8AU1NI4hTrVd2W0Y+RUdXGUnJhwvqmA/Outj8FRj9Nl2819HQNvXSXFnhQE9futCYYxq+Dh0GMNtI4mxKsYV9O/+HaRmc4X9zW9cA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zlezXNJhvBjr2iMHhsuGamvR9h2oIVnV2FKCRJideIg5oIASMjYXt9zpRvhI?=
 =?us-ascii?Q?/o+FHX67yzV3NZhB6y0N96z6J1SJ7gIR3IIqriEDZMGAaB7GBaTvz53/ijK6?=
 =?us-ascii?Q?ffSm8SzW+5nDU8J/vGvb1U3iaval2ztgSt8oPPhChNAiqY+tzy019BjsCrqH?=
 =?us-ascii?Q?Ls17Wji6w3ChVTFhXvbdpOm+fTcmCtqYot2tCPgHTnv8t6vWCMZXY+dhHGzz?=
 =?us-ascii?Q?aW538r3NSld+AbPSw9VfB/oRKTM3IGiLfpvnu56IbuIWkZ8fr8IEd+86qlJx?=
 =?us-ascii?Q?SMQY7mAL7yYce3ocyGvWBUeQx70vEeCRoUfN2W4MVnI1ddi/7vBmRgT4e8oh?=
 =?us-ascii?Q?JdZpCOpTRhCq2Ha/aYqSePqDo2aMVUC9Adv5+pBwZdUEYAXRnSo/nRCor5Nf?=
 =?us-ascii?Q?nvMlE8Av4PLwZfdMW1sh2y8gay8ItxZALz6c0LHv54ffxtoK9aUNJjDq88o+?=
 =?us-ascii?Q?TcP4gf2YVHaCjfBwacb8vhd9XqCc9ML1PZfBDU+Tr0fBFGpWz8djHywOq9e2?=
 =?us-ascii?Q?EHCGChfMG6CnNGvb+l9dVXe5BhyWUsvHjN9H1KnaKKvwFkOXx9/k+ky9I4I8?=
 =?us-ascii?Q?svzSXQ1xBWDhVZ6kGphk8Dea37IzDDHfGh4FxzF22kW6EnPhZzdwvcFdL4PE?=
 =?us-ascii?Q?lslxiZuitsq9OYikaVb63WI5Xtu8gTI8tCLxeNLD2MEx2+zPvc4OfYciiCnx?=
 =?us-ascii?Q?qhvwVWH1dY2BJEtFNoM+foZFBvRcJvfquBoR+/c1l9CvmWonDtut4ztI+vQs?=
 =?us-ascii?Q?N+sPfgbhd50pDHnsUoqS+Mi2OeSmyljrHAmMS3QQqsNq11I5/LqN5yTHnU+2?=
 =?us-ascii?Q?gL78hUIe9CgH0GzzO/qTkTopZBz0Me2Wy+4O1ZUmfaDDRn35bu65h9+E0dTv?=
 =?us-ascii?Q?eoZMudULZDGAtrLv8HxGyQddJD2qyEdVdcfOXPeRO7GF2xlktmr/0xKbG2qj?=
 =?us-ascii?Q?1ZT+DVEvMrN+u9kKJGwBqVIqVjW9ufo9czz2xbTIhs5vsVujLwFqbAB0aobT?=
 =?us-ascii?Q?hYw+CltW/3rS3RCK879UyWbmPpOFW22TPVhOHi+zLtmiWCbXwEvEGIFT91Kt?=
 =?us-ascii?Q?1mA6b2l2zt8WMbofVwDwLqVK4BUyYf7+Q1Wc3ofIxzl5QSu9DGA+KCgwkfNj?=
 =?us-ascii?Q?F1Pt0kRYXNuGlwas3XdqN60f5gN5k6vIku86LWOlFA9EPhY8zGU++Byrwmny?=
 =?us-ascii?Q?WiUnBFKoIjG/G3UtSTMNLulrdeXI06NtXc5urt5ggyMTGewN0p6ksNaPosOp?=
 =?us-ascii?Q?aKplVB6ZUH6LuZp73idM3QdYzE0qkGsxjnthtORDs3/hmvQ8ScqnnI9QEwIL?=
 =?us-ascii?Q?BKHdssrneXvQjMICLJJQmfv0ZS/oTvVObW6t5AcCS23AS1MN8Zd8MKUTbbDY?=
 =?us-ascii?Q?JK24+/Cg1UEIjUQEhDIwZ7JvmQN6TvsVPZa//DMS4gGVnO8fxY4wxGq+AoIw?=
 =?us-ascii?Q?Ev74QOTd8rvqLrL5N1KKJBujb6VCjLqYpFJyJGqdxlV9V9iystiAoGNWj849?=
 =?us-ascii?Q?YienSGTnZQXWNFb/lJabHQeep/1XCjSjX8Kxx6UouuwdY85RW6wuCGIIdFYm?=
 =?us-ascii?Q?IRQ6QwQ1QDLzr3ntXrQo4ADTztXlLCvNBBai47u3diLEM3HTnYSFZiguQy5k?=
 =?us-ascii?Q?NjVs+Vzh10dInTDtoi7ZcCPGOgyhi384G5iM4+BEWUtut+0WdFCeG2Hwq3fe?=
 =?us-ascii?Q?h5x/WurABn8BuydkQJ+tdMbFmn049pDqyyQQzLJq0V21rxE0n6RLU+C/utdl?=
 =?us-ascii?Q?gDO5y6PuxWscytCijLNXKsaqZzcGtKysyArtW8Mtw8a7rhr89i1k?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3933c525-74f3-4f9a-3c8e-08debacb742c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:06:52.4710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHlJSeS+WP/dXgUi1mFI3ytgA1SIy2UlK3B0REaqy8KcAQiRelwvwk0yiv44Q2y4DqHz5Ld89p3liekj/HjI8+CxiO/j8/fSnGbFapjSy4zI3sCw8cjXXREi7SGJOQwE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16102
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
	TAGGED_FROM(0.00)[bounces-14753-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9D35B5CFBCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 5dba741594fab..8195ed7c6dd69 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -401,6 +401,15 @@ static int ep93xx_i2s_resume(struct snd_soc_component *component)
 #define ep93xx_i2s_resume	NULL
 #endif
 
+static const u64 ep93xx_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.probe		= ep93xx_i2s_dai_probe,
 	.startup	= ep93xx_i2s_startup,
@@ -408,6 +417,8 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 	.hw_params	= ep93xx_i2s_hw_params,
 	.set_sysclk	= ep93xx_i2s_set_sysclk,
 	.set_fmt	= ep93xx_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &ep93xx_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define EP93XX_I2S_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
-- 
2.43.0


