Return-Path: <linux-mips+bounces-3220-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27B8C30A3
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C5EC1C20915
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693A556771;
	Sat, 11 May 2024 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="HaWlBnNi"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C056444;
	Sat, 11 May 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424241; cv=fail; b=HD/jEPB73hOfUxnTg+vnMSjS7tr96+Ot6ZIO3BzAVDhgdSYYJ7aXwR2jQax/wR+glV/a5hX4UAnuZV/KBaqpJeDhpdaDmMHRaHhssvO+/ofNVUCPdPHcGG7WOarv/qomn9nTUpMIwpdTLbpp0K8tKd2QkmrF/sxS7csYedz6DoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424241; c=relaxed/simple;
	bh=V+up9kRDIyYiKB0Gj4PBrv98qGZNgLPOeQDg0TdoqIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kKVVv5HNaWg8f3a+2qDJATje6vSMClWcgyLxFndAdIQE2FKvZCRwugUEDzmHvZpcKprc0tRozur/fsj0ParaJljSjbY9+DQoyqawR4fS2KavJvCcb/m0LoTbjkGCsdtmIR7qB4rJyDWRaNCSEVunTjT+DMU/XtZHj08AwyN+phY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=HaWlBnNi; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPWwfgnn5IGEQMfa/qf48B/kxdvryoleuTBr0kbm4FN31s02cSWuzQKF55sWTU/tmQ4rAoNDaKx50Xl7qlBAQ1Z2PBuuA+czQYD6F0GeZNzFG21Gl3EXfr7mFS+65g2m5xbIceamBuuOjUbFVs/SFMrWDAnHX9DpPmtZnU5IamDapPAOZL3SZ3yNMJibxecLHJ02zrLnWXGKtS9q/GNAatZLLm/Rl+q2XRji1vzL8MVJ8u+XaedAs5PkWLccqlH3hSJkaEWPTRZcN1Vo92sPuGeHkc95oUlDcVJEH6wogyYSDSB0PGdFYEqtOn0MJsz419H2vcjB1wQ2Ez5V/88AxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38E6eM+S/5PuGgIFZvPuBnf0H+1kJD3Y+e8qzqv2r1s=;
 b=BZWiRYagBMf8aojqv/9w2sr8tkPKExaenaEB3e8EMYh9g6tsjLCABHh8ADmo2BbRL38lwVptKqsRvRYc8H2tEkW4saTTy5p7pciqpfLMsV0f4S5s08766ZhrTpdYpj07teOjS1B4l3s/xmWIDqVsMHmykx4EK+MaZ1NefgqIRuBZYWqK0Y3e5K+EabZwS5LHWbiHrAF3BpdEn5ZaUwVXXvM+LGstaMKut6Xln2rcM37IP8+rRuL9a0PMZQaQEoFTHVNUwkMiGdlIX4/idxj922oJ0duGTkD6C/ILFRHWt9WGGIhqCKAcMsWFsixegbTx/rS6X5FCoDQ8dmobgSe6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38E6eM+S/5PuGgIFZvPuBnf0H+1kJD3Y+e8qzqv2r1s=;
 b=HaWlBnNi9ASIb0bYAC52LacOnzcPbk1QcUEL0TXAQ3eUfvlofjr0xzAosYIMt7eytbScw3WGlm1fFPHrA6f+XqjM9edtDe+VuuBhnGKQ56Tbf5h7T/B9YHT8GHjKxLVtlemEa7lyv7RnkpHKJbgkzZRh/pBxjgdPO0Y748kpugw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:53 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:53 +0000
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
Subject: [PATCH v4 05/14] irqchip: mips-gic: Setup defaults in each cluster
Date: Sat, 11 May 2024 12:43:32 +0200
Message-Id: <20240511104341.151550-6-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 24ecd299-eb87-4122-6ee5-08dc71a74074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QgIp444PTTWyQBhuNgVlfULe6nK2Jo45qMR8i2n8d9nPKld2oW1A6kq4YpV2?=
 =?us-ascii?Q?kaAY7M1AI2ZW2NO/LNheKUpkQP6klFpozIrsi7KpTSQ0WrhiR+6oa58/faf0?=
 =?us-ascii?Q?5VdXY36xSMcgDQ2EY1s79xNaa3PzWVqfaO07S/8i/TE8v+Sm0BY7SEwebumQ?=
 =?us-ascii?Q?Y1iDCWCXMJ6hEdRtmZ8xWxy7frpuGLoORTua2XuR7jksfh+LzBXzIbJ76JVO?=
 =?us-ascii?Q?agLNT0hIkLnXaNH/sVXUqaKkAzyUwSooiZHgysVA6CltInZUoJaZjeGu7Gcq?=
 =?us-ascii?Q?R6i8YlwkZJxr3XIXs8D+0AnGS4y2AhjXRl8UKVfZVKY9YgZJnI7xrtLlOQUM?=
 =?us-ascii?Q?RygXVLe5wuuNm0LN+4am13ydKqFDfALTPgf6SWgG3cHWXo8Mx0zDPYbHUQJ+?=
 =?us-ascii?Q?DD0hRL/5DvDJoPepol2eZHzEPb6J32e/dNIAoAgerMkB88kY1czFGrTtZv2M?=
 =?us-ascii?Q?8KaurfueSuUyvxEUDNWqHOJey5ra3/zgMJRVECqWRcvmcxWAG3feW09NS3Qi?=
 =?us-ascii?Q?vNpzBamE0x5jwgJNLbYjJnLMT3uzXQi31Q8y4Nc0qdyFkRQLExnNp7UM2gd3?=
 =?us-ascii?Q?qO4d/LrjXLmRDn+nHFdo7juha968nysMVkG6N8P7nZdOCHN2T+ztAVlds/ZX?=
 =?us-ascii?Q?VwHnwew31qU2rV2sFO/MsFcvHW7A8NXgnXlqCksL3cB1oreqiw84rWrfcK5d?=
 =?us-ascii?Q?3P1WMoIasMw/28lCbXh94o4BsxfXeAK1SOPkSCiL22lDCWHjqszztnyRjBE6?=
 =?us-ascii?Q?GxY6Mn8DK0jKD+amJ1LgO5EDQkqyXfoCto8HJnMnCH6vUaUjtxiBtpWBG9a+?=
 =?us-ascii?Q?DxKyBz3183t3iKFTuBzTNvUnZeErJ1vcMUzDUArUUcEeF43r8QyS0+dNT/+W?=
 =?us-ascii?Q?FmyYupAae4oajmFiDRt5+YP3jIw2LNceD+yebNd6bOxcqT//PR618mfWNgt7?=
 =?us-ascii?Q?vXx+29uBGrJnpMTuh5yLjWo5Hb12sbCJ9f9Wr9t5FuGpGNwCTkqnzNyn3+1a?=
 =?us-ascii?Q?5ewNMzQ4UqehRsA7mtxYHg0WbS6t57CYGdRi0t+i7t0mt/bZ4vIS/LqZQ0U+?=
 =?us-ascii?Q?FhljpbhePuT6h7lInxLdV3VwjYsgf5u/eoX2gkoDDtKMcKUOiiwmdJXZmsUC?=
 =?us-ascii?Q?3paMo6E7T6HSgbRse5GgB6EeGztT0euOxl5Y4mWH9YQ1zf/Nv/dQ//DGmLxw?=
 =?us-ascii?Q?XOHF+sF4VvjrMfqqtelQQuCfj+hZvYRE7loMenfmJIqpklcwmNeKEozHhXqa?=
 =?us-ascii?Q?zY0xPozi5I8Yn1tM3N9zf46808d962ods0TN946mIUOjOGRz7PfjQeYF8/8C?=
 =?us-ascii?Q?5h3wxxuF8S65rhK4dP3oO9DWmjcDo43YOf/x8tj+ftqGOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jSvjFFkB36GxMI+cyPBaMEseydDVphh5JaBLO9XJ7lBxMESV8EN/lLssDkF/?=
 =?us-ascii?Q?3yoH48Q2agWZ6P5ycmuaEnt5Hh1WOD4dLfoWkhRl9Y+M9Nd7r9Sjn6rmT5mV?=
 =?us-ascii?Q?TTtWpyoZfzCY8qB0U6cdmnAkXiFd/vejkw82M8eqOhvj09PyU4lQCtRP9la6?=
 =?us-ascii?Q?GNjAqSCxFMwb7mEZH9GfL1P6/dCv99qdPFEG/0gcy+LHwYllHhjtTu+PjxJt?=
 =?us-ascii?Q?sDPd3yf2Qia3kFeXamNoAv8OAkLKVEBSLKi6hGLkaMCWQff/58UBdm/JB5Yx?=
 =?us-ascii?Q?0sP6kAGlYyVLUB4Kw/EV24HaDSGk8xkSlc9mFN67O6j5IjjjzZ8ahOu9rJO5?=
 =?us-ascii?Q?KE3s9kCktXwBN9zeF2JQsxEV5/Tt07ZoxYy93H2+jNa3KdNgY8JCCAfF+QnJ?=
 =?us-ascii?Q?QTbx0C2IVmzm2BQTDqHtwaFF8UIe6KMPLMdEbhBFB0gxqbrMx1rZW0cvXyDv?=
 =?us-ascii?Q?4HAh0P5L4nink7mIGmjir3/uzM0kky6C6ScuHfhkGjK/+L2kHDHBOjJbr9ze?=
 =?us-ascii?Q?2Omqx/aGS1mJFubhAnnILWL0OiJ0+YnAp/t/dvo0tUaTfhPvLfOHmqFELWTZ?=
 =?us-ascii?Q?A5PM393upYJ+lpJmQqHWsQ8/Ms0nkUhEVTCbpiXEuOGA5B6+58vO7hagh/fO?=
 =?us-ascii?Q?JuvhJd3vxhT2dWBYE/t0lRU0Zd4zA2jHuN53EEvVIZooqVxBoqc+eSUQKAUQ?=
 =?us-ascii?Q?Clp/gZ8++eztepA1zZecyVix1caWnwOcvRsjJkEHEEKwIZoIs5+nV9OglRV3?=
 =?us-ascii?Q?erWDq4BJgnB4RZLqBahgJnatT5vURd47kIqPgFS20ORjkBzhAAUCO/sb+bvU?=
 =?us-ascii?Q?7/5EYU2wqs1O+/1fqTZN3m/pySFuB4W84uSK7Bt+glYsOXOF7qnLTV2gRxW+?=
 =?us-ascii?Q?gi9MHD8RbEOYzzo3TWJucO+GDsEpk3F2CYWVUlcxSQXByvcW8w+NWSvN3Y3y?=
 =?us-ascii?Q?ub5zDV5kczWl77z2ochGX9fSV1aPNv7FF8St8MpXxolx41K7PeJ2qFdQmYN2?=
 =?us-ascii?Q?ipbMfK01WMTtc0dgwOJOiyLN++fkoXi4mErNw9AK/pwiJed8ACFNlTrPeHcV?=
 =?us-ascii?Q?dm72gv049WI9+uFGSUidYhcSpV5VVKGzb8Uu+RgD0253g1m/qQMRo8WETh6E?=
 =?us-ascii?Q?DqlVnzDZUcjven7v0DLwrOCihmQk8+pBPD+Aqtu/hMevKyv+yMSolP++tbW2?=
 =?us-ascii?Q?YV+o7Jxcd3lwQgcCQkWU3gRaXMCQl01NDctLsx5cXhf4L7srGdAdUt6VuFok?=
 =?us-ascii?Q?GUICM+HLrupcVkpG4XJz66mpyQx5P8c3wN9B4HNmJblk0+ZSruG0dbzXCgl6?=
 =?us-ascii?Q?eeOCtC068NYAUyCns2+q9mVaT/dXxP9shpQFYmLovwVrxSN1RD/cHC80pOCv?=
 =?us-ascii?Q?JdLSjy20hMZ6iKIYcFdxsRaTmwfVOGpkC9z/TAiLIstpdw3vmQv5jCElXrVb?=
 =?us-ascii?Q?9LAMtyKvqXa+6KCpTP6kk4EoI9jBLgza2IjD0jo5TfGjztyiXQ54zm43+UmF?=
 =?us-ascii?Q?nUVwzbQ/6I3V8oJJXuX+13w2gLxUSelGZuFdeDL/+T1stxDINrGgK6hKxzbg?=
 =?us-ascii?Q?hNwWCdw8ec84mkIiomvumorxaZdE85ptDf4QJGi3Iw92l/HpHFjdDyhGFNR/?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ecd299-eb87-4122-6ee5-08dc71a74074
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:53.5451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0qafwxkOLVdF/Bm/QPpZ5moOXJtjV//Vb6v6FRFXiSlCQ92Ood/ZPtCNeMGk3EXcO4uGgqHBYZtSxH6KQX4VdMvZ2d8AOcIcAwdvvU+2cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Chao-ying Fu <cfu@wavecomp.com>

