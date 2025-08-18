Return-Path: <linux-mips+bounces-10357-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 032A1B295F4
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 02:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082321967218
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 00:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4A121A436;
	Mon, 18 Aug 2025 00:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=nobuhiro1.iwamatsu@toshiba.co.jp header.b="uTpgvCPv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1800.securemx.jp [210.130.202.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F171E25FA;
	Mon, 18 Aug 2025 00:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755478252; cv=fail; b=lDYgWl6qYmDiRF2gEnq9t8VPGsLtAt7cGiP9SR5MVutfNteVjJLN3gyjbmXR9tM0ftEKUkrW0XzGIAhNvgxfKLP2RRUWppVgqFosm/NcBPEggo0OZC/6D35Rs1KHSJ8vUYE/Nhk2T9h7y9sm0X/owBncmzPqrhqLeUHuNBm7AOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755478252; c=relaxed/simple;
	bh=kJ5saMxYroPXmCdJgJ8gydfKe/Gr3Nhtu4+meZnknnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uhgEwYwnZahUzmRhZNLMRv4GKc0ESXjXguDuEvvyaOnUIrDMoZrK5j8QddkipEydsiQqIvvFXbonoJJ5X+zRQfCC1HYX5Ux718PqpD04eG5Yq2hKAKnqF194D4dB5EcSZTwMoSbW/fy6OXxmOJJ0IMZFdYbs7lvRDHBLPelDhaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=nobuhiro1.iwamatsu@toshiba.co.jp header.b=uTpgvCPv; arc=fail smtp.client-ip=210.130.202.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro1.iwamatsu@toshiba.co.jp;s=
	key1.smx;t=1755478136;x=1756687736;bh=kJ5saMxYroPXmCdJgJ8gydfKe/Gr3Nhtu4+meZn
	knnk=;b=uTpgvCPvevl4Wmdxwd6m4vDrIHucJzBQpz5GCn197UCEtg84g0T3OElvkwkcNrJc1hWz1
	DW/lWqGBms4JlQwZ9BjZ1+j59QL0Eifi7qvz2V+NrpzRodNE4zsb5Nf4LYoEA/1uDXkhiiQfNgBIR
	Puv9Io4+8wrf+cD07EUYx12NTskkcH4grPbxBjdehDNl3rGMRR4RBvn8rwigzFOR3dVcavzOJSkDd
	grxjafphfplvkf7Nzjc3U56b3u1/ucNSTdfTqj2LuX8p00Vzy9ta1yclNw6Bpmw6G6nhROaJUhfQM
	Q128QBoR/RT+XdBMZF7cU3rL1buV12O7OjWr+0Fh8g==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 57I0mrbX3080690; Mon, 18 Aug 2025 09:48:54 +0900
X-Iguazu-Qid: 2yAbj3N9cqU4MAMRtO
X-Iguazu-QSIG: v=2; s=0; t=1755478103; q=2yAbj3N9cqU4MAMRtO; m=r47ybSUVRJtJv5hM2BJROIVnhCtUKUdGR8NMfn6bMLE=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1803) id 57I0mGvx1202774
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 09:48:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnnuxizrIIv5dnzlisoY4J8w3jce3X79DsmGDMrwouRaHXJ/pZ8m9CQo7fssM9PrcZaVD2Q3Q7p8S+oqL9MNBzXXJuWiVPJIvX0IqnrS92baVdYba9BZhn6/0S0868Tzf0SYXtHllRkkdj9gzSPg9803GFN9OSFhCgCEUuTD2jqvSzYSCXtEroW129yri6JilIJY/LPEtzXn7M9bVJ5HiMALVGoSff/zdf1t/QJW0yNZhKDRyjklh6v7t7cWnHA0dToXcQefrfGZeDhXelvGIwqR39GVPHp8jWVbUCUMg2g/yGqgW/Op7whHzOVDryUPxU/9bAd6u1ed8bXst1hPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJ5saMxYroPXmCdJgJ8gydfKe/Gr3Nhtu4+meZnknnk=;
 b=Z1Pg51MZFKzB9lkee5rbJ1me8/iiTxph21NhOxTqb5nyinr3d9Bczpn7bMqAt03zTWBQ5kSMGw/7dKI+2rUtaRptehW3Xz6Y+tgUk9cA7aqZPJgnnsT3X3B4CEu3SUouXQqaQhzMsmh9OjuHy/kjV/fJTVvWP8Bc6Wiq53kUjRQ9qTNKCnMKJBJafVEdpcnql6VcG1w7Qsu8+T2xvCn2epRz68Yw0gycloca7Hc+/XfQeUYjOAnOcjFAWY0zaJVxWAKv4Ml0sN0TewOzGbwTPN43K2F0+SUCszKYetJvax1RUcXD0ZLWnZMKmelx2asu3NvpLvPGyejtaqP6J9PyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <nobuhiro1.iwamatsu@toshiba.co.jp>
