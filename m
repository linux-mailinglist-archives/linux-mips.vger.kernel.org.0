Return-Path: <linux-mips+bounces-9542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE2DAEC407
	for <lists+linux-mips@lfdr.de>; Sat, 28 Jun 2025 04:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 825885627D1
	for <lists+linux-mips@lfdr.de>; Sat, 28 Jun 2025 02:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD7728682;
	Sat, 28 Jun 2025 02:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="eH9ZAGoL"
X-Original-To: linux-mips@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011032.outbound.protection.outlook.com [52.103.67.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E56D528;
	Sat, 28 Jun 2025 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751076086; cv=fail; b=bMXLgUMQA8X4qgNON6a3O+d3TvSk1K7CvHujiZElaPm3wt6AQ8iVD5BfYfPNS7Uu+8cSDJRpg3FuwtXoe4qIfErU/bnG7rIZqpiRFlPFQ+I4YrslyfkXCUK1g0WYRix0+wHi9Rw+GiskRYT7zLazsKFDSRYIu0H0q51jPG+N8+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751076086; c=relaxed/simple;
	bh=k0vzgu8J/TurOEv8Tf9RowVNWAC6mEm2HJZs/WFfKMk=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vyy5lZq/CQqn5SRPZkf56ZCsaf9J77TQqA+cknJxBniNCX99BHolMSlmcnMBRaE1PorqnWA/KGVDMKHImXdzDuanYSmJ7qwcDci2CL/dFKnsReKv5wyVx+3iEIYvZzS1J/dsSeqPUWt5SIHhCZJRvfPKId12yX/+0+4U9R5/0Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=eH9ZAGoL; arc=fail smtp.client-ip=52.103.67.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxUb4VwRrGzqDfXxOJEbM3jqULohWj1OlAcftstduR54Ihmr7BfT+EqxWDKPDMKM9trdDsi9hOITopkHKzoMCd3tE3h7rEQAbLP5/Sbkja8v5NHi3I3WzZnbiR1xMfjzHI1cXsLs7tIpto0PU7muGgrKVS8d3fWGysxvWLZLIOI2CRtle8Woqa2Oy4gNJbQhUIfQGUs5+VCV1Fw9rq0JZAZSoKpboATprEBC1GYUQY8t2pDorlVCznmC1mbIxWcZvBx63sgRsE/DK4khLs2EfTs+xDIMHEksGOrkjB9Iij+/rlqbaFhQOrm8YM5XRvdyz99Y4sLNrtvym3b5KFZwng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3licz5cdkhwN7Lqb0juHNktQx3TxlzD5z6y121xFF5E=;
 b=e2YzyOFPLxDtSJyzLfo/6p58vL8PUyFIZOdMldhqRcR6aZMgSGwqLmcnibjm4DNGDDLlyRwH8sI61z7kSFUIBgSJVGtsq1IJ6nUiIDJ/Jyaws5Kh/WCQ5VYYOFZyjg7lekL7mDnwlp6d9xamVuxaABeD4qE5zPM8SiFVIfOMFwiOUFT3t3Fh26vjykLrsuJuTKvIkar5ikdQDZu7jUOZOKDDEhbHWJpZ4XKsY3gbO+8gTEAURqnACKCebiysoSQfahxI12YQmJmxp5hmBJcxahdelbQSfVr6KpXQ9DIRKGrRiAmFwqt3zYDI7TxmoSOEvp6cktL2Gji4RdMXkkXVJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3licz5cdkhwN7Lqb0juHNktQx3TxlzD5z6y121xFF5E=;
 b=eH9ZAGoLBr56vnxnukLwpfWBHLbSwbR8SjwpVaHmlq62acsWRDtQPJM6NhE8kG5sYVtYEJP7B2/RRw9Mj9uSkXdb3gSkLzT8LKSSWndS82g/kujXphg2RYW/tu94dLxXSSDlkdmOzoEtYyYTSxdSO5xXwJFCVwW4IlWj+SOGdwhJK7YKAn7TCoySFHj8UrCvm1BX3l9qunpak4O2U1tSyrXWwu0Vp6C/B2HuvXOhSipYO036XccrHfqMQQuFwWSwgnw0R+wlwYds/gcQ1PZpOMNUirQRlmwdemySZ5BtTDKYJw1MtA+CUY41Dgjg4WtcD9mfY3Hwyspg5mTNP1ru2g==
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2aa::8)
 by PN2PR01MB10366.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Sat, 28 Jun
 2025 02:01:14 +0000
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c]) by PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c%7]) with mapi id 15.20.8835.018; Sat, 28 Jun 2025
 02:01:14 +0000