In multi-cluster MIPS I6500 systems we have a GIC per cluster. The
default shared interrupt setup that we configure in gic_of_init() will
only apply to the GIC in the cluster containing the boot CPU, leaving
the GICs of other clusters unconfigured. Similarly configure other
clusters here.

Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 drivers/irqchip/irq-mips-gic.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 317ccc2593d1..cdd8973912a9 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -800,7 +800,7 @@ static int gic_cpu_startup(unsigned int cpu)
 static int __init gic_of_init(struct device_node *node,
 			      struct device_node *parent)
 {
-	unsigned int cpu_vec, i, gicconfig;
+	unsigned int cpu_vec, i, gicconfig, cl, nclusters;
 	unsigned long reserved;
 	phys_addr_t gic_base;
 	struct resource res;
@@ -881,11 +881,30 @@ static int __init gic_of_init(struct device_node *node,
 
 	board_bind_eic_interrupt = &gic_bind_eic_interrupt;
 
-	/* Setup defaults */
-	for (i = 0; i < gic_shared_intrs; i++) {
-		change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
-		change_gic_trig(i, GIC_TRIG_LEVEL);
-		write_gic_rmask(i);
+	/*
+	 * Initialise each cluster's GIC shared registers to sane default
+	 * values.
+	 * Otherwise, the IPI set up will be erased if we move code
+	 * to gic_cpu_startup for each cpu.
+	 */
+	nclusters = mips_cps_numclusters();
+	for (cl = 0; cl < nclusters; cl++) {
+		if (cl == cpu_cluster(&current_cpu_data)) {
+			for (i = 0; i < gic_shared_intrs; i++) {
+				change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
+				change_gic_trig(i, GIC_TRIG_LEVEL);
+				write_gic_rmask(i);
+			}
+		} else {
+			mips_cm_lock_other(cl, 0, 0,
+					   CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+			for (i = 0; i < gic_shared_intrs; i++) {
+				change_gic_redir_pol(i, GIC_POL_ACTIVE_HIGH);
+				change_gic_redir_trig(i, GIC_TRIG_LEVEL);
+				write_gic_redir_rmask(i);
+			}
+			mips_cm_unlock_other();
+		}
 	}
 
 	return cpuhp_setup_state(CPUHP_AP_IRQ_MIPS_GIC_STARTING,
-- 
2.25.1


