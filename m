Return-Path: <linux-mips+bounces-13451-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBopGJ/1r2nkdAIAu9opvQ
	(envelope-from <linux-mips+bounces-13451-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 11:42:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E00A52498A6
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 11:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE183314F179
	for <lists+linux-mips@lfdr.de>; Tue, 10 Mar 2026 10:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3003372B53;
	Tue, 10 Mar 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="o5PBw1bA"
X-Original-To: linux-mips@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280D33A9C6;
	Tue, 10 Mar 2026 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139290; cv=fail; b=Q57VWjPDCz5cB5xYYYnr2opBrSs/M8PMs0grgN1sjOKeIOmmvDAwAIOXiJcTRLB+Y1YkKC5vT/CrvdvDD7XUlpXbhPPwlJPY7XP56SgnOB30E2d/cS95GQjdoNPq1jvp/RDV2TN0eVcJkCqHFZhXxbYhI+GCUMS5v53OFyFS4Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139290; c=relaxed/simple;
	bh=N/3yAQbjyL5Y931d/XCpqCtM4HOwiypkFo+Un/UqDBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AKeJCQRwqV73iAcdAiDQP/eN++3xDFZd1hR8TC2zfKQjWoSSlqzRKpiy2rZ3QwrQnckKMOuYYsWlhvroqNli1IIHAc0AgoB1co4BT2lChVIizXdPaIMUHtpNBEj3ROrHKdpd294a2KvFdCFOq9q6dKzJ50hO7r8JT7tkgHAat/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=o5PBw1bA; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmKmGG9S7SuW7g+tmvYLg7qGrgviRA5Q1+ge5lSB8V9qEeY++q8Ag36ThYiD8ZljervKrSNnKWlO3NPzXDhMsRqPMa86syiJmypHeYghmV6/IMU0xZoYHKr2B/pkdEJfCVy14xC7CgfoHdgS3IIgD3FJfn3EHz2VXUy76b8n+4jPF6oEmG2jCa8tGE3EImpQk26Q6eJWRP5I+fq9EWh79XQmQ6R7brqcUWSO4H4row4XoiaMRNU7SN/Tb8hKyfiuKAnjxkJk5Z22EFFxL0edxTTzzdP8Pt6NlLNO89isXF+PkAMzE4i6DZOvsyTRPf9FFImVz8Tbjq1k+9zvEpoKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNkyqBxaznazUfurkFoquUGDgdhTv3OYTcFM5jmaimM=;
 b=ukeZEwuEvF0ZiQT75+ZxPjHjhpoZa/9p2PH96BI4uDoGmIvKupTnEDvPD3PhhhssEknDwKEM526xq1RrOdobDEeAh5d9guI4oawFHJjeClRmSv1eTbp6Cd5l8p/Vgg0mtwudUH/jCbx4I+Y9uuMod74bDERXKEcPNur3mL6ou8gbeef9f2KIKY2XERUU/Cqv8Gjb8cZHlk9nSCUh9ebg4a7eRFZo/MYhScbol5aklXGwVG6lpthJOJl17+7IHvQuApVCMFRa5QLTPjdNSwNigoLKcyuQRDwDGkZHmx7vWpVw0VMy+bjUtI1ud3lzQPIriS77Vc8GRlwhnKwSAgi+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.101) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNkyqBxaznazUfurkFoquUGDgdhTv3OYTcFM5jmaimM=;
 b=o5PBw1bARZIXmQhG8zp4oDGOGIc4NxLhP6zLstoG1nLfcX8gqBzorb1e0IxPA7hu31WoUeYi1lKqXNWrfKhc/QH8oBPaTlfo3B3X87R2GDIVm/tYVE7a7e9G3T6gcG3LW7AF32fMvYyFJ+U3juTxN0laffH4Qz6FOVYkbk52ySGnd4rhGN+4T+Sa4Acmd4KBg94D9Vkv1omejo3VHeUNW8LDhUHcWjXlIDYt1tuvJeOTyQMFmMeVTC/QUky7dIZxtnyCZvzKTI69BpNtah4UNBeAkcBBSTb1qmyXQIv4mobczlHxgZkK9xmI/0HJRrCg59zL/L8xxa3kX4OyW1cN9w==
