Return-Path: <linux-mips+bounces-10211-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B8B22058
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 10:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38A7626239
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 08:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F902E1C50;
	Tue, 12 Aug 2025 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FlbbCrma";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="u5N7fCrZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A32E173F;
	Tue, 12 Aug 2025 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985966; cv=fail; b=LEFqhXd0WTGz4A7AlKuDSMIRiLKuZXsEW1CsaZ50FXcpwxuvXjPxlYAaLYtax+fhC3+70m07JUldvhnAdoakkDbFoGF1K0e2fpTj+0qZG0bg99hktyol0T4tqry9I5s++Ak5Hkv8Z+CySCT0cscL1TDXS83jnajrLmMDQ8jt6P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985966; c=relaxed/simple;
	bh=KT45Xcnrz8UiECf93YSBaI+1tRRU1hhMZM8tUcbuBcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKe4T+UX+gp4LcvtOygvwnsNbk0NbCzOR+xiIhy+B8/xttH/YdgXw4RQP1LYvvskysutr2E8ZB7MZEHj46GwP0RNKDiublBAtWh8GFnBRALn3tVkIf3n3UzoiU/okFeThWWh1mJUvZhj04C+wyLMLIIEqJqz9+AfiA+AYCjIXQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FlbbCrma; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=u5N7fCrZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4KGtP010112;
	Tue, 12 Aug 2025 03:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lA98HjD6qm54fyl3rXalK+w2c06IYLIDdmk7+leXTD0=; b=
	FlbbCrmasbSsV6mrrncPAKdDIVJ/4mIfnGMp2n/gZVjee0f1wZeZlOZpgcTYZ4wq
	LhxaEHee+gYHDDuSmyNWIwB/UMDyapooaKK/z211ARscBPqJYhIhhOE6UUA4u40t
	2YhNjmMllQ0dkPS7NXOUyX17tGeead3alK6DsGiPdWfRwilWKOxazy3+XDcjDhMK
	p5geF9in8OlPaNeM7g5BYgv7Iw6cxUuHPCGkiTmfJYCGrM4owyH1xzvA+v/MZSTt
	uwCS1Yh1A2KjT82dSRI8UC+vbNbn79n5bV8VS+7MsZJ9lzNQwWfR7cEQrEeXE43m
	waa07dr0mEqhN3haFy5A6A==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2126.outbound.protection.outlook.com [40.107.223.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48fj9ss0ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 03:05:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGssFuuee61MWmusr7cOQGX9nZT9OoGzryFR7OvgAidlOa2Y6E9KfDhxAWl8ZUBHbcvrjw685fT2ZvzsfmHmvc6CBHvX/UNeZzCmseYCl20Qxs74BQ1XSEurct3Elvp6x4qrKY3EGFh3vgE0bobka0LuPQEnruK2Q5M/goJPa+uFpy0FKxsO/S/b/bj0+SOjSy1W8V7IPJpsSREhqhLUGDAJjXuVa4nWkKAOYH6SJZZ0oZuruR0qmGLTVAp2iTcbLt6G6dqwStxz+Tr1U1w49OjO8aQOt4mYFbWdaPO9W2Ax12i7va/vbNVnt9juvIqdQqeZNHiVAz2izSSzEizNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA98HjD6qm54fyl3rXalK+w2c06IYLIDdmk7+leXTD0=;
 b=r8SlvZOiE+61P4DahAxyVtpgX+/EvScMKAzpv965DGN+6Rp+YUrIBkLDRme170rfOk6BkMoSWd7jAnmTO+HNLYHpOURSd3IhQVuvhS6QvI+4nihs2xzvuFS2cpSC8qCXYdDCaz1p3Pk+07kaOmWthkNrEcYeVcm/e8cyiAodTrMYWhBZVdNh1UE5I8XR3egSEhOu9ncBK+0RF0gaWFBe1du1YSquRWSPrDlhXkk8CCVnyBZC21TczAMMh51hxcLF6x20xA0a+4qfDzuT5k0cCxdmhf4a+sfWlA8koRhaF19URYynnXMRG4LeiwLHuKGv2/dsJxceEPrsQSKkn4lIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA98HjD6qm54fyl3rXalK+w2c06IYLIDdmk7+leXTD0=;
 b=u5N7fCrZDKTH0c4Ctob2honrufyWLkSXgjOAH7PzWiET6sRXndUJPgyqDWYsVrX6pq/zbJ6F0QH8by8Fp/8/Nb8c5AWBRXizwftRBsiiau8GEblHTb3Dkc81dFF2ZS1toLd7ktPQBYZXpsMCHPeDHz/9IhL7f7tOqsncFsGkmcU=
Received: from BN9PR03CA0160.namprd03.prod.outlook.com (2603:10b6:408:f4::15)
 by LV2PR19MB6125.namprd19.prod.outlook.com (2603:10b6:408:17c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 08:04:56 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::9d) by BN9PR03CA0160.outlook.office365.com
 (2603:10b6:408:f4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Tue,
 12 Aug 2025 08:04:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.11
 via Frontend Transport; Tue, 12 Aug 2025 08:04:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DFDBA406569;
	Tue, 12 Aug 2025 08:04:54 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EF6E682024A;
	Tue, 12 Aug 2025 08:04:50 +0000 (UTC)
Message-ID: <72b77442-b33c-4559-913c-c5ecc8a822a4@opensource.cirrus.com>
Date: Tue, 12 Aug 2025 09:04:41 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 063/114] clk: wm831x: convert from round_rate() to
 determine_rate()
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
 <keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
 <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Andrea della Porta
 <andrea.porta@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
        patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        soc@lists.linux.dev
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-63-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-63-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|LV2PR19MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: b7be81f9-d140-4dba-dbd0-08ddd976ecd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|61400799027|32650700017|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHZZcHdsUmVITnZ2bkN2anZPQ2VIcG0wZ21JdkV2UlV6YU95R1FWNUFsZGha?=
 =?utf-8?B?OEZOaVZPK3ZZVUszREUzMHhTSXhuc3FBUWFzZ09QRm1DTjJpblh3YVZHbk51?=
 =?utf-8?B?R3VOU3piRUw0enRuUDJZRWtBTGs0QTZtTFVLWUVqQnpSS2s3dFV0d2tJYitw?=
 =?utf-8?B?Zk84U2pMaEFhUWZVak5MRldwejlUWTJDUXhCZVZQK3Bnb3ZLTTVmZTFWWm1y?=
 =?utf-8?B?cGxQSXhzcTdiSU9WeEN0ZEtHSWJwUkMxVCszbzMxZHQxRGQ4OXpUblRjZXp2?=
 =?utf-8?B?aEhneFFHcmhnMVRSRExQNWlMc2dSYjgvUVJ4SFZFNmc2NE13RHVMU0M0em5h?=
 =?utf-8?B?QmVlSmVWelVsYXhlV2JJWGk0enVmeTBGaUsrd3ZBOG45cU1oZmh4OTBENVJx?=
 =?utf-8?B?eVdJVWord0Z1cyt6aXNhVEUyREVkc0F2T2VqejhqelcvOGdiZ1lrK3RTMGlC?=
 =?utf-8?B?UWtvL2d6QnVpYTdraUNPbWZ5a1Yya0NMTk1nTEU2VnlwTnpZQVN5aExuMXJ0?=
 =?utf-8?B?ZkcyUGxMQlgrTHVseFBIbjlEdUlPK2ZQWC8zZmhvTjlmb1ltNTQ2WUlwMmFF?=
 =?utf-8?B?bEdOVTRKTnJtenNTMnVGdWppV0xqRTcxUDhnT3Bqb3g3NGpRNXN0bEE3d3BS?=
 =?utf-8?B?VVdsUG9qYmkwc0Vmak81NmxleFdROUVhSVpYQm1qa1RUS1d2eEJUVkZuTTFm?=
 =?utf-8?B?dGhDZkRvZ0VpaEY0TjIzRm5Jc3Q0dFFPZTRZMWFjZmRRa3NXbGZJdWE4ODdq?=
 =?utf-8?B?RFF1ZUlFNHdweHlpMjJMSmJVN0hkWk8rMkhxeDRsMm5UbDdtRWhRQjdhYTFE?=
 =?utf-8?B?WXBvbkQ5ajN5NUdIMEt3bXUwVGpCa3dkb0RjSkdaOWluZzhwMGRNc1hWU0VN?=
 =?utf-8?B?QTUrTHBkS3ZMb3Y2b3pwNkFyRU9sMElKellBVm9XS2FmaFlBK0xXM2hDdTBE?=
 =?utf-8?B?a1NMWnNURC9ubEdTUS85RFRDRDNXd2FsMXJndmRNWnpsS2t3WHlmYzBnbTJo?=
 =?utf-8?B?M05MVmoybXlJYm4vRUhxSWRjRmdrRTd4cGdZR3A4YnRxaENwZU5CTWV4WTlu?=
 =?utf-8?B?cURvdkNjVlN4N212SXpZdUZrUG83OGlwckJlNEFZaGpyYURsbHBFWEtxMi9R?=
 =?utf-8?B?MUs1cUtSKzRJWmQ5SjZPQXhsRGFFWWhOOCtSZXZpWG1aNlFsc3Ewek0wZlND?=
 =?utf-8?B?dXhqdEF3L2FlQTZZNjZabVJWMTRKY2xyOTkzcDUvRXQxSnZiMjRTdG5tck0v?=
 =?utf-8?B?UmpuZjVHNnZOREdxL2VqbVlSNmJOYTNsQlkwUERxcFFyeHB2eG9Ga0VhTkZv?=
 =?utf-8?B?UXNIUXRlZERoVENhZUxNTVcvQThIM1Y5SUR0M3JiejJCbEVpSGs2OHg3cmh0?=
 =?utf-8?B?MGEzaGg5SFVxbXg2TU5PVWRuTUJNM2Y2SXQ4dFdIcFRvbjVSL1czU3l1NC8v?=
 =?utf-8?B?YlhaeWxHM3ptc3hPdGk1UGNOdmFOV3FJRFg3MU50ZVh0QW1JRENrZVJzUm54?=
 =?utf-8?B?RzVTYkwwZ0EvSFZtMnhVTER1c25FdTlYODBTNlpyb0xDdjJTTTlUMnBiRjBO?=
 =?utf-8?B?dHJXaFJlSGgyZ1RwcURaSDBKM3ZiQTRLRCs0NGdCQW9VUXFzTlU4RTA4b0tN?=
 =?utf-8?B?VW9vMjdTMnFkc2YwSWpWbHJPMFZJaFlyRC9UVzhxZmxnZ3Vzb2hsY0J6V0pK?=
 =?utf-8?B?ZVdJOFl6QjZnQTg1OXFlcmRoZGNKQnA0S3FyZzduYnV2WmZ3ejR2MVBBSWxR?=
 =?utf-8?B?MjZSYkNuVkNhbmcydHlDOEhaY2h2T0RyM2J2VU1HZXZWUkFkcXZUVkRvRjBF?=
 =?utf-8?B?VXRLbFkyTno0RnFGeEhqTE9JbmpLMHpCVXNhY2ZIQWJwaTNTN2lIcFUwTUp4?=
 =?utf-8?B?bVErTG1md21XQ09XZmRwT25rYk4rTE5Cc0lPRTdnOVdIdkFkOVZ1bTN1cTh2?=
 =?utf-8?B?TDBWT2FUbVFxZGVDTDA0Vk5UNHlKVklNc0ZJRUNVYmtrcU95eGcvWE1oaXRn?=
 =?utf-8?B?QTNFbXVObnNqV2IvWllaNmVLNlg5N042ZWFkRU00blh4b0NCTjd2VDM4OW1T?=
 =?utf-8?B?cW1CaU1JSHhmMEZhYmhrYmp1VFdQcWdGRDZkUT09?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(61400799027)(32650700017)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:04:55.7299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7be81f9-d140-4dba-dbd0-08ddd976ecd3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5MiBTYWx0ZWRfX9ylM/DGVnEdU RSSSpD8FjrOSnieyP6zJG9AS1xKYYvFDVFj0G4kit5VBGIbtGQCfuatJp2F9qDHdlKUc7Zl+xNS gzerxZ4SbkjCiPBu3KtcJB/N6xM4yDiD5Ev1XdUGPVb8/cVN9d522FX7rFGRY8fFSwHjuBg1Fzt
 5AFefF0awtNKhHFadOqJrYlLgy0NbZ1NQnrlvu/aT/7qS/SeHaXRGAlKWgBISzClrVkKrNsxPHa IAnXkJS1WLasjR5T/x1gWPwM444b8B1AdZ+YZTZFC494SCBWoDiGGmXlCB9sd1OpbSS8vDg6wZq yZgdEf35dD2JfVkSjiz3bTxL7STTu9+az71rzAvv/vio+jihnjCtwQDFj2FM55IyK5kMTl9noD+ hr3BhgHI
X-Proofpoint-GUID: QPfyWnL45vCIvr_Zliwem09PDShITb4O
X-Authority-Analysis: v=2.4 cv=DLuP4zNb c=1 sm=1 tr=0 ts=689af5ac cx=c_pps a=Dk5bMbaT25Dkt+m1nh8p1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=20KFwNOVAAAA:8 a=w1d2syhTAAAA:8 a=omrlzGe4tN78mTyd88QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QPfyWnL45vCIvr_Zliwem09PDShITb4O
X-Proofpoint-Spam-Reason: safe

On 11/8/25 16:18, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>   drivers/clk/clk-wm831x.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

