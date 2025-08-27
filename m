Return-Path: <linux-mips+bounces-10643-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1CB37A13
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 07:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12CB368188F
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 05:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE8631076D;
	Wed, 27 Aug 2025 05:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="By0+1J60"
X-Original-To: linux-mips@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB531EA7CF;
	Wed, 27 Aug 2025 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756274321; cv=fail; b=p3q+Sk8RWsaaqPZp4bT+t2KUe/xZ0LLgxkmqqoe2JFP2GpSS4Yuvln0NjepqtOo3IoxvRuLOerht7VhclH6XWwiNCCioo+iB2ZD8Ccb95gTRXONGjKNC2czZEM67UmA8qbQD05lXYNmu9EPqgqgk3Ia78RDilXoqWIRgtPz/Ljg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756274321; c=relaxed/simple;
	bh=pN6ptxYYNojJXLGC6GCqlNbp01i+kq8/4iO6vuwt6QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TWr6CWQLycjlo0bgBvk9r3SiIqc3rsqqDK3EJ+cEWltfjvMYK407G7+p2tQvD1X+ug3cVIE7WN6c981ISQs2r7c20Q2lyxLCTKBqfbdEpIPK2CDLtVd2ds3U/VrcbO7I4kCWwpfWceyCstgEX7mRKpYhWw8suU8a/oJIIRzaR/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=By0+1J60; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHvl1k82bE89ygKcJt7+JZZ6A9dhlh0Is4mG/qaQRxgzt4Vd57xdryA55ZIXx6L6gs2WXxzLZ0ck67W4uyjBxVLvdoPtxiPv3cNWcEzI3fTGcBkBzwrLZ5VyDLAj71XzLUbNV4J3piLYJB8Ob8pQbY0A7ohTWRU28rGBG0Iux21NWhZMyyHQfYxrTZbMgIF/1FIoaxvHNXgNwsc52Vq6bvlKqR6JtDBce/86+z9DAYPO88AZQdfP0qdoYD1cgQBj46UhiakG9OsjCINq2IpqvtYNaeE11azxUMd5oudihRPWG8Z1DRwvl981OODP4sN6N5LD22cHKFMCkEPaFW5BTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnpvUbJIadywErKGBduc6GDwpN8Nd8XaydLyRxdwGL0=;
 b=vCu87QaMnyGtDQmwRkV/gA2oNCZ/sORCnE1xehzXCfcK+crAFdsgIzF2rlbezcyfBGz2hSLuOIiJbi058BsUMtB+3g0AC9d27vT1kwx9jFLVG3xid14twkctQELX4FXjarfgUUxw0wX6rD/a0VbQPXLHX5kuGcoW6gPJns0YKB90kjQx4DH2+qGFQYReypVx70vx7YGwLaD0+i4NXqTUqvzMUkEanMlZcngN6S6k7fjL7t1Ae1edo66SVuLorC1uUfuVbzc/ujNzcwFTSv8z8X75hCXOoyDyFcFop/0BeY/WvtdxePVXactt3E/nd6GUd+lf/SQm4XrAUPxHlXc8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnpvUbJIadywErKGBduc6GDwpN8Nd8XaydLyRxdwGL0=;
 b=By0+1J60GPMriRR96IvQFv8/dBVlYzvWhFLg/7Y7txb/uBK1jBAUjRJgo7puBphwbXpoA7wCjbLxYUBAItpBOykQ7fUwLib++met3tS+1Unj0LdnWIdBqymv47RjBVdVSbFs+hfFBxxnykfTRFIKJZMNItUSeHl/I9FcIxzzXiiiW4i/UiRagsTRkw5vFyniqYdbOuh8dO0Bz4ddzu2vE/Exw2MyPYR/VhsGHXPUn+ZRXczM+BhVWkhqe6CxjinLLiTX8VRu81h3VlgaTQZqrwi3I4J6C7Zc9tva2ETIzaMxcW3Ms/aCqr5nJas4mDDeTEqUQG/HLUzdEW4hl5AkXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7790.eurprd04.prod.outlook.com (2603:10a6:102:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 05:58:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 05:58:36 +0000
Date: Wed, 27 Aug 2025 15:09:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: bmasney@redhat.com, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
Message-ID: <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 43de10a9-3ff3-4c09-9ef9-08dde52ec324
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T4GrBff1TuWm9e4dpqImB5cvNWKhfIHJ2CVvqPitA0V4kdJ0IkfwbPnrCpAK?=
 =?us-ascii?Q?rbZXgFzMUJKw6K09fWSqKT6KpbCgSbJXUumcu67WVb3iag9bGwcDarWOoxvM?=
 =?us-ascii?Q?QAKXXc1Oyukx/l/s/UekdlOV3KtD6Wu+uKcKXI1cGdYvXB+gjq5lLOcDNtHe?=
 =?us-ascii?Q?lBUUmsUaN2MEGl7qOgh25Of0sf/El6kXcLW9BYGNhKEaV6xWifq3B8ZgLh/p?=
 =?us-ascii?Q?tMcemvb3iW0K+H5NPjSopqsfT3U48vFQw1eavafzL4IJOsmNoxFdU/qEc8E4?=
 =?us-ascii?Q?/bY+VOJ7IfRn5pbe/jjz1mUO7HWqMiIL3MuCtxkKfuimtrGDW0Ecj5N3gLik?=
 =?us-ascii?Q?VGbIe0GDzEaVh7KgE8N7CDuUT1XbIL+NgbNGrxxv1jLyf600R1cNfoWtQ0ai?=
 =?us-ascii?Q?rKAXHf/p/DPr8oGdOt9vIhbpWKqJ0GAT1kBms5psxuIBgJ+xG57+jz2JbL4A?=
 =?us-ascii?Q?Ax9yaPVKNb8X/ynwK7S3lz9oDcr/mvsIq3Nioklj4Y9jvuvEReYvAR4J6LGH?=
 =?us-ascii?Q?sXutoTPd9PiyyWzB9ciDUXxEEZfpkYvCwG/4aPcShEPYLg7J3I7SSm3YTG6a?=
 =?us-ascii?Q?53+ArNJKvXSdKIG8Vw4ICzLRVNbuUXS/XQ99IPQO91uhm2/pzZgkEmQFf7ho?=
 =?us-ascii?Q?Pt3mflq1Vx9ANiy+MD9XiYCNrPF8STc4SfNNtoDrojOmbzkM01MQeOb2JuMn?=
 =?us-ascii?Q?rnvJJ1L3xY7mcVmPEApq8ddyM4QS2rkFSs9OwTmZpA7DS54Y5dVmaMOrBO1X?=
 =?us-ascii?Q?ghITpyMPyPmiG+tK8jeesfYjxI5zU/yAJwBDbxrlTX9l7+fH+pPUNkgWdPcV?=
 =?us-ascii?Q?RpuvKsCZQbc2RQ9TOW4hKbcmWPPvWcH42KYvARJ5V1elo4bLV+cNNa+V3M/0?=
 =?us-ascii?Q?hUZ8AHAQQSCDd6lkeNH6qUE6hvoU/CCeJZbBk/+W+vXEyYFa6NgI8LHpwi1g?=
 =?us-ascii?Q?JdVXpsv3UdV8WhQypW0gi1poziH47zYR7bAxw3DfOVmaP44RWerFJXIvRRds?=
 =?us-ascii?Q?L6sHqKUa8FL+2b5a8qSK6dm5uXH6qF/axJyPDv+Mp6KBUf2B+O1PjpVzHuVs?=
 =?us-ascii?Q?6U/PO4+Au7A4UlIVn6yEIVZbMxybtaxWiOoprHZk+mdKhsyMp3Ipdb1TgAQz?=
 =?us-ascii?Q?U6hgM5GhYr0X1n79iORrpicFkGxmnBtl+IUkZ3tCBotFFSeY5V5hA3wXaPYU?=
 =?us-ascii?Q?yJZvUaFqQwFyiJ35mh0HcIcXUc6o0cux9aIzQBKmLBN+PBa1HjbZxhCZgdf5?=
 =?us-ascii?Q?Wltl3edlx88VS4PG9Ih5q5lO4E9EB6Oqa4aeAO39HM1eWZWGL/rZ1MZ/s37A?=
 =?us-ascii?Q?oFw+ugXcE0Xv/u8lvsPYkuN/aMnfIWIQxAJl/DfvyGes9b0JEwPHuHS64ph/?=
 =?us-ascii?Q?/3dEuA2EqdVJ8R0w+GCMvAJcN2niHhJ81TW+ka1sfQgSdd7WENEK7zMoMcpc?=
 =?us-ascii?Q?CiRanuYUEo67iF0ZaVcFVtq/lmox9lRHwjBOqJbKZqgUzaXYP2gvBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(19092799006)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZNFx3WsRw7t1ZwqRmdkWHzvzrJVk/3JRJj4odsk2LCy0LRC3Pcj4XV9owVjh?=
 =?us-ascii?Q?IBNPr+2/QWGkGkgZTpni27p7RfGaTd0ROh/2HB2i9vxaGlLSyFuM9zjIUjf4?=
 =?us-ascii?Q?ILJs+/RskGW1IQpmxJbbyQlcV/nUalMzqqXdQ1W6+acXXlPirnGVWglD9hYD?=
 =?us-ascii?Q?7bg6MS/6q5WYCxVgPykL05HVyVR+ZYt0AMVY+/NQPC4pzrtMi8DrIFInoOw9?=
 =?us-ascii?Q?MPSKRLn5luHtExvm+xjhg2jKcnWLbWKZ96AiLSPn27lAd4VwuIJlaEZ5Ocra?=
 =?us-ascii?Q?ZPkMOHATW51225ri+gxsOlCLirfZlEv9GnAaJLMFIhArawmYBRrQQh++gof4?=
 =?us-ascii?Q?epHiCN5J0MbeuEMdlFDRTTNTnxKES48s+dc6QVGGysyxrDIqgxNqrFc6JQlK?=
 =?us-ascii?Q?njJW0IThG2uig/Kf3cyPH/XHUsdbzcCGfKNKgnQyt1pZU9LwT1XDmZKMSiNN?=
 =?us-ascii?Q?lA5Re0hfiXOX5RkDsdr5mLaUaXk1rF3jQvVux/XnKcJs6/DMmwgxo2E6Hvh0?=
 =?us-ascii?Q?aASWJW1CHlcwpvIWmjwp8Ql7WxYmkPAz2itcukF6VWja4wlv5s9kPI6x09VW?=
 =?us-ascii?Q?D+qHcc8EOU0guUSqXqawa2MEoLOf78h3HJLaACAb4512llfKEKFSLrQBuYYt?=
 =?us-ascii?Q?GDL77xW8U2755qZbSRP+RBTJ0o0pulAONHRpGeAbgP895hZv5KzIE24MKMPW?=
 =?us-ascii?Q?nIBP76QG1d7il2EjBeG0gEsI18twnCjxjhQgd0zhFvVZWT3d7zgrGUv7TVAy?=
 =?us-ascii?Q?5e97u/xDFJujaX1Zz8OXkzqRceyLDp9TGdY2KpFrbezSQ7kIJw1IjWtd5gj1?=
 =?us-ascii?Q?LqH0cb4+GdPBEiwzteAaTikDEJfnaRAsQFwk904CIKtzEe8R4itFnlh4r4tr?=
 =?us-ascii?Q?CjtI9DafcAy/B2X6Dmp12C/IIdBqf74C4AmC6emcKN5z6hGyf66Eu5URj/7B?=
 =?us-ascii?Q?OrG2S2bJsVQTunDKmLslYKYgWqTycFfiO+IkRLWoEXC9ezKRoDybqmhj6v7N?=
 =?us-ascii?Q?7ktRUCBt4AI/5EYhRaKV22gbtCPMtn1jIaE+3fVZ3afUkk43BmO/R0iyTQlr?=
 =?us-ascii?Q?ZPmWNm2BlKVc8kdg8P1NTcPNMG9g93hsU9TDq+3iRaEQwug7YxFuPpYTzuur?=
 =?us-ascii?Q?/g1TyDu/I+g6o/pdTAjNFe1scZ7F7Fl22h0LeGbCiGeAJjpCGwPMrE8+HUtt?=
 =?us-ascii?Q?W4xN9CFQYp18ATc9IKcFkgneUwJ8WE+tiEU2A0XxyeoBy4/TgVMHldUpfgkp?=
 =?us-ascii?Q?aVbQr3hsKFoDcmcc9aLKu6zP2wT0xCbjeZS6T/xBOfEuHNn4VXHyJ/pzeXBr?=
 =?us-ascii?Q?kmJcDC0FNNmpsCPeq0RgUrnHdh7tcJU8wKJqilrRzE5pVXhqlQon9I8Y6wpF?=
 =?us-ascii?Q?48DHjrkeu0nQN8YcN5+ceph2k2Oraui/NejiEkWhV+g7ov/Vj2x/nPqONnY1?=
 =?us-ascii?Q?MZxh025PfUGpSHBf68IUIhLTDeWEvtJAkWKfzujjFhvsUw57YB9GoOjvn+3y?=
 =?us-ascii?Q?3BgXC53UDr//ALjpwr4JqZ58PKBuW0JjznUC9CaglrF0EZaHBZLveV2lTuEx?=
 =?us-ascii?Q?pHi+kq4pn4FeQS0alGzmePG0pzXHqoTTQl2qS+Ph?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43de10a9-3ff3-4c09-9ef9-08dde52ec324
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 05:58:36.4719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdtIrqTdDo7PTx6b9rPwCfrtNHqS4PbPvMIII/QkNHEgJ2rvUYl4enRS864Yn2JOx/S7PVOGiSzVHR3Kn7WmTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7790

Hi Brian, Sudeep, Cristian

On Mon, Aug 11, 2025 at 11:19:44AM -0400, Brian Masney via B4 Relay wrote:
>From: Brian Masney <bmasney@redhat.com>
>
>This driver implements both the determine_rate() and round_rate() clk
>ops, and the round_rate() clk ops is deprecated. When both are defined,
>clk_core_determine_round_nolock() from the clk core will only use the
>determine_rate() clk ops, so let's remove the round_rate() clk ops since
>it's unused.
>
>Signed-off-by: Brian Masney <bmasney@redhat.com>
>---
> drivers/clk/clk-scmi.c | 30 ------------------------------
> 1 file changed, 30 deletions(-)
>
>diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19c0f15f777bb8c51 100644
>--- a/drivers/clk/clk-scmi.c
>+++ b/drivers/clk/clk-scmi.c
>@@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> 	return rate;
> }
> 
>-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>-				unsigned long *parent_rate)
>-{

I see the point of round_rate is not used if determine_rate is there.
But reading the code of round_rate, It might be better to rename
scmi_clk_round_rate to scmi_clk_determine_rate.

Anyway, need Sudeep and Cristian to comment.

Thanks,
Peng

