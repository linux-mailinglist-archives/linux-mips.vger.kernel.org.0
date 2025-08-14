Return-Path: <linux-mips+bounces-10291-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AF0B25F71
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 10:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 834027B809F
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 08:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE8B2E8E1A;
	Thu, 14 Aug 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="p5V+0eip"
X-Original-To: linux-mips@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011038.outbound.protection.outlook.com [52.103.68.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4532F1F582E;
	Thu, 14 Aug 2025 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161211; cv=fail; b=DxgCD1y5jlUMB6lTZY0SHo5d54oU0v7u99Zn2isyaeVX+iqtAF9Bcisqo48qDKMERIx1nU8K8q/fCbixr6k/6BhtlU7D3MJOEGptfRCEx9EurUc17emXuWxyO4n55JqWce/tzSFnSP8ytvGuIEoHHRKIbB6w0Y+DKmvXERWDtgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161211; c=relaxed/simple;
	bh=YcIJN20BgQACNtcviW/K78QX2OtkfM4Ys4aaWnJMB/M=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HYoalayzZa8DQN4+VyAEN0Ot0zPJs7GIrxapRPo+oeo0A2d0kA9R6k/CXeuZ1XYR9SxjWLbA56Y5AHZYSTpkLpSsGoVk/fHFwh1YQNZnadOtl4+KDCXOicnSLKS29HOEUhzYAUYe3o+Ra4orq0gP120dlNd1zfvAMIWpJ8W3eH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=p5V+0eip; arc=fail smtp.client-ip=52.103.68.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghzOFCIlHQgjIW5rCEgksVpwnHLIT6pncg9dkT1+zvcJkmZn+6pojtHbamok/+SujD0grhUjT4O+btglmteUFtxrcuIqNDnzxfgcifIJ1ksRl+18lxPlnSCNYp5OEl5euMx4lnq+R3+cd93rGCFxQk7WhUzs6MBqXFTGfqC5P8UR4apGWvPqSsHQeaa3oQixsgFRFy5eK9Wln7GbDhMLdoxreSQgcczO4WXQnycu9pnw/aOvaFE5qhmVr9hBf+hDI2E7r8S91V9MUqNbeGh1PTevkESnmPtIGTvSyKbMlqt5NoyRxhNgYrs+8KvmZ3QlNutCM70y3f13Gpm1fqmyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPrCyFHI6U/Dhxf7jGTmetKqJAkeZEVrq7hThmK9QoI=;
 b=n1PcBM+TJbSIxHgMTbC38vyHu/J6OsW+fDsByyE5y9CVKaL0dXrmXDOI1lFSL7LruuDH7Y6WYUfYYtLfToExacf66hgk5KmSyHK5m8Xh1Yvx4szYwqgMDXtGkfbVBsajD3FVyXE9uqqNGEtvHM3ixQD5Jbkje3nOuAmEXRuUwJCRmC2S04OulbNwhZfyQkgeMqhzjOXxmIMSLnEwU5o6lM2vc4j1epuFFy8CGMPU9aSIPOJjhrG3M/bXgnomPYNWdXIgwew79yIqfXnGzwdwnGzuqejtaiZ3XE4/uSceFo2lBjDe7Dt2DLg5ITbPxc2BMSPUpLK1VjMfddYl32KpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPrCyFHI6U/Dhxf7jGTmetKqJAkeZEVrq7hThmK9QoI=;
 b=p5V+0eiprwlc4LgthvsdlVjXe9ubwFpMiAJfDCGqUGQfva7sGbmyRxfiLMxjKW5z7NZXo4y/QIVeJtz54VLZfC0M2hkLEQJVkMZ43yuAcCPvWXW+MUNUdB1utnpCqEylmUePp8OaBUfolQn6hT9NzNavyTXHmM/wmvMnShZ+m7LhHp7efspNhzN6P7naWqdhF+Fo8cXFwHfSacobqmHUDnIAc2yPfFaHYHd4Fsv+PZTOzShs/B+FkG37GIWigvnAZcNAQUyvpTo3wVeSJpwnER/trILNzlf7EEsnt+e/7NPVcRGcXJMpmCIjyh6RIvlGj2pW5NjEDTvnUUW2qXCcSw==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAYPR01MB10650.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:158::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 08:46:23 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 08:46:23 +0000
Message-ID:
 <MAUPR01MB1107224A0D6112F17349703ACFE35A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 14 Aug 2025 16:46:07 +0800
User-Agent: Mozilla Thunderbird
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 113/114] clk: sophgo: sg2042-pll: remove round_rate() in
 favor of determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Andrea della Porta
 <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alex Helms <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <bd4ecb68-2f44-4dd0-ad56-ad20c6682b17@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MAYPR01MB10650:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fc5b2d-084d-40ea-618e-08dddb0f0bfe
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|6090799003|41001999006|23021999003|19110799012|8060799015|461199028|5072599009|440099028|51005399003|51015399003|40105399003|39105399003|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U016a3gvOHBGRk1rYnlPU003c2N1SGNpbDFzaWhyWWhySVlubHc3QWNUNy9E?=
 =?utf-8?B?K3JjVGFzSnpFSFlReUpJcnZxUlZuczQ0ejFlbHlOSmN0elNiRzdMcWtCbXkv?=
 =?utf-8?B?T2hvekt3dVQ1cVJoZHJudk01cnZISzFiblFmc0drVVZlcjFXMktjZ1pXZW1n?=
 =?utf-8?B?RjZFTGZWeXhWQ1FtWWE1cXoxU3YzT3FsSmJuWWh5ZkZqcURhUng2M3Y1SGNj?=
 =?utf-8?B?U0E0eW1XclZIWlVrYUYraEFHWlBGR3dPYVEvM2gxZFJ6Zk15R3ZmakRrcEpH?=
 =?utf-8?B?N3J3QXg4WW0zTnY4SWJjbkZUNzc3ODZiQmtubG1BdHUxMlM4R0pLSXIxakh5?=
 =?utf-8?B?M3A5dFlicHJNQy94S2QyazV6UDZRNnJxa0pRM1dsdmVqckdJZXN5ZG1sUkNy?=
 =?utf-8?B?NFhjVUhVM2FOMjVEU3VPYUFURUJpRmZZdjV2TS9reWxhNGQrTE9vOHhVM1ph?=
 =?utf-8?B?QTdIaWJrVkE4WElDaVBVb3RRMWpsOWNwOEM5aTFhNkw2ckF4d3MxYWx2UUVs?=
 =?utf-8?B?dC82QlVmMFlLRUtOcnE0VGRxd3JZYzNmY2VLaFdBcUVCVUpOK3pLdnhJS3NV?=
 =?utf-8?B?S3lWNVBHYlJkT3RvTE9sSTBNaVJsY0RvdG9Ed3BKeFkzNTRKMEVlbWwxMkcw?=
 =?utf-8?B?alZ0V2lyWTdJbEdRc2N2UkpmSk9NTHlkaDI4V0NCTEI3dnZsTkE0YnRDK3Fp?=
 =?utf-8?B?WldTamFOUENEczFhZ1VKeHI5TEJjZklTZklnY0U0MmcrZzdSZjZaL3NtOFlh?=
 =?utf-8?B?eXNEb1ZoQ2RtN1NSNGdnY0FnMXBaTlVGNE9ZdDhVcXova0cySVJIZUJVR1Vk?=
 =?utf-8?B?ZEFETC9JMng3Z3NYQlV3ME13eFJObVRBRVJaM2Nka1IvYW1UZExDaEhSWjZB?=
 =?utf-8?B?RGxtRTBteU83cVY5dHl1YkRGalR6elM0OWxIelF4ckZmQUJIZk9NeWxTRHlK?=
 =?utf-8?B?czdzTEtJQTFGOUtNY0wvV3NvWDhKNyt0THRjZTFmalRjR3NtTHV4NHYwejJj?=
 =?utf-8?B?bVF0UDB3QWNCNEZJdHZBSlI4TEVsdUxZQkNTNHEwNUN5dUdPT01lSHZDUHh6?=
 =?utf-8?B?S21ITjQyeXlHZTFJYjFvdUhrN1NTZW00ZjQ0WU1EcHZyd2V1Wm5nQ3NhWlYr?=
 =?utf-8?B?czBPWVY5eGIvVG40VFE4eHREZHY4Wkg2TkprNnExaUd0ZGx1WmtjaDBKSDB0?=
 =?utf-8?B?bkFZWmZHRnFUZDZDcElCREwrMUYrQmU3QVlzcHFVRmtxdlhUM3NlWWF1WW82?=
 =?utf-8?B?bmZ6TDdKVzcwQW1tT2E2cFpmYStEb3RrL3FKWXF1b0tQOXR2S1BZQklpU1FJ?=
 =?utf-8?B?WWp2alhwekgwU1R5S0o0cmwzUXg0YWdqYkJXd1hVdEJYMVVCSEdQNmhOcldD?=
 =?utf-8?B?WHdwMjFmVFJ2Tm4zOXlWanA5V3VXYU4xd0tGOE53Z3ZyODhyaEJBU0creXBC?=
 =?utf-8?B?bFZadlVCZFhFbFN4YlhVN3RJN3NLVFBDSnEvdVpYTFFnZEprZDN6YW5Cclow?=
 =?utf-8?B?ZWpLaTBEdVR5dVlJSkxkQWNsWXh5cDlTYWhOSGFMMEhmeWtnTzlyYWd1dlhh?=
 =?utf-8?B?N29aME1NUTk0VE1mWFpEd2pQMEVMd0V3M0VNRW85a2pjMTdIbStOMXBoNmpT?=
 =?utf-8?B?ditleXpBTXhFazZBdEpya2dBVm5NRnRYeG5JZnlHcVdvRDYvSHIzNHh4K0xy?=
 =?utf-8?B?alJqR21hdUpQQkFNWVQwWXE3TFhYV1R0dEtUMVRyaTdwdmJIVTBvOGpGb3RU?=
 =?utf-8?Q?oBTPmUtvK/aR/PrXBroheMzcIUBrgyRG4bAzj/z?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0hpemdacllQb0tWVzhVYzR4ZzZHak55ZmVncXltaE93azBmVWxlZm9GQW5X?=
 =?utf-8?B?cGtaclpudlJEMjd4ekIxWmRROExWbzd6RXJ6ZFBlUjJIRUdBdU1UZUFJdkJN?=
 =?utf-8?B?dnYrOTlYMXZYa2o1MEFMdUFKU3l3QkRoVXZ6U29TdjZBamFCWlAwSG5zQUY3?=
 =?utf-8?B?TGp6VU9FcjJCVTBmcE1xMGN6MWtEbytzQmI2UGhDcktjK3MvVnBjQk5mMmJj?=
 =?utf-8?B?YWtPZk9kWWZIeHhUZnRXVU03NXFkUjR5STJPYktpMFQ0MmxGaWhiVXEwTkNx?=
 =?utf-8?B?dW5qbEdqZStnZHBVSkx5eUl1VG9DdmxDR2tVcVlQZVgrWTRiN1dGWFZKZmZv?=
 =?utf-8?B?cVJoSi9vQ21OdmdBMGFTYnZWVENVVkxzaXZMZURicDBCOEtIS1ByQnJaZUFo?=
 =?utf-8?B?ZmlrNG9IZ0t1TUE1TGt5TUhRVXlXOXRkOE4yd3NEMURXam1Hd3RoQVUwb0dW?=
 =?utf-8?B?UjdMRkdaMWhnSzl3VSt3V3JrL1NOZTVlTUJKTlZmVlBzb0VqSnl1N0h4Y1Jp?=
 =?utf-8?B?YkZLK2EvL09QRTNQSC9kZ0t2Uzk5czBEenhyZlIzSzgwWmQzUHVmVzNYTGsz?=
 =?utf-8?B?ZmViS0U4TFVnTWJ3Y2hEdmZhMkRwN2gzeHJvM0RtSUZTRXc2aGIwTHppakhG?=
 =?utf-8?B?RFlGZDFSY01XL2lOMGlqZC93dkZ2dFpNVlFBeWRpenliVXZvSWVzT3JSRzJs?=
 =?utf-8?B?V01xSy9iWXRHM0kvaVNnLzc0Zm1HL0ViOEtmWnU0ZkY5VDR1My92SkNIaHh4?=
 =?utf-8?B?b3BBU0tDbHNheFpBbDVCSTZrZ3FwcTU5T3N4OEZJcDd5OHQxVDFHbFVyK2M0?=
 =?utf-8?B?MnFEaWtoRGphVkE3cktEUGJ6UGx1bG40Qjg1SEhCcUFINHdvUkc1b0hTNU9G?=
 =?utf-8?B?eUhtdUdEVHlaMk9iWEtUYjdsYzdzbVdLNWdJS1I4ZGpJejNsUkVHRk1kUG14?=
 =?utf-8?B?MTJaeUFvWUlXN3VMM0xsWk1mOHZ4b002clhJdzZPd29aMUpIZG9QenN2U29k?=
 =?utf-8?B?RjdmM29oVzV1Q3VQQ0JoSDhCbHA3R1hISVJST1ozYllmNWtiTUNCd2VDZnRZ?=
 =?utf-8?B?L3AycTJNK3JDeTAvMVBDelhKK3V5bjhyWTdISysxR2hSenlWTHZnR2V4ajBo?=
 =?utf-8?B?eURWalRnbzlTVkdsUjVzZ0FlVngzbkdvZ01iQnF1dWQ5dzFCeUdNRkk0STZ6?=
 =?utf-8?B?YlgxSTB3WmQ3bldBZkdERnRxMlM2aTRoN3gxTTgybXliNUJEN0dZMDBwbi9k?=
 =?utf-8?B?d1ZhSHhUV2luZFcyYnNtM3JEU0pUdmdNNVh1TDBsdVB5S1EzRHpWNXBVMnZD?=
 =?utf-8?B?TCs3OUhwNkQ1bDlPSkduajcvZlNLcG14Y3dzVDMzN1hKUEpGSEVKRHhGT1J0?=
 =?utf-8?B?Zi95ZnMyeGtZUFZBRytOQnlqMk16NXNmeFcwTENTczNudHV3eDY4N2dRNm9m?=
 =?utf-8?B?Wk5aUXo1RUl3VGd0ZGJISjA5VEZLRk5yTEF4ekhaSG1iUEdyUWZ1dzUxMVRi?=
 =?utf-8?B?NEhoNTU4L2VJRHI1UTJxWXJuYWNRRWlxWmprNmowQjYwcE04UlhEVTlKTHdw?=
 =?utf-8?B?clVpOGR1OVZyMTUrU1pjalNraU51T1UvdEk0Z21HcmFiUEUwU2Q5VXUzaE1Y?=
 =?utf-8?B?KzFjb0p3RWd0TVdmTEVsL3N0MUZ4amxFQVp5Q2VmWHFrMFdkNDhTQ3dOTDF3?=
 =?utf-8?B?U1FiWVdPd3RkL2dZNTBNelVLTVh0SGUrRFlxQk04UHBsYmh0aERJVDJuQTVq?=
 =?utf-8?Q?f0ePYnssesZtqWhOO7hsbeA7l0YkY4Sfln+QA4S?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fc5b2d-084d-40ea-618e-08dddb0f0bfe
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:46:23.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10650


