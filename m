Return-Path: <linux-mips+bounces-3221-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7A8C30A6
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8820C1F2185B
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A0057C8E;
	Sat, 11 May 2024 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="bhkzxgKS"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2117.outbound.protection.outlook.com [40.107.241.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E05674B;
	Sat, 11 May 2024 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424243; cv=fail; b=UtANokQp3fr+yksustl9iub0plXq0pPpnuaNv20O9ABk1qbbf6+mBxxG0c67/trJ98gaXGzHmKYiE6adumR2bHparCpmy0uG3sk3xIlk4YUaF0ovF2LOqa7ZDaVR1Tt7hebH25IFSqCv/WFvh2RxnQ8ZvruhT3NqIiMP+hSPars=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424243; c=relaxed/simple;
	bh=wdfBHU+kas5IRcH+QP3mj1eQGTyMR/nNeO+3Vv1mj4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J3c+vDzbw42krn8INy11nAlylP5z68qnIvglusaBRc53VWNVLKgQjTFO4nI2XWMZkL2YNbkJ9LxI43MOYI88nnwRaYaLxhqbnUvHgK34hhqOvt4sPu7ks/j8WkLr81rNbr5Aqeh5AWeCxSLRRgdgeIIESBBw+Bc69HyHidRWcpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=bhkzxgKS; arc=fail smtp.client-ip=40.107.241.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFLHSctPKPXRaXlcYeNuCkmjUHV1viEsg1gWhgKCNZ5GmRQSdR1RY1e9PponsFoVFasf9xoervSgua4/Adwm6Q0n8ufkGT2i5Td8+96g1tP0yZWzvKqn4E930rrnSF6a8bkB4Q50uIg1Cimav33KUjz7e/XVUfo7mdkNar7msHmTXB+Py7B5wuYZSrjUPuTcFkPBOfYRhcjgqBNZNFovSjdU0OyCHUnMI92vQG3LQZSOrOYfHeynRK7CfViVjiUlWC7rA7sZuha6dRi0Q0L8AYhkqbiJNcvuTJYW4hMH++GLBly3Gm8R8+RVWNyid4f1rwdLqQgllgzNpyUuP5QAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z+QxqBZdAG5DlGWpDMtaRHL0+S5xvmq8uvUIrO4CFs=;
 b=cG2C+KyVkdLWH3iZbxOOBnLRu/q9unkdzTgLOPZYlT827396YurfrDhcoj6Tm5y5myiQphtj5xqCMTDmpMh8eaiLt8ngfV6L95MOhLsHXKF6Cl0w3DMgYU7PnkrHHuTvOPJRnNiITxg50SinY02tci+177G/mtn6Clbdrqt1eY0prvdLhx8RjbrjHh3TTz6UitWUXUraxn3r1jy/J0KbAGPR8QRF8ttMPV9Us8Lu01/B2qSCW0RBPRR1vMQaYL0kOmPS7A3v/btG+Tg6hkHuPC6V/3ZEH0KloOI8yXNqOo5oRaATZdl9p3o0sBml8WLrtpD8/9IeM0ejf4MhbqFcEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z+QxqBZdAG5DlGWpDMtaRHL0+S5xvmq8uvUIrO4CFs=;
 b=bhkzxgKSj+OtTSyqvmzONG18cZTlJ8UvfZ1HroW6EuBvu7ALsX30b0XW90dSbFvclFZ1i+Hw2AibWGQt71S1w9R6lqs/8M0WsBja8DnwzTDesNQU/XsNkmcbsSgTT9QotG8wymkAyPjrSA2ilLhSOfaku71neixa14Au4HK5zw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:54 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:54 +0000
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
Subject: [PATCH v4 06/14] irqchip: mips-gic: Multi-cluster support
Date: Sat, 11 May 2024 12:43:33 +0200
Message-Id: <20240511104341.151550-7-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 78f418ab-11c5-435d-f84a-08dc71a74102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xpASwHYOl57M3WJrE+4xsPv6ywwN8MsD/l/XYHmGWRMTAkMnkGghk5p1uMaW?=
 =?us-ascii?Q?KjD6SswjRvgg15AHOnLIsmSh+ftPfbQeLSa+e9+vQUteBccaRqQzOy2LBZKn?=
 =?us-ascii?Q?pa+yx5yrkriBjFFcmTLJMJnEfQRM79P0BV6Ch2OncbQ5EqmwHDGa4vxjlPvv?=
 =?us-ascii?Q?0T4ZhDB/xPugYrPrIVu8KoUx/mOXgGPrnCwNQbrRjosOERCVrebfU9Znyuv8?=
 =?us-ascii?Q?LTpcM4evXBOXKdVA1gxgqZASXaReezRS2KOznHKnmge4TqJsVyserxiDGn/A?=
 =?us-ascii?Q?1AXIVq37ENCTGEa79zexY6G3DHIpJ67IfAwJAA9ET+bKMNvCAMMpwT7K4my8?=
 =?us-ascii?Q?2pfOKqAwLSne4jbTvVYcMmZ03+SsvrXsZkIgEb+QuCj1jHQ9UrtyAwgVBXXx?=
 =?us-ascii?Q?F90DF4FMY7gY4OiZ7pDhgsyU1u0kHWbvXawkxxZjhRvTrbz6itekEiezCSZL?=
 =?us-ascii?Q?5wVkaeEjrBVvk93g0mQtf13cAwZMNq1FBTGIanQjFSyFRy2w+y8/M2SSo9Wn?=
 =?us-ascii?Q?dbMrqfST0BSHLYrNB3uElvEnB0i02Dk731ShxuOM/jx7d6BAss572loCv790?=
 =?us-ascii?Q?1vpxPkpQRZxYbAgmgCNEz+JhpM10Aa7X0K2ivMBjXEjdMHA8nv3xMlum752b?=
 =?us-ascii?Q?FGS4ozraA2vp7GN07+xJOZRhFfFhbg0oOn86/phqHRiek0Rdu/o+vdNd89bZ?=
 =?us-ascii?Q?KKifuA776M0Ac+mn9Y7E36Xh8Xi+I3IpuYMruqGPRM/xSmMTL11Ndm6qc04p?=
 =?us-ascii?Q?bWdfplCz54PH60SlyHmUFj2Va2CxgDUfkCChmetUDcxK36A4yBDc2TFxdz5H?=
 =?us-ascii?Q?q2JFjexFu8YIZFzOxvz4pcxCbohl7zIj6aK7OU7hxaWwzW34mrAtdg/PkMY8?=
 =?us-ascii?Q?V0ss8wVtaQDpakBMXI+L7lSGvdE/wL3B53PiqDilv4NatxMtzXs+i3JEXqDM?=
 =?us-ascii?Q?IfQiprNKa7atKCVpR65yEVuukRBKl0AyF1ucBSlHrhTjoDg61tJOlLEL2jx5?=
 =?us-ascii?Q?NNLpGXBa4mjcoN4qQuo7AFLkTkrQFFtJPPAzJI6l3PZ+kDQansK+1jr5X+pb?=
 =?us-ascii?Q?UJ9yIVeogc4PK+/NkHtv7eXHXe1GoSas/LTlGS/7Wp0C0cEQGHu6vOiGhK7+?=
 =?us-ascii?Q?Sm0cyhA5YCriyzXN8BFp4XWJssELabIHtt6Bvu2K/hfs29yJVDizpEwTUoXa?=
 =?us-ascii?Q?46ff7cXhprJ0YIhrMeA9VjWWSdugzpkM68g557JCE/QUMRS1VSqP4RJlsLqX?=
 =?us-ascii?Q?GYwUQxiMIZpfHfIW5w2BpPc7HdkEMbfGeXkez8xoMYB5xWqrleuf2ekOIdcH?=
 =?us-ascii?Q?kb0HlksxYxFXDO4qblVZ/yhniHfH/rgnPQy2QlUlG3MOTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iBtXglI5Stw41FGq020VxiH8eD9hP0gPzMqIq1jnJtxzPu6bDpd4GMh8mH+z?=
 =?us-ascii?Q?YCZfZSwQdC5Vo5FkyoN7jy9PwwbA6jHDHVhBXvTSSUYnOZv4Oadj7CA5LQkM?=
 =?us-ascii?Q?zDB3d8PzN6Eqeh87QaVMvd7hzf1MKmggmgF8pGlp+LnSuEYEkvPVGLKPIF7N?=
 =?us-ascii?Q?xcxwk6oVvcUGuYkSh6kUMge5x1KW10JtOKCyMFtnGg9RnDxidUk7p0eMjCL2?=
 =?us-ascii?Q?C/EUZxc1lFxcaJ1SwGExWlT27bFynb6QZqaFiNAeDl1P2nfaEmoCWr9pmpzv?=
 =?us-ascii?Q?plJjuFbFAPBL1ZwNJiL+5nyWHpyeHgpxtR9XGM9Wi7Vay3JCNbXudqCoksGG?=
 =?us-ascii?Q?cAXpqCEIaFGpfExkP9Umurwhu4J6+59vKF43KaD/KiLuvJRqpSI8Kc+M6EDU?=
 =?us-ascii?Q?eDp32mCG3OY/7iLLcAi6D/SzsAJdUYnw7h1/txLyNrtyK19d09KHUmu/UOpw?=
 =?us-ascii?Q?BtK2rlwnOe6vG7RgtYIGwd3yE9uUDfl4gBDXAasrUWE1ZtOdKU14j1wRUa+O?=
 =?us-ascii?Q?CnFDWI+78CG3LwlZCCJlXn8lACz4mpItH9nSQMKltEqITAh1gsjhv8u8+aE1?=
 =?us-ascii?Q?PaLwxEipAwmKYgcV59Qbr4lgj7gibTarUjf7A2bfZ7TOTPM/PMH/jhe9Isai?=
 =?us-ascii?Q?ruyu7v3ICNX8TWb7IW0JD5gvt3/yVlUvA7W6c108OjMugxxiCjOZKDwzmNZb?=
 =?us-ascii?Q?3ze8D42rxHx556Ve7cbOesHASpVQ3iBjVG9ZcMkiNX+dRz6PsR0QoUCmACFc?=
 =?us-ascii?Q?VSy7ftGP/lIfzEp10kLnoRfq6FTkAm6jcIwx74zKjz1Y8DzJjz2jVGYpyw/4?=
 =?us-ascii?Q?YD2RuW5P71ua4JsmBFPgPfqyX0XMPdsLPoYFQuWdQs2zYbsph+m6YGElT7Mo?=
 =?us-ascii?Q?D8By6HpwjKW8XZyXN1jNXFiO/OeQm9IS87CV1QHmtiKX5SnXKINeY6WViqzh?=
 =?us-ascii?Q?R9MU8g2oFqZXxfy3kzIurjcgzXO4axxg05ELZ2AJFjYFGWPhMz/23AiNq852?=
 =?us-ascii?Q?plqi6qQjh/HPNxkEaINK9P8EqvKKqYY8/fLupCGe+JZ227SADqBF1UTZHbiA?=
 =?us-ascii?Q?qZu9o8SMV7OVCgwXmC73VevhkavQfJujMaChhVS9Z8IYH0h6kgpGDM8LmyJb?=
 =?us-ascii?Q?9k/Uz8Q2lTP80lo951BZJ8FWl4isRT1cwNalbcweo7GWdG19AdiSy2U3YIjm?=
 =?us-ascii?Q?DqIOayEfnbIO/fWg5nkXb0QWgrY79sTaYXhbu8OBOo70HGSYYwvWo1ZKd7Pw?=
 =?us-ascii?Q?uItE1geT5p77YlSwNCHZ5bRvSYoDc93Byc2bKlrXNvHh57KkFheLShN95cLs?=
 =?us-ascii?Q?XKOPkWdlFJNz9SLK+v+SktDJJdSVuNoRRc+IFJTJPFzBL5GMUB2DeoQwbBtj?=
 =?us-ascii?Q?4SgFehfGtT7YpWzcMu2GbYK0WIOl55jK1IVN5rdpmA9nF2kPbPBsHrNO2Ihy?=
 =?us-ascii?Q?a9gffFYErp8BBaFEf+9TBKKD9dyJG3U0TKOofUMz9y7A+MEuiqXgpH/Q859S?=
 =?us-ascii?Q?3PUZ2BjVkFJA5HQJeFk6HDrrt7lfGPloalZbXmXwc9cyLKPspeNkV2FbXcrG?=
 =?us-ascii?Q?SbrVXsJ09umwQJc0SfQYc+XCbIxg1PJhqgLykBNvLzLLeO7oNQoLXFLiVsaf?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f418ab-11c5-435d-f84a-08dc71a74102
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:54.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Jn+LGtg4aBtGBfFrXOhsIXedGckIM/cS+dJxer8F/asV8eWWoyDzLIilaDUlxlbYyQRpdSQAh4OIOK9NiiuDxdN9XoEiK1e+mIERN0lIHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

The MIPS I6500 CPU & CM (Coherence Manager) 3.5 introduce the concept of
multiple clusters to the system. In these systems each cluster contains
its own GIC, so the GIC isn't truly global any longer. We do have the
ability to access registers in the GICs of remote clusters using a
redirect register block much like the redirect register blocks provided
by the CM & CPC, and configured through the same GCR_REDIRECT register
that we our mips_cm_lock_other() abstraction builds upon.

It is expected that external interrupts are connected identically to all
clusters. That is, if we have a device providing an interrupt connected
to GIC interrupt pin 0 then it should be connected to pin 0 of every GIC
in the system. This simplifies things somewhat by allowing us for the
most part to treat the GIC as though it is still truly global, so long
as we take care to configure interrupts in the cluster that we want them
affine to.

This patch introduces support for such multi-cluster systems in the MIPS
GIC irqchip driver. We introduce a new gic_irq_lock_cluster() function
which allows us to either:

  1) Configure access to a GIC in a remote cluster via the redirect
     register block, using mips_cm_lock_other().

