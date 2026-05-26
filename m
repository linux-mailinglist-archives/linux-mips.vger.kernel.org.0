Return-Path: <linux-mips+bounces-14738-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIHRCD7+FGqMSAcAu9opvQ
	(envelope-from <linux-mips+bounces-14738-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:58:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC95CF9AB
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3D17301A435
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 01:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6012DCF52;
	Tue, 26 May 2026 01:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UtabQlcN"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844A2D97BA;
	Tue, 26 May 2026 01:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760697; cv=fail; b=bspEMIO/iayOPFtRKFAnuXQgmm9CGO/hzzJS6SH5LoIEPxnl0oWdz91hLhueN2d4tNfyjeS3YZhrT6pvFvj4oAJxFSbOAi/Blvke8HyVvlAs8LXulpTvKH+1RStXDZSAtpzHz06KbpV/jttolQJ46YsOEpvSidKX1FEHuZcc5Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760697; c=relaxed/simple;
	bh=z9JKozIiH3k9uR5qpXIZvnRBGfpWjSIO91Vvk+iPQVg=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=BOaVFnfGYW4oEAizQ42dRHldO9yXpQ4mARMrj8O4LeEVa3H9wrzxnoleMPdii+2lyk2hvGltIq+eeED98x3866/1oe0zNM00saaQ9W7AhIqVUz9dPUF9y48rvPlltJaAJxuopM9WJDzPTcMYnomSRe7c7vkquypf4CD3G9iyLJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UtabQlcN; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoUVsFkOWdWklP6OmtPs6E79uw4oBTG3buQgTsUbLkHw9TqVnII6ymBjZlzYZBcUszAwA4Qb5+I/t5GvvB1KAVrnjwSs7E+UihZ6WbMFPeRk6xLizQG36Rs3HLJAmfRViRJHpayQfSC/XVaI8s7WreM09IT7DOkG2DzPZep2pSVQuXBfkGFXhGn8mDQX+LiJln2J2uT0vArrh26/dkcDYtjLeDmqN7q5sjxDEaiBJkCszuGgHr0PjiXmd3nbB5aVmiCz985AN7A8WfBvitLaU9+eDcqTajonxerFr+JK/K2bSMaqBaGrN3AHnownjSkRYaPIVQUlDyFilb9sfE75uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4jxFQPrjX4sdAIbS/JuTH8qHqm2yYGMlfCRtw6rfkg=;
 b=C6ZmRtCE/XBiwnZiYnKuIYUHVTs1rWWkanGavXlYpOr1gE6az09Zhqu2m+ta6SW6Xir1+GgVxDje578BBCe1841Xo1EO48plqoWAU/G9AFxyh6V+/Q7jzxHLqYrmaElcG4N4FNHNE/WBdviASZJ4DNClX0JY4BvtmpqAjYPoGVfx1RvvpvTwIKXmZnXUlg2U4ZmXxXYdGZ0Hbn/t7wm2nQWc75SXoYS1TbguTeQ6ZYJB4FUrbA19JSJxEmOK4Ylzuz3ctru927S37lV6dS9HkR7B3N5uL1vMZcuSZEXccSO8sybvaz1hOP+jWj3nmmZAh5saj4+FWXTRmxcZqHCw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4jxFQPrjX4sdAIbS/JuTH8qHqm2yYGMlfCRtw6rfkg=;
 b=UtabQlcNtbmERLJ83IlPATZ+Rjx6+gXol3cusVagY1EAw/nsE33aeE9x4YCPyJdAP7hR+kAkIQ+hrheO4MSZVZFhMd8hib3ePXjvEZQ6C2NezXiF3DnEGnp+OkbNeFC3569rduH05Zh5MTxBKP9QMY3p/MSmV6iO6Uuszdd875o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6599.jpnprd01.prod.outlook.com (2603:1096:604:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:58:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:58:10 +0000
Message-ID: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Zhang Yi <zhangyi@everest-semi.com>,	Yixun Lan <dlan@kernel.org>,	Xiubo
 Li <Xiubo.Lee@gmail.com>,	Vladimir Zapolskiy <vz@mleia.com>,	Vishwas A
 Deshpande <vishwas.a.deshpande@ti.com>,	Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>,	Venkata Prasad Potturu
 <venkataprasad.potturu@amd.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The
 Capable Hub) <u.kleine-koenig@baylibre.com>,	Tzung-Bi Shih
 <tzungbi@kernel.org>,	Troy Mitchell <troy.mitchell@linux.spacemit.com>,	Tim
 Bird <tim.bird@sony.com>,	Thierry Reding <thierry.reding@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Support Opensource <support.opensource@diasemi.com>,	Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>,	Shengjiu Wang
 <shengjiu.wang@gmail.com>,	Shenghao Ding <shenghao-ding@ti.com>,	Sharique
 Mohammad <sharq0406@gmail.com>,	Sen Wang <sen@ti.com>,	Scott Branden
 <sbranden@broadcom.com>,	Sascha Hauer <s.hauer@pengutronix.de>,	Samuel
 Holland <samuel@sholland.org>,	Robert Jarzmik <robert.jarzmik@free.fr>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,	Ray Jui <rjui@broadcom.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,	Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,	Peter Rosin <peda@lysator.liu.se>,	Paul
 Cercueil <paul@crapouillou.net>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Oder Chiou <oder_chiou@realtek.com>,	Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,	Nicolin Chen
 <nicoleotsuka@gmail.com>,	Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>,	Nicolas Ferre
 <nicolas.ferre@microchip.com>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,	Max Filippov
 <jcmvbkbc@gmail.com>,	Matthias Brugger <matthias.bgg@gmail.com>,	Masami
 Hiramatsu <mhiramat@kernel.org>,	Martin =?ISO-8859-2?Q?Povi=B9er?=
 <povik+lin@cutebit.org>,	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,	Mark Brown <broonie@kernel.org>,	M R
 Swami Reddy <mr.swami.reddy@ti.com>,	Luca Ceresoli
 <luca.ceresoli@bootlin.com>,	Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>,	Linux-ARM
 <linux-arm-kernel@lists.infradead.org>,	Linux-ALSA
 <linux-sound@vger.kernel.org>,	Liam Girdwood <lgirdwood@gmail.com>,
	Lars-Peter <lars@metafoo.de>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,	Krzysztof Kozlowski <krzk@kernel.org>,
	Kiseok Jo <kiseok.jo@irondevice.com>,	Kirill Marinushkin
 <k.marinushkin@gmail.com>,	Kevin Lu <kevin-lu@ti.com>,	Kevin Hilman
 <khilman@baylibre.com>,	Kevin Cernekee <cernekee@chromium.org>,	Jonathan
 Hunter <jonathanh@nvidia.com>,	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jernej Skrabec
 <jernej.skrabec@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Jarkko Nikula
 <jarkko.nikula@bitmer.com>,	James Ogletree
 <jogletre@opensource.cirrus.com>,	"J.M.B. Downing"
 <jonathan.downing@nautel.com>,	Hsieh Hung-En <hungen3108@gmail.com>,	Herve
 Codina <herve.codina@bootlin.com>,	Heiko Stuebner <heiko@sntech.de>,
	HariKrishna Sagala <hariconscious@gmail.com>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Guoqing Jiang <guoqing.jiang@canonical.com>,
	Guenter Roeck <groeck@chromium.org>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Fred Treven <fred.treven@cirrus.com>,	Frank Li
 <Frank.Li@nxp.com>,	Florian Fainelli <florian.fainelli@broadcom.com>,	Fabio
 Estevam <festevam@gmail.com>,	David Rhodes <david.rhodes@cirrus.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,	Daniel Mack
 <daniel@zonque.org>,	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,	Cheng-Yi Chiang
 <cychiang@chromium.org>,	Chen-Yu Tsai <wens@kernel.org>,	Charles Keepax
 <ckeepax@opensource.cirrus.com>,	Bram Vlerick
 <bram.vlerick@openpixelsystems.org>,	Binbin Zhou <zhoubinbin@loongson.cn>,
	Biju Das <biju.das.jz@bp.renesas.com>,	Benson Leung <bleung@chromium.org>,
	Ben Bright <ben.bright@cirrus.com>,	Bartosz Golaszewski <brgl@kernel.org>,
	Baojun Xu <baojun.xu@ti.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alsi@bang-olufsen.dk>,	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	spacemit@lists.linux.dev,	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,	imx@lists.linux.dev,
	chrome-platform@lists.linux.dev
Subject: [PATCH 00/83] ASoC: use .auto_selectable_formats
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 01:58:09 +0000
X-ClientProxiedBy: TYCPR01CA0048.jpnprd01.prod.outlook.com
 (2603:1096:405:1::36) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: e84aa296-5051-4fdc-d631-08debaca3cea
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|18002099003|56012099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	4NVSmRhEjj9Ovek19XY9vQ5p5kmN696dRmDpP+FOqgiFPLBMdQ+LHKQPbTh1qKObSNqmacpXyZERST89hfISpbVWRmFGVzwOFdJJMTySbW8xhbuMh8GKGwHQxsxahYCqQ0ye4N+Lhs9nSX6p+IARfANoMLtajOOcgzfEEpoVtbqryHY4wNwt/rjHoM8XnmNRrCbeKPWdKxiXdqiZwR4Q7D7UWUYUMFsqr6Ww03yFj0AqJrUvdG2khUC45SGAT+xiE+ZprHg2DoSi160oJqj9W+VJvJmd6Lwjw/epbm1Cr5XwZODs0fezHaqZafbNfS2jW1DsZvmmkGUld4dY+0jy6dAQqTdUxB+iA0hUW4/mXB3oCBw2dGEO9VkGhi9i9CRS3uj54mPZEvZrHIwIruQALTIsp9gq6gaIua5WpN4hjhk9KFdJqCALxjTaAXkFJ9Tiewj5YS9IrkVO/Q68QoknvfxULaBunOZW0C4VJMyRo57EaGi1Ln4JPoEWdVBSlbc8DTrESKCL1hxnnRKLmqnG9n0AwMdxPF0KQhxYw31+QYLNRDoxWohh/IDDspX/QKdKa0lXa1TYAxlGyPskhnZdYw+14ia9rQQH2Z9Kd/bnpXya5cMyhj2dK51g9ZWqPtWs4YxKDnaVBNzwwCEwyHzGmjUOBhcbaYg5evK1UrgfmNrAJxY0sI8KOpJWK40ZnHTFw85a8HKt4rpjOqOYKaF1HjNKq2BbiZvQBaytfXWnsGGx1lwJpMuxRpUv/7fgGWO/B1I4fEM11pb/RtlfqgfIHXkPC1i8d4fsYYNd7kbde4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(18002099003)(56012099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pT50V9ZCkJ7vX9p7dyUUHyUtlNWNuBI3MWsqMLv98h2E9CUkjQ34BthxKeqi?=
 =?us-ascii?Q?xKs79J6Y09zWKh2IoYmkzI8GTy1Wqj49mfxTJUMUlfEwYlJFT6iobq8bfXpD?=
 =?us-ascii?Q?pUn/rhWNd70tZp6u+jI8TfnUtv6xW1kcAYpkZB+PkEnjG4Ksw5WIy1xz/2RN?=
 =?us-ascii?Q?U4ix+cQ5EOw07uEhZgi8/xj16x0eOENgh/ZM3MU/muxvwn8LWNbdw8b9mJb/?=
 =?us-ascii?Q?taBNzyliOKQ56LkIua+9+ofPlEiM4CcHq+xM9nnHBHpkQGLBkBfdXF2nNOjT?=
 =?us-ascii?Q?9NXBnG2kTVacZwQ1a1Zh8aMv+NtO4N9VOAps15Z2EFthdPN4vOnL2DwTL0t/?=
 =?us-ascii?Q?O3DkX+Y0KudoaXZOebDMSRLQfa+RB9t1hRRRywJZBeySD7Y3PdrweL6EXSOf?=
 =?us-ascii?Q?Dv8asni6etefdE1xaP/7PrRyNLusNbkbH7ut9t8zk+Hp3qO1D2wRcqHzTPl7?=
 =?us-ascii?Q?u7GH+rKTsVo/S+LTU5qjrLiCRWcshN4TawOYiVfsIJr9i+J6Tcs8ETPDCsuI?=
 =?us-ascii?Q?f24IcfHzUQqWn3yyR7MKeAZuAqHx5m/JVnG4LmZaAe+fgHAyT8WQCoCuC8ld?=
 =?us-ascii?Q?SXgEKo8F8VNKQDyNWxi4F/ALYW+NTnAfPmgl/fm8ah8tNnrTtvHsG2aEAZNV?=
 =?us-ascii?Q?SazFBfDLgIkispPceRxPw6wWCFn3BPAKT3X+h1RGJti5e40QTFuAuEcv2V6v?=
 =?us-ascii?Q?in6eeIZruaffZDbha1igZuffcTt8Hc9/Lq2bIt2jlom2YrMdU9Ra3Xh5OpfD?=
 =?us-ascii?Q?M5kLHQNtED22X7rIW8P9+GTwi5340C+2VZ+7BtHCV3ZR2kJJ6DzIbWYVDVwO?=
 =?us-ascii?Q?QQFF6L2KUdBNINIEQ5q8+6YOiziVIvem1BthfEK453mmxfXVBtfV1F8WdP+8?=
 =?us-ascii?Q?C3QpXFIRCx0nTaISSA8xVdmBILti3TtKIBOr7f/5/E/tcfUjqB0dsTl/gjry?=
 =?us-ascii?Q?agKiwcj5kADo0YeCDhXQnSn2ZzWxtmgO/WqREZ9Y/4d6NNHF6++wkwCEJoMs?=
 =?us-ascii?Q?Qi3ucDdHpASFpG+Za8vtmXdKKIBP7ZT9bPVrpKSwTgjSagh/067PbGJYoTse?=
 =?us-ascii?Q?HHiGoLG0jPLD5FNxAKtkUlzYHQD2zAT/M6k44yUPkoKOcqnNAQVkN3bKDnhv?=
 =?us-ascii?Q?+GuQPCj01hUwHiCdSe8KGf7/ZJP+r8qSRtF1N4t93uRcBG/sS7fjk8oexMEi?=
 =?us-ascii?Q?2aV6IScxhDbXcUcyBUaWUdjrXOE9UgTCAFbHqAfo/bWlsSpaUfbjiBf2e6OV?=
 =?us-ascii?Q?LH0bBEJthQG4r/aZg7R5kySbeGSD5FKauWl8lco/F12Cmc14mLaAXcnoO1cs?=
 =?us-ascii?Q?MWXQqOglPLNZfZrDR6PFK2kyaprMrb4YPkNXO/qACvwCrgPKxbTqYcE4BQcK?=
 =?us-ascii?Q?EJu66WVWS6Av4e6qAxyoYBkB2jenQf1Z3lxV8tt25pB+JDFftVm0adV3S5v4?=
 =?us-ascii?Q?DDDJ9unaTESonch8lFETiXaGmiY8uwZDeKeaZ4RDkwd7JAcvMl67B0zml1Kw?=
 =?us-ascii?Q?ExgjXaYK1GMrFPUroKPAL7On4YL5q+TUyJaFazGxhGtqLzmCw9tuUJ422DFw?=
 =?us-ascii?Q?uK+FSXHXf8IzlH0r7gVz5my7dMB8DgiZFOli3x5KPBD3qGD8RvnMWcU4vCCD?=
 =?us-ascii?Q?redXRKHFhes+iwvVU1parqrJNhg7FvypBXxgXUm1E7NaxqrkMVT9CptmNJu2?=
 =?us-ascii?Q?bgNjpr26Iz8cXCoJMVNanwx2t/Hnix4z8XrseZgZbkz4ncAC73bSFnWmKGL9?=
 =?us-ascii?Q?CuqZKDgsztsH4u6tkVw92h7o1L20X2nA9NA1X64ipyAYWgG5LicX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84aa296-5051-4fdc-d631-08debaca3cea
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:58:10.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfEle0rG8zCiW0urh0Ejr3SXinInWOT/LlewSNXPP/iC2Krdz22AmSlWbV4pr02sKhT4fITI5b0qpdSjZzC2dOwXgP+5zFstrz7mcojXRLpsYCnTd2nzy4BZtXzEhDO5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6599
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[everest-semi.com,kernel.org,gmail.com,mleia.com,ti.com,amd.com,baylibre.com,linux.spacemit.com,sony.com,suse.com,samsung.com,diasemi.com,broadcom.com,pengutronix.de,sholland.org,free.fr,opensource.cirrus.com,vivo.com,timesys.com,lysator.liu.se,crapouillou.net,foss.st.com,realtek.com,analog.com,microchip.com,linaro.org,cutebit.org,googlemail.com,bootlin.com,vger.kernel.org,lists.infradead.org,metafoo.de,bp.renesas.com,socionext.com,irondevice.com,chromium.org,nvidia.com,perex.cz,bitmer.com,nautel.com,sntech.de,canonical.com,glider.be,cirrus.com,nxp.com,amarulasolutions.com,zonque.org,collabora.com,tuxon.dev,openpixelsystems.org,loongson.cn,bang-olufsen.dk,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14738-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_GT_50(0.00)[104];
	TAGGED_RCPT(0.00)[linux-mips,lin,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CBCC95CF9AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Mark, all

I have posted this patch as [RFC] when below. There was no objection
until today, so I post full patch-set.

	Date: Wed, 13 May 2026 00:11:35 +0000

Current ASoC supports snd_soc_daifmt_parse_format() which can specify DAI
format by "dai-format" property from DT.
But strictly speaking, it is SW settings, so doesn't match to DT's policy.

Current ASoC is supporting auto format select via
snd_soc_dai_ops :: .auto_selectable_formats.
But the user is very few today.

DT doesn't need to specify the DAI format via "dai-format", if both CPU
and Codec drivers were supporting .auto_selectable_formats. It will be
automatically selected from .auto_selectable_formats.

But, I noticed that current auto format select method can't handle all cases.
For example, current .auto_selectable_formats is like below

	static u64 xxx_auto_formats[] = {
(A)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|	(x)
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,		(x)

		/* Second Priority */
(B)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|	(y)
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,		(y)
	};

It try to find DAI format from (A) first, and next it will use (A | B).
But it can't handle the format if some format were independent.
For example, DSP_x (y) can't use with xB_IF (x), etc.

So, I would like to update the method. New method doesn't use OR.
It try to find DAI format from (a), next it will use (b).

	static u64 xxx_auto_formats[] = {
(a)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,

		/* Second Priority */
(b)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF,
	};

Switch old method to new method, Current auto select user need to update
.auto_selectable_formats. Fortunately, current few users doesn't have
above limitation. update (A)(B) to (a)(b) style is possible.

	a = A
	b = A | B

I would like to update method, and add .auto_selectable_formats
support on all drivers.

One note is that auto select might not find best format on some CPU/Codec
combination. So "dai-format" is necessary anyway.

And, there haven't been any big problems on .auto_selectable_formats,
because there were few users.
But if all drivers try to use this, it cannot be denied that they may
encounter unknown problems... In such case, "dai-format" can help, though.

Kuninori Morimoto (83):
  ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
  ASoC: codecs: framer-codec: don't use array if single pattarn
  ASoC: codecs: idt821034: don't use array if single pattarn
  ASoC: codecs: peb2466: don't use array if single pattarn
  ASoC: codecs: ak4619: update auto select format
  ASoC: codecs: pcm3168a: update auto select format
  ASoC: renesas: rcar: update auto select format
  ASoC: update auto format selection method
  ASoC: audio-graph-card2: recommend to use auto select DAI format
  ASoC: amd: use .auto_selectable_formats
  ASoC: apple: use .auto_selectable_formats
  ASoC: atmel: use .auto_selectable_formats
  ASoC: au1x: use .auto_selectable_formats
  ASoC: bcm: use .auto_selectable_formats
  ASoC: cirrus: use .auto_selectable_formats
  ASoC: codecs: 88pm860x: use .auto_selectable_formats
  ASoC: codecs: ad1*: use .auto_selectable_formats
  ASoC: codecs: ab8500: use .auto_selectable_formats
  ASoC: codecs: adau*: use .auto_selectable_formats
  ASoC: codecs: adav80x: use .auto_selectable_formats
  ASoC: codecs: ak4*: use .auto_selectable_formats
  ASoC: codecs: ak5*: use .auto_selectable_formats
  ASoC: codecs: alc56*: use .auto_selectable_formats
  ASoC: codecs: arizona: use .auto_selectable_formats
  ASoC: codecs: cpcap: use .auto_selectable_formats
  ASoC: codecs: cros_ec_codec: use .auto_selectable_formats
  ASoC: codecs: cs35l*: use .auto_selectable_formats
  ASoC: codecs: cs42*: use .auto_selectable_formats
  ASoC: codecs: cs5*: use .auto_selectable_formats
  ASoC: codecs: cx2072x: use .auto_selectable_formats
  ASoC: codecs: da*: use .auto_selectable_formats
  ASoC: codecs: es*: use .auto_selectable_formats
  ASoC: codecs: inno_rk3036: use .auto_selectable_formats
  ASoC: codecs: isabelle: use .auto_selectable_formats
  ASoC: codecs: lm49453: use .auto_selectable_formats
  ASoC: codecs: lochnagar-sc: use .auto_selectable_formats
  ASoC: codecs: madera: use .auto_selectable_formats
  ASoC: codecs: max*: use .auto_selectable_formats
  ASoC: codecs: mc13783: use .auto_selectable_formats
  ASoC: codecs: ml26124: use .auto_selectable_formats
  ASoC: codecs: nau*: use .auto_selectable_formats
  ASoC: codecs: ntp8*: use .auto_selectable_formats
  ASoC: codecs: pcm*: use .auto_selectable_formats
  ASoC: codecs: rk33*: use .auto_selectable_formats
  ASoC: codecs: rtq912*: use .auto_selectable_formats
  ASoC: codecs: rt*: use .auto_selectable_formats
  ASoC: codecs: sgtl5000: use .auto_selectable_formats
  ASoC: codecs: si476x: use .auto_selectable_formats
  ASoC: codecs: sma130*: use .auto_selectable_formats
  ASoC: codecs: src4xxx: use .auto_selectable_formats
  ASoC: codecs: ssm*: use .auto_selectable_formats
  ASoC: codecs: sta*: use .auto_selectable_formats
  ASoC: codecs: tas*: use .auto_selectable_formats
  ASoC: codecs: tfa9879: use .auto_selectable_formats
  ASoC: codecs: tlv320*: use .auto_selectable_formats
  ASoC: codecs: tscs454: use .auto_selectable_formats
  ASoC: codecs: twl4030: use .auto_selectable_formats
  ASoC: codecs: uda13*: use .auto_selectable_formats
  ASoC: codecs: wm*: use .auto_selectable_formats
  ASoC: codecs: zl38060: use .auto_selectable_formats
  ASoC: dwc: use .auto_selectable_formats
  ASoC: fsl: use .auto_selectable_formats
  ASoC: hisilicon: use .auto_selectable_formats
  ASoC: img: use .auto_selectable_formats
  ASoC: jz4740: use .auto_selectable_formats
  ASoC: kirkwood: use .auto_selectable_formats
  ASoC: loongson: use .auto_selectable_formats
  ASoC: mediatek: use .auto_selectable_formats
  ASoC: meson: use .auto_selectable_formats
  ASoC: mxs: use .auto_selectable_formats
  ASoC: pxa: use .auto_selectable_formats
  ASoC: renesas: use .auto_selectable_formats
  ASoC: rockchip: use .auto_selectable_formats
  ASoC: samsung: use .auto_selectable_formats
  ASoC: spacemit: use .auto_selectable_formats
  ASoC: sti: use .auto_selectable_formats
  ASoC: stm: use .auto_selectable_formats
  ASoC: sunxi: use .auto_selectable_formats
  ASoC: tegra: use .auto_selectable_formats
  ASoC: ti: use .auto_selectable_formats
  ASoC: uniphier: use .auto_selectable_formats
  ASoC: ux500: use .auto_selectable_formats
  ASoC: xtensa: use .auto_selectable_formats

 include/sound/soc-dai.h                     |  15 +-
 sound/soc/amd/acp/acp-i2s.c                 |   6 +
 sound/soc/amd/raven/acp3x-i2s.c             |   6 +
 sound/soc/amd/vangogh/acp5x-i2s.c           |   6 +
 sound/soc/apple/mca.c                       |  10 +
 sound/soc/atmel/atmel-i2s.c                 |   4 +
 sound/soc/atmel/atmel_ssc_dai.c             |   7 +
 sound/soc/atmel/mchp-i2s-mcc.c              |   9 +
 sound/soc/atmel/mchp-pdmc.c                 |   4 +
 sound/soc/au1x/i2sc.c                       |  11 ++
 sound/soc/au1x/psc-i2s.c                    |  11 ++
 sound/soc/bcm/bcm2835-i2s.c                 |  13 ++
 sound/soc/bcm/cygnus-ssp.c                  |   7 +
 sound/soc/cirrus/ep93xx-i2s.c               |  11 ++
 sound/soc/codecs/88pm860x-codec.c           |   6 +
 sound/soc/codecs/ab8500-codec.c             |  13 ++
 sound/soc/codecs/ad1836.c                   |   6 +
 sound/soc/codecs/ad193x.c                   |  10 +
 sound/soc/codecs/adau1372.c                 |  12 ++
 sound/soc/codecs/adau1373.c                 |  12 ++
 sound/soc/codecs/adau1701.c                 |  11 ++
 sound/soc/codecs/adau17x1.c                 |  13 ++
 sound/soc/codecs/adau1977.c                 |  13 ++
 sound/soc/codecs/adau7118.c                 |  12 ++
 sound/soc/codecs/adav80x.c                  |   8 +
 sound/soc/codecs/ak4104.c                   |   7 +
 sound/soc/codecs/ak4118.c                   |   7 +
 sound/soc/codecs/ak4458.c                   |   9 +
 sound/soc/codecs/ak4535.c                   |   6 +
 sound/soc/codecs/ak4613.c                   |   5 -
 sound/soc/codecs/ak4619.c                   |   8 +-
 sound/soc/codecs/ak4642.c                   |   6 +
 sound/soc/codecs/ak4671.c                   |   7 +
 sound/soc/codecs/ak5386.c                   |   6 +
 sound/soc/codecs/ak5558.c                   |   7 +
 sound/soc/codecs/alc5623.c                  |  11 ++
 sound/soc/codecs/alc5632.c                  |  13 ++
 sound/soc/codecs/arizona.c                  |  12 ++
 sound/soc/codecs/cpcap.c                    |  18 ++
 sound/soc/codecs/cros_ec_codec.c            |   8 +
 sound/soc/codecs/cs35l33.c                  |   6 +
 sound/soc/codecs/cs35l35.c                  |   8 +
 sound/soc/codecs/cs35l36.c                  |  12 ++
 sound/soc/codecs/cs35l41.c                  |  10 +
 sound/soc/codecs/cs35l45.c                  |  10 +
 sound/soc/codecs/cs35l56.c                  |  10 +
 sound/soc/codecs/cs40l50-codec.c            |   9 +
 sound/soc/codecs/cs4234.c                   |   9 +
 sound/soc/codecs/cs4265.c                   |   7 +
 sound/soc/codecs/cs4270.c                   |   6 +
 sound/soc/codecs/cs4271.c                   |   6 +
 sound/soc/codecs/cs42l42.c                  |   9 +
 sound/soc/codecs/cs42l43.c                  |  12 ++
 sound/soc/codecs/cs42l51.c                  |   7 +
 sound/soc/codecs/cs42l52.c                  |  13 ++
 sound/soc/codecs/cs42l56.c                  |   8 +
 sound/soc/codecs/cs42l73.c                  |   7 +
 sound/soc/codecs/cs42l84.c                  |   6 +
 sound/soc/codecs/cs42xx8.c                  |   8 +
 sound/soc/codecs/cs43130.c                  |  14 ++
 sound/soc/codecs/cs4341.c                   |   8 +
 sound/soc/codecs/cs4349.c                   |   7 +
 sound/soc/codecs/cs48l32.c                  |  12 ++
 sound/soc/codecs/cs530x.c                   |   9 +
 sound/soc/codecs/cs53l30.c                  |   8 +
 sound/soc/codecs/cx2072x.c                  |  12 ++
 sound/soc/codecs/da7210.c                   |   7 +
 sound/soc/codecs/da7213.c                   |   5 -
 sound/soc/codecs/da7218.c                   |  12 ++
 sound/soc/codecs/da7219.c                   |  12 ++
 sound/soc/codecs/da732x.c                   |  18 ++
 sound/soc/codecs/da9055.c                   |   8 +
 sound/soc/codecs/es7134.c                   |   6 +
 sound/soc/codecs/es7241.c                   |   7 +
 sound/soc/codecs/es8311.c                   |  19 ++
 sound/soc/codecs/es8316.c                   |   9 +
 sound/soc/codecs/es8323.c                   |  13 ++
 sound/soc/codecs/es8326.c                   |   9 +
 sound/soc/codecs/es8328.c                   |   7 +
 sound/soc/codecs/es8375.c                   |  12 ++
 sound/soc/codecs/es8389.c                   |   9 +
 sound/soc/codecs/framer-codec.c             |   8 +-
 sound/soc/codecs/idt821034.c                |   9 +-
 sound/soc/codecs/inno_rk3036.c              |  12 ++
 sound/soc/codecs/isabelle.c                 |  13 ++
 sound/soc/codecs/lm49453.c                  |  15 ++
 sound/soc/codecs/lochnagar-sc.c             |   8 +
 sound/soc/codecs/madera.c                   |  12 ++
 sound/soc/codecs/max98088.c                 |  12 ++
 sound/soc/codecs/max98090.c                 |  12 ++
 sound/soc/codecs/max98095.c                 |  14 ++
 sound/soc/codecs/max98371.c                 |   7 +
 sound/soc/codecs/max98373-i2c.c             |  10 +
 sound/soc/codecs/max98388.c                 |  10 +
 sound/soc/codecs/max98390.c                 |  10 +
 sound/soc/codecs/max98396.c                 |  12 ++
 sound/soc/codecs/max9850.c                  |  11 ++
 sound/soc/codecs/max98520.c                 |  10 +
 sound/soc/codecs/max9860.c                  |  12 ++
 sound/soc/codecs/max9867.c                  |  10 +
 sound/soc/codecs/max98925.c                 |   8 +
 sound/soc/codecs/max98926.c                 |   8 +
 sound/soc/codecs/max98927.c                 |  10 +
 sound/soc/codecs/mc13783.c                  |  12 ++
 sound/soc/codecs/ml26124.c                  |   6 +
 sound/soc/codecs/nau8325.c                  |  11 ++
 sound/soc/codecs/nau8540.c                  |  11 ++
 sound/soc/codecs/nau8810.c                  |  12 ++
 sound/soc/codecs/nau8821.c                  |  11 ++
 sound/soc/codecs/nau8822.c                  |  12 ++
 sound/soc/codecs/nau8824.c                  |  11 ++
 sound/soc/codecs/nau8825.c                  |  11 ++
 sound/soc/codecs/ntp8835.c                  |   7 +
 sound/soc/codecs/ntp8918.c                  |   7 +
 sound/soc/codecs/pcm1681.c                  |   7 +
 sound/soc/codecs/pcm1754.c                  |   6 +
 sound/soc/codecs/pcm1789.c                  |   7 +
 sound/soc/codecs/pcm179x.c                  |   6 +
 sound/soc/codecs/pcm186x.c                  |   9 +
 sound/soc/codecs/pcm3060.c                  |   7 +
 sound/soc/codecs/pcm3168a.c                 |   8 +-
 sound/soc/codecs/pcm512x.c                  |   9 +
 sound/soc/codecs/peb2466.c                  |   9 +-
 sound/soc/codecs/rk3308_codec.c             |  11 ++
 sound/soc/codecs/rk3328_codec.c             |   9 +
 sound/soc/codecs/rt1011.c                   |  10 +
 sound/soc/codecs/rt1015.c                   |  10 +
 sound/soc/codecs/rt1016.c                   |  10 +
 sound/soc/codecs/rt1019.c                   |  10 +
 sound/soc/codecs/rt1305.c                   |  10 +
 sound/soc/codecs/rt1308.c                   |  10 +
 sound/soc/codecs/rt1318.c                   |  10 +
 sound/soc/codecs/rt274.c                    |   8 +
 sound/soc/codecs/rt286.c                    |   8 +
 sound/soc/codecs/rt298.c                    |   8 +
 sound/soc/codecs/rt5514.c                   |  12 ++
 sound/soc/codecs/rt5616.c                   |  10 +
 sound/soc/codecs/rt5631.c                   |  10 +
 sound/soc/codecs/rt5640.c                   |  10 +
 sound/soc/codecs/rt5645.c                   |  10 +
 sound/soc/codecs/rt5651.c                   |  10 +
 sound/soc/codecs/rt5659.c                   |  10 +
 sound/soc/codecs/rt5660.c                   |  10 +
 sound/soc/codecs/rt5663.c                   |  10 +
 sound/soc/codecs/rt5665.c                   |  10 +
 sound/soc/codecs/rt5668.c                   |  14 ++
 sound/soc/codecs/rt5670.c                   |  10 +
 sound/soc/codecs/rt5677.c                   |  10 +
 sound/soc/codecs/rt5682.c                   |  14 ++
 sound/soc/codecs/rt5682s.c                  |  14 ++
 sound/soc/codecs/rt9120.c                   |   9 +
 sound/soc/codecs/rt9123.c                   |   9 +
 sound/soc/codecs/rtq9124.c                  |   9 +
 sound/soc/codecs/rtq9128.c                  |   9 +
 sound/soc/codecs/sgtl5000.c                 |  11 ++
 sound/soc/codecs/si476x.c                   |  19 ++
 sound/soc/codecs/sma1303.c                  |  13 ++
 sound/soc/codecs/sma1307.c                  |  13 ++
 sound/soc/codecs/src4xxx.c                  |   8 +
 sound/soc/codecs/ssm2518.c                  |  13 ++
 sound/soc/codecs/ssm2602.c                  |  13 ++
 sound/soc/codecs/ssm3515.c                  |  10 +
 sound/soc/codecs/ssm4567.c                  |  13 ++
 sound/soc/codecs/sta32x.c                   |   9 +
 sound/soc/codecs/sta350.c                   |   9 +
 sound/soc/codecs/sta529.c                   |   7 +
 sound/soc/codecs/tas2552.c                  |  14 ++
 sound/soc/codecs/tas2562.c                  |  10 +
 sound/soc/codecs/tas2764.c                  |  12 ++
 sound/soc/codecs/tas2770.c                  |  12 ++
 sound/soc/codecs/tas2780.c                  |  10 +
 sound/soc/codecs/tas5086.c                  |   7 +
 sound/soc/codecs/tas571x.c                  |   7 +
 sound/soc/codecs/tas5720.c                  |   9 +
 sound/soc/codecs/tas6424.c                  |   9 +
 sound/soc/codecs/tfa9879.c                  |   9 +
 sound/soc/codecs/tlv320adc3xxx.c            |  15 ++
 sound/soc/codecs/tlv320adcx140.c            |  12 ++
 sound/soc/codecs/tlv320aic23.c              |   9 +
 sound/soc/codecs/tlv320aic26.c              |   8 +
 sound/soc/codecs/tlv320aic31xx.c            |  11 ++
 sound/soc/codecs/tlv320aic32x4.c            |   8 +
 sound/soc/codecs/tlv320aic3x.c              |  15 ++
 sound/soc/codecs/tlv320dac33.c              |   8 +
 sound/soc/codecs/tscs454.c                  |  15 ++
 sound/soc/codecs/twl4030.c                  |  12 ++
 sound/soc/codecs/uda1334.c                  |   6 +
 sound/soc/codecs/uda1342.c                  |   7 +
 sound/soc/codecs/uda1380.c                  |  11 ++
 sound/soc/codecs/wm2200.c                   |  10 +
 sound/soc/codecs/wm5100.c                   |  10 +
 sound/soc/codecs/wm8350.c                   |  13 ++
 sound/soc/codecs/wm8400.c                   |   9 +
 sound/soc/codecs/wm8510.c                   |  12 ++
 sound/soc/codecs/wm8523.c                   |  13 ++
 sound/soc/codecs/wm8524.c                   |   6 +
 sound/soc/codecs/wm8580.c                   |  15 ++
 sound/soc/codecs/wm8711.c                   |  13 ++
 sound/soc/codecs/wm8728.c                   |   9 +
 sound/soc/codecs/wm8731.c                   |  13 ++
 sound/soc/codecs/wm8737.c                   |  17 ++
 sound/soc/codecs/wm8741.c                   |  13 ++
 sound/soc/codecs/wm8750.c                   |  13 ++
 sound/soc/codecs/wm8753.c                   |  21 ++
 sound/soc/codecs/wm8770.c                   |  11 ++
 sound/soc/codecs/wm8776.c                   |  13 ++
 sound/soc/codecs/wm8804.c                   |  15 +-
 sound/soc/codecs/wm8900.c                   |  19 ++
 sound/soc/codecs/wm8903.c                   |  19 ++
 sound/soc/codecs/wm8904.c                   |  19 ++
 sound/soc/codecs/wm8940.c                   |  13 ++
 sound/soc/codecs/wm8955.c                   |  19 ++
 sound/soc/codecs/wm8960.c                   |  13 ++
 sound/soc/codecs/wm8961.c                   |  19 ++
 sound/soc/codecs/wm8962.c                   |  13 ++
 sound/soc/codecs/wm8971.c                   |  13 ++
 sound/soc/codecs/wm8974.c                   |  12 ++
 sound/soc/codecs/wm8978.c                   |  12 ++
 sound/soc/codecs/wm8983.c                   |  12 ++
 sound/soc/codecs/wm8985.c                   |  19 ++
 sound/soc/codecs/wm8988.c                   |  13 ++
 sound/soc/codecs/wm8990.c                   |   9 +
 sound/soc/codecs/wm8991.c                   |   9 +
 sound/soc/codecs/wm8993.c                   |  19 ++
 sound/soc/codecs/wm8994.c                   |  21 ++
 sound/soc/codecs/wm8995.c                   |  21 ++
 sound/soc/codecs/wm8996.c                   |  12 ++
 sound/soc/codecs/wm9081.c                   |  18 ++
 sound/soc/codecs/wm9713.c                   |  13 ++
 sound/soc/codecs/zl38060.c                  |   6 +
 sound/soc/dwc/dwc-i2s.c                     |   9 +
 sound/soc/fsl/fsl_audmix.c                  |   7 +
 sound/soc/fsl/fsl_esai.c                    |  13 ++
 sound/soc/fsl/fsl_mqs.c                     |   6 +
 sound/soc/fsl/fsl_sai.c                     |  18 ++
 sound/soc/fsl/fsl_ssi.c                     |  13 ++
 sound/soc/fsl/lpc3xxx-i2s.c                 |   4 +
 sound/soc/fsl/mpc5200_psc_i2s.c             |   4 +
 sound/soc/generic/audio-graph-card2.c       |  12 ++
 sound/soc/generic/test-component.c          |   7 -
 sound/soc/hisilicon/hi6210-i2s.c            |   7 +
 sound/soc/img/img-i2s-in.c                  |  12 +-
 sound/soc/img/img-i2s-out.c                 |  13 +-
 sound/soc/img/img-parallel-out.c            |   8 +-
 sound/soc/jz4740/jz4740-i2s.c               |   7 +
 sound/soc/kirkwood/kirkwood-i2s.c           |   7 +
 sound/soc/loongson/loongson_i2s.c           |   6 +
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c |  11 ++
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c  |   6 +
 sound/soc/mediatek/mt8183/mt8183-dai-tdm.c  |  10 +
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c  |  12 ++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c  |  13 ++
 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c |  15 ++
 sound/soc/mediatek/mt8188/mt8188-dai-pcm.c  |  11 ++
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c  |  11 ++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  17 ++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c  |  11 ++
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  |  10 +
 sound/soc/mediatek/mt8365/mt8365-dai-pcm.c  |  11 ++
 sound/soc/meson/t9015.c                     |   6 +
 sound/soc/mxs/mxs-saif.c                    |  10 +
 sound/soc/pxa/mmp-sspa.c                    |   6 +
 sound/soc/pxa/pxa-ssp.c                     |  11 ++
 sound/soc/pxa/pxa2xx-i2s.c                  |   6 +
 sound/soc/renesas/fsi.c                     |   5 -
 sound/soc/renesas/rcar/core.c               |  12 +-
 sound/soc/renesas/rcar/msiof.c              |   5 -
 sound/soc/renesas/rz-ssi.c                  |   9 +
 sound/soc/renesas/siu_dai.c                 |   6 +
 sound/soc/renesas/ssi.c                     |  13 ++
 sound/soc/rockchip/rockchip_i2s.c           |  25 ++-
 sound/soc/rockchip/rockchip_i2s_tdm.c       |  27 ++-
 sound/soc/rockchip/rockchip_pdm.c           |  14 +-
 sound/soc/rockchip/rockchip_sai.c           |  31 ++-
 sound/soc/samsung/i2s.c                     |  29 ++-
 sound/soc/samsung/pcm.c                     |   9 +
 sound/soc/soc-core.c                        | 160 +---------------
 sound/soc/soc-dai.c                         | 201 +++++++++++++++-----
 sound/soc/soc-utils.c                       |   7 -
 sound/soc/spacemit/k1_i2s.c                 |   7 +
 sound/soc/sti/uniperif_player.c             |  29 ++-
 sound/soc/sti/uniperif_reader.c             |  27 ++-
 sound/soc/stm/stm32_i2s.c                   |  12 ++
 sound/soc/stm/stm32_sai_sub.c               |  15 ++
 sound/soc/sunxi/sun4i-i2s.c                 |  13 ++
 sound/soc/sunxi/sun8i-codec.c               |  13 ++
 sound/soc/tegra/tegra20_i2s.c               |  10 +
 sound/soc/tegra/tegra210_i2s.c              |  13 ++
 sound/soc/tegra/tegra30_i2s.c               |  10 +
 sound/soc/ti/davinci-i2s.c                  |  14 +-
 sound/soc/ti/davinci-mcasp.c                |  14 ++
 sound/soc/ti/omap-mcbsp.c                   |  12 ++
 sound/soc/uniphier/aio-cpu.c                |   9 +
 sound/soc/ux500/ux500_msp_dai.c             |  33 ++--
 sound/soc/xtensa/xtfpga-i2s.c               |  12 +-
 295 files changed, 3191 insertions(+), 356 deletions(-)

-- 
2.43.0


