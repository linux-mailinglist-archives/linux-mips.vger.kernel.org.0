Return-Path: <linux-mips+bounces-15192-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I9GGMg2kO2rmaggAu9opvQ
	(envelope-from <linux-mips+bounces-15192-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:31:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE16BCF6C
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:31:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=NOw2pEIT;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15192-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15192-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 352ED311889D
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2643B8BDB;
	Wed, 24 Jun 2026 09:26:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1F2EC54C;
	Wed, 24 Jun 2026 09:26:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293203; cv=none; b=CyLkzOnJiLTM8DKWAV7Hd6WCsvLihWTMzH2xbcClGMkU67ieUhho/NBVjcWYTruBB0WzWuywb2yYT3Pn6wOvXTe31gjspQSX6CZxsWNmElp6vbkwfl4S6djLu6vVYsu9lLLVu6wj55yO2HMAHGJDXX90Pzrkxd1Wpp9TeR6SvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293203; c=relaxed/simple;
	bh=qS/F6KgKPbikAaZQYhy2hq/KtR+lmVTBFVjupaTzmss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qqiXoE89p/xYyvlCN+vSXXT8gCU+IUy7MxFy6eBMLE614E0HaJ68BbRSjADjnEkD6HbLLhr2bChiHugNvEr2GdtLwegABDsnL4/zPHSKCSf6w2/0ajHxJKqBLD9BP0dN8QLQinQtj++Bctl4YIas7shU6E1rROK8MAn1DC1y4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NOw2pEIT; arc=none smtp.client-ip=113.46.200.226
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ieofr+x7mCv4RU+fHCV+TK9nLxuSjsWJ0dtdog5pIVA=;
	b=NOw2pEITHKGTM3UczBmJPM8jkaq7W6NTFyORTA/J7kXCCAzXUBEgIB4tMNc7bcnIet9S6PO3S
	Gz4cFvOrKNRgXSoRm6GabZqgBsqQezYG6xEZMf0a/WBtftJK44IHwhXjRG1Rcv+wh7Pms7+Uycl
	HaqZ2cg1A617MnH37otl40c=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4glbt92VTgzKm6V;
	Wed, 24 Jun 2026 17:17:05 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2BBC940539;
	Wed, 24 Jun 2026 17:26:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:10 +0800
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
Subject: [PATCH v3 10/12] arm64: smp: Pass CPU ID to update_cpu_boot_status()
Date: Wed, 24 Jun 2026 17:25:35 +0800
Message-ID: <20260624092537.2916971-11-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15192-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:ruanjinjie@huawei.com,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43DE16BCF6C

To support CONFIG_HOTPLUG_PARALLEL, the CPU boot status tracking must
be refactored from a single global variable (secondary_data.status)
to a per-CPU tracking structure to prevent multi-core race conditions.

Add a 'cpu' parameter to update_cpu_boot_status() and update all its
callsites to pass the corresponding CPU ID. This allows updating the
boot status at a per-CPU granularity during parallel bringup.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/smp.h   | 6 +++---
 arch/arm64/kernel/cpufeature.c | 2 +-
 arch/arm64/kernel/smp.c        | 8 ++++----
 arch/arm64/mm/context.c        | 5 +++--
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index 10ea4f543069..e2151a01731f 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -122,7 +122,7 @@ static inline void __noreturn cpu_park_loop(void)
 	}
 }
 
-static inline void update_cpu_boot_status(int val)
+static inline void update_cpu_boot_status(unsigned int cpu, int val)
 {
 	WRITE_ONCE(secondary_data.status, val);
 	/* Ensure the visibility of the status update */
@@ -134,9 +134,9 @@ static inline void update_cpu_boot_status(int val)
  * which calls for a kernel panic. Update the boot status and park the calling
  * CPU.
  */
-static inline void __noreturn cpu_panic_kernel(void)
+static inline void __noreturn cpu_panic_kernel(unsigned int cpu)
 {
-	update_cpu_boot_status(CPU_PANIC_KERNEL);
+	update_cpu_boot_status(cpu, CPU_PANIC_KERNEL);
 	cpu_park_loop();
 }
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index a1a13f3e01ed..abc3aef9c206 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3685,7 +3685,7 @@ static void verify_local_cpu_caps(u16 scope_mask)
 			caps->desc, system_has_cap, cpu_has_cap);
 
 		if (cpucap_panic_on_conflict(caps))
-			cpu_panic_kernel();
+			cpu_panic_kernel(smp_processor_id());
 		else
 			cpu_die_early();
 	}
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 6b9586a69429..14b94df26b44 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -116,7 +116,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
 	 * page tables.
 	 */
 	secondary_data.task = idle;
-	update_cpu_boot_status(CPU_MMU_OFF);
+	update_cpu_boot_status(cpu, CPU_MMU_OFF);
 
 	/* Now bring the CPU into our world */
 	ret = boot_secondary(cpu, idle);
@@ -262,7 +262,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
 					 cpu, (unsigned long)mpidr,
 					 read_cpuid_id());
-	update_cpu_boot_status(CPU_BOOT_SUCCESS);
+	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
 	set_cpu_online(cpu, true);
 
 	/*
@@ -420,11 +420,11 @@ void __noreturn cpu_die_early(void)
 	rcutree_report_cpu_dead();
 
 	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
-		update_cpu_boot_status(CPU_KILL_ME);
+		update_cpu_boot_status(cpu, CPU_KILL_ME);
 		__cpu_try_die(cpu);
 	}
 
-	update_cpu_boot_status(CPU_STUCK_IN_KERNEL);
+	update_cpu_boot_status(cpu, CPU_STUCK_IN_KERNEL);
 
 	cpu_park_loop();
 }
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 0f4a28b87469..e78ae989ad57 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -63,6 +63,7 @@ static u32 get_cpu_asid_bits(void)
 /* Check if the current cpu's ASIDBits is compatible with asid_bits */
 void verify_cpu_asid_bits(void)
 {
+	unsigned int cpu = smp_processor_id();
 	u32 asid = get_cpu_asid_bits();
 
 	if (asid < asid_bits) {
@@ -71,8 +72,8 @@ void verify_cpu_asid_bits(void)
 		 * fewer ASID bits than the boot CPU.
 		 */
 		pr_crit("CPU%d: smaller ASID size(%u) than boot CPU (%u)\n",
-				smp_processor_id(), asid, asid_bits);
-		cpu_panic_kernel();
+			cpu, asid, asid_bits);
+		cpu_panic_kernel(cpu);
 	}
 }
 
-- 
2.34.1


