Return-Path: <linux-mips+bounces-3219-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B56398C30A2
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D86141C20C11
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039145674D;
	Sat, 11 May 2024 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="tCZgAalp"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2117.outbound.protection.outlook.com [40.107.241.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAA355E43;
	Sat, 11 May 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424240; cv=fail; b=DymTDSI66ukrYWa2vGJjJQDpg76NHNZkqQ0Q2nUCibztTPArP9rP9y4CUhX0b40SjnnpHwE1Nb511m9Nig9hh5M1ELfnU13T0t4/D9A/sCz5uVkScQZvSGO4TJMknavEZPOSVSVtciQqG6x8dumlJR8r/FK5TzxpQhnpvtDqAQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424240; c=relaxed/simple;
	bh=FSIZpMTbiJtEnIRlB4hA3CTffXKhjxE/vuxsjeCYGDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sYHu2t0NgAKBk2DJqj1faa80IiHHiBqlTi5G4U8iUpyhPlaPRPU3q7X37cNCz7gV8Ig7qArcC/Atw2al0sKBxJeAGbndgb+i5mPAjURFgycZo2qfKebqzQmbCwwGAy1qrrmUfv3ZsWULbwuU8I4QFF8RWLsIGOqGhScG7GJtcKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=tCZgAalp; arc=fail smtp.client-ip=40.107.241.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaLh2XFRHVKtFlbL2WbL9h9CnDgAOXhmkH7wjk+Kss/HY3HUYaeH7ljNbjBRpRsJDd6PRCDRSifbbvOTwjdcRyJ7bY4kkOUqsgRNfTYXjC+Yur4mzZvKE598iHQ7A/HELx4Ie8grpsZbEzvLaoFatA5+62FsyW/1PmF/s3+2wGkmPXAbTmdtOi2121qK873NTVhh8TWS/1TFGfiE9RF61tnB4CDSrg9Z34p0jIWWNzgEVCVA8yp67uZf+/ifszwkvlUUM4gYgCmVYUgetJcPI+Nd5KGfX6kpBhYsYzb6u+c+bfTmFGZfQiXmnn+Md5Xj/eJJEIXzCcxIKsnEsAFcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zivLEPzK2yPb03tjtLC8DJTk3RiZnwMaBX5KORprkw0=;
 b=oZmQSJ1PlPsY75AK42f2WlgRlL2ou0cdGlMS7zX8VKLXE+OdUwfEf1SLeDXsoKYBB5ICHXvbob0B7WUo0kEg/3p7hM0ozazbTE/kwMUpwXZnslLUQ+Bx2MnX7mrQw79O3k1xC8qpkihYT21qyBPMNb6d5PKZSrvSJgBIUZ/+qgUj5Q4bvQ0r1BSvjLPalr1noU9iaW3vqLb7ZHvpRiCiaNZ1dh7VEpK/ViCHbPtSWSOSsk4LigBArCCtTiSWsybyxeqpeZWCrdSEA92XnfW06kWZ0FEuLuRLuWBavNtCzb6keg+DJLTFT5brisWVMtJXKjg4853lXa4qHSxbXb27Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zivLEPzK2yPb03tjtLC8DJTk3RiZnwMaBX5KORprkw0=;
 b=tCZgAalpX1OOxb4m54n5EUu63fGrfuaD0l7yqcgd7S14oYkmFvJaS4IpGIm/qoy/OvVkF/YiaqL1/NMtY8Lq3LDKFwM/D/uu17YHy1YUgFc+Kmfvo0LXWDeM/ZOp5t9v2txhFn7QylceTyAMbT8v1KEhi3GoGl4EVuoiM5lhAVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:52 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:52 +0000
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
Subject: [PATCH v4 04/14] irqchip: mips-gic: Support multi-cluster in for_each_online_cpu_gic()
Date: Sat, 11 May 2024 12:43:31 +0200
Message-Id: <20240511104341.151550-5-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 13cc836a-64c5-44ec-51b1-08dc71a73fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q6IGOrsl8xLyOnyyE8WWZd0tuzYc+wDqr6tUKnQpu2BAZHyd1VOKrzlknWWj?=
 =?us-ascii?Q?4GTsB2GR5a8T9P67h93UP6TWznRSG0VXdCdfKdVExtiMSbGltS/YjEK1bvW8?=
 =?us-ascii?Q?1AZtufc5Twa/YP2R2visBo2Tqb4qIsjcw0z/Mp+MS3rk7c8WWJ5hShlPD9ar?=
 =?us-ascii?Q?TDgt/DI3L/RAGrDHVbZnHbZdEQbspBh4fhuijXpW1+CiKWzqQzjWsGwd4Mtq?=
 =?us-ascii?Q?J2zEGLW2XLPOZrwh3NiNcQ/8KvREdW5u+OXe792eQ/rnjSyV3nCRfjergvHq?=
 =?us-ascii?Q?jEsjyqL+ufA+KceJGzr8QpfMegYQ+VtYSKzbHyFNWMJooOTyM100gTYYCnZH?=
 =?us-ascii?Q?xchUUi8e9H7OMR3spzr/z2B7dZZuxR8/h7FTCwrQZMpSd1xnFUWvJ2GdsGqs?=
 =?us-ascii?Q?SjNXqmx0waEP8duYVd5p8cowCuNB80yx9ITFheoxr6NtPqVg/K/kZPoyzffe?=
 =?us-ascii?Q?dF4iV67XD0Mq3MNGzOikcCsTqf7SSk6AOl53JSOwVBzw91XiikY3aQWbE3/x?=
 =?us-ascii?Q?uIGPa8kwsPxvd+YH/v9FwdVSV4KkGP8RABPV2p6GflQkgRxSVcpB0n57W9Nc?=
 =?us-ascii?Q?VZx1wHsHuS6tg65NCa6WcEHNzcCfQnhop/0eh2aD0wideUxQm8gzTMoSerpI?=
 =?us-ascii?Q?wv4+Y/mz56z7k9ZZLz6T2GfniRW+Oz/y5gT56piKMNfMMxTIfT8pdBS4C+dU?=
 =?us-ascii?Q?pfg1UfhxEm1NAniRQzT2ZjvPRaRdSqqFtxkcDFLrhTGzYHQ52+xuu7bPfem4?=
 =?us-ascii?Q?63K4LPeZ3kGiOvLgBYj9V3EYSqfRiC8bw57SFZQ40KDW2qEaMrXsVUZ+ItQI?=
 =?us-ascii?Q?3qWMEqdnnAKdeWDl9tSOeN24UOci7aZ02nfKtu+ve8sfKZFr92+xEYqqk8OW?=
 =?us-ascii?Q?b4RzRBTciLArY4PoH4A+ApopaobC26BCej69Ep74h46sf5f4G0pGzfHcJter?=
 =?us-ascii?Q?+MLq6DvFwU+SkHp/lAVhDX9HEpdyiFb0co7xqPabYLx+T9lTYbUwGM5PM44d?=
 =?us-ascii?Q?LnDzwwW/DGh1AvN49t9nneeVu+SJUv2nzbVPfRVxdrtPx0q6yRCukCcmxKu6?=
 =?us-ascii?Q?O2sUR+t6fpZugbZTn7DmPzhu2AUox+m25AH+/s0vrvWPpKTQ77wMcG9W80Pf?=
 =?us-ascii?Q?kiF680HYOETocum5Lx9R56CIpFHKM471/MhYIGz2tL2wzsh7Dujz+X6od5rg?=
 =?us-ascii?Q?QEIz3dTfPqYbVC8WR+3p4ywLG+aYAvzXIHel63Md0c3SwvwBb8XQoPfS21if?=
 =?us-ascii?Q?/Mh3PFzkJ0hQEWvlWyd/B1F5M56tcOZagAOx3kXSCYCvpicM3Bf4bx9JS0KM?=
 =?us-ascii?Q?RwXIKxdfnTee6JCzjysErphlelvCvpv5R3kgYAaLW8fN9g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ey/OXwESgnjowZ8Dk6HHSE7IPTWJ5C+GRtwsOW7ttgXXfviFJEg8kQF4bfp8?=
 =?us-ascii?Q?Pc8K1oGPdQzE2Z3RPg2aN5Z/PWiDZNPm56S+oeDD1XQHI8c905bmolrTsHpI?=
 =?us-ascii?Q?Hf/u2Nev8e3+ixv25NMlda7u8ytxl9u4GG2HgbqbMqE0lsI4J3LiqzTu0Hjh?=
 =?us-ascii?Q?q5JhEUQe1pfi6jQ+4+u4/J1TBgTZCa9Nb4LIRy7T4ISUx+1R4er0YlBfVLMm?=
 =?us-ascii?Q?dsEIX2/0w1qE/lluw8I1fvpR0naTtXXAEWigjJeBCqC3ehBOUh9U8TS+Y0MC?=
 =?us-ascii?Q?EbOMUgplo3cRZhwswf6x4BIVJX1kAm70t6Cqx3mpImfwl75NV3RohfEVR7k2?=
 =?us-ascii?Q?rjPOt6XlULJ6I8TqIOl850zGF01fsxR2gotWVJXXw0gdVn47q+ARM1zidz0x?=
 =?us-ascii?Q?4MGDO31hxCKVXxkw+vRQS3JfV1+kBcsyZdDb7oK3ByFG7vnxEilonpB/Hph8?=
 =?us-ascii?Q?dcs5z1CSUZf0Arb2gokhJxRhaKfRNeC0ZM3QB/cBx2fMwCTl/uKK44VyHhJe?=
 =?us-ascii?Q?AtKuWwFy6YOuS3jyetvR308f2yJ1wY5IVhqwLnfGP+fYthcAx9WuJpITBaY3?=
 =?us-ascii?Q?ryJEa8oMRbCUTYHoTmKuhWGWqBm5MdODFYiSTNU06re8ISN0pTRbmul7Rj1b?=
 =?us-ascii?Q?2Mnfq2kRjAnufKjihbZOeTYHTiyapvdk6adQ8aOBUPoOUqzDbfcKtqxY3gKY?=
 =?us-ascii?Q?hI6J4rmQ3J0v0LLxSVdT5ZoIFSGDJYWYtGXU+92bMxZwr9pdnCTxeJCnL9gy?=
 =?us-ascii?Q?SPWbHdakJKW0VN7XOR3N4JZbup2/cZdlyEjEKIcelttQjI0XLw22XbbszUHY?=
 =?us-ascii?Q?7g5xL6Qm286f5NMNuDDUQMHz7S+GlNTf8ousEahzGuLWct3BjBs1j8ArDfTT?=
 =?us-ascii?Q?C36mcESxyf1OA5YIu2G199voiZzNGmDguzeWeZfvdHPRHggzXiIH+mhnT+JG?=
 =?us-ascii?Q?2u4A283zdW9CxOi74h58f0dkPYul9f3hCvUON4yZnM5tkk/IaCUU3Yfq8xvZ?=
 =?us-ascii?Q?bfL2kUrdtwEWK1PPgF8ZTUkhoScAlxXg3lyOIemGPx2W2GETvXdbBrAgA3/f?=
 =?us-ascii?Q?mVqepZigU8k3vTjQd18lNoXkRRif8N6UTfwfo8V2RSlFphgjE8f+HIgLn5mM?=
 =?us-ascii?Q?qyFgOnYR8fn0w1zPWD8y8yVLkDrv2/LWu+pm3iNN/+FZ6gvayoE0SiWsWzFx?=
 =?us-ascii?Q?18aKNanR5TNr483eYGn7fctpTwleK5We1Lmq782aTTTwKDdr9oTMbNAbeByu?=
 =?us-ascii?Q?/pzrjBUK4ICxtH1UswF8PgY1tahuJ28b/Hc5nOJvccdakYMriAuciQG5+1YE?=
 =?us-ascii?Q?Jc1k/SxzCTWoxn4ZEcSXyC8CyHw4z0HYdbROaQRmEz0KalW2xP8/Do//hJAc?=
 =?us-ascii?Q?WAxP3sMVKXrQ6Xq1Jaa4h6oWDlIUQMH1mT9Bja6Y3SS9M5+kA0I0HxhN/Q2i?=
 =?us-ascii?Q?1TZnGaGlkbK2vgIPgBbZDAl8pgr56IUd+rnkaZlD2AAK7KefA5sfOoKbbYC5?=
 =?us-ascii?Q?oCmjbWSaYELg0sJd36pXNdqaXIOEkCjyIp2VtZSUll68xHOTZtBy+wZLI7hu?=
 =?us-ascii?Q?8TdBk8MoRGkgs82fgDV+JN23rnMLe+y1ICgnUgPig855D/s0d0jGtkAj9QaF?=
 =?us-ascii?Q?tw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cc836a-64c5-44ec-51b1-08dc71a73fe2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:52.5817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhI1qYa7YF8aYUrfLTugBbKavtAz9aqI9z6zArGsONiBSTj7y/0qWcCnHRq75IAoASHfJXJyqoBKku7nkQxYriIkXsRvp+PB4m813q0dcgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

Introduce support for multi-cluster GIC register access in
__gic_with_next_online_cpu(), and therefore in its user
for_each_online_cpu_gic(). We access registers in remote clusters
using the CM's GCR_CL_REDIRECT register, and so here we delegate
to mips_cm_lock_other() in order to configure this access.

With this done, users of gic_with_each_online_cpu() gain support
for multi-cluster with no further changes.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 drivers/irqchip/irq-mips-gic.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 9e7182150b5c..317ccc2593d1 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -70,6 +70,20 @@ static int __gic_with_next_online_cpu(int prev)
 {
 	unsigned int cpu;
 
+	/*
+	 * Unlock access to the previous CPU's GIC local register block.
+	 *
+	 * Delegate to the CM locking code in the multi-cluster case, since
+	 * other clusters can only be accessed using GCR_CL_REDIRECT.
+	 *
+	 * In the single cluster case we don't need to do anything; the caller
+	 * is responsible for maintaining gic_lock & nothing should be
+	 * expecting any particular value of GIC_VL_OTHER so we can leave it
+	 * as-is.
+	 */
+	if ((prev != -1) && mips_cps_multicluster_cpus())
+		mips_cm_unlock_other();
+
 	/* Discover the next online CPU */
 	cpu = cpumask_next(prev, cpu_online_mask);
 
@@ -80,10 +94,16 @@ static int __gic_with_next_online_cpu(int prev)
 	/*
 	 * Lock access to the next CPU's GIC local register block.
 	 *
+	 * Delegate to the CM locking code in the multi-cluster case, since
+	 * other clusters can only be accessed using GCR_CL_REDIRECT.
+	 *
 	 * In the single cluster case we simply set GIC_VL_OTHER. The caller
 	 * holds gic_lock so nothing can clobber the value we write.
 	 */
-	write_gic_vl_other(mips_cm_vp_id(cpu));
+	if (mips_cps_multicluster_cpus())
+		mips_cm_lock_other_cpu(cpu, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	else
+		write_gic_vl_other(mips_cm_vp_id(cpu));
 
 	return cpu;
 }
@@ -105,6 +125,9 @@ static inline void __lockdep_assert_held(raw_spinlock_t *gic_lock)
  *
  * The caller must hold gic_lock throughout the loop, such that GIC_VL_OTHER
  * cannot be clobbered.
+ *
+ * Please note that if you start a loop this way, it must be completed to the
+ * end, otherwise, GIC local register block will remain locked.
  */
 #define for_each_online_cpu_gic(cpu, gic_lock)		\
 	for (__lockdep_assert_held(gic_lock),		\
-- 
2.25.1


