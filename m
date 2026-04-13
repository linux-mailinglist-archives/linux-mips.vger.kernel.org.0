Return-Path: <linux-mips+bounces-14133-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJATCU383GlJYwkAu9opvQ
	(envelope-from <linux-mips+bounces-14133-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 16:23:09 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 923183ED480
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 16:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5299330128E9
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2026 14:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7E83D9DCD;
	Mon, 13 Apr 2026 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="SOZk0cNV"
X-Original-To: linux-mips@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4EB3D6CB5;
	Mon, 13 Apr 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089946; cv=fail; b=g+qb1eFS9aGTw42qDegOYgGl5x1Fd2LklZeMaUa3gE8+VzoyUDq9MlR7fv2geoXzKj9vjHOFzHj5SCZdZji0DSdlmWNClZNhOtE/DPWFG8sKspSONaSb5UZ9AjsAlIncpb/sf57NbTVfD5zfuxTIlNlvMZhuTtPW/nDcgHlGCOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089946; c=relaxed/simple;
	bh=PycDfAQnAl9Q2MwjGW/kJ0wFBW5g7jqrg2Ts+u13Sa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mcW2k9CVDKzbk1TmO224Io8A5e9GBXmJ0SdkxgCjr5zYx9TmCzuCjbRYVIXNqqoe33jspLrOxW8L/OQU+LnO4GWdkayqMhRwsLQaPPoLSOfDIk0E+FXXy5Hsd50woQLXbpl9s4gKWdjFL+rbpxLX0f7HC1t4herZ2MtuYDqZh1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=SOZk0cNV; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQYOegEctGUc9AZ0FSNHZp2mcYiKaP3ChCsXSV9U9Jy/AGv3MpPjMx0wMYsNPzSyP8evF3puiial/h12jVDOZUjITkOrpGlFb+2uz6IP9kLoOxR+Weu8NqzSBORkABT19JWHf3zeaetA8HyuPMUqKs3TcuDcLsKpxJjQbpbfICbEnC4ZGUZRXdUg8CRq56mJM4Z6uY67t5wWO+aEjqe1DvUbaJhBc6a8jfjy73ryLT6MhTxLGw7220Gc/fNuNpaY96Vlj3eqcj1K1qlOTLmU/h3bQyl9S4FPykjCZS5RFo7rqQ83j67WpHAbOlduCRp1u4dyYwsI4/yu8FqeuJ5CcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OKsASrj3OIg4ltBGLusST/gnFcmHWaP4j82YPJgMBg=;
 b=i3hOYWoixGVGgAwqyonc7xP5C5vFBAiem1Zr4sPUgb140EHsU8rQFkuV0U6rXJivzjEf5j4XIEW0IhoMcLiRjObKxsut7DHYpv43zQXk12qNAJe2gviDEuGIkChiGzhAAPD3gTfcY00fqMZhlZRwKA/Qi0IPpl30p3zPymsMl2h77ndcl3GPD0KdbH+EyaDq+tR8FtXPIbJ7cyCqmNHeCiA9abuN6I9nYa+vl76kEFB+rDNMZn9Bp/EK7SVTg05jslwH9HbzCl48XGBD7xL4Jwgpje03ZN53OYJWCfHuni8nc9nw4v9VxDwHCixVAute7DBw+bZtRJ/PU98m8SZgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.85) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OKsASrj3OIg4ltBGLusST/gnFcmHWaP4j82YPJgMBg=;
 b=SOZk0cNVkZRF3C4mhtW17FW6UD0rghKcW2UJjyGDi2w7YpRAx/hqDREJJ3BujymUXMawnIehrp7CkwbActNKT2kWWfkSrcAdPb53Rz4Av/xDCU2wfOq/UEvxvGrIgiWBnxyYHQL4kuRSbCV5j/mzn1SvyLn0YIPq4iMS3bM6xRwweiy3k0n1eqHnZn7Bt4208YfTE2t+i6Sb1I711/5kIaDvehsIsQ/CVOceJMpp+cIpaRnPMz656KqB8mAIgTnZ9FSNYfgiahkVRSMcL2SfCCxR3NDCI4XWGQQBBnYePxakR2GaTUyS1r2288xcsvp9kSForB42IhljEIPe+7yAdA==
