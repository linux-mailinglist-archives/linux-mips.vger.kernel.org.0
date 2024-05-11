Return-Path: <linux-mips+bounces-3223-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919D8C30AA
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744591F21979
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FC95DF0D;
	Sat, 11 May 2024 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="SuhQNGD8"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2117.outbound.protection.outlook.com [40.107.241.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0CA57C9E;
	Sat, 11 May 2024 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424245; cv=fail; b=XfsrPkgZPN6cx7jnvHPGZws4R6GieZid8EbD0pG+827QtHGvtIInG7DUxzuUR+3cCJhJEfPkm/qbUsMa1fQvyO15S9Rdiws0DJ2runj+xttRzOgSXpSDbnW2hSubJlnVrPYI++4YIBp+jvY6pOBo06JyShXcd3JQtZQf3g1lkCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424245; c=relaxed/simple;
	bh=ZqlHejko1LJFqsFSSAVAhkWiVHkuE2P/LOyddFG8zrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VpwItEDvRXCWYwn5J2kbtFKxzqb9c+67tIPsYnlJptg02fA0/hCeWtjXbvMtKbo8c1GimTGgS/JaThbqh+EsrKb3DatAwv4o0+Yw7opyP9zvtXf45zQhkYRaXtvdAk/cVbuVw8dUAaU+ErZaII8tn38T8p8WBs8BgMvyLs9L2Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=SuhQNGD8; arc=fail smtp.client-ip=40.107.241.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp3JoDEhDNPBZ7E66uDM9GkZFKRJwBO2qgUtyEquCmbmj0BloI2vKMdAbStnjbKvhm1zTx93lM9ICi7AhPlxm4vPfB4I5szlNkniidlHowtMhid9WpPWbkW3RLZ2hbzow2ytukjUkhuNGG+wuGyblsnsmwrXkq/di0wCjZh9GW06SCzPgtFjqGNecyGBYI716jHDl+tmd4c63hQoO50QiptISx9hUIYS+8NGOSQfzuWSQYT1CAeYysJyyuCLrMZ3xVAex74veJ+F76EYqbgugWc0XgTxN2YO6Q6jXfz7wGtQtMoiG+AYKTo9xZKL89DqUraDcYMZzJx0+JOU3VUCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iz1LL4xwR1qY+CI3VRAXbhSeafq8ULEMhuPza2lb/BY=;
 b=VSqujoRi9u2oIBaKjcjVw5m3eBIDOoU7mpZS5bmfJZLmgLgCh+fSgbWvBovaQP4bJN/zilK050VOnMQPms5nevPIlmj5Y2tasgQwTdQRIS2G48JYFJE0mQMslad6+gjs46lAoLrTqQBG5gJQ4451EgPMR5vy+Qvl+x0ER2tLJs/mTfafGA1LqHHOXfs18XxefIh/j10MgS5+0sAnKO1MW9EP4/IaQAUwGDHaAp/0NIyA5WiZ4CKbJlelyqdzDCRo7RMEkW5BilDQOfQkprz5IxTuXD29fUKSpuAQQIX67gVrO9iUC6qcqCeg5oXMGQlO3SJ9OIfFN6TjovuEeGCR4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iz1LL4xwR1qY+CI3VRAXbhSeafq8ULEMhuPza2lb/BY=;
 b=SuhQNGD8A3lOV0pQmb3Eq9VyWpdMnTLNMNtwyJ5WBHe1r5d08NoDSQgCNjE1mGeVliBypg3TUdu9YJkh0/rCRyQYkAdqKsG1JH9ctQl9iCObNVG9VvXOZWXkHeVA0A+p46oUrnlZM8UwhXq8mXKC9aFlRB/zrxuvv76q4bPr4I8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:56 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:56 +0000
From: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 08/14] clocksource: mips-gic-timer: Enable counter when CPUs start
Date: Sat, 11 May 2024 12:43:35 +0200
Message-Id: <20240511104341.151550-9-aleksandar.rikalo@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0235.eurprd07.prod.outlook.com
 (2603:10a6:802:58::38) To AM9PR03MB6916.eurprd03.prod.outlook.com
 (2603:10a6:20b:2d7::14)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB6916:EE_|GVXPR03MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d327e19-d0f4-4464-c944-08dc71a74229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qUhAEUKXcnkcxm1nwMi369iMT4VK/+YcOHSj09mR5LZ5Nor06lgHBl93FhHS?=
 =?us-ascii?Q?AcBLlGNpVYJ7XcZjprCrNa+XAUBHPcow0PKiDoY1GwU5qDOgMNVUHyEPEHFS?=
 =?us-ascii?Q?81fWMl+sbrndYdRD9NF1uhIIDQLx4F7EyVdP/2LC4vI/LkwqK90YfEfqhxxq?=
 =?us-ascii?Q?DYTlhqe4Nq5RuyeCFJYc361f3brDNRqhwEErRl1nodkOzI0v1mQxhf/i/66b?=
 =?us-ascii?Q?meR04xDD1f3HH3t0ERdi2lQr2hpvan3Fx6etvw0iEZFuBTIWD4/BaSjlkMbV?=
 =?us-ascii?Q?WylQaXiKXSmKkqpGjH907R2/bge0Wi+wnxbBUDfGWJL6GH7euMsPE92D9e0Y?=
 =?us-ascii?Q?YRroR9a4onQ2c6s4n2YV67qCnMpfLBMNd3eyjT0Yke5+aJPtq3Nax3jN9Reb?=
 =?us-ascii?Q?DUddTQ+yboBbgEwSnsENTDUUFmdBUi/PLRNvbUAPjUcEVla48ux2mhj81KYZ?=
 =?us-ascii?Q?Mr79rbGQJvbBOQFIvYkW7N06fQJqYLlwyQcNL3EmcbLm7hqZrevRDTcZO/OF?=
 =?us-ascii?Q?LIW8BQI/dHNiWz6y5KdBSDgJ0TI+hwWlIibeXjM8uMWM7+3Vxb9uWw/AUC8c?=
 =?us-ascii?Q?Wsaw/+sKGHzbdZPUN3O0Kgrq2DfsvDuWGVblFZKXHes33cvd62r/WXIrbyx1?=
 =?us-ascii?Q?QG54QkQIBECi4OhSNuJG/u/LGNJI6Z5yqYQBA66jV0bnPNIpTzx5Tl4VQgVT?=
 =?us-ascii?Q?u0Ebi+rbBnLShuaFbNPeZioOaRsfLw3r5rvTD6lEYyt+CK1KV8HpKU/HH83W?=
 =?us-ascii?Q?+mc4S2AMf4OQweAUpRUHqsJ0JQsOB4MKwKkV9H6RMnzg5TT6oVOhmPehQIFL?=
 =?us-ascii?Q?HM9ZwSucNg7LppIE8wAHwqaw+ylkUcb8Bzep5RzP1pzm3PYeQp83HRJ1QBI4?=
 =?us-ascii?Q?JT0GBpb3cUWBADH2/piaVib7LzMistYwE1GlDixfrB9oGrZ5OG2Sj41csiCN?=
 =?us-ascii?Q?PBe5jaIgEWluIOxzDW0WGqcsmxV462OIWN/e5h4cqg7oD1VZmnEECn2V5+BE?=
 =?us-ascii?Q?FWd5PATrCQd9F3Mw3lhSojoP8PWnqNHAE/xlmylm/7bOE+THXQK+rvix4T7P?=
 =?us-ascii?Q?R1KkkpAueoGtoJ95ex/T/tBrLYWnoOSfk2zPOEEA4c1VKucIklGY/vCcHpAg?=
 =?us-ascii?Q?xFqXEQSxQd99HMciuW9dbI1gZO/lDavnq91u8TnpE3JIPrBMiCURBR8ruO10?=
 =?us-ascii?Q?DZoukLmhLK58SFP+hNHVhPc3iqbs333AugeVxqQK3p8l3DDDm6vb034HQXGd?=
 =?us-ascii?Q?28WbwPubEqq+l8mc9hCvJQTbD51lZhFf0OMeMICw1MD3k4gJxZlxCXOKrBux?=
 =?us-ascii?Q?XSY6mEpC1P4zjMUdqoUp5rwJkMzYzqfmvflTYXRAvZ/hqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ne0e9sHvlIwq7OmQJSg24/4foc6irr0jMD6n87OqbDY4VNrhnF70MJCkAW/A?=
 =?us-ascii?Q?Hex0TTNgxpjlZ8tHVodTUBqLQf2KVNnOUOOuXptJijHgyXvHAM1ncjFbH2WS?=
 =?us-ascii?Q?rUsWOxQkNPqJqZkZIYSuLUi7ud4Gs7DZr36kmEfJfa4HpM3gFNpIkIAFq+/h?=
 =?us-ascii?Q?tu6bZp6GDVL8LDZBX4aP7SrUzbz9Q4+HuEpVzVNrQEI2nZSkKvNuj2s4GKV3?=
 =?us-ascii?Q?oN3yUAmV6tgvj7LocvBKep1yZkGbQcIFYthUCPD/MADYcyo5fgdtiA7hYOyA?=
 =?us-ascii?Q?AbWwYpM9g3AgW9sFMFHDfC5Fb+Gj2r1F7DWgfl0KGiBAk1yTUhInDQmED1sr?=
 =?us-ascii?Q?rN/J8tOOvOHG68hLSuLTK/zguEyhQrThdBpLGrydN738pMviCO6fnOB/4jGh?=
 =?us-ascii?Q?eo2bfAmLtu4ZHovs1jdKCD/N3cW6voRMXQXOcjSewGo7qK/aSMzpvsikjW6s?=
 =?us-ascii?Q?pEOsp1AHXV7MqWehA95sLQO24h7Jfcwk/mbvS82O10HMpkfM/g5l8zriLg2T?=
 =?us-ascii?Q?ODl3Gv4v1XYnO0s7RFGElocWnzafe0tKRRBVY5BsLF7JM1g7ojWX5f/mdjjl?=
 =?us-ascii?Q?dKcA148HB0RlGzXYy0D2bR6wKRWm7TZtHZsPS+yCX+mL4HAnFuSP5YDSJCWi?=
 =?us-ascii?Q?bW1mn0XIysY0l9rKQr8TdMwwxiz4vA1ukDZ9ZWZFHvAIsRyp7MUidSnWzaec?=
 =?us-ascii?Q?ik35ps8M793hnounv+VUihcZOnVpALh3PtTs6Py7KtX5q8XtY2XGpBx7a2EC?=
 =?us-ascii?Q?T852BEwum+Aet6Gu/62O5+Ewkg19T2BZmX8NGm7SAu5bKeq1sCatnh/y+ia6?=
 =?us-ascii?Q?DySs35fppIHvUmsikr6krMqygLfGkMNHvWvLdXLTgct0NUnpaaPs9BE2eulE?=
 =?us-ascii?Q?HyL1I+ejTzNX9R3kRYjp8kaRnKVY+kmx1diiGHvn8vW9O7mAd2q8UT3yxzYi?=
 =?us-ascii?Q?urcf4BkmN16BZw5L99q5Vq6iVQRgU58BksP7CClD6jxyGVRFzNdFwfJYdO7n?=
 =?us-ascii?Q?F52AQ+5A6hqGOjMyCcnwYlLe5OuPM2j2sWMWLxgJOwWOAJb0pgN48+DuNca2?=
 =?us-ascii?Q?Yv+5VZluFSOVQhuRO+0Yma2wh3rhHhMf6C0AKyypc9SG2un66BKX7eibFo00?=
 =?us-ascii?Q?YbHSldOEt5x64ShYtRcg/G/EjqEABeF8mirPlagP4RirIq11FJZPvl0x1D1n?=
 =?us-ascii?Q?gdnue/gJwruQD4GrPBkCGiYAbFPlutHUkClZ9asgDZwAL55BwW0ac1islzqV?=
 =?us-ascii?Q?c4iN73k4d4RvOIeax0o71hH/u72j1bzchcvG960Sa6ntMcJniMc1B4knN5yW?=
 =?us-ascii?Q?eKi9LVnMHfc5CSOXtonGlQXpLzW2qHWB2Awl3DiSK6As3UWEHPUG86z79cbI?=
 =?us-ascii?Q?M5dzNISfl5slnh64kiXtHf6Kcmy76gsA66uhR9vauPcr044tdqxNKgcdXWHz?=
 =?us-ascii?Q?PHOH9wmbBuV/uqZ/9da56O4ulw2NaIsIxwK8TD/a61nKzjmFG1YVW/xjKr7M?=
 =?us-ascii?Q?JsrKdNXP56MCWOM7h8Z14O/1YUgnmevcUKRF3ebTa+otoCaa2IWgbHuHv/lg?=
 =?us-ascii?Q?6/9LCpJLwlTDgN6tUBwk3AQ4LkMhX4xpLyKXmyXWyIq83oU2LfHtQSJy/gws?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d327e19-d0f4-4464-c944-08dc71a74229
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:56.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPitt4rsU0l09X7QcscaCQjurfaIqdlOURttv11feJ7lThRB2HgvM1pJPSrPSNR5CCGCCKz1wUE5kXlJ5YYKgxTpg+HHOKKrCO4KiwI4Vog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

