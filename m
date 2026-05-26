Return-Path: <linux-mips+bounces-14744-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBUbOJX/FGqpSAcAu9opvQ
	(envelope-from <linux-mips+bounces-14744-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CF5CFAF0
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 04:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E53B630180B1
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 02:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529A32E717B;
	Tue, 26 May 2026 02:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kLNwV4G1"
X-Original-To: linux-mips@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A62DECBA;
	Tue, 26 May 2026 02:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760809; cv=fail; b=D+bE+Qr1pkPDMUQT/Grq5qieFsZKGUV/Gw96KiCvozw0Xe7NSqrxX1/BOFP3Agh0rV3JcFpQGGbgtTiuZdRZqZDXtSoq1jQrsfG+rdKJNwnuuBXd1i0QuB+NXU+bMO1SPCcgZ5bSZB1+xTdEOTu30qjaOApyhL0G2Ja8MYFGAvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760809; c=relaxed/simple;
	bh=uzGzA8xlWPlnswf+8qftJkyatNxnnlg+fQbRcTInSTA=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oYwo9KUBc3FK8q2HYn2joikoqjSQis3CcxTIFi0pG+L732uElWpXOv67oiIrtCAfZH8uA1vS5L8aA0gtF3NPvZ796X6G95+LNjseDCklT1L6G6kiXJOvxyCXNy5LBtjt7oZ/JcrPX1tPsmYigcCOI+GWngj8EaWQ56Zs9LB4n8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kLNwV4G1; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1PyEzvdpTv62z7NMt0s+GiyVD8UvdX7jrRqFw9N/0qHUKvI30zMpFmeYNFo/z1o6npRaCZtlrrUAjy2CltROQJ0D/FMEkdSSYf99oatM+0SjnNJYKCoK3n7O6nYN7S6pukY6wQlR4gT/uZg1cVjUfBpKgx57rp2eQibD7uhXaQ8lB1w9kFnb9QOZiAF+lOvVh2qOFq7Fouk/PIYCGg/uFGtrwV9uu4P/ZY3VOyq3MF7Rt5b+mO3sPb2Czh0A7abMmbNUJvzCmi3TyqPdV6B3fhJjgBhkKO7Vkza3dEdkGu0IB6BPc34y2bKJKqHEZn4+kXWexOOd/yPt9j0+k213A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmpoBkHmZjb4Y+RCJsXuQCuY7DFGgmtpmb7+ltp4L1U=;
 b=EML87QhYOFIaNiUwyHerxMmTs7r9Ym4Si8UkhcnzjKOlpa9hVIO2usRq4akz5in3buovJVRVm8EuxQ5LTe0QxJ5oXBRhATpvTuVx4diuM4rvosuQzVkdmntCEmaYjt85fmFHNp0IrS15gyl03mXAQRhPMCREAiYoWvZmexryc+MKYKtdp2JIp/CZhPzJjP57xkWSe65oDTgQPPrnWz8QG1Il7QrBYo64/pAig8QGmsZrNPzP0Hj+Ox5zMvgDeXjvvAm7z8XYLqmCvMsFHYQIhcWLHgqi+fZsO6dXRxOT71n0J2mjwKavHGRbi+AqKzGBTY3Bd3qRB/SlBsGxs8YnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmpoBkHmZjb4Y+RCJsXuQCuY7DFGgmtpmb7+ltp4L1U=;
 b=kLNwV4G1h0iAXaPCuJAO11blDHIMlBzmM0kE/83btCyX/L+1bmOAOgzmuCUQjqyzFehwXFo4YVsL6uEKQrN31HvTDOCN1OmlZ2DEWw9WxJLlfFM8+LESRDa2syaioKXmXMnyvedt1Vh8aG++Q7IDow0dhYelErrwH2Wz9xv4zt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15186.jpnprd01.prod.outlook.com (2603:1096:604:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 02:00:04 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 02:00:04 +0000
Message-ID: <87tsrvhqw5.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 06/83] ASoC: codecs: pcm3168a: update auto select format
In-Reply-To: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 May 2026 01:59:55 +0000
X-ClientProxiedBy: TPYP295CA0009.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::8)
 To TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15186:EE_
