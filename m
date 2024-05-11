Return-Path: <linux-mips+bounces-3226-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 798678C30AF
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 12:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 058771F2221F
	for <lists+linux-mips@lfdr.de>; Sat, 11 May 2024 10:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F3560EC3;
	Sat, 11 May 2024 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b="eXHoVtX+"
X-Original-To: linux-mips@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2094.outbound.protection.outlook.com [40.107.241.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159BA5FBAA;
	Sat, 11 May 2024 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715424248; cv=fail; b=L6j0M/tI7gW7wPp0uWLEnPz1xH3GwUUrkXnXtBFJi7YiZ1KoauKrDKvuQveoA7Tswir2lBQishS2em6w51LslUY4RcahZ8bZJVsjmGzHt7s7MbC/F9dKJmYzO2JmfpYiBhJpJaFMPO8LkrUJ++TX9hPxuPra9zDNyOjBptCR3R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715424248; c=relaxed/simple;
	bh=NsWYgxwWADkeUwTDskneezz0oyS7GTeY9YDds2g1o2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e7pOaSh/wFIANMZPzXgFJgp/mvTps2LnDMDRIK9JeeygJ1p6QqvrG5qjNlfhdXLOVCbaKb/SAtQ8p5xQTZAxt/jlcw3lNOd/Ag9wtBlcLjGLI91C839XUupO9EN/wwuqogKrzPFliPfbZ8Sa4ZoT94LnUCecqLzP1My5BzyBkwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com; spf=pass smtp.mailfrom=syrmia.com; dkim=pass (1024-bit key) header.d=syrmia.com header.i=@syrmia.com header.b=eXHoVtX+; arc=fail smtp.client-ip=40.107.241.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=syrmia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syrmia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXDIMmGr/l2bBrnNmBk17xdzum5MXBGDdnppymyQgYTW6LUQK80m/ayIxniGsw6ZM829zZbjctjDggGvtuRF7/soNt68ZcZM48205Wh2IEgnUwkzZofZ413bL/MyqqjRpVZY4JMhvERzfcwUYYjWEByOML9WghL+XWT6A1EExqYik5CjGWpzOQPrkVU139stUzQXZCxUZoECF2HyN3OuRRoa79jL1E7gFhhqw+DaTsuHC6rHl/gb+NksmIrT8dxuPSTVtqR6RVUwErIj9ZIFIMBuB+ybC5pL1ZU/emwpW1oJKXLT2k2jVYdSqhqGslGvinVPnBGj7tCTlxdFO9dVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfaWHpbZm4r5fXZyRkA7sVboc5pXftUbrYbuEZf6WhQ=;
 b=Cyow0I41gNPlywoRagBk2GtYTEhXZCgIhNaS8wcHq65QO1a077RleTI/Eixhcg0tlMBqKNn65x5Uo+KfuQdLiNR6TlMYODABQGw4EjOFO0BS24+rv5Lwz3sRgZtgsJHCsYgnnVV39fELA/l7MkYZRIx6O2n9KXfxgG9C343XtaT5mLwomelb/IAR01ui8HoKSA+4fqpFgl6TLKVIHDdC9Kq5qRQMtNFUof03mtM7B+TO8DhYlMCQ0B0I3ndSAFTLv51K2bSiKd9V9VvcHdJc/LY2cqZWwaJ1yMD+Dt179Xhue+HrbHxIFrVfeMrT5RH6JAE8JAXCLkjVyTfN/8tYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfaWHpbZm4r5fXZyRkA7sVboc5pXftUbrYbuEZf6WhQ=;
 b=eXHoVtX+CbHAiLOnNguxVWnYkmM11ziHLVKL5UoTR4vdLhG7Xqc3YNa7jCNqXji+oQ/CwWN3Mymluq4YTmpI1kXQVvMD7WoareT63oKMNhHnDbLsv27degUNeQyRASlYyJqn1XtgaoQhtJFX0ihQGoo6nYBaDez3FBc4RXqPTXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::14)
 by GVXPR03MB8449.eurprd03.prod.outlook.com (2603:10a6:150:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Sat, 11 May
 2024 10:43:59 +0000
Received: from AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268]) by AM9PR03MB6916.eurprd03.prod.outlook.com
 ([fe80::b417:d676:e3ff:9268%3]) with mapi id 15.20.7587.018; Sat, 11 May 2024
 10:43:59 +0000
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
Subject: [PATCH v4 11/14] MIPS: CPS: Boot CPUs in secondary clusters
Date: Sat, 11 May 2024 12:43:38 +0200
Message-Id: <20240511104341.151550-12-aleksandar.rikalo@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: a7ac2151-7c3b-4c54-0ec6-08dc71a7440a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j73KAsM9F7ihvkjkhqRmwlyZ3Vk1RqkZ/THct5wSshaTghlHfVEyFbvrbvXN?=
 =?us-ascii?Q?9zoCprEKKEg/onGXjGA7h4PzNKpgr1zkX5lKG2oMm+MOdKx1pNFrvcdrI1BR?=
 =?us-ascii?Q?Ivkt0l7agTSfIECYLM1/SS85PZFMdwzitdG83/LkvVGWLIpIWaKWDUtEYJX9?=
 =?us-ascii?Q?+qdKNj2IGPjojEjETg5PDzLCfHnbwuEfInXdoqJGbvdjXensQ6iPwXwTAnRH?=
 =?us-ascii?Q?9XWcZgS/UWgCugr+X4n/41GMlF8hXFCV23ehWmYHP13ytbtnf+uQNbJjJBFB?=
 =?us-ascii?Q?H5w0WEY20S01iQUEOV/TQek3e1cIInjWame02GF8g/l5whpf0d9c5YT5kGS6?=
 =?us-ascii?Q?ffJWuZrRCC7qP/8St//vkQzf8SZx9N7HMJM+7wf6Mhdf9iLToiUlb2506nYP?=
 =?us-ascii?Q?N8EIE8mPSr8DWz9czNoNZP/JkadBaA4SaFnHcnLpMwNV/DDFINFpJo1ewb60?=
 =?us-ascii?Q?JeyLlCyDrmqYKqfz870DOphYgwvVcLbL0zfN/A9GaU9yziFGcoXxUEK6O131?=
 =?us-ascii?Q?pEFDG1DqYTLj5KmRdPi4NDZ29ABoyU8V6Gs9wXA0UCzEFuxKpAr6xWdAjDFz?=
 =?us-ascii?Q?EMzmecvef0PXjauANFDTu6GHL/X+EPhdEOXVi5/ZO+pxO/wcYrLApgdc/v8v?=
 =?us-ascii?Q?6Dqgki1a+rCspkvU+FDrCsLfIs2t79YPFl4M3JSblobetCxbziN5kYKZIOFg?=
 =?us-ascii?Q?Nwl38mCBv8fW6CErDfcWbtSN7ccgOeMBg2aMcQYGcWWrlcWTskZJgam6jLcX?=
 =?us-ascii?Q?LfJv1GVqbq9MicqU3MIMUMI1RkBkwRGwT3j/gIkH6qW9AQTXnbyuRCHytzpx?=
 =?us-ascii?Q?gmduOvB6awHAVF6XCV29zsPSaG8nPh6yjFZivMb3zGxrMT+BLFCBjcIeN6Yq?=
 =?us-ascii?Q?60ifJHYix2n1DhvmKkgVU8UXTnSYHdgILWjn1XYI30azzpDmFpdt44v4bH5O?=
 =?us-ascii?Q?kecZ0Tg37w9MlpjC/tO1MoUuWmX7JheCL8OLRLwrFCJLysarOU1kZ9f5MKAl?=
 =?us-ascii?Q?DDmDSJ+TzeZgoggkE5twvgxt+iUGNCtdMMSgavvMySYl3TwfQIXgnd0ptRv8?=
 =?us-ascii?Q?ySm9qHnrrRH9Ki1/3YRffx442Xe5lOPbpZe3bfe/cPBUVSWRVSMOhnxmRLab?=
 =?us-ascii?Q?EYY07no1GokhmSPE8QhsDIEb0LXEim9uhlwwIc8lDOFvOO4VFoQd+ajUcw7y?=
 =?us-ascii?Q?nzboQWMPRAfFLSOtrezSAZAtrf1PGLhQF3XQAorSrIER9cMbabSOdgHGH6wE?=
 =?us-ascii?Q?dKNpg1Ui0cve0PpxPcF/hbC1C5sNR3rbpf/BcZBD0E8ij2bLc/SHS9IXf+CS?=
 =?us-ascii?Q?6iWSsK1IjTqGRcUG8gN04XBboJxWTqgSZZJbzXWAgD5ihQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6916.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SqNtQRUvMhh+lUINUAkS36r6Sng/OEHBA5N/UnnklQ8WAot/0qv3MTVk9+0T?=
 =?us-ascii?Q?ZzdKBxpEJesC4RDsfTaBAoBrvzHl/bERBvne+4gylFQW+iVp21opjZhvWw9g?=
 =?us-ascii?Q?AgVb5N1F1Jo/Ei+xMpzIrhsNyLDZcs0kDDEyjFfau6UH2wANixiC/6xTu2iM?=
 =?us-ascii?Q?3zc05bRc/II99eyXV59mgf7rG9VA2ct4nA2FMdo7iNoeuief5cZdXH25TdYq?=
 =?us-ascii?Q?r9KaD6nM8GBEG8Pzyfww+dt84wYY6DOeiQakm128iEqkW3IqcKrsN+yh2+KE?=
 =?us-ascii?Q?AFa8cQBKqiYq7j/7Ex1qgTnRCyyXnz5mJm+brLAdYIL75xI40uuoRzdSQrDM?=
 =?us-ascii?Q?Lu/cqVFz23vEFl2Tpbn0PTqoBPrRx5PQjNLWlMldESTW+R4vTEx6iUOE6+9X?=
 =?us-ascii?Q?q9sdbDV2dvnA1U/pvBJN7sBbpVFG7NJ7PslELufronCYHDwKheDSs6ZGhL59?=
 =?us-ascii?Q?nXKqKPGiFhQf/4yf0EEOi+gZtJyPXRErC7xIBZ/gH47fgChsqw++sHl54yBL?=
 =?us-ascii?Q?MNP+BQdTfi/AV4vR3azSPvxe1A+AmNTd1VkzAk7HN5GlatQsu7Zm8+TwdtMI?=
 =?us-ascii?Q?CNV4JdWxjQGzKPnO7uQyEU1tE+M97nofjlel5x+SqRlX5WUFU+DZCrsLKmPL?=
 =?us-ascii?Q?uGVCUSyxJBPGwCxXZ8iDNV/GUlp6ABb2i53W8F9wLDWOyOZWyDrSR7rB5MqO?=
 =?us-ascii?Q?/HgP1XbF4gJ0zpywBFEgKk3VGTnc8QQfchYnS84BUc7SzD3nOvyApbhypbPh?=
 =?us-ascii?Q?HlqlakT3e9fFpcH9vrWHsAGYAfdlLbRThjfSX8VIetNTfpP7DLBmT3V2OWA5?=
 =?us-ascii?Q?h9ADKhF0Go8e+Iyg0ev3apREirQ+7nyK2qWUcbbsefB+R46RIa+BKOXMEFFR?=
 =?us-ascii?Q?seVMH8/q43VdQ8QL8pvVPZ23/FQ0/3An2DaI9bfXVRnx6Piw//ElxjA9nh2X?=
 =?us-ascii?Q?ebRZ6Umvpfvq4xeMYCoXolZ84zddeBgsUaAJMCUSgOs6t/fxsAdvFPLSkbPy?=
 =?us-ascii?Q?jTLFarE5nHXthK9z4SWKwtzpkWyGDsO+8jJEG38PqdbLd0A6gVYwPBvfN2n4?=
 =?us-ascii?Q?5SLPQMPUpiyrv4akmDJj1IEKgzEuO5EYWETUzHwIIZ1fY+90giKm4CatS5EY?=
 =?us-ascii?Q?HaUfKXqqreavR0THsJFO+7roZqoQjqeeJhrPLCdLPnt9e5KWa7MEYaGDOQt7?=
 =?us-ascii?Q?UCb04fGwX8kl57V9IHAv82a8fWhhVKUnvTr0GvGID14yp1rUNRyYFQLbjz/n?=
 =?us-ascii?Q?LxSYy1O0YKjkckv4Rr6ukhK8Njalv54Mqxo2aChQEdxc/qZZUeIZaVI++8/i?=
 =?us-ascii?Q?wkIWyT+2LXpURlW+bzpTfQ8ZeJNXQ6U72KJTqEpIuUpvYP2o2Y0aqPeEaIHz?=
 =?us-ascii?Q?Y78MIwecDZFjaW6uMJvbdwGJaVJn3/N7+DkQE93mGXLwxWYflvN9ymHUVuwl?=
 =?us-ascii?Q?jYJSnRfWvx0MSrk/8dG8eBEr4AOnqa12j3/6VsxZfXl64HR2d93eS3kkVtMz?=
 =?us-ascii?Q?mk6RsY+4/bXdnqGSKJ5qy5TyxU/VBzY7jF3Hnj1Vusc+3MtnwGQUR5WHchYr?=
 =?us-ascii?Q?bZkhJZqugn+BrUijVui40OWVsncbIE347P2cPANp6PCKZYfa2Fz2yY+jDfOd?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ac2151-7c3b-4c54-0ec6-08dc71a7440a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6916.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 10:43:59.5514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2kLKd4NJ/HjlM8G9WXYToH63tg4lOXUBDEZjjK/nT+eppMb/ChEE2CSPPl/v4tmSAI5ySZQq06OqGVTw4/jUPjs51edRSuVerRzny0FYTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8449