To: <bmasney@redhat.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <unicorn_wang@outlook.com>, <inochiama@gmail.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@tuxon.dev>, <paul@crapouillou.net>,
        <keguang.zhang@gmail.com>, <sugaya.taichi@socionext.com>,
        <orito.takao@socionext.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
        <festevam@gmail.com>, <ychuang3@nuvoton.com>, <schung@nuvoton.com>,
        <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
        <paul.walmsley@sifive.com>, <samuel.holland@sifive.com>,
        <dlan@gentoo.org>, <Steen.Hegelund@microchip.com>,
        <daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
        <orsonzhai@gmail.com>, <baolin.wang@linux.alibaba.com>,
        <zhang.lyra@gmail.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <michal.simek@amd.com>,
        <mripard@kernel.org>, <afaerber@suse.de>, <mani@kernel.org>,
        <sven@kernel.org>, <j@jannau.net>, <alyssa@rosenzweig.io>,
        <neal@gompa.dev>, <Eugeniy.Paltsev@synopsys.com>, <rjui@broadcom.com>,
        <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <jcmvbkbc@gmail.com>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>, <daniel@thingy.jp>,
        <romain.perier@gmail.com>, <andrew@lunn.ch>,
        <gregory.clement@bootlin.com>, <sebastian.hesselbarth@gmail.com>,
        <andersson@kernel.org>, <geert+renesas@glider.be>, <heiko@sntech.de>,
        <andrea.porta@suse.com>, <krzk@kernel.org>, <s.nawrocki@samsung.com>,
        <cw00.choi@samsung.com>, <alim.akhtar@samsung.com>,
        <qinjian@cqplus1.com>, <vireshk@kernel.org>, <ulf.hansson@linaro.org>,
        <luca.ceresoli@bootlin.com>, <alexander.helms.jy@renesas.com>,
        <linus.walleij@linaro.org>, <liviu.dudau@arm.com>,
        <lpieralisi@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <sophgo@lists.linux.dev>, <linux-mips@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
        <spacemit@lists.linux.dev>, <linux-stm32@st-md-mailman.stormreply.com>,
        <patches@opensource.cirrus.com>, <linux-actions@lists.infradead.org>,
        <asahi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <soc@lists.linux.dev>
Subject: RE: [PATCH 110/114] clk: visconti: pll: convert from round_rate() to
 determine_rate()
Thread-Topic: [PATCH 110/114] clk: visconti: pll: convert from round_rate() to
 determine_rate()
Thread-Index: AQHcCtNP/Kr8d+feX0isN0PWy9vzprRnnQow
Date: Mon, 18 Aug 2025 00:48:10 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB14818C45588C929ECBFD51F5A9231A@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-110-b3bf97b038dc@redhat.com>
In-Reply-To: 
 <20250811-clk-for-stephen-round-rate-v1-110-b3bf97b038dc@redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|TYCPR01MB10228:EE_