Received: from DUZPR01CA0161.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::18) by DU0PR07MB10757.eurprd07.prod.outlook.com
 (2603:10a6:10:5a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:19:01 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::2) by DUZPR01CA0161.outlook.office365.com
 (2603:10a6:10:4bd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:19:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.85)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.85; helo=fihe02smtplvp01.emea.nsn-net.net; pr=C
Received: from fihe02smtplvp01.emea.nsn-net.net (131.228.2.85) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 14:19:01 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fihe02smtplvp01.emea.nsn-net.net (Postfix) with ESMTP id 62684800008E;
	Mon, 13 Apr 2026 17:19:00 +0300 (EEST)
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH v3] mips: mm: Call rcutree_report_cpu_starting() even earlier
Date: Mon, 13 Apr 2026 16:17:00 +0200
Message-ID: <20260413141659.2593550-2-stefan.wiehler@nokia.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|DU0PR07MB10757:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3ad84e73-0b08-4c73-740a-08de99679c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qrR7DdMTAzAcpzeN7Xdtcty4mQrX/j9rpYkwylw59i5U1UFK8bFYDSXyvBbkQl7AaqFGpcPeI4fJ8ci0eCxN33EVLWOY59S4c3LIwM4EzsqreSVGIQCmI46RC3mTU34wgXaua+k3q2bI4KjHDIiWOEu1lT52oTai21UE9pXEEeGUvR5omuSUE2R85Rtt/org4OYbhqKOENDW+Cq/QOaB59V/d6wIWZZmQuO2nqfBhs+Ojg9SlzddIO7dC3llcj3qN9DatqNt2o//BERtDZhMSiw1Fl/glbzDGbuBOCnCesDLPeTdkyYozBmLQBmk/vIO79ZE7wNbXnTo4CeUZwFt53Nl8lsCL2ikrBEaDj7Gbf0+SKVBLbRw9/CD6evpbt9+YOc1V1ZyKUgEbcQZcNxMqQaOKnrs4KGfAorUp5B/qp0dJ4qlzwQ6nO8bcxxFTppgZRa2nQ+694LyxDWvstZKsBPs5Ky4cfgjJCM56p6ZOYvb2WgxLqJaKyqO/BtxdkNvGAj85i+fDljG+/7TLaf3KzdTDYrTQwRqTG5X9DA48F68RHQhN3lUnQ2HVI8WzpgBuaSfbsBpx5dcMeGPxoPHdGYz9aZRlMlYaFRb97rNYRyGjYOAWLsiztqbAy3xFm0/lSlU+dGzd95Wo+6WBbBMxSnGyeIIdIK5Gd2uoOWY1jvNd+DgMKR5rpymrd+gZqphu65duiMV03fz6BsQGMyvE30dSFyKR01ZdvZR63qUkwqicQvgOZVFFMuVNy830qcPZGtoiKFP6Wsvq8pJgD7F5A==
X-Forefront-Antispam-Report:
	CIP:131.228.2.85;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe02smtplvp01.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uv96utp4hIsgGfr3rTrBIjuiYdNfmDxqqlytIGOmBPKBCvHeFft6q7PazX4MmjmQfKe6ylhVpcGc01eDWhPCbVSZOSNeWnh+gWH25bxmyJFuxs+UBXTb9bcNQsCEJBNmQAm49YB74bmwt9RWdcufM6zcQMJL+jmD5dAvk6FIt91F0+rjg2eOFo0LSLhpgiUhYJ1HlenLT3e1r9UileseykCl65TlbfpgvOYSXFxcmucAL8nOXBgpWT/RjMvvf1aNvB4A35l9+BHFymUg/ImaGcshKO0e59OLlg92tMUhGMkWz6qhGLpftPouJq3YWTUC5jNL8DPPPrs5bHweoHK+4jSylZWxAx55Wf6gpl90/AZBYm9TOHATY5NPmeSW/9nijo5Ezdj8lLu80bzLYNTCtGyHAAU8+gW8kAujpz7pxBdgcslQYHhtlBK9rFzKnKn3
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:19:01.0538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad84e73-0b08-4c73-740a-08de99679c07
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.85];Helo=[fihe02smtplvp01.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB10757
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14133-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nokia.com:dkim,nokia.com:email,nokia.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nokia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 923183ED480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rcutree_report_cpu_starting() must be called on secondary CPUs before
allocating memory to avoid the following Lockdep-RCU splat when
CONFIG_PROVE_RCU_LIST=y:

  WARNING: suspicious RCU usage
  6.6.119-00d46e15c416-fct #1 Not tainted
  -----------------------------
  /kernel/locking/lockdep.c:3762 RCU-list traversed in non-reader section!!

  other info that might help us debug this:

  RCU used illegally from offline CPU!
  rcu_scheduler_active = 1, debug_locks = 1
  no locks held by swapper/1/0.

  stack backtrace:
  CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.119-00d46e15c416-fct #1
  Stack : 80000000029e37d8 0000000000000000 0000000000000008 80000000029e37e8
          80000000029e37e8 80000000029e3978 0000000000000000 0000000000000000
          0000000000000000 0000000000000001 ffffffff80d9df38 ffffffff810e19c0
          0000000000000000 0000000000000010 ffffffff80a7d140 0000000000000000
          ffffffff81c20814 0000000000000000 ffffffff80da0000 0000000000000000
          ffffffff80cadf38 0000000000000000 0000000000000000 80000000029ab680
          72f093276415c1f3 ffffffff81c2084f ffffffff80da0000 ffffffffc0149ed8
          fffffffffffffffe 80000000029e0000 80000000029e37e0 80000000029abf58
          ffffffff80129fb0 0000000000000000 0000000000000000 0000000000000000
          0000000000000000 0000000000000000 ffffffff80129fd0 0000000000000000
          ...
  Call Trace:
  [<ffffffff80129fd0>] show_stack+0x60/0x158
  [<ffffffff80a8cd84>] dump_stack_lvl+0x88/0xbc
  [<ffffffff801c78f8>] lockdep_rcu_suspicious+0x1c0/0x240
  [<ffffffff801cc80c>] __lock_acquire+0x121c/0x29d8
  [<ffffffff801ce14c>] lock_acquire+0x184/0x448
  [<ffffffff80a9ba30>] _raw_spin_lock_irqsave+0x50/0x90
  [<ffffffff80367038>] ___slab_alloc+0xa08/0x1808
  [<ffffffff80367e70>] __slab_alloc.isra.0+0x38/0x78
  [<ffffffff8036b7d4>] __kmem_cache_alloc_node+0x35c/0x370
  [<ffffffff80308ed8>] __kmalloc+0x58/0xd0
  [<ffffffff80a8f064>] r4k_tlb_uniquify+0x7c/0x428
  [<ffffffff80143e8c>] tlb_init+0x7c/0x110
  [<ffffffff8012bdb4>] per_cpu_trap_init+0x16c/0x1d0
  [<ffffffff80133258>] start_secondary+0x28/0x128

See also commit 55702ec9603e ("mips/smp: Call
rcutree_report_cpu_starting() earlier").

Fixes: 841ecc979b18 ("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow")
Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: stable@vger.kernel.org
---
V2 -> V3: Fix commit ID in Fixes: tag
V1 -> V2: Reorder rcutree_report_cpu_starting() call in
start_secondary(), fix function name

v1: https://patchwork.kernel.org/project/linux-mips/patch/20260407083324.906742-2-stefan.wiehler@nokia.com/
v2: https://patchwork.kernel.org/project/linux-mips/patch/20260409164846.3176046-2-stefan.wiehler@nokia.com/
---
 arch/mips/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 4868e79f3b30..bdb47c70d4f5 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -359,8 +359,8 @@ asmlinkage void start_secondary(void)
 	unsigned int cpu = raw_smp_processor_id();
 
 	cpu_probe();
-	per_cpu_trap_init(false);
 	rcutree_report_cpu_starting(cpu);
+	per_cpu_trap_init(false);
 	mips_clockevent_init();
 	mp_ops->init_secondary();
 	cpu_report();
-- 
2.42.0


