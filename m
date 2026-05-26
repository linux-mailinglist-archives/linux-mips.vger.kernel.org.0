Return-Path: <linux-mips+bounces-14740-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOq8K23/FGp2SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14740-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:03:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB915CFAB1
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D7333044A78
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 01:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346EA2E091B;
	Tue, 26 May 2026 01:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B8vkwXde"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64D2D97BA;
	Tue, 26 May 2026 01:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760737; cv=fail; b=u0dsWzLEb70D/o9w6q1vfW2bjAqMAPYoQSyn9oTedjAt+YRDiJLH8vA5nuy0XuJcSWtYPaJtdwQNO7lemCVIIjtMauLC+dT4i/KKHxpjU6VqrP+jMBzW7040u+0p9giJU2/BSeCoaSfDLh8cj65WneNlM+sMi8D/CEP215I1Ls4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760737; c=relaxed/simple;
	bh=eMAtPwbtMVUNazlyVhh6TN3UW73DM1mKqHA7hZgJoIE=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RlkBr9bGvv3BVHrg6px/TcVmICTc7LXOvL8D9SGUiwKQ3oWnezVzjRjf+pwM2ukcACyz6yrwx79E/RQX17b09vW/1JEC4Doa7XYD//gjJFRwAk7lITg85N3H8+aN76IiTa4x8ONBLSY412l873Qv3i2oxwNOisPBAr2LJvVZwlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B8vkwXde; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=divtqSIvQzvW7zwImk0MC1/lKeevg1ldWgI2gIrU7160mUjXn+ak/Tg1wmMFxtJVMgx6zliQvRNZmOXJCd4qdBi1PnYzpmK50o3kmSgJHpVn9XlQCFLUG99qBRN6XDVWwc/4607TJBp3ZB0xyyHRR+jjxYfzhxBUWfOtiQsCwVsqeEJttuDt/anuaepiyeMFV7Hl5aQqb8WzLymDSaHhWnYTq3rH1AUwaefw9LsHywTj5yLhsOzkJhzmwuC+Bvt1mAnoQ6bs4gadxpgjfH9a93lqIkv/2OcyHzlhf2L9Ux1Rr7Iort2z4UPj86ku/KlhM65yhjs0v0tlZOH+IbxubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd7A+iiGXdIPZmRJyElvKJWQx8+0T/SavFGh2Ol9R00=;
 b=dQ1xfWqJxIcSgHL+BBVwWaQzc+TYujueBiShGjg0/t/nYIR14r1kAZjqEou8iG5V2g7jAq6xFjtlOd4qaj79PTooF9tfe0XbfS6cnztBztrI7pn7MqvN1be+Bz3JRZWshy1L6BZZDK5OmTJVQGipNYhOWqWLh90C6ZEqGusw0UM8193Rs2kp/N5a7RWX2o6xFPgpbIl27Me9tIo7fRrGr+7SLyjIFRnqJrZPCmkyP+phDmAs3R0uHuGK5tr77bxt/8o5gvB7VSJqzTCOrAB2lJEwdn8avfZpkjzlRs0G+plF+u3/1A2V2s+7vHwqUDlILIlJIUI6VN2eBkxZ0V1D8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd7A+iiGXdIPZmRJyElvKJWQx8+0T/SavFGh2Ol9R00=;
 b=B8vkwXdeK1RSyc+rl5FXrNxIaVoAuqpcupBNIh/UNf9MYXsEjicMxH3qsJ/prsVb/Z9MOqYEzpCT1MbICtk6bE28oYiufjMv52i6/t356OROaYgYrulM+E59l1zCM0MZ0jHbnTmTGp7e4+uQau2/9WfQPyOyBB/XagxdxfmO+SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6599.jpnprd01.prod.outlook.com (2603:1096:604:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:58:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:58:51 +0000
Message-ID: <87zf1nhqxx.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 02/83] ASoC: codecs: framer-codec: don't use array if single pattarn
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 01:58:50 +0000
X-ClientProxiedBy: TY4P286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed41ed5-7e1e-49cb-e4f9-08debaca559d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|18002099003|56012099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	K2pkvHia0oiQvcOVq+FUcuYGPWGfuDjAtkEC/PX5wEA44GfG0HuILHlbSDHcxzobra0N2GDNp24kTnBhoxYbh7BWAONO3ojZdEwv0R5jYuzWKyOkpXchxX92qXVnysKgUsISiKewezYVw/NF4urTA2ugQSJjE103/CsUvQFnl2KIzzT4rh1alSfwa2hBvTrKBOM488wadvoQJqZ/tR3azCMTYEL6ffsaFyEBSOYZEk6WB19fQ/zqEm5lq10dEuuBzrhsoNC/0eEArT7ORl12d6fRWYghK+GqTkCPMcJkGtoeNXHm/Wt72GfxrZLgQfBzpgJu4h7w731DP0o97U+Aq71xl2AZW77WRw3WdXu2tUtbuCSNFE9m74FB10IbU4ZOAFEVUIcbyxkG+vzac9x13iROJF4fgAJlnIJLSSvfaIWtE0KUeMjsGE9qd1PCMJ+SnhY85rnzLI+QFZAtDw5pBOdGjTMMkXbzmEwiThuLojpnxa/ePm3olJHtunzOphmIzDn8VeCd27WsS9caPgmZmy3vboaIHfatodsAnITfkQnVv6pDM9tIDDuxop61UzixQarX0ZzPQIg5+EdeSz1/O5FYgT2nMMTbANXbBk/27lohJPC6Z0Ywcdx+FUyOiKQN5PcawCJg0vf20XB4hOKKQ2KaaNw13J+z1ux5b6cYdnsqfA5SVnr6rwOuL6/XakFz5ANY2ErFxBv087Oh7zgm1ItWPkfmKXZ/1cQ/PmgVbv8ddP/dy7AWXSS336t4gvZscr4KqcNJNRDTHdEuR8AG+hcBuNh1hwCopmyoYoM0SUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(18002099003)(56012099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FblC2kxNXtdvsApLjBRTFmvEG7BPGs7HMcyOszv5/1SHo6dObKTxRtGIHi4d?=
 =?us-ascii?Q?qJRmpXwdHHiVfXp73KiKGfqQpNSV8sDOf1eKGGU7ZTquMZA3FzyjUMMbt8KR?=
 =?us-ascii?Q?m6qu7rWqNMuhvV++Zo+7qlGgiyfKOTE/IS8moo6mMPEynHFUsUrQRUqPGcgc?=
 =?us-ascii?Q?C1Z2hnc9zdR8u30u01kYS6ASLyEwrrKPj2tTD7I54jiIahOP7vK0SenJbTfR?=
 =?us-ascii?Q?WDBw0QR7aJZva8RlH6PR9LQboEjZVmEY0AYq6XEtl4CdruvbxLQYyjHfN5Du?=
 =?us-ascii?Q?iUMKYr1yO6iNHYNA9aSkrxsipsBq3OiegvnfTLsu2qaXQij0MNvTbeGjO0SS?=
 =?us-ascii?Q?S3xytLus+q29rD7h3pffzYMZ8tpEKhhWYONRq5xaM4L0VK3g3SIjZH+AMdiS?=
 =?us-ascii?Q?MtqWDEi17uJOQmqOB+dBq9+yehl0ghoY5wwGYnXjuoURT0r048BTpSAyaSkK?=
 =?us-ascii?Q?xUIvaBwHKvdfdIGpgBySUbzTP47N3IkVSH/nWKeDrnQgGjfJH6GAloP0zA0V?=
 =?us-ascii?Q?YPeyUnG1EMjiIrNnzaWA/uQZmEGY3F1ytbpAW/C+wsGZv2KXASYccks2qWWx?=
 =?us-ascii?Q?3cQnhb9Hv5F75TVIkll62Ue5KztDY1HlxAuS0Oq/glLWu2XqyRlyKOhCo8kY?=
 =?us-ascii?Q?0rHwckwrQRDd7/X6XkQ27v0BJlNVEWnbIDIhJZrOwsl39IPQ/K5Xwlx78Hcs?=
 =?us-ascii?Q?rUbLUS2lOcGP4bxQ2FmM2Q8AGhjt/BAO597s4686kWsrRkKJMcWkj74TrlEd?=
 =?us-ascii?Q?x7Go8jMEmgbVP3/DJJ+G1AxUqRpMI7B1VTwAyYbxxHax9dxWXLE90pHduBnk?=
 =?us-ascii?Q?gJJd2Iwy6LlYYQU3HJeT4oQUFvwdeprwBCNYhjTP6uBcvlJ9k5O7MzdUH8wr?=
 =?us-ascii?Q?JvgwYB3D1gaIf2yQ5MocJXirD8b6zi8zkodUtGKoT32bCX7GzU6w8ZK/6X5P?=
 =?us-ascii?Q?1MzKVUmTBRXlsNVgV4f6NOWLYRFcWXMJVGClQ7DvnLufUGcfy6J2J8m/GDSM?=
 =?us-ascii?Q?/D7MozZhfuZdyMFSxLRem2tkxhlET93kNL9kEJm9ue94nU2uCvsBL02BQhAw?=
 =?us-ascii?Q?Z0ML8DOD1YZTRWZsXRtillcF/JsWbo+DAlQJLamzP/6yfPc5rcDClhmUtT+X?=
 =?us-ascii?Q?fyxEpv83dh46ClDu/B/w8Z3I+xPN8XROs2u4ABdnubVuNKpadbRC6PCm8xxH?=
 =?us-ascii?Q?zwbxQ+y2scQHEY52bP4IoLTV/issjnIuNksvg9jafJU6/sSe1fIMuJHKRuR+?=
 =?us-ascii?Q?BiblImXLPt8FZUyFsB5M09dxWQ+7nuZyzuIudYHcFx99G8wQPWdIRxzApjFn?=
 =?us-ascii?Q?S5VBTDR+tz4PElUWGBkyFk50J6qp8vkkLBfyVhOboMknX1jCUJe6ZaTeMWRG?=
 =?us-ascii?Q?qb4vUFrKjnK3C7v7CSYTHlDyt3UDsnylcqWIjkkwTVmvBXwFtlbTPpmyrytF?=
 =?us-ascii?Q?JJPEdPffDbmLyL36flVGzky5aNE2UDhB7K63qh9LboFy4WKGaQHKMYl8ffi3?=
 =?us-ascii?Q?V9JoB/ySVhXV6FAoYQnyvW9WIsCg69dR5hPfBsggTRuCFrm9YiRGJHgEDW5o?=
 =?us-ascii?Q?2VO/HhG37LDFrJf2J/fFFQ6zYREw/hqF9ysEqlMM7ibSulpb13wUQ7M0W43c?=
 =?us-ascii?Q?6n4HlodF56fNTY7glZrPmH6l2RPHG5EuxGyZR/MDdDrauU693Eq2ASFghlWS?=
 =?us-ascii?Q?BTms1RdlnW4+duVdrfPTAZCxiR4RWbeCNJ9URmqs3Zw/uy5yVDluWvUOuixF?=
 =?us-ascii?Q?91rysE8ZWDRhJsYX/qFV8USlIijcqqSj9oFfmf4cK/PnFkUsr3wA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed41ed5-7e1e-49cb-e4f9-08debaca559d
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:58:51.7743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvTBbu28B3uiQGUCYu5H9pFVixGV58rFVlXzYDQqwITawqM6nsyy9HtdwmRs63Wv+C3y+F6IPDSMKAKm787dvnkJL7YSydPAyGcaSgJsDjVWg8QP6t3hbGWgCksOV9G5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6599
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
	TAGGED_FROM(0.00)[bounces-14740-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 2EB915CFAB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/framer-codec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
index 6f57a3aeecc89..a87a78390172d 100644
--- a/sound/soc/codecs/framer-codec.c
+++ b/sound/soc/codecs/framer-codec.c
@@ -238,15 +238,13 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const u64 framer_dai_formats[] = {
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+static const u64 framer_dai_formats = SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops framer_dai_ops = {
 	.startup	= framer_dai_startup,
 	.set_tdm_slot	= framer_dai_set_tdm_slot,
-	.auto_selectable_formats     = framer_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(framer_dai_formats),
+	.auto_selectable_formats     = &framer_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver framer_dai_driver = {
-- 
2.43.0


