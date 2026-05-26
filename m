Return-Path: <linux-mips+bounces-14747-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGtmDeT/FGp2SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14747-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:05:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FBD5CFB55
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43435300616C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBC62E62B5;
	Tue, 26 May 2026 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jo+L48g2"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DA52E228D;
	Tue, 26 May 2026 02:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760936; cv=fail; b=uYJyUuFwRlw+F5v9q+L+G/t8Y0dpV0QpSbSWR1bMCsB6+ZdH7ukXZQ67C5UOd2R1uvkJ9toPL3ZVfKcLVGRwVHdx+T0rqyFvx/tj0b+4Z19MIhDKkT52RX4cqT2Vo/EFxnFiAVgDaRWx/M1ehbJ9jufNGck1rokAI8PPCDavyqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760936; c=relaxed/simple;
	bh=f2bxaRJYKJ50KznZ5SDnyySeZkAHQk0fPmyZ0dY1vZ0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KVm9ILBP+m4DvgMUeCLFLENtBFCyiSHfi75zvjrbck/I8T4gMtW4+RU05cTW8IUoZ/NWkC9qBduxl0owm+/cGkcFtq73xhcJtIXCQLj07vCozsauRRFvE8uq7cJgeh+gDg9AN7bgPbob7F+Kt3a2QnYsWbPyy99THE6v81o6N/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jo+L48g2; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSJNYCoImQZIhtnFhbTtl9Zx1lu2Tx8FGbAvytjszxXPIq3eTLn/pseweRWEBCUuSiT+EH5UrjnzA3EQRuBwE7TMnY1hVyP0zbrGAWWKyzx0CNDu0B31iKrjhDWbUk3sSdcIfTNk/++kAguR0VYcSf08A5s0J7FMblzUIjsSKtQLp2TVebV1FbubSDanAZ+uiOAFDq7w+mL6NtxCgEI8/CCapDYj2q9qfDmHf/5gf1fROOQomjgIpfD08uiAssmzWFh2pOkTo4KNB0VgSQSrisXyoGh8wIjb1fqArMr43s/Xlw4ot2DD3qH7FzC60FGSidYlcg2+f6ndU9nb/rQp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKFUbEJdNET+qfRoltdFLPCOJLEwCMXBX0wI6S6e/Ng=;
 b=DM1UVREdgWFH1gZfkEVy45t3WRKA6IcM8bUMsZfGi8q78LoCXVRtXs3+3hBV7uyn9AIWj/qGvADZodhS5wBJxpbYWVs83VRrgSKT+afh2jzRWboAxwM/GknB1xG7Bpnr21M0owpkSbUfIG9SIt4QRz+u1Wo7ULm+PFZXj77nvqYZzlm2RWpIx2vaSF/fxooZU1S3PwaItf9usw5rrdBU7QXtR9MGxCvflsXJxl1n9CHrcjDDtQ2Ma8eHWBu8VDO/X/u1V5yDmklJU2nf0bjLNX7CSymP81xnBLPQ8RzvgaJNkldE/IFqj0IvMMApENKlE+Uqi++3soss6ri1kHoTHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKFUbEJdNET+qfRoltdFLPCOJLEwCMXBX0wI6S6e/Ng=;
 b=jo+L48g2i1oDOhH7iBZWzsdSJgSOUCu3UXpCr+Hj+HpEZdU/463M1GMMYKlqBX/oV3YobzO0JiMuMPsoDF6JQIoHIAyBTkF/UHAzYco9EOh4Qc6RAOKluqrEzhkpYNUCpk2f+1qdLfNYeYpZH+lScE+9jQlIGZrudnt65n+fzMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15186.jpnprd01.prod.outlook.com (2603:1096:604:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:02:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:02:08 +0000
Message-ID: <87pl2jhqu4.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 09/83] ASoC: audio-graph-card2: recommend to use auto select DAI format
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:01:17 +0000
X-ClientProxiedBy: DU2PR04CA0172.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::27) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15186:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a6fbcfd-f0dc-47c3-8831-08debacaca64
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014|11063799006|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	LDSLPzJY5iRC9ohkBzC6gnQs3/80HUasbcZJwsjGnwmXqt2jtYqAhWV7aPJ1j8Ja3IK4AGFi7NjO2nMQZawmBHJfKdnCM0IopFZ2TNERHJhaJbBvZj4w+7P9Mh6/TD/d21cjh1oTHHIeh1h0P40xZCJv2N5byjf4P0zPJN2A4hhj+lV32flLedvsV9lb5/uniLRbmMqhQze7RjRWuwu2GxZuJgTaz5sihghCEsnuPySvD0AkNUB3cWskxGo+OkB2d5i6+QUDoi4uhP1gUW60Sc1lgDYpaHkCnnJmyHU7EgjLcib8jve+OeBRwnOpW6oTy06D5vHVY8hb/rer46DvyVwLRz3qxt90Z7bo6IE/G701Ca6LOXRIXPqpeA2ftppWIRlPWn6hzuEtW7IxlQ2SqjBgKvr74mhd8XTk7NnogPkORLCLW8YnXB/zvOr5dlClm8sRDtwJe+f0+MRpABBEo1XhrANd3rxvIzI3/XVa+3im4gE2yBDd5M0RQYyxHf0XikXttKcrMlAyrUK0OBlvPNsWt/H6J3+iy9bsoHProGg8MODqvrIN2uTFkuX8MUU/pZKZ3jqOvtv1yz9rhXmFebKaa4IwRSz54VKBRkOZH3Qg1udoeYDFI9DAXp6HuWD8mCYUjlXy2+1N1J2WXr2G8N//blAhvzp2dcRYMqjDuQ1uxlna3HyrAUyv41q2UWtAp9MUNWNvA5ofbcb/EhlPNL/PF+67+D21GG2Bb/pIm+Bzl0T9GLptkGbTcDi+A65fZB0ovrEqOpnALov9ji3EXeoaOc7wc+GylgyBmy9QVFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xWjGpFvSWtegU/41A3/vjC+QioxYL9/NhiVvlVX5jtWgBm2ZlvXYDg8O/mV4?=
 =?us-ascii?Q?s5qot/2og/WI+bqjE2vLGoi7+dCHv7YDg3o0idNrTW9hW1NAoEkcav0XVHMW?=
 =?us-ascii?Q?UCYER/CairyGL8G6/xg5zu3UWdev5GadUuFOOC0JGPu9ZTMFX4++7xfqJuWl?=
 =?us-ascii?Q?PvpwK0cAG/v3o278O+stK+F9vdUgFF5v1/KBt3dBj70hQFrSqSJ25qccl137?=
 =?us-ascii?Q?yMWzjplH8K+V3hNhq0HmCbIGuAi10J10D/Zek0ixZVQYwOYRfPRQ2nZXg+Dw?=
 =?us-ascii?Q?ThRH9tijvlKGfeN7E4EWTCHYNXYoGuNrpGWi28lphY9mgja0qyBy9gXZxZz7?=
 =?us-ascii?Q?m4xLoUViuRA5oB1GAiHmYH21wudB4uwAl6Aa5MHMLxgdvn6Tu6/Ron2BoNDD?=
 =?us-ascii?Q?PStpSepn+5PVM365APPCJY0bycsDr4gn4bbsAWriiKVkBcXHdfElxbNG3qIx?=
 =?us-ascii?Q?eLZTneeInmCJynCLskUM2Oj3nl/rXxX17dCSUoR1/5dGz1AHCJUsrVEk+Edy?=
 =?us-ascii?Q?I/CZ38I7REt3bMwdgThG49Z+yOlw2uxCN69kbwjkphCmGx3QNweyUPDxbP6V?=
 =?us-ascii?Q?MYGQ4DRDL6kBmZQ7KpmHEgf4+MJjM2zLoNTcK4dZlQLFYGvwxp2+RS3/4vsz?=
 =?us-ascii?Q?kBRDNNpfVdBwdpwjM/q0b9FOgyuL9rEaUXGLZL/dkCrebX87mh24buECMUBw?=
 =?us-ascii?Q?EsebfcVCNmRDXACYl5T5e4Dbt3nI9bprBYT9jF/my78SUNoZkmFNsw9GKBcj?=
 =?us-ascii?Q?gX4vibhot91lG/BW5v25Gce3yzOy3DYAPbC3DnDihxg3optNybkG2Mcbez5U?=
 =?us-ascii?Q?8F1ol5g8qdkhArEvigcl9XtdDsgzi+oHo5enn96AV+Rvo2uPdonDpbKOV/Gt?=
 =?us-ascii?Q?lrD5Lv9wiHSK5wp1jPhaEye3qc3j5P1iqlR02AQxt8tW7N32PLaNBKDLaXrQ?=
 =?us-ascii?Q?gLtKPIp7nenKpED+UWch+pIY/eRUigQKZs/MMdL3Zive4MceaMEFhxSgLKxt?=
 =?us-ascii?Q?XB/x2wNRL9Wj3NjbmEcoepBUSPv/RuxO9BJKtzN2bTPAlhgDcpPpfqhfP83j?=
 =?us-ascii?Q?0bam7ZgnaWlO9BV3PJPDtDmnYGCyABKcJNIW7OwGPnpSeBnmfl3dL02iXl+T?=
 =?us-ascii?Q?AJIn6sMbdpK7R69sSFLf6tOOm2uqdllM48736KJNSx97HFopbMwOmrsbdgrE?=
 =?us-ascii?Q?IAU+CXXVmDcpMMz4jVpOozl/m//jSYZRzcdg6GsWXMki6rauZ/soAkPuwslR?=
 =?us-ascii?Q?87X+brWqRpe7WUR26eCnzTWynT5nkMO0+WXuCX1cjLiLiWl1q07EM6WLkCbX?=
 =?us-ascii?Q?HZyBISCy0RJ+2y2pIxtnKhGiAAHtHmnuonXhqjXP+y1CuWlj7pIURrvSw5TZ?=
 =?us-ascii?Q?1Qr+dTnIqovmbCHwW1RZzax6iIuLKA69T+xXqOsm1o6710HzyZsA8C48hvQ3?=
 =?us-ascii?Q?v84KVIDptjGyIewE2wulwWDo2JGj4zTEyRH8f1PLgvz7WJbz7NbGEjay2l/j?=
 =?us-ascii?Q?Qk5j/mSku4qN0gMeDLkK4eE1RMjf4sNVyKZ9PJyYW7x+z+/6Ncvz8bO12axr?=
 =?us-ascii?Q?JhynYiDLDTAFLKth/Mp6msRvqlHeSwPPgFDxzvue/qdjvZYKz9AeWUupyA9j?=
 =?us-ascii?Q?vF1vty2EQp3Rx2R1MWrIQS2yDu1eASHvaLgLdBoM1LmRKlW+mgLie9zEMriv?=
 =?us-ascii?Q?llyYfBxhF38pIMLBSE4x6MrzQxHQYBFuCSqCFwqf4pRl/r5ZTWn+T32+Wxld?=
 =?us-ascii?Q?3R+y461JOECM4XwDMKpMYoCH1+L4wsnuLu2pfr095nXCHAIwwaA2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6fbcfd-f0dc-47c3-8831-08debacaca64
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:02:08.2205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B94GndOqFlu2rUOTpKC7BoWUiJSAuhmySaBF0bjMgvTs4KikTkf0k6Jkp/HyebTApqlrUx2sDZf9N5oGG2IJV5HR6qiRRqpz0oKaNqB14xiBzkfEw9BOfAoqAuXbYUnL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15186
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
	TAGGED_FROM(0.00)[bounces-14747-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 94FBD5CFB55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Simple Audio Card", "Audio Graph Card", "Audio Graph Card2" are
possible to set DAI format via DT.

OTOH, ASoC is supporting .auto_selectable_formats to select DAI
format automatically. Let's recommend to use it on "Audio Graph Card2".
One note is that it keeps supporting DAI format setting via DT.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 0202ed0ee78e8..6894bb936cfd2 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -778,6 +778,18 @@ static void graph_link_init(struct simple_util_priv *priv,
 	graph_parse_daifmt(ports_cpu,	&daifmt);
 	graph_parse_daifmt(ports_codec,	&daifmt);
 	graph_parse_daifmt(lnk,		&daifmt);
+	if (daifmt) {
+		struct device *dev = simple_priv_to_dev(priv);
+
+		/*
+		 * Recommend to use Auto Select by using .auto_selectable_formats.
+		 * linux/sound/soc/renesas/rcar/core.c can be good sample for it.
+		 *
+		 * One note is that Audio Graph Card2 still keeps compatible to set
+		 * DAI format via DT.
+		 */
+		dev_warn_once(dev, "use .auto_selectable_formats on each corresponding CPU/Codec driver");
+	}
 
 	graph_util_parse_link_direction(lnk,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ports_cpu,	&playback_only, &capture_only);
-- 
2.43.0


