Return-Path: <linux-mips+bounces-3217-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18578C309E
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B66A1F217BD
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A74355C3A;
	Sat, 11 May 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="bxHyoLv7"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2117.outbound.protection.outlook.com [40.107.241.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D554FA1;
	Sat, 11 May 2024 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424239; cv=fail; b=FZI86eU+/ICUnIF4xV+P1SxpQ9yMDw+XAa1btY2ECM8Bce1YXGf0wJNBzqOg/2q/TDURWY8ybpCJ5vYLO6DMJ+Ccj75JFPvbXsCuBbmTF2ltV5ieRrnL90V3YeWsYXndgq4jZhFFIi+d/1sgl0zXzKfyiM3vJkAvOq+9xlDqEfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424239; c=relaxed/simple;
	bh=X9kGyjX0A023sa1me5ydHQ4kkpSaw1f12Pqld68DG5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nwbFGuuIbCmXLhWCEnCjsYZ61/vBNK2tdEghp4xjbqkXiAQgGIq7hQ6fsJMmNhMRYkNRCbHEftpOUjv7QBnNYx7OuKUau8DlLZG2IRRPdrhmZFkxuAbItWngW7KdqjWlDPd3xUo0JfilIRIO8LHKvBtgn3YUY7YsieGiQoyDaOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=bxHyoLv7; arc=fail smtp.client-ip=40.107.241.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfVSsIGL7xikHvLDkhvPEFz0J9jvqGuE7WoWLtrJubmjNIFZfw5rrg0KdIJr5eiyvM8k4VgDWK1dy25zGVi1eKwnxaYlahh/aYZLfJaiXhrTUoVRN4O87IbgT6TtrudtEIdNrqxrsgEJrkHAt7UmwCWwMqoUgZm2Stx+y7lgQSGGA84TgJpy+cYTGfRriXT++8EKM0V82XdHz191SS8YQmWBVA9nZ20fhm/v8GC5gDRaXaOQnddMPBKinSb3i4TDQzUsBB3hg7U5hUHxQL8o18l+Ajyba2DHJCvSBPiSe3zaSmuc1vjbH/EyhDBihh/EpdG47i+W1eb/zFx7UoZK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MZzWBaZUGJjKQYqoFCtII5h/zY5rCDVY9jpCuKraKk=;
 b=GchwZr+Iu8bJH6+XgxFlX9MnFPDCoish30W43okEwsU9qUA/Ct73YaJVFrEgziojSceldzaeDOzm6AYxuBgA/NVKd0DA4XX2qfUlhIUCeuB4QZqSyCtEr/+ImnEg+WEVyTtQCOM50O30K8E5FyWsaw73QsrGhjZfn70ZN8fz/Tpg5I0w/8Sec7s3Eq/rouJlg25w+visRtH05LOZTiPuOGuTZhUkWOm2l/PaTY6zHH6dQr8KSLxk5vzylon8uF3M7/kZsv3l+1/++KVMFeRRbCus1OOjGP5OhMic/yDk1mu1GBhT2p27ZtBYGlczF0582vwaRLZSFXEvqKKdSB0KEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MZzWBaZUGJjKQYqoFCtII5h/zY5rCDVY9jpCuKraKk=;
 b=bxHyoLv7bXpVnSJ1RV9wP93Jzy1aJTKWeyi/RFn+6dwPAYcK0HOqFHtAq5zds4w4DRcS2waNfpEVpYePWrBZTBgapJiKo+q5kH6Q7wD+UAG+m01pzLggZnpqkp1bNCtr9A+D23/BK4oD4350D5d3WuPB6UZPLjvv6e8uv6ciu0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:49 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:49 +0000
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
Subject: [PATCH v4 01/14] MIPS: CPS: Add a couple of multi-cluster utility functions
Date: Sat, 11 May 2024 12:43:28 +0200
Message-Id: <20240511104341.151550-2-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5b1f8ae6-dc69-4f12-de05-08dc71a73de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XFNcU5rtWIwo9J+53j09LXrh4P5iE3KMSOIKrwglXaPFIjlyTWlKz0R8l3cS?=
 =?us-ascii?Q?Aqp6DpEFLV63AlI7+e8c9To20x4pxVRNbO/ib5e/qu8tuP4NZukEF5wC5T0x?=
 =?us-ascii?Q?RoSq+nVH52Y1XLuMYzHxvE33/T7HcRmGy+yikT7D+4Ji8m/kLbTUrflC3lMu?=
 =?us-ascii?Q?6M/Apni8JONyPg+r7ChwV9OPwvQJLpQj4QZp9pnbtfvyLti9uhikULh8X++E?=
 =?us-ascii?Q?9XEyOv8R0ni3kI4j1OmvYbMqkC7Jf8j1C4YUBu4sSFEdvyaze+4s1PbG37VG?=
 =?us-ascii?Q?KepXLxlArX/quPWZqpxm6iRyGzne2AWj8lMAexVnSva2RNHMTWrZwAz5Y+67?=
 =?us-ascii?Q?TtXRve4DvtzxiKL3yP1CezRHzT31KKDY46myZ+FcvDf6caB+3RuNgm55pwxs?=
 =?us-ascii?Q?h2c4hG/0Kt28vgSJml9UR435wga56HPz7A+4we2LU5/1MkbVm+kUmHGIIb5i?=
 =?us-ascii?Q?/drKO8p03I+jifVX62+zbvu9mbEBgRTFhvpLYdnvD2wUtYj0WsOqGLVXNB9b?=
 =?us-ascii?Q?873HJpUtzkJM4Vw+XdwBQz2D/4yQnSmgXeWQDGn4rVPPZ1ufTdgiHo/cM5Cv?=
 =?us-ascii?Q?wmy5BqDaT3YCsxpVhohWz8e8XwOrkuWLuoSG79qVa3MHQ6G0Hbk2I8468D4B?=
 =?us-ascii?Q?DBgLplhIXsjeeZo1vWX3fu059nylAI8hpgQS+I1G4yB4uLn94dyBmaYuhyZO?=
 =?us-ascii?Q?3lM3QcLSNJkp5ac1ypqYa0V//4Fn5u4DqeMlKUJLFFIh0D+4qLutpY20oban?=
 =?us-ascii?Q?WuJNk2d2QB9Zk6OvJtUCvXljYi14t98+JvAsRzuRoChwQQHzhWtXwv86zRKZ?=
 =?us-ascii?Q?nw8POQE21uLcNQqUksSVtvStHsHoiaRMm1PUb+C9RoLQu5zH7oxlDhI2u4Lv?=
 =?us-ascii?Q?ycleDR9RqJWch3o2XMM4ymj6Z+IH5aWNqPybCBOcMEZAomae/wSa2+c9iDCZ?=
 =?us-ascii?Q?bw6AHIVbxjxd+5kJSdLrtNkKsJhJIDyLfUfovAPLT0lLvphKv84ZSOB9SSyW?=
 =?us-ascii?Q?kzduQGe4tVjWfrzb0FHsnq4Fc3D9RQTPZ2fwGo9OLfxQ3tFA5uklN458Vgjr?=
 =?us-ascii?Q?iLGMpArhsNm+sEGratC5IaEOK84FYc/K9bMX3vhInWb+qDJ69xvOyPnzEo5e?=
 =?us-ascii?Q?/pwvogi91smbgQDWs9YyPXjS5Uvzt9YHnyQf+dl4jnqvQoC6p24Dy45dBVUL?=
 =?us-ascii?Q?7Cpc9ASMwDC2OKRM88P6eYxv1v67gRuFYDTGKM1L7S7RzLYPeUECwBrb9CMn?=
 =?us-ascii?Q?ctyVtjs/BpWPaR2TqCPGJ73XbfjRwYR8pzl2m5Q/mGIdyv88gqJoyO0bRguc?=
 =?us-ascii?Q?iiFRxYyTM6cn2X4q7gzXYBOQiirhhPrGHp5gi8cjVS2f+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TbIzEslE5HaXz8OYWX1ZgqIS9Dkqe1Dp5bKrVEjJJYqmPl7OwKxLpiNw22Cf?=
 =?us-ascii?Q?cgXCifZQzHXed1XkWcmFgzZzAagVc/l0wWSWaiK2lVNNX+5nbZPDAbduKg1u?=
 =?us-ascii?Q?LbKEiC8j1+U5//9g8ER/G3ZZ2AWzAHX/tWp7T+as/BP8E8DaO9t6neU44ck6?=
 =?us-ascii?Q?07vbEDYij8X1dESGNqe728IqEk08KrRMErIAj8g1RLVXPT7cMwfyMVOWXgRG?=
 =?us-ascii?Q?EEmrOIG7nNLSLZVuXlyhvHqyuMyJadvW++mgFWCW3yyoQQ+hP1pD4gjthmZM?=
 =?us-ascii?Q?pNBNvQuKukTvvwkF/bKd7sIgLIZTo1GYyASxMtc218JdHF6Iy5kmT41R09l4?=
 =?us-ascii?Q?KYJtNTMm+OX5fCEk4upPm15FlJwdvS36JLdDuTkTqAx146eCdTMazUrU5qkQ?=
 =?us-ascii?Q?UjrQYm0bDLt5RJxQjSQn5NmzBKokK0l88sf7JZa87yHuB6ydAN/tNnlWtIQh?=
 =?us-ascii?Q?VVC/8ccMT2FeRz0GivNtR3Dbce1y2pp9mRLpwAGcAP+3kIQnYowR00yE3xIN?=
 =?us-ascii?Q?oiVwvTsVKWSldfDQoi7C87i+XcnR1AveEZOcm67abwpS7Raj8GfPt7QWHrXn?=
 =?us-ascii?Q?MfnUGFQtLFgSjMX6dgqa+11c9EY4hK86YwVM8YgJI8saB3HHHDTvRAciDkaw?=
 =?us-ascii?Q?HPcHe4+DdrWjxIGdHAAXRixmHm01QW2BSYFvzgoLkNzJv2B8t7HTDsw6wsKQ?=
 =?us-ascii?Q?HMGZFFEiUL3dwPHQieC4DaLsVb2d+xiDq++V7movSMGmaTNLhgsXA94Nx7nn?=
 =?us-ascii?Q?RvQS1kiO4ekBQR/htkxFEkwBH3w7QpGDZ4PJkKvjJabd7G4Z0I+CmFM2FgId?=
 =?us-ascii?Q?otttbTsc0iOngBXoVVEaxhZu48aFMKcRZC0rv6OcYtC61qePY7XzCQAf+S4S?=
 =?us-ascii?Q?7FxocAEHJ0UvrojtEv3TnpK+tJROmTev5VkDsCfxXJzI8vlS0BOXmK3m2Ztk?=
 =?us-ascii?Q?YK/AJGqt7uJ4GrqsWc5YvWX6ETMV+1Rg3E9G7/YG9U/hef7NzO0kS+xWNriO?=
 =?us-ascii?Q?SEdddiDvQSFA7aUHX64g+7qXliOlC9woaDDMQGTpGqnwY6zkFaKJYBVeGVAF?=
 =?us-ascii?Q?grEUh+s9wUUg6uCEUcthssPv12tW4VF3cc1unlIg/t1xi2cQJwUOFNol6KWu?=
 =?us-ascii?Q?qPt5uvhpRGszOCjXQr29k4aXMxA3SaPSGfEHYbE3QMT5OnKKXmlFgZqcc8/C?=
 =?us-ascii?Q?birHRaoLZw3YwTElxxtay51tzVVpJD6xlE9+XyPGWeh3es1mzt7e+ciaLHYm?=
 =?us-ascii?Q?D7Mt5Q3SPit/Rc9/+k9N3IMEACMPDnKboLhawwgukT78RzOaw/hiitrO2LG4?=
 =?us-ascii?Q?WS0k8oi+bNEzOHQh7VKC4zM3/BN5YZdy/6IsRcM+4RvyEyziQ6g+lxJMwrUm?=
 =?us-ascii?Q?lTKJKDvxHvPLaXkxaOSjPE1mmFq0zJv5OsmU7+a0Iq3LA8H+WC4vtmaNkaHM?=
 =?us-ascii?Q?B3GSJG0dMiGN4ML3VymkiYxBOC/0D839LuX4YKJcitfzeAKhJik/vxH8jl8i?=
 =?us-ascii?Q?uj4ivxJWZ7rmJOcCOciQf13w4MB0TC36WhDRWmTggOnoU42XbPocBH/QG3z3?=
 =?us-ascii?Q?C7qjvyYBOT2PfHGQLI9llDPUpZmD6XXVUhdYOW0+s+pro7bkjN0YfVgYFNN5?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1f8ae6-dc69-4f12-de05-08dc71a73de3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:49.2340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbzPFbYN1x07Xu6VaVie0BPSkctHOd20NmELFXXJqO5RdiZwm5xCmdnEYtUCMB8UmlhsMSC2yJ7miAqVAJvUGygxsvdvZZQUu4WKMFDbi3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

This patch introduces a couple of utility functions which help later
patches with introducing support for multi-cluster systems.

 - mips_cps_multicluster_cpus() allows its caller to determine whether
   the system includes CPUs spread across multiple clusters. This is
   useful because in some cases behaviour can be more optimal taking
   this knowledge into account. The means by which we check this is
   dependent upon the way we probe CPUs & assign their numbers, so
   keeping this knowledge confined here in arch/mips/ seems appropriate.

 - mips_cps_first_online_in_cluster() allows its caller to determine
   whether it is running upon the first CPU online within its cluster.
   This information is useful in cases where some cluster-wide
   configuration may need to occur, but should not be repeated if
   another CPU in the cluster is already online. Similarly to the above
   this is determined based upon knowledge of CPU numbering so it makes
   sense to keep that knowledge in arch/mips/. The function is defined
   in mips-cm.c rather than in asm/mips-cps.h in order to allow us to
   use asm/cpu-info.h & linux/smp.h without encountering an include
   nightmare.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 arch/mips/include/asm/mips-cps.h | 38 ++++++++++++++++++++++++++++++++
 arch/mips/kernel/mips-cm.c       | 37 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index c077e8d100f5..fa71cf3a25d7 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -228,4 +228,42 @@ static inline unsigned int mips_cps_numvps(unsigned int cluster, unsigned int co
 	return FIELD_GET(CM_GCR_Cx_CONFIG_PVPE, cfg + 1);
 }
 
+/**
+ * mips_cps_multicluster_cpus() - Detect whether CPUs are in multiple clusters
+ *
+ * Determine whether the system includes CPUs in multiple clusters - ie.
+ * whether we can treat the system as single or multi-cluster as far as CPUs
+ * are concerned. Note that this is slightly different to simply checking
+ * whether multiple clusters are present - it is possible for there to be
+ * clusters which contain no CPUs, which this function will effectively ignore.
+ *
+ * Returns true if CPUs are spread across multiple clusters, else false.
+ */
+static inline bool mips_cps_multicluster_cpus(void)
+{
+	unsigned int first_cl, last_cl;
+
+	/*
+	 * CPUs are numbered sequentially by cluster - ie. CPUs 0..X will be in
+	 * cluster 0, CPUs X+1..Y in cluster 1, CPUs Y+1..Z in cluster 2 etc.
+	 *
+	 * Thus we can detect multiple clusters trivially by checking whether
+	 * the first & last CPUs belong to the same cluster.
+	 */
+	first_cl = cpu_cluster(&boot_cpu_data);
+	last_cl = cpu_cluster(&cpu_data[nr_cpu_ids - 1]);
+	return first_cl != last_cl;
+}
+
+/**
+ * mips_cps_first_online_in_cluster() - Detect if CPU is first online in cluster
+ *
+ * Determine whether the local CPU is the first to be brought online in its
+ * cluster - that is, whether there are any other online CPUs in the local
+ * cluster.
+ *
+ * Returns true if this CPU is first online, else false.
+ */
+extern unsigned int mips_cps_first_online_in_cluster(void);
+
 #endif /* __MIPS_ASM_MIPS_CPS_H__ */
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 3a115fab5573..3eb2cfb893e1 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -512,3 +512,40 @@ void mips_cm_error_report(void)
 	/* reprime cause register */
 	write_gcr_error_cause(cm_error);
 }