X-MS-Office365-Filtering-Correlation-Id: 675a0f82-5325-4a47-65e0-08debaca80d6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014|11063799006|18002099003|22082099003|56012099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	MuilMQQDQfsibBY7vxrAaj/K6ezZG6Jf4mK+P+E0yR8TwuRMDIh6kH2yuV88zqKB91T9BJZIj5LfOgo7OCYSRseypduiMFdSg0jJ+o2c0F/+MxRYVJ2SrdOCqsXXiAi21cnDedQTeHwXtvMQev87xDR58p0tJxEfrG5GClU7Q8h74AhcmN6VoPbALfG1WZDcnWWUKTCdXxYAuEztJ/njEOIiUoCXpkwIpuFjcFLidoknOgLJIZmrCwus5SISIiHlJvaBEwMAxDKJ5MOQGVVi6TXpjOqqaCJ8xe29KO3rUvrfYuzWZ7TgIYpO57+w5k8/pgbCInOQN0H1kpKMiFXONUsjMAemxdLyNkK4/4fY31Eu61w7+XoD0nrmNskJbArmGfg4yXTC1YzZwRttxOjWwZokqj4Yx52KT40rKgQosv2IqGinyauLQOiC0b9fOvRg7Xt6Mh5b4Ftuegd+HPDtYTDbzI5e/XKp1wCXe/eSbd3YuLPzXmEj4RWF0xRI6+FkpjkqzpLkTgXHLewzupFe7/h9elZK+gHUMFuuAHU2UT8ErJA/+j1SrlL//Vdq1Wnd+KexWQnEzgok25mLUf0R3X6iElCw/cOW4Va9RNgGTKREAoJ63ZUDhrpcE0qGpMOdB98YR+voRGpaaM+2kx5l4iW0atR4laMdA6VBSyw2Mu878l4pBClFmiQSBn7VqThtH1vp/Pmv8ZfBC5Ri9oZucsCTkU21V6z+eV03XWAF3UAqIQJTUMbvhEsKobjcIvJdj9232V5NlQ2CLD6nJN6ma3FVOCmQonnPflDiCNoGBjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z2IhUOjOOZ62etiTnssPXNHy+6R0CzOj6lvcTp5XwFFG0wfWYIybkyaMryZN?=
 =?us-ascii?Q?gPgADEaXrQYEOF+Yg64cHua3pZp8venBDtgeAmcjRnscyoG3LCm/p9G0F7z+?=
 =?us-ascii?Q?QRQ5dWbZaoya2D/YUSstffTKNhJZj7lZlD/DwyF1cNE3mETxJkOHje85X9Is?=
 =?us-ascii?Q?c9uvjjxjquUElkWNfCFnc9tQI7BnjIr42qYSVzbHzuNAQDaybYZiPHR/5Xa5?=
 =?us-ascii?Q?94Q36aSTIabipTfyL2As21LlsV2AGO39clYPNXqJ+aP9fDumm+Ls5cA2JC5J?=
 =?us-ascii?Q?z5qKSxuHnZmnctgDP2FlLIIUU9eMvFQNVOjGA+NpPSOe8PbKAHYrIqRWq37z?=
 =?us-ascii?Q?TjrLVh1jfHRxNSLAYkzQAOXoFpEqRfzeKrgeHUu53ji6P/RDZg+g6XsLm/LN?=
 =?us-ascii?Q?a4yBbb+HecM3vh403rAZ0h/0W9pIPNYw4ZGKWLClVB5jUXB8N7IIWxuyasYr?=
 =?us-ascii?Q?z3EDjr0uOPlMhEGq4oJ8YAhn80k7CGC0sJKWfpDj9yVsCRjLNPwiS6R5LvFJ?=
 =?us-ascii?Q?wPpx3izsK7pSvTqeGmKHGZIens+6p0zIgHJlY1qIS++hzMX/1DiBzoj/8W5P?=
 =?us-ascii?Q?6RnorVEFb455S20dSjRLsZ2Ns8WR4PNK8LDJPbruWZfyJrE/swB1X5VsNJew?=
 =?us-ascii?Q?kc0gSV5PR+AE510L9lT9rSGhI+/cBD0MUwFZklrGRjJY49wsqxdt7qNYT4du?=
 =?us-ascii?Q?47Eu8cj4r5fIC0YrNBpW3Ni8RwVC0RBXaMd6D1VZbe4RWVQ3DeOWnSUtG+1j?=
 =?us-ascii?Q?A+6vow5WDCiTOcys0OQx82lgHT94WmOWh8uQsw+g0LI9SxsKomq9ZlbNaNdO?=
 =?us-ascii?Q?Xzfw7d2RLSl98EhnEfD7G0sSZxuqBcc6Z9Cuf+Wo+tv3HFCNY30AHQdWUs/X?=
 =?us-ascii?Q?UPElIs+Ljjsa6cL+e/HgnXknjwN+8Ng/LJsvj1WIINKPKFZBgd8econPF3cS?=
 =?us-ascii?Q?SCfZvh4uuyqjOGrpHpufbpWUqLT5gfyQRYD38v4NNariTpQSte+YgpALnU9u?=
 =?us-ascii?Q?cV9jDeEgh7IWGP2B2OKyDUPXirpY/HRGcySOfNCbVgZEQt0UJrSHqesN5Kq5?=
 =?us-ascii?Q?zudacXgonH11l3g3TehfRJVj1NE1jiF4x1ScqJh8rXIiH3W4epqm7nXt//cA?=
 =?us-ascii?Q?6qfOiVwsHGJQrVfFTMIFXnRK5EXVDt5m35M6R8Zqg28MU8EpJCPL1unQrAkr?=
 =?us-ascii?Q?Xs4vPu+hUMWK5lk1N5wDddB9gBY5cJ4IprCsFkIFLASk2Wewm8KX+5Yd7m71?=
 =?us-ascii?Q?inGj9BZfhkstqM7Y55LZhVtt1uZqmJYLNqv7uN83vty4PNSKoMukuUMwX9wD?=
 =?us-ascii?Q?PYe3RchPJM/7wuZ6ws6JdzkOb/0/yl2Smi+M0q1v9pmEFN69nvgwLZro9t3G?=
 =?us-ascii?Q?8BdJCvoDslyTVvPdEc4227UA11O6Yre44mXb/XYlhmAsE1UrErXzaByFU48C?=
 =?us-ascii?Q?jp9wxsiSPo2nOdWf8DysieuOhzJSe4iTpB6n/sbg47AU298arrL7SPA6afLj?=
 =?us-ascii?Q?3rB4em+kje4FPW8MqsXHhzkG8LkawH86a89ux8XMMmL550Y5CRSbPQxcP2xI?=
 =?us-ascii?Q?DmcYuaLQ4psJpUOlO310B4liXA9K60uWhvHto12MM80IvUsewCwm2V7sKmv0?=
 =?us-ascii?Q?9PAJfPcAkltUdph2MYxWrZVqKSSC3yrCRqy4Jczq8UZAr7R9/c0FIfECYzs6?=
 =?us-ascii?Q?CVw7gd0ol6ybk9xLu5yjti8Vyaqb17lb/JZgOSPrnttADoHoGhKDlCYK1nzA?=
 =?us-ascii?Q?tY3HuqwkDLXjulWLi0cAjLJcKoKdlxO3pbcAbKts+PovTl4d/Ozu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675a0f82-5325-4a47-65e0-08debaca80d6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 02:00:04.2648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G20/9TdqzSkurP/KI35UnyTOlrl7M3qsedbjWDwFtXhEsArFoPk/MIoc69h+EBaY6TzFMdOeDxQUIBfTdUkBiNW8D7rP0J+fXMMAFUHOIJvauW7SCstbc6ran18ZHBD1
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
	TAGGED_FROM(0.00)[bounces-14744-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 678CF5CFAF0
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
 sound/soc/codecs/pcm3168a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 7c570efaa1ea3..05c06068ee245 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -575,6 +575,8 @@ static const u64 pcm3168a_dai_formats[] = {
 	 * see
 	 *	pcm3168a_hw_params()
 	 */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
-- 
2.43.0


