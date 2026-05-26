Return-Path: <linux-mips+bounces-14742-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL+cOXP+FGp2SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14742-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:59:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3755CF9F0
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3D4C3009160
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 01:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1204E2E11D2;
	Tue, 26 May 2026 01:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GO3nbvqU"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [40.107.74.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B72DECBA;
	Tue, 26 May 2026 01:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760754; cv=fail; b=a71DAO8L6WfwSms+kcxeAVgw7/6++J6pyM3Vd1N8Oj0Hw/Nhnfyj9t1QS9qdux5ZhmQ0Q1Ny7U5YeaaAK8SWOSv86IPdO95HDj4jAHUeRkH+zfa2533ZftyUkWzuU08dHFf9lGczkbUUNl9LQ5PIuIodsIkuw5mnEiEY6w7tAdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760754; c=relaxed/simple;
	bh=a5oiuc/jDI3jdi7Bl0vF7fX/1tNgCwkr92EImfAPs8I=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U3zuXzK1JPQ0L/LK11ZN0/Kl2wbWN5sM+mGtv3Dlir6VCqs1z/EL/VotCB03oMW1p4ogOKGgBSpRWr6C6ea6cboTKTOhC1OQDou5LYjS+h+YL9PH3XlJVfXy60DPKLGIUV2ePvAN+6eexJnoFqTeb5C9nlWsgYtuJi0fg0uQue4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GO3nbvqU; arc=fail smtp.client-ip=40.107.74.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wj/3lO7BxIqxjWiHMqjqiUa8t2Mn1tFF4M8Fcm1tOFgKxY1QhI3IaRcty+5eahnVbEgLpB61pRJWXq1aIIf499dxoVKT3ZwHG/UBQtubaijckgA7Zy5XbpeyrXBZMS1p5oT/eIZ/sIKvKNVofPXXeMYtm3BAyZMK/9e9toHcTuZBA6t0UiQkObqEsPNlTw9kvxrp08Rvvz0c8mAtRcMsFau6pKuxJp0YuvIbtBvdInC9PCDMC9eVei+hL0ZmzwFXfMvp2Zh/ISDMBb/fAlJUttLina+GoWmvlJW6mb+9Sj2ivah4U0QU19xJ/Lxc2eoKOoY3R4Ah64z/T0IMrP0e9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da10lFF5spUgt0PnyOJp+mlxWR0iAapHHLAKIKawRGI=;
 b=U9N1hFEKnoOCGOtqSXHqeLt5gcgQdu+Pj92nOY+YweWMOy4CMmAuJ8DbzCmwzQ3Yr/2lHsDoN94QErO/E9BTrDO7+murXwsOvKUMwWFJ56kxHjHwluLDQ3alLlTli0eeSSoBbTXZI47zXwZBMt2fmWSdmPhTGJx7p682cCwDNVd0wdgplvofZm7yy2HGNh2efFNOsBhwdRjGAg7HjIQttpJ8X3dG4R8KTTMMfLpKSbpthZKLy0CpDLOzCRQX8b6EVlkEd6UQjd5dSgX37haIzV77hiOAYv4sRKrixz3UPUjA0cZlhaY6ReqOgJWq38xt5DgE8tDSD4o9/cj4Y+axhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da10lFF5spUgt0PnyOJp+mlxWR0iAapHHLAKIKawRGI=;
 b=GO3nbvqUXDIaaa8p9uHOSESEkRXP3Wf3HTWU8HHDPZ+OnQPtn5tlNm6rHOcTJ532yZLGRIcfWrTkzTt50EPa0DpNCyCalIp+Q5GvS8jQbJr2dqPwLV2ZnWRIET3LvLqETRtcmMZq5D7SsVzdpxesH+btP3tl6oD75BhaWxOr+G4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6599.jpnprd01.prod.outlook.com (2603:1096:604:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:59:09 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:59:09 +0000
Message-ID: <87wlwrhqxf.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 04/83] ASoC: codecs: peb2466: don't use array if single pattarn
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 01:59:08 +0000
X-ClientProxiedBy: TY4P286CA0079.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 2541c8b4-0e67-4da4-07a2-08debaca600e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|18002099003|56012099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	WPGurF8UV6HerydOPFAx+aK0IyeDIL+N65UMnn5YAKitekMeVScmolkLk5lZJ9wQYZc7V2o1OyfqpDT5Z//0mK7QknH0+gV1KJ2f5Lg0U4XP24drgtnRG4EDUiOheyhp+EpsYpZu9lrQhIjhhGgeNwaXFgFD6k5L1GhkbvqnaI1tz7FyAV1MPG2Wu9MkezzYnpQZdB+VwrRd3uijDwNtOAbyjt3qQv4fc8mN5MOxa7VwcUjMAu0Oesg1EF2bQW91tptdHsHA5N64mbuR0VMPEIsLrmHn+rw6V783G956Y8mkzLTSklExUzLnBRed+Xu/J3IR3aUox9zqRV979i7RJDQ4oS7RfrhaiKUdoI78l11DEgJm8o4Xyool9rShtbmBLMhDKe3AeEahEfFDy0up8DOYdcTo4Q9RnXfrxbQ+qKfwr5bl46Y4HlEewT/XMeGr/kNHSNyft6/jRPmhFuduMD7SouFKFyG5ltQ/Gb/koxf5dvHaYfQ4idSFS3bzqjXfJIPvHiBavBsPSd09ngnlAFz0rsNILcxpA/QuO8JnK0AKjWqWW744yNlcnRz/k7L2n3A9WZFLqvdVTYM+uMEbDdAbqxyyBNSorLLr/no8zCvOsq0EZ+E+dM9r0bTZ/Lt4qOtvwcmJZbIOsWVAYqswQX2Vl8NtPDrO607weLivppUoZzYAVxSX5a8zhkLsc5LLZn51XjTLlQdhsZtimw37UMfUXWrtSMeBAN9M6+u/uW6iKmBC2z/USwj8tjXEZzdI41lt4c+dz+YM3pVwLolP1j2uFVX87ikmKJmFvsmJeM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(18002099003)(56012099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QgWBbj+1A/zohhHte7EBwtiB+BtaMTWLPpLlh/uBNRBVyUd6+to9oT+xSaZL?=
 =?us-ascii?Q?fxccMiGSzJn+mdhRPgTwUn3knaQUDeJWHpOwPSAbe89axASsnQ0YSSVtOL3r?=
 =?us-ascii?Q?AyUe74cPfsBm/UignLEXxjD8ARyADdgcPbR2ciWTR1xmMY6cwuNCHeZ92OYs?=
 =?us-ascii?Q?IHBWKen4S0XGj22kwHpR0FvabQD3J6KqR3fGYdzSbd5OQ0vNV/wsUcy2z9hb?=
 =?us-ascii?Q?wfEmVcDlNNEJysDVzl8r5zgJoR6qw6P6PEYiZOVdvEZAdX8FaQ7/qGaMH4Ap?=
 =?us-ascii?Q?Y0jQpkmV5hsYZtl17qpbRrDX/N2iixP6i9cCsEqIDx/DoRjvXVdtctaQ5ypQ?=
 =?us-ascii?Q?rYHmQL0jTxTNdN59xgUwmqGsR+HJ/SpgYI6Kv7GRbHhBiYI3gTYZGACmHniP?=
 =?us-ascii?Q?k7rXsC/FjGWrVCJPw0QYvtsARDAuH9e0sblI9age3LaHDT6fdAEkMVdDBXYO?=
 =?us-ascii?Q?/DgH04qJVDe56TooUXKnRSSuVAaSVbN+h9JOF3bhSeVh1J5N3YJJmFvDXDGr?=
 =?us-ascii?Q?PUTxbR4bkRbukoa2n7DSaHm4H1YQe8ivgI3brBHlpdQV6FB4o+/3cVNkx6lF?=
 =?us-ascii?Q?7VUx1r+0KB9h5vWHuXFeUFe1PUIvJUJSt0UovDSq3mOS8OoFa9Nxu1/SqZUC?=
 =?us-ascii?Q?8sA9Ar7kkp1XHMEztS6t2zzerQ5t2B7e5hNgm8252dkmWPch0oPoo/zC/Leo?=
 =?us-ascii?Q?NXS+gc3aX5gqMY8ZGLl94gqGpwXrtZWE2v7yMqZV1lR9PZbEbCZexmgIED5c?=
 =?us-ascii?Q?FUWhwIGgY2voxdKxge74yG+2wQx1OwyP6pNohxnnvh19q+JNmh1fSXL+ILNY?=
 =?us-ascii?Q?ajDKDxXyJ0NAwrToR/9uFgVeBlXSo4Izwv+XWuUmEOiaTiqisiZyyptDpeNh?=
 =?us-ascii?Q?MesspXJZbnH/loqJEoDu2x4nGM6iWZzBJJmNmN7TQo24sZdV3/lVwDTXu3BO?=
 =?us-ascii?Q?sZlFiryVBolvfH3ytjWPghilK9XoKfazltvFZRhEWg04PnR1g2zqleoTt3Ia?=
 =?us-ascii?Q?3hBhP5MUdwquRKyTOo2/Poz/L8Jys88SrOtmyGqhjwndbZkJW4KgZ5DfG7Tc?=
 =?us-ascii?Q?l7sxrGCuCQOr11b19UNNl6ZEg6LzD1j2gjtL4iLnrs3fjpWHfdghEeVl6r0n?=
 =?us-ascii?Q?FLQDRCA5EgAfeZYdRP5O+U8Ly+PiTH0U7zx+5vGr8wCLIl+Ja2BuDrfxi2Ka?=
 =?us-ascii?Q?ekX42pxsEWy+EEHjUDk3BdPn6nfKZyam0XHHBk1S1XFNjKJxBJaZd2DhKMTq?=
 =?us-ascii?Q?cVFYKxJ/PiY+fdFJz2GfU6MQbjbjm0ea3sOyU1mBCjPrLcouUAXvJJz1B8Qo?=
 =?us-ascii?Q?1oSj4CsEYUycM87QUagN3TDvWaEzTbIrxMSZb4dkhisQ5FbV6Sgir5XNvb6e?=
 =?us-ascii?Q?mX1RptIkH20175yUgevMjXAARFmjQe5tMO/yAbpr6g1sjtEGWzdaYLF0AlYI?=
 =?us-ascii?Q?FaqBBCKBefuV45o1Z4WbUW6MR6TaOtqbUeiUV5ofec1DVGBazOZx2nlSN/XZ?=
 =?us-ascii?Q?0SjlyFnd2QPIeeehkmRbRowLZvHVSSla5vkduLSN3OppFeGsnRbjy13DQTZi?=
 =?us-ascii?Q?Vs8u8YJokt7SEAPctyzrZ6XYSTHqTeFaLLl3RtmiC1qDGTNW51KSa+W/aozT?=
 =?us-ascii?Q?5L+shcgJzBgJHOd0GeW8xse+x1t0P54g4fm+p3khzq8CjBBT6Dt/3Q3G0fVl?=
 =?us-ascii?Q?RaytBFBQp1LrF4f+bIKcYwv9bs3gAWVq24W6XDSVv6HsDq/Ta1v7ohqu9RUr?=
 =?us-ascii?Q?28j84s8QCgbqcHFYm8QEWtighmtnquZa0s+LfNNWOz+ryDIpSScV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2541c8b4-0e67-4da4-07a2-08debaca600e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:59:09.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5b/iTjJ68yy1Sa/j6QksmFTKGs8s6lJk5maNoSisUiGGtnaKdWgrViytFv7BoDle7/EiSpcfHmJqBZ1nn6m4iWcxfZN1vQf8FLwCcFEfTXeQRk8m0s9YHvM4UA74pDG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6599
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14742-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8E3755CF9F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/peb2466.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d5163c15d0d1..2d71d204d8fa2 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -817,18 +817,17 @@ static int peb2466_dai_startup(struct snd_pcm_substream *substream,
 					  &peb2466_sample_bits_constr);
 }
 
-static const u64 peb2466_dai_formats[] = {
+static const u64 peb2466_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops peb2466_dai_ops = {
 	.startup = peb2466_dai_startup,
 	.hw_params = peb2466_dai_hw_params,
 	.set_tdm_slot = peb2466_dai_set_tdm_slot,
 	.set_fmt = peb2466_dai_set_fmt,
-	.auto_selectable_formats     = peb2466_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(peb2466_dai_formats),
+	.auto_selectable_formats     = &peb2466_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver peb2466_dai_driver = {
-- 
2.43.0


