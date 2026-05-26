Return-Path: <linux-mips+bounces-14754-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNOyJ2gAFWq0SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14754-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:07:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F37D95CFBDF
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B1430056CD
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FA42E11D2;
	Tue, 26 May 2026 02:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YvuCVsMP"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97C2AD00;
	Tue, 26 May 2026 02:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779761246; cv=fail; b=XAbzhn8TuQeIGiueyAUOruoNOu5WDke6B4SZj5rqLL1x69HU13WU/nCYNsobhMuk0ocXC7aV2mj4GfJOikGpu7VgOdMmcskMKzg1J0Tge+ZbGNrdk/M25fP1vffxHR4Inv35l6EvROnQa+3ExcMW3K2wNiDl805qa+WJ8qhhhUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779761246; c=relaxed/simple;
	bh=IuV/5yMroZO9yLQrB8YbNRc5dVFpHKYE8ZussWaZaEk=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=e+wNmu3Gz0ReNCF8eYBTexHeJPd2SYHBljShAgA3cr19Br2C5yO34g7UWWFqxMej+sxz+5f2uZJSMw78MJ/fN4brlfKDmncGk11eIZm8/uxJlGrAOIRw1tl4uILmyjUmkA/bapwZGXK+TZIx8eHdv3seUbwQGuofXQMHfZG2PSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YvuCVsMP; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QozzJl7ck2zZMJu4LztXh1NXug6/KKf3z7nB5hjCdzBQpiz8nQmriOG1Ui7rJ2uoPsItZvdM6v80O4tDekBUiFg1RKnD8IcYkYc3oe0HywoKrHssAVDdAsD9banZp/XuKVd6rXNcrvJ9jfyZ8QoSt8GvMEpl76FK/HZMnlqIMJnJJSlQavV7SneDPRDejDJ5Kf8NVGGSsDVdPuo//XLJ4H3UagGW16SGNkYg8euCuDqzNCP7jgyCJHIO4Wc1C8HlK32oK4NER5bAOlQ4AGXruRJLlq7TDg9pnZzqQliDN1xE4wStrdOl6jSa3toGxqrpgWjkoMIGK6G4u4TlvquahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mQtTMYfNYaTpzMsSkzYerAKYH5tUzqI16cI5NMxdY8=;
 b=GnSiZcToUoPwSzB+kBQ65jLp/R0L1jaKpIm3I7g17bSrXpbuOVg85mHTa1ZgtBc1xo/JzYNF0+E/T4TKgRx0HcxiFmnXDlu9nZCuO31kIPVEed+MWtP4D/tbOtnMRdgXe6n0WrUM3smZt2BHGeAkUelTzXjhYhs9JX8gQPTaGraP9gGDmdAea+O7xdKvk20VjHl7nTxI00jdjCIGI0Fap0/7cx5zFytEBSz4SGP0UUjWFw9XdsPI07vF5DpoXb5F9VPz3g8dBvsHcw2tTKiObi0ClGehDjANXPbDSwdnl7G3jMf7jZJw++/tZJGhTKW5bHro34Vg0gnaxV3iYHvv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mQtTMYfNYaTpzMsSkzYerAKYH5tUzqI16cI5NMxdY8=;
 b=YvuCVsMPHWQXcK3/N2UEUysf7/edd7yRFBIZ94hfbyTEhFsrEnU3p9INdKP8AxSz2enn1gnkHxcVDmPcHSxQ/NN5VPCtG8IfHHt62BS5GkbAptjxShrIzX08PnePgFT/nIUETtdwV6LGi7ISRWNF4O3ad+SJNgU51grfmtMiJFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16102.jpnprd01.prod.outlook.com (2603:1096:405:2a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:07:21 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:07:21 +0000
Message-ID: <87fr3ej54p.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 16/83] ASoC: codecs: 88pm860x: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:07:05 +0000
X-ClientProxiedBy: KU1PR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:802:18::29) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16102:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e35a18d-47ca-486e-5e20-08debacb8598
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|11063799006|22082099003|56012099003|18002099003|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	ap7ykF3aav+HngnbfyO8Tjo6DB7ivJlgP3dgDTk2B6G2qhwrZxHMWktD1ClAupeNDnH+l/76hX7KBG8+bN4whO5eEAa2dAkxqXpSOQWkUEKl+nC0PQgBgNrQoTVGusH00rWIWCqMvHzlCuAOUucMqLdCGLl6G3qBUnslAdBdSw0fb3MelvEVVDE2HjV5dv2EQUUt1iq0trET/hJnvsA9tbaN/atvOTT8KtOQAWl8zIa+j4MzvvjPOsHi7X0upKZMSMm1hUKWVNL2y/mKR6nYHcGiB1eXWWTORUqlnDpD0ED9ei20SuZD1Mc+jIMWouXYjUlZ4IW7Di6UpLkkAGq2iqK5gZZve+bry3JYhqA5ogoLqPv7vG25G57dh8f+ogZWJ6L9kW/8ZTB0EIYDOnW6u3t4mnYJpIk8obb1vbhAX0qcZ2J92s01QrLGwfJJLJHjKMouWfNWUeNPdUFkD4D63UpvXj6p51LRhZA5JfoXSXR7AAIGBePdJq7Wlin6DJCMXrWuzewM1MuqZaOTWLe8JzfvgOwEo4UvAS/hMRGh0ltFkNbFTPrec8mAzXFB0HWR05brYrWXkZzw9IEwDdGQGLsD/3U1CKyjd4UnPTAtGS17Duir5cJp3i13nlTwzqyxvXJ+k8MolXIzpaeKJfuS0fcm7Q8cNWszx6JF6Ci68S01QqQm49bzPEYZu3kcw0jJ5MEofgxX6uNXp0oDaqgSASAv+u+NX0FqPCjTd4xt0deLyk6hG3UdXcz+VMBsUfkG5vMdn/iiH0vla8aW9ShFMMWcROgvSTHI44n5AOGHyN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(11063799006)(22082099003)(56012099003)(18002099003)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ot4EW+qPdQqSVtpDiUoikRAAXNcsaxCRG88X7Z+wXcsMO086VmVhtB7y7Xxi?=
 =?us-ascii?Q?SB4uUJhF6BHtMqILKIRl6ujfbhoXU0+nnHrevhsFqosG0LNIDQzZX0kUedrK?=
 =?us-ascii?Q?3DhDDHqp3tGzGsGnjIPvy+D+zW+AlbC4zqGpZXJsvuXwVoBCUU1nIgWyYm47?=
 =?us-ascii?Q?GHsW7K1ZXu1sS9QMseuIocpLxYGEB3s9GK3aLunYF294ei5X0RrSyhwhZWlI?=
 =?us-ascii?Q?IjS6aWnccsYBt+PCir9yul3st99agu32OiwfjTKdJ06whPoTvesm1KvltjHC?=
 =?us-ascii?Q?P6fPwf5SpCAkR4QODWA7H+cKAsGW6hboXL33OCv3TxpVmzT1iH5spf9v2Fpc?=
 =?us-ascii?Q?cVgRuRUK3hQy0LeIOUlMErIZ78UCYUCQnNQh7ikbYaiqYLwq/DLIjjE9Ev2M?=
 =?us-ascii?Q?ubGlQqOQxmYsFQrEmuYPcB3aktE4jp/PDcpQqqgCkTUQn4ym5TqGQn4LSxzH?=
 =?us-ascii?Q?1CjRZRMJ3k0DOIiZSDNvRRRHgTUhgToRlJmqN0zQIV9GskDQSB9nrfRBZp5j?=
 =?us-ascii?Q?IBSdcOmymXWDXQArE+x3HShWHjuM5D+S9yayipOvwBFSa8rnQTkszwWfp9Ww?=
 =?us-ascii?Q?5Hx+zT/R/e+rL9G8M7QZZJQ8/8Ok0GvYUQo+I6m+wKxQZFTO4e7Uy6nyWc1m?=
 =?us-ascii?Q?QLy0Ps3RsJnLOn6nTI+Zk4AnOkvLommafQlGljN5rhJGkXZfy1ewHmg9ZCeE?=
 =?us-ascii?Q?YcSoCkfWw53vS+zZMhLX/tPUh/CfJ6HHFSQSScojcrT2qCA2VShCTrtoCy4B?=
 =?us-ascii?Q?dFiaVeTsSlVrh3KazycwP1ip2bc7zEtE5WNlcaoLuUxaL1WQOk7N4n3+60hp?=
 =?us-ascii?Q?W91RZO2MTEfEuE00/hTXNL6AYfu8Fto6m2M/gq6hXITPxNUIrlWUgcnh4BM3?=
 =?us-ascii?Q?ctRTtNsoLhoKOEC8K3gVzGJflxLbZPKoIsNJoUazMmsuMdIBmBdGrPTxCuvl?=
 =?us-ascii?Q?sFoUncEbEbO3m9lUqDskELvRFdvNgAG/BPDmhafDeIFrDIRwkYKEJOc93Pbe?=
 =?us-ascii?Q?OYEehsErxolnYgmUnfAN3EkrYfoF99NcY4QQHIGBnyLoCtV2JqjHzvYg3Mg5?=
 =?us-ascii?Q?Y5+nayAbhhV6piF0ogQN97av3opoCCDaUSuFf8ziUzkt4uw1LgivaL45Ycv9?=
 =?us-ascii?Q?y99T+1uF5Ahq6LTahtIsN4oF/ZqPxJWfwUopGfSEbJWL1V+5QFlQnpImHcQm?=
 =?us-ascii?Q?Cwk3/kmwTJMJo3RN8PZH6obuQgveh5XtlkYMV8ahrpu5NBiirA2rR1tV8tuS?=
 =?us-ascii?Q?QndoLnOUysCD9+gSiCWKEMq3Fnaq+nQ36IX97/amed59YE0Sze5py5nQSYlD?=
 =?us-ascii?Q?FVRLeInIUmtrpl8ziuLfsNc1S4tAPs2rGBkyZlaA2u9DyL0XIUA86r5Dwnaw?=
 =?us-ascii?Q?sn6/saDdhd7xag3gyh3lrlmspH6424Wblfk/TFZ8LhDaTrsdB5p8cM3WuDEg?=
 =?us-ascii?Q?kUUZcy3grsbTuxd4LB6iQEsHmcMbRuxlYtrstyO5TpjmkPEue20+4UqckZiC?=
 =?us-ascii?Q?UEaFN+stGQcnGxUcPrsImEbhvaqNK+RYxW4hx2pK0ZXUw6CvfMtIta0U/osy?=
 =?us-ascii?Q?ue3gH+SgfveHcMSXKcA36p281cq0AW+D6wx8zFJXq4tvC52jXzcmdqRUGCIk?=
 =?us-ascii?Q?Xkkpz1yWiB0Rzp9QukWYXL5lyNXh/cd/n5hS5rEj3311ZGBwoB8zoHxsAI0c?=
 =?us-ascii?Q?0OxhXgzHF5jbuaTqoz0KOK1t18wbjngZthhX5CEox8LXr2pDlb5x8lwq3i34?=
 =?us-ascii?Q?xh6SQHdp7p4G4CKHyEoXvAXCLnrDnAbrkUjen6rfFV3mLusqpVWF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e35a18d-47ca-486e-5e20-08debacb8598
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:07:21.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IQLiYCNGrPTaIuf8Q2Q78QiKCQyPu9f1CDyBZa+dEW1cB5LVrKLgN5j00bAcKsmOn6lksFUQPHRRA20jIdCSuRcAxydQ+Tt3KHVDAynwfRDiU3MjkrnnbAV93gSdt2t
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
	TAGGED_FROM(0.00)[bounces-14754-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: F37D95CFBDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/88pm860x-codec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index b4f5b24cde456..7596227fbccfc 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -1136,11 +1136,15 @@ static int pm860x_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static const u64 pm860x_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops pm860x_pcm_dai_ops = {
 	.mute_stream	= pm860x_mute_stream,
 	.hw_params	= pm860x_pcm_hw_params,
 	.set_fmt	= pm860x_pcm_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
@@ -1149,6 +1153,8 @@ static const struct snd_soc_dai_ops pm860x_i2s_dai_ops = {
 	.hw_params	= pm860x_i2s_hw_params,
 	.set_fmt	= pm860x_i2s_set_dai_fmt,
 	.set_sysclk	= pm860x_set_dai_sysclk,
+	.auto_selectable_formats	= &pm860x_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0


