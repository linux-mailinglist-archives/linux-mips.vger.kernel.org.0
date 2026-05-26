Return-Path: <linux-mips+bounces-14746-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLMnOKP/FGp2SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14746-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2265CFB18
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D556530209EA
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911EB2E228D;
	Tue, 26 May 2026 02:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ljZR4VNy"
X-Original-To: linux-mips@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793DD45BE3;
	Tue, 26 May 2026 02:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760860; cv=fail; b=IEIHCRY0UWIM01JhjtvmA2uEgR3j55j+m/nb2DhGNNwHU6dUhJowF4VxMVDJcQIjNoAo+nfbJt7eFxGoQTtUopSz0We/QtCfrAEvpKa9SStCStThuQMREsTaC0T1ffuRsOFD25wj9ARdNEX4TSAovSVq606HvgJgEKRliMvQhJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760860; c=relaxed/simple;
	bh=QxFNfMkDcCk8EjA2rocGBK5qkpoAI5YVBq/GFbiKKZw=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VzVcPg2mnXG8x0gmLS8syAr38swnQcdT3jPzjjNmIjwYV/spCDA2asSq4ulQRPA6vfa7v88AgIZ0Q7l11cTACe3M0rH4mRfbhqL16qEd5HDqDLwYZq+LB3+oeyEJHFl53wLVZBlUhFOWHJTj2DyXxHn4iKtSXHTisql4tmAZbUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ljZR4VNy; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5eSrpSr+JzM1ccmbzBzdErwNEayDFfUJMZdlPACZyhboLirBt2E97LmirOxntmsFh7ENFw2iz0Kfigff/IgRhv1D+hpEtVq05BVHjoQHbotMd/e3R+7BA7PLrNCOBI4mHJdVN5x2bN6zoJBK/1m7Y3ybwabo2s8+kKyIz7cE1+yyQSYMNVj7ZAo/x4gvXOTLa8CWmJ684j4MGeMSNRhwmMIoMvXD0YbO2s4u/+VRRO2iQFE5fz69aOTfqoXm/DIU1iMZScznzENFTdbrijcsVohM39M521r5DlNral+XyB1iBPxmOyG8sPKwvR28pDn0GQdseB4P4zp8N64uv6+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71yAKmp/+y7ngJnvPouZyc8NVs2I7VtMWPThQtEBJqA=;
 b=VoPMdtXOys0lsdyzpHXygTIqHsfJsPRl0uLFRlQDc6pDLHwZyi9MDtP8XDJGgJSOPeq7Z2hLdwwX/ZyW+BmhaHMJT532VYbJQyxnVuq3o7WbAT4XPC9QP1+L0LPZ0H/8aq0tY1L/LIrZ7WDmk3Bns7qQbFv5pjMV4CrX/VZY38Sb9Y5qpJy5bPiD1XrSQwNZ5BL2anZW/YAQ1YyeCzEXtBScBCKZsONRpgobEA0u1vh4P+vDAVnKbiYxvxXvvnBCCPbnks1yE5j2UtJ1/nJK2q1u53WPEfurioclOZ/8VwRxSQptVPeLfRERqdqOftG240hnSzhdbzRfxHo0UR1ecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71yAKmp/+y7ngJnvPouZyc8NVs2I7VtMWPThQtEBJqA=;
 b=ljZR4VNyDyDmWOnyvzCSR3GD+ylMS2dWFuHSA2tzzSgjAraPaqAl16673gzdZUvFOqTuTSKGEPqzL2BWiA3zhzO5t2SfhtBpG2XvpX0MRKlJypI9qzou31wZsttIS984AbobLy0ft/hGH9eR+KtpQrxRhaV0dGOc9uhbwahZ4zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15186.jpnprd01.prod.outlook.com (2603:1096:604:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:00:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:00:54 +0000
Message-ID: <87qzmzhquk.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 08/83] ASoC: update auto format selection method
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 02:00:52 +0000
X-ClientProxiedBy: OS0PR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:604:9a::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15186:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bcac89-0b54-4c1f-b25e-08debaca9eeb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014|11063799006|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	INWY3PL09MJ0rB4vhE6hu7e0mrL1KWSzTbEuhP5xHcPqjR11YifQcQYHf0J49ZXCb1uf0QHXDgIZsWODecK++OQLOj1b5+rdthHQLz7qGeAPjJAfPJVJFLevP03i7YmHUF41zWZNLWwPYB/LV8zESrXaPx44Y6n4F58vE09qaIebOjGiJXyhcJnpknpn9bZJEZKg8bWvQP3icjpGmLb85RM4fTWHQs7JposBOYabLQe0Iai3PSezfpAd9YXcrQNKK01SZN7DtRQkgAEW1OV+jQGwq1mLV4u+SJK0sTUkvvZUb2d54zFzGhci6FKxH7HCmvX3Yn43ZP/41rC+i0oMeRZ8XgfgKR05lnMTWQjnhtYUoRq6YPi/yj5c+o+y+xOO8sGzPU8isSlVP3tt2ZmcCvCMFAAmTzmLuh8lEg5/Zr2t/V9pKmh64dj7I1nWJOV4W6Pzzn4qq0Cd5t9cdYHr0DkzpPl2XT5RZg6ACQANw4gyX/zLJ8o8DghklXDwHgu6C0RRkd7cM9S/MrNRwdIANhdg7uO+76iRG2Y++KeFy53GjfMP4X4Xhrl4LKJz4yLp9PjqwLJOGg0XcyefF40zkIFDALdM/sYatYVpy03T7Lj0ioU149ts8qC0XddnPYvegNcQOz7SI4NE7rsxIb+3UdKHthsmcs0R3HJEY6Mw9trSVkZdfCg1JakNxeQsmdbNpRVXB4IDfbvTGhohT56WmKzVRviSNBA0Oi5IRyfCVL3wsv59WvQU0gCgpY5+rX2IekGcb/6LAoaId8anbZllckr8zWurPOYgElyCeK1a1vE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cm704Y2zL/DrvcVK9zhYtnJYBCkZPcfOElCYDbmph/qX+fNIvmME02Gzyrrp?=
 =?us-ascii?Q?J6IQCydM4jCHcoZqPd0X3vlRH3zDzVu9SlMeB0PylGoBnb1VoeN8ywZh7Kux?=
 =?us-ascii?Q?k+D+MJnVm2G60GZLlHCzUXodQtseQsSbI+i/rRteODh8obYw79X2yD+6MsDB?=
 =?us-ascii?Q?0/KTt0WQ4RoUp3EOK65IlMI+r8/hTSnAubJ90W8xMLT7j7IFLeUz7o9srov/?=
 =?us-ascii?Q?GGOEK+U/UclJGj4jABUfQS7/He9TYN5FQgC/sKikl0futj1d7pT8cBXt+YzO?=
 =?us-ascii?Q?bU/pG573l/sUs1LeOsbdMad9L766NCsbKnftIfcUX/hcGee/1pmZl4MKKlCv?=
 =?us-ascii?Q?k/VZ+9SVZASLiKefE40FyrH9VQ/aY+HllD8M9gdGH3lfSwxYknYxAbkrqBGZ?=
 =?us-ascii?Q?XcePEaTyO7Pur86FaizufeP9CBL09lXzhBFuvXmJvpr1z6FLu5wss0FGFuGc?=
 =?us-ascii?Q?4c2si8pN+0yUwg6IdKeS30pqrznoavXfrBstYhs0niu6fTamn8AA+001KZ9k?=
 =?us-ascii?Q?J4krO/A1rdvhNneWRlaNiIzr/c8tjRGNEen/mxXrPNtRwKP4v2T+6LHEdTck?=
 =?us-ascii?Q?+6C7ZezpWKEJXnzD520cyeWtPa5RE2HvHmXZowx48Dypo6u32NGosOtHYw3k?=
 =?us-ascii?Q?6DNqxHK8h1HtTpCT6TCCZHajruzIzVccXPOSA8qQWcdvX8Pew4XZmjlgm4fo?=
 =?us-ascii?Q?2LIrMt3f1AwVEh4CjALCE+VV8tJG5zSCHy5ZigFfMERPfUCFBCyfaQvrM5T5?=
 =?us-ascii?Q?xDasA4sRBhomi2ZwdhbBc76BM5jl/dnrT36IoXlDVI2eo77kvlI/ldB9ZSg8?=
 =?us-ascii?Q?Qq0kJOb0oqMtDgYFrSY9EoV/Oz0IuO94mJfHWHU7Dsfu4UO2wlqaDjdPY+kO?=
 =?us-ascii?Q?MSPBBizu2tY9qIT62MleQjt5cieMhuITYZoHmb9POn+P/c5m1DvhYFpobCOQ?=
 =?us-ascii?Q?wnjBD3hOflXTp1WE3IIRBHbvTMXyz1jnyqRLhrNJSiVfBzmucIBvNOFlo2oZ?=
 =?us-ascii?Q?vLQZBKw1ESKDRs0gzm0fMl4dN+Zsnid04G055YldF2qk1Qbt+ufNjB9ISUx3?=
 =?us-ascii?Q?ipQw65ITUB4RcOVAysBHMflVf9cl5klPzCYvkgy+MHsoF5HJ9dXUPMzvwQQi?=
 =?us-ascii?Q?u5epbFK+aVEyE1JCysPn4yabcRlZGjME1ozh/JYTUwAAwV++WC4jnthMppBI?=
 =?us-ascii?Q?ykf9j1WcC4OU0KMQlDJTALn9lhFffWwszigwethsQiQ9Ba8MBjciOZK5gigQ?=
 =?us-ascii?Q?Mw5Lg+s6HLvbfS+KORASds7xJ5UX/NyY2VFsKU35H9w4jdzE5+sahJVQ0sb4?=
 =?us-ascii?Q?lF7hwGavuCDXzA7Qcc+t9gOJumrVoZxEVGB5ptad3m4/1VPq9hE0rAW8JhU6?=
 =?us-ascii?Q?uorMXXWS8fFI16BlRGQdCBczEYiJEd+Ni/Dz+Lu+dd8dMO6mjXxfmQ1OpAra?=
 =?us-ascii?Q?bJLu7XWbcHtd6dzAknYXofTt+X4pGgxpIfo6e7QMepkWbyZUv45CdxRg+1vA?=
 =?us-ascii?Q?uafu3u/Sn1qjjk2OSjAgFOLuq/Q56ZyYRPvvaGffsx+DqIAxXNnygYAPgrrX?=
 =?us-ascii?Q?p6sXD6ut1KcwI+LAfSMpuaqlo9QbXfK/E9HW8b+dfA1fhuDhgAuL3MsB1btO?=
 =?us-ascii?Q?BrS6fj/8pyI18PyLQmShcSMy414s3N4Lp7J1SbvvLxvSp7qV/cjDhJfOk43A?=
 =?us-ascii?Q?gO+l8SGLjF2aeV5LOk1TrxwqfQAu8pc7UIVV6skkDgIc7qq6/Zl0sIWwD8Lg?=
 =?us-ascii?Q?H6/UIxTFr/htqsLC9rdfimY8guYhcRIhxnxdZPtNMDNAJ2Rl1mrk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bcac89-0b54-4c1f-b25e-08debaca9eeb
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:00:54.7202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1O0ybSiqTZEuPRcznyukMuOM4qbrS8qwaqTSdUFG1oLh1h8Q4fV409zqRsOKft5I/TdY2Xalset6Kpprd9E80lSOpsqW9Wjis28suY5aES5Pe6plGJ5uDHzvkVcc4k4
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
	TAGGED_FROM(0.00)[bounces-14746-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: 7E2265CFB18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current DAI supports auto format selection. It allow to have array like
below.

(X)	static u64 xxx_auto_formats[] = {
(A)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J,

		/* Second Priority */
(B)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,
	};

It try to find available format from I2S/LEFT_J first (A).
Then, try to find from I2S/LEFT_J/DSP_A/DSP_B if couldn't find (A)+(B).
(OR:ed)

In this method, it can't handle if there is format combination.
For example, some driver has pattern.

Pattern1
	I2S/RIFHT_J/LEFT_J (FORMAT) and NB_NF/IB_IF/IB_NF/NB_IF (INV)_
Pattern2
	DSP_A/DSP_B        (FORMAT) and NB_NF/      IB_NF

Because it will try to OR Pattern1 and Pattern2, un-supported
pattern might be selected.

This patch update method not to use OR, and assumes full format array.
Above sample (X) need to be

	static u64 xxx_auto_formats[] = {
		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J,

		/* Second Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,
	};

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |   7 +-
 sound/soc/soc-core.c    | 145 +----------------------------
 sound/soc/soc-dai.c     | 201 +++++++++++++++++++++++++++++++---------
 3 files changed, 159 insertions(+), 194 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 06ed6774229bc..d9947a4595d74 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -80,10 +80,10 @@ struct snd_compr_stream;
 /*
  * define GATED -> CONT. GATED will be selected if both are selected.
  * see
- *	snd_soc_runtime_get_dai_fmt()
+ *	soc_dai_convert_possiblefmt_to_daifmt()
  */
 #define SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT	16
-#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK	(0xFFFF	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
+#define SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK	(0xFFFFULL << SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 #define SND_SOC_POSSIBLE_DAIFMT_GATED		(0x1ULL	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 #define SND_SOC_POSSIBLE_DAIFMT_CONT		(0x2ULL	<< SND_SOC_POSSIBLE_DAIFMT_CLOCK_SHIFT)
 
@@ -181,8 +181,7 @@ int snd_soc_dai_set_pll(struct snd_soc_dai *dai,
 int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 
 /* Digital Audio interface formatting */
-int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd);
-u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority);
+unsigned int snd_soc_dai_auto_select_format(const struct snd_soc_pcm_runtime *rtd);
 int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 04a2d64d977b3..691fd7fc5030d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1284,148 +1284,6 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_pcm_runtimes);
 
