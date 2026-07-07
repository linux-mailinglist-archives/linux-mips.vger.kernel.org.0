Return-Path: <linux-mips+bounces-15566-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q6GDMOVxTGq3kgEAu9opvQ
	(envelope-from <linux-mips+bounces-15566-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 05:26:29 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACCD71710A
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 05:26:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=A72vJeMQ;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15566-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15566-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EE9D30315D6
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 03:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9631D344DB5;
	Tue,  7 Jul 2026 03:24:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0E125A2DD;
	Tue,  7 Jul 2026 03:24:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394684; cv=none; b=Ngaq/5qSUdbde+ZLFnbhgcSKU37TLWA0vsPuWnrAQ+NsZA6iUttqBnAY7e7ks88+Oqan9kCHuJly2FX0Wf6QOFWWwyyKmKRNY07tbVXC+RkbR0vjMPNm5mAFiFfGZ5Z164zRMiCD5I/IbjfbGYGyw1+jlx/pOBbuS0cO9ZNes3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394684; c=relaxed/simple;
	bh=YQTGgv2QyLW3c0j1o/hG6wa0H3t2c7p4Vk5dGgZ2Z9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Do5MAKJdLyNtDyVSxnDrWHDGUCnmXkdJmSlmp+GrAvoXAmguaSzFMI87quHnvFUkOUVAtv3a2u2HkTcs2X5Sxl/Yn72UHpdnqVXKDUDMkIou6OddzdGFkZlGlIYFIK4BTzSanc5ptfWd3MDgO/GaCnMpFDl5ZiWC0oyU7OeYyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=A72vJeMQ; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NjvgHK+G0r4/mvCQ9MN1WfW1ce01kaSxTrYU8mERSnc=;
	b=A72vJeMQMW9HloQLkhuJIPwWH24vuFemiwkIkj9V71URNM0KUux4vDUG/CPODyN8UuiVLGHUk
	Z3SMYB4vf5XK4tcZAcIPGMESXgbbBz9lWv61BaNDE5QuQxWOhXTpHRiosr9h/GucbvXR+Pnneau
	fgfymoJvVlveakYsPTMFS9U=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gvRDn6V4Bz1prq6;
	Tue,  7 Jul 2026 11:15:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 299154058C;
	Tue,  7 Jul 2026 11:24:37 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 11:24:34 +0800
Message-ID: <6a388036-e3ce-4cf3-a413-c78ec6c0a012@huawei.com>
Date: Tue, 7 Jul 2026 11:24:33 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] arm64: cpufeature: Ensure atomic updates to
 system_cpucaps bitmap
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
 <20260624092537.2916971-10-ruanjinjie@huawei.com>
 <akvooksAvkmG971U@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvooksAvkmG971U@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15566-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,huawei.com:from_mime,huawei.com:email,huawei.com:mid,huawei.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5ACCD71710A



On 7/7/2026 1:40 AM, Will Deacon wrote:
> On Wed, Jun 24, 2026 at 05:25:34PM +0800, Jinjie Ruan wrote:
>> Parallel CPU bringup allows multiple secondary CPUs to concurrently
>> execute update_cpu_capabilities() during early boot.
>>
>> The current non-atomic __set_bit() and __clear_bit() helpers perform
>> unserialized updates on the shared global bitmap, risking data races
>> and feature flag erasure.
>>
>> Upgrade these operations to set_bit() and clear_bit() to ensure all
>> concurrent modifications are properly serialized via arm64 atomics.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/kernel/cpufeature.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index be75e60d56ca..a1a13f3e01ed 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -3548,7 +3548,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>>  
>>  		if (!caps->matches(caps, cpucap_default_scope(caps))) {
>>  			if (match_all)
>> -				__clear_bit(caps->capability, system_cpucaps);
>> +				clear_bit(caps->capability, system_cpucaps);
>>  			continue;
>>  		}
>>  
>> @@ -3559,7 +3559,7 @@ static void update_cpu_capabilities(u16 scope_mask)
>>  		if (!match_all && caps->desc && !caps->cpus)
>>  			pr_info("detected: %s\n", caps->desc);
>>  
>> -		__set_bit(caps->capability, system_cpucaps);
>> +		set_bit(caps->capability, system_cpucaps);
>>  
>>  		if (boot_cpu && (caps->type & SCOPE_BOOT_CPU))
>>  			set_bit(caps->capability, boot_cpucaps);
> 
> I don't think this is sufficient. Even if we use atomic updates for the
> low-level bits, the logic here which tries to avoid re-probing features
> that have already been detected isn't going to work correctly if it's
> running concurrently with itself.
> 
> I think the best bet is probably to move update_cpu_capabilities() out
> of check_local_cpu_capabilities() and call it after cpuhp_ap_sync_alive()
> when the system capabilities are not yet finalised. WDYT? That means

Hi Will,

I have also considered this direction, and I fully agree that it is a
much more robust solution than merely making the bit operations atomic.

- Concurrency is eliminated completely: After moving
update_cpu_capabilities() to after cpuhp_ap_sync_alive(), the subsequent
CPU state transitions (e.g., from the AP synchronization phase to the
final online state) are strictly serialised by the cpuhp state machine.
This means system_cpucaps will no longer be modified concurrently. The
original race condition simply disappears.

- No dead-wait on the boot CPU: I also verified that
update_cpu_capabilities() never calls cpu_die_early() — it only updates
system-wide capability bitmaps and does not trigger any error path that
would cause a secondary CPU to fail or die. Therefore, moving its
invocation to a later point (after the sync point) will not introduce
any risk of the boot CPU waiting indefinitely for a secondary CPU that
might have panicked or got stuck.

Thus, I think your suggestion is the correct way forward.

Best regards,
Jinjie

> we'd have something akin to setup_boot_cpu_features() for the secondary
> CPUs.
> 
> Will


