Return-Path: <linux-mips+bounces-3224-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380BE8C30AB
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B32CB210D0
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A545FB8A;
	Sat, 11 May 2024 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="0WthayAN"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B391154278;
	Sat, 11 May 2024 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424245; cv=fail; b=Rr8P4tBWV4iX5ndaBXKxV7mJMeQS0uuAdwJShZzLaTFICJz3XatEkEbcw/pDB11FtSDPm2RLKV7l9o37oN6gjsVKcH+zaELZBzNw4TAlYxJo6CRTmm/m2cMfvN1wNErCRRcGdJEOfQvLQw701p17u4QIvx3C60JFqslhAKj/rNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424245; c=relaxed/simple;
	bh=0eQ2D7SqI3x3pkcdFxyKDWIBDFaIORLehudZLhTuHek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AMcM1ptGzV8O3rmdNbdul3qUku5TnvDlc3iKThvTWnA5vI7OWjq1tV5b9lKbLMS7hQGrDQ6vD1umxB6CxiqU1DaPl5bptGzJPKOFKpoz7tpVTdLKGov+bsI/lVq4QwHRfbSEPaqhTAMKsXO/mKBsdCyqoBU/WAct4go5sKgvs7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=0WthayAN; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3eO6zxqvLZ3P7NXaCsZDxgTzMBnKszyxvLyAFPxbbXsydz3nv1ET8Pa8v7XlZLxqKNgv4x6nEUrKrkQ57abw+qi63CNNtQm8Evsf9R7Pfzgtss96u59aucYtr/GUNfQ/q5JSIdkxwNoi5/9Khn5qP06rghhlKYsCi/pFCRsf7sO/Ue9hUWM8HJ0STfhKBKP6ji78Z6t+Jsjt5LgN+lovtaQJld+qichHvbSPsYnkBTrODL9V22LcuiV0NdFaENdETvoumfRe3CfuSKjbtos7oD5sDLaH6dILeKdluu8teUjaj2A5BXJUtZF6pWUvIDs6rN6UBielghDuALlbyOvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct2Cg0KG7EH/O+Dk8ak7pvWe7+OldfaueVSVk84gMb8=;
 b=S8lps4f8/0aZfezqUmBChYv/x1hhVdSK1bPeyBsdopeFKLq3EHChi0vTsO65g3/0PEFS9Imdvx46vANqVRyZx8oz47MJ10373GrBmIQgyGHJi9ddsCUOPk/xSKIbq3hcFkwxNvaNbKKNyLXUem/FJM4cFJwN8frkEFZrzkGAIJmsU+NrQdegdYc+xfqbKGNFa5DQ7nE0ma2i+YUCijqkY3KYndwIq2c5GjVxe8DZFM3umv053eI/tfXl43Rofgj4AFN124kai3SgCp/mCIuNs5hA66q6nIklv+xSfRrXua1FREm/SMQTr3fH7s7n+GVQWMHIY+YYzeI8Q+MYcip3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct2Cg0KG7EH/O+Dk8ak7pvWe7+OldfaueVSVk84gMb8=;
 b=0WthayANb46Ti2KuJkXxOUm6hV7L394wKnvYrNRhcZRHO1Oru495nRTWzDN5gjloc7a/822Vn6XcB3bs9p0Ruf6OVbdUuLGM+QYpOgoEM75AyNbTe0uA17tD1eka0oDkuYC6s37X8PWRBEe3f7odEJF/bv1BtMNRfSq3+78AkqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:57 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:57 +0000
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
Subject: [PATCH v4 09/14] MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
Date: Sat, 11 May 2024 12:43:36 +0200
Message-Id: <20240511104341.151550-10-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7fcdf014-855e-4889-54d9-08dc71a742ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iZ91aXeRDOV5zsNyg/eSbz8F2wH3M4if92UhNMw9b5zctsOhzQke/xDW4U3N?=
 =?us-ascii?Q?LhoTmr4NpdR2fX0N+vjdFIZjLSFrKXZm/3PVFGJJHIbA2yFXBS+5riXhO19C?=
 =?us-ascii?Q?Y3GKH7tcJwWOiLKuMOorcSut+yPqFby2ue0wKZcFF4xw08lrESkO2rGPRKFp?=
 =?us-ascii?Q?oeRHv11tRbPab9XIGa0c3ctMStdTTl3Vv+6N4TMxVWWJ2Y3MTXwxLBZ056wv?=
 =?us-ascii?Q?zZvPEElh34qutNtZ2TLsKBzS+bCKOMHJDjS70ts61NCpdna+8aRaReBPkpWu?=
 =?us-ascii?Q?ySwHJZ0xf3yxZQm6j4gmidz+0kxyekzAr0bWMJ44YrfBseaNWNTovbmvuHON?=
 =?us-ascii?Q?F3ntGSzVaDLVSEQiM1/uqbOT6gC6eheZpWon7gBBuySFADGymC4Qe8/br3D5?=
 =?us-ascii?Q?Ge9p5LJaPqonG8g1u9L0kwHxnit4fU5Wl1Ew0iE2LfuHxvmA245BTEsFTVdX?=
 =?us-ascii?Q?SkDPDZGzJSPZhBwbh4Z9JcwloGuH8ABnEv5FFg6Bi5XtJX7ImKA1/6kRILVc?=
 =?us-ascii?Q?m4jiy3scAr7fqnB6Lc5a/5+FpIxvfTz3nSjaO2V0gHJCoEXj7aNRP5WIrKnt?=
 =?us-ascii?Q?SBSvJzm/0fNLAuclMN7vStogMnEO+7ZrYFI6g4uQYeckGocHS1umiH//O+/E?=
 =?us-ascii?Q?fZVqh1bsrfN++cScjwLzYWu1eHtTe3l2d+JgkEIdYXJJsi8+dQERexNpdnPR?=
 =?us-ascii?Q?3j3UUv3q9ba1RcaKKcxVcgqDm+O1Pn/i10+JwmtABl60jtTvVvgJEgGCZB0Q?=
 =?us-ascii?Q?V8mjihouwpXme6ASeqzxDQqPG8wlP70JgLVRXUUo+BiYoFalsFbsR5KYRPad?=
 =?us-ascii?Q?P585HcMnxw+KYBtr03JGQe2v7uIJptxMMSC83dlrqGUGVc/8g1uv0MxKEvkE?=
 =?us-ascii?Q?xamuz0ls0BbUNTncQMcICeRC7TKuEhFKwWtReO/msvf82vOFrE6Qc+8z47/F?=
 =?us-ascii?Q?F1g4RJGfYHUZC8g+poqjilvKqlCTwIgpGZluviHRFP4lS1gIrSwk9hqRSuLK?=
 =?us-ascii?Q?yIXvwcupo2zI9f9jD889R9aQ1wcjxMkU2XlkdAgAOdj4Rvg/Tso1H6b+eE26?=
 =?us-ascii?Q?5s8EE+xBVRVNFIC4zDNta/oxk1cZt7PtHohrk5p+DYa0/JmmV9Ebx/LO8Lda?=
 =?us-ascii?Q?hz1AUxugZkXEaMZO26jmGJYpq2aG2UfuHTlpTxiENALjnvNgL4k2Z3BAXBFJ?=
 =?us-ascii?Q?/0DcIoDZmPHIdZXo5RlCjoALJGEtNtOeaXi5HQgYO2+1TUPJbGzRzeyufnOE?=
 =?us-ascii?Q?XRhYMkwcBP1kBttLWPrzPbbLsD14jsO6mqDUaBxIOO5AYxzAvadwd6NHmU8p?=
 =?us-ascii?Q?+2xXu5fxtwmML3OH6ffpKh/c9LUs+CQ99zR7EUz5xfiARA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6R/4RH6K04L3el6fUGLYv4FYz0wjkOlarP/s1/eVTw90O8BibI5ngJ2IjNHj?=
 =?us-ascii?Q?6wTwjzPdL1QEbku7cSoiPoQ339Evjuy2dvTcpPHWJGqhaN01Bd0lCpWGgosK?=
 =?us-ascii?Q?0STB8QiinrpWyX/z74vl94uRAj/aTLNT9R7vbwDj7fOJl7nHp36CD/Sl0F3m?=
 =?us-ascii?Q?JrjKz6/ElrNs835cPYlO6ZdbRKBc45jm+8S0R4V7VrWf7kxA6BJN4Cjvq/c4?=
 =?us-ascii?Q?IcwqdGp2VryunRmYx6w5FRakHGA4DxDBIb2wzPFtjuqGqT3jC0OmL+QHXH8f?=
 =?us-ascii?Q?wu9rvQWRNMNm1zlDlDiBVkAAhKg5l1R9/akWHfnrvEErCwYVQT7mtBmmg9X0?=
 =?us-ascii?Q?ue6abEKkOKvD5G8tGjeem4kwp2qCFmXcszawa7N+Z9uaS6LzMtFT9C3bdQoo?=
 =?us-ascii?Q?9ZsgWWkV1nnvhAY+x1/azBjUar/fNnZw2b2U7NXz1fLyNzmE+ePKTfp6si17?=
 =?us-ascii?Q?5BqlUVpTyVXeZZ7tMM7ubzrcqGQFiyC6weKvSo+jR815L46gq0Kb4o+2HEqc?=
 =?us-ascii?Q?LEbANmKS0ht5/MUI2SZh18r63UF9dJB1waK9hOpg5VXAeJ3naqOq4NhPvi+f?=
 =?us-ascii?Q?zfSLtLWR/Wm952/eJhiujKcJlv6bUAC9pscj+oZ84++B7+BiCdwk+tvwCdYS?=
 =?us-ascii?Q?ptY3oqMtcvdlAv0K6RWxyWuwq57qlg2+g708/eYALBHW6AnYFjW5HZnh6GfC?=
 =?us-ascii?Q?UXx+wnsFYZXDUn/4wdcA4x25KICZByqy4cp08ObaKsrzjUli0fd5GQzybWTB?=
 =?us-ascii?Q?rialWO3SY8w9VuW0g6bkYqwuwWMGqwNE6vRZFi2C4ZSEa08K0+qMuk6h8YOg?=
 =?us-ascii?Q?Fj9JcqP16HkvHeJtNlfFYvPfPzj3496n5t5KYHqwU8FRAqqCGeftMM3lbW/j?=
 =?us-ascii?Q?wO2K0xR5AYZYmmB8xCuHr8YcJGVVzjuomdPL1qK1D6ni8es0pGZxPH6aLmxK?=
 =?us-ascii?Q?VsNZYUklT+n7OdLHcOLDQNk8C11Y5JmfvOc5uorAThQbAiAZ1BkPtpjQTmng?=
 =?us-ascii?Q?xrypVYR+4Qy1pY6V33Yrm3XEcO/v4FW/rkHw7DEiurMn00/QCzeePEWuQiQn?=
 =?us-ascii?Q?YRab8va43MNkr0JPrNVyY3IMT5I1Zj47zlmL99jz0qKGFu36AOntR2R9wIxz?=
 =?us-ascii?Q?q0t4RvAY4BxDb/t01iIQZn+yymWuN3rBRCkgg6N0ZQLXu97W1eww3hxSbR/E?=
 =?us-ascii?Q?UKAfqJcGtHWArH9t2vya+OcUgj2A5HeCY4GQrVKwmgzqK3U2lhcyLFGSTL9C?=
 =?us-ascii?Q?DUHO0mAv2OO/RftF+93iYwuTWUS8kuDiJabGLmzPoz/jC7NVBzbg2FBnqsPf?=
 =?us-ascii?Q?yTcTSbPy2SmjMwETilT9xENTvIcDU68Wh+EcefMhxzhTNmZPjNJXDekmmGZE?=
 =?us-ascii?Q?3gTPo2B4+I5jnrEe7nhv866MMp5PdLDePkh8iQOvoyzNTQIA9QatweSMbIQP?=
 =?us-ascii?Q?JAYJPQqYwKsgeisF69Qbo3Ohey4aAboGfEVOiP868xThyLv7pVrNdII/2mGD?=
 =?us-ascii?Q?xtKnNgCvdKEyCXmkHhrN/nfc+RWkYxy3eZz5c0PTUzlZAnNs3FmdfFnokzbS?=
 =?us-ascii?Q?XY2O5HQc1zTEBhb0/h72BlJ0adhEXoN81373ll4yvoD7E8Otuafinbc6uMZN?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcdf014-855e-4889-54d9-08dc71a742ba
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:57.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+RmZhF1oAPFE70qHiHG80TEm1Kw7eN2DnSJZHQhiKvKqIQXbChsNyx/9V9Q9OcrBGcU5mC8jqtcbJZCjulCcjygt2OGLaQZWWtMfFKGFWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

