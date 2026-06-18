Return-Path: <linux-mips+bounces-15143-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8na5CasTNGoHNwYAu9opvQ
	(envelope-from <linux-mips+bounces-15143-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 17:50:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3366A1550
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 17:50:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YZa46pD7;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15143-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15143-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A6CF300BD65
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 15:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EC6261B8D;
	Thu, 18 Jun 2026 15:49:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F32C2AF00;
	Thu, 18 Jun 2026 15:49:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781797797; cv=none; b=LaZJ/Qz6x+JSgXyhZ/dZEqvppJPmvLf8S+/zG+VOOFDBqjyurwq95AMeeb8IaQD/LsaVhOHAvH3reMQSAYg8MjiaE/BLgjG4EfU64kUgTvymQ/zaVdMYCUAEdtXXUVgL8hjAZrLRzS253UNrD3XIVQOFNFUpz7DGS9Pi8Twxsj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781797797; c=relaxed/simple;
	bh=WWiXxly0mJ3+F0lWHKrSXouTJLJFbZ/rd363dd3/lFc=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qXNqBGnkTlzAQPPUMaVnFgIatReKrp1nKKWNg2ppBXr+BGvY1p0PyOL2QxS4ccUgj8SmfmRnh8Q+46BBSrTFwW8iXfdVNREXqiSZtA0ESR8HYHRHk7oITLAxuFkbycLzG0vHTYf2yYi2GgdL3FRcowC2GFs9e/X18TzPz4AwGoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZa46pD7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A481F000E9;
	Thu, 18 Jun 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781797796;
	bh=qhtrSbHirGTn3X9GtoAgD1uJ6365h6axZEkDGXJnLig=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=YZa46pD7DMphteXc9fyJEfzFDN3v9hbCr5E3KSw+xc2sAGO2FB84BSaEGhnN5Xw3Q
	 00UIrqFbWsiyD3eR3T3l53dWgRFpsuZeXBFJyAm9BVsdoCkc1Ih7TfOifDe0BzAkeE
	 /GmN/ZEFazUmwf3Te43GzWUKLCLbUVGTq1IQw13XqE1gXoKE+74gvPQCGh+xNzfkrx
	 5Mf97X4K6K2zTq9ygbtvyHPSeb+VNcppHGhK8pLQo6P4t+s9XGtQiPFdcpZKWeqaLf
	 S98IH43bTqjGuG1bC+2bMvt4Y38nQdaDitJxuo/sTcZHwhEqzGWeH27rNxOCQ9Oala
	 zPIOCmXJaCRuA==
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
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
In-Reply-To: <20260611133809.3854977-4-ruanjinjie@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
Date: Thu, 18 Jun 2026 17:49:53 +0200
Message-ID: <877bnvdf1a.ffs@fw13>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-15143-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E3366A1550

On Thu, Jun 11 2026 at 21:38, Jinjie Ruan wrote:
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -113,6 +113,7 @@ config ARM64
>  	select CPUMASK_OFFSTACK if NR_CPUS > 256
>  	select DCACHE_WORD_ACCESS
>  	select HAVE_EXTRA_IPI_TRACEPOINTS
> +	select HOTPLUG_PARALLEL if SMP && HOTPLUG_CPU

Why do you tie that to HOTPLUG_CPU? HOTPLUG_CPU lets you unplug/plug
CPUs at runtime, but if its disabled then a SMP system still has to
bring up the APs. So why should that fall back to the existing variant?

> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +extern struct secondary_data cpu_boot_data[NR_CPUS];
> +#endif
> +
>  extern struct secondary_data secondary_data;
>  extern long __early_cpu_boot_status;
>  extern void secondary_entry(void);
> @@ -124,7 +128,11 @@ static inline void __noreturn cpu_park_loop(void)
>  
>  static inline void update_cpu_boot_status(unsigned int cpu, int val)
>  {
> +#ifdef CONFIG_HOTPLUG_PARALLEL
> +	WRITE_ONCE(cpu_boot_data[cpu].status, val);
> +#else
>  	WRITE_ONCE(secondary_data.status, val);
> +#endif

You're really a great fan of #ifdefs, right?

Just convert it over to the parallel mode unconditionally and get rid of
the existing cruft.

>  	/*
>  	 * TTBR0 is only used for the identity mapping at this stage. Make it
>  	 * point to zero page to avoid speculatively fetching new entries.
> @@ -254,7 +276,9 @@ asmlinkage notrace void secondary_start_kernel(void)
>  					 read_cpuid_id());
>  	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
>  	set_cpu_online(cpu, true);
> +#ifndef CONFIG_HOTPLUG_PARALLEL
>  	complete(&cpu_running);
> +#endif

Just for the record. You can get rid of this completion w/o PARALLEL
hotplug by selecting HOTPLUG_SPLIT_STARTUP and implementing the
kick/sync parts.
  
Thanks,

        tglx

