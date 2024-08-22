Return-Path: <linux-mips+bounces-4993-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39095AC1F
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 05:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A05402887E0
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 03:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA91D23759;
	Thu, 22 Aug 2024 03:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="B/ZWYSg2"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2087.outbound.protection.outlook.com [40.107.215.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5303BB47;
	Thu, 22 Aug 2024 03:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724298053; cv=fail; b=oCJkiqOAB8mXwGUZeO8/lGenBzvku5H7GcFsntV4byfNlBcc2l7pUXrXJhFPrWvzqj8Fc2uzAKHIpng4b4n3RHaEs5uQCK4cRGXc492jBQ/bt4JsTudl84beD5LkbiUMl4EDwOon7SiDuIZhGyErK2U4GcCKTmAchge/pxLUn4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724298053; c=relaxed/simple;
	bh=TJ8P7fIVLltB+piqkcmiTiDn8qW4f9Z+LUiQ8Dt3xDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I2tUMWVcPRAXH81JktW/VUKp7gePJM3qvA3SnJ8f3471aYQc4zjGEhhBpFjA+C2EHIsJO9Zz0CoYKyB5bzLyUpac/No8Kmd5V0Rn4DPQ3I921SGgLEeRxW1gS9IJGSSiHWfsaCrZWyrOCkEiKKfxk7Rynr7Kb3G/FZi1COEcRUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=B/ZWYSg2; arc=fail smtp.client-ip=40.107.215.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DacGC7QqnLr2EmFCeu4Q+3ZUzw4QlgI5nwzsAEZF/rPoG56lSEsof+s/u5nBJ0xt6cPjhRK258WSZ9hfP6xCdiKETwg5o5qSMAVi78ACpfzjhXCFkEPYLbgdy6oaQEpDdWwp6QyVmri5OId3W8Q/aRZ7BYHvr84THJwAwrD81Nv4YCJgC6aqoHu9U0QKymxcivj2mEYqdTfrjG70mX0SQwvmk+zls5fvegldluj/Yiln3rRA5/Rpnw77djiygzZrXOvPuSHXkr4DFZGqHcI+d9ABDZyWNvDh3GnqYDNMNG0mxO031FijoozmNW3W2WgK14sJTYRaFBbpHig7fDl53g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGVFJ6j7VvGl76/0BQtiLrQS1eP9sDog5mlt9fbvc4A=;
 b=NUzM50E2wYO520ItDqj5MOQ7Iz3DgKhZ8CGZox72dGMDBg1caONX4gmArjzk4IV8lNKnGDvQ4HKhUoKRJlh3hXXZ1uXXn/Rhl++OOOF1PEesBJsLTcQYNZ2dpC+w8HlnFSrLmMPNhKhrvy17iI0pmxmwTpdIX4M7Nz9b4hNzp8sPRKjWMg208WvTnwja9fGE+ST2cg3Wo96fJobo2eRBqU+PllkbLhBhYhR4ou8prkxE9kAFvIhM5vLRT5mpD+bpNE9M3XCbatUqTc8FXNEVa/Fs5Yc3zqHN/B4p+/ZO/1k8aawW1Q5BsCx/V51JuHh1GkDDTq7lzJkXWUBEWbb49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGVFJ6j7VvGl76/0BQtiLrQS1eP9sDog5mlt9fbvc4A=;
 b=B/ZWYSg2NPOHlna/9LY07edUX5KBRvoYhNVt6IgV9FkYmgqZAx8FGpShreDiK1GzZxJN4E78Txow2hjuJe1wD6t9ox17IUuZHTl7NxAO7u0pIZXdYG/p2j6dLZRZEABk05JAztEJAAPx7qwXYmLXzQT3kYkPRwVXagESEb7eKwJ26H9hpL5oAvvAzs0wqsVvMvpohQd0ECAXmX4zwjTFqijT7+74PPcrLDRdiw7R/XWixL0ZL5DgX2BcxrnsEAJOCYa2UBcEC1hihaGeLSQcyW7jkFVRZlXt+Me03eSH3kWh1o5y1a7UuoU0kn4KonuXdivG5lC7Xq4hWuDfnEgXyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by TYZPR06MB6565.apcprd06.prod.outlook.com (2603:1096:400:452::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 03:40:49 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 03:40:49 +0000
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lei Liu <liulei.rjpt@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Lino Sanfilippo <l.sanfilippo@kunbus.com>,
	Erwan Le Ray <erwan.leray@foss.st.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: opensource.kernel@vivo.com
Subject: [PATCH 4/8] tty: atmel_serial: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 11:39:08 +0800
Message-Id: <20240822033924.32397-5-liulei.rjpt@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: b04d88e9-88cd-4564-98d5-08dcc25c368f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x1IovNe46QwJN8FA62+4TkYtTq+TzZMm/y7VKfZolO5l9Jq9l/2ivX+TKs/5?=
 =?us-ascii?Q?UsF3XkKnIGfANabSxdChbTTdfodiaROwO6jwujKvLToplkECT/L7FtxWgN0Z?=
 =?us-ascii?Q?0kThfBmOIbRrEWIY0df52kD0hcCMz/FB821oL84cioiYHaVWd6yyojZgArUP?=
 =?us-ascii?Q?WQ30IgYwLpR+A4hEI3unggIjRvZS+TbYBWB6qSQanlH7BrNSEgRhQQSVau+Z?=
 =?us-ascii?Q?EpLsHRRBko9lYJ8eMjSKTY2ur8C7nQlycq9rW0TVWAU9PKQWYXZc5AkTLGhR?=
 =?us-ascii?Q?0vM6jjtQK0EEcZXblAv+YanLk9MIrYRJ+Hry3RjLvTyMn8GkB1KDPtDGal11?=
 =?us-ascii?Q?2YuNhhm1Ueo8FtuMFuKJUMg1eJLaTEE3p9ElxtveQ4wbbDZFHK2f1fuHPWOR?=
 =?us-ascii?Q?oNEle0gXWgLZTKcslEr5us0QAThURFsOytdWwPmbiEkldnWgf824WRelSV1A?=
 =?us-ascii?Q?AmeoILjw/L3Fwt668at1LC/6+EgrHxiN/m/43eIEG8Hb8TihB14xqZcKrBjZ?=
 =?us-ascii?Q?Lp6XgPmN2ACVGDhW7/tcOvMZ0mR1+GrNG/sWzN4Y9P+jjys4/icFEe+Z1PIW?=
 =?us-ascii?Q?PMcLq60fZU4Q+fyA8iRFtlmGq8GLEztRUJgguazPJQWwNuSio+JQc3tzdqmk?=
 =?us-ascii?Q?ibx2wIIc1w4fzhhh5zaWY+m6vMMYf9GAIYj/AKqQonsP6aLaKdXmScw6jPJX?=
 =?us-ascii?Q?3YdESlY3Hv1ecvMo4yyLrYjlndVhhoW+WPUCgLtNRD2CZznPSlXuaoLkI6rP?=
 =?us-ascii?Q?o3pTkJbTGxxoZQHzu7eU4pnuv08wDM1HyowhEbGqD8WJqWk8j27V2lwqbBNq?=
 =?us-ascii?Q?hH0au2F62Kq6uPIjH9WDwwEv/bojpvHp8LBxZ//z3GqxnrJ4Rxu9wpYs/0Wf?=
 =?us-ascii?Q?N/asgCQbI6b/yxsxzg4Vltti30bJ0b4FjH5CO2e8SAfew2XW4Pmw8JJWorBq?=
 =?us-ascii?Q?RFYukyKVhtTzOkCmBJORjp9THpf4gDNBbcwMH3xvm0uXyTaK5m91WB/Tm+1t?=
 =?us-ascii?Q?ytz5pl8VX1oyqtGwJu9QyMqYmw00T8VYpSDVIa1XTzHN4jwfkX8P7jQLmwNa?=
 =?us-ascii?Q?uCV7xJ8tgRSrt1Vn7NsDBYO+kOcF1i9jP4KpjhbVT8XQg+3hwsFzTRh8rNcs?=
 =?us-ascii?Q?AhZMikXt66h87r7Wx7KRuPmazj1qMxjn2kA7HXi+F5eKZQNi5ThmcISYmJK7?=
 =?us-ascii?Q?1wYNu/UdEykP18fCij7CnUUng+5OKSyTnRRg23y8QaFxgqPF9VczFGycEZp5?=
 =?us-ascii?Q?o2GKZX27Qk2J+tZNr7DztxVS7hP34ch9ydz1hwOwwNi3LEou3pKSjOYnmsTd?=
 =?us-ascii?Q?+ZqSoF8pSW8Ix1tS+ZO1501/0McNngmvAccsu3jGBikUQ8TfNCjQVk+yRYx1?=
 =?us-ascii?Q?R76FGJXk9oDsv9sPTrzJysMIT31e0MwPJUU9tjuuUqiyO0ASmY3nNQZZsHUl?=
 =?us-ascii?Q?Qrrh2uZeXXk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nkLN/DgxAImADRtAP4TAn6JKf/liJsbq5Z8IHmqZvs7cEsjnuxHsQuMEzx+G?=
 =?us-ascii?Q?44ChA2JC9JsB4gng2MT0wqr2d+Hc9cSrNxyFeWoki77YxjyoQfeuwBRdvwlQ?=
 =?us-ascii?Q?GBPXDjhAtH3JLj+FLGagvnJNL/6ZLevSCjfKPHKXC2/sklwyBpUYq7w8rU1k?=
 =?us-ascii?Q?xQYtwf7IojH6c6FX/UxMv5Wu+FITJBeXinGDGzAZkqcMuqhROcothNymO/KY?=
 =?us-ascii?Q?GkR7I8OU+Ul5FudJ7AHoNrqccdkxHg0z/Kt3p71wWgPmvL15sFIHz1fvOcPG?=
 =?us-ascii?Q?HKDbRLn8MZyUSGKUKA7fr9Wf6Ii3gdI9jhInC/3gInQeK+qmLgbwT/BWhVJB?=
 =?us-ascii?Q?30UHb4SkbcWb1iqvavEyidCPVp+bwML6lLXXfMNjGicD/bFRYtRL2hU4FWRa?=
 =?us-ascii?Q?cqMAJ35U4yJk5v8FmN515pNGzN5R1wq9OJIflBxEk9Tx8NBopGqqjkBXlveP?=
 =?us-ascii?Q?7qriOF0woR44tv4sffvuK45HIR9X8IZQxtQkqYdndqVuutBW7NFDoPdnERCx?=
 =?us-ascii?Q?PXX4FSrB476dC/u7XzSvShoptrL4MU8KKWs1pMN/7o7RvQk46isfgx3Kw1yQ?=
 =?us-ascii?Q?XjyuQb6yaw1Zi8p+9OR32vwuF10+0wBw8/4oQb0kpPjXVl545GyzBw3Te+C1?=
 =?us-ascii?Q?OIW5SoKUSzaXMghSDPE45pBpdnh3cM1Fy4bDAQJTiqA+2EyUxa2oeqhGSCBQ?=
 =?us-ascii?Q?qnXad0iHsZ67Uoz1BOXjyotG6dvFzvtgeBZ1rAxLkFvez9mHMA2pX/KyVyFq?=
 =?us-ascii?Q?ZhHX0pYXGa8k8hLDQ7GVJW2rVAFZrjzZiHeS7+tXvGS22mGDcx3FYxQZQzvJ?=
 =?us-ascii?Q?LHnApsJTqqT8CsrpT9SnMc+n/gDtna1lPHlkKvOd5HZsZ3JFcbUb5S+KjSrs?=
 =?us-ascii?Q?slhdG8mCt+5EkBXYHumxIjnWgnjtJXsMBT9einDauinksgbnutBIQByJ8+FK?=
 =?us-ascii?Q?a9V0EO1HwDkqgWGu8hdFBEDo1PVViPHW6ehww3eg6Iad6fSbIQpFibciSMzF?=
 =?us-ascii?Q?4aJ4x9Us8nUjFKKyDthiItpq/aQMgbOIKNYRSugku5Lfhtj/NIbshYZ4UmuJ?=
 =?us-ascii?Q?vIWi52pwl1YLK/Fe16kG24e/CqewIO7c1wr/lSVhLuiZtglovl4F5e5Tji05?=
 =?us-ascii?Q?KVBG7CDy6ndvOV5WjKiCeYNjzY9wYrGYNJL3UaHeMQp1gk9ZcwDhcrx9SqAj?=
 =?us-ascii?Q?z/Wl34G9jBHUxWkD+mUqjwNfaKCVxci+oDT0QNItBvhdeOJvYYWtyA56g8hw?=
 =?us-ascii?Q?ZfJOI8vFVAThGD2yu/fr9bGd5rSDCwiHLHLT+keEBmfcfKqK+6ZV52+ctXdN?=
 =?us-ascii?Q?VC4sGowlxEbEpW2Hln8uhF+ifo7gT3xbJUbMrotlFTvy3/xDkxQkVnK+gVpL?=
 =?us-ascii?Q?TSF6iGoCnhBNkq3cxhWYEl6H9K25N71BSLuhyvzUtKtwFMz05P709XNsNM7p?=
 =?us-ascii?Q?HbyFSTDNUEDBhaAc4H4doaBSmaIacoPc3s7vuY1iKVkgZbAh77zEUW/7N5VB?=
 =?us-ascii?Q?xAKB+obZMRwaLAVvZXHDW7CJEBHB8+c7b0xP5N5Gg4WHCUXn0Qry0plRHjgY?=
 =?us-ascii?Q?63PWdGwSrdUdCiEAIkbt5NmMBpLGfUwwBsc/qefa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04d88e9-88cd-4564-98d5-08dcc25c368f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 03:40:48.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5takiTZWaj+4/DJu7CulBPrkuIgM8b48Xma3xK5tUfy7kYEHobF8VlUcPdJtY/ArNZ/VcLaxOQHIOMV7m+/oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6565

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/tty/serial/atmel_serial.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 09b246c9e389..209f3d41a17c 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2910,14 +2910,11 @@ static int atmel_serial_probe(struct platform_device *pdev)
 	atomic_set(&atmel_port->tasklet_shutdown, 0);
 	spin_lock_init(&atmel_port->lock_suspended);
 
-	atmel_port->clk = devm_clk_get(&pdev->dev, "usart");
+	atmel_port->clk = devm_clk_get_enabled(&pdev->dev, "usart");
 	if (IS_ERR(atmel_port->clk)) {
 		ret = PTR_ERR(atmel_port->clk);
 		goto err;
 	}
-	ret = clk_prepare_enable(atmel_port->clk);
-	if (ret)
-		goto err;
 
 	atmel_port->gclk = devm_clk_get_optional(&pdev->dev, "gclk");
 	if (IS_ERR(atmel_port->gclk)) {
@@ -2968,15 +2965,12 @@ static int atmel_serial_probe(struct platform_device *pdev)
 	 * The peripheral clock can now safely be disabled till the port
 	 * is used
 	 */
-	clk_disable_unprepare(atmel_port->clk);
-
 	return 0;
 
 err_add_port:
 	kfree(atmel_port->rx_ring.buf);
 	atmel_port->rx_ring.buf = NULL;
 err_clk_disable_unprepare:
-	clk_disable_unprepare(atmel_port->clk);
 	clear_bit(atmel_port->uart.line, atmel_ports_in_use);
 err:
 	return ret;
-- 
2.34.1