+
+unsigned int mips_cps_first_online_in_cluster(void)
+{
+	unsigned int local_cl;
+	int i;
+
+	local_cl = cpu_cluster(&current_cpu_data);
+
+	/*
+	 * We rely upon knowledge that CPUs are numbered sequentially by
+	 * cluster - ie. CPUs 0..X will be in cluster 0, CPUs X+1..Y in cluster
+	 * 1, CPUs Y+1..Z in cluster 2 etc. This means that CPUs in the same
+	 * cluster will immediately precede or follow one another.
+	 *
+	 * First we scan backwards, until we find an online CPU in the cluster
+	 * or we move on to another cluster.
+	 */
+	for (i = smp_processor_id() - 1; i >= 0; i--) {
+		if (cpu_cluster(&cpu_data[i]) != local_cl)
+			break;
+		if (!cpu_online(i))
+			continue;
+		return false;
+	}
+
+	/* Then do the same for higher numbered CPUs */
+	for (i = smp_processor_id() + 1; i < nr_cpu_ids; i++) {
+		if (cpu_cluster(&cpu_data[i]) != local_cl)
+			break;
+		if (!cpu_online(i))
+			continue;
+		return false;
+	}
+
+	/* We found no online CPUs in the local cluster */
+	return true;
+}
-- 
2.25.1


