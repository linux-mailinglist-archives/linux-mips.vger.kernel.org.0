Return-Path: <linux-mips+bounces-3216-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C3D8C309C
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6EE281D45
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4708D54F91;
	Sat, 11 May 2024 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="La+Vw3Lw"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601265336F;
	Sat, 11 May 2024 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424237; cv=fail; b=mPVwM34VpsjDuczHaVX54WDdFUOB2nRKJv66/Z14IJD1oj3TtA7Twj4OpEqszJVJj9cPtO1EQXxfgs7F1jlRFKg2q3ABQB3s4RqiiFKw00XPn7720QjlHSuHs3wSJhbotxENe3zZdcsqV46C228xiB3fXcofF202eYTXEGG+WOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424237; c=relaxed/simple;
	bh=l0ulcs+vWTS3DGUrNH5gUx2dGc46FGSqNoEccldSWV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pJ8Tjz/c7beFtc12/Lk2b0mr3fzgu1ssx5kd1NFrnfvpt20faQj68fWVP6o4W5YWIKOP3aQmEG36FP7+1tmDNEUuWgukJq/MXkwPcBHP5AobIdz4kIoCkAVPN9KogIhL0jH5AeX6hZb80tKu5FoDbsGxaP0eACnDW76qpme4Qqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=La+Vw3Lw; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIIwT62J1CRTqbHSFO1j2PlVkLX0WAalVIDJHjxHdcqXftKom09JLvw4CEzLj+2VML9JH5cnbEGUp2rnfOVgVVsM0T5MJ8ivSeUrkTh1wBaBw1K7/Sdk65GdYLE8JH5iWd+906CAkcSZMr/9thNkTSckg+Tk8gFo5oZ/JJdsQ/0RpgPygIDhaVX7TA/hCewrqnlDv12259miet0PB8acbWhVeyK/SjLjaRmntDuN4zTIuv+5cInJhXaAKz7AmRo6beC7DgTqlkj5mmf9fWJxCNZLPsv3FbhENaOThBMazcyqKjyh1SgAMc6dr657fxjipVofUr6a+CRi1JN+0rUyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J441UACOmM+plHFUNs2UCVgRdvQT0qPnSeGsc/Q08Aw=;
 b=bF6j3Zeg4J+iefwMGvkvLwwfqsURIywb9lS1ynCIIvgqxxI5vzNEzqWfTcMCq0dvdfdeGWWosKCBroee791/2hOXj+vUnmStl4XUTwS1zl/R9QHJzSxkSkVp73f8J+cg6YWt9+uIsWgZ+rqMuMLwxhbO80O8VOIiC0+Y15PCeVfOCRAb3WSJ9PYIQ7/lkL9jvW6NREP3p2LTIU8VinTFST8IDENVQTZfYnIPLlSuP+vkSvT3tNHIgzMdVe15D8aVp5TBbMu055m8DJqHfws5DY9CTdlYMDoyBtzmj1MlSYXzR6uQrAGFl3C00z5yb6kywhsv6O+qyda0Thba6L3x7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J441UACOmM+plHFUNs2UCVgRdvQT0qPnSeGsc/Q08Aw=;
 b=La+Vw3Lwdc3gt3j0VZcfkopwxTplGxyLgYi6LL/wF9C0UMqk+/LB3SPNaa6Q1GkrL1jOS1hdWhfOy3PIZTItJqmhUtsIY2CYfeB+AHT8jeYopmvNLiJHIsExIehyNI+Zk+0AnPt+J4aDus71jJp7C64kwPwkDfuqjjOWW5jGu0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:50 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:50 +0000
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
Subject: [PATCH v4 02/14] MIPS: GIC: Generate redirect block accessors
Date: Sat, 11 May 2024 12:43:29 +0200
Message-Id: <20240511104341.151550-3-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 51756a92-7ff1-43b3-70a3-08dc71a73e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z+LkISxbY8VHj6Uk3K1jy15LhUh9hBdmpRY9dJyLVZs2EOq+fJ1k//UyMXyr?=
 =?us-ascii?Q?3958fdWkFACPiyGFDjQVZDnGztoY9kNz4B9MMbJZuVH8VB0P1RzMuR2MbYbo?=
 =?us-ascii?Q?/bmOPKHC6s//A+MimzPjQ7pmjUZx4Y7gdSpTvOpWP7V0icISkKY6xLvCPH8+?=
 =?us-ascii?Q?UY5ZpDOi0EgWVVxqh5pq3wzmkosZuhbPA34OJCQ+inhYjen5EEnMfhvGm/VP?=
 =?us-ascii?Q?LX516hL1kuEM7S9fAIm2f98+3DxPjx2SwTvzLPpiRhkkBWWflTdndrmfT67L?=
 =?us-ascii?Q?GEOYd1h0jCNeTKWkvc/ERuaTHJ3BYzMmLcblqGbRbATPpTjaAcQqyQ6FQcqF?=
 =?us-ascii?Q?0FU+apFwaEuPCXuvLxpkaewIMw4c7bxchXhWX1bYtf0shAVdBD1lwWzJIz8N?=
 =?us-ascii?Q?ZfOgqUVQnCv11X+YZn5pqfXKkwniLggggNBXtGm5NA8IuV4sTdX60ICu1ghH?=
 =?us-ascii?Q?c3JPm6C5PXJNe7hVgxLYrygj44ybfSJaY4O0P+qglSkrYfebTA7zcOsseeyt?=
 =?us-ascii?Q?5rh0q3LI+M1E28gdnJHH30eGOfvu3UQjtVpnm824oOUQ1BSYqU3iqPCWvLaR?=
 =?us-ascii?Q?+FiBG6kVH1BZciPDYvzJ1WrGcD8Riob/M4YPJPgaab8EOmOV9OFgXWyGuwsW?=
 =?us-ascii?Q?Z7AM4AemPVdEwEnEx/9A1P01izJYgbjsNZTQPin3eE4J8R/deuzJgxYTcKc8?=
 =?us-ascii?Q?ukvfMG8zl/gIY895W0HrwYDx/mG/+BRHeO2lYbjMnKgfhZzwedcsfoojw8+6?=
 =?us-ascii?Q?pMWlynh6IV4CHGcY6DZ1jvb8rll3HZ+ExgQ6g0XsT3UQnYqL9SfsPavvcWXF?=
 =?us-ascii?Q?aKG8oF2e9EEB1UYA12x06/sIkVcfhMgbT/xk8t1oD7+8D/l5ARNLdDu58XFL?=
 =?us-ascii?Q?D/Fv+2MLYXch6m/J25lcI7VUI2URuOhXq1E+CHbTr60G0223zOnE9L9NR61C?=
 =?us-ascii?Q?G7MRDIMUBX9ewQ2P8DnAWsAtPI/o8LFdxX56rhzTQ5PIFGGCQS976lo2RHKT?=
 =?us-ascii?Q?1ss6Rwog8aY6caqu5Gv7/4yQn0t4CUfOHEUYOqblG576+uXge+44FEWZloQW?=
 =?us-ascii?Q?fIN8Sh0xr5rFn1fN0CC4T4X0lENWu578ukXkGk3Qnlpt+6oyTbvLXo0RyRi1?=
 =?us-ascii?Q?WGLKaVBM3/ZQrHQ+RLVTFfvKulF25GhUHYC3BGxa4BTeNuqkUs06U66ClyPI?=
 =?us-ascii?Q?DPmtkhTlyU76/IurIN+K7x+bs9iTG2sPJpQnlVoj/0tqEAk0zaZnaw1c7/o1?=
 =?us-ascii?Q?/nqkY6O+/rJP7BjRfZJEHAAF26epDzM05gR8tN3ppi0ATPqiIjrmUIDY9ZtO?=
 =?us-ascii?Q?HXvwgIr1MNTCaxg5JptSqmYV9r398lHpe2rAZuWyMCcMaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UUXb9FGQWhIQUDfma9SZRSIZdEFZ7VmrD52y+Gx7pudZ2T4Sea361k2KgEQJ?=
 =?us-ascii?Q?+w1zRG7UbEYYIuE1sn2hl4SVX93lkv06wg30nCrSiwYwfQrjL4ehOW9oxApF?=
 =?us-ascii?Q?zjwovVVPEch64Spi13t7BJycSFz5ki+0dus/yIM9fM7a0Hc38COwK9H0IDdl?=
 =?us-ascii?Q?LwH3t65ssFHvf7W1f7bqGdL3fjz6ojxvJD5P+BbSYWTK0s+OGyzPdgG2x/r+?=
 =?us-ascii?Q?2hu8KdIZCsSA9P5cexiz8/Tuv8r9llBG3hls7MpUAnmRPkFzbEx1v4G9j2+n?=
 =?us-ascii?Q?jV9u0ZxAZdRQylK73wTCKnFJkhi2MnLHAL+zM+d3+RE6ZACY/+CGRu3aAest?=
 =?us-ascii?Q?DbR9/4K75pVU6Vn1JYVTGLqL27XZdXcdGcZST3HPUZRWEOo6cUHjAphJhHY/?=
 =?us-ascii?Q?EId49uQJs+KyaD1gMt4hMwbO1Z9ab1xst/1uktw1350C4AV3WbvYKfrlhI1R?=
 =?us-ascii?Q?hdZNXzWpnKbVrpvHnxTuGjm+OwyfOGQ9mr0olcfMqEK6xQG1gR7fguvLibrT?=
 =?us-ascii?Q?Iz7APj6JW5TulR+yurNZ+/Lf/6YRth1LKA1W4yLjOx7c0tlU1FzyCZWK3GlN?=
 =?us-ascii?Q?O5vORZpp0CLqfZnyIyIIhrfyzbquFv+EZWsHUCHDbpd5M6hUYXghqm007bHP?=
 =?us-ascii?Q?cImKWzM8mB48mCNzPUW2bQPqHZRHbkf2wdHWSd2ZuYmcYj3KF2tBlcCimpMx?=
 =?us-ascii?Q?4iWlpptLs4k1km2OzOHez8NP0pe109CENyExTiX+B5qe+gEh4oWmeZJoY9yf?=
 =?us-ascii?Q?IGumpHR8tfGzPL+9hT7KsRsnaAFhuweoS0B4Z1s1WMS9pVdk4Arg7F9yFSp7?=
 =?us-ascii?Q?BM1SW2Umz/LGPitJfV0OLb4nyjRRPIqfKjHSQ1gYEubYnVegO4N3pXbD/bxT?=
 =?us-ascii?Q?4QZucSi1uJq+CO8HOzQG1UB3lP0RiUzkIfcWH88A7pGqUAxKzAWp0h7dpygQ?=
 =?us-ascii?Q?Tzq+/7JI+bgCos7OxFoDZh37bXowCUoLzwvz57rDb/XtEn8vFmt5YEeplQz3?=
 =?us-ascii?Q?4oeu4W0ZvFWhxd5qi27nQbd/QEQtR9cqPXYvBlys6hHXZbAUv+aWiMI13hCR?=
 =?us-ascii?Q?I5c4i37A2ZJmRJTnc3cjSN3QyMUrkw7xmaqz959bRiDfxdj22d19+R1PiZQx?=
 =?us-ascii?Q?U+RhJ5DGfOtTOPurIvVHc/mTK0O6EP8f52hcEK53RYgkpzx5KskXH+MlPsjO?=
 =?us-ascii?Q?EZAg1d68Y1t0QJLAnyG0slwoeC3x6qWT17sFGnRw1rrcweJPte1FxPALHqmZ?=
 =?us-ascii?Q?todtQQ0FocoVkIq3ktiqDJKB6sqt2GMZZcZQTO24zRT7ZO3dsbn+KmN0Mxlv?=
 =?us-ascii?Q?Wd0vZcHeBRF9s87UiBX+8dyzKi5rxQszTgCa9+0GCsp30PouqievAEsyU397?=
 =?us-ascii?Q?y6Su7sryHBjQ9LEmypYL3CNSvKpHh2ggrm2eU3PchIlnS/Ae5pKvAHXdwjl3?=
 =?us-ascii?Q?DBk4qc35iP8GLpq4LfLoq2/8U7AVuhG2o+tilNWETIYwkgPnb6N56Wjo/meF?=
 =?us-ascii?Q?MdUzqaF6I59TU+FV4Fd5aWIJnbAoInoJ5v4uHPOAWtuEJe0+Yh+vX1yVHwGz?=
 =?us-ascii?Q?5btM7vmLiYt7xg5NEarQdYT8YupZK7PGHVBqUsa+r6irqx5MlmnFv1uaFBjJ?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51756a92-7ff1-43b3-70a3-08dc71a73e72
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:50.6741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5xiCgwIGGFM17toWaPWTLwZcKJYJJv2W7rs/Ji/fk/KljKyNIKEkm4jLVRQOIlD8hPBpqi6IF8vgL2u4YVdIJ4bXMOXbtZQ5HzXM94h0lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