x-ms-office365-filtering-correlation-id: 58c16ff9-bc79-4938-cdbf-08ddddf0e7d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?c3QyQjhSTDFFRWtrL2tVVm0wK0Ria2lKd1RCVE1MbzZQOGdEenFyb3RrWE56?=
 =?utf-8?B?Q3hiTytCZm10ZFFhOFFrbENjYWVhZk12UWZIZk5nRE1zcW1vdjRseHBtbk1w?=
 =?utf-8?B?Rk5uelVld2JSL2F4bi9ldmp4U294MkJZaFE5THNCVGs3WmtWaVIwNnlpelpS?=
 =?utf-8?B?c05ablhlOHRyTlpKRmFkc1RrcHZONTh2dEFxdGNWN1ZCUW1uUjJmTTdKYjA0?=
 =?utf-8?B?S0MvVFpIMVp1NzIvRTE5ZUUzeGwxbmw0VUpndFpacVhrNmRjeTRRZHEwcjQz?=
 =?utf-8?B?WmtQOTcxVElNK2QxMDFDWXFpaEVEVU9tU1dhVFRzVmgvN0tnaS9ZTlA4VE5N?=
 =?utf-8?B?Wkc2eEJzRnhSR2I2OGpqbXVQdlF2ZkVOQTNWNTFTQVRyeHBTcngyaytOZkJz?=
 =?utf-8?B?R05ob0tHUC9kOWpRdkNPSCtQTVFNZi9XSHp4QTdNTFVIS0l2cW5BL1BPMWx1?=
 =?utf-8?B?QzdPb1pwbE0yWTRxQittNzY2bWNUNk1nNTJ3OGpqRjJqTmI4QWdvSDJaMTBS?=
 =?utf-8?B?cmlZZlJkTGowSVZSSk9zNmNmOExpaEhuV1NNdktRMGJLWTFRTzJnMEYyL0Z5?=
 =?utf-8?B?eWxGMkFJSXdPUzg3UHMrMk1KRGZtb2ZDK2xzV3pNTVFKc2xPdXljVFk2MFcx?=
 =?utf-8?B?OVFVTGFZZ1psdUJmNnNNV3BxL3JCSWMzeFZ1WStVbm04dXhKS3ZBMUh1TVU0?=
 =?utf-8?B?V2NsclZ3dDFBb294cVBmbXk1bDdFbmFXL3dZZStMNVpmcnNTZzJhbmx0eTAw?=
 =?utf-8?B?WHl0bkEzODNGVFBNOWNmV2tOeU5GS1Q2K29QRlR6NjZsVHB6bHNRSmZFb3Va?=
 =?utf-8?B?VlczOFdqUTZuYmZiUnVpNFFDazBBUE1iNHJ4bEcrRXlxd3c2dkN1NERhOHU3?=
 =?utf-8?B?U1BTTVhSRTVOeEF5emEvWEhkOXhaN01NakJnbkorc0g4YzBlNi9tK2V1bzY1?=
 =?utf-8?B?cEtjWXZrOStsMDh3K2xTRzhjdVdjVzNIOWd2ZEtSL25vOGxRc2w1Qkk4aUhF?=
 =?utf-8?B?STBrbGdCR0J3UE9LVGd3N2pSMS9tYW54Nnc1NElrZTlEeFRtc0FJQUUxaHBT?=
 =?utf-8?B?eHlUWm1BMlQ0OXZFcE9LRERQMEt1M0ZZMjhOQjhkZzRoa3M1SzdNb2FRUVZo?=
 =?utf-8?B?b1dqaEl3bCtDcWlDcEoyLzVFa3ExeGhzeS9UUWU1NDRNbVo5eHN1dlVYTVJm?=
 =?utf-8?B?YlJKWDVBZzZJMWRnam5nQkkwcDA1ZHVmUk5aZVVENHBLUHJ2cjdrcjZ0bDd3?=
 =?utf-8?B?VTlQQ0tML1N2RHZJMzdIUHdoQ1lnZ3lidklRSlgycFVobEQ2dmVoV2ZGaU13?=
 =?utf-8?B?K0JaNDBSZVNwTXZxZVdlQ0NFbkFvM29zUWRaQXBoa3VDdWNxMDJuSXRuakFI?=
 =?utf-8?B?a1JhczYyWUxhV2kvQTA5dW9JNHBwSFh2RVdtODNveHZsQ0RpOVhVQ3JLWG9P?=
 =?utf-8?B?YTFvaDdiZzE0VzhHb1prVnJuL3BoT28rT1FLUWFsWjdDckY1TE9BWjg0cGt4?=
 =?utf-8?B?a2hkSW5OeWZrYjQyT2xNQjJlTks2RllPdXJUNzR5blBHY0E4R3NSL1hSNFlu?=
 =?utf-8?B?SGllV2hUTEd1NnU3SHpmWnZ3RGoyU1VDUkE0UGtRMUhZNkoxTGM4MnM5SkFT?=
 =?utf-8?B?aHFkTHo2MHptSWR0MkNTOFpPUnNsVG1tYUpkcUNwT2pzYlByME8wMEExMFk1?=
 =?utf-8?B?azBZaldHemxsYU9QQTZXb09YYWM3WU11V0l3WGFDem1WTytCZUhUMUZOQUNR?=
 =?utf-8?B?QUZ5VFQvMlZybWtyMFovdWFpY28ydVBVWnFTUjZ0MnE2dVFpUG1ZQkR2dmYy?=
 =?utf-8?B?RTJhajdTWXkzS1ZONkxrTW9OM0dKM2pwajdMY1p6U3pOcHVnaW1od1ZSbXAx?=
 =?utf-8?B?ZnRlZ3Q4YUVMTS96bVlPM1hvSEt6TjJNSHYrMVdibnJCTDNySHNKdlNNOGYx?=
 =?utf-8?B?cGZKWW9XM0Q5MzRjdThlY0JRR3R1eE55NTBQQ0tuRG85WmhoTXhFL1E3OSt4?=
 =?utf-8?Q?Meyl6GHfnZo2OLhryT+cVNUtVKj+vY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L0ZPdG50c24rK2pDcTJ3OVZzYXluUFpaaXBZbmxBOWtsN1JzRzYrVXZJQzFq?=
 =?utf-8?B?NTJ3cG8rR2p5R3hJZ0pSYlgvaVlkZ2ZIZXVrellyQmhVT2NQdzJDbXVUdXVG?=
 =?utf-8?B?amNScXNQU2J3N0Vjbzk0YitiMERpSjZ3MWFRdFBrZ1R6cG1mOFBsVUtNSXd5?=
 =?utf-8?B?bklOVldUTERvc1pZNHlIdDZ0UERLTkhuTk9Bamo1VkZPWlRvV083NitsSjBp?=
 =?utf-8?B?Y0NUU0FXK0dwclJSSXd6Mkh0YUh5NHBQQXBxTmNlTk94SGlsNGZsY3Y2dkZ6?=
 =?utf-8?B?SkQ4ZXZxVGVGdGRVZTExNXpGU0t6aUloZXNkVEJyRUhuOUhESWRpZllLVHRB?=
 =?utf-8?B?ZnZoRSsySXZOQVdNYXNSTUpOa0d6WU9NZUxmc002OXFRRmQ5em9vUzVPQ3Bz?=
 =?utf-8?B?WnVCUUVCQ2dHbXAzWVNkcmFvamRObTlkdEdjWTRPRWVzRE42VERPYWU3cExO?=
 =?utf-8?B?MVU0MDZuV1pwUnZlYlFaTm9NaU5xM0c5N0x3cEc3azZrZVhTcExPOGpFcDFw?=
 =?utf-8?B?MzJUamdudElUT0ZMQ3liamxpbjdBc1BmZEhmRXlURjhVaUJPd0FhR1cxbEZK?=
 =?utf-8?B?NS84R2t6b1V0SDB4VDdEZzR4SHhKanlMTXc2bTY3ZHZVakV1UXVYMGtHNmNr?=
 =?utf-8?B?NHM4Z29mcjhBZHlDNVVOcm1vUm5UZHdMS1lmc1krTXQzblMvWUJvdDZXcUE3?=
 =?utf-8?B?aVZza29ESEY0QjhQN3dzeC9ib2pGR2dIZy91R1dkc3RKM2RtNDFlVjZZVGtx?=
 =?utf-8?B?YnVoeW4yVlB3dzhkeHhXcnZ4N0tlalNCRWpwWDRsa05rQ3ZuNHhickJCOHNn?=
 =?utf-8?B?WldtcnBZMHhCY080RmNtSlh2NFVLVGlYZlZXM1R6SGNOMWpEMnU2azdKYXk0?=
 =?utf-8?B?MHRMZEJGVTNXNXBVcXZYak81aURMcGJ2VkVITHNRVzVJS1d3SXoyUXhGdXha?=
 =?utf-8?B?MXFvNXl5bUg1aHhNWEI5T3NRK2dodE1Edy9DSFdOa2ZCNUJQN2hSRzVmSUQ5?=
 =?utf-8?B?TlpacWxBQmtuL0FlZG01V21VNndwTnMrQmdQWmpra0lDZFpRbGpZcFFQQkVW?=
 =?utf-8?B?NDNXOFZKV0tsSndCdThCUjltNGp0M2VuRkp6VEkrc1BOeWVSOUNKRWtnY1R4?=
 =?utf-8?B?V1FHVWkvVmt6d0R0d0l2UmkrQ2RRQnFpbyszREtiNzk2Skt5RFNYYzhmcVVy?=
 =?utf-8?B?SHMvY25hS01EUnpQaGtqSlYxQUplcWtaS1grcUxCUEE3M21XMzRMQ2lVK2M1?=
 =?utf-8?B?M3hUOGo4dWRKbTNzbE4rRG9qdXl0OHlsanlDYlNhb2w3cHJWSERYRmJJTUdW?=
 =?utf-8?B?ZjJEVWxRclJlRUhIK2xyRkpYbWJ2R0w1TmVRZWtaeGJQYUJWN2VhdEcrTDJC?=
 =?utf-8?B?QkhESG1jK1FJamhkM0RlVGN5MURSVnFSeXpSaG9vbm9qUzBDREZOK2hqdUR3?=
 =?utf-8?B?UDlmVStDWFRBbjhBTUxnQU1UVi9MQXI3K044YTRXMDJqem5mYW1mZU9hRVg0?=
 =?utf-8?B?NHpaWjh6U2tZbEZYTHJTUTVUUGpjZnNNOXd2V2lKdWRDNDBNekxnMFhkcjJi?=
 =?utf-8?B?Z2hyalh0d0dYY2w1UnAyQ0d2VlpnU3EvekxmVG1tcTR2TWZiUXRFWjhFekxm?=
 =?utf-8?B?eXpaOGUvajR0UG5QaEhQdFRPVnVuemlxcnAyKzFRblp6cTBlRnBLaHBhdHI0?=
 =?utf-8?B?TTJqS2RMaHBMM2FpMEFYc0VwaEJ2dGlsMEZqbkg3VUxGRnV3ZzQwNHB1VlFU?=
 =?utf-8?B?NFJQZ0ltUTAzdExsZHVBaC9KbE5iWGpkaTJORWxWd3lSUDF4US9HY3hvc0M5?=
 =?utf-8?B?OVBTem5Nb1VrMU5iMCs1TjNNUmRlaDd0dENlaG9yK0xxY1NxR0wxY1lnRXdn?=
 =?utf-8?B?RndSakVMK2NkOE1sVjFXOGpkQnl0NG96VEU0UlVQcFo4UW82TVBTbTZaRVZF?=
 =?utf-8?B?Tkt4WUs3VEpPRG5uQ1ZoTGdXc1JndGRRczRaY3pySGFVT3YzZnQ4TnhHRGZh?=
 =?utf-8?B?azBXS2k1L3F3WTNIbEhtRGNXanVFQ1hiVnNjRmZIeWJIRkxYMHkvT1hDNk1x?=
 =?utf-8?B?bkRUaFpMTU1oK1JQUmFVR0ZFL2FnT2tKcFYzeVd5M3ZDWXlJUWxNUTVjOXFl?=
 =?utf-8?B?Z3o3ZktTeWlBNDZIaHB0WFI5T0J2b25nT3RjeDMycFp1M0ozMEJsd2duV2Iv?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c16ff9-bc79-4938-cdbf-08ddddf0e7d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 00:48:10.7276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydr84mLLyO3KO1Lz06wzghS/ObD1xDrYxqdqElagoJdLcBUdI6xvATwWNSEe395ehTf9n3yhc3scYEe3gh6BZpwiqHrfMvvHxZKvXPszruQGd+n+Mfad/wHGsAn182qW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10228

