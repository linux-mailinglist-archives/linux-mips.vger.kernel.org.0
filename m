Return-Path: <linux-mips+bounces-14749-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCdcB6L/FGp2SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14749-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F37215CFB0F
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEB643006218
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871FC2F0680;
	Tue, 26 May 2026 02:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oBzRTgYI"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C317B2EA73D;
	Tue, 26 May 2026 02:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761050; cv=fail; b=ti6hzaYjboYhIbAQLbIzWdniWbxAwwcVvT5ss772aJWQ7SbvOXDXJYt0pVBWLmQ+dusxATztzaPyRAsjgdLxGDLMg4eXfkfYDtnYsfFl2wtNA2vWEacqza/nkeRJ6KZpfCh1J6eW8jXOsocZTt2eQshwoxikU8nwFsMPF8aqHUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761050; c=relaxed/simple;
	bh=z8uJS9cM+9ybGCdQyT3wFVSCeKgm+IXs6kLft4ALgf8=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DOH+34I88899d8hgK67oocUmGuyuJ6YQf6LkvjgqJv4OLh4jIrcippbWEP5pKJjf3tEkQjC8WksbDUi1wQV8uxkgWMAH7H6B7EoalDYwNFI4eHpzWBEyisNFGoPRqq+ag5w16dM096Wpfb7JN81D+v+2jknfJcnLbAkVC2q0GuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oBzRTgYI; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdSWwsr8XhhXhh86x1NfKjnQb8lMjf3yev9OIgCLBgPkHe3KTivlbiJAm3mKC/W2SN2sdL0dYsewWvpxkgTbduI9jy0D3FDszKldlQaITEtNvpAWOWK6EfR/Z8rGe6R6cG6bg6ApxN2kaPzKUzIwhqRiY3U4a+eorzVybPBR7+dUexQEVQ5S4F3vuKBIpvPYLRcF5BnxzERJHZdzBUjYCjfqYWFWcnSiUKeud0vPFQ9HeEeDmfxvgHGSsYNuasC9uYxbuxXUNYdnJNT51tzt0R1vMLoWjNKsTYW38lfTtigLxaaFZVBZNhy7RpjwEs4H+cuSMLzyEwvNJtbykDcobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSOG6MOJ3VumsWrAVPDFhw0GnvYTsDbV/H+xVDtnOyk=;
 b=dp/trwV0tGrmuVlCUfV1WecGc26w3ulURQh/S8hY81dOeFWb7lT1XwEB9W+uIr/XKJubLp7/eTuu4+ecIIAUrflhaQCRa11S6/GUsM3NYwu9XeXTdMioUUsh/lmwhneOSBIE6C/s6Cb7yIUhQgle2lZxp6iQOQNteUk4nXWVrXbM04ws2fgaFzfngvCYiEQZ90ZzieWNRDP00C/LS3pLItyy1sM+xsHzEHLEcyz4C+mjIPf5ZsEjcXtrA9fI/CxgmDYhE1dTDoT0egxeJKvHtMaCjlpiP0QCezf9j6Ej5eGMNXPgG2q1zieK7Z5RVoC6wL9VZ5z+/lZbAQrNPOUW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSOG6MOJ3VumsWrAVPDFhw0GnvYTsDbV/H+xVDtnOyk=;
 b=oBzRTgYIWQPlUaRvagO7Fk19l0p/noJTUW0kHrDx8swizlcx0t1kfoPI0G+P7md2wivHyripNAylbRhTYmJvdZjrxyYxRa6m+1iS6TewIHDvYwykCj1wGBCcfFBEpOoe1LbP2cWJM59Eeeke0JolIDoQREmx5LaWzsmMQZTBoj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15186.jpnprd01.prod.outlook.com (2603:1096:604:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:04:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:04:04 +0000
Message-ID: <87mrxnhqq7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 11/83] ASoC: apple: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:03:33 +0000
X-ClientProxiedBy: DM6PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:5:333::25) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15186:EE_
X-MS-Office365-Filtering-Correlation-Id: 36533f3f-a61f-4ddf-3d42-08debacb0fe0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014|11063799006|6133799003|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	+c5ufl8tifghTHLnPCRP6prxVgznV5gtsrMKqJ9KPoHqzsI/EPH3a0/mlE/KqiPtFIspEuSdqMSGRUtYFJvgdYSKgsdWdwxb6wBZBH1IBswS7HjZxtDuHldEFvCkSco7iDTQC39cLcHpiGUa+1Yo6UQvcLPoIhb9wEwJlcDM1aNIBkNm+kLqzuTBa1wkqpRd2N7usF4nf7LrJG6ZsmOIb4elZ7mpAvsFCh0m/PDDGH5+VjZFlX0Q0etFRiiFlkLDthtm28LkqrfnjbtEvTW6p23G5EaIpagdmsFNKhp6RyY2PHOkPojAL+l4yGyy6/FJ5de8HVhxex5uzbN1zVUVnNu1p3kDzG23yJ0S1JWZZgDJx52h880XOyUW5+ZC2FV1cCX12LFtjYHi8HEFUaRJDTfdwZXn1BXE/PHmrTfLCoFHcipwjtDJmaIdMYprvCsflVsNnEJ71n/0+uwwZ5SK1ZyWvALb1/zi1vPPYxeZsBUTqoLcbOpUX3ks5qdq8vPrGO2Wa5VYm7ZEaPiNNSrDZEpK42o9OEbEqQD8Vzfbojh06OpuxgYXm+a7H4ZFVx2Y8JOJ9QAyz42fNNEfis/6FD8iHJbdOBaioIeohbOKZKFJ6oyeoNr7Oa7eXt1y8+5GQF4kdOQ6/JbGlNNL723CDbRcUX1hxdQ71GTbvv1qybgYoYt55iAKg0k7Vb8y91DtpMhqQEsB7cuEaoL8SOQRkUntjfXUT9XRWzNpHtpxMGHYyMgyuda19q3Q7cD1mJllS68Xfojwk0woc8ctYRdhmrckl6zU6+mu5VdB5VYAVo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014)(11063799006)(6133799003)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ilkCa4aVFhPb/f5UCj5s9YyS96OnM6/EZGH4bektBQLp0ATYS9FcuTEq5u1o?=
 =?us-ascii?Q?4Eny0yvPT7DyqNVvHbSvC35cngd6kEMVSqv86a4go0SDWwAEY5vVZ1yXRaAQ?=
 =?us-ascii?Q?6HRRWK4pNL6/6ferKOqxCzi/O1UwKSnnHc5BXqrBAG0+7oj7jKvJXeL5pv0d?=
 =?us-ascii?Q?y3w9AXfG6ZORKGGAIDGfpmgrd3MkjTzHMyCRChjm/e8xJWigqg9jNJIvaSkH?=
 =?us-ascii?Q?CUEeJb+Cp10u+Jl6YLBWiYdxu/u5sHiD1cvkXC+87CB8t9Z2vaLZBkih49LI?=
 =?us-ascii?Q?dRPzSih1Jz2towi9JQRMOLm2NNd6qGTJUqMqlNuybpDcb5gklBfL6kHCBVdx?=
 =?us-ascii?Q?muneZvRwDPZa+0ZiWAC5d4/O6dt6QGC8tUSlJ6qlk+esw8aJ65NoJlg4BVQn?=
 =?us-ascii?Q?azDNt0e4VED6ULZs9QCP23ki/sI1XnFBYPTk3PAKdH4iKo2AiNdYJdSynpqz?=
 =?us-ascii?Q?UJF4pqaOV3gg7lLa1ZB6eUtSoKEOV+cdZWo5EjaryQm+v4586uQmj6q51pvv?=
 =?us-ascii?Q?k1WoNohJM2u3FPMdc5V91mgM4YGXTYPmOQ0STWfQ6PRT99IMfj0RNeCK5ZF2?=
 =?us-ascii?Q?QZyUjZbBqP+VA0/upzxw9XS12LFEHdznK2YE7C9N5vQzvPkw7t9NlmR3O/s4?=
 =?us-ascii?Q?kegy+p/xLQTdIITCpX8p37jDxeuwtJLI8Hyyp1H5ug/l3Pa6bqnrFI18ASqe?=
 =?us-ascii?Q?EaWNWeX/T6oNT0cQ9G4oCY6geIjc/zbbINg4pDB4TEaTuX1l6tO1hG5V5ZUF?=
 =?us-ascii?Q?Bm+7QXqKGLfrFmJ6L16OzjapcqOYTV8b381pkkvNTt5c77X2VNGqdfOZKvIj?=
 =?us-ascii?Q?VRF1+bG52rlHZgh2WPCVOjkNFs6WY76DMfEdcriBfP3hrUlCQkr4au/FfYh2?=
 =?us-ascii?Q?9kbCUP87qebvPPTfJ6EK1N9qh7ggaYXktJW84A8ThEHC4zFz5MocbhtQT5JA?=
 =?us-ascii?Q?FHmhxEV3hwBZlWHKbXC9vMmti7CJSAfl10X4OxJWQSCWsbHnoWnDH1R2MeAq?=
 =?us-ascii?Q?5flzWcTttNNJmHcyrW7c0uzoBZdjep8Tui1S6C5TyIpQk58w2JTLzg2y+xZN?=
 =?us-ascii?Q?ccJ9YZym7OnvXux5HdMHlAjWpJlsS/2Xj08Hte1+hSDgX90ByMUavm/DZTsJ?=
 =?us-ascii?Q?xqbMAOgoSNBPiFQaZT2TCi1uJifR3RMAbv66Q/D8Gj2ihx9QPLIfeHXD4xco?=
 =?us-ascii?Q?sYSopwvyIF84fKy6eAIqZsLEWnf40BrcHSvybOhmMGYvu/Rog0oxGLwKFuwm?=
 =?us-ascii?Q?GdeUrSvSts7f1MDgpW1+PyVxlpEeJ02+LnLzL5tp2WlX9bYvHso35mPw+paJ?=
 =?us-ascii?Q?oNAnOeeeh1HgntVc9jphtQ/CdDFZFMmBUNpkPbHAiMLYExmI9H8OPzg8krsS?=
 =?us-ascii?Q?UBL5B9NKLKFbO6KPTZPsTYZIGsqsjTe+NmEitOSClE5w406PY9TctwIZJPv1?=
 =?us-ascii?Q?NqZyYzNQQt3oEbxu0e/F0CUuxpD/OY3pFeLrCK0uLIwaswiOFwKVv84d8xq9?=
 =?us-ascii?Q?otOwnArTUEPbVSeek56vSHqAdAuysnksOL0TRmD5NbR3OwGl43jCxGw8inKW?=
 =?us-ascii?Q?6y7xgLYuGqJG60oy1A2nmpIDYTJizd5BtTcqRivtsbtEJ58uv5xdT6WZi+T2?=
 =?us-ascii?Q?o0YbmoRoLWWWDl7BMiHHqVQ77acbrOGc0Ycqs1SUPlLtG7NvvzqWMGbMrbul?=
 =?us-ascii?Q?SN8CmnhjEYThtwtCZTD0YDPdHkU9J6ljjaKr3j5kwQO0qV3R+cF2Gsfw70jq?=
 =?us-ascii?Q?mM2DRI+e1WMYLrE4P4KKFJGQUN77F5pDdtFIUyrg3gVlgQLEtQoC?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36533f3f-a61f-4ddf-3d42-08debacb0fe0
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:04:04.1824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehi+Z8EYtNDNG3F6JnQGqITElTTPPCpDEgjvpRtJj7jYkVh6o8YiCAQsaZZIxpKEoKxR/FWwlEMFES/+KmEk0yZvSklAB7Rq9iotSmhfQ2V41L4gkGiZ9q1Jwk0h1Z25
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
	TAGGED_FROM(0.00)[bounces-14749-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: F37215CFB0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/apple/mca.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 492165c0e1ea9..1954192a789f1 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -699,6 +699,14 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static const u64 mca_fe_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops mca_fe_ops = {
 	.startup = mca_fe_startup,
 	.set_fmt = mca_fe_set_fmt,
@@ -706,6 +714,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.set_tdm_slot = mca_fe_set_tdm_slot,
 	.hw_params = mca_fe_hw_params,
 	.trigger = mca_fe_trigger,
+	.auto_selectable_formats = &mca_fe_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static bool mca_be_started(struct mca_cluster *cl)
-- 
2.43.0


