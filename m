Return-Path: <linux-mips+bounces-3218-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9018C309F
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC9761C20ABF
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6444D55E4F;
	Sat, 11 May 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="dFRthAr3"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784A854FAE;
	Sat, 11 May 2024 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424239; cv=fail; b=j0DYw2s+ltdUp24R/ljKLOZJ5KytVdReuZwNuT7koPbXgA2fi7e/+hPKvCsOuCM2N5q0Gduk2ayZMig66aeydlz8Yc4Snj3dV64beOiKyRe1RWED3VBHDkkga5DerKMs6t+hALYvTJQFSptYthl+4hT9yKpx73n6W5C701WxV1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424239; c=relaxed/simple;
	bh=TsoCr+HworydoxYpF2WjRxJ8ajnVwpNPFsc8PMwau6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UZoCH4u/ja4vgujccPx3+Dg9plWPvjMwESOsaMvLNUSwr/Sxp9V8Ul8b+58J1YLQmlIz8QhYmnHb0itkjsgrGHgpHPJ1PN98kIyQSLbxJWnemf2snSDiD/EYbthPcgzlxpCAuBwSahN48mDjgLyBUzQffGUbsATMMw2JJI++i1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=dFRthAr3; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daLjlw1uceMtm4wtVj1ex4/E4ohE0rnO3FHmxLdGaPVFVXLtJDHyhbvwqbSUeubCxh01wIqTMWCLTMXmPjI5VWeA7M7OchAU5dYbMHnChvFrQR/4ASouGloJP6n8cxYNjvpsOSwYH3z0VAB5ePS2UwMz6FPidi6DUWZa0837ExIfTbiR1dpizdYQ8NmKJatOrmP4XYeZkNNorxjMavZApwzV2Uws6L9yFTlRiFnedBNxco9vsRu5yxwWyumiH0ksDTBAdoX8aRtImHscbEA7LB3hrl7Pk7LBjFlZv3YPdqjPYnl1+yKAv2l5HNVfCdfHoC0tpknnsHRj2HEwzh8mgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L+xQIcU/M2AFE9gICKDEMemb0+dOzf9wEODUdS5KNo=;
 b=CDMeQbj0naKbr4ICP1p2EaelK0tJaOwfbOzlF7sic6++soba7uf3wwnhU2891ik6Owxl54hAUaSOqYeZ2ohdR9nAOu2YRz4lhOU28J6EYRykpkXtI/iCWMExTtrfMZtrQeb2HdHiT1XFlIrB+4LKQEA7ejeFfkSCuaTh3MqYX2+C9S9ige4ApGY7G3cBvisbOmHh0ITAH/65fLqdS6fdPT7PuMPqWb+60lVWsmduUttd4PmnSQIqrC2dthZ7NKJK+lMe3aA0ZAf8xaNNaq9O5jQBaD/1ZMSS846m/2bn/OCoQ+kQ0TjEsy+GjwEZYHc29x2G5y2/UgEC9Y5ylHhosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L+xQIcU/M2AFE9gICKDEMemb0+dOzf9wEODUdS5KNo=;
 b=dFRthAr3wBLi/XmUD4s0U3lhOCv4jF7tT5AwRtsl+nv/3O8Pph3iam+y8v4h0URh2rBqjueKkK4jKXE1sYH4cMc5+lGs1DnMDnc4Vka9BZ9QJru9wclTHfPYGX/YZjL4L7bRewTxXykHcjJk+zBflpSN9I7GVfC3SLuv4lIKEKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:51 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:51 +0000
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
Subject: [PATCH v4 03/14] irqchip: mips-gic: Introduce for_each_online_cpu_gic()
Date: Sat, 11 May 2024 12:43:30 +0200
Message-Id: <20240511104341.151550-4-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: b356cecf-4f6f-44da-2fa7-08dc71a73f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i1FtTLwbm3FICeSvZ8Ox7HPomZ8xW0tPpmBhLXeAim5o7jlcS/4M9dcnXFHZ?=
 =?us-ascii?Q?LfIKSafI810NTmS6lc2z6+KQxZddSL63ZPAZod/HAqwuZtGE0Ps6TTJCRtTi?=
 =?us-ascii?Q?8W8nE4NUb2hqEJ2o2I0yDOATnjgMu0/uonWFlYM4wmxv375OQU3uMD+JRG4O?=
 =?us-ascii?Q?dbSEomZspJzho2CC0ycwmtDHXhRY/BR9n/SJ5qsofKVAyZV6KQdYeQjkrZ3j?=
 =?us-ascii?Q?gxC/g1PJAVj/FCHvjTX3bIQDssrOp5x+T/IkPlg/dzDHf56y75/p2nWc5m7n?=
 =?us-ascii?Q?RdHw5tNddB+/n3xDDNDXht/qrh18CRkgXsy7esqw3a8kdq5zY2ay7BlPEcpV?=
 =?us-ascii?Q?Xf8KwmNq5w6tREDHEgHnRUc5amnwJ+w1SQvnav0e66BAXKHgMVBXHa6tp3r2?=
 =?us-ascii?Q?H4m2WCHopdNas13kqGkHzyhVfQPIeF/uXd3u+AnhVjtou5QEYehgISMEWMSP?=
 =?us-ascii?Q?GcCwbun2gGvhLYEgphzq6XFcTH0UOwkazkxqzZ8L8JuOxtX+fVi0MvSD/o5J?=
 =?us-ascii?Q?kyWolr0hHPTmwCGfYT8Rbgh12J+2hDS0GL/0IBufODyiPkciuWPGiwLXLfhH?=
 =?us-ascii?Q?79mocR7fSLuwVkKasKU6WC1WC/9e8wAimmP8lU4AbaKbbsh1UC5Mqb/XAYpM?=
 =?us-ascii?Q?SeHaGApv+K4Pnzoapmnt+iYpT3+grHeSPMScBB1goD/a079Mx5d99RBStC31?=
 =?us-ascii?Q?Fj5q+RKL+PAacjUD2nl6OAhzigQNnZvXMkW51bcZoC2Wfx7KbOEpE+mUGlBG?=
 =?us-ascii?Q?jtQ5g7XVJv7TmeftyXb2cT5duuTlFrbq9IvjDoKJmnGVMGCHksdPk/LjogY2?=
 =?us-ascii?Q?KS8kSFzTrl6YrVc6mpq3qNo+RSs7juwmWHjCn1Q9d3eQzBm4i1WskXfXS9a1?=
 =?us-ascii?Q?g+tYQOrhx1wmm3HWsBb4j5nzqfaQzjy7I1ef6OxmefQpGiYL9GgKBv4dt3Y3?=
 =?us-ascii?Q?SpIP+Dwcr0f2mhVLrvJqFWji51dl+Cedt3nG5tMr2d6V/KfsM3XzT4mPw3Kr?=
 =?us-ascii?Q?YD9/1JZn0yGo/Rqlyk6AiLOmFI+6nM63TIyRgNPA99IQCzWgYXyUerH64M9H?=
 =?us-ascii?Q?AwECjp5rFtEoGi/CjywRh+are4WCBJv6mGtwgFrREQ4yiPVuVeJAyGTur1d0?=
 =?us-ascii?Q?Yap+klifuwLDRpoWuVwfml9/8NJM4D+3/4EWM4laIEXk8NNM5gUVk1VGOgWr?=
 =?us-ascii?Q?bNfw6C8T4RlKjbZZrDYErc7/ZjUMFuK3LRDAhni5CuYEFYGzMApS06dmP6cs?=
 =?us-ascii?Q?4/z5QfwpFHTPJ/j62b8xy50tlkK/4I8sjmh33Ubt4Ko6LnSgs4v74h8NtlZx?=
 =?us-ascii?Q?fT/r8Vn8InqU42VI8ENFYZ51sp1dleAoknmMzMkhd7mARQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p+vjugfid74tt17U7GD562DiD3MnIGzuBUhKD+fWFzRKPJ+PqFR8tvwSivBF?=
 =?us-ascii?Q?BolPbJt55r1riFT80kavFVaKXMN3ZZcVzeHOhCPVf+i4M5rmYxNl5NQAhMtE?=
 =?us-ascii?Q?jdHvTQcRLvMXQU/vsqSlfR4OqdAPoHOFRj/4vipnTiQOR7u31cmdMkxSKh8o?=
 =?us-ascii?Q?CcqWr53sex7dYFuX3QDgi/82DhugSX92zB8ssCEKa+FigFplywnMJ95TYSAz?=
 =?us-ascii?Q?ssFwQMqWNMyBGO/e6GM7wkvSAhhHsOR1o2Id4YiTl/DisQgi7OiauMEfVjsI?=
 =?us-ascii?Q?erDigJJBl3gbYK44Fy6kRQRyZU8MVH2mJFppU+hvk8t6GiEOnP7NskNgl9Da?=
 =?us-ascii?Q?fbjW1+XSXf2nHZlOaWLw/pz23kvtcb2qCoGFj4teNw3AWKtdhcod85TWuPOh?=
 =?us-ascii?Q?dhu+CERH45uX0VV1/HYAPYmAHxx8TuKhIPBSNZC6acsBoXAMUbSYROgBl7yL?=
 =?us-ascii?Q?Qknt/nS+jHrtSw5rpJOun03hFobnI47D19cLJUGam6UkZ1jrAvQOK3slr8NK?=
 =?us-ascii?Q?9SIGdSgGOu6XR+4l4h12R4tUw2zCat1tzdqFHEmQJ+el7QyF9r3S5ykLI3yW?=
 =?us-ascii?Q?Y4W4EHkh4HflSM9lCk5AsLedYyLpEQ/IM2xQT25GecwySZWSz1VKjLJRKLZh?=
 =?us-ascii?Q?jdEXCSz9J/59C7RGiqJeQ3qHe1Rgqi18z0dj/ojDjM/m4BVVN2cUl3KBIHbo?=
 =?us-ascii?Q?dPaLEaz7Ujvm6au7eLn0QtCLsFOGZ/sz6h0j1cFPMd5jrJVRvUEzXf+eEzxK?=
 =?us-ascii?Q?U0tty9jrh3b5ngHKkAi6E6rM/uQUhvSk5Kenu23ApxHn1RVt7R/BuhIhQS5s?=
 =?us-ascii?Q?EgPbY2wU/5iVw/+kcCrVF++VBlgySmpdTlqpMojCOGy8UV906QFJqI/t3KyI?=
 =?us-ascii?Q?240rmXFFnzG8G2xV8FfUsdLK0ehAY3Hlp8H8VfavJR7wO06aYiw1/Xlys9Uu?=
 =?us-ascii?Q?SAoKMRfqJM9R7ihrIGXCW7nq8PINt+aBpHZuDkajIghHcCaG+eiIEa5RUcLj?=
 =?us-ascii?Q?oIYLregC2Q4MJS79+SaZ097JIpH+eUJTwFf4rtSUtPhAj3d+wsRn53L0Oj7t?=
 =?us-ascii?Q?BTC/dxh7nMtRf3mCl4i+be6320+h6/EgVfcgldkT2FuCs8GXyHMf+w9iwy/U?=
 =?us-ascii?Q?DYfdM+WKu9O4a0VFAYzWpL+tzrStKpiWvrIW1x2HevFxLyQN0XLTOP/SNBWf?=
 =?us-ascii?Q?1MjaATrS1yNK18BdAEg2I21cQdTw7g4pLD0R6fG8taD4GtVX94bEbyW4z5Qg?=
 =?us-ascii?Q?em9NnYayLT0QI04uVptggsvVCnFJcC0mJ1e1FaVdB/IUm24HoO2f0ecJ2WaT?=
 =?us-ascii?Q?5WvKwbu1b8mwJjwi+BAgsW+5pbbsAc62fonao32hMlyOaZECv+UVLHuZXymi?=
 =?us-ascii?Q?4AJd4KuXmwu0vNdqt7p0A3WH0v7NjFt1zBLqSZqFH5INTNJX8qnZGD8iLB+m?=
 =?us-ascii?Q?J+nHiZGd/vfzgzYBWePcldB7W7hIo7zGl7SfBWi3iEXgIzLM4A3lskSwYeyv?=
 =?us-ascii?Q?Xv2hZEZgIHl16vJnJjAnFvrgJadMhJGBTgN0swiGWh9wFH6rxI6crR3gbQTm?=
 =?us-ascii?Q?Mz3dXlN97ZUK1l+FqB7NBcgYpzc2HtyVSiF9d13CRqUzb2eDCbZIoTTMay0O?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b356cecf-4f6f-44da-2fa7-08dc71a73f4f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:51.6457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3/wdf7lmtOmUxS6eBa37jFczauvgzlOlBnBURq+wsnA0SRWGA9kjfmh/Sast3Mzs9ZvByhk1P4mdVaOpcH3px0UF+kBjGs6JcW2gL6vD00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

