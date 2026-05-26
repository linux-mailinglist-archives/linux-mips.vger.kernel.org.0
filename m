Return-Path: <linux-mips+bounces-14752-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG+MEE8AFWq0SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14752-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:07:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6B5CFBD7
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 828FE3006B70
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252C82BEC43;
	Tue, 26 May 2026 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DAUZzZKD"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95E010F1;
	Tue, 26 May 2026 02:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761199; cv=fail; b=hzL0ZyE8z48b5tpHNQfhe+y7yf0Xe49yFotAfrdr2iQaCtqHFjAuRJq6JKaujoRZch1BGsRCJx6OOPnNXjTfAt5EPyS0hkwAr3Kkc+tF61k5iylKXp/NOZlqoPUHuDQmMXpdKT7kpciXTpPNAQMN5I36eCSm+/Nk1nf6f0S+cvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761199; c=relaxed/simple;
	bh=hy9MoN58qpYKbf5ot9x6Bposq+9JQNRa35CW54KufBE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W5q9/V4nQiDbGIzHCra0WW8uSOO0Tf1kL1TFdhotHm3ovlemBQcqL3j1wsX845zEPD3rLvwNMWLDAxgIYboh4lhcGNxY68RpPyhXXCV97RrqVb5nGfIFXs3vNMHk0ZpbGurX7Z7wh8VIxNgVjUErOUOle5mBsVQOjBkhO1JYgBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DAUZzZKD; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7Mnd+BAw5qpSU10juBV3vUSoKqs69VAVO8IQTBjtXX5uHx9iwxOhUT/9+Q3jmzdg6v8q0vhDaZg2qaOiWZeNiYyd1Y+c6t9L3nub/ONmv8sg4GLzGcNAOYDa/kf4cHW58uQEkz/kCOYIdPCV6wH4eF0gIO9zCa1S1kxNv+tx1VPw3J8Io+LKeYzyBloOEoZyS/AUv+MVqlv8MIsidZrp3f3841zgk/mO1go9ArVOopTh9eJ3wJMnbeTjebtMZyEtlzwlKEhpF7U9a6gTVIpwNVEujsSHHzjUXc7VBczMJ/IXmzRH2GaXZLxh47MKY800LE6z34HZYLFz9I/O31kig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERKTJe1FatECrL0rizOYTmx4lD9zTFXssTWxWwOIJOc=;
 b=nsiql2h4QMW9UyhtNIHTpwV7t7AumBCW9V4TiUkLQS6VR/sh2KJ7rDcnMF0W78HJu1ukmiWCNT3taon0LOORjHRT67ayetCmmNamT/N7HnfWrR0c8cyeGq/1PPdUsKe+BVdMzCjsFylW4ty26njsqAbEcSYYTopoTLwE2nqNRLUw0aXWK2a32pbSBFi528Fsm2er6lAX2MALWOq2FX9bVyeNzcPMWFyySB20an0bayO7yh+boZaRgZlzmIVh1J0aDT0+s4cCrWmJ5pWQhp7vako2wsx9gIgjWtK9e+VGWYKN3QA82CyjFZQsemQevP9vSFC4i6aGkREqTU4wZRLYvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERKTJe1FatECrL0rizOYTmx4lD9zTFXssTWxWwOIJOc=;
 b=DAUZzZKD6tzgOMjs8D1NGu0aqxlnWCut3ajEAyRy0GjUxJUUfNry92Wt3rO9/5OrhC56/RUeW5pSB/yrHaaHubES3e0QZ6jacTWZXJoMWiQsUMKA6Va2gKyqXO2yF0IcO84cfdGqzGBzyW3rvQWEQh7LIv9ngQlJFEFU7cGgLUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16102.jpnprd01.prod.outlook.com (2603:1096:405:2a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:06:34 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:06:34 +0000
Message-ID: <87ik8aj55i.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 14/83] ASoC: bcm: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:06:33 +0000
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16102:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd8231d-139a-48cc-aa6f-08debacb699e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|11063799006|22082099003|56012099003|18002099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	F3etafL29fhIFum+HZ5hZqmCiYmiuwdgg6fnS80lGqBQwyEn0DfZ9wmf5TXxH8K2CUON7gW8ojSJFSQr1ka5lfrjCMQ5SPOxRA8FFfkFtl5Hgxdg8FCpLFxXFjQkJXMXIcW4clehTuA7QRlqvMvsLYw2v3cC2vs1K9A7S6Arc+kyX4eMKh2Omiz8nHfQ6jsmMSbCzBijCpeeAeXYzsorpdyCpgEKhYTkmvocQTcrLvM+brnEOaSyDoCsMryzZLwY00uYz7Ify5UKQUDxXLhWEPgU92wkjyAV/RxVGxb6PC7H8gwVf6zJ9ilv/ZyGgvR9whP1E7vtS7AssUr7wGZJ6k1JRimUKsY4At074mVrenLDXpY7xcMU6aa7Iw1LGBshxurkm142ThaZCPR4kEcQ7eDmcaby9KriOg+XRxXdlDT2DE8j3jyToBPe5IVo/u4eOuMOlK7Ypf4p1WrdREcqPrgzljsKQWdAYaV6AbOf0aZfu8fhYzFLKjkZhGiMHwdsUC1bJjlOacOptUgCZiWbgzzRnFBbbp5Z8fps6wxy79nT3y+JCmmPCQf8yuOqndrJp9gDvefolxgKwctVv4AQFs7yiI0V/fNZRwXockgnUV7yJE33GIFxmoV/InlAHqYRRABv/iEMjjY4TMQza22b4erx+DpbfluHf1XvV1wgsK61NBkJgqeJ/FyeultIvbyq6b98muLV/jaR+nrRtC3qMnGneYik8Uf87o8jyvmDW2Qg3vablwgwPvqP2xFMeqZoSCSGKGt31NM7JdFW+zv3DV2orgQ9jFXKuUHyzCKjjDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6b9Nb8KlhdLbuHgGqxXjkR5pGRIzboJh99GEhfjnXWHdFmTvjQSDYyn9W980?=
 =?us-ascii?Q?TIzG8/3qVGLN2gGbqFMAVixYl7rMDVndVAHT53eLkwZdLco5Xu7WZ3Z7H79r?=
 =?us-ascii?Q?4ISn/45+hnv2aU+c0zABBwz8D4njl0JS2J6iBgACN0X9p2s7YPOUK4wkOda+?=
 =?us-ascii?Q?qxssb14wwS7Fb7gImK82tYZN3IibcwCiJ1jmhurj0erA0I84VvZikFi5f34+?=
 =?us-ascii?Q?brEG7FHZs7piBZn5oM6I9dnAynypcMMIVyEU/NRefAEIEWPl9WKOA0rzFbeT?=
 =?us-ascii?Q?uKov67Cg+sp2zfdiK4WX7yX7Gsg+/LlTudWPmqIIS+klI3+UI66MDn5bbj+9?=
 =?us-ascii?Q?QxpslaRZDmsIVTwlKIl9nbtDWJLYXCLbiGVMcSU50ve+3KYnEe8mr+zD5uz1?=
 =?us-ascii?Q?QzGzkRpY0oTkDYfVmkpBS/C9pwKF1omzmpL8iS6/UM9+QCK8pVVkarmiDHl5?=
 =?us-ascii?Q?HynxL9OdS5YV3vJJr5U8jPX/PA5dCh8XPXnRgJrgGxITgkkrJZvdKHzZja6r?=
 =?us-ascii?Q?28KQCjVtNbTcf5Jhnuh9EgUwSlAypIZZrZhLR/5/uGbaTMfUZl9vPdRWcmQb?=
 =?us-ascii?Q?Q/E9pQaPfsacqCEQMzZX04UbAe/6HbXuhnrWRstlltxi9Ab1AOARMCp4Mqkd?=
 =?us-ascii?Q?6nMMaIyb8LHQaPSO7eMVCdrSFxCbm7J22sA1gswxrCocT0MqQiC+QDs5xfXM?=
 =?us-ascii?Q?7Pe5tl9/fF3Sa2caZpJ9iU5OQGReRIeW7vZkLTQRvXajxhB2RByVwftA2CrI?=
 =?us-ascii?Q?ayOvHU01GMs4D3GtrhHgDHk7D3fg420FX5TqtaxeTaspcLgWfiNh50TgvwjV?=
 =?us-ascii?Q?b0n5QDC2RfO+RHg2vjBVJ9ht4mrq8B58OU+/RaqllIFG8ZnxJ1AF8dV3fwdD?=
 =?us-ascii?Q?JGWptiYfFZUBIF45afaXBiloB7AK7XPcENmRRH065EeU8XufjGc07uf17H/w?=
 =?us-ascii?Q?nnx5rn92Tv9r99SiMOtP4krjf90oPRE5XC++McT7KEIYXBzweMsUKFVgmjKq?=
 =?us-ascii?Q?2MKlzHLEcWsmjdW/PdoYF2qhPWkJq7bJexLdJ5ahNdvwVZSAlyOp5i+BNYvd?=
 =?us-ascii?Q?C6Lya+1TL5hSW1xjLdg6MAgLD/ZzE7zOgUKvYGnhTI5y60m1L8LfFyP/cHnJ?=
 =?us-ascii?Q?NvZwprgGgmlhGA0IX2xQXBquXP09NqEGkatPN/Yd+My7iN7GWMBPMqV5p25u?=
 =?us-ascii?Q?JafDaIseMCfVQjVrcICe+HzgCYHeLN5I7zhIH4AwFGdxyNrRm8g06KyO0dY0?=
 =?us-ascii?Q?HZhwYBqsNS8HHBgbOdBVIGqNhpVmmRJtqkfwRWO8CUTwjaOLwEA6TkkZ+vEq?=
 =?us-ascii?Q?1rc8B8r4/P71qij8zeigCBOlLqnQh/zOAf5DSVYUp/JSS9VAEXbuwMO3k43w?=
 =?us-ascii?Q?2W2fokHhh/skiH+6vvL2521f+voQJTMTC9ioTNpL4wOkUk9jeoJrUsEZ4+f8?=
 =?us-ascii?Q?MVqnGhPrDc3/EqwfAwS1RL2/L9o+dafyQPqh8nhKeu+lvDmMg8+1tzqhk/8p?=
 =?us-ascii?Q?FzY+M6G7q5HdGNgifjkPdCnm2DPab+mGo6weySyA7/FtHpNCg7zE/Ba62R4m?=
 =?us-ascii?Q?gJavMjyeV4CSXdmOBGH1IjP7gzUW/W2scS14BTUc/7QPoKu9v/cgxo2nK+1p?=
 =?us-ascii?Q?baBO1F85pTCkr0u0zt4N2tE8LRAqDHp8wJqB2eH18NW3V0rejOgorK6TgcSW?=
 =?us-ascii?Q?6U2Hnd4xSWLVCKpZrOrruGwrAZCWOQ2HYzqVAFyVrjWTDa9ci+D3r/cTU7AF?=
 =?us-ascii?Q?bHCiSQZNXWe2gFa6kJzYjnJd1h7FK+zk3zpEpXGGoWnJqUU1FNKE?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd8231d-139a-48cc-aa6f-08debacb699e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:06:34.7466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJvSqRmgJShYxJKKvUlIabPEEaC/9WrWAAHdX1gO9aJnTCbUGYQSJLS40cqInLsvOHkO+LKuwMLNkXH8Yt723eUTh737Vbm0Wpw3fffJJNUwTNkyYOq6Hh7+tKU8Zfrd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16102
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14752-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 98C6B5CFBD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 13 +++++++++++++
 sound/soc/bcm/cygnus-ssp.c  |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 87d2f06c2f53a..2089778282541 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -748,6 +748,17 @@ static int bcm2835_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 bcm2835_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.probe		= bcm2835_i2s_dai_probe,
 	.startup	= bcm2835_i2s_startup,
@@ -758,6 +769,8 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.set_fmt	= bcm2835_i2s_set_dai_fmt,
 	.set_bclk_ratio	= bcm2835_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
+	.auto_selectable_formats	= &bcm2835_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver bcm2835_i2s_dai = {
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index e0ce0232eb1ef..7eeda16c7f4b1 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1133,6 +1133,11 @@ static int cygnus_ssp_resume(struct snd_soc_component *component)
 #define cygnus_ssp_resume  NULL
 #endif
 
+static const u64 cygnus_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.startup	= cygnus_ssp_startup,
 	.shutdown	= cygnus_ssp_shutdown,
@@ -1141,6 +1146,8 @@ static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.set_fmt	= cygnus_ssp_set_fmt,
 	.set_sysclk	= cygnus_ssp_set_sysclk,
 	.set_tdm_slot	= cygnus_set_dai_tdm_slot,
+	.auto_selectable_formats	= &cygnus_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cygnus_spdif_dai_ops = {
-- 
2.43.0