Or:

  2) Detect that the interrupt in question is affine to the local
     cluster and we should use plain old GIC register access to the GIC
     in the local cluster.

It is possible to access the local cluster's GIC registers via the
redirect block, but keeping the special case for them is both good for
performance (because we avoid the locking & indirection overhead of
using the redirect block) and necessary to maintain compatibility with
systems using CM revisions prior to 3.5 which don't support the redirect
block.

The gic_irq_lock_cluster() function relies upon an IRQs effective
affinity in order to discover which cluster the IRQ is affine to. In
order to track this & allow it to be updated at an appropriate point
during gic_set_affinity() we select the generic support for effective
affinity using CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK.

gic_set_affinity() is the one function which gains much complexity. It
now deconfigures routing to any VP(E), ie. CPU, on the old cluster when
moving affinity to a new cluster. Because we only configure an
interrupts trigger type in the cluster which it is affine to we call
gic_set_type() to configure that in the new cluster, after having
updated the effective affinity mask such that gic_irq_lock_cluster()
begins operating on the new cluster. Finally we map the interrupt to the
appropriate pin & VP(E) in the new cluster.

gic_shared_irq_domain_map() moves its update of the IRQs effective
affinity to before its use of gic_irq_lock_cluster(), in order to ensure
we operate on the cluster the IRQ is affine to.