With CM 3.5 the "core-other" register block evolves into the "redirect"
register block, which is capable of accessing not only the core local
registers of other cores but also the shared/global registers of other
clusters.

This patch generates accessor functions for shared/global registers
accessed via the redirect block, with "redir_" inserted after "gic_" in
their names. For example the accessor function:

  read_gic_config()

...accesses the GIC_CONFIG register of the GIC in the local cluster.
With this patch a new function:

  read_gic_redir_config()

...is added which accesses the GIC_CONFIG register of the GIC in
whichever cluster the GCR_CL_REDIRECT register is configured to access.

This mirrors the similar redirect block accessors already provided for
the CM & CPC.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 arch/mips/include/asm/mips-gic.h | 50 ++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 16 deletions(-)

diff --git a/arch/mips/include/asm/mips-gic.h b/arch/mips/include/asm/mips-gic.h
index 084cac1c5ea2..fd9da5e3beaa 100644
--- a/arch/mips/include/asm/mips-gic.h
+++ b/arch/mips/include/asm/mips-gic.h
@@ -28,11 +28,13 @@ extern void __iomem *mips_gic_base;
 
 /* For read-only shared registers */
 #define GIC_ACCESSOR_RO(sz, off, name)					\
-	CPS_ACCESSOR_RO(gic, sz, MIPS_GIC_SHARED_OFS + off, name)
+	CPS_ACCESSOR_RO(gic, sz, MIPS_GIC_SHARED_OFS + off, name)	\
+	CPS_ACCESSOR_RO(gic, sz, MIPS_GIC_REDIR_OFS + off, redir_##name)
 
 /* For read-write shared registers */
 #define GIC_ACCESSOR_RW(sz, off, name)					\
-	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_SHARED_OFS + off, name)
+	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_SHARED_OFS + off, name)	\
+	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_REDIR_OFS + off, redir_##name)
 
 /* For read-only local registers */
 #define GIC_VX_ACCESSOR_RO(sz, off, name)				\
