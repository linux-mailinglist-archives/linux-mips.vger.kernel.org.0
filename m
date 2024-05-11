Return-Path: <linux-mips+bounces-3222-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 895298C30A7
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1698A1F21819
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B5B57C9B;
	Sat, 11 May 2024 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="TVOqaAjf"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED7256B6B;
	Sat, 11 May 2024 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424243; cv=fail; b=hCwuM2Pu28InDL7OKcKw6E0AUiiNjx1niqXVkBl/JHw2wg6QKF5f2qtziH7id7YL1Qm/Bd5f1sECt1UpGE8+7PpEoCeZ7XPnOSI5cmQjxKsKmcvq1xm7YcweVXC+5V+oqMiXJGD+sidddVnRLxtfyNDx+e1/dVjbp60q4bCKhs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424243; c=relaxed/simple;
	bh=wP4lf4WXSQZDYadQNIiHWIyoFrQJ70a3ASMKKFuF5+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kk7mGALbjlndMEQo7Lbz3RmiWi2bukiNWqCOyuWcyQcRSVsMtJESzkXlOE7DPP7EO5dbchZ+3rM00S3AWrCMrmq5/a0AnSUB3ZGT14C5fDxVYCBwcPIAEB+L74LBb5cK2BXRxzB8aMDWeYg8IdXsjOfEE6MFcGWxLzPOHPN4tO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=TVOqaAjf; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6wbHVc2dnHzlgjf081Uey2jmlV8vJX6Bbo/LmXbBuacfNQsrr2tpL6RCOY/69Z8RW6pBzluw5679pHoDzwRnCMuSqwwiktilJz6BiLdbtlwNCyC92m1qxyUv4Yn+oA163ivAUjo0He+rIAGCrx+Sq0Fbx3ivljlfAnnGnAx6KH4gduFZpacHJ9EWdJWb04R+1J35wFn94NrmPluCxWkKNJFN0QTAUX7EZB4guBOSK04HulF/cA901xNKFis7+jkMoiT4UyZhv4F3T9M9Oj6abr+8Eol+RYYqWqy1/T+ijS1UfN0T6DSy31uKAxnxQPMgvL/iMDjNNLkP0h5pPL4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycEafZF00N9zzFb7QKUWXvaaWImNBOBHoDnUbB3BRsg=;
 b=KslxM0wTZMTq9/2PYPiMMkSUb9/gXgQ2K9iFnM33KqcaQXZ9SF6FZL6HURx95ERb7FlbwRiYSDGQhSBa8b+kCoWVHumpMPd/qR6rPGEgkE5HVkkKTY5RcXHGd5ew5kPa+Nnr9zFA2B8P0i3bO3hlSAW1FxTUfhJMmoflDghE9oPPBHsnTRX2VDNflY6t1452Ql4QvMldJUqoUVE0/QS1Yt2j2Qkx3DwYB8gpXi6HrVb9D8U0CdHRxr1M2w/WMXEsiTnMtahRmn7z+LojMdAxWl3iGFL3oBupVOTISPFk/o0gB6HJKW/v+qCUEQIWMjp0RHAr3b6jSW0HNpkz6Ceb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycEafZF00N9zzFb7QKUWXvaaWImNBOBHoDnUbB3BRsg=;
 b=TVOqaAjf7HCM7IkwgVj3x9CN/MWe02ReQ7UGTdvg66sOOkgEI+ixp5H6HkWErJjth6Ghj4qfYeKafboWpH8XeU93OhjAN6Q6jHtJC0h/epxUbHyVv/p2kIfmi+yZsBbc20v4QrZoAeuj9LsBaq2BjruVqWwHvJ0ccrjzzlgcDrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:55 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:55 +0000
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
Subject: [PATCH v4 07/14] clocksource: mips-gic-timer: Always use cluster 0 counter as clocksource
Date: Sat, 11 May 2024 12:43:34 +0200
Message-Id: <20240511104341.151550-8-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: d55b0ef7-3ffb-4a2f-60e0-08dc71a74198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jXNsPoWWxg/pEc1PBJ5I82IOqCHXGPRrA+KTlUTzNh3xOQhC+VrkxCCEzmf2?=
 =?us-ascii?Q?9lr7LIXqLmI4RkmiGb+G97MuMRxzxfpMLwUL27f/zBKT3M8HXU6blos4XyEH?=
 =?us-ascii?Q?s702Vct2eOYIT+B4SLfbenKZusg8ybVQkEdisO2cd521njgnp+qoFVfEZIXP?=
 =?us-ascii?Q?03LGVy0yewktnIhTPCQhF04IURkDZlmO/ZqwRQBAj/oxABRyYpp/RZ9AUDju?=
 =?us-ascii?Q?6sHtd9VVED2XNc5aroXUVlsfhlRyHXL3yE1BXYOJ/qS9lzf+9kTQOt9FRRfu?=
 =?us-ascii?Q?lfK5iPCn3sj6V41owqnSh8BL4YrZvOnnOlZEqZ3zF8K+6uQR5LkOtiuTMnmP?=
 =?us-ascii?Q?IYdq4ZWmoRaRnKspQ7vZhYAaxuAInpjZHjdDkiE9DrNeQ+lsIHC/vJ0taIzD?=
 =?us-ascii?Q?5NyBKj4NHmw8KyrKQ3Fyt91NRWWT8cpqz9ZSVzb+HSBE7iGdUTuRZmR+kqvl?=
 =?us-ascii?Q?Ih3IOLsLeaI/Cwj56L5vTH6Rm3FB/3kRqFy1eQ+lgqwwGXg00+xEuKuhRbCW?=
 =?us-ascii?Q?/2iHHQVf2M8H9Je06VVNx4t5kBqt9Fhc7VYP1Tz0RnBWyPZCTNGUH4FGJxnH?=
 =?us-ascii?Q?6bkYsnQJeil8jafQ5dOf6/2Wu6uv7bYhuh/LMcTlLhrnqgwC7EwilAd7zFhW?=
 =?us-ascii?Q?ud3fx1Cqw9/akchSasAGAtaM3ecmOya7Ys3+N2K+iD8hOr2JNTmUwrmQEnSH?=
 =?us-ascii?Q?zqgs70s3EijQk03vIqN6pGX61bz31NWB3q79O8pDjjzhOUp49mQrM9Dqn6k1?=
 =?us-ascii?Q?Gcm+Xxj0ak+bOb8qwB2Ji8dwC91j6UDKcFrVzTDNyFNzCxKUzK5+NEXGaryL?=
 =?us-ascii?Q?+/MZflN/z0P8hF3m0Fk1C0WmpaaUbxmxfmznYEjyBfrcXsDvlH6KGC00QAbX?=
 =?us-ascii?Q?y4myfV0gEV2qYBeqTEkmfVKmXe8vT4L1JjoyS6F1i0w+7OaPnXRi3ic8RmWi?=
 =?us-ascii?Q?r6RsNLc6m5Jk+reuhriow7drNqWzSmETrawzZQbwstfpyQj3bEF5c3oKW+0y?=
 =?us-ascii?Q?F9xlUvQNmqsREEldLs3bojBqfAmyrt7TqYQKe3LKxtwC8xHky+IaGaONn9fh?=
 =?us-ascii?Q?a2n0L9raLiZ9jJHYZLb0e0VZ/2fThNpIt/xMy8nqdk8kEvSuSuB7PI1M1tV2?=
 =?us-ascii?Q?RXxPs+/cRy0L3ktgKiNm4Bf8eWFd8mWafldfNbF9pY+xz5UuufLhEd4fjbN6?=
 =?us-ascii?Q?UsAx2USUc+BQ1xfRmYiOSjK+v/KeJC/7UE7wJDPEO6N5ukUtEDtx7GMxpxGt?=
 =?us-ascii?Q?qd5PhoxAqusR/DQkRXzSuk6fDaDymB1tdvoDS39jxCpb/aNPQyS4VR5wl/83?=
 =?us-ascii?Q?mzUrxTXFXiWdO8k84U4NM8z3Bhb1vopzYxGI7ExRk03NQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cbGggZ9aK08btIPpZWU0HiQHWt/WJCkvTQLa3RES12Q3lljjMWBkZtbD0f6f?=
 =?us-ascii?Q?rcElkapgm2lHNOyJzwFLuKuAnK15dE9+8g77wwpRguQ+e7YgZA8eQXIe6RtO?=
 =?us-ascii?Q?7rHqmcViWFa13ArL/a2wu2BMNzVSn/t3cbT6Z6dpNADZ+cMrGS0inu8PZaDV?=
 =?us-ascii?Q?5CkIzcOjnHaTCTY3QGeHBAeTllKMybs5vpLHEjbi75ZSPqNM8DNoOn2E+j5N?=
 =?us-ascii?Q?SHrcwjGeviOUDg6xCKKopmD+kc3iDIx3T/x3zaogwYX5WeTDNWMQBP8rRDAs?=
 =?us-ascii?Q?LENBP1Dt+lNk+YqGtEKCB92sfLnJqlsV4g4UdvEtE8nPodUfCcuOst5MmSBh?=
 =?us-ascii?Q?kBmK4sG/wdG2SMdwoIKI+Dc8B5O9FrC6Vwz9XwJwZmgT7mNoLmK40D7u7A+2?=
 =?us-ascii?Q?bqRqEbhXNGt7TLKZ9ro01m1rAmiLmBnSDMZiykR5C2Tj8RaUj0CFKx0Ut4pA?=
 =?us-ascii?Q?XmuhIqWTU9mPhsV/9nt8lKG+lug3Br3bydRmZE4Tz7t6U8DxhJtZQqcVSxyL?=
 =?us-ascii?Q?3NzWb/YWhBkkxQ+ZzTkSZaOSENn7Gl69USOgC2ZamZUVz85KqWVf/aAhnBL7?=
 =?us-ascii?Q?8z2yQq9Re4Ni8m5IICxuIW3kM/TzASfFnhD5B+Y25iKrmG0AhUXMw5ThmY5p?=
 =?us-ascii?Q?7yhv4I3dO2mEayHwf4uXyFRj0E6O0nPhkd2zdLeV1iqEnShcNreqyfyaQsPo?=
 =?us-ascii?Q?V1HzjCq0skol1wnZSJN1w7OYq5nLNCcpb1rNNU5IyF92mSIMCieY0nRud5tz?=
 =?us-ascii?Q?5S4SCxIeMY7Qb8stFxNvm+hng1TEJfDr6e+o9487kGpCaqzjkMqkZBk7dcft?=
 =?us-ascii?Q?e9GEEgbh5pK5augFCKuM0cQ5r8sFHpnhZb0pAcStCT68w9LL4ocs4T2oocww?=
 =?us-ascii?Q?01fqnJa0AZBv3qJDxsZ/SyCDJ0GdNa0K0bbrzMLLnSU/TLmK7Wc3h7YLCwQ9?=
 =?us-ascii?Q?ICt30Xdzb3m0OdkdWinouiUaXxEttzEAmZ1XkG4hfYCROcOPdd6TrkBMonnl?=
 =?us-ascii?Q?gmeJF0K5Ew+NRxALr11vqTHeDpECVQ3Hcf4yrSpw61qszfHmb24dgEDH7nG+?=
 =?us-ascii?Q?ZtzYDczILa45u0RCJM676LcI1MLlpMuwpVmccjXa0/TMGMe6uRkYh4JVvfc5?=
 =?us-ascii?Q?xbVsJnhdSMYteqypkZIcCeRP4gBsiddhYHDQRxefzj99/aZdhuSJgA8hqcf3?=
 =?us-ascii?Q?IqQyzRVoMCwzqP8epyNCaggtU5LZ2zzavZYItYISQHUts/avSJgWEO85BHEW?=
 =?us-ascii?Q?htP45nlsb+vJ8/SXqPL4N0GUR3Cw4Kv8YG6BlOO+dc/y56+d4eM/fOiCRRZw?=
 =?us-ascii?Q?TbyUohXZRsdXWi4MxpiXtTxHnJpTuzWaVqG/WZYZcKsg49EdPMI41DkHVshQ?=
 =?us-ascii?Q?0pX3Ln9flCNVUwmlz6XRPdSNByuZXKb9djblxJ58kNr41GNNGFIbdKGGMz25?=
 =?us-ascii?Q?m2P42fLHe7PARvGAHPFIjKeuAfJWYCJmUEfWrFsl/1U7tCNOP2K1LMz1DD3S?=
 =?us-ascii?Q?XsXfgUWQCl/26Jgwm1ijNy39Fcd7QkyX/cIX1VjKWOiwgM3UmOuFniaR604Z?=
 =?us-ascii?Q?Y0l5ULnyiYaphMB4VrPT3KE9isHjivgXgp6yfS0eLZgvvXMC91EVVpNSpzSl?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55b0ef7-3ffb-4a2f-60e0-08dc71a74198
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:55.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVyH41qOSyNTqYp56WhW8fi2+iyxT6AN/4CXPdYohk/ZmoTDgBxW88MBBO8GCWNV6u1mlFo6m+LioFYauT6Mc76zOQd63ogGASyHNHFev6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

