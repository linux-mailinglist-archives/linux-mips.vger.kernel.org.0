Return-Path: <linux-mips+bounces-15686-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ECUzAwRrT2qMgQIAu9opvQ
	(envelope-from <linux-mips+bounces-15686-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:33:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A772EFF8
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 11:33:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=EA0xZtNU;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15686-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15686-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0036A307D83E
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 09:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAEF3EEACA;
	Thu,  9 Jul 2026 09:31:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C593ED3CC;
	Thu,  9 Jul 2026 09:31:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589501; cv=none; b=j4XXYJsxzUl/bEGZj3eLjmzeHjf9eqs5x4XX32/x2WWuIqWuGYeTlhmTDHhYtaqFPtxbqGYrPXH49VqfoujdwMQvBpzhuXJ/UI2uHKrS/YKnAgWthUhyevmBjiyL0nl2i99o8m6HXtsN0k/FcD+AawEGOYGyGPDQX7dpmGrvswA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589501; c=relaxed/simple;
	bh=4+jQ2Dw+9RQI+s61ahoULhDyeHov5rQIKt6POx0qbHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHTbYuzoHji2ETUwoGneHBNaE/yOUFUWJNWPcXWFCtiY6YtFTAHaWUqA9KIjq3ZvVCk4k95TVQWm/Y3l0b9VbQUXia33GezeKEsaU1b94/leJ8RVffyL6nzXLV4bbbaL4kIvCI9weEvCz5twYhaUZettD6fOkKoCFVzRjftJO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EA0xZtNU; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 653C1357B;
	Thu,  9 Jul 2026 02:31:35 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F39563F66F;
	Thu,  9 Jul 2026 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589499; bh=4+jQ2Dw+9RQI+s61ahoULhDyeHov5rQIKt6POx0qbHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EA0xZtNU2pGs6PCBjMispRAG7lQ7s5nHt4zffj2HquwHk0ELhjuLYnp46a+Z990mO
	 JvTz6BebrnRPSu2453rNLlCWm6C9ZhtHqKOSzKPsyE5494Nvgp/u8CXbEWV7d9YDrm
	 SMztMxXuWPrfBCK/1EAZjFv61Qp9gukl1gesJKfQ=
Message-ID: <6ef864e5-bfbc-4444-a00d-843d7fb3e3e2@arm.com>
Date: Thu, 9 Jul 2026 10:31:37 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] vDSO: Rename HAVE_GENERIC_VDSO to VDSO_DATASTORE
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20260709-vdso-have_generic_vdso-v1-0-d2e1061f268b@linutronix.de>
 <20260709-vdso-have_generic_vdso-v1-6-d2e1061f268b@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260709-vdso-have_generic_vdso-v1-6-d2e1061f268b@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15686-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 999A772EFF8