In multi-cluster MIPS I6500 systems we have a GIC in each cluster, each
with its own counter. When a cluster powers up the counter will be
stopped, with the COUNTSTOP bit set in the GIC_CONFIG register.

In single cluster systems it has been fine for us to clear COUNTSTOP
once in gic_clocksource_of_init() in order to start the counter, since
with only one cluster we know that we won't be resetting that cluster's
GIC at any point (ignoring suspend/resume cycles which would need to
handle clearing COUNTSTOP in the resume path). Once we support
multi-cluster systems this will only have started the counter in the
boot cluster, and any CPUs in other clusters will find their counter
stopped which will break the GIC clock_event_device.

Resolve this by having CPUs clear the COUNTSTOP bit when they come
online, using the existing gic_starting_cpu() CPU hotplug callback. This
will allow CPUs in secondary clusters to ensure that the cluster's GIC
counter is running as expected.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 drivers/clocksource/mips-gic-timer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index ebf308916fb1..4d7659c119e1 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -114,6 +114,9 @@ static void gic_update_frequency(void *data)
 
 static int gic_starting_cpu(unsigned int cpu)
 {
+	/* Ensure the GIC counter is running */
+	clear_gic_config(GIC_CONFIG_COUNTSTOP);
+
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
 }
@@ -284,9 +287,6 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 			pr_warn("Unable to register clock notifier\n");
 	}
 
-	/* And finally start the counter */
-	clear_gic_config(GIC_CONFIG_COUNTSTOP);
-
 	/*
 	 * It's safe to use the MIPS GIC timer as a sched clock source only if
 	 * its ticks are stable, which is true on either the platforms with
-- 
2.25.1