From: Paul Burton <paulburton@kernel.org>

Probe for & boot CPUs (cores & VPs) in secondary clusters (ie. not the
cluster that began booting Linux) when they are present in systems with
CM 3.5 or higher.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 arch/mips/include/asm/mips-cm.h |  18 +++
 arch/mips/include/asm/smp-cps.h |   1 +
 arch/mips/kernel/mips-cm.c      |   4 +-
 arch/mips/kernel/smp-cps.c      | 208 ++++++++++++++++++++++++++++----
 4 files changed, 207 insertions(+), 24 deletions(-)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index c2930a75b7e4..65a46b35a218 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -251,6 +251,12 @@ GCR_ACCESSOR_RW(32, 0x130, l2_config)
 GCR_ACCESSOR_RO(32, 0x150, sys_config2)
 #define CM_GCR_SYS_CONFIG2_MAXVPW		GENMASK(3, 0)
 
+/* GCR_L2-RAM_CONFIG - Configuration & status of L2 cache RAMs */
+GCR_ACCESSOR_RW(64, 0x240, l2_ram_config)
+#define CM_GCR_L2_RAM_CONFIG_PRESENT		BIT(31)
+#define CM_GCR_L2_RAM_CONFIG_HCI_DONE		BIT(30)
+#define CM_GCR_L2_RAM_CONFIG_HCI_SUPPORTED	BIT(29)
+
 /* GCR_L2_PFT_CONTROL - Controls hardware L2 prefetching */
 GCR_ACCESSOR_RW(32, 0x300, l2_pft_control)
 #define CM_GCR_L2_PFT_CONTROL_PAGEMASK		GENMASK(31, 12)
