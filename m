Return-Path: <linux-mips+bounces-14873-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J/thBfKrIGov6gAAu9opvQ
	(envelope-from <linux-mips+bounces-14873-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 00:34:26 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1163B9BA
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 00:34:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b="ULF/oiWs";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14873-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-14873-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE2FC3017021
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 22:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E0A4D8D8D;
	Wed,  3 Jun 2026 22:30:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1B397E96;
	Wed,  3 Jun 2026 22:30:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780525815; cv=fail; b=kfDEDCft4sxRwCWrCivXtLjfElVUPOV6umvp7FZlNSUcrzJksp6rTJaQdTp11Ofmnt8hj2Yzze853VwWfNyc2yyY968gT37wtFroIkKHcMd0hcRVr4M+FA25p5kjFKnZ6jebPf9fnPw9ohKoNa3HAWIdVyDrMYiHDvM/EEfp1Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780525815; c=relaxed/simple;
	bh=WTS5ddFEdnOSo9/IV5+3mQLL8kJAv06vfsAF0SDG5gs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ECzf5FEymJWLDJ4RvCMf/HpBcApuZ74NycOrcT+OjssviSJb1bxBF9zJbShJ2cOVPvujITJDOW4+eJyCr7dVAfwVgPZD4kBiixnm4gcf8uUpct3iWT1HUxSKIr9ji+Sbz91kg2G9gnzoVCgR+jhJqQLriqOBXbXUL2XfaOTax5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ULF/oiWs; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiDlgTOjquM/2FE5w5nqTPrFknXxRQZP/CGzYppoHfAaqwgYMbOmu3M8v9wE1vxp+RvIyJ/EtYz1GyL4XKb4DRCZgnII91tczhuEndI2P0WEBgOOtGvXTVe4E/IRu6afZ1nB/IXc3OdcsoyBUalSAvZVs05YkhBs4YalBTkgl7/+Nc13KXP8V8FYculSePWX4fFitda4ACghvbbrSIMac+Rift6XingS9pXBYLO03duoKDb6t9//3ZkbFrC5Nr+Ys5Udhz0uDWaoxPGd8La8jmfHH+CTy0FhnKxffCJ8TuTv00LCOinNbLCWnQEuS0fnVXvLY2i/32S33Pd2Phjvqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbXB38SUTgltPz28Qrbj5oXXKCfe23ekoxc3LjZrCj4=;
 b=Uk5ZvW2XjrhF55mroyq9r1J1MXZTRDnVmt25JPun6SVbPHEYuwjv88KO7KKpl2Jwl5VtK2ye4POVjCE3N6usuAFFN1Bj8+G0eklBRrFQWdOCF1evYoqc8+xj/m479ApBx/2fMKLQaYiBAv95GfvNQl/hKXHILo3GEMetWxC6Ta8Ke//elW0NTgk9FMgbiPbie/AkRnciQKd8H0685AVCBMc+TE8pdpFMcnidh3jDcTemNXBsB5t1gvDmt+pbKm8/tXlH6YYkV+QXOB2fN6TT7Zm+JSUbhYkKKNrPjWCjI+I//bxDxzdX7d1yomx0cPJb8SPUpP7itGRW5yiPjeeNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbXB38SUTgltPz28Qrbj5oXXKCfe23ekoxc3LjZrCj4=;
 b=ULF/oiWs23LHbBNk+vejikbK1FT5bQkDAWfG4U8i/7Z+VlzWKWx55Ko/bNbZtsuGZwDZUw4FqRWehWPb98eAhsdF5oeTBECaBpMGkl+EqZqReIig2ErCwptcVO6Bx6g7CGjTgMgD6zN3Jr7P4oauU5V7KTPAC601ibJ1aGB+3Yc=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSAPR01MB7280.jpnprd01.prod.outlook.com (2603:1096:604:142::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 22:30:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 22:30:10 +0000
Message-ID: <87se7345qm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "Alvin =?UTF-8?B?xaBpcHJhZ2E=?=" <alsi@bang-olufsen.dk>,
	"J.M.B.\
 Downing" <jonathan.downing@nautel.com>,
	"Martin =?UTF-8?B?UG92acWhZXI=?="
 <povik+lin@cutebit.org>,
	"Nuno =?UTF-8?B?U8Oh?=" <nuno.sa@analog.com>,
	"Uwe\
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>,
	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,
	Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Bartosz
 Golaszewski <brgl@kernel.org>,
	Ben Bright <ben.bright@cirrus.com>,
	Benson
 Leung <bleung@chromium.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Binbin
 Zhou <zhoubinbin@loongson.cn>,
	Bram Vlerick
 <bram.vlerick@openpixelsystems.org>,
	Charles Keepax
 <ckeepax@opensource.cirrus.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Cheng-Yi
 Chiang <cychiang@chromium.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Mack
 <daniel@zonque.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li
 <Frank.Li@nxp.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Geert
 Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck
 <groeck@chromium.org>,
	Guoqing Jiang <guoqing.jiang@canonical.com>,
	Haojian
 Zhuang <haojian.zhuang@gmail.com>,
	HariKrishna Sagala
 <hariconscious@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsieh Hung-En
 <hungen3108@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet
 <jbrunet@baylibre.com>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Jonathan
 Hunter <jonathanh@nvidia.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Kirill
 Marinushkin <k.marinushkin@gmail.com>,
	Kiseok Jo
 <kiseok.jo@irondevice.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Lars-Peter Clausen
 <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Luca Ceresoli
 <luca.ceresoli@bootlin.com>,
	M R Swami Reddy <mr.swami.reddy@ti.com>,
	Mark
 Brown <broonie@kernel.org>,
	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
	Masami Hiramatsu
 <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Max
 Filippov <jcmvbkbc@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre
 <nicolas.ferre@microchip.com>,
	Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Oder
 Chiou <oder_chiou@realtek.com>,
	Olivier Moysan
 <olivier.moysan@foss.st.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter
 Rosin <peda@lysator.liu.se>,
	Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Ray
 Jui <rjui@broadcom.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Samuel Holland
 <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Scott Branden
 <sbranden@broadcom.com>,
	Sen Wang <sen@ti.com>,
	Sharique Mohammad
 <sharq0406@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Shengjiu Wang
 <shengjiu.wang@gmail.com>,
	Steven Eckhoff
 <steven.eckhoff.opensource@gmail.com>,
	Support Opensource
 <support.opensource@diasemi.com>,
	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding
 <thierry.reding@kernel.org>,
	Tim Bird <tim.bird@sony.com>,
	Troy Mitchell
 <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>,
	Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Xiubo Li
 <Xiubo.Lee@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Zhang Yi
 <zhangyi@everest-semi.com>,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sound@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 02/83] ASoC: codecs: framer-codec: don't use array if single pattarn
In-Reply-To: <20260603140939.091f126f@bootlin.com>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87zf1nhqxx.wl-kuninori.morimoto.gx@renesas.com>
	<20260603140939.091f126f@bootlin.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jun 2026 22:30:09 +0000
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSAPR01MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 12607daf-5c35-4ee7-4d86-08dec1bfabd8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|4143699003|11063799006|56012099006|38350700014|22082099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	TzHfVoj7TpgdvJ0HaGWwBMagVB+iozqFbkXG3tqI/A+k0Q2rZwkMIB5Xx3ck6auLWKhc7o6+wZ4bwSxnZ9ogH8It4qEBWtw1aIsCJd11CygAQ1F4yyZtNvDSoIIp/lIJC85yb94H4WAHP87hQmsft9/ZyUOn3u/CUHqDhFepHbaIPsFIb71BPNQJk6n3dUf49wwd18j/MdGNOBeG3yJaspINvLZL1noqZINg8S/AQF66DylY/EzUUU6WtLvxbhfMDQFrznaVBzSrubhuIXUejOSR+c/RiKsDaMADknHbfX8sEqhCY233XPCJzjOD9CdgdkYMdVF6qd1DDRfSpj7Xp7eAliJrUvjQ/pz6evXYjVra64yWF9m9XZ1+TbBFnAsTRXg/DbGpN7JsR+8mfK6CF2bccqF8N7qBst00qqedEkfIQ1U8hK3lJJItYdngZMgQTYsREmzb4lQzLDoSqgNrwRc3SCyed1/YcNEtOnSyIlHKk8jXB9nHhKph5kqYOX62GmzM2lnh2humnTqNrV8Me8AJg7DL48c3WTJnupZdYNHrs0q5J21E6JYzQH5ECf7zt0RE6FBXRLn6c1axLC4DFTEMsCc6qEh0NGBWcMhwF32fZSOdZjVzcuVOmv4QlGmJXGjwUrTnCYHijp7U3rBpcGiAKjewtJQEieXKxU5wUwRU8ci7adSQI2R/1W3Qwx9z7u5upyIbtWXK1p56WD+7WayH0vfH6e8OkUyTrBR6oqpwrW5uuMy1KVIg/4z89G5fGC2T/5vZdSWTCG3Q78Uy/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(38350700014)(22082099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lijGfEg2qt0pQmb+mOI2PAFjEPX5cvZTcz81IkTfz7udR+nM8t7IJasJJUvA?=
 =?us-ascii?Q?BkFvJ2fR+7rRjtqcfD9WtFILE68AkGFRGZgLf+1/SGECmnVxZTGtHkc6n0m5?=
 =?us-ascii?Q?z0ZmomtME2rKjn6+MJD9N1bX8ZQ9Lhg9LlSzvEIgIogY1EY+b97qbuWHWwzu?=
 =?us-ascii?Q?S+UNO0yTdFJuHat548RBYCSdywiq+Z/aiBuj/gixLL5aT9Solk26WkaJ/bbJ?=
 =?us-ascii?Q?BRByFu8MTY0oYso1I89HeeJ853ISSyvLqom7RqMbchmyPsggg4AHeP/2oWcw?=
 =?us-ascii?Q?D1tK2woenELOe9S4eZ9XvzhydxAXzlNL+Rzz3pU+o+7hw/SSOQibgCq9n87p?=
 =?us-ascii?Q?vWUm+czOwilM92gdCGaHmfngiAxHQd/dhheYlSTWMIXI02ijWSlIdMUORkdS?=
 =?us-ascii?Q?udpFHyuEIi0ewq5VVw1l36NqBWxtG+Z0xLIWIx0RnujNhxGbNXWTN1GKsKfS?=
 =?us-ascii?Q?7XSE5aTWUrfyJXvrKPKTbjgVKymunDlyBj7OpewOFWqREFbCj0C72+mQhowz?=
 =?us-ascii?Q?TxPXra3+QqOtEu/zl1AvgtUsn8pSYyGsbYNwegoxsrQD9YJVaUSr3IBRgmjw?=
 =?us-ascii?Q?j339RbHAgPrcu/nAR4xIxBQA2sO1rWWLmZ4EpFbk+ez2Q9o8zf+2nmbW5Ns5?=
 =?us-ascii?Q?9cEnW9dpfldeBEzGc9JuDspkKKrrijTOSplwLQ8RZFmkYzQwehu9tniQD1fB?=
 =?us-ascii?Q?oPyFA1Av8VrlDRZlhcUvyOSJ/4BbSED1f46A1jDRWU6rFVpdf2Kbth6RF9/q?=
 =?us-ascii?Q?3WfjMI4zS19/1BQ8GOEsS9eNRRrgYp61eMrbbYS3KH7uu6qQ3uoWlYrECcCA?=
 =?us-ascii?Q?Q/Pmp+hY9uWiP+nw2MJ93u/CE3MoqRww5y0rRajWvu1cWKwFsGQzUIfTtJaI?=
 =?us-ascii?Q?+lAtn+RdnSEN9yJ+SygTCHCAJJGKAJeHtvQsco0xD7CqYsRgq+lgFYgHl/MC?=
 =?us-ascii?Q?XhtHQOOwosIbVUeqVBLqW7WY4dhQzkfnD3oKDnWS8UNSU7P6NE7csts1roqm?=
 =?us-ascii?Q?cwfCaguCX9ky4q5Vmq1nvNR49bPEfeO14KCv08n0/TGWf3SgNVQm+jvIrO72?=
 =?us-ascii?Q?l0ry2ZVaIJhpJtkwS6Mz4dCchmJq80SlX1x6k9dwK8/ojdWJmNMXofvuLUDC?=
 =?us-ascii?Q?aydCDmVSal2VKz4C3hWRuUnGuGEIbqj0lpnSr3UyFou9GNxpg76Ghv1gH2wG?=
 =?us-ascii?Q?Cq31PW8EfXdtNBNvh8NB8A4fk1gzCEzu7/HxlqdYG4eT/mDCA59Yvi6z7aHq?=
 =?us-ascii?Q?9VvX53yqqG1rwPmdot49PgNfjS8KIdh8h8Y8fMmQ99WvWfVoa0BE791bvRip?=
 =?us-ascii?Q?iFJaBEa+yYEn5uCnfV0uXVDNrd/FnYaqBEBiGjtxdlV6NRTGvvH3lhISs4cD?=
 =?us-ascii?Q?pkCYlUo1S6rmoBUNu0GUZdWMfVemPowbfDSp6Ek777P6jfkyLWKtGtP9El0p?=
 =?us-ascii?Q?9Ghr+8TeF4ys/ILqWWMYXAnyMkRKaa2R+HzDia5nyC603B4UnX+9qkBcGfqS?=
 =?us-ascii?Q?KJCfdec5Bt1Eb44J33SLn7MJ8cYUqoSK7n9vCOnznTI7bqdM3VkPFoVwQRwj?=
 =?us-ascii?Q?b/fF7s4jePi+DBbVhWEgeJvi1XzngYhHJqpwFNUrpGp3IaC0g43/7p8064ZW?=
 =?us-ascii?Q?f4i7tmukWnPoQnaGAg/RfmYYuuJzXINCh6wMSsWz221+nQwNIX1JeervuiKF?=
 =?us-ascii?Q?q6SqRaPYePYZhToevnWWbbFBruSKi1cGVMvNACGEgRdLxUXPnmVvjVHdKyBx?=
 =?us-ascii?Q?5euAeZDvxxCg2LmKfL4PNJ+TJ2Qrl4I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12607daf-5c35-4ee7-4d86-08dec1bfabd8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 22:30:10.0343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyC61S6I4F1H/JUrqLmYIDVpFK/SlSm13DNt6xUltouV4dvhcRjKpd8NRDA+hLX49R6tOu3NrKhHMj8PEAtVUobxHahqkGQLa4wogB/tn+T5ZY2VVwdW9b3Hw9vVFBbs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7280
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:herve.codina@bootlin.com,m:alsi@bang-olufsen.dk,m:jonathan.downing@nautel.com,m:povik+lin@cutebit.org,m:nuno.sa@analog.com,m:u.kleine-koenig@baylibre.com,m:alexandre.belloni@bootlin.com,m:alexandre.torgue@foss.st.com,m:angelogioacchino.delregno@collabora.com,m:arnaud.pouliquen@foss.st.com,m:baojun.xu@ti.com,m:brgl@kernel.org,m:ben.bright@cirrus.com,m:bleung@chromium.org,m:biju.das.jz@bp.renesas.com,m:zhoubinbin@loongson.cn,m:bram.vlerick@openpixelsystems.org,m:ckeepax@opensource.cirrus.com,m:wens@kernel.org,m:cychiang@chromium.org,m:claudiu.beznea@tuxon.dev,m:cristian.ciocaltea@collabora.com,m:daniel@zonque.org,m:dario.binacchi@amarulasolutions.com,m:david.rhodes@cirrus.com,m:festevam@gmail.com,m:florian.fainelli@broadcom.com,m:Frank.Li@nxp.com,m:fred.treven@cirrus.com,m:geert+renesas@glider.be,m:groeck@chromium.org,m:guoqing.jiang@canonical.com,m:haojian.zhuang@gmail.com,m:hariconscious@gmail.com,m:heiko@sntech.de,m:hungen3108@gmail.com,m:jogletre@opensour
 ce.cirrus.com,m:jarkko.nikula@bitmer.com,m:perex@perex.cz,m:jernej.skrabec@gmail.com,m:jbrunet@baylibre.com,m:jihed.chaibi.dev@gmail.com,m:jonathanh@nvidia.com,m:cernekee@chromium.org,m:khilman@baylibre.com,m:kevin-lu@ti.com,m:k.marinushkin@gmail.com,m:kiseok.jo@irondevice.com,m:krzk@kernel.org,m:hayashi.kunihiko@socionext.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:lars@metafoo.de,m:lgirdwood@gmail.com,m:luca.ceresoli@bootlin.com,m:mr.swami.reddy@ti.com,m:broonie@kernel.org,m:martin.blumenstingl@googlemail.com,m:mhiramat@kernel.org,m:matthias.bgg@gmail.com,m:jcmvbkbc@gmail.com,m:mcoquelin.stm32@gmail.com,m:neil.armstrong@linaro.org,m:nicolas.ferre@microchip.com,m:frattaroli.nicolas@gmail.com,m:nicoleotsuka@gmail.com,m:oder_chiou@realtek.com,m:olivier.moysan@foss.st.com,m:paul@crapouillou.net,m:peda@lysator.liu.se,m:piotr.wojtaszczyk@timesys.com,m:rongqianfeng@vivo.com,m:rjui@broadcom.com,m:rf@opensource.cirrus.com,m:robert.jarzmik@free.fr,m:samuel@sholland.org,m:s.hauer@pengutr
 onix.de,m:sbranden@broadcom.com,m:sen@ti.com,m:sharq0406@gmail.com,m:shenghao-ding@ti.com,m:shengjiu.wang@gmail.com,m:steven.eckhoff.opensource@gmail.com,m:support.opensource@diasemi.com,m:s.nawrocki@samsung.com,m:tiwai@suse.com,m:thierry.reding@kernel.org,m:tim.bird@sony.com,m:troy.mitchell@linux.spacemit.com,m:tzungbi@kernel.org,m:venkataprasad.potturu@amd.com,m:Vijendar.Mukunda@amd.com,m:vishwas.a.deshpande@ti.com,m:vz@mleia.com,m:Xiubo.Lee@gmail.com,m:dlan@kernel.org,m:zhangyi@everest-semi.com,m:chrome-platform@lists.linux.dev,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[bang-olufsen.dk,nautel.com,cutebit.org,analog.com,baylibre.com,bootlin.com,foss.st.com,collabora.com,ti.com,kernel.org,cirrus.com,chromium.org,bp.renesas.com,loongson.cn,openpixelsystems.org,opensource.cirrus.com,tuxon.dev,zonque.org,amarulasolutions.com,gmail.com,broadcom.com,nxp.com,glider.be,canonical.com,sntech.de,bitmer.com,perex.cz,nvidia.com,irondevice.com,socionext.com,metafoo.de,googlemail.com,linaro.org,microchip.com,realtek.com,crapouillou.net,lysator.liu.se,timesys.com,vivo.com,free.fr,sholland.org,pengutronix.de,diasemi.com,samsung.com,suse.com,sony.com,linux.spacemit.com,amd.com,mleia.com,everest-semi.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-14873-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[104];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,lin,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BB1163B9BA


Hi Herve

> > Because it is confusable during debugging ASoC FW update, tidyup
> > auto format style not to use array if single pattern case.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> Just a typo in the commit title:
> s/pattarn/pattern/

Oops, thank you for pointing it.
Will fix in v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto

