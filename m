Return-Path: <linux-mips+bounces-15142-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aSjPIcsNNGoBMgYAu9opvQ
	(envelope-from <linux-mips+bounces-15142-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 17:24:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9DC6A137C
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 17:24:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Kw5ZAvji;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15142-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15142-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E005308D439
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 15:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6D93FBB6C;
	Thu, 18 Jun 2026 15:17:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D133FB7C1;
	Thu, 18 Jun 2026 15:17:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795828; cv=none; b=F1/kaTvGeIwEUPgUfWiS0ShilufgGgeUhQdeW4KY2l4T1xO7ddMl+Iz4Z6KzlR/EAWvZIj8NObN4JEp5Y/XMCxxdYILio0Es7jNwu1hqDUYHJm5KoPHSWuqJ7OfXp7crDQdXtFa3fAGV7hZWLEaCmOs/2NDmEhPHAgQotYu7tcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795828; c=relaxed/simple;
	bh=dQJD6FzjhXRNTB4jV11MMKs6Kcig4JKIkMMz/4AJ/Ro=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PHPCxE7pzVFJIJ8gUrHy3yXqMz+xAeh9OBpl7mJ0iSXpXf0+DVOfoqYJ4kzvevlrL+iow7RdYyCTbbsd2/P2wT6Fj7nmRNpVXVA95I0iz889JwIowl8OaVXfmiELftQG66KtoPkP0wY1mzIAoOApD7odaLqo4jiKB+EpyHbYKhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kw5ZAvji; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83B01F000E9;
	Thu, 18 Jun 2026 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781795826;
	bh=FcnhWkyO1wGk9YYSayyGesrPHSxn9xDSAmpQC/JH0nU=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=Kw5ZAvjikp4kCrXrajYE//oWC8BHzHzkpD6/cgf6/RN5sQClRuEN2kHaEsD8of4Zn
	 spJ7grwLuiYTtFyvS6QX37eXs9bQeoy9yzVItprpWNUTPvnP1oS4PLZf8BjhYIGSpk
	 TWbaczj4CHjjVRrLOcXgm4ZQxMX1g1xlddM/TMWJbeWtCF9E9TL8Ff2zYH9ff9JCLf
	 P1gXuOmoexYnpljtiH2qFKYUX0/zwUCan6C+ZEnXllpCweOtHA5Yq0YLXOslIln3uR
	 UHOjzPoagPE8cZs78+EsEKMqssXxQ9A3YjzTAdx2oMxECZ3hc+nEGbNHsbg4paHL2V
	 IK9BUz5djY0NQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 hpa@zytor.com, peterz@infradead.org, kees@kernel.org, nathan@kernel.org,
 linusw@kernel.org, ojeda@kernel.org, ruanjinjie@huawei.com,
 david.kaplan@amd.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com,
 maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org,
 thuth@redhat.com, oupton@kernel.org, yeoreum.yun@arm.com,
 miko.lenczewski@arm.com, broonie@kernel.org, kevin.brodsky@arm.com,
 james.clark@linaro.org, tabba@google.com, mrigendra.chaubey@gmail.com,
 arnd@arndb.de, anshuman.khandual@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
In-Reply-To: <20260611133809.3854977-2-ruanjinjie@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com>
Date: Thu, 18 Jun 2026 17:17:03 +0200
Message-ID: <87a4srdgk0.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[huawei.com,arm.com,kernel.org,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-15142-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fw13:mid,vger.kernel.org:from_smtp,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA9DC6A137C

On Thu, Jun 11 2026 at 21:38, Jinjie Ruan wrote:

> During parallel CPU bringup, x86 requires primary SMT threads to boot
> first to avoid siblings stopping during microcode updates. This constraint
> is architecture-specific and unnecessary for other platforms
> like arm64.
>
> Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to decouple this constraint.
> Platforms requiring this temporal order (e.g., x86) can select it
> in Kconfig. Other architectures (e.g., arm64) can leave it unselected
> to entirely bypass the SMT branch via the preprocessor.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/Kconfig       | 4 ++++
>  arch/mips/Kconfig  | 1 +
>  arch/riscv/Kconfig | 1 +
>  arch/x86/Kconfig   | 1 +
>  kernel/cpu.c       | 6 +++++-
>  5 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index e86880045158..0365d2df2659 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>  	bool
>  	select HOTPLUG_SPLIT_STARTUP
>  
> +config PARALLEL_SMT_PRIMARY_FIRST

Proper namespaces are overrated, right?

All related options start with HOTPLUG_....

> +	bool
> +	depends on HOTPLUG_PARALLEL
> +
>  config GENERIC_IRQ_ENTRY
>  	bool
>  
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 4364f3dba688..84e11ac0cf71 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -642,6 +642,7 @@ config EYEQ
>  	select MIPS_CPU_SCACHE
>  	select MIPS_GIC
>  	select MIPS_L1_CACHE_SHIFT_7
> +	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
>  	select PCI_DRIVERS_GENERIC
>  	select SMP_UP if SMP
>  	select SWAP_IO_SPACE
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d235396c4514..0cc49aecc841 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -210,6 +210,7 @@ config RISCV
>  	select OF
>  	select OF_EARLY_FLATTREE
>  	select OF_IRQ
> +	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL

Why does RISCV need this? It does not select HOTPLUG_SMT to begin with.

> +#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
>  #ifdef CONFIG_HOTPLUG_SMT

More #ifdeffery is better, right?

>  static inline bool cpuhp_smt_aware(void)
>  {
> @@ -1811,7 +1812,8 @@ static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
>  {
>  	return cpu_none_mask;
>  }
> -#endif
> +#endif /* CONFIG_HOTPLUG_SMT */
> +#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
>  
>  bool __weak arch_cpuhp_init_parallel_bringup(void)
>  {
> @@ -1837,6 +1839,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
>  	if (!__cpuhp_parallel_bringup)
>  		return false;
>  
> +#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST

Seriously?

>  	if (cpuhp_smt_aware()) {
>  		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
>  		static struct cpumask tmp_mask __initdata;
> @@ -1857,6 +1860,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
>  		cpumask_andnot(&tmp_mask, mask, pmask);
>  		mask = &tmp_mask;
>  	}
> +#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */

Something simple like the uncompiled below should just work, no?

---
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
 	bool
 	select HOTPLUG_SPLIT_STARTUP
 
+config HOTPLUG_PARALLEL_SMT
+	bool
+	select HOTPLUG_PARALLEL
+
 config GENERIC_IRQ_ENTRY
 	bool
 
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -657,7 +657,7 @@ config EYEQ
 	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
-	select HOTPLUG_PARALLEL if HOTPLUG_CPU
+	select HOTPLUG_PARALLEL_SMT if HOTPLUG_CPU
 	help
 	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
 
@@ -2295,7 +2295,6 @@ config MIPS_CPS
 	select MIPS_CM
 	select MIPS_CPS_PM if HOTPLUG_CPU
 	select SMP
-	select HOTPLUG_SMT if HOTPLUG_PARALLEL
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -304,7 +304,7 @@ config X86
 	select HAVE_USER_RETURN_NOTIFIER
 	select HAVE_GENERIC_VDSO
 	select VDSO_GETRANDOM			if X86_64
-	select HOTPLUG_PARALLEL			if SMP && X86_64
+	select HOTPLUG_PARALLEL_SMT		if SMP && X86_64
 	select HOTPLUG_SMT			if SMP
 	select HOTPLUG_SPLIT_STARTUP		if SMP && X86_32
 	select IRQ_FORCED_THREADING
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1792,7 +1792,7 @@ static int __init parallel_bringup_parse
 }
 early_param("cpuhp.parallel", parallel_bringup_parse_param);
 
-#ifdef CONFIG_HOTPLUG_SMT
+#ifdef CONFIG_HOTPLUG_PARALLEL_SMT
 static inline bool cpuhp_smt_aware(void)
 {
 	return cpu_smt_max_threads > 1;

