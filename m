Return-Path: <linux-mips+bounces-14739-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHA0C1D+FGqMSAcAu9opvQ
	(envelope-from <linux-mips+bounces-14739-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:58:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B365CF9C8
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A65F030090A9
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 01:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821472DB7A3;
	Tue, 26 May 2026 01:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xd4AMlWZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846232D0292;
	Tue, 26 May 2026 01:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760717; cv=fail; b=DuKMkK8aoFQk3jXa7K7FRtRwsPN/cWNcMjtgnOzcP9dSCJ0gKbOZRTHOYJvjvkL2W8K/mWE6aFOXR077h+rSptCcWtHseBx/qul5+INhWpHum6PFaGZhT4RRToov8lKI+2CWc17xN2MmIX4hr+KJcb0YPB1E9PTGfHXdgeqARHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760717; c=relaxed/simple;
	bh=0+rFyW8HSHxVOITNYkdCooxzCq3z1/dM413hDtZSCcE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ncjQRtV1AotQFB5a2PBF4LCKO1tWe68IYj8qFiA2NwqD24m7RF5j3a+/ZQo0Rg+qO0o0hpAigZFQ9bunP1H++YtGqXxWFUOfNNw+Za9y3lHpUnSjqbE2s+zx1O9oVjgRuCXCS8mta4DLdBA5GtUrifa51nwdI5LX5Kd2dtH/TUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xd4AMlWZ; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yl6lgQmDcomn2ppPqWZxW1WCbBS91yUOL0VHN38FTqBg+IqTiY+HyEAQ6XrHAio/5F8YfrZbeMJ5ZtHB1fqdtz2rf3pDJr9Mpxmh1y7YiVXc37HSg65pvtrMnMPX1WaUR9uXdV/n1hHhuMPXYXvk9fDkVd6qhti8DL/ZDITEQNvlwL1bsLIhb/a1MCtUFr8JbzO4O+LEvsjPFOzUYVbjeRA0IJaUsEsqRiHg9NxSYQgmCh1MQGMs5bRP+7R+EgwMwYmkwhUiKuC9M2EVqBLzpE4/EY+qVQ/vNgaG2jnH277cJPicPtJ+qVlGfRLdGV/fU57efK1vmmIJi6ufKRcJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E9NxPTSmS++qYOweZjYs/I8aBfiOLsdwU/kmVdWGW4=;
 b=mFneJY4plHIMsfEzSeqZKKDBji31KNyOoMG2iA9X8h5W+mBXvBmaRvFw0wuIaJIYotuRwW7d6XemRu1zB+EKrcSwudrVtt3vzmUUs24yKQNj/8Gz5QmVsTMkQBCbcXXO1BR0JmXy2n2kjKGjTA5yxuvJ9+mVWaiROfxuXa6h3vC4ikGkypnjEKq18gb7EekjvoEwHRlYSvBkTn/xSeADfZBUZ4yrW2m6t7PtNMawjtc3mWh3ghV7BTcuyuz6gznGXt60rg5mUaUAhF6rj8lx6lqAsEYfUXM2Gse4qHEQDWB1Q9P0YBCWpTdqy7iMAT9EqAQKbY6eB47ids2W5LP1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E9NxPTSmS++qYOweZjYs/I8aBfiOLsdwU/kmVdWGW4=;
 b=Xd4AMlWZq9BjaYdCx5yalCLmymTtgnPFlGA2oGZeYMBXYyeFX9Jgtqpuxlh03k0g+c08Bx61TYEx8SCWWETfLgL+BRRcHby4HfSbAb7j6fbjM2uFRln7BwxUNLHhgAANbTAKCdID9TIyIE6Xl5f6HetFlNFwKAZ7qnYjVvrRZ0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6599.jpnprd01.prod.outlook.com (2603:1096:604:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:58:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:58:32 +0000
Message-ID: <871pezj5iy.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 01/83] ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 01:58:29 +0000
X-ClientProxiedBy: OS0PR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:604:26::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 9675b627-f1e4-4cf3-9e5b-08debaca49ee
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|18002099003|56012099003|22082099003|6133799003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	MkCphqqWYENXcE5ciINo93K5nJ4aeeX7Bos3aKtsu7Ot9r96MmEtmzU2au0hK1RF0oMajxdDCJ86CzO+b4E59hTDtJYsudpeF0hPJjrRNEhNjhdE4yKJCr9OQzIZyfii7RYfvG6+3xVTqCOBGOpO3msdb6Z2fCyJ92x6SrDy6skZjoVASEXAx0c/5U3J5OXBhbHIL06EVWQ/8g+0d9XhEGSGS7mnApMAAl5K2DaS/72eHgaugVtvBc26NN2YxOFmPCvoCF+ccwS3RSFe65xxNpX8vsp5PpNXGRXtZXR7i+LDnfms/IBhX7TmFTYdnYqrYPmy/j2jbBANfemTGErG8+yL70gm/BwBFVAqnThmmHSbwAsLs7b1Cj/eGfkWBdxQ3tZPyxOybBmqDmVSHdXPpiGOmqvpcLfa9+i8DKh8vpL/gnYkUhdIvAm6P3C2GZneVa3MjwCGqUeCDsPHPdqLKw8O5H+/q0NFS8cr4L/BOeUuUyFzWKIbVeZq2qdQPCkLZjI7H8M6/CXEVzAjKmNgcMmf/EXJpE2m4zF5R6RxiYKJVp+HiD6pPR8xo5QfBdlv/rSs6edR3Iouy8qV6Q/1tABU4n4bkA6Z36JcWngj9uEgjmY5q/SWnw0vAI0FLpXxE4PWNsiOG1SD6V9netiPL+rE+L66cmCL+dF28V6v9lTlkGZ2/EtWpZKAWJ9jkPgVSRsBicpwm1FiA6xDtizajnQJ+vkpI8KMqTjkJkDeF9N5N3zfVVx2hvrsSp7ztOrrmBUo0jX4g18sqlmzZHfesbRy+p7lT2atsfAA4vWwg7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j3xUQbl84/UOxC4UWjWfnkXcHs0qF2kWeZ+RYMSxeggX7IZWsxWWevxUv6mw?=
 =?us-ascii?Q?BtDFerxxxNYyVBbTVCBgrnUSeS3TBgUgMPOAYoBsCQ5q1R+38r9SGMroJbtu?=
 =?us-ascii?Q?NlgoFG3jizDsJYk0wni/Ojv71CWStkc0Tnm6S88EK1vBRtVKt+JeuJhy/1cW?=
 =?us-ascii?Q?rXD5loICxr6BEsdZUyROax4wVDEW1Epl11W6HjCOQeTUGxhn+zZAtWgDhlg+?=
 =?us-ascii?Q?qWQ3xHUqBx9lhSaixE2cU8qtsrF8ACsONdOh5yNDc4X4WjKE56uICeCFHWR+?=
 =?us-ascii?Q?a4rGN/kM8EFqFT7Q6mM5SMic7WMSUtUqEwJAaGO3BWrzGr0mb0OHz9LQ6kOT?=
 =?us-ascii?Q?yhM8dIOLGCg1bLO/DBj5p6dNlgpqT3l++QzE1sJjOpZfAKT4BuZyfpsruBkR?=
 =?us-ascii?Q?uARcerWt9BbcD1rbphIBGlrAN52JbTVU/6odl/1ja6yesdZTiKd1ZVgG4Viv?=
 =?us-ascii?Q?6L+pzFGeeR7hdKMTwhYoe3HQpdmgRONr14pPxxavKV8L6Zbi+N/jA8q6blR7?=
 =?us-ascii?Q?75050V7aut2T807Z18PA6pSEEqfVNpBi0PgXdZ33Amp0IGn6QwX3lRKQ0FKk?=
 =?us-ascii?Q?7FQSrubBaZXVLV5DF9VVJEt+7+F6CKAZPBqnt9h+Sy+J0qmA/5tth5TYMEDV?=
 =?us-ascii?Q?kmMXSJnAdF9CiASPu7mLhJbuu8Y2OQrGp5dtDmXcuG+iFqTzc7mOykLxRZT3?=
 =?us-ascii?Q?sHEyTiuW0jPW7L1/FnSx6BOhwJBvW7Qjzh7+vQIfZ8AIo3kXWWC+Kehv2hlO?=
 =?us-ascii?Q?z4WkHCIVkRFriIkqBXLTf+PyfoyZkrFtqmBjEjW4oqMwweBsfX7pF3BjkWZZ?=
 =?us-ascii?Q?byGrURi4C0iBskB1KUCYl1vUFYZ8JGrnD2GzaaETlN6w3xypkbSIkSDP4dIU?=
 =?us-ascii?Q?hNPw3/diNzHuke+C07Dzc7FDO0Rhkk7Ks2jpQTg9WKIFu12qTdMLs+2+ezlm?=
 =?us-ascii?Q?vnjSwfRKiZI30tECSKcgNkZwRSjdwlgE6Kb18zlgJgyOV8qr+OJUcdbPnmaz?=
 =?us-ascii?Q?GtESUQgvgar1lJER2E+cSFbcMg6OpL9zud7qsouAfYjsDu//8JEAmURXWueh?=
 =?us-ascii?Q?7/BwS/KBa0WNATpCo5JEb84t/r+Pe3Idtb3zu4HRviTKZg8qNUAUl4WmJnT3?=
 =?us-ascii?Q?pteeg4HO6H4VDpCa1X4Pn9zZmPm7gpE4y7JzXkme/oCc+LlKSyKnQqNhgmGC?=
 =?us-ascii?Q?QNM0I6BCDpci1vmDjRe2bw9lmpVmlYWWtpiDCMszbEQDOAQss2QGTlXzysOP?=
 =?us-ascii?Q?V9KtpV0zVPM7x4gWaFvti8NCijApphhetySnzJkpoz37WYtQVqNdz+9zp4Bm?=
 =?us-ascii?Q?N/BCTh4xR+l7gGHkYbgTgPpfjyR3oT2d6W5+ny/5B/UBm1ynIC4+af/KZ+LL?=
 =?us-ascii?Q?Tu5fdcqh5hf6UrdGRKn/97qIiu3MRYINgc7xfKjLK0/Iu55LGCVS1ceYwwoV?=
 =?us-ascii?Q?FqtBHHoSAf0Xd4ZM/AaeURXuGkb+jj10BHKl/dGqd+ZeiT4TBfGncg0Pc1mB?=
 =?us-ascii?Q?byi98u4X1mrNwLV9Q8xNjRAXAreoLDeUArl8Q/o8dTwZfWHj9EZHoIri5EvH?=
 =?us-ascii?Q?Pik3M/NPLUPnrpEg7KX2/QhzOaHnUAAkRj/sSuRVS27E72mpVjW+dULaNdl1?=
 =?us-ascii?Q?hfRDvIwULQj75oaOdHTDx3lM1Tjzk+bJSSLUgJevyshMsrXkG4RlX3BRnuuG?=
 =?us-ascii?Q?7RKnmIsPcLjT0Fuw2aRlFaRueggAOjnjCoJhBaMLE6GQCr+/UhNEEK6kDOx4?=
 =?us-ascii?Q?is1u4G+wqIL27FYdureZeYp+DIpF1r3SsfhTGPEpHQ4CNvltMblb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9675b627-f1e4-4cf3-9e5b-08debaca49ee
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:58:32.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnwLUGiIYJy6c9bWsYCD4iNkXjWYKtemIEP6nTI5xwZWOLSVG8Z9EvMSgMB8MzxgK1tZoRLv48Q7rdQT0JLBo+gRcEsOAwFd/Qhi+eWqwX4S5DtR6DIJufQW8PqS4mrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6599
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14739-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C8B365CF9C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clock provider / consumer selection is based on board, we can't select
automatically from software. Let's remove SND_SOC_POSSIBLE_xBx_xFx.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h            |  8 --------
 sound/soc/codecs/ak4613.c          |  5 -----
 sound/soc/codecs/ak4619.c          |  6 ------
 sound/soc/codecs/da7213.c          |  5 -----
 sound/soc/codecs/pcm3168a.c        |  6 ------
 sound/soc/generic/test-component.c |  7 -------
 sound/soc/renesas/fsi.c            |  5 -----
 sound/soc/renesas/rcar/core.c      |  3 ---
 sound/soc/renesas/rcar/msiof.c     |  5 -----
 sound/soc/soc-core.c               | 15 ---------------
 sound/soc/soc-utils.c              |  7 -------
 11 files changed, 72 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 6a42812bba8ca..06ed6774229bc 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -139,14 +139,6 @@ struct snd_compr_stream;
 #define SND_SOC_DAIFMT_BP_FC		SND_SOC_DAIFMT_CBP_CFC
 #define SND_SOC_DAIFMT_BC_FC		SND_SOC_DAIFMT_CBC_CFC
 
-/* Describes the possible PCM format */
-#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT	48
-#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_MASK	(0xFFFFULL << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBP_CFP			(0x1ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBC_CFP			(0x2ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBP_CFC			(0x4ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-#define SND_SOC_POSSIBLE_DAIFMT_CBC_CFC			(0x8ULL    << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
-
 #define SND_SOC_DAIFMT_FORMAT_MASK		0x000f
 #define SND_SOC_DAIFMT_CLOCK_MASK		0x00f0
 #define SND_SOC_DAIFMT_INV_MASK			0x0f00
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3b198b9b46051..3e0696b5abf52 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -748,11 +748,6 @@ static int ak4613_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-/*
- * Select below from Sound Card, not Auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 ak4613_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 755c002f0f159..192b0c3413968 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -778,12 +778,6 @@ static int ak4619_dai_startup(struct snd_pcm_substream *substream,
 }
 
 static u64 ak4619_dai_formats[] = {
-	/*
-	 * Select below from Sound Card, not here
-	 *	SND_SOC_DAIFMT_CBC_CFC
-	 *	SND_SOC_DAIFMT_CBP_CFP
-	 */
-
 	/* First Priority */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 98b8858ded025..4bf91ab2553a2 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1720,11 +1720,6 @@ static int da7213_set_component_pll(struct snd_soc_component *component,
 	return _da7213_set_component_pll(component, pll_id, source, fref, fout);
 }
 
-/*
- * Select below from Sound Card, not Auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 da7213_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index c8617a488b11c..7c570efaa1ea3 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -563,12 +563,6 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const u64 pcm3168a_dai_formats[] = {
-	/*
-	 * Select below from Sound Card, not here
-	 *	SND_SOC_DAIFMT_CBC_CFC
-	 *	SND_SOC_DAIFMT_CBP_CFP
-	 */
-
 	/*
 	 * First Priority
 	 */
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index fc40d024152e6..6f9f498c4c5c1 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -191,13 +191,6 @@ static int test_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct
 }
 
 static const u64 test_dai_formats =
