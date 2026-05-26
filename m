Return-Path: <linux-mips+bounces-14745-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eD7ODJ//FGqpSAcAu9opvQ
	(envelope-from <linux-mips+bounces-14745-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF45CFB01
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10679301DE24
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A329A2E62B5;
	Tue, 26 May 2026 02:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eelKgD+n"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0F2D63F8;
	Tue, 26 May 2026 02:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760849; cv=fail; b=aOLwruHBqzTrjjQQpNovSLpUAbTgy62ehIi2lxRh1NM6qTep0/gJe9RSIRpQszRjXOHLTEJVGEhH8Ia+UwsY9/jDATzoVDHqCOSK3eKdpBo+1QcShnloa7J8h0fmx1mJ2L769pC/Pf29tlvkSWu/kh9MFkbbF0G1LypN/QE14PU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760849; c=relaxed/simple;
	bh=1aDkYGLhgoukYLXv2zk5dJCf6D3S9HC5LrDiC5V/rBE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=eTeBNJjBT6iVOrK7MJ7sp7i5SBLrLtmD/EwRvG4eqCpv7EPpCcCXga9FoqMjLPjnjm6f+K6yCNUQv6DT1HQGFQ5s9UiQEVWF4HNPQ7htclEd7l4VJBLaBFVtxRyE8E7JTXBjfYoQG97d0Gpphb1WCCl3NrbfK/H+8UUNu7N9v6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eelKgD+n; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igdGlZwS/4Ls9hcgslkM+ZDg3i+yZ/JN4rHRXGVP3CsnHRAps2hyldIvO2U/+1756MaWTejmQMZncVXCiaQF1OtoIEizu7BS0ePXVt5mm//fXZr8/HwZ+aKBV4oPZVG+1lWXYIiD9fK4AHpQXfRjkSxna7mb8oY+kjlZYN4K5hvbAuDIHeXA4O8xFMlcCpQOpiwJuxPcq8++pKd0d7nOC0QQzEzIeJahFaz9SnGvmQkbmdPt/jCcVZHu8RjgmbnNWeHqb2M9ksQhJr0mW831Hg4CbeXfCJTEVH9gQZXp7vQivXmJ1AHKDBVfY/lfOxuHuAqqSTZFEJjNbiEPIxNjiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=353yp7GPMAdLtdegc80zWFAAM/lHyfINbP/KeVO9Bbc=;
 b=Cczfca3yMj1IOpTo7nTs2UNPR8irfSnZo/PeICB1taD8Y9PJkab+m7GibeIsTgnWH8jn1bHHfkj3KcgWpMtwLwJlnAfCEQCG0NhbybYUWtfPhx6Ge3SefQsvQ6tNM+aMiKYX3sM6YCLPGxJMBlZigtR/tYbZPvf1QAyO1ddN90xM8W49FncICA3EudXqkZVnNDJ1Nmm+jKNX+3LCECNtTIin168GNdEmvVGlH9Yf3rE7H7cFSESV4qI81WW/WSquHG7sdVSItTW4cYchkObi1kCvF/N82ABZsNbRVWjRkXezqEYyfs2efnxi71qw4wfLn0s9ROMDF6LNuX+nn5pXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=353yp7GPMAdLtdegc80zWFAAM/lHyfINbP/KeVO9Bbc=;
 b=eelKgD+nYQK2NiiSEa7vpPtTgDIenMyHvuMz9/TNq1gsugUT3b6kTCt9ypr44F1BEZR60q4d12gfDeGPakIDXvLX/kS2HQdkFalO1ASrPyZlpXOOKF7Zj7+6XqeXrYItu6UfW5ELcqQl86vImQgOKFwt91pLqTk7cNE+4p5+qd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15186.jpnprd01.prod.outlook.com (2603:1096:604:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:00:42 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:00:42 +0000
Message-ID: <87se7fhqvo.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 07/83] ASoC: renesas: rcar: update auto select format
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:00:16 +0000
X-ClientProxiedBy: PNYPR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25d::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15186:EE_
X-MS-Office365-Filtering-Correlation-Id: 688bb757-7679-4424-cc41-08debaca97a9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014|11063799006|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	OBtMFHXoPu377BG81AwurLRYHLv2oUszR/8MZEdK1GlAu5w0uk8/ZdUL8ILlgNJZNEZ59fAOiWBJW+xmdCxCvmta3Ob34wZtzifwzTHCd1+wzFo0ZvzXMznRaMaIiXf2LkziJOHqZ19TNfPUmXz9DfN293QdZ+tmyHMmwQW5qaEk1nbwXm0nAeOz7C/yMkEmdo1l0jMJZEuLNXmkCqBXDgKq+2LhFoFfz2chf1vn4OzRjlFXh3oCliuBm7oby3EkEvqjfJ0WOq0j4GcCPSozMlMvkYnnnY/vaVIXU5qdXIlpKchEmSXDsuklG/wblCh76dpdMWPW8jQhetQKvugY5k71NbUYQLh5OcLFazf8cAYfdr+howbd8q7LJ003Z2P7FLc70V8TENq9EIRJC6dNj/YijiAQNgKtFCP5/V1quicvC2nrsB9GQJSNRxZJ7pnggQkM05yQ19uO/JfKtiLtjXsN42iSCfH+FwNqeRZkjmU59qV8F18QoJUej5qDTNCUdwKAulkgOOGlhBY0gbfwBZVcjblpwHvZo0SaLkDYIPKYUFLQsH5GisDoUagiBDteX1FY9aMdIcUBGpjmXDDZj8DR8xymJnwCaESwVC+e8t+pWjNZvQhB7LlY7cRWwGbixg9CSZ/2aT3r51OVCLW0/X3tVAt0NmFbCC/Ud6fwWyNmVp+bbNnvvVCrygJtWHjfophA1b+0jvpvpHfEQxSLOXLTXRMHWPLzmmTJ+dbzbcMt+TMIr3fAxdQb8+qSVeHnMQTVRT1nGQdJdSWoDuylOGs2Gd3qPUaxhJe+S8ZkIV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NPMOQowuCun1oWPcuIAjNYGPkh49SoxAOqvPrPDWAiIS/s+WH/usx5G7/Xar?=
 =?us-ascii?Q?0XUrX0sYKm0okT4NWsO3YVdNrPQEAsY5SEF5A4HLEN1qupm/SMLERmJazgb/?=
 =?us-ascii?Q?u1EXy4UezARlSRtaJjp4KE8NHzJ2UtXq1BqY04TVPAZxaW0ZPZm2cprDKtyz?=
 =?us-ascii?Q?9dUm3bwly1zHa86y/7OuLd8qublX3outM02kXN4xHgN3Euxsv1Hka6NaX54n?=
 =?us-ascii?Q?bLSkksG1dTnH1FNDmXXfsfcEfM8ShytiwHOeTNlWk0MHYOw72gCfp7bSvkEg?=
 =?us-ascii?Q?2iKOxEdtM7NWBFLzEx6vr1Rx2O1eyTaKoImFYRYmww8f/j+j/XJYA64JfOrf?=
 =?us-ascii?Q?AycWqaJy0WQqmLqo9xX5QjHODXKl8ubaeGBqo0Cd/qi4hkdAkRedO0uu90m+?=
 =?us-ascii?Q?KOjwm8WHQsejlT23c8oe7OAHEOry89M+ogVk/kPrzyXb37yxvHrC0iZgOkNd?=
 =?us-ascii?Q?e+CVCBMHAs59rvD8l2KD6ihvNgF1Jp8s+WawjxZ+4q7WCDM9iTcagQaOIb+i?=
 =?us-ascii?Q?Xx69qrubuFl1Mp7/vazm1FQkI563tS4WWDjNIBfgOzdcTLI8IKqlWbTT2W03?=
 =?us-ascii?Q?UARtId9kjlmyh8PJqe13/eSrREUYyaBu0p8QK8ingRbTLS3vbUSwVlCUqYd2?=
 =?us-ascii?Q?38lKyRIrO1+Zfb39JQkL+6KBSKKckEAIXl1MgksaR7vHwk77JQuOsHpVQmXI?=
 =?us-ascii?Q?MNKxdP4ZWpr4XtyqKMAaiDW4ARNPIk6SBg7MSFPDrh1Skz0GdVg97Yu6RDgM?=
 =?us-ascii?Q?od6OqUR+afmxTl+FrUSbh8om1XacTL7ldqgOVgtX+sfAYl1dMgccj9JgThlG?=
 =?us-ascii?Q?hp1YWiQX37hUHpTJw8ZSRjjLe+ajmMePpxaTN5eJgQPtpfL3cOcwdnXNz3k3?=
 =?us-ascii?Q?leY/rCPnO8XL5OowLe8spaPJVji9ndos3bnt1zwwKyv6xm8EzFJYb2/OmjkU?=
 =?us-ascii?Q?YCdaA21nbmTDdmI4wXlnXs26zvvR1EIdToYOKRSBboxXF76zQcN+LPlTzv9r?=
 =?us-ascii?Q?1TprFKEVHoiKAvlbKcTDTJ0qlbIN56xAVxaVZJT1GVf4t8aUE4EiFaxfpPSB?=
 =?us-ascii?Q?BPEeupf+EtRlLgLrriqI2gHwNARib7YO3Z2NJKwEmfzB3sFgP2INZM9otfYB?=
 =?us-ascii?Q?ANLLsI0kM6rKdPZNjHQeHdYEuNgNrcL5ZqgYP+DqQN9tOR0YwUBVBJLHZyXK?=
 =?us-ascii?Q?arsiDVsxdqpkE+fGaV0umIXqX/riZx9HybTdpkrWjmyJfW6PkP8qFMZus/C8?=
 =?us-ascii?Q?SUouwIGrEfRrve5+HEKAiZ3OwQVQuXNzY8dDrV+kwyPZp1C4MuWwFny4IDaZ?=
 =?us-ascii?Q?T2pPsdUFGaVBSiw17FmugQF4HuT7aXAZTiAcoXxenTO2DL4iI202Mou2/+8n?=
 =?us-ascii?Q?cwhSTP34z2LpYRld5jrAqXQSlgGJd3jO8IFNisn6N5YU1KDQjLci4l/twSy7?=
 =?us-ascii?Q?bancv4D0QDnm+OCeeP209welRtbiT5NAzIAG9XItfOYMUiU75uH71uFaqhgN?=
 =?us-ascii?Q?SojXi/1xIcxIrbHu5Kb1lSSsuQiGzP/A05XifUZdqoKWsDFf0D+wJaCQfepV?=
 =?us-ascii?Q?8t4R3c2xGBWpguZ6x8TrYMARVssFFbq1ME28lskK9IoQWl/8Pt7Uj0yhp9co?=
 =?us-ascii?Q?OI/LJ/HssT3WDB3aLoDNAfWoPaQczk+6v83t9pjsoubWMXreBLCPopLogWbl?=
 =?us-ascii?Q?3ia2PLjovk2R24oQn2IFS0AxyDE1UhIymOgcPCWcu3INrDBYywuXarT+gB3R?=
 =?us-ascii?Q?h0wlZRjnFOie2X+LGU83VMZVGdQpmTOefRVlLyIGfnW4m4Q26qCm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688bb757-7679-4424-cc41-08debaca97a9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:00:42.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffMAqN7XHvdIgi9XurZFP7mmXg48+hsQp/QrcJ6B0vNzZOfZqKIcmWCt7dF5kEHSukZLAFn0M+4ZS/U1BfT2kh3EAMjr8MRbXjadhFbdfBDUX3bZGoIKZT7j2K0nsM/l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15186
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14745-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_GT_50(0.00)[104];
	TAGGED_RCPT(0.00)[linux-mips,lin,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,renesas.com:mid,renesas.com:dkim]
X-Rspamd-Queue-Id: C1AF45CFB01
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
 sound/soc/renesas/rcar/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index abf2059985162..7afa3892f50e5 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1055,8 +1055,15 @@ static const u64 rsnd_soc_dai_formats[] = {
 	 *
 	 * Supported, but not well tested
 	 */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF,
 };
 
 static void rsnd_parse_tdm_split_mode(struct rsnd_priv *priv,
-- 
2.43.0