-static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *dai, *not_used;
-	u64 pos, possible_fmt;
-	unsigned int mask = 0, dai_fmt = 0;
-	int i, j, priority, pri, until;
-
-	/*
-	 * Get selectable format from each DAIs.
-	 *
-	 ****************************
-	 *            NOTE
-	 * Using .auto_selectable_formats is not mandatory,
-	 * we can select format manually from Sound Card.
-	 * When use it, driver should list well tested format only.
-	 ****************************
-	 *
-	 * ex)
-	 *	auto_selectable_formats (= SND_SOC_POSSIBLE_xxx)
-	 *		 (A)	 (B)	 (C)
-	 *	DAI0_: { 0x000F, 0x00F0, 0x0F00 };
-	 *	DAI1 : { 0xF000, 0x0F00 };
-	 *		 (X)	 (Y)
-	 *
-	 * "until" will be 3 in this case (MAX array size from DAI0 and DAI1)
-	 * Here is dev_dbg() message and comments
-	 *
-	 * priority = 1
-	 * DAI0: (pri, fmt) = (1, 000000000000000F) // 1st check (A) DAI1 is not selected
-	 * DAI1: (pri, fmt) = (0, 0000000000000000) //               Necessary Waste
-	 * DAI0: (pri, fmt) = (1, 000000000000000F) // 2nd check (A)
-	 * DAI1: (pri, fmt) = (1, 000000000000F000) //           (X)
-	 * priority = 2
-	 * DAI0: (pri, fmt) = (2, 00000000000000FF) // 3rd check (A) + (B)
-	 * DAI1: (pri, fmt) = (1, 000000000000F000) //           (X)
-	 * DAI0: (pri, fmt) = (2, 00000000000000FF) // 4th check (A) + (B)
-	 * DAI1: (pri, fmt) = (2, 000000000000FF00) //           (X) + (Y)
-	 * priority = 3
-	 * DAI0: (pri, fmt) = (3, 0000000000000FFF) // 5th check (A) + (B) + (C)
-	 * DAI1: (pri, fmt) = (2, 000000000000FF00) //           (X) + (Y)
-	 * found auto selected format: 0000000000000F00
-	 */
-	until = snd_soc_dai_get_fmt_max_priority(rtd);
-	for (priority = 1; priority <= until; priority++) {
-		for_each_rtd_dais(rtd, j, not_used) {
-
-			possible_fmt = ULLONG_MAX;
-			for_each_rtd_dais(rtd, i, dai) {
-				u64 fmt = 0;
-
-				pri = (j >= i) ? priority : priority - 1;
-				fmt = snd_soc_dai_get_fmt(dai, pri);
-				possible_fmt &= fmt;
-			}
-			if (possible_fmt)
-				goto found;
-		}
-	}
-	/* Not Found */
-	return;
-found:
-	/*
-	 * convert POSSIBLE_DAIFMT to DAIFMT
-	 *
-	 * Some basic/default settings on each is defined as 0.
-	 * see
-	 *	SND_SOC_DAIFMT_NB_NF
-	 *	SND_SOC_DAIFMT_GATED
-	 *
-	 * SND_SOC_DAIFMT_xxx_MASK can't notice it if Sound Card specify
-	 * these value, and will be overwrite to auto selected value.
-	 *
-	 * To avoid such issue, loop from 63 to 0 here.
-	 * Small number of SND_SOC_POSSIBLE_xxx will be Hi priority.
-	 * Basic/Default settings of each part and above are defined
-	 * as Hi priority (= small number) of SND_SOC_POSSIBLE_xxx.
-	 */
-	for (i = 63; i >= 0; i--) {
-		pos = 1ULL << i;
-		switch (possible_fmt & pos) {
-		/*
-		 * for format
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_I2S:
-		case SND_SOC_POSSIBLE_DAIFMT_RIGHT_J:
-		case SND_SOC_POSSIBLE_DAIFMT_LEFT_J:
-		case SND_SOC_POSSIBLE_DAIFMT_DSP_A:
-		case SND_SOC_POSSIBLE_DAIFMT_DSP_B:
-		case SND_SOC_POSSIBLE_DAIFMT_AC97:
-		case SND_SOC_POSSIBLE_DAIFMT_PDM:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) | i;
-			break;
-		/*
-		 * for clock
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_CONT:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_CONT;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_GATED:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_GATED;
-			break;
-		/*
-		 * for clock invert
-		 */
-		case SND_SOC_POSSIBLE_DAIFMT_NB_NF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_NF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_NB_IF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_IF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_IB_NF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_NF;
-			break;
-		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
-			dai_fmt = (dai_fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
-			break;
-		}
-	}
-
-	/*
-	 * Some driver might have very complex limitation.
-	 * In such case, user want to auto-select non-limitation part,
-	 * and want to manually specify complex part.
-	 *
-	 * Or for example, if both CPU and Codec can be clock provider,
-	 * but because of its quality, user want to specify it manually.
-	 *
-	 * Use manually specified settings if sound card did.
-	 */
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
-		mask |= SND_SOC_DAIFMT_FORMAT_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_MASK))
-		mask |= SND_SOC_DAIFMT_CLOCK_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_INV_MASK))
-		mask |= SND_SOC_DAIFMT_INV_MASK;
-	if (!(dai_link->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK))
-		mask |= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
-
-	dai_link->dai_fmt |= (dai_fmt & mask);
-}
-
 /**
  * snd_soc_runtime_set_dai_fmt() - Change DAI link format for a ASoC runtime
  * @rtd: The runtime for which the DAI link format should be changed
@@ -1504,8 +1362,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	if (ret < 0)
 		return ret;
 
-	snd_soc_runtime_get_dai_fmt(rtd);
-	ret = snd_soc_runtime_set_dai_fmt(rtd, dai_link->dai_fmt);
+	ret = snd_soc_runtime_set_dai_fmt(rtd, snd_soc_dai_auto_select_format(rtd));
 	if (ret)
 		goto err;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2f370fda12665..21943d7b5ef35 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -120,68 +120,177 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
 
-int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd)
+static int soc_dai_fmt_match_cnt(u64 fmt)
 {
-	struct snd_soc_dai *dai;
-	int i, max = 0;
+	int cnt = 0;
 
-	/*
-	 * return max num if *ALL* DAIs have .auto_selectable_formats
-	 */
-	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->ops &&
-		    dai->driver->ops->num_auto_selectable_formats)
-			max = max(max, dai->driver->ops->num_auto_selectable_formats);
-		else
-			return 0;
-	}
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_FORMAT_MASK)
+		cnt++;
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_CLOCK_MASK)
+		cnt++;
+	if (fmt & SND_SOC_POSSIBLE_DAIFMT_INV_MASK)
+		cnt++;
 