@@ -45,7 +47,7 @@ extern void __iomem *mips_gic_base;
 	CPS_ACCESSOR_RW(gic, sz, MIPS_GIC_REDIR_OFS + off, vo_##name)
 
 /* For read-only shared per-interrupt registers */
-#define GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)			\
+#define _GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
 static inline void __iomem *addr_gic_##name(unsigned int intr)		\
 {									\
 	return mips_gic_base + (off) + (intr * (stride));		\
@@ -58,8 +60,8 @@ static inline unsigned int read_gic_##name(unsigned int intr)		\
 }
 
 /* For read-write shared per-interrupt registers */
-#define GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)			\
-	GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)			\
+#define _GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
 									\
 static inline void write_gic_##name(unsigned int intr,			\
 				    unsigned int val)			\
@@ -68,22 +70,30 @@ static inline void write_gic_##name(unsigned int intr,			\
 	__raw_writel(val, addr_gic_##name(intr));			\
 }
 
+#define GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)			\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off, stride, redir_##name)
+
+#define GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)			\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, off, stride, name)		\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off, stride, redir_##name)
+
 /* For read-only local per-interrupt registers */
 #define GIC_VX_ACCESSOR_RO_INTR_REG(sz, off, stride, name)		\
-	GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
 				 stride, vl_##name)			\