The remaining changes are straightforward use of the
gic_irq_lock_cluster() function to select between local cluster & remote
cluster code-paths when configuring interrupts.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 drivers/irqchip/Kconfig        |   1 +
 drivers/irqchip/irq-mips-gic.c | 161 +++++++++++++++++++++++++++++----
 2 files changed, 143 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 72c07a12f5e1..e0e9d32816a3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -328,6 +328,7 @@ config KEYSTONE_IRQ
 
 config MIPS_GIC
 	bool
+	select GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	select GENERIC_IRQ_IPI if SMP
 	select IRQ_DOMAIN_HIERARCHY
 	select MIPS_CM
diff --git a/drivers/irqchip/irq-mips-gic.c b/drivers/irqchip/irq-mips-gic.c
index cdd8973912a9..8e9046516e63 100644
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@ -135,6 +135,41 @@ static inline void __lockdep_assert_held(raw_spinlock_t *gic_lock)
 	     (cpu) = __gic_with_next_online_cpu(cpu),	\
 	     (cpu) < nr_cpu_ids;)
 
+/**
+ * gic_irq_lock_cluster() - Lock redirect block access to IRQ's cluster
+ * @d: struct irq_data corresponding to the interrupt we're interested in
+ *
+ * Locks redirect register block access to the global register block of the GIC
+ * within the remote cluster that the IRQ corresponding to @d is affine to,
+ * returning true when this redirect block setup & locking has been performed.
+ *
+ * If @d is affine to the local cluster then no locking is performed and this
+ * function will return false, indicating to the caller that it should access
+ * the local clusters registers without the overhead of indirection through the
+ * redirect block.
+ *
+ * In summary, if this function returns true then the caller should access GIC
+ * registers using redirect register block accessors & then call
+ * mips_cm_unlock_other() when done. If this function returns false then the
+ * caller should trivially access GIC registers in the local cluster.
+ *
+ * Returns true if locking performed, else false.
+ */
+static bool gic_irq_lock_cluster(struct irq_data *d)
+{
+	unsigned int cpu, cl;
+
+	cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
+	BUG_ON(cpu >= NR_CPUS);
+
+	cl = cpu_cluster(&cpu_data[cpu]);
+	if (cl == cpu_cluster(&current_cpu_data))
+		return false;
+
+	mips_cm_lock_other(cl, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+	return true;
+}
+
 static void gic_clear_pcpu_masks(unsigned int intr)
 {
 	unsigned int i;
@@ -181,7 +216,12 @@ static void gic_send_ipi(struct irq_data *d, unsigned int cpu)
 {
 	irq_hw_number_t hwirq = GIC_HWIRQ_TO_SHARED(irqd_to_hwirq(d));
 
-	write_gic_wedge(GIC_WEDGE_RW | hwirq);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_wedge(GIC_WEDGE_RW | hwirq);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_wedge(GIC_WEDGE_RW | hwirq);
+	}
 }
 
 int gic_get_c0_compare_int(void)
@@ -249,7 +289,13 @@ static void gic_mask_irq(struct irq_data *d)
 {
 	unsigned int intr = GIC_HWIRQ_TO_SHARED(d->hwirq);
 
-	write_gic_rmask(intr);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_rmask(intr);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_rmask(intr);
+	}
+
 	gic_clear_pcpu_masks(intr);
 }
 