Received: from DU6P191CA0064.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::24)
 by GV1PR07MB9021.eurprd07.prod.outlook.com (2603:10a6:150:84::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 10:41:24 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::d5) by DU6P191CA0064.outlook.office365.com
 (2603:10a6:10:53e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 10:41:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.101)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.6.101 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.6.101; helo=fr712usmtp1.zeu.alcatel-lucent.com; pr=C
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 10 Mar 2026 10:41:23 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fr712usmtp1.zeu.alcatel-lucent.com (Postfix) with ESMTP id 381301C002B;
	Tue, 10 Mar 2026 12:41:23 +0200 (EET)
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	stable@vger.kernel.org
Subject: [PATCH] mips: mm: Allocate tlb_vpn array atomically
Date: Tue, 10 Mar 2026 11:40:24 +0100
Message-ID: <20260310104024.3554197-1-stefan.wiehler@nokia.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|GV1PR07MB9021:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a178446-b830-4d61-785c-08de7e919358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	/jJAZAEYbyjxiQagsQMb3KrWgRjWYsfhyLyEnb1URbGQVPV/UiqIPISuyGDVbzlb8861RThuYil7XaNYhMfYx9DSC9XvxgXsfwQzUvZbTSQ7CeB+g8OaEDeZVxnGJpsm37/3S9Dh4unB4hZ5hlBI5fSCJ4Y/cVWUNa6y3ATXcUH794KL7E/VrUfQoV/gvIZShdBeVZS1xVpHQgkmM9ZFUWtyuhVcd7WC9DeF3+GGzoIri9Se3fz+WX2LhLufo3wdU1c5rNOjwrjc7tMKznXQbxSyPuCze/ICePNOVVmG0B4AJGa8KKN7TAAPWNwE6I/yTglHGfYv2YfrCaSDBNFRIGKZ1udkf9hMtHZC5LiOZD1BO2oG5cU9/xrDhfa4AeI48pESsZod8jt6TY+iD5w99F0xNNxz5LYe2DVHQNK2/dAgeGbl5WxtGc8ONE0Ze7c9PQWo8BHC4TT8AH+H64YWJfW8fZ52dwJXWo1VwaZC1dg1Z5oZVKQEyk+G2wsY73DKZ8dyRyWNblQQba2D8jMsyb2g1QvKXk57p2qpLIQQwJJWnxQo7jjBwVDbyXUsD8BhJNPVYGbHAwlrQJl8FMKlant+zdTX0rrfa9mJL2aVxbRrvHkmmppEc/9/GNbEmIyvuNgIqm9eQa9Yl8580dMuFdMVWOmcY7vqmcA3BlYQum1M1qbt9XyBzNs3qVWj/yk3eKKUFnk39kqXZulMqAOqSwL1xXBsrehqKc6fF9szTg7ApixZd6JN+VMORLmhAVrIyg5aK8GkXdssbCyifeD1bQ==
X-Forefront-Antispam-Report:
	CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lDDXS+ynutHZpBExC9ERtCOU1v2FSZKigWyXrRa9iDXeehxz6FfDDDogOWfbQGo6NbYAiW7YFPyAllDBgJZXaaOE3nUGRihCSRXBryDUv0wzKt05F7kfADaUw/BFpH0sbUNd9zjRfhPWuMO2hNaezU+rSsKr3ALY/O96QnHvTG97bUECCGJeRG0ht1q1pXC5cGj6dBGB6AhnO3LNu8x4yMr8KTC1qQWtqcyrXiTTvY4czstSVlsmCC+WuBiiEHEM9uhUyPyBEdqi8jD5cu5ZqAEKmCxE9g7nkV7pHfoQIdPFx24DeRZUQ7be8CcU1CnEh21jOHeSsBxYQGdBCigV6aYZo33EVOAOsiw0pzl1z4xZCsIsyAD7Z+yzeznl+os1iBKO39MPhno+42oyJkl//x652/cwhXLVLSW+Ds55udSGttYiMmWEWBpCaajhdp8V
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:41:23.9525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a178446-b830-4d61-785c-08de7e919358
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB9021
X-Rspamd-Queue-Id: E00A52498A6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13451-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[nokia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Found by DEBUG_ATOMIC_SLEEP:

  BUG: sleeping function called from invalid context at /include/linux/sched/mm.h:306
  in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
  preempt_count: 1, expected: 0
  RCU nest depth: 0, expected: 0
  no locks held by swapper/1/0.
  irq event stamp: 0
  hardirqs last  enabled at (0): [<0000000000000000>] 0x0
  hardirqs last disabled at (0): [<ffffffff801477fc>] copy_process+0x75c/0x1b68
  softirqs last  enabled at (0): [<ffffffff801477fc>] copy_process+0x75c/0x1b68
  softirqs last disabled at (0): [<0000000000000000>] 0x0
  CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.119-d79e757675ec-fct #1
  Stack : 800000000290bad8 0000000000000000 0000000000000008 800000000290bae8
          800000000290bae8 800000000290bc78 0000000000000000 0000000000000000
          ffffffff80c80000 0000000000000001 ffffffff80d8dee8 ffffffff810d09c0
          784bb2a7ec10647d 0000000000000010 ffffffff80a6fd60 8000000001d8a9c0
          0000000000000000 0000000000000000 ffffffff80d90000 0000000000000000
          ffffffff80c9e0e8 0000000007ffffff 0000000000000cc0 0000000000000400
          ffffffffffffffff 0000000000000001 0000000000000002 ffffffffc0149ed8
          fffffffffffffffe 8000000002908000 800000000290bae0 ffffffff80a81b74
          ffffffff80129fb0 0000000000000000 0000000000000000 0000000000000000
          0000000000000000 0000000000000000 ffffffff80129fd0 0000000000000000
          ...
  Call Trace:
  [<ffffffff80129fd0>] show_stack+0x60/0x158
  [<ffffffff80a7f894>] dump_stack_lvl+0x88/0xbc
  [<ffffffff8018d3c8>] __might_resched+0x268/0x288
  [<ffffffff803648b0>] __kmem_cache_alloc_node+0x2e0/0x330
  [<ffffffff80302788>] __kmalloc+0x58/0xd0
  [<ffffffff80a81b74>] r4k_tlb_uniquify+0x7c/0x428
  [<ffffffff80143e8c>] tlb_init+0x7c/0x110
  [<ffffffff8012bdb4>] per_cpu_trap_init+0x16c/0x1d0
  [<ffffffff80133258>] start_secondary+0x28/0x128

Fixes: 231ac951faba ("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow")
Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: stable@vger.kernel.org
---
 arch/mips/mm/tlb-r4k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 44a662536148..645f77e09d5b 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -538,7 +538,7 @@ static void __ref r4k_tlb_uniquify(void)
 
 	tlb_vpn_size = tlbsize * sizeof(*tlb_vpns);
 	tlb_vpns = (use_slab ?
-		    kmalloc(tlb_vpn_size, GFP_KERNEL) :
+		    kmalloc(tlb_vpn_size, GFP_ATOMIC) :
 		    memblock_alloc_raw(tlb_vpn_size, sizeof(*tlb_vpns)));
 	if (WARN_ON(!tlb_vpns))
 		return; /* Pray local_flush_tlb_all() is good enough. */
-- 
2.42.0


