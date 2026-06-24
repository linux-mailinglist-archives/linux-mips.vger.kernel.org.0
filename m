Return-Path: <linux-mips+bounces-15184-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H71HFL6iO2qgaggAu9opvQ
	(envelope-from <linux-mips+bounces-15184-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA56BCEAA
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 11:26:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=enxJSVfC;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15184-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15184-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D11F30315FA
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDA73B2FC8;
	Wed, 24 Jun 2026 09:26:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2539A3B14B9;
	Wed, 24 Jun 2026 09:26:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293177; cv=none; b=rQ8cShpaogEp734n9PXNU28dGRg3VJmPrHC1era/uYJqHP0/6+f3PG4N1XBj1VnPlu7h9Tv+1ooyKl58aTCD5s8yVhbnPpgyhKwYOITl2mvUe76MCc6+Haui1uwH8DgpqkiAA3dJXs3SHj5byw17KixzfRXU83nuyMUXYlSt2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293177; c=relaxed/simple;
	bh=ZkSc8oOfBnEJa1D7TuUPY5a7RIKEXVHObL9kf4KsUoo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZjLe8Lj4xpQz+wzt7cO48BJQeRJ5x1P5G8lhYlFygHwblAFU0Zwh6kXWtxcts2pRecXFQuDUxOJnLJ+GJRcbqHpgxwhDDYohxn+QbE6Sj+cLI2U/zC7TlrjNwYWZFg13CFL9UQ1BLJxbyfNWdoryqHP3YnGvbHCIeI51E2jIVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=enxJSVfC; arc=none smtp.client-ip=113.46.200.218
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uuIHUavUzhyt/C6rQx8OpYKtXN7bn3za9grEbqeMnzo=;
	b=enxJSVfC9LiH4Y+dT+G/S2D94z7Dr6pXIahi1+GYklbX25doXvQefgoSHtbXgcCvPoPkIFUUB
	ctA58VRp1/unD68P0rnXpOGmByvrJoOx6WiXUc3KnASoYDXp+5+JehC8x4KOMW4DT9nsN5u/m0B
	PBW4ysVB5DaZFW43EeRhcXE=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4glbtm4Sj7zpSvJ;
	Wed, 24 Jun 2026 17:17:36 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B56240537;
	Wed, 24 Jun 2026 17:25:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:25:49 +0800
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
Subject: [PATCH v3 01/12] cpu/hotplug: Introduce CONFIG_HOTPLUG_PARALLEL_SMT
Date: Wed, 24 Jun 2026 17:25:26 +0800
Message-ID: <20260624092537.2916971-2-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15184-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:ruanjinjie@huawei.com,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24BA56BCEAA

During parallel CPU bringup, x86 requires primary SMT threads to boot
first to avoid siblings stopping during microcode updates. This constraint
is architecture-specific and unnecessary for other platforms
like arm64.

Introduce CONFIG_HOTPLUG_PARALLEL_SMT to decouple this constraint.
Platforms requiring this temporal order (e.g., x86) can select it
in Kconfig. Other architectures (e.g., arm64) can leave it unselected
to entirely bypass the SMT branch.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/Kconfig      | 5 +++++
 arch/mips/Kconfig | 3 +--
 arch/x86/Kconfig  | 2 +-
 kernel/cpu.c      | 4 ++--
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..d25b61dc03b2 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -102,6 +102,11 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config HOTPLUG_PARALLEL_SMT
+	bool
+	select HOTPLUG_PARALLEL
+	select HOTPLUG_SMT
+
 config GENERIC_IRQ_ENTRY
 	bool
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688..8d9c57f3df23 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -660,7 +660,7 @@ config EYEQ
 	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
-	select HOTPLUG_PARALLEL if HOTPLUG_CPU
+	select HOTPLUG_PARALLEL_SMT if HOTPLUG_CPU
 	help
 	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
 
@@ -2301,7 +2301,6 @@ config MIPS_CPS
 	select MIPS_CM
 	select MIPS_CPS_PM if HOTPLUG_CPU
 	select SMP
-	select HOTPLUG_SMT if HOTPLUG_PARALLEL
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..2ea80da1e4f8 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -305,7 +305,7 @@ config X86
 	select HAVE_USER_RETURN_NOTIFIER
 	select HAVE_GENERIC_VDSO
 	select VDSO_GETRANDOM			if X86_64
-	select HOTPLUG_PARALLEL			if SMP && X86_64
+	select HOTPLUG_PARALLEL_SMT		if SMP && X86_64
 	select HOTPLUG_SMT			if SMP
 	select HOTPLUG_SPLIT_STARTUP		if SMP && X86_32
 	select IRQ_FORCED_THREADING
diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc4f7a9ba64e..5a90f60ff60e 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1792,7 +1792,7 @@ static int __init parallel_bringup_parse_param(char *arg)
 }
 early_param("cpuhp.parallel", parallel_bringup_parse_param);
 
-#ifdef CONFIG_HOTPLUG_SMT
+#ifdef CONFIG_HOTPLUG_PARALLEL_SMT
 static inline bool cpuhp_smt_aware(void)
 {
 	return cpu_smt_max_threads > 1;
@@ -1811,7 +1811,7 @@ static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
 {
 	return cpu_none_mask;
 }
-#endif
+#endif /* CONFIG_HOTPLUG_PARALLEL_SMT */
 
 bool __weak arch_cpuhp_init_parallel_bringup(void)
 {
-- 
2.34.1


