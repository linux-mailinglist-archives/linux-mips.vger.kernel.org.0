Return-Path: <linux-mips+bounces-3225-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 582948C30AE
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3C681F21F5B
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA01F605BB;
	Sat, 11 May 2024 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="EPsL7HaY"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2117.outbound.protection.outlook.com [40.107.241.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB45EE82;
	Sat, 11 May 2024 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424247; cv=fail; b=SberdTN9JMw/GVj3PhrZEXQzvcl300vkgF0eU9NpxkaOSnM+d48JMZjE7gBAh87GMRB5L1e9PVlJXfgXjCC4DJD3ZLY5mj42F246yHyEIj30d1lZ4IH7mW7H8IqkCQayopnPsuTt7StzQ63HuMA2dV3Mh52H4J+OSesMuxyCz6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424247; c=relaxed/simple;
	bh=QuJLKL473VgioPeN/Lb3jpSC2sSOrhHkr48Yw1sQiEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=suEyoYoqBTKR75m4wTW8mD2eN5yUOxoumKDe+RT2/XcdB19Fc7HTbE8SkpfBkbLLvam8zAkceytg4Tzf+eX/kxuyBNDDcJnZgT6MBP6Tp9ovrj/WJ5h7L4RvHUzm36Y8qX1yD0CN3v1In0uYcnxgPv8guORC1LwMM263hXD99eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=EPsL7HaY; arc=fail smtp.client-ip=40.107.241.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT5iDceObTb+iIsm51mzjIhEmFucDcjGhtBsCpUAoRAsdusEgjRcvxMQaGOs2ivV7pvELDBS1ZMOQrtzKV9n+oPoU22RiBs3u8KuISFNkrjIVtP8JU8KB5+wffE3ipOtEFhFt0E1M9aqdIwDzzrqCIvAYzxYtE7XvaPRqY6LVofoDz6yRcBmyNRz4vMFd2fVJfoW4sX3wQVJlJC3+18wP2G/Wr7/l/Rnz/X1ACjYADctbRtBKER+p3wYUJ53PY/5ZipogyxkuZgtNLzCshqs98GzEEzpOF88i9XRqC4DiF4UFfTJArQE01RwH6IvjK+zqLrwBleTGgAIJW8WMwcrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5mTArWVuJa9HvUvkDmu0MtWRXf5bLcDyN2lFWbkSrQ=;
 b=fw8jv7eOgDvVU++o52612QLtBnONNYM3JEuT+/54q00L+t+SFktGgCW1qReDzP1p8X7fR3vR26RONQGWJDUBXEKqCZlTZe67WXzpDrv/HhMrLPw6Ojf7XLP3Fbz6hG6WvW47gpAto9YrYcj3+kv/KlMI6Y9XybIKBDqKWxIzcSrWi9e85tGNzc6o1fYWwsV6Tekmn9qVow3lAwN9GuwJdnwwq2+bayi/FNNle93WU23vvrJhuKUte5yBCKSubnReFW1XvsrYqSJ/WZUjdRF2JntYgbYVjZorbb6laU0XIqgGC9PZ+CArjskgQt3+zEVGE0gRvIcf0ZeLtK8cGxoTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5mTArWVuJa9HvUvkDmu0MtWRXf5bLcDyN2lFWbkSrQ=;
 b=EPsL7HaY28zaQ/gCoNzPDEi340l2zBpxJhI8dTatj6vbBvOAaYKE8Apgv1V4z8QPTiU50eoZTV0b1GWJtQxJpYtdcDXFAcUFsrWm6YcrIQiPWgLlU2lornT45+GzcgeUATozOBz3LZQ7Sh0hq9IThbiJYgPNNUuoz1TPmYi/dHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:58 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:58 +0000
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
Subject: [PATCH v4 10/14] MIPS: CPS: Introduce struct cluster_boot_config
Date: Sat, 11 May 2024 12:43:37 +0200
Message-Id: <20240511104341.151550-11-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae9950dc-14a5-4627-0d99-08dc71a7434b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8p7g20IalRsY47tOEDwIgn9zaQj1pkMQusV9CBsVbJDyCKT2ABwCLA1qg5f8?=
 =?us-ascii?Q?uosaBCDIxdlMHUbnWOF6ZerJB16yiyl/MPwR/pWgoSd8W6toxA/M8TMvOcLl?=
 =?us-ascii?Q?hqGuLF5XNVoPSJDuwJzG3SvZwEeA5ekjVQ2HO4SDBhTAjXA33R9e7oad1Vx3?=
 =?us-ascii?Q?2YeELCkEl1GfUq9ON1aFYIxSgrMzwESQSajB/URpcHwMVudRex6C/hAvXA3M?=
 =?us-ascii?Q?ZhN+DOBGgf7lCp43Qp5TxSGZA8Fy/Nu6bMCcaamDli7MJ2N8rVwLrcYTMd9M?=
 =?us-ascii?Q?g7OezMVurJpDoOIL2B2x5pAsxeV/MpfvjHyJFOK6iIzLO/x2iXjTJ4pXalPW?=
 =?us-ascii?Q?f41KrRtGcgtFz9CNbs4Z+wGmk/u3qbSws9D6OfW92rkvUcE3YpF/itVPsGZO?=
 =?us-ascii?Q?CZKwRwMNcJY7F0XYSmixH/e0B2GDGcmRz6fQKh1Cb5C5VWiBsC83GZYfV3Dr?=
 =?us-ascii?Q?7S4Jwrl9F5mkqH6/RR6CQHzjwPolHCKOqsmjQ+iiMA26FzjnQvA9XkXe0qo0?=
 =?us-ascii?Q?XYocoFunQCoMH24ARctogstSHNnCkHwWCnDVxTpsWASfjSEh6Fqt2zmUSWQY?=
 =?us-ascii?Q?AXWddYqva+T2vs8Bhm3zwshlbsiO2ERwj1T9IWgvmb/zHK6LdWRCpRgEo/ms?=
 =?us-ascii?Q?mASNZGVeVE7lrUgfGokmgJkuTvEfBXVYpaIsZ3ZZqueIjmsdtT3UsDnQ6NDC?=
 =?us-ascii?Q?3MRDBWhVgwWauov7SQ7efL+MMyfkW2Z4beh7E0R6hcR4iyA/wspQ0aaTvW0J?=
 =?us-ascii?Q?d6+JHIGUJCk8CCfDlEd15u127N9a9o/GL27Ij7XqL7SVxUHshqkjn0l5VIvH?=
 =?us-ascii?Q?cumIO2g7/mMBwS1I7BUwH2+9ZmJKMqYGzOc5vdrHIoK7TPOHMifBRTWbkYWz?=
 =?us-ascii?Q?O0nFwVAWvmcZ7YsLDX47PoQazrP4AxlavcjKKnatZjV0giUqS3n1OzkkeF+9?=
 =?us-ascii?Q?oAmIqJ6YMBaE6uYePc7pdTd0ZgCjbbfgBFKYW3qbGcIma1n0Ws4ttmidgiXi?=
 =?us-ascii?Q?SxP/fW2Kzl2g2c0q3kPqhZHWClChjkhi5hIcwe5VYt1PCqp0hHpQ6WOrQu59?=
 =?us-ascii?Q?cacNsxHFpYo+1UoiczCAXUXg41WGMLz7hRmaHa/HV9jMUdIiT9hg+qxytYP/?=
 =?us-ascii?Q?T8h3Wr1rl/GYQephoTnu/5206ogf+dZZ5KaNBMwld0sOy20ukixM+aa1l3I/?=
 =?us-ascii?Q?Gg+Amk9iou1H3AJeIf6jz+HHrYj8LPQc4IxIA87k5Aqr0OesHhf+j39oQkk5?=
 =?us-ascii?Q?PgFmJ1Yo3mXV92y4q6dGmeFTbU1S8+4Cz44D5pu3wxUeU5loUEW+iV5r/sWK?=
 =?us-ascii?Q?azgUCKS9otHvP/qG6Cz3bqJCaj+ripEJRbYS3JS/mWd2lA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0rccz3zseV6iCw6uvBqMTmmL0rLTzkMgxWht2cAjBCCWbg4n5rQhsQZ4N7XA?=
 =?us-ascii?Q?hQ8XH/dfaqBwk+A1KI6jpr731Dd5p6bmJt0S9whFR/ix78ir16+9bf/1ci96?=
 =?us-ascii?Q?+8dwpwf2M9cFlUJVShM8apNxtTqXkiNd3NsFS9bxXXUoGe8C0T+93RwBi7LY?=
 =?us-ascii?Q?492GtNS0p2JUB1KajEx3Zn/uO/6cy1cTMq5SG6Z0jQG6IXwgz7VHij4L6StP?=
 =?us-ascii?Q?hr0AW9BGftZMTmwcBDMMwLyj0FXKQuq8CbuTgFYS20nJB3p86McC6IyE7dtX?=
 =?us-ascii?Q?39wKlMilMIbEcW2OP43gxXAdpua4GdDRCcqYxVJlHqfOZDOBUfnbrAO2/r0K?=
 =?us-ascii?Q?Q6plxSSwaV9PJaccWj1lxbW28xTHGy4XGGIbDcl3CzXYiJs1UJlSG44qON8Q?=
 =?us-ascii?Q?JjQrIczOliouS564M/CAr1Wcy+nYJBLu2a/jVoS0Sh0tY6MEN1LOZXuBrQOk?=
 =?us-ascii?Q?a9AHvtLsq8BipoclnKPiR2w2/Fk9X/QmbGiGJKlfRoDj9NuU8HwNIoqcXDqf?=
 =?us-ascii?Q?9cfDj+i9SjpNdnKAEnmd8a6YGNhf3hxtL+1p7Islt4A+N8oWEtGiXFaJEW90?=
 =?us-ascii?Q?lRNp0KRp2txPFEmdGjH058TsYrqLocEIUeXKg1dAMWr1NFEqGTvIAUlJYpym?=
 =?us-ascii?Q?6ssD71TpB9cJdGmw0DGjFITi+U6fMjNdqRID/9IiOS/frQoFSE0HAJm3jLh2?=
 =?us-ascii?Q?BGw14ZADbrodoxk/eHI3tNeDa/nnrHtvmnOf0l0uftZBM5ryLZ5QGodN9bs8?=
 =?us-ascii?Q?QHrHgKmBzCPtyfkESRTPb+pqRUOr/MUI9GvBBoNhWDKKT5XTSxPW2pHeJ4gT?=
 =?us-ascii?Q?p6h0pi++37t4YL7iHuhifF06YD5mQelgyJ9nHzhj81vuHa4JJ5X3/GjKqSOZ?=
 =?us-ascii?Q?C6IU8t6nOHThIwDQdaHUe5su0gZ3WSwIM4t+blhZgTJ4UwMJtOw9Vj/RkN6J?=
 =?us-ascii?Q?WNRkV0qErcTyu4r5S8vTStRvzEUg6bs/1W9lui7g9DdO1/YEZj+vRKzSgteG?=
 =?us-ascii?Q?GQ/dFTwunBf5Xzh3P+oKUo6DLxj49fYuqR8blem4P33K3VHbhrWFvez7B8HV?=
 =?us-ascii?Q?XFq5rTvl+0ycjEC6qZzcyblMldvqFcnDVG3SnvrbPBIj9WPZJiK+SwFTz2P0?=
 =?us-ascii?Q?ptlV/E7nTxRk8sEnJhM8hybmDhWN+wvIlY+VCKIEyQy+duWnRW+Gs3e31TRH?=
 =?us-ascii?Q?pfGkiTvlo/Mlx/DKb+4aO91xLOgd/z6vn1Ji6MGlFszUOqf3gvpW363c/KCE?=
 =?us-ascii?Q?iGFo19rxwUlmmh53TUPmXztOmwdHu/IZRi7wx/KK8HDpySQnk031oJ9gJv5z?=
 =?us-ascii?Q?A8AOdRmbz+IKBjISrHwq1b1Tafyjo0e3jjvPBqVmg08Nz7itPZAHBYOpV20t?=
 =?us-ascii?Q?o/FnqDT0cmwTYHUK4ikBdL/jzkKR8i/U59lGa7X4r3X52OT7VoUt2rZ3Wf39?=
 =?us-ascii?Q?TRKGo3yCn2+jRmH00sRvtWxiri+inWKup4gnBxRpRafxtONOl0L3OFc0Q50g?=
 =?us-ascii?Q?xOR8XiCNbID9WymntGyhS1V1/vopZDn6UC3qu/0GwivJArBKdQADZziEI/HU?=
 =?us-ascii?Q?ssdsai5iYHSsGQpBh8ThCHXS8ENepScdNCevh6Frotsdl26rP9BZdPN39dat?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9950dc-14a5-4627-0d99-08dc71a7434b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:58.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFt/UC70ynLc9FAMFZIKHr9pgNiWoodao7g77kU8z0dK7j2jOcUgUijxfA92G9ofyG25hqffQyJiQ32fHo+jmaz87gVt327OmzCwDED/I5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

In preparation for supporting multi-cluster systems, introduce a struct
cluster_boot_config as an extra layer in the boot configuration
maintained by the MIPS Coherent Processing System (CPS) SMP
implementation. For now only one struct cluster_boot_config will be
allocated & we'll simply defererence its core_config field to find the
struct core_boot_config array which we use to boot as usual.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 arch/mips/include/asm/smp-cps.h |  6 ++-
 arch/mips/kernel/asm-offsets.c  |  3 ++
 arch/mips/kernel/cps-vec.S      | 19 ++++++--
 arch/mips/kernel/pm-cps.c       |  5 +-
 arch/mips/kernel/smp-cps.c      | 82 +++++++++++++++++++++------------
 5 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
index ab94e50f62b8..a629e948a6fd 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -22,7 +22,11 @@ struct core_boot_config {
 	struct vpe_boot_config *vpe_config;
 };
 
-extern struct core_boot_config *mips_cps_core_bootcfg;
+struct cluster_boot_config {
+	struct core_boot_config *core_config;
+};
+
+extern struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
 extern void mips_cps_core_boot(int cca, void __iomem *gcr_base);
 extern void mips_cps_core_init(void);
diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index cb1045ebab06..b29944160b28 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -404,6 +404,9 @@ void output_cps_defines(void)
 {
 	COMMENT(" MIPS CPS offsets. ");
 
+	OFFSET(CLUSTERBOOTCFG_CORECONFIG, cluster_boot_config, core_config);
+	DEFINE(CLUSTERBOOTCFG_SIZE, sizeof(struct cluster_boot_config));
+
 	OFFSET(COREBOOTCFG_VPEMASK, core_boot_config, vpe_mask);
 	OFFSET(COREBOOTCFG_VPECONFIG, core_boot_config, vpe_config);
 	DEFINE(COREBOOTCFG_SIZE, sizeof(struct core_boot_config));
diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index f876309130ad..2ae7034a3d5c 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -19,6 +19,10 @@
 #define GCR_CPC_BASE_OFS	0x0088
 #define GCR_CL_COHERENCE_OFS	0x2008
 #define GCR_CL_ID_OFS		0x2028
+#define  CM3_GCR_Cx_ID_CLUSTER_SHF	8
+#define  CM3_GCR_Cx_ID_CLUSTER_MSK	(0xff << 8)
+#define  CM3_GCR_Cx_ID_CORENUM_SHF	0
+#define  CM3_GCR_Cx_ID_CORENUM_MSK	(0xff << 0)
 
 #define CPC_CL_VC_STOP_OFS	0x2020
 #define CPC_CL_VC_RUN_OFS	0x2028
@@ -271,12 +275,21 @@ LEAF(mips_cps_core_init)
  */
 LEAF(mips_cps_get_bootcfg)
 	/* Calculate a pointer to this cores struct core_boot_config */
+	PTR_LA	v0, mips_cps_cluster_bootcfg
+	PTR_L	v0, 0(v0)
 	lw	t0, GCR_CL_ID_OFS(s1)
+#ifdef CONFIG_CPU_MIPSR6
+	ext	t1, t0, CM3_GCR_Cx_ID_CLUSTER_SHF, 8
+	li	t2, CLUSTERBOOTCFG_SIZE
+	mul	t1, t1, t2
+	PTR_ADDU \
+		v0, v0, t1
+#endif
+	PTR_L	v0, CLUSTERBOOTCFG_CORECONFIG(v0)
+	andi	t0, t0, CM3_GCR_Cx_ID_CORENUM_MSK
 	li	t1, COREBOOTCFG_SIZE
 	mul	t0, t0, t1
-	PTR_LA	t1, mips_cps_core_bootcfg
-	PTR_L	t1, 0(t1)
-	PTR_ADDU v0, t0, t1
+	PTR_ADDU v0, v0, t0
 
 	/* Calculate this VPEs ID. If the core doesn't support MT use 0 */
 	li	t9, 0
diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 9369a8dc385e..3de0e05e0511 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -101,12 +101,14 @@ static void coupled_barrier(atomic_t *a, unsigned online)
 int cps_pm_enter_state(enum cps_pm_state state)
 {
 	unsigned cpu = smp_processor_id();
+	unsigned int cluster = cpu_cluster(&current_cpu_data);
 	unsigned core = cpu_core(&current_cpu_data);
 	unsigned online, left;
 	cpumask_t *coupled_mask = this_cpu_ptr(&online_coupled);
 	u32 *core_ready_count, *nc_core_ready_count;
 	void *nc_addr;
 	cps_nc_entry_fn entry;
+	struct cluster_boot_config *cluster_cfg;
 	struct core_boot_config *core_cfg;
 	struct vpe_boot_config *vpe_cfg;
 	atomic_t *barrier;
@@ -136,7 +138,8 @@ int cps_pm_enter_state(enum cps_pm_state state)
 		if (!mips_cps_smp_in_use())
 			return -EINVAL;
 
-		core_cfg = &mips_cps_core_bootcfg[core];
+		cluster_cfg = &mips_cps_cluster_bootcfg[cluster];
+		core_cfg = &cluster_cfg->core_config[core];
 		vpe_cfg = &core_cfg->vpe_config[cpu_vpe_id(&current_cpu_data)];
 		vpe_cfg->pc = (unsigned long)mips_cps_pm_restore;
 		vpe_cfg->gp = (unsigned long)current_thread_info();
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 9cc087dd1c19..1954c9e912b2 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -40,7 +40,7 @@ static DECLARE_BITMAP(core_power, NR_CPUS);
 static uint32_t core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
-struct core_boot_config *mips_cps_core_bootcfg;
+struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
 static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
 {
@@ -212,8 +212,10 @@ static void __init cps_smp_setup(void)
 
 static void __init cps_prepare_cpus(unsigned int max_cpus)
 {
-	unsigned ncores, core_vpes, c, cca;
+	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
 	bool cca_unsuitable, cores_limited;
+	struct cluster_boot_config *cluster_bootcfg;
+	struct core_boot_config *core_bootcfg;
 
 	mips_mt_set_cpuoptions();
 
@@ -255,40 +257,54 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 
 	setup_cps_vecs();
 
-	/* Allocate core boot configuration structs */
-	ncores = mips_cps_numcores(0);
-	mips_cps_core_bootcfg = kcalloc(ncores, sizeof(*mips_cps_core_bootcfg),
-					GFP_KERNEL);
-	if (!mips_cps_core_bootcfg) {
-		pr_err("Failed to allocate boot config for %u cores\n", ncores);
-		goto err_out;
-	}
+	/* Allocate cluster boot configuration structs */
+	nclusters = mips_cps_numclusters();
+	mips_cps_cluster_bootcfg = kcalloc(nclusters,
+					   sizeof(*mips_cps_cluster_bootcfg),
+					   GFP_KERNEL);
 
-	/* Allocate VPE boot configuration structs */
-	for (c = 0; c < ncores; c++) {
-		core_vpes = core_vpe_count(0, c);
-		mips_cps_core_bootcfg[c].vpe_config = kcalloc(core_vpes,
-				sizeof(*mips_cps_core_bootcfg[c].vpe_config),
-				GFP_KERNEL);
-		if (!mips_cps_core_bootcfg[c].vpe_config) {
-			pr_err("Failed to allocate %u VPE boot configs\n",
-			       core_vpes);
+	for (cl = 0; cl < nclusters; cl++) {
+		/* Allocate core boot configuration structs */
+		ncores = mips_cps_numcores(cl);
+		core_bootcfg = kcalloc(ncores, sizeof(*core_bootcfg),
+					GFP_KERNEL);
+		if (!core_bootcfg)
 			goto err_out;
+		mips_cps_cluster_bootcfg[cl].core_config = core_bootcfg;
+
+		/* Allocate VPE boot configuration structs */
+		for (c = 0; c < ncores; c++) {
+			core_vpes = core_vpe_count(cl, c);
+			core_bootcfg[c].vpe_config = kcalloc(core_vpes,
+					sizeof(*core_bootcfg[c].vpe_config),
+					GFP_KERNEL);
+			if (!core_bootcfg[c].vpe_config)
+				goto err_out;
 		}
 	}
 
 	/* Mark this CPU as booted */
-	atomic_set(&mips_cps_core_bootcfg[cpu_core(&current_cpu_data)].vpe_mask,
-		   1 << cpu_vpe_id(&current_cpu_data));
+	cl = cpu_cluster(&current_cpu_data);
+	c = cpu_core(&current_cpu_data);
+	cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
+	core_bootcfg = &cluster_bootcfg->core_config[c];
+	atomic_set(&core_bootcfg->vpe_mask, 1 << cpu_vpe_id(&current_cpu_data));
 
 	return;
 err_out:
 	/* Clean up allocations */
-	if (mips_cps_core_bootcfg) {
-		for (c = 0; c < ncores; c++)
-			kfree(mips_cps_core_bootcfg[c].vpe_config);
-		kfree(mips_cps_core_bootcfg);
-		mips_cps_core_bootcfg = NULL;
+	if (mips_cps_cluster_bootcfg) {
+		for (cl = 0; cl < nclusters; cl++) {
+			cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
+			ncores = mips_cps_numcores(cl);
+			for (c = 0; c < ncores; c++) {
+				core_bootcfg = &cluster_bootcfg->core_config[c];
+				kfree(core_bootcfg->vpe_config);
+			}
+			kfree(mips_cps_cluster_bootcfg[c].core_config);
+		}
+		kfree(mips_cps_cluster_bootcfg);
+		mips_cps_cluster_bootcfg = NULL;
 	}
 
 	/* Effectively disable SMP by declaring CPUs not present */
@@ -373,17 +389,23 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 
 static void remote_vpe_boot(void *dummy)
 {
+	unsigned int cluster = cpu_cluster(&current_cpu_data);
 	unsigned core = cpu_core(&current_cpu_data);
-	struct core_boot_config *core_cfg = &mips_cps_core_bootcfg[core];
+	struct cluster_boot_config *cluster_cfg =
+		&mips_cps_cluster_bootcfg[cluster];
+	struct core_boot_config *core_cfg = &cluster_cfg->core_config[core];
 
 	mips_cps_boot_vpes(core_cfg, cpu_vpe_id(&current_cpu_data));
 }
 
 static int cps_boot_secondary(int cpu, struct task_struct *idle)
 {
+	unsigned int cluster = cpu_cluster(&cpu_data[cpu]);
 	unsigned core = cpu_core(&cpu_data[cpu]);
 	unsigned vpe_id = cpu_vpe_id(&cpu_data[cpu]);
-	struct core_boot_config *core_cfg = &mips_cps_core_bootcfg[core];
+	struct cluster_boot_config *cluster_cfg =
+		&mips_cps_cluster_bootcfg[cluster];
+	struct core_boot_config *core_cfg = &cluster_cfg->core_config[core];
 	struct vpe_boot_config *vpe_cfg = &core_cfg->vpe_config[vpe_id];
 	unsigned int remote;
 	int err;
@@ -541,12 +563,14 @@ static void cps_kexec_nonboot_cpu(void)
 static int cps_cpu_disable(void)
 {
 	unsigned cpu = smp_processor_id();
+	struct cluster_boot_config *cluster_cfg;
 	struct core_boot_config *core_cfg;
 
 	if (!cps_pm_support_state(CPS_PM_POWER_GATED))
 		return -EINVAL;
 
-	core_cfg = &mips_cps_core_bootcfg[cpu_core(&current_cpu_data)];
+	cluster_cfg = &mips_cps_cluster_bootcfg[cpu_cluster(&current_cpu_data)];
+	core_cfg = &cluster_cfg->core_config[cpu_core(&current_cpu_data)];
 	atomic_sub(1 << cpu_vpe_id(&current_cpu_data), &core_cfg->vpe_mask);
 	smp_mb__after_atomic();
 	set_cpu_online(cpu, false);
-- 
2.25.1


