Return-Path: <linux-mips+bounces-15161-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yJkxFVLxOGqRkQcAu9opvQ
	(envelope-from <linux-mips+bounces-15161-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 10:24:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 595FA6ADAE3
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 10:24:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=32UN6GCj;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15161-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15161-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 622D5301FD6C
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 08:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9D538F25A;
	Mon, 22 Jun 2026 08:17:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E829A2EA754;
	Mon, 22 Jun 2026 08:17:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116227; cv=none; b=JrkeMbNi2cceOp2occoEHIFY0Rw+K+E282NwTvDEL+Juenrr5zywJjKzF5aiG/mbWUUVZDKRJ3gOhfZ9XkCV2c4ZqT/n0FSfuOoaFTBGmyxvUM3lgBHNOQ55yKkJPIRR5ST7TkzpGXkaoaDEFf3K3DmvEDFHdoyLBxYQbUUQLNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116227; c=relaxed/simple;
	bh=NlTbKlikpxGfwhlfvvnLqrvEnFDSEArztXdB3Ou0QYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dbpLVR3jDjXLpwn4B+GtWbxawxJvmW8gh7Q272qZFf0xjnMIfy0dyUpdnNWepwsX1H1+GJMvxEg2sWbpzcAGpIJ9UyIQ+bA4/Gpz1xkAqWoFCcYFTqwiDBnty/JVqLUxTfCvG6GO/gaDTdaBNekAVuAMKvpgVyildgI8q2J/LDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=32UN6GCj; arc=none smtp.client-ip=113.46.200.226
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zzVaDuY6/n0O0qjK4FnrYeXHbf9up1LtzyGheGeNC8k=;
	b=32UN6GCjhoiPh5jiznhE4KR2w6F+lHYHPuOytVHe2MGRiN/2O6cuXOuJKC2z2lriAm2tQ2MV3
	Wxvktg+w16Ys4wEbB4+0vM7gBzgVXJOWIKye9HASaGUG9+kABPGYatXJQfkhXzZMGJlX6JsCp6H
	tmr5AyRpgzFkzpzn/HjvVHM=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gkLSL2bzKzKm5L;
	Mon, 22 Jun 2026 16:08:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 67C0240572;
	Mon, 22 Jun 2026 16:16:54 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 16:16:52 +0800
Message-ID: <c3eaf1da-c1c3-413e-8f86-cb42faff309f@huawei.com>
Date: Mon, 22 Jun 2026 16:16:51 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
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
 <20260611133809.3854977-4-ruanjinjie@huawei.com> <877bnvdf1a.ffs@fw13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <877bnvdf1a.ffs@fw13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15161-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,alpha.franken.de,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:mid,huawei.com:from_mime,infradead.org:url,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 595FA6ADAE3



On 6/18/2026 11:49 PM, Thomas Gleixner wrote:
> On Thu, Jun 11 2026 at 21:38, Jinjie Ruan wrote:
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -113,6 +113,7 @@ config ARM64
>>  	select CPUMASK_OFFSTACK if NR_CPUS > 256
>>  	select DCACHE_WORD_ACCESS
>>  	select HAVE_EXTRA_IPI_TRACEPOINTS
>> +	select HOTPLUG_PARALLEL if SMP && HOTPLUG_CPU
> 
> Why do you tie that to HOTPLUG_CPU? HOTPLUG_CPU lets you unplug/plug
> CPUs at runtime, but if its disabled then a SMP system still has to
> bring up the APs. So why should that fall back to the existing variant?

That's a very good point. Parallel bringup of APs during early boot
should indeed benefit SMP systems even if runtime CPU hotplug
(HOTPLUG_CPU) is disabled. I will decouple this optimization from
HOTPLUG_CPU and tie it strictly to SMP. Thanks for catching this!

> 
>> +#ifdef CONFIG_HOTPLUG_PARALLEL
>> +extern struct secondary_data cpu_boot_data[NR_CPUS];
>> +#endif
>> +
>>  extern struct secondary_data secondary_data;
>>  extern long __early_cpu_boot_status;
>>  extern void secondary_entry(void);
>> @@ -124,7 +128,11 @@ static inline void __noreturn cpu_park_loop(void)
>>  
>>  static inline void update_cpu_boot_status(unsigned int cpu, int val)
>>  {
>> +#ifdef CONFIG_HOTPLUG_PARALLEL
>> +	WRITE_ONCE(cpu_boot_data[cpu].status, val);
>> +#else
>>  	WRITE_ONCE(secondary_data.status, val);
>> +#endif
> 
> You're really a great fan of #ifdefs, right?
> 
> Just convert it over to the parallel mode unconditionally and get rid of
> the existing cruft.

Converting this unconditionally to use cpu_boot_data makes the code so
much cleaner. Thanks for the guidance!

> 
>>  	/*
>>  	 * TTBR0 is only used for the identity mapping at this stage. Make it
>>  	 * point to zero page to avoid speculatively fetching new entries.
>> @@ -254,7 +276,9 @@ asmlinkage notrace void secondary_start_kernel(void)
>>  					 read_cpuid_id());
>>  	update_cpu_boot_status(cpu, CPU_BOOT_SUCCESS);
>>  	set_cpu_online(cpu, true);
>> +#ifndef CONFIG_HOTPLUG_PARALLEL
>>  	complete(&cpu_running);
>> +#endif
> 
> Just for the record. You can get rid of this completion w/o PARALLEL
> hotplug by selecting HOTPLUG_SPLIT_STARTUP and implementing the
> kick/sync parts.

I will look into selecting HOTPLUG_SPLIT_STARTUP and cleaning up this
completion mechanism either as a prerequisite cleanup patch. For now, I
will make sure to eliminate the ugly #ifndef as suggested earlier.

>   
> Thanks,
> 
>         tglx
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


