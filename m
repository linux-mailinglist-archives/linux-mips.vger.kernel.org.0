Return-Path: <linux-mips+bounces-15188-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F6sqJtmjO2rbaggAu9opvQ
	(envelope-from <linux-mips+bounces-15188-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:31:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E559C6BCF41
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=JxJ1Kdpa;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15188-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15188-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A6703013A4E
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E32F3B388E;
	Wed, 24 Jun 2026 09:26:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338293A6F1C;
	Wed, 24 Jun 2026 09:26:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293195; cv=none; b=H9+KZ99+brJsBDfbXDZM5Z7LA9pN+F1Ogc1hw+e0Uas4Z86DVLP1PbG9ElSKZqsCdI50xG45Y06NeLWBpEPV/Jv9sxKTGvqicpX3oQoIdc568moNwqwlFe9o1ci0IroIqNYdcdaReUZ9j2VSbmdX7HJsDI/uu0xAJ2HvSISFlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293195; c=relaxed/simple;
	bh=I/6kC/HyfyGH1B10hocHFrhAetCeE7T2I/Sz+dJqsrc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmK1PozoaKA3AgOGlDiAKjoULs8YiVJjixrH9tF1dUD9To61mBrScv3gRkZ5oqLkXNMrEsORdWEfbEI1XysI6f1GDm2tbUDWFVhP+72BezF6ln49F/+r3Tie/JEycEnWN+BoURrYZepuqvvliIqMBMFicIGhAtaW6RD/WApDOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=JxJ1Kdpa; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Mieu95MHGOCQPSEh0wCzkUvvYOX+yIxJiHobJLWZ7sA=;
	b=JxJ1KdpaxFu7YpP+SYjQhdAUn7PgqhCjmiBYFvkDQWa33tjd7sW58S/2Sd+Qgaa4nt7JNgzOe
	w1RCKoee4zOS1OQujBz08Tx8yc7auGQDg7X1/0yGNV6f/PHl+8K0QGNhIqXZZT1ZV6DzZ5F2PoO
	Ggvk9TLmNUaUb20eqdnIY+o=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4glbt51GG5z1prKy;
	Wed, 24 Jun 2026 17:17:01 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C6E02012A;
	Wed, 24 Jun 2026 17:26:08 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 08/12] arm64: cpu_ops: Introduce get_secondary_cpu_ops()
Date: Wed, 24 Jun 2026 17:25:33 +0800
Message-ID: <20260624092537.2916971-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15188-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:ruanjinjie@huawei.com,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E559C6BCF41

From: Will Deacon <will@kernel.org>

Introduce get_secondary_cpu_ops() to retrieve a pointer to the
'cpu_operations' structure for the non-boot CPUs and use it instead of
get_cpu_ops() where we are dealing with secondary CPUs.

This is a pre-requisite for enabling parallel CPU bring-up.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpu_ops.h |  1 +
 arch/arm64/kernel/cpu_ops.c      |  5 +++++
 arch/arm64/kernel/smp.c          | 19 +++++++------------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
index a444c8915e88..cd298a8710d8 100644
--- a/arch/arm64/include/asm/cpu_ops.h
+++ b/arch/arm64/include/asm/cpu_ops.h
@@ -48,6 +48,7 @@ struct cpu_operations {
 
 int __init init_cpu_ops(int cpu);
 extern const struct cpu_operations *get_cpu_ops(int cpu);
+extern const struct cpu_operations *get_secondary_cpu_ops(void);
 
 static inline void __init init_bootcpu_ops(void)
 {
diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
index eacfb88a0c0c..7d183ca31dc8 100644
--- a/arch/arm64/kernel/cpu_ops.c
+++ b/arch/arm64/kernel/cpu_ops.c
@@ -127,3 +127,8 @@ const struct cpu_operations *get_cpu_ops(int cpu)
 
 	return NULL;
 }
+
+const struct cpu_operations *get_secondary_cpu_ops(void)
+{
+	return cpu_ops;
+}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 9482e8d38b98..6b9586a69429 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -99,7 +99,7 @@ static inline int op_cpu_kill(unsigned int cpu)
  */
 static int boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops->cpu_boot)
 		return ops->cpu_boot(cpu);
@@ -234,7 +234,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	rcutree_report_cpu_starting(cpu);
 	trace_hardirqs_off_finish();
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_postboot)
 		ops->cpu_postboot();
 
@@ -334,7 +334,7 @@ int __cpu_disable(void)
 
 static int op_cpu_kill(unsigned int cpu)
 {
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	/*
 	 * If we have no means of synchronising with the dying CPU, then assume
@@ -375,7 +375,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 void __noreturn cpu_die(void)
 {
 	unsigned int cpu = smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	idle_task_exit();
 
@@ -501,7 +501,7 @@ static int __init smp_cpu_setup(int cpu)
 	if (init_cpu_ops(cpu))
 		return -ENODEV;
 
-	ops = get_cpu_ops(cpu);
+	ops = get_secondary_cpu_ops();
 	if (ops->cpu_init(cpu))
 		return -ENODEV;
 
@@ -780,7 +780,7 @@ void __init smp_init_cpus(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
-	const struct cpu_operations *ops;
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 	unsigned int cpu;
 	int err;
 
@@ -806,10 +806,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (cpu == 0)
 			continue;
 
-		ops = get_cpu_ops(cpu);
-		if (!ops)
-			continue;
-
 		err = ops->cpu_prepare(cpu);
 		if (err)
 			continue;
@@ -1299,8 +1295,7 @@ bool smp_crash_stop_failed(void)
 static bool have_cpu_die(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
-	int any_cpu = raw_smp_processor_id();
-	const struct cpu_operations *ops = get_cpu_ops(any_cpu);
+	const struct cpu_operations *ops = get_secondary_cpu_ops();
 
 	if (ops && ops->cpu_die)
 		return true;
-- 
2.34.1


