Return-Path: <linux-mips+bounces-15180-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s9liLcWiO2qhaggAu9opvQ
	(envelope-from <linux-mips+bounces-15180-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E686BCEAF
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=k8G3N8hb;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15180-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15180-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F9F430506A0
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFAD3A901C;
	Wed, 24 Jun 2026 09:26:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709283AFD08;
	Wed, 24 Jun 2026 09:25:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293174; cv=none; b=LO0wuyc0Ps2roCGTsN9rCAuaoZbfzCIu4gkAp1yCDAPWOrFOSGmWlBIFBfzWhVR0GXZSgKGGVlFYpNn9HTYHgjDxI4jTeyv4qx9CmahSNWlDPEq3GwjoGMv0lMb4JFUxh8Bk2SX8ARu5ClRFVF9g1ww20oDEib3F/NZ8/sE8Bqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293174; c=relaxed/simple;
	bh=2y9AZQ92uIe7fq107jHK8Pqsv3ol/e4WdWhwyUGgvRM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfdGPhJpPGy5qakzBbkI1HpYjsZZHC5mPofFAP77qlyw1MkkqaYQiGwWNCG1fip91I9PHM1vJOrpOKEHDH63Yx0mrxpJtnwjHKcmm34eQImH3P6MtYrFU6qOmRUHocwWCLaDkz6Mt5EY1TkxTz9hSF7VTBkEv29iiohufPUEcms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=k8G3N8hb; arc=none smtp.client-ip=113.46.200.223
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TiI+bU6UZTaJsSDQgLd3Ye3dChV3WHZ4d0D9qJL7ZbY=;
	b=k8G3N8hb/viyXx/pJP/K0Z/uLHUoSO7z+hUr9oYDC0S2i382rtko3ssbPeRSu7/qAzncvdB7e
	+n488tlNnRUwAPSU7MHIovWByCHNNbIDeFkcpNZK863DLjf0+kJhDiWM2C/ax8tHB/YX7voSoo4
	ab0o0cq44vRMTyROkhrOwws=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4glbsv21fLzmV6k;
	Wed, 24 Jun 2026 17:16:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C76A440565;
	Wed, 24 Jun 2026 17:25:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:54 +0800
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
Subject: [PATCH v3 03/12] arm64: smp: Tidy up smp_prepare_cpus()
Date: Wed, 24 Jun 2026 17:25:28 +0800
Message-ID: <20260624092537.2916971-4-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15180-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:ruanjinjie@huawei.com,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35E686BCEAF

From: Will Deacon <will@kernel.org>

smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
to great lengths to support running on a CPU where smp_processor_id()
is non-zero.

Clean up the code a little by hardcoding zero for the boot CPU ID.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..e858d7d64d1f 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -772,16 +772,14 @@ void __init smp_init_cpus(void)
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	const struct cpu_operations *ops;
-	int err;
 	unsigned int cpu;
-	unsigned int this_cpu;
+	int err;
 
 	init_cpu_topology();
 
-	this_cpu = smp_processor_id();
-	store_cpu_topology(this_cpu);
-	numa_store_cpu_info(this_cpu);
-	numa_add_cpu(this_cpu);
+	store_cpu_topology(0);
+	numa_store_cpu_info(0);
+	numa_add_cpu(0);
 
 	/*
 	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
@@ -796,8 +794,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 	 * secondaries from the bootloader.
 	 */
 	for_each_possible_cpu(cpu) {
-
-		if (cpu == smp_processor_id())
+		if (cpu == 0)
 			continue;
 
 		ops = get_cpu_ops(cpu);
-- 
2.34.1