In a multi-cluster MIPS system we have multiple GICs - one in each
cluster - each of which has its own independent counter. The counters in
each GIC are not synchronised in any way, so they can drift relative to
one another through the lifetime of the system. This is problematic for
a clocksource which ought to be global.

Avoid problems by always accessing cluster 0's counter, using
cross-cluster register access. This adds overhead so we only do so on
systems where we actually have CPUs present in multiple clusters.
For now, be extra conservative and don't use gic counter for vdso or
sched_clock in this case.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 drivers/clocksource/mips-gic-timer.c | 39 +++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index b3ae38f36720..ebf308916fb1 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -165,6 +165,37 @@ static u64 gic_hpt_read(struct clocksource *cs)
 	return gic_read_count();
 }
 
+static u64 gic_hpt_read_multicluster(struct clocksource *cs)
+{
+	unsigned int hi, hi2, lo;
+	u64 count;
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+	if (mips_cm_is64) {
+		count = read_gic_redir_counter();
+		goto out;
+	}
+
+	hi = read_gic_redir_counter_32h();
+	while (true) {
+		lo = read_gic_redir_counter_32l();
+
+		/* If hi didn't change then lo didn't wrap & we're done */
+		hi2 = read_gic_redir_counter_32h();
+		if (hi2 == hi)
+			break;
+
+		/* Otherwise, repeat with the latest hi value */
+		hi = hi2;
+	}
+
+	count = (((u64)hi) << 32) + lo;
+out:
+	mips_cm_unlock_other();
+	return count;
+}
+
 static struct clocksource gic_clocksource = {
 	.name			= "GIC",
 	.read			= gic_hpt_read,
@@ -199,6 +230,11 @@ static int __init __gic_clocksource_init(void)
 	/* Calculate a somewhat reasonable rating value. */
 	gic_clocksource.rating = 200 + gic_frequency / 10000000;
 
+	if (mips_cps_multicluster_cpus()) {
+		gic_clocksource.read = &gic_hpt_read_multicluster;
+		gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_NONE;
+	}
+
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)
 		pr_warn("Unable to register clocksource\n");
@@ -257,7 +293,8 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	 * stable CPU frequency or on the platforms with CM3 and CPU frequency
 	 * change performed by the CPC core clocks divider.
 	 */
-	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+	if ((mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) &&
+	     !mips_cps_multicluster_cpus()) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
 				     64, gic_frequency);
-- 
2.25.1


