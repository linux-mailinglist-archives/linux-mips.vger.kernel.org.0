Return-Path: <linux-mips+bounces-15685-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id atoSB5tqT2pfgQIAu9opvQ
	(envelope-from <linux-mips+bounces-15685-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:32:11 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B216B72EF99
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:32:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=sb5VQIcG;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15685-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15685-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D993B3050457
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D869D3EEACE;
	Thu,  9 Jul 2026 09:31:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694503ED5C3;
	Thu,  9 Jul 2026 09:31:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589476; cv=none; b=eSgz+zPYM7kLZEuuqBfkxVhRWdoQ0zq5H0s1wc8I85iHUWwzWerPFlXBHXqv2Jd7g08sHUOJQ8OUoaZqY+4mhxxQo4qHV6jbpDgQGCH+p4+oHamsJSQFKmRA8Zempsalp12BIAAsYyCkN7KUQBqm2oNlVF6/tJMHiHNp+bzvDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589476; c=relaxed/simple;
	bh=pjvcfavqalzFYYPXfiF/j8SiY/GjCZduXhZF6KK0QsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=si/bSDfl/Kl7qp6I1I+v3KVFSF5z/W7BYjYgICPxxDLB5hDooxRL+1mkjXbomDc1NO35dnM7BKFY7J2XYAz10bdZRsBzUZm6bERY0OCULqa1qDdvNAUBtN6whkrkY3uyrs2yAxi6PPiXwIIagHTL8HtW1JC/WEuVoBN7jWT9H6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sb5VQIcG; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6BF2357B;
	Thu,  9 Jul 2026 02:31:10 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EA793F66F;
	Thu,  9 Jul 2026 02:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589475; bh=pjvcfavqalzFYYPXfiF/j8SiY/GjCZduXhZF6KK0QsY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sb5VQIcG+RDKFFkyaNxgvITC2Nqu+OxY4Q5PYwhzsRSczmWOa3n54gzOqXKzNjYTH
	 XgdiANQMXBJhWESzymRVOgoF1VXuA/+obQfN1QVr7ewp+Id6MGhfaf+RkvCGP69Dn2
	 4tsAP36DXBURUoIOVo/1GW7opSXfIn+u5JBsgPaM=
Message-ID: <1b52abeb-39db-4341-87ef-fbc33fe80791@arm.com>
Date: Thu, 9 Jul 2026 10:31:12 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] vDSO: Drop HAVE_GENERIC_VDSO from architecture
 kconfig files
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-5-d2e1061f268b@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-5-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15685-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B216B72EF99



On 09/07/2026 08:28, Thomas Weißschuh wrote:
> Now that GENERIC_GETTIMEOFDAY and VDSO_GETRANDOM enable
> HAVE_GENERIC_VDSO automatically, the architecture specific kconfig files
> do not need to do so anymore.
> 
> Remove the corresponding lines.
> 
> Keep them for riscv, loongarch and powerpc as those have their own
> explicit usage of the vDSO datastore provided by HAVE_GENERIC_VDSO.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  arch/arm/mm/Kconfig | 1 -
>  arch/arm64/Kconfig  | 1 -
>  arch/mips/Kconfig   | 1 -
>  arch/riscv/Kconfig  | 4 ++--
>  arch/s390/Kconfig   | 1 -
>  arch/sparc/Kconfig  | 1 -
>  arch/x86/Kconfig    | 1 -
>  7 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index 871bd58d2ccc..f7bea397a201 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -924,7 +924,6 @@ config VDSO
>  	bool "Enable VDSO for acceleration of some system calls"
>  	depends on AEABI && MMU && CPU_V7
>  	default y if ARM_ARCH_TIMER
> -	select HAVE_GENERIC_VDSO
>  	select GENERIC_GETTIMEOFDAY
>  	help
>  	  Place in the process address space an ELF shared object
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..11e733b6a3cf 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -229,7 +229,6 @@ config ARM64
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> -	select HAVE_GENERIC_VDSO
>  	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 8555bbf47c63..a06f24317306 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3163,7 +3163,6 @@ config MIPS_EXTERNAL_TIMER
>  config MIPS_GENERIC_GETTIMEOFDAY
>  	def_bool y
>  	select GENERIC_GETTIMEOFDAY
> -	select HAVE_GENERIC_VDSO
>  	depends on CSRC_R4K || CLKSRC_MIPS_GIC
>  	# GCC (at least up to version 9.2) appears to emit function calls that make use
>  	# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 353cbfcff783..9aa8c4df0cd8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -110,7 +110,7 @@ config RISCV
>  	select GENERIC_CPU_VULNERABILITIES
>  	select GENERIC_EARLY_IOREMAP
>  	select GENERIC_ENTRY
> -	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO && 64BIT
> +	select GENERIC_GETTIMEOFDAY if MMU && 64BIT
>  	select GENERIC_IDLE_POLL_SETUP
>  	select GENERIC_IOREMAP if MMU
>  	select HAVE_IOREMAP_PROT if MMU
> @@ -227,7 +227,7 @@ config RISCV
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
>  	select UACCESS_MEMCPY if !MMU
> -	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO && 64BIT
> +	select VDSO_GETRANDOM if MMU && 64BIT
>  	select USER_STACKTRACE_SUPPORT
>  	select ZONE_DMA32 if 64BIT
>  
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 84404e6778d5..c9c55e3ddf1d 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -215,7 +215,6 @@ config S390
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER
>  	select HAVE_GCC_PLUGINS
> -	select HAVE_GENERIC_VDSO
>  	select HAVE_IOREMAP_PROT if PCI
>  	select HAVE_KERNEL_BZIP2
>  	select HAVE_KERNEL_GZIP
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index 0e9c906c4b5d..4dd79311133f 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -113,7 +113,6 @@ config SPARC64
>  	select ARCH_SUPPORTS_SCHED_SMT if SMP
>  	select ARCH_SUPPORTS_SCHED_MC  if SMP
>  	select ARCH_HAS_LAZY_MMU_MODE
> -	select HAVE_GENERIC_VDSO
>  	select GENERIC_GETTIMEOFDAY
>  
>  config ARCH_PROC_KCORE_TEXT
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index bdad90f210e4..2f4a78024a96 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -302,7 +302,6 @@ config X86
>  	select HAVE_UNSTABLE_SCHED_CLOCK
>  	select HAVE_UNWIND_USER_FP		if X86_64
>  	select HAVE_USER_RETURN_NOTIFIER
> -	select HAVE_GENERIC_VDSO
>  	select VDSO_GETRANDOM			if X86_64
>  	select HOTPLUG_PARALLEL			if SMP && X86_64
>  	select HOTPLUG_SMT			if SMP
> 

-- 
Regards,
Vincenzo