The pm-cps code has up until now used per-CPU variables indexed by core,
rather than CPU number, in order to share data amongst sibling CPUs (ie.
VPs/threads in a core). This works fine for single cluster systems, but
with multi-cluster systems a core number is no longer unique in the
system, leading to sharing between CPUs that are not actually siblings.

Avoid this issue by using per-CPU variables as they are more generally
used - ie. access them using CPU numbers rather than core numbers.
Sharing between siblings is then accomplished by:
 - Assigning the same pointer to entries for each sibling CPU for the
   nc_asm_enter & ready_count variables, which allow this by virtue of
   being per-CPU pointers.

 - Indexing by the first CPU set in a CPUs cpu_sibling_map in the case
   of pm_barrier, for which we can't use the previous approach because
   the per-CPU variable is not a pointer.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 arch/mips/kernel/pm-cps.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index d09ca77e624d..9369a8dc385e 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -57,10 +57,7 @@ static DEFINE_PER_CPU_ALIGNED(u32*, ready_count);
 /* Indicates online CPUs coupled with the current CPU */
 static DEFINE_PER_CPU_ALIGNED(cpumask_t, online_coupled);
 
-/*
- * Used to synchronize entry to deep idle states. Actually per-core rather
- * than per-CPU.
- */
+/* Used to synchronize entry to deep idle states */
 static DEFINE_PER_CPU_ALIGNED(atomic_t, pm_barrier);
 
 /* Saved CPU state across the CPS_PM_POWER_GATED state */
