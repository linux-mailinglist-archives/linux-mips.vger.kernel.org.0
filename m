Return-Path: <linux-mips+bounces-14091-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBQyCQvZ12n4TggAu9opvQ
	(envelope-from <linux-mips+bounces-14091-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Apr 2026 18:51:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5B3CDCCC
	for <lists+linux-mips@lfdr.de>; Thu, 09 Apr 2026 18:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 474813010BBB
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2026 16:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FED37B40E;
	Thu,  9 Apr 2026 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="b+JFMe6T"
X-Original-To: linux-mips@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB72BEC43;
	Thu,  9 Apr 2026 16:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775753418; cv=fail; b=c3+yze74UTKVxijECwD2GYTxxOUlJvajtfgFGKn8vR91MkzEm20vRFP3KcA5Ix342CQaQSpPa3wuMEKlaMalzY7lm8BSR+TCwQEOBipx3szFOp2rxIfujulczLuJIjiLb6KvoKf0x7s0sd8Wa4jh9FQMhuzlXDuJvgpKA2JWIp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775753418; c=relaxed/simple;
	bh=g1Dg9H/7sy0zhGI7E5YfTTidzZ8DA4Q6SAcwjb0sFvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B3xvFd3JoMN64HM4rpFIKvjJVJVZhBDfQQab8yE6UjLHr6i9YqcQ8pfonLGTw7jNKgjFoTLUFvyjTXSesCqA2Cm8gNYQDe8nSl09AmiUqQFzxH9irCItjbfN61qXfZjncKgTqDbaxPdSqWnyobDmkXNVfjmxwc+E02uHBUyVqkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=b+JFMe6T; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nx3ORNqPXcv9WBzi1tmjalxOjvXdC7K2K+lH4RqG/7EOlIV7evD8pgfX2di0zXt1hvFCJnY4KN/4TMpHrlicgcyT2x1dfgQlazk9QGVLDKnye/HI1CS/rYNniekq+kkBkB4ViXIN84BT0pfArHy7uODLvMvlCTr72FyfITRG0qlXAVmiJVku0QIefy2ANFUBeij+TdfzJq/ERwJDbM6WZ12JPOR+27rsvMzL41HaOTY2iX9ObkXuk8GZOF91S2VrwuA5cOXv0R2p7TRBghGHHeHEM9D6XSx+MqBjZmOF655qwFjQ7Eu/fo1V9jtXaENhLmOrjYmdtEzlNtu10e13MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6a8xgixHgdaWFpZXdyN9YzW2Zfs6LbnrciwqoFT3Vc=;
 b=C5CC5AlppzcYt9Ki4wP+lfMKT9cysZpG8P0wIPzsc1j9XoKWqMCysOkaHIye9TNR49a9JSDlaZHirMJBK9bvtU5e/y0qjwV08/WV0meLCTLHvd+n6CsjpfetXAHAfGyAFby7zh+BxITWT4qA7ADcGPG3EstPu6bhreV1W0w8YfVjVSjXbUUPkwg7HNV+Cx8b65GRzZR5t+7jJZH1ovyuTCZ40GLkBWBXk+7oTqyikuYfZjL7raBZ/JQcD8euukYnN7es8iBkH7VVRLUhL6wt3SXQMp6lJ7ocb7s9wKvgr99P0gSqLwdYhQ7G9psuTNfOV4IbeK9TRqg6m92C1i1hFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.84) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6a8xgixHgdaWFpZXdyN9YzW2Zfs6LbnrciwqoFT3Vc=;
 b=b+JFMe6TPDuIKLAZvs0A+Qr0pocRTvbCIrUlGTKasOuwK9buz4jBXDsVMhXdf9Jt1x7bzyb+rkfqFjo3UFSt4MGMaFNZUgdOb6F01pv0pQrsQHIiw+li6p7dpozvxmTLkB4kCZXAFClYRomRdQ/6kbLm4oDGzgCOjEHu/C/Nat8drl+S/1pdHqS9qX7f/3h1Nk2g2NVnFxgmttr+zxZjXp0xH0jWtr/wHYUV1laKz/gePN945kC+bXgEktMr+aXHcxZKT6RQ/fM5fV2gN7B9jn0Mj4lc8FuTKK+AJjqYzn2RCrc/9pN/vfiGq+Yi0REk2bdAW34zI6YM+XFxgEQp5w==
