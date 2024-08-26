Return-Path: <linux-mips+bounces-5103-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D16795EFB9
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 13:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B6441C2149A
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 11:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A591153828;
	Mon, 26 Aug 2024 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="oeYVaex1"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2089.outbound.protection.outlook.com [40.107.215.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C57143C7D;
	Mon, 26 Aug 2024 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724671796; cv=fail; b=CM01XbTcOMu7aRia05qpBQzOren1UjLxdW5S+UVBGGzps1JEHQP0Qwo1pbqGSjuptd0E4RZQRhiCNSyKwQXIhlci4FjUxuJR9WytaJpbEkTT7LOIsk6lfPNuqvRlpHIGtt3GdLXZm2BFr8kCi54MLLt/2z/a9Qj1KKmnnUFz4rU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724671796; c=relaxed/simple;
	bh=h2v84zIK45e4y8QTK3EoDk1G3BLnDEi/elT1y3ZwRWY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XKZRW+kfXr2flCcR8qu7YwGX/OA+6G73vHiWtmZGz3O5gwMHLy9c0Aji0bGqJzSo8V6dfciQQLFzdsn/0y8GNdj+kCCKjTsY3DfHN7wicSpr4XeHzNKnqwaQeg8fzNCfllT/3c5u/Yhq5IX4TRcApFuqlryWFfvdDXGbVAwnyug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=oeYVaex1; arc=fail smtp.client-ip=40.107.215.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIf5lgzVtPwop03+ZLoVEe5sLgyiJncXU54pzAEWBpzTVpH9KjY+o7sxR7KqNT+A1poXByRpIfE4+V/NyBeLYaD3KXOOC6XGiVkAbOzSgS88Pq/oj/EnZoGIY69jEw/x0xrpCb2IpHASZaI1zlNuKClYBDdqrvJUy70vshBJ3lwe3t89AQc8HVuR0RgtiNd834O4Xi6IfAOqHkBE5SEzzpUcl7uKvF41caPLH+Ne4/3klVycoduk9LO0oBeVgOAbzo2KnB1iHad5mL4JERAB+dljG4gE+DmBX/S0O24JZkNaQC/DSF4ebpSQVhYod+IFRKvuN6GhoCQrxE3Yi6oVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrmonIJ0XhGWoLxkWnMroHIxfFVA5XF1UeV0wFQZXgg=;
 b=SBb+zUIMRTT3t2HVDlXe8PckxKXtRwtIquXL3cUxO0N06hKJFHZiyG0mYhn6s7EVn73yaETtxfItNpU2T3YB9hMsVPYtexnU8fij3X9WIlFt67gX+5nT91LPBll/Vd353t2NOLyuHKcn21Y+D1akf3e8/wjzUgTJeeNMZKzM5awJQlr19GP4456U8BQlIMz1h0GgG4CKb83VEIVJ6zVE0GIs1Q1fPO6dkciAPi4/PmOIscCeLlMz0qb+1EpwFpjwngf0zq9Qr4S+J49aqjjmLanTY9/QSTbmvnfjvpQMc176ogFQ1Wz5ITNVCj4CG2a1k0ZnG4NqTZLHbIThc/Daew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrmonIJ0XhGWoLxkWnMroHIxfFVA5XF1UeV0wFQZXgg=;
 b=oeYVaex1F0giUIoVAvBli+9YaStSRRXn3zcV10y6GSjHXfRt+w8Hh7uPPnfw7CGdCSrO7c801YOza8OG5lHQ2Ia24Heeh+mKmlS1gNAIgrMi6zHmAuY7uOCneaEDdk3k8YLyMY/9t6CDDANfwxIZZh3uBfacMt9BBvnK3eWxeuhpjyTqA5sH97sXY9LI0UP8zRE7l3P1LKeoBDd4nYPpo0STxCjk+aB45tC2iyRgkwYwfVHwTumpZsUf4xlgXwnFS3ikB2sEjQI1QTuRg3fycj8B07LhL9chqz8AfHiydWS1548qv7DwqqtQiFgQSBEjDVMA/cidYVSIdQcmmbZ9yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com (2603:1096:101:c8::14)
 by TYZPR06MB5929.apcprd06.prod.outlook.com (2603:1096:400:343::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 11:29:47 +0000
Received: from SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd]) by SEZPR06MB5624.apcprd06.prod.outlook.com
 ([fe80::e837:10e3:818e:bdfd%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 11:29:47 +0000
From: Lei Liu <liulei.rjpt@vivo.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lei Liu <liulei.rjpt@vivo.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: [PATCH v2 0/5] tty/serial drivers use devm_clk_get_enabled() helpers
Date: Mon, 26 Aug 2024 19:29:25 +0800
Message-Id: <20240826112933.7249-1-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::20) To SEZPR06MB5624.apcprd06.prod.outlook.com
 (2603:1096:101:c8::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5624:EE_|TYZPR06MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 35468fd4-fc70-4152-2ee5-08dcc5c263b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cWdB5Ds7tNej+/BEXCLbnsRjs7rehRsSGRaM0inUYpMli5IE55oPkFDDIdY/?=
 =?us-ascii?Q?32YD3y8T+CeIjaJ3ciAkzLA+pwGzC6zVGljOPtyxxj0mcRuhzLh0M0c/XtR3?=
 =?us-ascii?Q?vg+9ZeP1AzVg/JpR+eIfec1QX7/X1PBafDeU27adV6KFTEPw/hrhoGddKWj/?=
 =?us-ascii?Q?1twyH8oLnpRMi8YW68ouGlUFrn2+JwI1hiF6AEjmlriVMxLI+v9blLbvCshk?=
 =?us-ascii?Q?FsQSfYlOinRpZ+O0kbiVium2MKpKF1c2BFtM38s3vJB2C/fIi4Gg/BeXe8YK?=
 =?us-ascii?Q?pWe/dl0gUjVV7IGuFxm+T/h+gGrLAi2//qGUJkEJbUC4BtcJTfg6qbhtMbUy?=
 =?us-ascii?Q?po3c6EhSEqEG5dC7n4Ku31Jr3Nqyt1pq+2DOKPyH/KfHTHpINvTFl3yyxpyC?=
 =?us-ascii?Q?A4j3ekH+Pt+JzV3GiWkI6lh2lZv/0Bbc6MI2FxlQS/2GwkHEopgkN5/2eZEP?=
 =?us-ascii?Q?d/+tr6JmXnKmJnOuTlJ9QIWUs7mY5+8/HanDdmyMCbxnmez+zR5ddFui/efl?=
 =?us-ascii?Q?gZ5kdSwCmjBgGzRAgbCLz0K6HuxHsRXKenhuDtYq/+52vxv9hZMi5M8e1Woy?=
 =?us-ascii?Q?bZfhUK71kiINpNh1D2h7d69LTsu+PiG7nFG9+p9iAUR/+Bm+DCwEJUhORAAM?=
 =?us-ascii?Q?RopvJ5UCzEOWzG9pYRGr15ghyH4w3y/WP1FqYRiX5oeqHT6OJ+bz1JLe6xBv?=
 =?us-ascii?Q?er2w+TmEo4IcwW1P9n+BMTdVJxbj2Ohuq+VrqWbLcFw+L9RQBcrSsgxJiVDj?=
 =?us-ascii?Q?kKdcZi4/79l4EjymIBaDwmsHZqVg9dwmg/PSxsnXIVcgwewYDj8uZqZmSMS5?=
 =?us-ascii?Q?aFmZ4SmHxqWp9bqt/dfg2P5Lf6dKLMg7SagA/tnnOSp2m+7K+1B96sUZLsDx?=
 =?us-ascii?Q?ViFHv+cNDyQwjyPL509+ShCacL753LI06hUeAdTbuimfJbxZIjcFLc0qhjIv?=
 =?us-ascii?Q?6kUUXV2/bY3CpiEdrqMMhT/iMwtMJPCGbdA5DaM1t5aDbmB9zJFCf4qPUOOc?=
 =?us-ascii?Q?0PpvObxVUe5jddTHAbvKvrPLf2tCgDH7s4xRFVRNafATvSyG/NgI/WVNFR+/?=
 =?us-ascii?Q?61YXVMEvFnksHEUrnK7OTbCkKfmt89wIaWb/MmqU5/U55VasEd25tVPlxVEZ?=
 =?us-ascii?Q?k+0mlqnDd9SnqN36JPz0LOJo3ahpPWd6Cgrq9YPRw2EO0Qo0GruXqyw2Nxrd?=
 =?us-ascii?Q?FHUA9GlraYYYNxAFLUgRSZXlj4+eQnFe7NAU1fLe295BsYsHSTvzNnlb0GVW?=
 =?us-ascii?Q?4nmQlWSXQ/4wrmPS7YnD0HZhpmsF7iSta4VQ6up/NfgKWZnTqssOmO/SC78q?=
 =?us-ascii?Q?qv59GjJgEQydMTeFRf8hojtZP89tAqSWwu8/7kw5kvEQ1k3gAEi+1ZBJj1Lu?=
 =?us-ascii?Q?EkYlTPTCBoEvTJgffF2gtMrDvj5aN5R+Gfq5WG4SSe7yzEfTwtMhIE4yPoiV?=
 =?us-ascii?Q?LWIfJYu7sic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5624.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IpLScAg2XP9SpOZruiPf4L90F5wjZFhk+4StJbqEOYqCqF46ANEQd88Cs4yT?=
 =?us-ascii?Q?oTJhA0Fehf2u++XOtNP2RwOII09zyy6/7Uw4CSiIXuiKDYuKKQ70MFqUuY/w?=
 =?us-ascii?Q?PxRUGvnMZJQMaibQqv4BJW+ZSobJweLvEzJCXuCAhpA8H0pLhRIRM87NEZ3w?=
 =?us-ascii?Q?acoEJas3qHzVI+jqxW7mx98K5DzGbFH9nRB+kyHPlulEDr6f7g6vPUO+qg0R?=
 =?us-ascii?Q?OHEG/tNwxWpvvNUVZKOCSwMpu78svJ4OTRgeLqMxzIy2hYkZko7Or95+Gp+t?=
 =?us-ascii?Q?XytGuCjniDxwZGutBPotp36GM1JOoKpjhgISp4hMDrxRhGuGZsdtnaUoem4T?=
 =?us-ascii?Q?MAHGchOlsBiZgnpW2f9tq/LKmL0pjXBos+omUGnj/lODyfrYwghEfqKVEyzF?=
 =?us-ascii?Q?qnGqrryyfLJXpowBHiNQqCvJEvddohDiKjxHoYBV948dT9iQ7KAraQJ/nrln?=
 =?us-ascii?Q?QyBqVbplFA2wLa4IB8+DPQFhbriQnGX0MQ63CPxNXfqEeklJ5xGdmnfhXc9R?=
 =?us-ascii?Q?TksJ1zIYkVySudYrfVeyLOP++Txo71/hiXpz8nw9NG8IEbbGq2fHpEBIQ3R6?=
 =?us-ascii?Q?rxOwVlChzYhaHIvkN/Yl6KaMM3khm+d/txuoRaR1owN5SoCi0r6zCYVlMZw+?=
 =?us-ascii?Q?60PADhQ4i3r2lIwa3qblz04KDCZ8LWb/fMhuiSU6fNuoRGAZd1RI1OIluj8s?=
 =?us-ascii?Q?sJzjiiWonCJ2jFqyOnJXj/qT9E6MR40mkRUF82FpLzZdLHmg1VAP2bbNImGu?=
 =?us-ascii?Q?LlFzKd5whUg0OmAmr3OJsplv258JvTzTAeQ+Z8slaIOABORK4iO5UJDuO4hd?=
 =?us-ascii?Q?OT5rUQT7kMxzFzfpoB/D0BNQeMlDZf13dGeRucR59CFJnJYuYMsHSa2ABRKB?=
 =?us-ascii?Q?YBs1XiiSuXis68ISmBGreRRxZQzRZBUztwstFqDYZiBt5XCFTBwEjh7YsADn?=
 =?us-ascii?Q?xBcGFySyeTgavz4m6vZfjWWyKE314D2ScfNatq5LpLK1pNfxLqO0QLxEnngl?=
 =?us-ascii?Q?yV8Yia9Mt1YgZBNDp2/uhtf4a1qz3MZRjdlM9yzzPkKa7Bq8T4riqXq6kNdp?=
 =?us-ascii?Q?1PxafhvWgmnW0ff+ef2lrPjWB9fL9dTztzdUhXZ9fNW0gGs3P+kprgDqtyjY?=
 =?us-ascii?Q?0QQio9oGP28Xy0bHZwAFlevk5AL+cmE2fBQAK0vaUYukjG3dhIEMCwqh2k29?=
 =?us-ascii?Q?5W32IzrqLIlVSgcy0WHTi8HfJY6eRLqkVMkI74wXVIU9CuAJd6y+mZmErtMy?=
 =?us-ascii?Q?tql2O/+mXu9ZRA87k9ELizoYrxBqKb1TbSDG5vMNH879NsjOxrokbXMYqmQq?=
 =?us-ascii?Q?nhahI0EadQ9Xz3TbjvLvW4OYJuG3jDQvOre/ggd4NnoibMzvMWDW0WdLMxDD?=
 =?us-ascii?Q?uvVG7zqFwfzqy84tPMiH9Dny5/U7Fvn3jkntWVJSv791buQhp51b1/fgWD7q?=
 =?us-ascii?Q?T6D/6vaS+rhuwAuksYAJbLucE2fX8wO/mCxNTBttwhDY9kXvCBCvQ1r2p3wb?=
 =?us-ascii?Q?dTflsvjzwSLQHpERKav+rw0byUtgBT5IFBuhfxwPtlJGuMqw7IrlKKbkwqLe?=
 =?us-ascii?Q?g3qdNrv0BE25d6nwZr9fvoNIJWrvByGKvf84v2nz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35468fd4-fc70-4152-2ee5-08dcc5c263b1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5624.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 11:29:46.9021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8iwtS+HKU6OS/IpvjYwxnkdI5uNXzUhBwcA5wIbwL+XSYVOI6BhwmBzM1W7llP8w3oz58I4aiajymRipXFHtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5929

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

---
version 2 changes
1.8250_ingenic modification directly uses return data->line
2.8250_tegra Removes redundant label err_clkdisable
3.atmel_serial abandons the use of devm_clk_get_enabled interface for this file
4.mps2-uart abandons the use of devm_clk_get_enabled interface for run-time issues
5.st-asc abandons the use of devm_clk_get_enabled interface for this file
6.stm32-usart modifies the return method and removes unused labels

Lei Liu (5):
  tty: 8250_ingenic: Use devm_clk_get_enabled() helpers
  tty: 8250_tegra: Use devm_clk_get_enabled() helpers
  tty: 8250_uniphier: Use devm_clk_get_enabled() helpers
  tty: owl-uart: Use devm_clk_get_enabled() helpers
  tty: stm32-usart: Use devm_clk_get_enabled() helpers

 drivers/tty/serial/8250/8250_ingenic.c  | 27 +++-------------------
 drivers/tty/serial/8250/8250_tegra.c    | 12 ++--------
 drivers/tty/serial/8250/8250_uniphier.c |  8 +------
 drivers/tty/serial/owl-uart.c           | 10 +--------
 drivers/tty/serial/stm32-usart.c        | 30 ++++---------------------
 5 files changed, 11 insertions(+), 76 deletions(-)

-- 
2.34.1