A few pieces of code in the MIPS GIC driver operate on the GIC local
register block for each online CPU, accessing each via the GIC's
other/redirect register block. This patch abstracts the process of
iterating over online CPUs & configuring the other/redirect region to
access their registers through a new for_each_online_cpu_gic() macro.

This simplifies users of the new macro slightly, and more importantly
prepares us for handling multi-cluster systems where the register
configuration will be done via the CM's GCR_CL_REDIRECT register. By
abstracting all other/redirect block configuration through this macro,
and the __gic_with_next_online_cpu() function which backs it, users will
trivially gain support for multi-cluster when it is implemented in
__gic_with_next_online_cpu().

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 drivers/irqchip/irq-mips-gic.c | 61 +++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index 76253e864f23..9e7182150b5c 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -66,6 +66,52 @@ static struct gic_all_vpes_chip_data {
 	bool	mask;
 } gic_all_vpes_chip_data[GIC_NUM_LOCAL_INTRS];
 
+static int __gic_with_next_online_cpu(int prev)
+{
+	unsigned int cpu;
+
+	/* Discover the next online CPU */
+	cpu = cpumask_next(prev, cpu_online_mask);
+
+	/* If there isn't one, we're done */
+	if (cpu >= nr_cpu_ids)
+		return cpu;
+
+	/*
+	 * Lock access to the next CPU's GIC local register block.
+	 *
+	 * In the single cluster case we simply set GIC_VL_OTHER. The caller
+	 * holds gic_lock so nothing can clobber the value we write.
+	 */
+	write_gic_vl_other(mips_cm_vp_id(cpu));
+
+	return cpu;
+}
+
+static inline void __lockdep_assert_held(raw_spinlock_t *gic_lock)
+{
+	lockdep_assert_held(gic_lock);
+}
+
+/**
+ * for_each_online_cpu_gic() - Iterate over online CPUs, access local registers
+ * @cpu: An integer variable to hold the current CPU number
+ * @gic_lock: A pointer to raw spin lock used as a guard
+ *
+ * Iterate over online CPUs & configure the other/redirect register region to
+ * access each CPUs GIC local register block, which can be accessed from the
+ * loop body using read_gic_vo_*() or write_gic_vo_*() accessor functions or
+ * their derivatives.
+ *
+ * The caller must hold gic_lock throughout the loop, such that GIC_VL_OTHER
+ * cannot be clobbered.
+ */
+#define for_each_online_cpu_gic(cpu, gic_lock)		\
+	for (__lockdep_assert_held(gic_lock),		\
+	     (cpu) = __gic_with_next_online_cpu(-1);	\
+	     (cpu) = __gic_with_next_online_cpu(cpu),	\
+	     (cpu) < nr_cpu_ids;)
+
 static void gic_clear_pcpu_masks(unsigned int intr)
 {
 	unsigned int i;
@@ -358,10 +404,9 @@ static void gic_mask_local_irq_all_vpes(struct irq_data *d)
 	cd->mask = false;
 
 	raw_spin_lock_irqsave(&gic_lock, flags);
-	for_each_online_cpu(cpu) {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
+	for_each_online_cpu_gic(cpu, &gic_lock)
 		write_gic_vo_rmask(BIT(intr));
-	}
+
 	raw_spin_unlock_irqrestore(&gic_lock, flags);
 }
 
@@ -376,10 +421,9 @@ static void gic_unmask_local_irq_all_vpes(struct irq_data *d)
 	cd->mask = true;
 
 	raw_spin_lock_irqsave(&gic_lock, flags);
-	for_each_online_cpu(cpu) {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
+	for_each_online_cpu_gic(cpu, &gic_lock)
 		write_gic_vo_smask(BIT(intr));
-	}
+
 	raw_spin_unlock_irqrestore(&gic_lock, flags);
 }
 
@@ -534,10 +578,9 @@ static int gic_irq_domain_map(struct irq_domain *d, unsigned int virq,
 		return -EPERM;
 
 	raw_spin_lock_irqsave(&gic_lock, flags);
-	for_each_online_cpu(cpu) {
-		write_gic_vl_other(mips_cm_vp_id(cpu));
+	for_each_online_cpu_gic(cpu, &gic_lock)
 		write_gic_vo_map(mips_gic_vx_map_reg(intr), map);
-	}
+
 	raw_spin_unlock_irqrestore(&gic_lock, flags);
 
 	return 0;
-- 
2.25.1


