Return-Path: <linux-mips+bounces-14741-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBEQCW3+FGp2SAcAu9opvQ
	(envelope-from <linux-mips+bounces-14741-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:59:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F035CF9E0
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 03:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D3423019FEE
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 01:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25C2E091B;
	Tue, 26 May 2026 01:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EuDO0jTa"
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789D2DB7A3;
	Tue, 26 May 2026 01:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760746; cv=fail; b=Cpu0/VAm2cGsmsI64vZiI+vvilXHXXwkHXmOJI1Bw1GUgseJl7N+RUTwKkHbhlQvfqwUh+hoeE5uuUZxDMyxMw5DHOkMPpJ9uTZSJp5O3aJhpVZu5pumt5j47aZFoMvt7cBVFlbA27oFx4N/2iJ8ZQUVbSTUJZ/82XybAN4KYrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760746; c=relaxed/simple;
	bh=5Po/Qk7zeW2Xdvn5jjy8ObS9Rh0oGUybT5BOvXTOdw0=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=q1+KnLAird69UlHC6cT8txf0u6Vs8XDpFURfoKGsOy4PIKYrcsWqpPKSV0S1p4gGww6sHpLYc9W0SDyDzKg2W1jayz/PKquqGACqm93lBJ++5vP+hB754SucA5uEVVZvQiW4n9mRXc1xHzw2qQg/YOUAtphLsn72u7/7AB/ogg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EuDO0jTa; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/rN1IkA1miqZpAJo2nfZqpNQ5RC0IpDQNexXCQGodpn8ngCanEOiEEdMv96Ef9buQiAAJwOL7sIvkuq43SH2sR/2bAvUn45akE0SGSGjEo9yUyAtPON8GViATOatILpzu+mxuWR+PuYfovAkhI1mPj+tbEwhO/N5XxemxosTw1K6AB7GDnCK9mF8KQTJTSJpqzENVF0M1fx8n5Ytt1PZTNiutQe5wn5KjNwob9Hmr+71yHl7peVIVGC82weiQKMQrr5jF+XyJzAvnG+vHfrL3fF0fmCdSggMyidNFsfVJ5iRSJL4iAU7Z82nGpl3+nMxVW8bfx89KD8YKTHglF8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIofv1MBIhBwYat44jouEs2QG5kWJgAL4PikLU75cZs=;
 b=O9fHSJ/HolBuAAtoR222RuL+HN3KdsdLC+hnCAUifQ476ABtUK3uiECMa8v6vJRcA3fSab56DgwWD4o6BAUMf22d/RgRZLjFwxkCps4fmOCPBIK0CP4xUAQXSbXWKJkD7S15k08T1j4lPIYbyxDNpOH1wdskKjH72b460U8A6LdpS4XY/+EuVr4MY5Tw5e3+aFX3Gv8ILywyhSd1e+nsg+49veDNhHKwrIBX8iSokwFMzIAPoSG9r3zb43TgPLEh0CgJmZloYSYR6XkmST4pt8cjIbsLSOuvmkBN+RMD+XM4pC4uwW6YLkU/jxBRPouavla3S8KxrifwXZ91shSQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIofv1MBIhBwYat44jouEs2QG5kWJgAL4PikLU75cZs=;
 b=EuDO0jTaN6VqGTwujqjGIUUIY30lvk/Ie18zB8ncS7eya9SsGGsh4HQCRutU8UenFruhdLh71NAtV+Psb20kWbcmybhSazNoLjndYT516zFb5aHjnCJvnfeOSf2TknfwhITFESGoo8rGqYBTckI4vW+f5onL3pv+7KNVSVhsC0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB6599.jpnprd01.prod.outlook.com (2603:1096:604:112::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:59:01 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:59:01 +0000
Message-ID: <87y0h7hqxo.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 03/83] ASoC: codecs: idt821034: don't use array if single pattarn
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 01:58:59 +0000
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cdca8d-d9ed-464b-932f-08debaca5b01
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|18002099003|56012099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info:
	fsSXNch+Wm+zuzhuVRHWf+SUWGtMwHORcnUzHLb+S7yBQ1Ox4pHLhYpmItBlgOFgyvsAEeFBREzK1qE9HI8YbzXIj4RYClFnIpr5NTLEN3G5YB9MXUPOnOoGY5uXnufUnECL83iuwC+Ah5dXXrleCS6IeozHxNHtdMcnBX+eQVEAnYIOCndwJhmCq8q4pWSVufs3TCqiGd3XStcehs4MURCTxohizVWRezTvq11DN1ktTsz8fgwcmcQt3Z6RWHuKcdyx/Q4vbqSCRoScPBDEyeqD3goRSw/D6SbEChOruQSaqsM1CpbLgYer/JmrnLD/Bgf3eORtJWuJrgO3zIH9pRRCQXC7WNEPmS6e+VhKKn8WNcT6aZP/6GIhrv/OwTt+bfn6yAqDDgx1DWJtdUhM3EFffX3eqlKNaCkFZuZykSED/dm5qPLFPEiyGISf9YDI9LBXibqr8A77b17VtmFfPDWoJI+oesBKy/fKgrDnjtHQbPa6sV1UZCKotrKc2/uYEW0r7hHrtduiNz0dFdSY4U3KQOKGkFFILNUrSS4AxKG89/zD6DyKLWZDRe4N4DlRaeg9xddf/z/gRxoH/YaMqd1/ZpaqnPNODsnBXJHRw/souOvj6xvXD8cMM2YZuazrFtyYufpX/sMFVK2GbWU0rGb58aKXDqGaP+BS7C0rIspYDcEF/fQttdXI6jp5JqIQlh238d+aoyNPYs5E8j8FZJGA5jvwEmhWsauNshY+4NdwtGpBPWw3RVZcupzqWpfRtr4c1AAAGeIXurfgtWCoPPuf59sBzE/PHNX8aRtYq6Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(18002099003)(56012099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AbuJw0iSWWRgJvKaseR0h36whXfGIWk4g9YbG8gm5FnsY18uCpstHKsIexZX?=
 =?us-ascii?Q?FSS+GhCcVk/BIF0vTnX8Da3oYTlh3hKZC3zcr6oTP0Z5LUeBy2LWVvZX2pwz?=
 =?us-ascii?Q?03BVMyjBkUYkRnatOR9rqOPb7acav8lm1RbfH94Xw7+ftBqH7z2lFEYbNE9p?=
 =?us-ascii?Q?Hq2MA6Urcibme8VtRCr+6rOrq/Uy6zgB3vj0osaajNdY6bQRQFhIJwI5QlZY?=
 =?us-ascii?Q?bWnb9lkmadz3AlYpl3kKDytIVOXoZKkXDdc/MdQOjTCbhV1YeqC866xgyDKK?=
 =?us-ascii?Q?W81xub1WBUiqgAyavc4ftvc4WAKgqmlmViOGj/FAOJKEnZ2bogvReDW3l40E?=
 =?us-ascii?Q?arGXzC27d7d9EWjOB7Eww76yqA1rdguMksks7MNU6gbEu0suTtfGJ3fyQY9y?=
 =?us-ascii?Q?9fFlbV68fvf61DuTg4RoJLJTwL9n2tYezXkJAgrAo5NRFqXKg5n8NTxCB6/h?=
 =?us-ascii?Q?AnNILjZC3WfgvYe2ybpHdxmO3D22HjyCKvk6b/C6mA+fSTWRyAJy9EdDTFfI?=
 =?us-ascii?Q?lt7kzKxc1aUllrdu4k7IpHu8hJ/N3g9t7/w1aXCRzxw6JzRbNyMSSzWmcxvq?=
 =?us-ascii?Q?+fVOrMjC/tBkUyjqD8of8ksA/GpJZm4BxuukpW7TEOv3IbKEqwkb79jQT603?=
 =?us-ascii?Q?C3MrZSpflkH71d/LIsZ09oVAB66JW7o+KEHTjtgbJm3RyCqBlACP5HUdgSXv?=
 =?us-ascii?Q?NU01i7vvE1UX2IosdBFVkjnUo63BUm+lZhkc/DNV+sjtwmAlk1jrSUp6vlsa?=
 =?us-ascii?Q?Jl3mHVusictlnKN9mi7m7Lo5OKYvwThLLAugpFkSP7QvZxJAw+rpgHt9mgxW?=
 =?us-ascii?Q?BMfTRj0LLkIyzEuBHBEFg+AflyVjsfjAIBfiJqMRAGB3OMEP3v3ZQgaWb8XU?=
 =?us-ascii?Q?+3RMuMfv03sI6GDbhKuuqYE/J9+bybcDfC9F54MUNen2psZhQV9P/poQ8zqr?=
 =?us-ascii?Q?ff2rQDEIZGb8EJu52nGLi0HWXm+c4JawY2JzVSKDcOvE9Sgklgk2PPiKKJ5j?=
 =?us-ascii?Q?E2A/1AscG8Xb4e+q1Ym9LTA5Yls9nM/xlEJqYzttJ8fRO6sPDg0ZcPpGO7VA?=
 =?us-ascii?Q?KLOIFQihX7jIDscBooO/At00wGRyAb0hCaiL3oV3ZTM1isJcSZmy7KyLwTZW?=
 =?us-ascii?Q?w6QH3VYODN3I7fFwXwazRJjxK1sf8G9YEbOj1SBm4HrlzEy7tBsUEdg5wzIO?=
 =?us-ascii?Q?pHV1CmQnOmwnUorNVUu/XgqiuHi5SqJzlslcoMNiSgSign6VBfZrR41kVsEK?=
 =?us-ascii?Q?UbiJIMKPHedXO60Q7ATX1bJOIkTGiHIA62Yk8lorv7c6Kr3D9rPAnwt4JonD?=
 =?us-ascii?Q?KpqFkd+ibZ5pyrXmHG2Yr1nJmvKoKEh2gqQ0dN9jyc75X9ZEwh+BEDxWhJec?=
 =?us-ascii?Q?QujyHa03n2qKyT4Ixf5Ehb2eGi/zcATVvUeYT/09NQ98FJ/wTEuq2GGYGwjQ?=
 =?us-ascii?Q?LPM5B6xqzjkiIQimRfRRozFy8sbPKZ7XilBSGfSwN8Y3P5Uxehb5Itfa1c8w?=
 =?us-ascii?Q?zNxmRToylknuf7AkH4iHBctFGFSzg/yuTvN+k98uG1vHfho6NeQJPuHO/Ps8?=
 =?us-ascii?Q?vhbjgbZYXpB/8tkza7G2q/jQjHrBL7ZJ+Q8RwaysAMoeVhpyUNWh/UZbMlGP?=
 =?us-ascii?Q?DvftSDWBuR5YSoVibiSDkAe6Z+7kEVHouWjagHWMexiekrs/QaGm6eMzyBjt?=
 =?us-ascii?Q?vjD2yMroDxkHUf1rB5JhiO98cf/tDBsPcIND9WjR14NrpMBqG6x4AVXOJ8J2?=
 =?us-ascii?Q?w4KgCWFbN4/OvD654KtIZlCd1sKjFs/VJLac/vt75+5pQQAY7ZQZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cdca8d-d9ed-464b-932f-08debaca5b01
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:59:00.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3IsY1TSUVpF/Xh7WFS1vLOmeOaC3boQBTr/X4Cz7OeQdpPE/A1+lnPKCNpVQLyjgARQWjuTMcZghl41IsVDzaoikKjCwoacw1WkMJgJz/VFAX4h2oDH+OTXuP6mL/qY
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
	FREEMAIL_TO(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14741-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCPT_COUNT_GT_50(0.00)[104];
	TAGGED_RCPT(0.00)[linux-mips,lin,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 92F035CF9E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Because it is confusable during debugging ASoC FW update, tidyup
auto format style not to use array if single pattern case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/idt821034.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 39bafefa6a186..084090ccef77a 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -860,18 +860,17 @@ static int idt821034_dai_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const u64 idt821034_dai_formats[] = {
+static const u64 idt821034_dai_formats =
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
-	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-};
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
 
 static const struct snd_soc_dai_ops idt821034_dai_ops = {
 	.startup      = idt821034_dai_startup,
 	.hw_params    = idt821034_dai_hw_params,
 	.set_tdm_slot = idt821034_dai_set_tdm_slot,
 	.set_fmt      = idt821034_dai_set_fmt,
-	.auto_selectable_formats     = idt821034_dai_formats,
-	.num_auto_selectable_formats = ARRAY_SIZE(idt821034_dai_formats),
+	.auto_selectable_formats     = &idt821034_dai_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver idt821034_dai_driver = {
-- 
2.43.0