@@ -262,6 +268,18 @@ GCR_ACCESSOR_RW(32, 0x308, l2_pft_control_b)
 #define CM_GCR_L2_PFT_CONTROL_B_CEN		BIT(8)
 #define CM_GCR_L2_PFT_CONTROL_B_PORTID		GENMASK(7, 0)
 
+/* GCR_L2_TAG_ADDR - Access addresses in L2 cache tags */
+GCR_ACCESSOR_RW(64, 0x600, l2_tag_addr)
+
+/* GCR_L2_TAG_STATE - Access L2 cache tag state */
+GCR_ACCESSOR_RW(64, 0x608, l2_tag_state)
+
+/* GCR_L2_DATA - Access data in L2 cache lines */
+GCR_ACCESSOR_RW(64, 0x610, l2_data)
+
+/* GCR_L2_ECC - Access ECC information from L2 cache lines */
+GCR_ACCESSOR_RW(64, 0x618, l2_ecc)
+
 /* GCR_L2SM_COP - L2 cache op state machine control */
 GCR_ACCESSOR_RW(32, 0x620, l2sm_cop)
 #define CM_GCR_L2SM_COP_PRESENT			BIT(31)
diff --git a/arch/mips/include/asm/smp-cps.h b/arch/mips/include/asm/smp-cps.h
index a629e948a6fd..10d3ebd890cb 100644
--- a/arch/mips/include/asm/smp-cps.h
+++ b/arch/mips/include/asm/smp-cps.h
@@ -23,6 +23,7 @@ struct core_boot_config {
 };
 
 struct cluster_boot_config {
+	unsigned long *core_power;
 	struct core_boot_config *core_config;
 };
 
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 3eb2cfb893e1..9854bc2b6895 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -308,7 +308,9 @@ void mips_cm_lock_other(unsigned int cluster, unsigned int core,
 		      FIELD_PREP(CM3_GCR_Cx_OTHER_VP, vp);
 
 		if (cm_rev >= CM_REV_CM3_5) {
-			val |= CM_GCR_Cx_OTHER_CLUSTER_EN;
+			if (cluster != cpu_cluster(&current_cpu_data))
+				val |= CM_GCR_Cx_OTHER_CLUSTER_EN;
+			val |= CM_GCR_Cx_OTHER_GIC_EN;
 			val |= FIELD_PREP(CM_GCR_Cx_OTHER_CLUSTER, cluster);
 			val |= FIELD_PREP(CM_GCR_Cx_OTHER_BLOCK, block);
 		} else {
diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 1954c9e912b2..ae814fdb930c 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -36,12 +36,56 @@ enum label_id {
 
 UASM_L_LA(_not_nmi)
 
-static DECLARE_BITMAP(core_power, NR_CPUS);
 static uint32_t core_entry_reg;
 static phys_addr_t cps_vec_pa;
 
 struct cluster_boot_config *mips_cps_cluster_bootcfg;
 
+static void power_up_other_cluster(unsigned int cluster)
+{
+	u32 stat, seq_state;
+	unsigned int timeout;
+
+	mips_cm_lock_other(cluster, CM_GCR_Cx_OTHER_CORE_CM, 0,
+			   CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	stat = read_cpc_co_stat_conf();
+	mips_cm_unlock_other();
+
+	seq_state = stat & CPC_Cx_STAT_CONF_SEQSTATE;
+	seq_state >>= __ffs(CPC_Cx_STAT_CONF_SEQSTATE);
+	if (seq_state == CPC_Cx_STAT_CONF_SEQSTATE_U5)
+		return;
+
+	/* Set endianness & power up the CM */
+	mips_cm_lock_other(cluster, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+	write_cpc_redir_sys_config(IS_ENABLED(CONFIG_CPU_BIG_ENDIAN));
+	write_cpc_redir_pwrup_ctl(1);
+	mips_cm_unlock_other();
+
+	/* Wait for the CM to start up */
+	timeout = 1000;
+	mips_cm_lock_other(cluster, CM_GCR_Cx_OTHER_CORE_CM, 0,
+			   CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	while (1) {
+		stat = read_cpc_co_stat_conf();
+		seq_state = stat & CPC_Cx_STAT_CONF_SEQSTATE;
+		seq_state >>= __ffs(CPC_Cx_STAT_CONF_SEQSTATE);
+		if (seq_state == CPC_Cx_STAT_CONF_SEQSTATE_U5)
+			break;
+
+		if (timeout) {
+			mdelay(1);
+			timeout--;
+		} else {
+			pr_warn("Waiting for cluster %u CM to power up... STAT_CONF=0x%x\n",
+				cluster, stat);
+			mdelay(1000);
+		}
+	}
+
+	mips_cm_unlock_other();
+}
+
 static unsigned __init core_vpe_count(unsigned int cluster, unsigned core)
 {
 	return min(smp_max_threads, mips_cps_numvps(cluster, core));
@@ -152,6 +196,9 @@ static void __init cps_smp_setup(void)
 			pr_cont(",");
 		pr_cont("{");
 
+		if (mips_cm_revision() >= CM_REV_CM3_5)
+			power_up_other_cluster(cl);
+
 		ncores = mips_cps_numcores(cl);
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
@@ -179,8 +226,8 @@ static void __init cps_smp_setup(void)
 
 	/* Indicate present CPUs (CPU being synonymous with VPE) */
 	for (v = 0; v < min_t(unsigned, nvpes, NR_CPUS); v++) {
-		set_cpu_possible(v, cpu_cluster(&cpu_data[v]) == 0);
-		set_cpu_present(v, cpu_cluster(&cpu_data[v]) == 0);
+		set_cpu_possible(v, true);
+		set_cpu_present(v, true);
 		__cpu_number_map[v] = v;
 		__cpu_logical_map[v] = v;
 	}
@@ -188,9 +235,6 @@ static void __init cps_smp_setup(void)
 	/* Set a coherent default CCA (CWB) */
 	change_c0_config(CONF_CM_CMASK, 0x5);
 
-	/* Core 0 is powered up (we're running on it) */
-	bitmap_set(core_power, 0, 1);
-
 	/* Initialise core 0 */
 	mips_cps_core_init();
 
@@ -272,6 +316,10 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 			goto err_out;
 		mips_cps_cluster_bootcfg[cl].core_config = core_bootcfg;
 
+		mips_cps_cluster_bootcfg[cl].core_power =
+			kcalloc(BITS_TO_LONGS(ncores), sizeof(unsigned long),
+				GFP_KERNEL);
+
 		/* Allocate VPE boot configuration structs */
 		for (c = 0; c < ncores; c++) {
 			core_vpes = core_vpe_count(cl, c);
@@ -283,11 +331,12 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 		}
 	}
 
-	/* Mark this CPU as booted */
+	/* Mark this CPU as powered up & booted */
 	cl = cpu_cluster(&current_cpu_data);
 	c = cpu_core(&current_cpu_data);
 	cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
 	core_bootcfg = &cluster_bootcfg->core_config[c];
+	bitmap_set(cluster_bootcfg->core_power, cpu_core(&current_cpu_data), 1);
 	atomic_set(&core_bootcfg->vpe_mask, 1 << cpu_vpe_id(&current_cpu_data));
 
 	return;
@@ -315,13 +364,118 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
 	}
 }
 
-static void boot_core(unsigned int core, unsigned int vpe_id)
+static void init_cluster_l2(void)
 {
-	u32 stat, seq_state;
-	unsigned timeout;
+	u32 l2_cfg, l2sm_cop, result;
+
+	while (1) {
+		l2_cfg = read_gcr_redir_l2_ram_config();
+
+		/* If HCI is not supported, use the state machine below */
+		if (!(l2_cfg & CM_GCR_L2_RAM_CONFIG_PRESENT))
+			break;
+		if (!(l2_cfg & CM_GCR_L2_RAM_CONFIG_HCI_SUPPORTED))
+			break;
+
+		/* If the HCI_DONE bit is set, we're finished */
+		if (l2_cfg & CM_GCR_L2_RAM_CONFIG_HCI_DONE)
+			return;
+	}
+
+	l2sm_cop = read_gcr_redir_l2sm_cop();
+	if (WARN(!(l2sm_cop & CM_GCR_L2SM_COP_PRESENT),
+		 "L2 init not supported on this system yet"))
+		return;
+
+	/* Clear L2 tag registers */
+	write_gcr_redir_l2_tag_state(0);
+	write_gcr_redir_l2_ecc(0);
+
+	/* Ensure the L2 tag writes complete before the state machine starts */
+	mb();
+
+	/* Wait for the L2 state machine to be idle */
+	do {
+		l2sm_cop = read_gcr_redir_l2sm_cop();
+	} while (l2sm_cop & CM_GCR_L2SM_COP_RUNNING);
+
+	/* Start a store tag operation */
+	l2sm_cop = CM_GCR_L2SM_COP_TYPE_IDX_STORETAG;
+	l2sm_cop <<= __ffs(CM_GCR_L2SM_COP_TYPE);
+	l2sm_cop |= CM_GCR_L2SM_COP_CMD_START;
+	write_gcr_redir_l2sm_cop(l2sm_cop);
+
+	/* Ensure the state machine starts before we poll for completion */
+	mb();
+
+	/* Wait for the operation to be complete */
+	do {
+		l2sm_cop = read_gcr_redir_l2sm_cop();
+		result = l2sm_cop & CM_GCR_L2SM_COP_RESULT;
+		result >>= __ffs(CM_GCR_L2SM_COP_RESULT);
+	} while (!result);
+
+	WARN(result != CM_GCR_L2SM_COP_RESULT_DONE_OK,
+	     "L2 state machine failed cache init with error %u\n", result);
+}
+
+static void boot_core(unsigned int cluster, unsigned int core,
+		      unsigned int vpe_id)
+{
+	struct cluster_boot_config *cluster_cfg;
+	u32 access, stat, seq_state;
+	unsigned int timeout, ncores;
+
+	cluster_cfg = &mips_cps_cluster_bootcfg[cluster];
+	ncores = mips_cps_numcores(cluster);
+
+	if ((cluster != cpu_cluster(&current_cpu_data)) &&
+	    bitmap_empty(cluster_cfg->core_power, ncores)) {
+		power_up_other_cluster(cluster);
+
+		mips_cm_lock_other(cluster, core, 0,
+				   CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+		/* Ensure cluster GCRs are where we expect */
+		write_gcr_redir_base(read_gcr_base());
+		write_gcr_redir_cpc_base(read_gcr_cpc_base());
+		write_gcr_redir_gic_base(read_gcr_gic_base());
+
+		init_cluster_l2();
+
+		/* Mirror L2 configuration */
+		write_gcr_redir_l2_only_sync_base(read_gcr_l2_only_sync_base());
+		write_gcr_redir_l2_pft_control(read_gcr_l2_pft_control());
+		write_gcr_redir_l2_pft_control_b(read_gcr_l2_pft_control_b());
+
+		/* Mirror ECC/parity setup */
+		write_gcr_redir_err_control(read_gcr_err_control());
+
+		/* Set BEV base */
+		write_gcr_redir_bev_base(core_entry_reg);
+
+		mips_cm_unlock_other();
+	}
+
+	if (cluster != cpu_cluster(&current_cpu_data)) {
+		mips_cm_lock_other(cluster, core, 0,
+				   CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+		/* Ensure the core can access the GCRs */
+		access = read_gcr_redir_access();
+		access |= BIT(core);
+		write_gcr_redir_access(access);
+
+		mips_cm_unlock_other();
+	} else {
+		/* Ensure the core can access the GCRs */
+		access = read_gcr_access();
+		access |= BIT(core);
+		write_gcr_access(access);
+	}
 
 	/* Select the appropriate core */
-	mips_cm_lock_other(0, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+	mips_cm_lock_other(cluster, core, 0, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 
 	/* Set its reset vector */
 	write_gcr_co_reset_base(core_entry_reg);
@@ -332,9 +486,6 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	/* Start it with the legacy memory map and exception base */
 	write_gcr_co_reset_ext_base(CM_GCR_Cx_RESET_EXT_BASE_UEB);
 
-	/* Ensure the core can access the GCRs */
-	set_gcr_access(1 << core);
-
 	if (mips_cpc_present()) {
 		/* Reset the core */
 		mips_cpc_lock_other(core);
@@ -384,7 +535,17 @@ static void boot_core(unsigned int core, unsigned int vpe_id)
 	mips_cm_unlock_other();
 
 	/* The core is now powered up */
-	bitmap_set(core_power, core, 1);
+	bitmap_set(cluster_cfg->core_power, core, 1);
+
+	/*
+	 * Restore CM_PWRUP=0 so that the CM can power down if all the cores in
+	 * the cluster do (eg. if they're all removed via hotplug.
+	 */
+	if (mips_cm_revision() >= CM_REV_CM3_5) {
+		mips_cm_lock_other(cluster, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+		write_cpc_redir_pwrup_ctl(0);
+		mips_cm_unlock_other();
+	}
 }
 
 static void remote_vpe_boot(void *dummy)
@@ -410,10 +571,6 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 	unsigned int remote;
 	int err;
 
-	/* We don't yet support booting CPUs in other clusters */
-	if (cpu_cluster(&cpu_data[cpu]) != cpu_cluster(&raw_current_cpu_data))
-		return -ENOSYS;
-
 	vpe_cfg->pc = (unsigned long)&smp_bootstrap;
 	vpe_cfg->sp = __KSTK_TOS(idle);
 	vpe_cfg->gp = (unsigned long)task_thread_info(idle);
@@ -422,14 +579,15 @@ static int cps_boot_secondary(int cpu, struct task_struct *idle)
 
 	preempt_disable();
 
-	if (!test_bit(core, core_power)) {
+	if (!test_bit(core, cluster_cfg->core_power)) {
 		/* Boot a VPE on a powered down core */
-		boot_core(core, vpe_id);
+		boot_core(cluster, core, vpe_id);
 		goto out;
 	}
 
 	if (cpu_has_vp) {
-		mips_cm_lock_other(0, core, vpe_id, CM_GCR_Cx_OTHER_BLOCK_LOCAL);
+		mips_cm_lock_other(cluster, core, vpe_id,
+				   CM_GCR_Cx_OTHER_BLOCK_LOCAL);
 		write_gcr_co_reset_base(core_entry_reg);
 		mips_cm_unlock_other();
 	}
@@ -636,11 +794,15 @@ static void cps_cpu_die(unsigned int cpu) { }
 
 static void cps_cleanup_dead_cpu(unsigned cpu)
 {
+	unsigned int cluster = cpu_cluster(&cpu_data[cpu]);
 	unsigned core = cpu_core(&cpu_data[cpu]);
 	unsigned int vpe_id = cpu_vpe_id(&cpu_data[cpu]);
 	ktime_t fail_time;
 	unsigned stat;
 	int err;
+	struct cluster_boot_config *cluster_cfg;
+
+	cluster_cfg = &mips_cps_cluster_bootcfg[cluster];
 
 	/*
 	 * Now wait for the CPU to actually offline. Without doing this that
@@ -692,7 +854,7 @@ static void cps_cleanup_dead_cpu(unsigned cpu)
 		} while (1);
 
 		/* Indicate the core is powered off */
-		bitmap_clear(core_power, core, 1);
+		bitmap_clear(cluster_cfg->core_power, core, 1);
 	} else if (cpu_has_mipsmt) {
 		/*
 		 * Have a CPU with access to the offlined CPUs registers wait
-- 
2.25.1


