Return-Path: <linux-mips+bounces-14083-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMIzILTB1GmWwwcAu9opvQ
	(envelope-from <linux-mips+bounces-14083-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 10:35:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E910D3AB691
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 10:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 211C730059AE
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2026 08:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3A939B951;
	Tue,  7 Apr 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="Kijw/PMQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DD39769B;
	Tue,  7 Apr 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550889; cv=fail; b=aYUUR9EbIR25ezg4M8j8WVLkcNpub3+7AT1gWkyuo5pfRNJegQgIxf54x1plOFa7KuBmrnMD0oGTU+OTyNpsh5uNCM2dSvxY8RYNuJl7HIoP9SwyB3YGhRgI3nUMYtAM2FYi+vC1Iy1Y1tNfd/KS0Vm4rfX4BAlb5IXEBlV5WNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550889; c=relaxed/simple;
	bh=j68KplfyW/qeZjsjfAKccAr9WCRoSU1C8EtmgMzqzhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BuXPGAgLFymeaCuADVlSWjsgOn27wQ/NuLDsyOxQJEcl/j8KsV49FiviYGsfprUGrYcMmwkuoax/9Z3y+r1CSEgq07odLmI3pALGzEkBdDgTJr4veztlzDGgfP0IUbppzAby7MA97540a1sFMmX0ySM27S/nkwb3KrJb7kWQrAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=Kijw/PMQ; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbJG2SKamLOE60m7DKWeLX2a+U28nwI4Z9gcBaZDEd6pFZZz5RkmGoJqVRiZoDfMJo0fxN1ezN2Ce1BnwlH/l0lJ3fANupzv5lV2n1fiSGT5DKtiTsxpgU8A5VrYuLVoq9EHcsQqn1P1KN+GTyQf502oJDJvp/j3NOYbsvtGF3AAUTPa5CXM11KjO4fF4vDNNTuySs2gSXac1BBRchxmuIpFVkrItiGysHAdLd4U0rRil+iD7UqjXFI++n6T+IZifVdHqV6mGfW2hK7DLzgBR2GFmvWhWLbtbvib8yjMjYxtlsbX2fYj0w/NrTqAEAUeM5L34zCjro0ujEHmkze8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqV2xBbODSwudTtwZU5Cc+6i3clqiyQLxvV5sgiB7Kk=;
 b=Vz3qsQp2gBZ5YwOFUItvBivo2AYGr+biyntZkHEoGQB3ukReaxkJq6dNrIsOw87Mgowkf05Msi1T9rfY+ISPnwOwkSgJorHxhWS+x43V50wohu8sv+W6g1zXO026dZsKyUpOk4Tu22Fpbs94TsNVFJkWjKUG+uvtPr5H4ivT+T2HQbSW7vtIEI3BouL05C36PrzdsahF7hz4Duu4Mmn7bmsBWXvRV0FOOeSaT9jWBTXNeo8Bfmc9rs0rxWDdtIV1bpASLe1lOY6fDqi7P874H05/HDzSDRchakWXepg3q7OZQOIXyv0B7Tq7N6a22/zYZ8XlM7FmbIR5vOsmlmn2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.6.100) smtp.rcpttodomain=alpha.franken.de smtp.mailfrom=nokia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqV2xBbODSwudTtwZU5Cc+6i3clqiyQLxvV5sgiB7Kk=;
 b=Kijw/PMQ8r2F2OY+9aaE18kBA2PiUCPIs46EGBo9GxM55E230TSzJ3/xmuk5x58ZMwJWkslztDxgsI6ymBAAy93bSfTiEi3bdYudTvQYT9LaxYKz0qVtfLVM/lAtnKaIsK8Y77pEI3sHvBBJeDfJATzMln3wRzFFqeQjK4oW/3KBn74FIzl06v9R3pD5GpuAb0aNLQUUHM419UORJGiUYuFmt7CJ7srNebmNm6+BMY3kHL+IObV3RTltHfMkxvqh9v8KAofIUcduKdu21Zz0fWTsOJDSValKB3Qiws3eBlzmRvV5iN3iLJuY/AqUobmVnbP1kSvazDhbtN0dNW24OA==
Received: from DUZPR01CA0290.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::28) by VI1PR07MB6477.eurprd07.prod.outlook.com
 (2603:10a6:800:13b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Tue, 7 Apr
 2026 08:34:29 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::23) by DUZPR01CA0290.outlook.office365.com
 (2603:10a6:10:4b7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Tue,
 7 Apr 2026 08:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.6.100)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.6.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.6.100; helo=fr711usmtp2.zeu.alcatel-lucent.com; pr=C
