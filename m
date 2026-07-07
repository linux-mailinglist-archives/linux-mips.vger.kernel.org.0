Return-Path: <linux-mips+bounces-15565-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cyyLOF5sTGpSkQEAu9opvQ
	(envelope-from <linux-mips+bounces-15565-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 05:02:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6C716EB1
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 05:02:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=RdrZkx6I;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15565-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15565-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3706E302880E
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 03:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE055277818;
	Tue,  7 Jul 2026 03:02:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA0213B293;
	Tue,  7 Jul 2026 03:02:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783393370; cv=none; b=jeVr+9KwJhHGt8XhRBOcjXEGBrzzA4szy8+OTRQZS2hX4L4anMJWqPjinKDfFLXCqyWMuf2CejLGL9yV3dOIa3AZylUhbodm1gj48GTyiHCEd03ZfuIP92bkpZFVwzLjj9qQPNLnAk24bKOVjR37HLumfWXUcFEFOjf4p2exRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783393370; c=relaxed/simple;
	bh=jzEzSBYAnImlOyMHNej43RqyT7Dvy3QB55NeJr4VqH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JsgAyZAc6KjbLPajMa/gV8Q7cPXCBtSxB0Q2APexHGJR/x2vH/25aW3oE7yD+A+Ces88ykv7Kh3A3UI4ZJUczhaznCPn/nbhll90dNWRpdwiXcLdzwgLRgRWVP4YQxG3rVYPVA0c+JUdQsWjhvAm/RbaXdZfrJCCZHacaKTbwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RdrZkx6I; arc=none smtp.client-ip=113.46.200.226
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EXqyHBs1kBtCPhYjI0EwQemI55P4LRleAN6bdVwX2cs=;
	b=RdrZkx6I/RpcC4QwldmkROMcQcdlP6D9E+UpBI643BBQKOMjsWQHmCBCBXwTKYzoNi6q93vdA
	d739jgKEfUa8EgxZlpMphkHOoCYR23asyh9OZo8RTo8VTuc5Q6wjCdvqPcmMaovwaNvjOdItCVc
	hnbkdDYC4RRVTApzctXQxms=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gvQlP0rwdzKm5j;
	Tue,  7 Jul 2026 10:53:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id D4ED540565;
	Tue,  7 Jul 2026 11:02:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 11:02:34 +0800
Message-ID: <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
Date: Tue, 7 Jul 2026 11:02:32 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] arm64: smp: Defer RCU registration during
 secondary CPU bringup
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <tsbogend@alpha.franken.de>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <peterz@infradead.org>, <kees@kernel.org>,
	<nathan@kernel.org>, <linusw@kernel.org>, <ojeda@kernel.org>,
	<david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>, <ryan.roberts@arm.com>,
	<maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <menglong8.dong@gmail.com>, <oupton@kernel.org>,
	<yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>, <broonie@kernel.org>,
	<kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-6-ruanjinjie@huawei.com>
 <akvoVCNFwDorQg6y@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvoVCNFwDorQg6y@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
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
	TAGGED_FROM(0.00)[bounces-15565-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[arm.com,alpha.franken.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:from_mime,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94D6C716EB1



On 7/7/2026 1:39 AM, Will Deacon wrote:
> On Wed, Jun 24, 2026 at 05:25:30PM +0800, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>> index c14b179c595d..87f92cf9ffa8 100644
>> --- a/arch/arm64/kernel/smp.c
>> +++ b/arch/arm64/kernel/smp.c
>> @@ -35,6 +35,7 @@
>>  #include <linux/kgdb.h>
>>  #include <linux/kvm_host.h>
>>  #include <linux/nmi.h>
>> +#include <linux/lockdep.h>
>>  
>>  #include <asm/alternative.h>
>>  #include <asm/atomic.h>
>> @@ -215,15 +216,23 @@ asmlinkage notrace void secondary_start_kernel(void)
>>  	if (system_uses_irq_prio_masking())
>>  		init_gic_priority_masking();
>>  
>> -	rcutree_report_cpu_starting(cpu);
>> -	trace_hardirqs_off();
>> +	lockdep_hardirqs_off(CALLER_ADDR0);
>>  
>> +	/*
>> +	 * Since RCU is still offline on this CPU, any nested native printk
>> +	 * or lock acquisition would normally trigger a false-positive
>> +	 * "suspicious RCU usage" lockdep splat.
>> +	 */
>> +	lockdep_off();
> 
> On the flip side, should we really be taking locks at this point? I'm
> actually quite sympathetic to lockdep here and I worry that disabling
> it briefly is going to hide real problems down the line.

Hi Will,

I fully share your concern. Disabling lockdep globally or even across a
large function like check_local_cpu_capabilities() is risky — it would
suppress *all* lock validation in that path, not just the harmless
early-boot warnings.

> 
> ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
> handle the useless print in cpuinfo_detect_icache_policy(), but I've
> decided just to remove that one. So I think the remaining prints we have
> to worry about in this early boot code are from error paths in the
> CPU feature detection logic (check_local_cpu_capabilities()).
> 
> Given that those error paths should all be fatal, perhaps we could
> rework cpu_die_early() and cpu_panic_kernel() as macros that take a
> string argument and either call printk_deferred() (similarly to what you
> suggested in a previous version of your series [1]) or do the
> lockdep_off() there before a pr_crit().
> 
> What do you think?

That is an excellent point. Reworking cpu_die_early() and
cpu_panic_kernel() to uniformly use printk_deferred() based on the
specific error type or the string argument is a much cleaner approach.

This makes perfect sense because these paths are inherently fatal, and
switching to deferred printing avoids the risky lock-taking and RCU
runtime constraints during early boot entirely. It cleanly resolves the
diagnostic noise without broadly blinding lockdep or hiding potential
locking issues down the line.

I fully agree with this approach.

Best regards,
Jinjie

> 
> Will
> 
> [1] https://lore.kernel.org/all/20260618092444.1316336-4-ruanjinjie@huawei.com/


