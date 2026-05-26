Return-Path: <linux-mips+bounces-14748-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFeUORgAFWp2SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14748-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:06:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5FF5CFB7B
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ACE0301589C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681152EC0A2;
	Tue, 26 May 2026 02:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cwfVLx2W"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA0429AB05;
	Tue, 26 May 2026 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760977; cv=fail; b=coMRF7RoQkMmgLMa+5NfxW/Lcxtz7QlXQbgu0xufSOYzfg9l5HlFAIendMSwMUIzSv1Ovj9LQSF3e/JMtVROuQ7f3PojExV2JxMpmvVrEdkiULQtgm0rdQF6RYS1A42eyNl/2bk3zRPRexNuLPs0ILLp8EDhYvtxzSAzaBeoTvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760977; c=relaxed/simple;
	bh=oy9dOjOJE7oAmbW/k/rNL0hIpfAe9x6+CWdElXYD+78=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XsO4vEAi8hFJJHIQV9wWERrOcR5HlGSzgOaJ4/S2HZ2696K4bwi9HN1cddKzDOZwpbgLzL0Ze/qhRVn60djPheMdv9BXR+POXegRcKQXxgfQpkczT3hwsXPoNDmTuOOJiIYxTEsCTv+J0P2kNn3HS8KlJTnSY4ZTYO3U7IJ06ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cwfVLx2W; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZQfbEvZZws9NpZ92dQ5ftFfAm5TD2BQ2IR5uhLMJahqnmAzfLLiCH/HMWl53L1mnRA/d8+pZmzrPfj9IamQn3SKAglNQYiCBXNjD1Rv+m7mum9BtnebjFRBAeRwsUrVX7WaVbbAq6mUN+rBTqXY3/3CrvXLnpfWlyVjccNJcsCuQ/ke/V+8v5SvTBm9N7W6nAVQjFYkgM1bU+A0i3O47WarP9s3ni7GBDsoD/NK66UEo2+ozz8YXKGctPC9FO4zgQ4i2DIuEueEipPKMCp72Zm0QRYJ+VBdalpa2hg6epypjGRT6UNGKRIDQPJetn6DtpIo7RVGeqSbTngdoCb80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZzyuMY+ine31Yf/SbFLYA03Wdf2YOQtMFdwi1L2CyA=;
 b=QS4N9IaLOdyYWjKG5GQE+ZS4PAxpqA8ulxOmWW6KF9OMtQtPUlsR59sywlxT7TxN4s/J580l8SRIoV/523GAE+uNagyTvUdJjQVH0ScvYbyWcKG481Zifl37KKkbJbF+SmAFjwuvh/JN4vDBrLSVmsm06NtWH+YXc9h9tQyLsCATm7deS/F51+YTLC+d/CWLRyhCITb9+3KNfqsRqdYKE19vpnKvesisiU7PHNLxT6qp7TnXp21znl45Gh4zUoJaPqlEUlwNiOQWXsN6OQn42wlMnaY58us98hAi/mYCIJNnlR5fnvphalbnbFOT+gSFSpoj3PWfNt6qW+VnlpKGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZzyuMY+ine31Yf/SbFLYA03Wdf2YOQtMFdwi1L2CyA=;
 b=cwfVLx2WjbGLowToYNA88ygEo01burN9Dn3iOE+qRKN8GsAoO7p66/DofzMcQW0HtuOptZ4rd+GLnyBFE11YKCVTw/8QGjyGW4B+5pgjQmK4QIbUqBQ8AUTUOA9Q60vR0jnjUALwQYCvBtk1LUCVw1bJdMuW1x8tUIsbPNuq3qg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15186.jpnprd01.prod.outlook.com (2603:1096:604:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:02:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:02:52 +0000
Message-ID: <87o6i3hqs7.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 10/83] ASoC: amd: use .auto_selectable_formats
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:02:21 +0000
X-ClientProxiedBy: DS7PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15186:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d62eea-3519-4a9f-8b33-08debacae469
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014|11063799006|6133799003|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	FatuwA+XcgQKYVVnqpxKXNxCSbBtVYk5Hv3pmQAaG0sUzmGejkl8G8fJ5/dB7Dvd24Oma0AXXlwlWwIst2pidXRHaUN0eDNkI515dwZkP8M76joH74a0cOyWYnPHEAwlKRCcAhmyyILkEkaZHQvuuyS4omQKC3eKVWFy+JigesPy2mPN4gwsABIZxgz05suQXDWWL/oPfbNoBTWK8IVAo5u48XgTjOC1DuJGui+P8+XD/EGgDQWr6LnHdqPGDbRiUPDW3qZzbJKBsBEsYwYWQjD7SdkuOSGglbNYplf4C9ZguP4ITvY2J4dESVh/IPT2rgoU0LYzBIAjRl1oJzEgT5ZyHaW/mdr8gRr+uUqv8mKJ1O8sdGHLrNde8U0vkfTNfwpOqfKkw+8T83cohyX/FrUAOlFVDOsqZlc19Aw/mURz7mE02vCC0lhuN2YZC5ghtvEQRHERS33CCY3SzjOahzIeMIhB1nNw7I70CM98dM1LMXhxPNzq2N2dkLREpiW6P6PbLAldcQuygMl/yxve+gA/42MzVfqE9CI1PVmqo/baXTNA9dFG0VnmNgPUX1kM0FkZU41A8BSZBoqWkI2guMJ0UpFr41QTzr6blFWYzldCHkvTgrBq+2v35yYmfLibrKNXTuzhyL546Px8brXIPM7ysN5PyvuJUn72yXtFN+ChW4sVG0xh/kVyjuknnHHRjgEZ8t9PDgOGpFlxgDvAYpjftm2yTwhx+QPboe0eihz7YNzJsNGTQf/CV4rFzTDsBU3t+9yRp/fBU6urzKK4EKEnO68iZzDV/mHlFEGoU2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014)(11063799006)(6133799003)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1qi5N2dlLF7QFQPRyJ+anf6DDnfq8s1CyZpAepgbnAVFscagGbPV/blWmlOx?=
 =?us-ascii?Q?ZOt7udy+AsqbHKwP/yJj6iTeItjV08HkN8h29uYSKU/QH49mA6Egx371y941?=
 =?us-ascii?Q?68dz3xJMi1hRXLMIfm3nsLSXcCWfZFsTn3sqNxXUJ67r0OK55TPqRH2b81p4?=
 =?us-ascii?Q?IiF0avQRbPt46h3BDlymsf1u5G2EtgU2y5qH8iS3+Yglr9BK9LJMuGB9GWfl?=
 =?us-ascii?Q?qiRP1QDO5GpolhJVHS8Z2KnmYyKKaBjKKJtHVAei0zTjzawAsgQIUGEvlsTR?=
 =?us-ascii?Q?m5t+5dtZFZn05rrX0u8VBjFt42VrPAjAZK5qFgT202W5tZwtNJLiJCvQWs1A?=
 =?us-ascii?Q?W39uktP7OTwC4/czcHVVwaAoE0cg3VOR91k8fjVejKvuGKeAMFDNnvP4bEg4?=
 =?us-ascii?Q?c0H83eWOR4levGKIVB1TycYNcGYqnKeG1jS16MCsWVhdgVNYAd4G5OAInzOF?=
 =?us-ascii?Q?Xp7F+BLXQU+ur68+5bfC0rBEKebWAVATDhVPzeka6VD+3atEq1+bRWdfUrOW?=
 =?us-ascii?Q?0y/vdDyhLCzOnEGfjyP5lCj4LgxLGSbkh7JjJlZU9ut/BOX8E8P2h4DXNBcN?=
 =?us-ascii?Q?22+kdwDGJUvzepdhaiNCbSYKRsdwENeGwAtkQt+qpzsixo1nBZyi3/++02tb?=
 =?us-ascii?Q?SZfQ28qg6KE5rK5dqf8S3O/RYhQXzqhWmbQFe/Ae4vXDKdDaDZeVVZD44ndK?=
 =?us-ascii?Q?DVsL6ReAWQ8Z2fV0jWDcjZAbjYRzCFUJ3HsLlUpGoy0Y/6e9Y2/Sk7nt0sus?=
 =?us-ascii?Q?fROzxUKoyg4aDwHz9F7BFtOcSYNWFkASHe975eyISl6/tcj0jmkKsfVzfFfd?=
 =?us-ascii?Q?SjHOcjRflD41Mn2ZUyGTG2YPsmWKa8LXkbsLatqIRILIRA4mrAQ2YTyEWB/l?=
 =?us-ascii?Q?wdxZt0cWV4TZjcLrRlylYFmmLq4B/lcGFU/ATRcmTuXkjy/pml0wlRE/HwIW?=
 =?us-ascii?Q?m4WdPjSB/EF2vsEN8m/ByDSDIYuP43r0Fhu+OLWUE0ZsQmEoL8kpgC4swOnm?=
 =?us-ascii?Q?eT2Uux9oZMC4BEFdiM8KC8E5QeimMW3+73u6oGKKUmjc7+qJommD9xdqj/Ky?=
 =?us-ascii?Q?h9FtPjxvq82GNvLlTGQUa35RYWHUHeDABeOKF9VbJtD1c63AO52u2n35+9j7?=
 =?us-ascii?Q?33WJRGjMkSQtheQo0xc036ALl3DwbyQWfHjwPPDmhhpGTXFKRlpaqeORRQnU?=
 =?us-ascii?Q?24L+tX4dZxtrJ7sCwIijiLlbQ1cxbvYRVO8L++RMsBV8A5XhPHZg0yKLud1z?=
 =?us-ascii?Q?iU4B8yDo9uOs3B8KlaRKc6GzAvXcLSgps31S92qs9cq6ScwiV0A7rowwQdBl?=
 =?us-ascii?Q?5hCaZ+NlVtN7DJeseh3l5doxUb91IkqaNLg/xtESZx/sTvoPM8sXYJsg3zXz?=
 =?us-ascii?Q?R3mwnY2OYLWcSY0WHdbNi9OHPqdq/pEVS6Dn9cSY8XAHlWYDhJwW258XiWq5?=
 =?us-ascii?Q?jtGRMbRmF1GE6dvpnnmOjjcuhTYVT3xjBgJ9Pw/x2nLuvRyTyo3m/FUPYxYA?=
 =?us-ascii?Q?b1SPIQsO46NyLvsUur4k6YAiQD3vIz0iRfSzHOpnJNCpXjsOjDklor2Agypy?=
 =?us-ascii?Q?OpEEQNceFh+ALnqdAw8BgDaHzPhMLZx2CQSQeLevUPTFZLoEP/dJrDPKzqes?=
 =?us-ascii?Q?6HDHghz0MZBA1G4+Y7GjrCnV0F6QfprH3rEBKQdh6bMfqJChUZ+CYIB31IqA?=
 =?us-ascii?Q?l8i8AeFwu+NO0mISuDDafY45oBKHDesMUkUx0rDrWFdTyUp20w3nzICwqBxv?=
 =?us-ascii?Q?kaefGnN8crAdki+aXjwGZCLY48Km+8TvfYTCKH2A/g0Db7oroLvg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d62eea-3519-4a9f-8b33-08debacae469
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:02:51.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXvZeQeDeDTFd+xcnjgKDa2+NZmVvRhQtICy7kNk9ABzxpPItK/7AoVMKONbqMInni6FIdOx2iKfk38ctw7vkQAtN6Um5Pbe41xDSHCHgp4ukSDOscJ48H55QX5gUUJf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15186
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14748-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 4B5FF5CFB7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-i2s.c       | 6 ++++++
 sound/soc/amd/raven/acp3x-i2s.c   | 6 ++++++
 sound/soc/amd/vangogh/acp5x-i2s.c | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 283a674c7e2c3..bb58a9d34993b 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -686,6 +686,10 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	return 0;
 }
 
+static const u64 acp_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.startup	= acp_i2s_startup,
 	.hw_params	= acp_i2s_hwparams,
@@ -693,6 +697,8 @@ const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.trigger	= acp_i2s_trigger,
 	.set_fmt	= acp_i2s_set_fmt,
 	.set_tdm_slot	= acp_i2s_set_tdm_slot,
+	.auto_selectable_formats	= &acp_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, "SND_SOC_ACP_COMMON");
 
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 352485dd98b14..b0147e88ba54c 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -250,11 +250,17 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp3x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
 	.hw_params = acp3x_i2s_hwparams,
 	.trigger = acp3x_i2s_trigger,
 	.set_fmt = acp3x_i2s_set_fmt,
 	.set_tdm_slot = acp3x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp3x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp3x_dai_component = {
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index bf719f6286174..dbfb87e2fe929 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -337,11 +337,17 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static const u64 acp5x_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
 	.hw_params = acp5x_i2s_hwparams,
 	.trigger = acp5x_i2s_trigger,
 	.set_fmt = acp5x_i2s_set_fmt,
 	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
+	.auto_selectable_formats = &acp5x_i2s_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static const struct snd_soc_component_driver acp5x_dai_component = {
-- 
2.43.0


