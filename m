Return-Path: <linux-mips+bounces-15158-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bgEYLkbpOGrwjwcAu9opvQ
	(envelope-from <linux-mips+bounces-15158-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 09:50:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 523EE6AD685
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 09:50:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=dTXHI5OT;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15158-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15158-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE5923000B34
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 07:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1035312826;
	Mon, 22 Jun 2026 07:50:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EC937B02B;
	Mon, 22 Jun 2026 07:50:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782114628; cv=none; b=aVfKYNpinTejFBKnJjVtpZm33Obr4NN2VFMy2UX6zc+gz7bTg9OI++OKe2I8m+QHOIellDK5V/S6W0WgFM82PHPA0N+E9Od9jZwZqtc4ia0inwdDcwKS2+b7wSdtbLwxdavELhtIi+6SS2lJxZY+gPXDpBbEBARIgYqGRy+wurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782114628; c=relaxed/simple;
	bh=1xi3mqqBo8CbucOMMWckYgz9xUIMzzoWbm+5da2hzhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C6bhMk7kArk1s1jNGsTSP7ga3tmF7Gha4x3MvFdGirbYnLen9vne/oMUqXcysV6e4mPYrCbBG64KuJmzgMibJto9Tu/WqQtWfH2Lz8pfRp6rvf5F4uPrDexxTSpSZz14XDlOu2bShwrAcLreyYr1nncBRrKdUHKUzTALYvHHqBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=dTXHI5OT; arc=none smtp.client-ip=113.46.200.220
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DjhxJIXwZtlu+S1mzuRLvpGJ+I0yWr65Zu0vmWK+UsM=;
	b=dTXHI5OT3kJg6ZwKeZ7l+1YDr6b1hpRbY8s8z0T12kaOnMUVi+FGyMWPDPdkApaBuVatBA7uC
	Z0GKJFORdTMX2Azn6tNgGnMd1iV5ZufaianvsXLsU15PMBLIB0HzyaukESDfsIE8SzVz6SZBDp5
	/oThe3zRYAqwKkDmxGgBWFo=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gkKrn1qmxz12LDT;
	Mon, 22 Jun 2026 15:41:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8201240561;
	Mon, 22 Jun 2026 15:50:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 15:50:14 +0800
Message-ID: <49895e73-0fab-4410-93ba-f850f0586b1d@huawei.com>
Date: Mon, 22 Jun 2026 15:50:13 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
To: Thomas Gleixner <tglx@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <tsbogend@alpha.franken.de>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <oupton@kernel.org>, <yeoreum.yun@arm.com>,
	<miko.lenczewski@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<james.clark@linaro.org>, <tabba@google.com>, <mrigendra.chaubey@gmail.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com> <87a4srdgk0.ffs@fw13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <87a4srdgk0.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15158-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 523EE6AD685



On 6/18/2026 11:17 PM, Thomas Gleixner wrote:
> On Thu, Jun 11 2026 at 21:38, Jinjie Ruan wrote:
> 
>> During parallel CPU bringup, x86 requires primary SMT threads to boot
>> first to avoid siblings stopping during microcode updates. This constraint
>> is architecture-specific and unnecessary for other platforms
>> like arm64.
>>
>> Introduce CONFIG_PARALLEL_SMT_PRIMARY_FIRST to decouple this constraint.
>> Platforms requiring this temporal order (e.g., x86) can select it
>> in Kconfig. Other architectures (e.g., arm64) can leave it unselected
>> to entirely bypass the SMT branch via the preprocessor.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/Kconfig       | 4 ++++
>>  arch/mips/Kconfig  | 1 +
>>  arch/riscv/Kconfig | 1 +
>>  arch/x86/Kconfig   | 1 +
>>  kernel/cpu.c       | 6 +++++-
>>  5 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index e86880045158..0365d2df2659 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>>  	bool
>>  	select HOTPLUG_SPLIT_STARTUP
>>  
>> +config PARALLEL_SMT_PRIMARY_FIRST
> 
> Proper namespaces are overrated, right?
> 
> All related options start with HOTPLUG_....

Sure, will update to `HOTPLUG_PARALLEL_SMT`		

> 
>> +	bool
>> +	depends on HOTPLUG_PARALLEL
>> +
>>  config GENERIC_IRQ_ENTRY
>>  	bool
>>  
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 4364f3dba688..84e11ac0cf71 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -642,6 +642,7 @@ config EYEQ
>>  	select MIPS_CPU_SCACHE
>>  	select MIPS_GIC
>>  	select MIPS_L1_CACHE_SHIFT_7
>> +	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
>>  	select PCI_DRIVERS_GENERIC
>>  	select SMP_UP if SMP
>>  	select SWAP_IO_SPACE
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index d235396c4514..0cc49aecc841 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -210,6 +210,7 @@ config RISCV
>>  	select OF
>>  	select OF_EARLY_FLATTREE
>>  	select OF_IRQ
>> +	select PARALLEL_SMT_PRIMARY_FIRST if HOTPLUG_PARALLEL
> 
> Why does RISCV need this? It does not select HOTPLUG_SMT to begin with.

You are right, this was initially done to keep in line with the legacy
implementation.

> 
>> +#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
>>  #ifdef CONFIG_HOTPLUG_SMT
> 
> More #ifdeffery is better, right?
> 
>>  static inline bool cpuhp_smt_aware(void)
>>  {
>> @@ -1811,7 +1812,8 @@ static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
>>  {
>>  	return cpu_none_mask;
>>  }
>> -#endif
>> +#endif /* CONFIG_HOTPLUG_SMT */
>> +#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
>>  
>>  bool __weak arch_cpuhp_init_parallel_bringup(void)
>>  {
>> @@ -1837,6 +1839,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
>>  	if (!__cpuhp_parallel_bringup)
>>  		return false;
>>  
>> +#ifdef CONFIG_PARALLEL_SMT_PRIMARY_FIRST
> 
> Seriously?
> 
>>  	if (cpuhp_smt_aware()) {
>>  		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
>>  		static struct cpumask tmp_mask __initdata;
>> @@ -1857,6 +1860,7 @@ static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
>>  		cpumask_andnot(&tmp_mask, mask, pmask);
>>  		mask = &tmp_mask;
>>  	}
>> +#endif /* CONFIG_PARALLEL_SMT_PRIMARY_FIRST */
> 
> Something simple like the uncompiled below should just work, no?

Yes, everything looks good, except for a minor compilation issue.

> 
> ---
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>  	bool
>  	select HOTPLUG_SPLIT_STARTUP
>  
> +config HOTPLUG_PARALLEL_SMT
> +	bool
> +	select HOTPLUG_PARALLEL
> +

+config HOTPLUG_PARALLEL_SMT
+       bool
+       select HOTPLUG_PARALLEL
+       select HOTPLUG_SMT

We should select HOTPLUG_SMT here to prevent the compilation issue where
HOTPLUG_PARALLEL_SMT is enabled without HOTPLUG_SMT.

>  config GENERIC_IRQ_ENTRY
>  	bool
>  
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -657,7 +657,7 @@ config EYEQ
>  	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
>  	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
>  	select USE_OF
> -	select HOTPLUG_PARALLEL if HOTPLUG_CPU
> +	select HOTPLUG_PARALLEL_SMT if HOTPLUG_CPU
>  	help
>  	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
>  
> @@ -2295,7 +2295,6 @@ config MIPS_CPS
>  	select MIPS_CM
>  	select MIPS_CPS_PM if HOTPLUG_CPU
>  	select SMP
> -	select HOTPLUG_SMT if HOTPLUG_PARALLEL
>  	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
>  	select SYS_SUPPORTS_HOTPLUG_CPU
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -304,7 +304,7 @@ config X86
>  	select HAVE_USER_RETURN_NOTIFIER
>  	select HAVE_GENERIC_VDSO
>  	select VDSO_GETRANDOM			if X86_64
> -	select HOTPLUG_PARALLEL			if SMP && X86_64
> +	select HOTPLUG_PARALLEL_SMT		if SMP && X86_64
>  	select HOTPLUG_SMT			if SMP
>  	select HOTPLUG_SPLIT_STARTUP		if SMP && X86_32
>  	select IRQ_FORCED_THREADING
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -1792,7 +1792,7 @@ static int __init parallel_bringup_parse
>  }
>  early_param("cpuhp.parallel", parallel_bringup_parse_param);
>  
> -#ifdef CONFIG_HOTPLUG_SMT
> +#ifdef CONFIG_HOTPLUG_PARALLEL_SMT
>  static inline bool cpuhp_smt_aware(void)
>  {
>  	return cpu_smt_max_threads > 1;
> 


