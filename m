Return-Path: <linux-mips+bounces-4992-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316995AC1B
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 05:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 156BD1F2275D
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 03:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6781E23759;
	Thu, 22 Aug 2024 03:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="beo/RBYV"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2057.outbound.protection.outlook.com [40.107.215.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A828823749;
	Thu, 22 Aug 2024 03:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298039; cv=fail; b=qFI1Q8o2k/ScaqIP2Sbtd8wyiEiqEYnz3rYurmVJr8YyRzv4BF9b9FmA31gPIuw4U+3OFvWDBIg0WGKNQp7s5ceAUCDVeqos9Yh/E7FpxRPtIFa+bPcLDMLEHjSpFiamSlOMjkSMpMv7xhXuPQnTnKk1RRqyY5Guk79rgX1XGJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298039; c=relaxed/simple;
	bh=zZqsXUcl0WK755Ko7tYveCaYU+XpctN6MRTpHIyq0zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tV84x95I+vg0p7SEXeOxkFi4PC7PTPXYxs0jJg+o3z1XVR2rk1Q7huHKE32FTePma1Ab/+U7ZZy75gJhFJY3LsMe2pvtWuYM+v754ekAtVo8kbMH21Pjp7epWlkK5cUOwnEWA7aQPGPUL8+5T77m9s7PlvgqRfdg8+bpuO0dnnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=beo/RBYV; arc=fail smtp.client-ip=40.107.215.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPtHFRAwr39B5oZgDtRPo06eilLVw4SX7d/atzwo9WyWyW9IqESuK5dIvfy/LsX4okhbGHN6+YZgJkG4z6F1hacQJSDiUnYMfDXnh2A8v5tQF9YGv+/egXCwUemnPcaX7Ri5Wh7mCUAJ4ieRpssoN+a2CVHCeNGYcw/brTULkfzaGAN0y/ScOgdNsgO2jncvVsgHJK12rM1z5CyGzPXuDFvJPOZA9RYuBF2fnh8EmZO6ZwJLtBpz9oc7kjj4luXciMHIVgSMtQmQUe930L2bkUyd3ykN08Lph7rQq8RHNlD5CgP4J3i1HEPjs7wtKGeIacq93d8SAlVrW3NaJVFVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFZLkl2G+2rwqoEAfBe7yjbpU8Ts4HtAr8hXYv56EuE=;
 b=L17sVS9Evg95XbDmb/EONaNFucXCWcHc+tJ+r8S+fePleefLHQSfhIZ95JpOHDgfFdW4s6YnJfpDMQLEcEwi1N72ezts2T5ai9LFPS9mSib63PDvWGFtLamancMIyCInL0YADNLkazaVxSA4mbl9D1UJgnVUweQHOLHjgM4FadOy9ReITuIcKljUYh87RVkeaLXhXt4nnWyw6uU+cZiYI2oThaQstMeo3kMYuQyHmtno0AWMOKcUpww7eydR+axeYQancuR2yTz6PnB80QfJe2AnjxInJAsDB5DsqcSaQvqq9GUuIBDTKGX2QOKwwSKmDLaTVi4IIuEdlbfoOrnB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFZLkl2G+2rwqoEAfBe7yjbpU8Ts4HtAr8hXYv56EuE=;
 b=beo/RBYVkh4WPIXTw9HpBdLP1A9vl0CzyfHwrae7sXk+b/v5PX9QZ7qwanO6ByLDBZVQi7uVcBQcBxQeqgpVwYkfrwnRNKXGCLuapwH6KXucQ1A78HYLnI4qxD7Wqx2BzkduTOtGpl0aaWr7wzlJWE5uNG2hOqvqiyu13Yu+hXGFVZ6Xhf/dwqG58syvOS/XqBdc90oh2MQGyjNHO34iT30t6+zEp44HQFK1Ai5pOW0nohp9iSIkIs1Sm19zz2nyOfo5P2e3dpbcuKQp3jAAbM7V16eQwuVlevHPgKG84sEoBCt7c7B4sYe5MjoB/Nbgu9DMgK6zF5MZMr2o7tcWDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by TYZPR06MB6565.apcprd06.prod.outlook.com (2603:1096:400:452::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 03:40:32 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:40:32 +0000
From: Lei Liu <liulei.rjpt@vivo.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lei Liu <liulei.rjpt@vivo.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: opensource.kernel@vivo.com
Subject: [PATCH 3/8] tty: 8250_uniphier: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:39:07 +0800
Message-Id: <20240822033924.32397-4-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822033924.32397-1-liulei.rjpt@vivo.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::24) To PUZPR06MB5620.apcprd06.prod.outlook.com
 (2603:1096:301:ee::9)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|TYZPR06MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea68a87-5e89-4b5c-e9d8-08dcc25c2cc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oZcpsSCMLrNPa4++5BH7nnGidGDjds3r1LeQwSgMxjxfYSEwDfdKUNWMZeDY?=
 =?us-ascii?Q?FdD1uDgGSz8DTq1Ylpf99wOA49JV14qlNTwjZ08QvAVNcua8Eknr2u5ZEsrw?=
 =?us-ascii?Q?mGB0UQlDoVPO2WwLphNJDyY7MioZbSlwDPHS3gI1fTvE0y/eWOmeXouumZki?=
 =?us-ascii?Q?V5hPJspbpX7eoIKigvE1/d2t2fni+fc2sOTu2xkjllUEfpArHpZTTsVJgF3u?=
 =?us-ascii?Q?GMasXWr3qni4wwqoGYZ8NTQ0GEBB2ir8Fa59uBEzu7qwgVxIfC80wYI5adbb?=
 =?us-ascii?Q?VU/16npcVrhI7ZaWt6w+RjyF7VP4G+ozfiTASLno5Qg5ewOyyEQGMR+jnFqf?=
 =?us-ascii?Q?b+DxB9op2uPws9UQI/4+Dh2Zvbmd7ND1SyRXJNI+17B/odCbh9zSDWHmwP+t?=
 =?us-ascii?Q?a2nYZWjX1+SayKaZZgIEZRlPlkes5o5lad//AsNXpCxv5xTqzcQXGkEI0D2d?=
 =?us-ascii?Q?s2F56iJiJ1g9dLM9TvoZPNBN3Ahul6TZ4jAhV1dUUR/ltiXrTUhtTQgdGsh1?=
 =?us-ascii?Q?VkKGUjZfdz/PaLeEALqMjHGOtnfPeQVpPlFoJaJbohbz9294URRBH8LDOSnj?=
 =?us-ascii?Q?16W5Clpyt/Fe7ED9wIF1UBvkDDS1x76CqeMdQR6sgzmwa7vgVUL4ZRshXRxp?=
 =?us-ascii?Q?6elPkhrbvq0wekRjD2EP/+jHzuRWp8W3yQ5QGQWiYal7xdCoqnwh4VFJZElJ?=
 =?us-ascii?Q?gUVO9d++kHRpALMaJ9HZqN7Ew3RUAJN3hpnUAKtHjNzJ6Ehqqv9NRYJBqKam?=
 =?us-ascii?Q?S8NIutKACq3y0WtXSkAmXIR5Y5aLplqMccdX0WTaSSFqNXWIBGKiKKAoS8v4?=
 =?us-ascii?Q?ZaPL5pa+SGzMiq88l0KmY18aPZL5VFil2ai/WUFvA0b9EKBRapbdg0Za6Gyr?=
 =?us-ascii?Q?YKzEzDSWbB1Gd1KRPbxlu7f0Y4A54l0zeRUGE55gMcI5OmECxByjC2FC1FM/?=
 =?us-ascii?Q?zTntgQ3qr1b75zy+h6gyzy10PynmL2CiakczaAj8TktS2zefn/+of+HUCjl/?=
 =?us-ascii?Q?vKd+1Pgo6+Crx6Y/xKWxxkE1cD/jqEZmSu05xkyeYJxDbUbv5vLVKjZ1a/w0?=
 =?us-ascii?Q?pw4F8JnY182x3+C2A48RwuND74jkaXyOaqkSVIeEnF8XqmLiqk9X9XrjgNgy?=
 =?us-ascii?Q?N2hAC1ZBMOLwJwVkFomb51aJs/vtlDiKfvP49HC7diQHe2GMMLL0XkV/x29J?=
 =?us-ascii?Q?rFmLjQS1br2aEs+jqTT/ex5NNeaajR4I1UcH2ctczWuxjzTzbvsRwVXwlBw9?=
 =?us-ascii?Q?QCYJQgVa0DjM8PLHsHXACQmwptJfkrmooLX4RkGxGcQf8QlVwkoj/vCnMxeL?=
 =?us-ascii?Q?7VWddqy8YI59Wr2MbfjpX7mIKiKkul3vAuHg+QIuChnSVGL44IIjj4mpvaiz?=
 =?us-ascii?Q?tSFb/AeeUSSYh6yR12DWMrfKku4Am72LCnXtGps6XiPpZO/7NXpjfYYNXIH1?=
 =?us-ascii?Q?YPFs3fqWqXw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IzKN/3b7svSe+PpxFcK6vkTTSiYXpLYwwhazNd0e6qfAt5faJEKR7C/7AeHz?=
 =?us-ascii?Q?+4AYOdhcWWOk/bBo67aNny56XU2ssbXbVdL9LWxqqwcYezRwnjWH9P//9Lx5?=
 =?us-ascii?Q?+RJfEH3E+ZG3haFQuzCOzZCMhDS5naZSVVIl9jGYz/DQpW5fltbZvSkDZYpr?=
 =?us-ascii?Q?yQFtv0uca2G5uABFIAj5POSkJiTzHUTThgYLp/fVaETaBm//OfnIqiyMQLS4?=
 =?us-ascii?Q?J6PKt7YL+y84LpEaH3U6WZniA5eXKCZJafJLq6KKBVMq8YMGVuaoyuqIHYbQ?=
 =?us-ascii?Q?3ggdmGxJb1fysi6o6Aki5vTsG5NTFQ8R5j4BHA5Cr33+L/0oLrk2d4NxnS6m?=
 =?us-ascii?Q?0aAKsIrTLdF/FR1YGA4lKMRfHAE5Te6AchHv9XN7N6rkClSm/9JaP8Wt3aJD?=
 =?us-ascii?Q?6MqMrGoVCpKGDfsMyjJ0iNmuu8UlIWNvTEvTXHPuYepxZ5tUaQgPQW+w/A1k?=
 =?us-ascii?Q?IVcNILqM1GKEVa7KxZ3IVyI258gj/ncpHRy7hnDMgu10f4Jwe7KJx/9vmd5G?=
 =?us-ascii?Q?V7mBxSRqfHKWEsNttNrDvUVctJXPxONeGKbRcsBIKIcRXNB91SoSApOyRBfY?=
 =?us-ascii?Q?cQvuJg1W9dCkUtFduyjEJ6hSiMaTF7mt86fv1pG9LDaoEM7FAJqVnyphW5m1?=
 =?us-ascii?Q?ZVTmEbVEP8uh+V7OZpasPydCLF9nzwHIwB0MLDrxd0S27LO4QfzPCovr1wfi?=
 =?us-ascii?Q?GtmhV0Jj+EPb68RDNXAhmm/vKcaIGiH6fC9uaGfCUWwWMBhF3fFaN/8GqAGI?=
 =?us-ascii?Q?ZxNvhjbSgV6ATRFkjLlLz/7mTDwdVvfUB36NY0DM+i/4i68a8p1rHsXrggpU?=
 =?us-ascii?Q?56UyP5CJsHnA7YLUs4e6Cud2/W+ICr20M6V3fQCiGWC5Y4ascAtqidZYJfpJ?=
 =?us-ascii?Q?YV9YrSwMpXiu3H6eTPXfGLNOOEdUgEraXEZMkaNYDcT1ByViw0t+FC7XsSn8?=
 =?us-ascii?Q?7jAl6Kj78xZiyS3Red7SkjM14czCN7PBX9TDQcnAFl//ttU/grCIYQAHI1JW?=
 =?us-ascii?Q?/aR4wao+6vmfUVDscHJjcuXHhN0rn7VReQf3funmvAQBGWHdPbb2DpiFhz+h?=
 =?us-ascii?Q?WRQBmTkwQosBOg0o765mYbQ382P3B+sQSogmXOF2Dr1Vbdb7baVTahJrxLrr?=
 =?us-ascii?Q?dsvCadN6+bWbcQQ2Mf6smff6lrZGD+OKn3ofEcEYRbIKasicRL2g0Za/n0xk?=
 =?us-ascii?Q?EGVSzJ+lICJ4u0ExPkVb1R9TCb4LkQTnro4OEMaFvsnpJjbvYiKSTlRizAjn?=
 =?us-ascii?Q?K5hThN/sp+JWBx5g9ED4043voq3TCVBSbLVf0d1GDNQYnOOGgEByiZX/kZzz?=
 =?us-ascii?Q?17Jj5m4Qburq5WuixNHrTf3BXvsuuWCc7rTwuLru2r4FkgpA35dWNcHvr/p6?=
 =?us-ascii?Q?etjpdZsDdu5CvQMeSwUZbE7lBtg8C1V+vjEck8SglH/5C8nmGr2A0lxfuD5C?=
 =?us-ascii?Q?ZMqcsYbYhkQ5DGLkwS3P6c3FT1sBvR0CrXQ4cNGaDw0008Rfok0gpbhwyvOC?=
 =?us-ascii?Q?MVX41cuGvPS7h5etQGtPfQVFnvkjfCKY7n3mPsVwoPjhRWjpiLjSZGdTrshk?=
 =?us-ascii?Q?vllSc7Nl+MlQoELBmU9rlev2BuPBp0G8VFgVs9Al?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea68a87-5e89-4b5c-e9d8-08dcc25c2cc7
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:40:32.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FcgWWaN4vCk6CEBlJBtTRwuBf38YcctL1rS2aaxTsRm6dglKTBbZR/FnFUynH1kG+b5DIFCU0e0rllYqgWsmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6565

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/8250/8250_uniphier.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_uniphier.c b/drivers/tty/serial/8250/8250_uniphier.c
index 670d2ca0f757..6ddc4262d22b 100644
--- a/drivers/tty/serial/8250/8250_uniphier.c
+++ b/drivers/tty/serial/8250/8250_uniphier.c
@@ -180,16 +180,12 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 
 	memset(&up, 0, sizeof(up));
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "failed to get clock\n");
 		return PTR_ERR(priv->clk);
 	}
 
-	ret = clk_prepare_enable(priv->clk);
-	if (ret)
-		return ret;
-
 	up.port.uartclk = clk_get_rate(priv->clk);
 
 	spin_lock_init(&priv->atomic_write_lock);
@@ -222,7 +218,6 @@ static int uniphier_uart_probe(struct platform_device *pdev)
 	ret = serial8250_register_8250_port(&up);
 	if (ret < 0) {
 		dev_err(dev, "failed to register 8250 port\n");
-		clk_disable_unprepare(priv->clk);
 		return ret;
 	}
 	priv->line = ret;
@@ -237,7 +232,6 @@ static void uniphier_uart_remove(struct platform_device *pdev)
 	struct uniphier8250_priv *priv = platform_get_drvdata(pdev);
 
 	serial8250_unregister_port(priv->line);
-	clk_disable_unprepare(priv->clk);
 }
 
 static int __maybe_unused uniphier_uart_suspend(struct device *dev)
-- 
2.34.1


