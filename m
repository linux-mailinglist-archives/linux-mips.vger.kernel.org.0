Return-Path: <linux-mips+bounces-15618-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T82gOpkhTmosDwIAu9opvQ
	(envelope-from <linux-mips+bounces-15618-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 12:08:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A21E7240D0
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 12:08:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=tomzzafw;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15618-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15618-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B9B3301BCC6
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2173876BE;
	Wed,  8 Jul 2026 10:01:24 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156E386559;
	Wed,  8 Jul 2026 10:01:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504884; cv=none; b=KHyC+JyGxNC0AmfzYgUen3RCpQ9e7xTSbDBu8ZkEnbF8whKwD0POd3JJHWOJGu/+ydM//8GCVeQ4ZlmkR5oJwojNbf2tL03xdxjkt7S98GBydha8tS2aISCGhgnOed7ZVimYaANl2MnEmnfVekw40nLe3rn5C3oC7WDJJrkebEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504884; c=relaxed/simple;
	bh=v3KJtBo5Xem/p/SeBQj6Qhc8hgb1AUIW8ixeXUi+7/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pFWs2ZQDbtEtKpyzBrsLDBevobu+V4URdvO77gaOkoMCjXwkLTLe5AUVMvIqgJuh+HyhgclU4PwW2XU6vLE9Bhkdfk5c5zOQJXT30DXz9t8v0Q3UvWSMxcEXFDDUrGJkoDH1xPOfkB4yzxDWY2zxXZg3hKzESXsU3bb1/ZppbgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=tomzzafw; arc=none smtp.client-ip=113.46.200.227
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VJ+P1FAy8PcQIRUquHStGYnLrQlgAn0eWhkNpUoI/wA=;
	b=tomzzafwsssd0sSDomrfOJwELNtTFSNuiVO5enkxvs+RDcaw7dnogCNwwB0OisQ6rmlp4MR1e
	LaFynzUOTFHZpsULsEv32JVlmVZOibMtZJ3S6Aj0oXPpCQNmBXfS21gp2HTpBsIA5cFULT5lyhz
	cE8fI+QRaFv77GKUEf8nLvk=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gwD0d4P6nznTVZ;
	Wed,  8 Jul 2026 17:52:33 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9995F40578;
	Wed,  8 Jul 2026 18:01:09 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Jul 2026 18:01:05 +0800
Message-ID: <3501828e-7dd4-4587-b29a-71eabcc05ab8@huawei.com>
Date: Wed, 8 Jul 2026 18:01:04 +0800
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
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15618-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:from_mime,huawei.com:email,huawei.com:mid,huawei.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A21E7240D0



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
> we'd have something akin to setup_boot_cpu_features() for the secondary
> CPUs.

This approach most thoroughly avoids concurrency issues, as after
cpuhp_ap_sync_alive(), the secondary CPUs are woken up serially by the
boot CPU.

It also eliminates the problem of boot CPUs being stuck in deadlock wait
for the secondary CPUs, because update_cpu_capabilities() does not call
cpu_die_early() or cpu_panic_kernel().

Is it similar to the following code?

diff --git a/arch/arm64/include/asm/cpufeature.h
b/arch/arm64/include/asm/cpufeature.h
index 6c95227032b0..33185527aea9 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -651,6 +651,7 @@ void __init setup_system_features(void);
 void __init setup_user_features(void);

 void check_local_cpu_capabilities(void);
+void setup_secondary_cpu_capabilities(void);

 u64 read_sanitised_ftr_reg(u32 id);
 u64 __read_sysreg_by_encoding(u32 sys_id);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e3110a572bc8..4d106d90adb0 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3859,6 +3859,12 @@ void check_local_cpu_capabilities(void)
         */
        check_early_cpu_features();

+       if (system_capabilities_finalized())
+               verify_local_cpu_capabilities();
+}
+
+void setup_secondary_cpu_capabilities(void)
+{
        /*
         * If we haven't finalised the system capabilities, this CPU gets
         * a chance to update the errata work arounds and local features.
@@ -3867,8 +3873,6 @@ void check_local_cpu_capabilities(void)
         */
        if (!system_capabilities_finalized())
                update_cpu_capabilities(SCOPE_LOCAL_CPU);
-       else
-               verify_local_cpu_capabilities();
 }

 bool this_cpu_has_cap(unsigned int n)
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index fd824b96ab19..7d4c369fa090 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -243,6 +243,7 @@ asmlinkage notrace void secondary_start_kernel(void)
         * we made it into the kernel. We're still not 'online'.
         */
        cpuhp_ap_sync_alive();
+       setup_secondary_cpu_capabilities();

        update_cpu_features(cpu);
        store_cpu_topology(cpu);


> 
> Will