PiBTdWJqZWN0OiBbUEFUQ0ggMTEwLzExNF0gY2xrOiB2aXNjb250aTogcGxsOiBjb252ZXJ0IGZy
b20gcm91bmRfcmF0ZSgpIHRvDQo+IGRldGVybWluZV9yYXRlKCkNCj4gDQo+IEZyb206IEJyaWFu
IE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPg0KPiANCj4gVGhlIHJvdW5kX3JhdGUoKSBjbGsg
b3BzIGlzIGRlcHJlY2F0ZWQsIHNvIG1pZ3JhdGUgdGhpcyBkcml2ZXIgZnJvbQ0KPiByb3VuZF9y
YXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1c2luZyB0aGUgQ29jY2luZWxsZSBzZW1hbnRpYyBw
YXRjaCBvbiB0aGUNCj4gY292ZXIgbGV0dGVyIG9mIHRoaXMgc2VyaWVzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5
OiBOb2J1aGlybyBJd2FtYXRzdSA8bm9idWhpcm8xLml3YW1hdHN1QHRvc2hpYmEuY28uanA+DQoN
Cj4gLS0tDQo+ICBkcml2ZXJzL2Nsay92aXNjb250aS9wbGwuYyB8IDE3ICsrKysrKysrKysrLS0t
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay92aXNjb250aS9wbGwuYyBiL2RyaXZlcnMv
Y2xrL3Zpc2NvbnRpL3BsbC5jIGluZGV4DQo+IDhjYTFiYWQ2MTg2NDIwNDAyN2I3YWZmOTAyMGYx
Y2I5ZTdkMTk4ZDMuLjY4MTcyMWQ4NTAzMjAzZGU5YWM0OWFjMzINCj4gMDdlMTIxYmI1YmYyMTYz
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2Nsay92aXNjb250aS9wbGwuYw0KPiArKysgYi9kcml2
ZXJzL2Nsay92aXNjb250aS9wbGwuYw0KPiBAQCAtMTAwLDggKzEwMCw4IEBAIHN0YXRpYyB1bnNp
Z25lZCBsb25nDQo+IHZpc2NvbnRpX2dldF9wbGxfcmF0ZV9mcm9tX2RhdGEoc3RydWN0IHZpc2Nv
bnRpX3BsbCAqcGxsLA0KPiAgCXJldHVybiByYXRlX3RhYmxlWzBdLnJhdGU7DQo+ICB9DQo+IA0K
PiAtc3RhdGljIGxvbmcgdmlzY29udGlfcGxsX3JvdW5kX3JhdGUoc3RydWN0IGNsa19odyAqaHcs
DQo+IC0JCQkJICAgIHVuc2lnbmVkIGxvbmcgcmF0ZSwgdW5zaWduZWQgbG9uZyAqcHJhdGUpDQo+
ICtzdGF0aWMgaW50IHZpc2NvbnRpX3BsbF9kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpo
dywNCj4gKwkJCQkgICAgICAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkNCj4gIHsNCj4g
IAlzdHJ1Y3QgdmlzY29udGlfcGxsICpwbGwgPSB0b192aXNjb250aV9wbGwoaHcpOw0KPiAgCWNv
bnN0IHN0cnVjdCB2aXNjb250aV9wbGxfcmF0ZV90YWJsZSAqcmF0ZV90YWJsZSA9IHBsbC0+cmF0
ZV90YWJsZTsgQEANCj4gLTEwOSwxMSArMTA5LDE2IEBAIHN0YXRpYyBsb25nIHZpc2NvbnRpX3Bs
bF9yb3VuZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LA0KPiANCj4gIAkvKiBBc3N1bWluZyByYXRl
X3RhYmxlIGlzIGluIGRlc2NlbmRpbmcgb3JkZXIgKi8NCj4gIAlmb3IgKGkgPSAwOyBpIDwgcGxs
LT5yYXRlX2NvdW50OyBpKyspDQo+IC0JCWlmIChyYXRlID49IHJhdGVfdGFibGVbaV0ucmF0ZSkN
Cj4gLQkJCXJldHVybiByYXRlX3RhYmxlW2ldLnJhdGU7DQo+ICsJCWlmIChyZXEtPnJhdGUgPj0g
cmF0ZV90YWJsZVtpXS5yYXRlKSB7DQo+ICsJCQlyZXEtPnJhdGUgPSByYXRlX3RhYmxlW2ldLnJh
dGU7DQo+ICsNCj4gKwkJCXJldHVybiAwOw0KPiArCQl9DQo+IA0KPiAgCS8qIHJldHVybiBtaW5p
bXVtIHN1cHBvcnRlZCB2YWx1ZSAqLw0KPiAtCXJldHVybiByYXRlX3RhYmxlW2kgLSAxXS5yYXRl
Ow0KPiArCXJlcS0+cmF0ZSA9IHJhdGVfdGFibGVbaSAtIDFdLnJhdGU7DQo+ICsNCj4gKwlyZXR1
cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyB2aXNjb250aV9wbGxfcmVj
YWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsIEBAIC0yMzIsNw0KPiArMjM3LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBjbGtfb3BzIHZpc2NvbnRpX3BsbF9vcHMgPSB7DQo+ICAJLmVuYWJsZSA9
IHZpc2NvbnRpX3BsbF9lbmFibGUsDQo+ICAJLmRpc2FibGUgPSB2aXNjb250aV9wbGxfZGlzYWJs
ZSwNCj4gIAkuaXNfZW5hYmxlZCA9IHZpc2NvbnRpX3BsbF9pc19lbmFibGVkLA0KPiAtCS5yb3Vu
ZF9yYXRlID0gdmlzY29udGlfcGxsX3JvdW5kX3JhdGUsDQo+ICsJLmRldGVybWluZV9yYXRlID0g
dmlzY29udGlfcGxsX2RldGVybWluZV9yYXRlLA0KPiAgCS5yZWNhbGNfcmF0ZSA9IHZpc2NvbnRp
X3BsbF9yZWNhbGNfcmF0ZSwNCj4gIAkuc2V0X3JhdGUgPSB2aXNjb250aV9wbGxfc2V0X3JhdGUs
DQo+ICB9Ow0KPiANCj4gLS0NCj4gMi41MC4xDQoNCg0KQmVzdCByZWdhcmRzLA0KICBOb2J1aGly
bw0K