Message-ID:
 <PNYPR01MB111718F80F5AA85F2539976E2FE44A@PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 28 Jun 2025 10:01:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] irqchip/sg2042-msi: Switch to
 msi_create_parent_irq_domain()
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Antoine Tenart <atenart@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 Inochi Amaoto <inochiama@gmail.com>
References: <cover.1750860131.git.namcao@linutronix.de>
 <3e901db1a4c87678af053019774d95b73bfb9ef9.1750860131.git.namcao@linutronix.de>
Cc: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <3e901db1a4c87678af053019774d95b73bfb9ef9.1750860131.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2aa::8)
X-Microsoft-Original-Message-ID:
 <3015a9a7-0255-435a-b16a-703313c1faae@outlook.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PNYPR01MB11171:EE_|PN2PR01MB10366:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ad80ea-60eb-42e9-a3dd-08ddb5e7a96c
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6fTa61voF783UGRdbF+5BYT5vFKJfSzbLHVKsMP9gayYVyrkTixB6B9Fy+ueDGo8ao9GapCk3+U9D+pfJYPJkrGisGxGczKkQvmbL6P38if5K8+0ZnFf6KoI64A+471Li4qWMstg33oEdOYOuVInoDd71T1Tk1vdjUAMU1VEAKVlB4IIHxRUCIVNsZn9ep3HU2wlD2dktW619c4rAYSIyDsVGExcOvTSDdyXNZwpb2ST3FCIW9T4CiAQ5UN/BuVXXkSQ/y5gyVQEhLjPS3wVS+Jb1N3XtdUcdC5xKsD2gVZ2GQ6IeKMk/iy9wkhjbyFtwMr0qg99j45bXMT1zO3JT0J6D1rRZHmyA93+eRtsPBAD06Tkn2qSz59ivgO674oriE4+NNrQkAnrD2T3/5HzePuGzxxSLzyDva0vgFW5yoL/O1T8Yne0N9yhKnL1/9/1fI/ynx+GGZc1AGzws7PvXAHEG4CPqPB55crl9Lk4BtUgqQ9vPWNds5ykoRhdFlQEwSeMvwKTbWYtngCqXBL/f0KrM2U/hW/Rno2ES1PaNiMhLWTfBes0J9DDd8E7lpFg0NmFC+TkoJgKwEUvtlkcE35ngA2RdB69ple+Aa6GIHALJfrLudbx2eRLLji+uIgxU/+53xa5rW1KU8QrJ4Ad5nghn/JgVOXq+SzsyOIHSNzwO+QrntnUN1qIEfmYJF2CeGx5t39FUcj0Jbs1wfkPhBwDwiOJkyupm6Z4HH+kvjutwFFlT7uZ4p70EBwf2vYCjY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|461199028|7092599006|6090799003|8060799009|41001999006|15080799009|19110799006|40105399003|41105399003|52005399003|440099028|3412199025|19111999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFkyMFZCam05bHJZUHJFY2JwQjYrekNSc1VtVlJ0RTI1NGNibTg1WnIrVVEz?=
 =?utf-8?B?QXFxRXgrZTdVdVRqaUlLUFUvUDBZYWdQanNTMi92UGtESytQSnI0c3VmTUJ1?=
 =?utf-8?B?T2UzK3RBMmtLRUE0djhBUGNNemRuOWc4a0hSc3NGbzIxQStwY0xVVzVCaWdj?=
 =?utf-8?B?UEFRMkpuTlg3Y21kWDMxOWJLcDdvQjY0Y3lINHE2ZWkxeFl1L0RiVFN3VW1k?=
 =?utf-8?B?WXU2OVdSeVFrKzBhRHVrWTJzZFYwMWRibStMNThubVpEdzhvdE1TVndtcGFa?=
 =?utf-8?B?a0lhaHRXalFOejN3WHNQQWtkSDRRUVI2OTFuSEhkR242K3VQcThFRm0wM2Ni?=
 =?utf-8?B?MzF6MmZQVDlqc2tvK3JoQmtXQ0Vpc3R4M1V0bVlHT201U2gwaEV1Wm9VT1I2?=
 =?utf-8?B?YkNSL0xDa0lHaldMY2laVHlHYU9rMDJBSE90Q3g1WWUwNk5nVXc5dkVkTklv?=
 =?utf-8?B?YmpGRnd2a2Q5NmhnUUdZbDh6U0FMcnNJQW5kbkxTUHMrMldjcWpEVTJ4c2Va?=
 =?utf-8?B?bGR3RjN6ZzEySll2R0ZKTnl4UWJ5NkIxaW53L2U5MFdIckk1Uk5CZXRqWkow?=
 =?utf-8?B?YmI4V1ZCNGVTclNTMlAzZzRvVUFWMnhibTJTVkdHTmx4MzU2SWduUVVVK1Q2?=
 =?utf-8?B?L1BaRWVMczFoNDhtb1MzcnVKMVdOMmczRnhXWURoNCtoZDZsQXNta2tLNFo4?=
 =?utf-8?B?Mk54V2ZVTVNNbHFZcUVGMHdyWmp6VEw2c284SlNtY2tFZEdwOEt2bHY4eWVT?=
 =?utf-8?B?anM2cWxsZnh5SEIrYnhsejNLMjU0RzhGV2RpaWIrK0pYVXlXMkpQbHA3RDN2?=
 =?utf-8?B?Sktmdm5pQnltUDZUZHd6MHhxZVNqeG1sU2VtUUdqbmNvdFBiR2JMYWhsa1Iv?=
 =?utf-8?B?ZEtsOFI4M25NUVZiV05aaXZIU2xWcTlJMW5VTStEVWp5YlN6NDhoRUtaQ1Zr?=
 =?utf-8?B?Q3A1a3N3ZkczZmdTYi9wWDdyYTI5Nk1jM2FKWnNyYm9sUEczUi9HcHV4bWl4?=
 =?utf-8?B?RkV3L3pTcEpvN2NMdG9FVVhMSDZEZ3k3Z1o1RXJRYlBlUHQxKzlkS2pqUmd5?=
 =?utf-8?B?QktDMktoNVNkVHk5c21Sbis1aktFMjVPTlJ5QzdUWVdCUnZhbXRCU0VBU0hS?=
 =?utf-8?B?cy9NbkRDQVZ2SVYzNHY0Kzl4eUtOUmg0QzRRbjREVEFRWklDdC9mdjh1VVB5?=
 =?utf-8?B?NUVhV1BDZ3pHYW5QV3RMY3JZZldnMTUrQmZIOEtKZERFVDNWVjNWMzBteTR0?=
 =?utf-8?B?V2hpalFsMERQaytZY09XYUJkZ2xXNUNmWGVQU0JiRFNReHU5aFpyR0s1M0ZR?=
 =?utf-8?B?M0VMaE96ZmhwTSsrSXhWTE9scnBFZUhuZThZREV2YjlETU5jbEJVVEFVcE5k?=
 =?utf-8?B?YzQyZDhwQXFJL25zd2RxN0xaRTBweWtPSkRHSkdiMGRLQUJYd0M5RlZPdFYx?=
 =?utf-8?B?eW5JQnBTUHcyUnpUQWVHQTd3UzNLY0pXcTVLWWlnNEtkSVhVSTVDSkp4MzVy?=
 =?utf-8?B?aDhGOEFHeFNyZjRLUDRBQ0JCVEVxMEIwZzRPZFkxWUE3TW5Tdnp6cXNzNVRC?=
 =?utf-8?B?YVQwVDQzeWo3YWxGMTlqSWlXdXRQaytKRHlGT25lWlE5c0l1UTBDRXB1alUv?=
 =?utf-8?B?VDVCUVV4eFlpSEJtMXlFdlNlVlQzd3docUpJd0lGUndLVDc1bzl2b1VpY2N6?=
 =?utf-8?B?ZXJGTUZZRytTMmw5YlgrNmZXZlNoUGVTalh5VE0yelRYMlpYUUNtZ00xMWcx?=
 =?utf-8?Q?6NykjK130W3wp8Geig=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3l4ZEw1Y0ptVUc4cE9SYU9jdVk2blFQTmZrREV5cC9IREw2N3EzazRhTzE1?=
 =?utf-8?B?QWN0ckRNa0pNVGpxU1doL0FGTG15NmlsRThmd3JtbUZTSlN0cCtValBDTWNp?=
 =?utf-8?B?MkdaclQxZVBWQ0pCd25yOEJHYy9Lclh1UTVKd1RWR1dwWi9BWlFEQTNRMW9w?=
 =?utf-8?B?RTQvblRXVXRCM1o1TVhaaGtneG9ZM2lwVXhlK3g5cDZkbWRsbUhLWGFkUXZq?=
 =?utf-8?B?S0YrdjRBeStvZWZBeEVYQzhLVXFha0dhQnZQY3IzOEc1aDMrQWNlRFJSeHZW?=
 =?utf-8?B?V1EzTm1zNXZFNmtrdzMxZjlvOU9mYVEvNytJRjlKblJrWVJqYmtPMzhlenk0?=
 =?utf-8?B?KytXcVYwNVlZcUQvQWMxL29JeStkNkJIT3JMN1lndzI3Q1drUjRHTWd2ZWdP?=
 =?utf-8?B?TzhzcUVwWk9WbzVxZ0NWcE41bXlzenZ4WFFmVmtKQVk0QUFlTlpqSjV5Tzcr?=
 =?utf-8?B?dmlpOVJlMkhXcGJRZTV3djBmSFBkRzRmVEM0aEgvcnFZSUZIUytKTkczcTFP?=
 =?utf-8?B?MTVCT1UzRUl6bHc3QlN0bk85cEt6VVowZ0ZZT1E3RzBzaFFHWi9XY2ZhTjl3?=
 =?utf-8?B?b0JGSG5MLzBQWjVDRVdiMzlYQThZUEtRYk96OVM1UGF5cUN3aWpWSkc0b3Y5?=
 =?utf-8?B?c2U2TW9hMWpma3I5S1g1M05Gam8xMWdTbFFSVmVRaVJ3azVRWUoyQlVUM0lh?=
 =?utf-8?B?bitmWFQ4NUpYS3R1MEl2VVF3R0lndkc5SW5vREsxU1cvdFZQSmVqeUhNdVdM?=
 =?utf-8?B?cXZhN3hOcmpvaGkycXIxa2ZYblNnem43MjloNkFJb0h3NUZONmVWRnpOSVho?=
 =?utf-8?B?N3ZmYmxGcWJyZkw5ajd2TGdjTlorV2JDbDRIa0NRWU10NzJ6UzFsSFBaNzVs?=
 =?utf-8?B?VnVVa0NiMUtiU2R1WXN3WmRvMytwU2o3akJ3a1RwTVI4SEtOdzhjcXUxc3Mw?=
 =?utf-8?B?QWxxeklyTGJ1NFhieGlyNzZxdksxeVp5NXg3UUtqU0pWVlp6bEYzQjZHdndS?=
 =?utf-8?B?Q3NjdE1HdjYxc1ZnNFIwZld6eWVKWW12WmVWbllDSmdhRFB6UHZMd09FTEdU?=
 =?utf-8?B?d20yMUVCY2NDZXZZNnllYk96NUg3Y1V3ODY0YzdLQnFaRzVmN1lnWExNSlBB?=
 =?utf-8?B?TGpwNUJybHJFL2h0aWw0QXdvMUVqd3pjNDVSMUV4V1k5UHJCeHI5UTNQOGIw?=
 =?utf-8?B?OXhBVjVjVE1SNHNWQWp3bVJGYVRERHVwczhrSUJabFFPeS93bk1XUWF0Vk9m?=
 =?utf-8?B?T0dTMGxyQ1BtRyt6Rmg0T1A4a0tITUJzb2Z4eHlJSDNtYnB2aTRJUzRxendq?=
 =?utf-8?B?MU9uOGsvMkFTUWlrWnpQSHp5VG91MHRHbkwzK001aHExeDlNNktHZ1p5SEkx?=
 =?utf-8?B?MktydWIzWGJvQnpoZENDbm01dFhuak8vNDM0TnZGRHlSQmhvS0VXdUxieHpS?=
 =?utf-8?B?LzlKUkF4Y2RqL2JkVHErOHRVM3JKazlKVHNEOFR1VGlEcEdtK3FrNmgxMVpT?=
 =?utf-8?B?NWhmS3ExUlpEVWNiVHZnczRxdElmK1JSQUNYaVVGRFVtbkpaUjdORmhXU2gr?=
 =?utf-8?B?ZWo2WE51MDA5WSt5MElHVkpSNS9Gd1V0alVYZTZKVGJTN2xpSTByQlNINldV?=
 =?utf-8?B?LzgyOXBTcGFqeVoxbHBoQ2ZNZ01rWTZ5NkdCcjhvYTF2RThjVVhYTHdmZjBO?=
 =?utf-8?Q?NTimod5nXIf+Im8jUcaK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ad80ea-60eb-42e9-a3dd-08ddb5e7a96c