@@ -112,9 +109,10 @@ int cps_pm_enter_state(enum cps_pm_state state)
 	cps_nc_entry_fn entry;
 	struct core_boot_config *core_cfg;
 	struct vpe_boot_config *vpe_cfg;
+	atomic_t *barrier;
 
 	/* Check that there is an entry function for this state */
-	entry = per_cpu(nc_asm_enter, core)[state];
+	entry = per_cpu(nc_asm_enter, cpu)[state];
 	if (!entry)
 		return -EINVAL;
 
@@ -150,7 +148,7 @@ int cps_pm_enter_state(enum cps_pm_state state)
 	smp_mb__after_atomic();
 
 	/* Create a non-coherent mapping of the core ready_count */
-	core_ready_count = per_cpu(ready_count, core);
+	core_ready_count = per_cpu(ready_count, cpu);
 	nc_addr = kmap_noncoherent(virt_to_page(core_ready_count),
 				   (unsigned long)core_ready_count);
 	nc_addr += ((unsigned long)core_ready_count & ~PAGE_MASK);
@@ -158,7 +156,8 @@ int cps_pm_enter_state(enum cps_pm_state state)
 
 	/* Ensure ready_count is zero-initialised before the assembly runs */
 	WRITE_ONCE(*nc_core_ready_count, 0);