Received: from fr711usmtp2.zeu.alcatel-lucent.com (131.228.6.100) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 7 Apr 2026 08:34:28 +0000
Received: from uleclfsdev02.linsee.dyn.nesc.nokia.net.net (uleclfsdev02.linsee.dyn.nesc.nokia.net [10.47.240.2])
	by fr711usmtp2.zeu.alcatel-lucent.com (Postfix) with ESMTP id C55F3680056;
	Tue,  7 Apr 2026 11:34:27 +0300 (EEST)
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH] mips: mm: Call rcutree_report_cpu_starting() even earlier
Date: Tue,  7 Apr 2026 10:33:25 +0200
Message-ID: <20260407083324.906742-2-stefan.wiehler@nokia.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|VI1PR07MB6477:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7e4103ea-aa6b-4c89-9da5-08de94807bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eqWhjNUTCQjkS5K6LPAQfd6FmWYjbwtE934WnEwU+Q4p7B1BGKAYyvJh4nKZMywpSVzqkDI0D1sjLDuyB4k3RAwPxcq5sh5raPFMXcdCNlBkYs5xUHB6C0zQXKBJ/MYUc8mmRjWc/jvk4TMQK049LIx568GdymREeTxKnwio69qSWrVRsheuLnWd/cvliqLnWfyN5XH32WlRASSrDsqDCLaorfsPi2kMIA9FNpif5V1jO8bIg6yahF1Iq3+m4i+i5xkCSq/xZSZ49XGWVsClM6HQw4H7PXRLOTtOrnQmwiY3E/6Vb4XIJNv4RT04p6Wd8Tg01LdWLMeB0IUgqC+0K01aDx38ulAkYF/O2zu7fjgvv9FkiwT4L/3m8OKhH52RP0aJM0JEDYjF6u0gpubArEaP/bef22FkLrJG6SHQhaqdJKUNOZwLZz6jLF8kjZyGR0U9gOhPXUf9MgNGsEtBxbT9/K95jklbss3I/4vLE9LSP4DM4htsYbFM5tHsNWC8Jycx6DUjhLcSPjufyc5W6NaZ9OW2GDjCsZR8kqsQyOatH69IEyxTPmvTvL+ADSIWNEGnglkdU4+lKI7v1p2MX4XDDFQve0MCNEi5p72BGvb/dFknufZm43utsL5VPonIV/2eiEvMd9GSczAlY/Q4DoWkqsg8dOrBuermjaFRZvylQGAOcxrZnPACdUZQhcVyw2iGKDt4AWg6n3YMeNAQUIjcxrpwVMrIIL8djeybdLcZzrXZ0cPlkfV4w7haRO7VeulJr4nu431Ti5UezKZseQ==
X-Forefront-Antispam-Report:
	CIP:131.228.6.100;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr711usmtp2.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1FYlrq2s14ZN2ckKip6y5roZl7ZRJCL5h+Yc22eO6U2O/pz7Z/Xt4bnW1w2irrsTCNkrcNpjF8tgcOSvTLE2fnj2bCXiq5AHkyD9IcCia08WV15sXYl7ox7q1Ag9m88t4PkoHK993NprOumTDUddPWrkcpprj5Isbf3mJB2AnzLOkU7MAkvguoy6avrF2bV0DzSMXjyH+E26L6JmdGt8v4psFl/S83w3XkcQ78hG5V8a0E9YRA6Un3KbBgOV3EjPm6crNhl1opcIS20aEcovZi+AlCywLtY0jQM/mOnR9w77aWKusRXNBIN4rbScqFGSoWCr29uJ9l8f/gc5UAVU0FWAdwqZDD3VzRNzBXcy9hZWnHDKTQHb4hL1Q5TenLvgkF47sFaYE5b4FhNHynfutpHdwvztvMX7OR6F513C/TFyeESt9tjrgOf6C74gXnTv
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 08:34:28.5134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4103ea-aa6b-4c89-9da5-08de94807bc1
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.100];Helo=[fr711usmtp2.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6477
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nokia.com,reject];
	R_DKIM_ALLOW(-0.20)[nokia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14083-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[nokia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan.wiehler@nokia.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E910D3AB691
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

raw_smp_processor_id() is required in order to avoid calling into
lockdep before RCU has declared the CPU to be watched for readers.

See also commit 55702ec9603e ("mips/smp: Call
rcutree_report_cpu_starting() earlier").

Fixes: 231ac951faba ("MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow")
Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: stable@vger.kernel.org
---
 arch/mips/mm/tlb-r4k.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 24fe85fa169d..49cb5262df1e 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -18,6 +18,7 @@
 #include <linux/hugetlb.h>
 #include <linux/export.h>
 #include <linux/sort.h>
+#include <linux/rcutree.h>
 
 #include <asm/cpu.h>
 #include <asm/cpu-type.h>
@@ -744,12 +745,18 @@ static void __ref r4k_tlb_uniquify_write(struct tlbent *tlb_vpns, int tlbsize)
  */
 static void __ref r4k_tlb_uniquify(void)
 {
+	unsigned int cpu = raw_smp_processor_id();
 	int tlbsize = current_cpu_data.tlbsize;
 	bool use_slab = slab_is_available();
+	static bool secondary = false;
 	phys_addr_t tlb_vpn_size;
 	struct tlbent *tlb_vpns;
 
 	tlb_vpn_size = tlbsize * sizeof(*tlb_vpns);
+	if (secondary)
+		rcu_cpu_starting(cpu);
+	else
+		secondary = true;
 	tlb_vpns = (use_slab ?
 		    kmalloc(tlb_vpn_size, GFP_ATOMIC) :
 		    memblock_alloc_raw(tlb_vpn_size, sizeof(*tlb_vpns)));
-- 
2.42.0