Received: from DU6P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::20)
 by DU4PR07MB11687.eurprd07.prod.outlook.com (2603:10a6:10:645::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 16:50:13 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::7f) by DU6P191CA0008.outlook.office365.com
 (2603:10a6:10:540::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Thu,
 9 Apr 2026 16:50:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.84)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.84; helo=fihe01smtplvp01.emea.nsn-net.net; pr=C
Received: from fihe01smtplvp01.emea.nsn-net.net (131.228.2.84) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Thu, 9 Apr 2026 16:50:12 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fihe01smtplvp01.emea.nsn-net.net (Postfix) with ESMTP id 079A2800009B;
	Thu,  9 Apr 2026 19:50:12 +0300 (EEST)
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH v2] mips: mm: Call rcutree_report_cpu_starting() even earlier
Date: Thu,  9 Apr 2026 18:48:47 +0200
Message-ID: <20260409164846.3176046-2-stefan.wiehler@nokia.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|DU4PR07MB11687:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2fccad73-d07f-42b6-30be-08de96581179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	xoJ5dRU/9wPClRTJEwO0kR4nWfjVZVBP0h86V41JZrhd+9/n3j8ZU6k2Z3dWrPYAV9GQOYpM5FsmlVeUQxYG+tZL6rTC25O9msvkIZeMUMT2AgZYabt/Kk73zJZG/sOdYeOX96DZ2+LHqvq1akP81GIGpv6ksrkliaUKENZGhivNYSNjxyfxBTfitd4tiwQk6FMnnrPYNvYwcubAKQKyhoBhOhysLYntoRZcZo1M/9xxtrkxD9pO5+CJPkhyCVPkX5gVpEHlVGh9/FRWnwDtE5zYpYGmP6WUjYLSKBqZilj7hjRzH2UP41V+sZTF+5U60PHKeH+P4CTHB+g3ZuJS5iVnRNNp0vMDsazSmgt++brx1ZvGuDY/UUc7VqBoA7uh2nNThqFmjtyycp/eunXsq53Pi4GtJa2c0miiFyH7iD5vQ9kzR72WjJdYRmd3h6yAMF0UJXt/24CXV+r94eExVfYnuh8d9n4iG6FoBc/IjnjSsLneFyv1NfDieWY4pl8JGSMF8oMCTZBBhUaradJcGjQcQeP2aGXYlw25EyxFUz0eygyfUhW+SF0ovN/2t/tKOJkbRLFs/eJk6e4EeMEFwaUAcC7jvE+/Q+n+g8Umz3JPlYWxamArzQJgxKNISweTD855FhYfI1d+QL5tj8Lcrzbon7vL/xnZlWL11e4wu/POk9Dh0dxe28ZQ/8w8wnpCvUAzBwNao6vV2JhO5BK6R3yfechkaEcBNGiZSJh58YPLNYE8AhS4dGrEIqPiFi22Pm5VvlpA5QuMCYsNpVO6bA==
X-Forefront-Antispam-Report:
	CIP:131.228.2.84;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe01smtplvp01.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bTw7yYuJJWpo7GvJ923Ij2Mu8664U0hQCJVcuXdmDODRwNz1/k7iskrGXfwJC34E4UZCHGCrpD4Hsbl1VWOvHHwKKDrY4yzGjKSfvtmNd9ZBiPO2jgG/DqdvDVbM1BMzWGmVA05gQoOoCGwrxEtUjtonIRZ9fnUPXDQtmIcOqk29BgKgDvQU/1DR3lKH4+HHm+zf5yAxSQvScYfhXcIHFj2HiVd0VbZ3rOC0zItI7KlNOA1d/mghO2tHcAEE7ibTn77zAmRNiLG5zhOgjDWX972fBAOT1b4Zjt8o9ICQptx8ttIZnJel69yCqvsDUQLFlQEeeJ2OMj27QrDfrJEIC9kOwmqD5+n6kTPKhVEEla7cOYCK84vbsiOZzXq273fqrCAY0HCk8xGwMfGpYOnQ15iQhIgMOyXx9eqPaNnj0ov4UxJ433g2avmH+12t7gmO
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:50:12.6578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fccad73-d07f-42b6-30be-08de96581179
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.84];Helo=[fihe01smtplvp01.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR07MB11687
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14091-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nokia.com:dkim,nokia.com:email,nokia.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 7CF5B3CDCCC
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

Fixes: 231ac951faba ("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow")
Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: stable@vger.kernel.org
---
V1 -> V2: Reorder rcutree_report_cpu_starting() call in
start_secondary(), fix function name

v1: https://patchwork.kernel.org/project/linux-mips/patch/20260407083324.906742-2-stefan.wiehler@nokia.com/
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