@@ -258,7 +304,12 @@ static void gic_unmask_irq(struct irq_data *d)
 	unsigned int intr = GIC_HWIRQ_TO_SHARED(d->hwirq);
 	unsigned int cpu;
 
-	write_gic_smask(intr);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_smask(intr);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_smask(intr);
+	}
 
 	gic_clear_pcpu_masks(intr);
 	cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
@@ -269,7 +320,12 @@ static void gic_ack_irq(struct irq_data *d)
 {
 	unsigned int irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
 
-	write_gic_wedge(irq);
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_wedge(irq);
+		mips_cm_unlock_other();
+	} else {
+		write_gic_wedge(irq);
+	}
 }
 
 static int gic_set_type(struct irq_data *d, unsigned int type)
@@ -309,9 +365,16 @@ static int gic_set_type(struct irq_data *d, unsigned int type)
 		break;
 	}
 
-	change_gic_pol(irq, pol);
-	change_gic_trig(irq, trig);
-	change_gic_dual(irq, dual);
+	if (gic_irq_lock_cluster(d)) {
+		change_gic_redir_pol(irq, pol);
+		change_gic_redir_trig(irq, trig);
+		change_gic_redir_dual(irq, dual);
+		mips_cm_unlock_other();
+	} else {
+		change_gic_pol(irq, pol);
+		change_gic_trig(irq, trig);
+		change_gic_dual(irq, dual);
+	}
 
 	if (trig == GIC_TRIG_EDGE)
 		irq_set_chip_handler_name_locked(d, &gic_edge_irq_controller,
@@ -329,25 +392,72 @@ static int gic_set_affinity(struct irq_data *d, const struct cpumask *cpumask,
 			    bool force)
 {
 	unsigned int irq = GIC_HWIRQ_TO_SHARED(d->hwirq);
+	unsigned int cpu, cl, old_cpu, old_cl;
 	unsigned long flags;
-	unsigned int cpu;
 
+	/*
+	 * The GIC specifies that we can only route an interrupt to one VP(E),
+	 * ie. CPU in Linux parlance, at a time. Therefore we always route to
+	 * the first online CPU in the mask.
+	 */
 	cpu = cpumask_first_and(cpumask, cpu_online_mask);
 	if (cpu >= NR_CPUS)
 		return -EINVAL;
 
-	/* Assumption : cpumask refers to a single CPU */
-	raw_spin_lock_irqsave(&gic_lock, flags);
+	old_cpu = cpumask_first(irq_data_get_effective_affinity_mask(d));
+	old_cl = cpu_cluster(&cpu_data[old_cpu]);
+	cl = cpu_cluster(&cpu_data[cpu]);
 
-	/* Re-route this IRQ */
-	write_gic_map_vp(irq, BIT(mips_cm_vp_id(cpu)));
+	raw_spin_lock_irqsave(&gic_lock, flags);
 
-	/* Update the pcpu_masks */
-	gic_clear_pcpu_masks(irq);
-	if (read_gic_mask(irq))
-		set_bit(irq, per_cpu_ptr(pcpu_masks, cpu));
+	/*
+	 * If we're moving affinity between clusters, stop routing the
+	 * interrupt to any VP(E) in the old cluster.
+	 */
+	if (cl != old_cl) {
+		if (gic_irq_lock_cluster(d)) {
+			write_gic_redir_map_vp(irq, 0);
+			mips_cm_unlock_other();
+		} else {
+			write_gic_map_vp(irq, 0);
+		}
+	}
 
+	/*
+	 * Update effective affinity - after this gic_irq_lock_cluster() will
+	 * begin operating on the new cluster.
+	 */
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
+
+	/*
+	 * If we're moving affinity between clusters, configure the interrupt
+	 * trigger type in the new cluster.
+	 */
+	if (cl != old_cl)
+		gic_set_type(d, irqd_get_trigger_type(d));
+
+	/* Route the interrupt to its new VP(E) */
+	if (gic_irq_lock_cluster(d)) {
+		write_gic_redir_map_pin(irq,
+					GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_redir_map_vp(irq, BIT(mips_cm_vp_id(cpu)));
+
+		/* Update the pcpu_masks */
+		gic_clear_pcpu_masks(irq);
+		if (read_gic_redir_mask(irq))
+			set_bit(irq, per_cpu_ptr(pcpu_masks, cpu));
+
+		mips_cm_unlock_other();
+	} else {
+		write_gic_map_pin(irq, GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_map_vp(irq, BIT(mips_cm_vp_id(cpu)));
+
+		/* Update the pcpu_masks */
+		gic_clear_pcpu_masks(irq);
+		if (read_gic_mask(irq))
+			set_bit(irq, per_cpu_ptr(pcpu_masks, cpu));
+	}
+
 	raw_spin_unlock_irqrestore(&gic_lock, flags);
 
 	return IRQ_SET_MASK_OK;
@@ -503,11 +613,21 @@ static int gic_shared_irq_domain_map(struct irq_domain *d, unsigned int virq,
 	unsigned long flags;
 
 	data = irq_get_irq_data(virq);
+	irq_data_update_effective_affinity(data, cpumask_of(cpu));
 
 	raw_spin_lock_irqsave(&gic_lock, flags);
-	write_gic_map_pin(intr, GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
-	write_gic_map_vp(intr, BIT(mips_cm_vp_id(cpu)));
-	irq_data_update_effective_affinity(data, cpumask_of(cpu));
+
+	/* Route the interrupt to its VP(E) */
+	if (gic_irq_lock_cluster(data)) {
+		write_gic_redir_map_pin(intr,
+					GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_redir_map_vp(intr, BIT(mips_cm_vp_id(cpu)));
+		mips_cm_unlock_other();
+	} else {
+		write_gic_map_pin(intr, GIC_MAP_PIN_MAP_TO_PIN | gic_cpu_pin);
+		write_gic_map_vp(intr, BIT(mips_cm_vp_id(cpu)));
+	}
+
 	raw_spin_unlock_irqrestore(&gic_lock, flags);
 
 	return 0;
@@ -687,6 +807,9 @@ static int gic_ipi_domain_alloc(struct irq_domain *d, unsigned int virq,
 		if (ret)
 			goto error;
 
+		/* Set affinity to cpu.  */
+		irq_data_update_effective_affinity(irq_get_irq_data(virq + i),
+						   cpumask_of(cpu));
 		ret = irq_set_irq_type(virq + i, IRQ_TYPE_EDGE_RISING);
 		if (ret)
 			goto error;
-- 
2.25.1