On 09/07/2026 08:28, Thomas Weißschuh wrote:
> Over time the meaning of HAVE_GENERIC_VDSO has become off.
> Today it only controls the availability of the vDSO datastore.
> 
> Rename the symbol to match its function.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  arch/loongarch/Kconfig         | 2 +-
>  arch/powerpc/Kconfig           | 2 +-
>  arch/riscv/Kconfig             | 2 +-
>  include/linux/vdso_datastore.h | 6 +++---
>  lib/vdso/Kconfig               | 6 +++---
>  lib/vdso/Makefile              | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d8d252325017..41ed648fcec9 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -153,7 +153,6 @@ config LOONGARCH
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER
>  	select HAVE_GCC_PLUGINS
> -	select HAVE_GENERIC_VDSO
>  	select HAVE_HW_BREAKPOINT if PERF_EVENTS
>  	select HAVE_IOREMAP_PROT
>  	select HAVE_IRQ_EXIT_ON_IRQ_STACK
> @@ -213,6 +212,7 @@ config LOONGARCH
>  	select TRACE_IRQFLAGS_SUPPORT
>  	select USE_PERCPU_NUMA_NODE_ID
>  	select USER_STACKTRACE_SUPPORT
> +	select VDSO_DATASTORE
>  	select VDSO_GETRANDOM
>  	select ZONE_DMA32 if 64BIT
>  
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index f7ce5fff81f0..c6bc2cd6cc83 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -256,7 +256,6 @@ config PPC
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
>  	select HAVE_GCC_PLUGINS
> -	select HAVE_GENERIC_VDSO
>  	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
>  	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
>  	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
> @@ -328,6 +327,7 @@ config PPC
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
> +	select VDSO_DATASTORE
>  	select VDSO_GETRANDOM
>  	#
>  	# Please keep this list sorted alphabetically.
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 9aa8c4df0cd8..019fb4799943 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -171,7 +171,6 @@ config RISCV
>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select HAVE_FUNCTION_ERROR_INJECTION
>  	select HAVE_GCC_PLUGINS
> -	select HAVE_GENERIC_VDSO if MMU
>  	select HAVE_IRQ_TIME_ACCOUNTING
>  	select HAVE_KERNEL_BZIP2 if !EFI_ZBOOT
>  	select HAVE_KERNEL_GZIP if !EFI_ZBOOT
> @@ -227,6 +226,7 @@ config RISCV
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
>  	select UACCESS_MEMCPY if !MMU
> +	select VDSO_DATASTORE if MMU
>  	select VDSO_GETRANDOM if MMU && 64BIT
>  	select USER_STACKTRACE_SUPPORT
>  	select ZONE_DMA32 if 64BIT
> diff --git a/include/linux/vdso_datastore.h b/include/linux/vdso_datastore.h
> index 3dfba9502d78..13b01baf3497 100644
> --- a/include/linux/vdso_datastore.h
> +++ b/include/linux/vdso_datastore.h
> @@ -7,10 +7,10 @@
>  extern const struct vm_special_mapping vdso_vvar_mapping;
>  struct vm_area_struct *vdso_install_vvar_mapping(struct mm_struct *mm, unsigned long addr);
>  
> -#ifdef CONFIG_HAVE_GENERIC_VDSO
> +#ifdef CONFIG_VDSO_DATASTORE
>  void __init vdso_setup_data_pages(void);
> -#else /* !CONFIG_HAVE_GENERIC_VDSO */
> +#else /* !CONFIG_VDSO_DATASTORE */
>  static inline void vdso_setup_data_pages(void) { }
> -#endif /* CONFIG_HAVE_GENERIC_VDSO */
> +#endif /* CONFIG_VDSO_DATASTORE */
>  
>  #endif /* _LINUX_VDSO_DATASTORE_H */
> diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
> index eedb04974fd5..597f5f0f9681 100644
> --- a/lib/vdso/Kconfig
> +++ b/lib/vdso/Kconfig
> @@ -1,11 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -config HAVE_GENERIC_VDSO
> +config VDSO_DATASTORE
>  	bool
>  
>  config GENERIC_GETTIMEOFDAY
>  	bool
> -	select HAVE_GENERIC_VDSO
> +	select VDSO_DATASTORE
>  	help
>  	  This is a generic implementation of gettimeofday vdso.
>  	  Each architecture that enables this feature has to
> @@ -20,6 +20,6 @@ config GENERIC_VDSO_OVERFLOW_PROTECT
>  
>  config VDSO_GETRANDOM
>  	bool
> -	select HAVE_GENERIC_VDSO
> +	select VDSO_DATASTORE
>  	help
>  	  Selected by architectures that support vDSO getrandom().
> diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
> index 405f743253d7..ac304def42d6 100644
> --- a/lib/vdso/Makefile
> +++ b/lib/vdso/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -obj-$(CONFIG_HAVE_GENERIC_VDSO) += datastore.o
> +obj-$(CONFIG_VDSO_DATASTORE) += datastore.o
> 

-- 
Regards,
Vincenzo