-	return max;
+	return cnt;
 }
 
-/**
- * snd_soc_dai_get_fmt - get supported audio format.
- * @dai: DAI
- * @priority: priority level of supported audio format.
- *
- * This should return only formats implemented with high
- * quality by the DAI so that the core can configure a
- * format which will work well with other devices.
- * For example devices which don't support both edges of the
- * LRCLK signal in I2S style formats should only list DSP
- * modes.  This will mean that sometimes fewer formats
- * are reported here than are supported by set_fmt().
- */
-u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority)
+static void soc_dai_auto_select_format(u64 fmt, const struct snd_soc_pcm_runtime *rtd,
+				      int idx, u64 *best_fmt)
 {
-	const struct snd_soc_dai_ops *ops = dai->driver->ops;
-	u64 fmt = 0;
-	int i, max = 0, until = priority;
+	struct snd_soc_dai *dai;
+	const struct snd_soc_dai_ops *ops;
+	int max_idx = rtd->dai_link->num_cpus + rtd->dai_link->num_codecs;
+	u64 available_fmt;
+
+	if (idx >= max_idx)
+		return;
+
+	dai = rtd->dais[idx];
+	ops = dai->driver->ops;
+
+	/* zero chance of auto select format */
+	if (!ops || !ops->num_auto_selectable_formats)
+		return;
 
 	/*
-	 * Collect auto_selectable_formats until priority
+	 ****************************
+	 *            NOTE
+	 ****************************
+	 * Using .auto_selectable_formats is not mandatory,
+	 * It try to find best formats as much as possible, but automatically selecting the
+	 * perfect format is impossible. So you can select full or missing format manually
+	 * from Sound Card.
 	 *
 	 * ex)
-	 *	auto_selectable_formats[] = { A, B, C };
-	 *	(A, B, C = SND_SOC_POSSIBLE_DAIFMT_xxx)
+	 * CPU					Codec
+	 * (A)[0] I2S/LEFT_J : IB_NF/IB_IF	(X)[0] I2S/DSP_A: NB_NF : GATED
+	 * (B)[1] DSP_A/DSP_B: NB_NF/IB_NF	(Y)[1] LEFT_J:    NB_NF : GATED
+	 * (C)[2] ...
 	 *
-	 * priority = 1 :	A
-	 * priority = 2 :	A | B
-	 * priority = 3 :	A | B | C
-	 * priority = 4 :	A | B | C
+	 * 1. (A) -> (X) : I2S		:update best format
+	 * 2. (A) -> (Y) : LEFT_J
+	 * 3. (B) -> (X) : DSP_A/NB_NF	:update best format
+	 * 4. (B) -> (Y) : NB_NF
+	 * 5. (C) -> (X) ...
+	 * 6. (C) -> (Y) ...
 	 * ...
+	 *
+	 * In above case GATED will not be selected
 	 */
-	if (ops)
-		max = ops->num_auto_selectable_formats;
 
-	if (max < until)
-		until = max;
+	/* find best formats */
+	for (int i = 0; i < ops->num_auto_selectable_formats; i++) {
+		available_fmt = fmt & ops->auto_selectable_formats[i];
 
-	if (ops && ops->auto_selectable_formats)
-		for (i = 0; i < until; i++)
-			fmt |= ops->auto_selectable_formats[i];
+		/* In case of last DAI */
+		if (idx + 1 >= max_idx) {
+			int cnt1 = soc_dai_fmt_match_cnt(*best_fmt);
+			int cnt2 = soc_dai_fmt_match_cnt(available_fmt);
 
-	return fmt;
+			if (cnt1 < cnt2)
+				*best_fmt = available_fmt;
+		}
+		/* parse with next DAI */
+		else {
+			soc_dai_auto_select_format(available_fmt, rtd, idx + 1, best_fmt);
+		}
+	}
+}
+
+static unsigned int soc_dai_convert_possiblefmt_to_daifmt(u64 possible_fmt, unsigned int configured_fmt)
+{
+	unsigned int fmt = 0;
+	unsigned int mask = 0;
+
+	/*
+	 * convert POSSIBLE_DAIFMT to DAIFMT
+	 *
+	 * Some basic/default settings on each is defined as 0.
+	 * see
+	 *	SND_SOC_DAIFMT_NB_NF
+	 *	SND_SOC_DAIFMT_GATED
+	 *
+	 * SND_SOC_DAIFMT_xxx_MASK can't notice it if Sound Card specify
+	 * these value, and will be overwrite to auto selected value.
+	 *
+	 * To avoid such issue, loop from 63 to 0 here.
+	 * Small number of SND_SOC_POSSIBLE_xxx will be Hi priority.
+	 * Basic/Default settings of each part and above are defined
+	 * as Hi priority (= small number) of SND_SOC_POSSIBLE_xxx.
+	 */
+	for (int i = 63; i >= 0; i--) {
+		u64 pos = 1ULL << i;
+
+		switch (possible_fmt & pos) {
+		/*
+		 * for format
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_I2S:
+		case SND_SOC_POSSIBLE_DAIFMT_RIGHT_J:
+		case SND_SOC_POSSIBLE_DAIFMT_LEFT_J:
+		case SND_SOC_POSSIBLE_DAIFMT_DSP_A:
+		case SND_SOC_POSSIBLE_DAIFMT_DSP_B:
+		case SND_SOC_POSSIBLE_DAIFMT_AC97:
+		case SND_SOC_POSSIBLE_DAIFMT_PDM:
+			fmt = (fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) | i;
+			break;
+		/*
+		 * for clock
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_CONT:
+			fmt = (fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_CONT;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_GATED:
+			fmt = (fmt & ~SND_SOC_DAIFMT_CLOCK_MASK) | SND_SOC_DAIFMT_GATED;
+			break;
+		/*
+		 * for clock invert
+		 */
+		case SND_SOC_POSSIBLE_DAIFMT_NB_NF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_NF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_NB_IF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_NB_IF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_IB_NF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_NF;
+			break;
+		case SND_SOC_POSSIBLE_DAIFMT_IB_IF:
+			fmt = (fmt & ~SND_SOC_DAIFMT_INV_MASK) | SND_SOC_DAIFMT_IB_IF;
+			break;
+		}
+	}
+
+	/*
+	 * Some driver might have very complex limitation.
+	 * In such case, user want to auto-select non-limitation part,
+	 * and want to manually specify complex part.
+	 *
+	 * Or for example, if both CPU and Codec can be clock provider,
+	 * but because of its quality, user want to specify it manually.
+	 *
+	 * Ignore already configured format if exist
+	 */
+	if (!(configured_fmt & SND_SOC_DAIFMT_FORMAT_MASK))
+		mask |= SND_SOC_DAIFMT_FORMAT_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_CLOCK_MASK))
+		mask |= SND_SOC_DAIFMT_CLOCK_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_INV_MASK))
+		mask |= SND_SOC_DAIFMT_INV_MASK;
+	if (!(configured_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK))
+		mask |= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+
+	return configured_fmt | (fmt & mask);
+}
+
+unsigned int snd_soc_dai_auto_select_format(const struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	u64 possible_fmt = 0;
+
+	soc_dai_auto_select_format(~0, rtd, 0, &possible_fmt);
+
+	return soc_dai_convert_possiblefmt_to_daifmt(possible_fmt, dai_link->dai_fmt);
 }
 
 /**
-- 
2.43.0