-	GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
+	_GIC_ACCESSOR_RO_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
 				 stride, vo_##name)
 
 /* For read-write local per-interrupt registers */
 #define GIC_VX_ACCESSOR_RW_INTR_REG(sz, off, stride, name)		\
-	GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_LOCAL_OFS + off,		\
 				 stride, vl_##name)			\
-	GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
+	_GIC_ACCESSOR_RW_INTR_REG(sz, MIPS_GIC_REDIR_OFS + off,		\
 				 stride, vo_##name)
 
 /* For read-only shared bit-per-interrupt registers */
-#define GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+#define _GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
 static inline void __iomem *addr_gic_##name(void)			\
 {									\
 	return mips_gic_base + (off);					\
@@ -106,8 +116,8 @@ static inline unsigned int read_gic_##name(unsigned int intr)		\
 }
 
 /* For read-write shared bit-per-interrupt registers */
-#define GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
-	GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+#define _GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
 									\
 static inline void write_gic_##name(unsigned int intr)			\
 {									\
@@ -146,6 +156,14 @@ static inline void change_gic_##name(unsigned int intr,			\
 	}								\
 }
 
+#define GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RO_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RO_INTR_BIT(MIPS_GIC_REDIR_OFS + off, redir_##name)
+
+#define GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RW_INTR_BIT(off, name)				\
+	_GIC_ACCESSOR_RW_INTR_BIT(MIPS_GIC_REDIR_OFS + off, redir_##name)
+
 /* For read-only local bit-per-interrupt registers */
 #define GIC_VX_ACCESSOR_RO_INTR_BIT(sz, off, name)			\
 	GIC_ACCESSOR_RO_INTR_BIT(sz, MIPS_GIC_LOCAL_OFS + off,		\
@@ -155,10 +173,10 @@ static inline void change_gic_##name(unsigned int intr,			\
 
 /* For read-write local bit-per-interrupt registers */
 #define GIC_VX_ACCESSOR_RW_INTR_BIT(sz, off, name)			\
-	GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_LOCAL_OFS + off,		\
-				 vl_##name)				\
-	GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_REDIR_OFS + off,		\
-				 vo_##name)
+	_GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_LOCAL_OFS + off,		\
+				  vl_##name)				\
+	_GIC_ACCESSOR_RW_INTR_BIT(sz, MIPS_GIC_REDIR_OFS + off,		\
+				  vo_##name)
 
 /* GIC_SH_CONFIG - Information about the GIC configuration */
 GIC_ACCESSOR_RW(32, 0x000, config)
-- 
2.25.1