On 8/11/2025 11:19 PM, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>
> The implementation of sg2042_clk_pll_determine_rate() calls
> sg2042_clk_pll_round_rate(), so this folds the two into a single
> function.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Same comment as Alex. I will test this out after you send out v2.

Thanks,

Chen

> ---
>   drivers/clk/sophgo/clk-sg2042-pll.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> index e5fb0bb7ac4f97616f3b472fcab45e5729eb653e..b2cbd50ac73c7538b1acbca517f4259cba885fcc 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -346,37 +346,30 @@ static unsigned long sg2042_clk_pll_recalc_rate(struct clk_hw *hw,
>   	return rate;
>   }
>   
> -static long sg2042_clk_pll_round_rate(struct clk_hw *hw,
> -				      unsigned long req_rate,
> -				      unsigned long *prate)
> +static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
>   {
>   	struct sg2042_pll_ctrl pctrl_table;
>   	unsigned int value;
>   	long proper_rate;
>   	int ret;
>   
> -	ret = sg2042_get_pll_ctl_setting(&pctrl_table, req_rate, *prate);
> +	ret = sg2042_get_pll_ctl_setting(&pctrl_table,
> +					 min(req->rate, req->max_rate),
> +					 req->best_parent_rate);
>   	if (ret) {
>   		proper_rate = 0;
>   		goto out;
>   	}
>   
>   	value = sg2042_pll_ctrl_encode(&pctrl_table);
> -	proper_rate = (long)sg2042_pll_recalc_rate(value, *prate);
> +	proper_rate = (long)sg2042_pll_recalc_rate(value, req->best_parent_rate);
>   
>   out:
>   	pr_debug("--> %s: pll_round_rate: val = %ld\n",
>   		 clk_hw_get_name(hw), proper_rate);
> -	return proper_rate;
> -}
> +	req->rate = proper_rate;
>   
> -static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> -					 struct clk_rate_request *req)
> -{
> -	req->rate = sg2042_clk_pll_round_rate(hw, min(req->rate, req->max_rate),
> -					      &req->best_parent_rate);
> -	pr_debug("--> %s: pll_determine_rate: val = %ld\n",
> -		 clk_hw_get_name(hw), req->rate);
>   	return 0;
>   }
>   
> @@ -417,14 +410,13 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *hw,
>   
>   static const struct clk_ops sg2042_clk_pll_ops = {
>   	.recalc_rate = sg2042_clk_pll_recalc_rate,
> -	.round_rate = sg2042_clk_pll_round_rate,
>   	.determine_rate = sg2042_clk_pll_determine_rate,
>   	.set_rate = sg2042_clk_pll_set_rate,
>   };
>   
>   static const struct clk_ops sg2042_clk_pll_ro_ops = {
>   	.recalc_rate = sg2042_clk_pll_recalc_rate,
> -	.round_rate = sg2042_clk_pll_round_rate,
> +	.determine_rate = sg2042_clk_pll_determine_rate,
>   };
>   
>   /*
>