-	/*
-	 * Select below from Sound Card, not auto
-	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FP
-	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FP
-	 *	SND_SOC_POSSIBLE_DAIFMT_BP_FC
-	 *	SND_SOC_POSSIBLE_DAIFMT_BC_FC
-	 */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f49..1eb3e83c0616c 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1694,11 +1694,6 @@ static int fsi_dai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/*
- * Select below from Sound Card, not auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 fsi_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 2dc078358612d..abf2059985162 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1042,9 +1042,6 @@ static const u64 rsnd_soc_dai_formats[] = {
 	 * 1st Priority
 	 *
 	 * Well tested formats.
-	 * Select below from Sound Card, not auto
-	 *	SND_SOC_DAIFMT_CBC_CFC
-	 *	SND_SOC_DAIFMT_CBP_CFP
 	 */
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 2671abc028cce..128543fc4fc97 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -363,11 +363,6 @@ static int msiof_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-/*
- * Select below from Sound Card, not auto
- *	SND_SOC_DAIFMT_CBC_CFC
- *	SND_SOC_DAIFMT_CBP_CFP
- */
 static const u64 msiof_dai_formats = SND_SOC_POSSIBLE_DAIFMT_I2S	|
 				     SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 				     SND_SOC_POSSIBLE_DAIFMT_NB_NF;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2c05299604b33..04a2d64d977b3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1401,21 +1401,6 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
 			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
 			break;
-		/*
-		 * for clock provider / consumer
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_CBP_CFP:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBP_CFP;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_CBC_CFP:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBC_CFP;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_CBP_CFC:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBP_CFC;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_CBC_CFC:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) | SND_SOC_DAIFMT_CBC_CFC;
-			break;
 		}
 	}
 
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index c8adfff826bd4..d1937fc217dc7 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -182,13 +182,6 @@ static const struct snd_soc_component_driver dummy_codec = {
 			SNDRV_PCM_FMTBIT_U32_LE | \
 			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
-/*
- * Select these from Sound Card Manually
- *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFP
- *	SND_SOC_POSSIBLE_DAIFMT_CBP_CFC
- *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFP
- *	SND_SOC_POSSIBLE_DAIFMT_CBC_CFC
- */
 static const u64 dummy_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_I2S	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
-- 
2.43.0


