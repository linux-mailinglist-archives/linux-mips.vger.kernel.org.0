Return-Path: <linux-mips+bounces-5113-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE01D95FF36
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 04:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F2731C21A80
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 02:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A98101E6;
	Tue, 27 Aug 2024 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="A4nf3OFy"
X-Original-To: linux-mips@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF9C8FE;
	Tue, 27 Aug 2024 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726342; cv=fail; b=tI+BgJellN0IBstDs3opj9GmEsMyteNsEcmfk6O/27Rq2iZp/5+NBfmTU7XOZVC9wjqT1uJUvKHuHzxUJ8GMQPdhrDWFCOTLd3sdE50gDVT+yb3qOz/jqZ8EyP7FGhxTXDTtey+UHTHi1gkcSGSv1mZtegg3sb4To4pF58RDjxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726342; c=relaxed/simple;
	bh=2XMdLxLysw7v/oWA3lqRp+Rhihme0+u9FocwGjTiblE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4gZGGmHTHUeKoQ41p4P/te3mAf9DhJW9wS9Q3mjDwWKccqV4Gc9rhwGFaZ2lWhlv+/xOHekWvd8JjLuIN3mK5y8bMJSmLRcSsS6i22kPqd/V1PPkPgrxr0RvWqMYn5O51JV0XOTiebNBWwcjUNynaRy07u5rDTghbkBWiITCTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=A4nf3OFy; arc=fail smtp.client-ip=40.107.255.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8AvDZCvMy6dD3dTZlr4yfpLRoqibe1SO/+imwM5j204SqqE+ea2rAC8+YezsK2WP+ycI2sTxSAyjQT0cbZTOP2yeuaXfp00dCiAzz4n6ayyO+7Zgjx/6uteHlw0iVHrcRccouzfbd+ZXM7dHnFA0WSeHqvMIKl9hcPLqPCXvgF25oU2f2DejQa4i/JhSiXw2YQPv+oycr734DFG3olVtCaMA7CUamhoeLaaSG/RXAhnGvh0wycRjPQeb7ShFIIPvUFrSoQ8kScBAI6CQ/IxPcYLT4+/0U7natZeKSzmWQacJDtGsjB8qMtlWkrD0MRqzokDZyxVqhUEWtAcfnT0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRddbbpYjf2Obi56bYY2mI2MxgX86TbwYibHAMvVQVU=;
 b=PEeiW+/eEvqCRqtwomans0ptxl0ZOADY6JFO6tTH9qUybiYa5Cr/XDD1QxEQSCW9fvwJVnLM7KwrvOJ2MotBfo6heBOKk92htZQznK/IYrdQGsVpCXSE7PErpP+o8VYvVsHwJpWhDy0MAdznXeRpngYO8YFep7Ap1o795EtG7v2k8ZVty00kRFZAqM2v4jBz99ruN9zqySGBrMNY2SD9umhGBFi4R2ha+OHIhDq8JgOJXd1TFXU9oBXRPq8ExFSRx57iFMKITGcmyZOGawS5hLzM6IjyepzGwI72X1OSVzj2KRSJcUHMJmQ911zYcxkP67ymFu/RfQWb5dHNUV2KAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRddbbpYjf2Obi56bYY2mI2MxgX86TbwYibHAMvVQVU=;
 b=A4nf3OFyZOa3gn3PIuPn5xehgP1zS82W1P4cBuQH9tiXGNgQ6E3qHkLs4BVlHm9L6YONsoZNXqbiEAjfMlwvjRHZF0FBgyKZGYpGTWt8M3ZyC31V6y9T1KnVGKCsmkdKHWGw/xgzR/5yA3z1Tv/2gAve60Edo4GhN65lx0+AKhJmzRGKNwgRi/NZMP/COQKTFHdt5WfaXmqeGqNxxOCcJmXsCgNw+9BHO7NfwYSoVkhGqJEevW+4tmo9tPFST6nXzutZBST5RyUSh3/TuE4tqFcdLU4qjm2T9o+M+pJMVSRrQBoNOf5b34/B7Lzd9It/aBYHNvMRJIiA8wSIuFMMBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by TYUPR06MB6270.apcprd06.prod.outlook.com (2603:1096:400:346::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 02:38:56 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7875.019; Tue, 27 Aug 2024
 02:38:56 +0000
From: Wu Bo <bo.wu@vivo.com>
To: linux-kernel@vger.kernel.org
Cc: fancer.lancer@gmail.com,
	linux-mips@vger.kernel.org,
	wubo.oduw@gmail.com,
	Wu Bo <bo.wu@vivo.com>
Subject: [PATCH v2 2/2] bus: bt1-apb: change to use devm_clk_get_enabled() helper
Date: Mon, 26 Aug 2024 20:53:58 -0600
Message-Id: <2059e872cc9cb129752c1656be073b1a6beb4cc5.1724726725.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <98e5fe3c7762f3c2cbf7b2f3b3461c0cef789dd6.1724726725.git.bo.wu@vivo.com>
References: <98e5fe3c7762f3c2cbf7b2f3b3461c0cef789dd6.1724726725.git.bo.wu@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|TYUPR06MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7e5e74-063c-495c-af9a-08dcc641658d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D+/NHLlPcV4wE3C6VSip1QO/ERtpm7R7661KTVS6U7pLG94O8WDGsHccHruN?=
 =?us-ascii?Q?5dkdaZgR+odabhUm4SDpHsTJGxm7hqHsJEJHENLjAaUCL24IzN+PhFCVwvyS?=
 =?us-ascii?Q?QcYKUE4MXblXRWL1C2VBNL1mnwPLsYcR87oxnPd7V3WpofSCcCpIWO10cCd+?=
 =?us-ascii?Q?Esywhl4Sx7ZIA+TTIuOfhBJqqJL9DGQMuh3cBx3Oz5oZPCaja0liIt97yTp0?=
 =?us-ascii?Q?7LWdv2h5AKP+VvC7ko6hQBR0N4PBgWW7dBzxSl/tKFuZ/5s9qc15zeMIKY5w?=
 =?us-ascii?Q?XhRTzig7fwqWH9YL6lDXONiJk5Rc5eUOGKz4nL14E/w6iJAyVtAxHumpeY3Q?=
 =?us-ascii?Q?r2jCSWe0Ip6e7EoaDLesUyOxBzppVpaY5uhnimo+0eo7P3wu4t4E5+5R9zYU?=
 =?us-ascii?Q?fvpPDtavAqwq7dQrSFNHsId3/aF7hAGWHpa/YtCt5XKbE0UwqUgOR9RJBxeO?=
 =?us-ascii?Q?LDenc1o908sBaPiyvntr5WT2kEP4Nr5QHmxroqTfOqCGW/IR1ycR2bBrttKX?=
 =?us-ascii?Q?9B5LjAmFCJOyZxApN/le6QgBi403g8wWzcRpm/sV0aEN2tmen5O1sWAQ2dIS?=
 =?us-ascii?Q?GHTNNKp7Nbmp7UanChLSwUBBE/y0Cmzu9hiG9vLPhzSrSrEdxsLdRwb806r/?=
 =?us-ascii?Q?D4GLflS7xCkZFwzmejbD7INmh1eje3KbhQjLDNz+0vGbbWZJvozQu/QA/GhU?=
 =?us-ascii?Q?wu6oybKTo+XNbrFaaoTviTq/ZBcBty4umsifZUa0O404OkK+qRYX+9jNMzdS?=
 =?us-ascii?Q?qNt4etzjpPfY8QsPfxXL08ggLy9V2CPrNDvRySiX3zdiDHtzqVJ5K2Z81fcu?=
 =?us-ascii?Q?hgXhFGzh2Hjq82GalZcSK0HWknm6UInPLVdM7r0vN9Nkit4uUsM9Ae4w6fRE?=
 =?us-ascii?Q?XIJlc+ZwDCgtLVbCIY0P8NL6WRWh1v8ccmQVX6+TZohKgKdyN/EzYmqyelYk?=
 =?us-ascii?Q?0LoQl2hGxR/ahlAHRtOXFyajgC5+oofSjVTxKSWwItsun6p3vGSMXS5L0efw?=
 =?us-ascii?Q?wBTwIdIlZRFY45d18rEGwT5L9cLxZDZnl6tPHwHEWB4G1z8zWEmAe1+0ouA3?=
 =?us-ascii?Q?+1GTM8fMU1OGfnwuO79R+c2ysVdnEjvJHh311cfe1I2nCtlzcd5L/OEviS7h?=
 =?us-ascii?Q?xp6PEuWW5ZeBRgkt7GLtMrqaSrqjTQKYAEqSvruUDamPzYH52pq/QwiLgWEW?=
 =?us-ascii?Q?knO/XXCvAnf3h1rxUYqKdWDKPPX6iiyI3s4N3a9nuzSte9uEu3fXR+N9qoEw?=
 =?us-ascii?Q?cNBKt0gfsZIsRaQaFw/hGKGEspDJfbJR+A45EDsJBOnqlWndUrbHFoQN2NFi?=
 =?us-ascii?Q?PAGwVmOlQYK3GgAgaTaqSX235gi0OLqXWmZ1AaXF0UuO+rvwLKTU6F3hSwyo?=
 =?us-ascii?Q?/WmdyxSrmQLKD817krxRm/AbkSHVXmdu3I/y020oxDvyZgbrwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4486.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CdZVd7hNU7lzHnXyudM1HxbKG7vkkmdDmVIfSsyR6NILBoUeJ1+AOJM6IEhN?=
 =?us-ascii?Q?MBFrzgGaGRrcSOViUxOAs15uQsjiwM1TM+rhPngv6ocUcaxaUn7cZL2+ae+8?=
 =?us-ascii?Q?Ip2wFte4KhQ3ugQYV+zAd8Dj4JUCyv6XxKThjkq/0pzl3IE9lQZU5r88NYBg?=
 =?us-ascii?Q?jsXemyrIhdZSLG6tkQjFomC9dCyHPFpgjs/t0+mkfIiwt1HFnlM57Tc9+VaC?=
 =?us-ascii?Q?uqzZNaNIn2rMO17yTnk4GfeeZbQxVejQhewwBwWiBPDkzvt+/qL8HpjSQ/KX?=
 =?us-ascii?Q?Wc3pido6ggGLsCA0zLFgD8h0o3aVOz9pYRUXKAu1AHFRPNYK21IRYmcQGRVX?=
 =?us-ascii?Q?z9P3+fbe5Gkf5xKAK2SbKQTq9EHknda/XBTukIsaGr5rN71UUg4F4uPFj0Xz?=
 =?us-ascii?Q?dsDsyqUmLIZxpGbdBG/Gqh70MiV33Eq5OLwGOgUTPISPLkP4sX674SJz7EsV?=
 =?us-ascii?Q?KcU0+bsHyl/XXx1iv2HK8Vgey1rJjEdZZqdskdzgxPvE29wkhUy2gdF7183w?=
 =?us-ascii?Q?5dwbYw9CCXPCqhruGaH7n2NChdWRnpmF5b5E7e7G6JzDmy8XpXxUUmLWE95P?=
 =?us-ascii?Q?2h88CixGPfSbenrbIkgWsX6FvWJ7PMWZ9ZPqWTJOZWKKxW0f6JN6qYLj0eIb?=
 =?us-ascii?Q?GHAgjTcto7I5mTs+PHx6pvyHVm1th6q9L1okd8iqN9X9ZBMvUV4CdE4HbOR3?=
 =?us-ascii?Q?Tb2vToA6Y18HstDlPD50Wt5ATE85TjsbFp0XkkQZhKatrcUr0vHlbvsKfG2y?=
 =?us-ascii?Q?cNQvs3olPJmME/UOs0+GmnrtsHB3Znmtbc/Qk5+bdVZMW2+qF/9U9QdRS0SS?=
 =?us-ascii?Q?AIPxzNvbB7T1rq6dT/F4VKG/l+n7CaIlrfM8os37mRqOgPTVI/8b6y+VSIf7?=
 =?us-ascii?Q?+ywN9P8h/GHzKKLnrAA7qWvZSmv3mHK4gcEuQ73xeypjulKgwOldsJh1onyx?=
 =?us-ascii?Q?9fvUukaWWLVE5Crx1V+glqJUjUdl+B60ChdWFTA2wgZWT8t2ssuxsl9c1vqb?=
 =?us-ascii?Q?f9+IWRzZ1HVYUAfKvR7QF0yJMI8fwO1KoMl+iRIx0DYR/DVLZDmvJ+ckNEVm?=
 =?us-ascii?Q?fqN3zjBA9agHsIn9Z6BGPQ5XQ0IFsyQV1FNeIZ3eHy73vMMo/M2X6Lbb25Rc?=
 =?us-ascii?Q?M26gKQQFI6ABI99jd0p5mHqYYRjPoFa1Et83e8Hhj41hSloodEwk7MLCWBWJ?=
 =?us-ascii?Q?Nwo5zwCDlzqLudkEUGZGWcyyW9h2XqlryvAdZcxSAU90IuUPlY5QtqpkMhKg?=
 =?us-ascii?Q?7hQGTzUlFsBHA4FYr+ZQRomvEE25DIRp/Hld+sQurNhYn0r/Cw/v6shP93NL?=
 =?us-ascii?Q?phoGKlR2KSSIukbZL4f11mw+0VV3UtDH/dkWqikepOaWwmWS4EsK+lf3dj5s?=
 =?us-ascii?Q?E/k7GflIZxDuWUmVls5hcWXWJqNprw+LCmbDteTEjD9Ddroy0mGwX8gGKVZL?=
 =?us-ascii?Q?/vTg8YaoN2pEpwlMlfF5U2Md9MrgnJHIPDfyVCsdwPknkp7Im1Q8XkTBJA/F?=
 =?us-ascii?Q?hk7j5e/U/gJsVajFUqLg2rIzmj8SNhNVcIn8OdHCOv8NROHyfCBxPlEXI2Wp?=
 =?us-ascii?Q?M6rTqBwNgpGrpLNVC1RJ3PvD0NT/eEYw3xsRmSxz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7e5e74-063c-495c-af9a-08dcc641658d
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:38:56.0663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyzskF/x2i7s2jDBKiM4n+3MpZ3YIdkelRcNhhYnxGdL0a32BXP39mh2LWVE3ZPBr+6o8inE/IV/xhOUEf5ryA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6270

Use devm_clk_get_enabled() instead of devm_clk_get() to make the code
cleaner and avoid calling clk_disable_unprepare()

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 drivers/bus/bt1-apb.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/bus/bt1-apb.c b/drivers/bus/bt1-apb.c
index 595fb22b73e0..7463124b6dd9 100644
--- a/drivers/bus/bt1-apb.c
+++ b/drivers/bus/bt1-apb.c
@@ -185,34 +185,13 @@ static int bt1_apb_request_rst(struct bt1_apb *apb)
 	return ret;
 }
 
-static void bt1_apb_disable_clk(void *data)
-{
-	struct bt1_apb *apb = data;
-
-	clk_disable_unprepare(apb->pclk);
-}
-
 static int bt1_apb_request_clk(struct bt1_apb *apb)
 {
-	int ret;
-
-	apb->pclk = devm_clk_get(apb->dev, "pclk");
+	apb->pclk = devm_clk_get_enabled(apb->dev, "pclk");
 	if (IS_ERR(apb->pclk))
 		return dev_err_probe(apb->dev, PTR_ERR(apb->pclk),
 				     "Couldn't get APB clock descriptor\n");
 
-	ret = clk_prepare_enable(apb->pclk);
-	if (ret) {
-		dev_err(apb->dev, "Couldn't enable the APB clock\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(apb->dev, bt1_apb_disable_clk, apb);
-	if (ret) {
-		dev_err(apb->dev, "Can't add APB EHB clocks disable action\n");
-		return ret;
-	}
-
 	apb->rate = clk_get_rate(apb->pclk);
 	if (!apb->rate) {
 		dev_err(apb->dev, "Invalid clock rate\n");
-- 
2.25.1