X-MS-Exchange-CrossTenant-AuthSource: PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 02:01:14.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB10366


On 2025/6/26 22:49, Nam Cao wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Switch to use the concise helper to create an MSI parent domain.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>


Adding Inochi and cc sophgo maillist

Hi, Inocho, can you please review the same and have a test with SG2044 
board?

Thanks.

Chen

> ---
>   drivers/irqchip/irq-sg2042-msi.c | 20 +++++++++-----------
>   1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index af16bc5a3c8b5..bcfddc51bc6a1 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -219,20 +219,18 @@ static const struct msi_parent_ops sg2044_msi_parent_ops = {
>   static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
>   				   struct irq_domain *plic_domain, struct device *dev)
>   {
> -	struct fwnode_handle *fwnode = dev_fwnode(dev);
> -	struct irq_domain *middle_domain;
> -
> -	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs, fwnode,
> -						    &sg204x_msi_middle_domain_ops, data);
> -	if (!middle_domain) {
> +	struct irq_domain_info info = {
> +		.ops		= &sg204x_msi_middle_domain_ops,
> +		.parent		= plic_domain,
> +		.size		= data->num_irqs,
> +		.fwnode		= dev_fwnode(dev),
> +		.host_data	= data,
> +	};
> +
> +	if (!msi_create_parent_irq_domain(&info, data->chip_info->parent_ops)) {
>   		pr_err("Failed to create the MSI middle domain\n");
>   		return -ENOMEM;
>   	}
> -
> -	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
> -
> -	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
> -	middle_domain->msi_parent_ops = data->chip_info->parent_ops;
>   	return 0;
>   }
>   