-	coupled_barrier(&per_cpu(pm_barrier, core), online);
+	barrier = &per_cpu(pm_barrier, cpumask_first(&cpu_sibling_map[cpu]));
+	coupled_barrier(barrier, online);
 
 	/* Run the generated entry code */
 	left = entry(online, nc_core_ready_count);
@@ -629,12 +628,14 @@ static void *cps_gen_entry_code(unsigned cpu, enum cps_pm_state state)
 
 static int cps_pm_online_cpu(unsigned int cpu)
 {
-	enum cps_pm_state state;
-	unsigned core = cpu_core(&cpu_data[cpu]);
+	unsigned int sibling, core;
 	void *entry_fn, *core_rc;
+	enum cps_pm_state state;
+
+	core = cpu_core(&cpu_data[cpu]);
 
 	for (state = CPS_PM_NC_WAIT; state < CPS_PM_STATE_COUNT; state++) {
-		if (per_cpu(nc_asm_enter, core)[state])
+		if (per_cpu(nc_asm_enter, cpu)[state])
 			continue;
 		if (!test_bit(state, state_support))
 			continue;
@@ -646,16 +647,19 @@ static int cps_pm_online_cpu(unsigned int cpu)
 			clear_bit(state, state_support);
 		}
 
-		per_cpu(nc_asm_enter, core)[state] = entry_fn;
+		for_each_cpu(sibling, &cpu_sibling_map[cpu])
+			per_cpu(nc_asm_enter, sibling)[state] = entry_fn;
 	}
 
-	if (!per_cpu(ready_count, core)) {
+	if (!per_cpu(ready_count, cpu)) {
 		core_rc = kmalloc(sizeof(u32), GFP_KERNEL);
 		if (!core_rc) {
 			pr_err("Failed allocate core %u ready_count\n", core);
 			return -ENOMEM;
 		}
-		per_cpu(ready_count, core) = core_rc;
+
+		for_each_cpu(sibling, &cpu_sibling_map[cpu])
+			per_cpu(ready_count, sibling) = core_rc;
 	}
 
 	return 0;
-- 
2.25.1


