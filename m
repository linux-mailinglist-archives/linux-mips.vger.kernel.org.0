Return-Path: <linux-mips+bounces-15617-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6tuqG1AaTmo8DQIAu9opvQ
	(envelope-from <linux-mips+bounces-15617-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 11:37:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5F723CDF
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 11:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=cvAKe2fa;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15617-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15617-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49EA5300D4D2
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 09:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA4F41DEF4;
	Wed,  8 Jul 2026 09:37:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB873FDBE8;
	Wed,  8 Jul 2026 09:37:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503430; cv=none; b=hy58SN6t2Dal/f1h1GFFU1n3oXYrzQZ82YvDDpj21vAKKWYUMS8mWojaqfPNrIKSLFFnz4e6nagDBND6+94qaCiwTp5oYvbFCpHIGIajgcDikf7WMy9EoHzkiEdcSlQMlIavjwGL/MVaxtW5bj9fhwok1KdDTNpAroxNaI9iO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503430; c=relaxed/simple;
	bh=unbt5QSrhYd0Sd0PW0esvzU8vJrhxOJL0LXuv0Imt7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r8kOX4lkLyuSfhWhboi14EqKeKHrD3uvGnL8rpZlroYKuaDzYQzMtPizIowfxGWn5pRlPF2WrTMm8UjvBWX7cpxArYIL9E3nbJ8Q00zAqcJPKCPNeXx9eaekHcE63TMBH1XWR5BKrL8tEiQplTpvTGMJjazDrjLbrZ7NbhRfi/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=cvAKe2fa; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uft61UqF2OH845ovVMSC0RoRp8WC5Tyhv6JXJK2f1jU=;
	b=cvAKe2faq47q7nZiX5huwb1SMtBoX7Zd0csNmOprhdaoUgMG9gMDSZh63+li1lINBwggS0kJY
	Iwx3k4IynFJeI52XyFCLkCNRwe/l7hyLuNsAeQf+HIFoGFnkN1NytOygH2VjkAUlPt27JfywUBT
	6MIxnSl7kaxZMEz2EWUDIMM=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gwCRt3kxzz1prLP;
	Wed,  8 Jul 2026 17:27:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8363C40577;
	Wed,  8 Jul 2026 17:36:54 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 8 Jul 2026 17:36:51 +0800
Message-ID: <7e1b4daa-1466-4cf6-9d22-d19a2c9429d4@huawei.com>
Date: Wed, 8 Jul 2026 17:36:50 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
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
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
 <3bf910b8-c7e8-4a22-8e1d-fa701694369f@huawei.com>
 <akzW7HrxNkj2DMas@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akzW7HrxNkj2DMas@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
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
	TAGGED_FROM(0.00)[bounces-15617-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,huawei.com:from_mime,huawei.com:dkim,huawei.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47B5F723CDF



On 7/7/2026 6:37 PM, Will Deacon wrote:
> On Tue, Jul 07, 2026 at 04:14:06PM +0800, Jinjie Ruan wrote:
>>
>>
>> On 7/7/2026 1:39 AM, Will Deacon wrote:
>>> Hi Jinjie,
>>>
>>> On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
>>>> On 6/24/2026 8:16 PM, Will Deacon wrote:
>>>>> Please just give me the time I asked for. If you want to help out in the
>>>>> meantime, there are plenty of patches that need reviewing...
>>>>
>>>> It was a mistake on my part, and I sincerely apologize for wasting
>>>> community review resources and disrupting your schedule.
>>>>
>>>> I will absolutely back off now and wait for your official series. Lesson
>>>> learned. Thanks for your patience and for calling me out on this.
>>>
>>> So I've mostly got the old series back on its feet:
>>>
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
>>
>> Hi Will,
>>
>> I tested the above-mentioned latest patch on v7.2-rc1 with error inject
>> on QEMU, which constructed the following errors:
>>
>> 1、CPU4 does not support 52-bit VA
>>
>> 2、CPU6 does not support 4K granule
>>
>> 3、CPU16 and CPU17 call cpu_die_early() early in check_early_cpu_features().
>>
>> 4、CPU18 call cpu_panic_kernel() early in check_early_cpu_features().
>>
>> The error output is not correct especially for CPU4, CPU6, and CPU18 as
>> below, it seems that some error messages are overlapping on the same
>> CPU, and some errors are causing the CPU to be misidentified.:
>>
>> (This leaves another blind spot where the 'failed to report alive state'
>> message is skipped for CPU16 and CPU17, as pointed out in
>> https://lore.kernel.org/all/bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com/):
>>
>> [    0.594323] CPU16: will not boot
>> [    0.605818] CPU17: will not boot
>>
>> ...
>>
>> [   11.052387] CPU4 failed to report alive state
>> [   11.059799] Parallel CPU bringup failed; consider passing
>> "cpuhp.parallel=off" for a more accurate diagnosis.
>> [   11.060179] CPU4 detected lack of support for 52-bit VAs
>> [   11.060426] CPU4 detected lack of support for 4K granules
>>
>> [   11.061103] Kernel panic - not syncing: CPU4 detected unsupported
>> configuration
>> [   11.061534] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
>> 7.2.0-rc1-00019-g52296829d92b #305 PREEMPT
>> [   11.062052] Hardware name: linux,dummy-virt (DT)
>> [   11.062230] Call trace:
>> [   11.062339]  show_stack+0x18/0x24 (C)
>> [   11.062528]  dump_stack_lvl+0x11c/0x168
>> [   11.062684]  dump_stack+0x18/0x24
>> [   11.062818]  vpanic+0x568/0x574
>> [   11.062947]  do_panic_on_target_cpu+0x0/0x1c
>> [   11.063111]  secondary_start_kernel+0x0/0x188
>> [   11.063276]  cpuhp_bringup_ap+0x244/0x254
>> [   11.063430]  cpuhp_invoke_callback+0x168/0x2ac
>> [   11.063594]  __cpuhp_invoke_callback_range+0x90/0x118
>> [   11.063776]  _cpu_up+0xec/0x1b8
>> [   11.063905]  cpu_up+0xcc/0x158
>> [   11.064032]  cpuhp_bringup_mask+0x9c/0xe0
>> [   11.064189]  bringup_nonboot_cpus+0x12c/0x14c
>> [   11.064352]  smp_init+0x30/0x8c
>> [   11.064481]  kernel_init_freeable+0x18c/0x40c
>> [   11.064645]  kernel_init+0x24/0x1dc
>> [   11.064785]  ret_from_fork+0x10/0x20
>> [   11.066612] SMP: stopping secondary CPUs
>> [   11.068198] ---[ end Kernel panic - not syncing: CPU4 detected
>> unsupported configuration ]---
> 
> I think this is actually working as intended. CPU4 has detected the
> problems and the system has panicked as expected. Systems like this are

Indeed, the system was already on the verge of collapse, and such
accurate CPU error information was not needed.

> horribly broken anyway, so if you _really_ need to identify the CPUs
> causing problems, you can disable parallel onlining on the cmdline (as
> the diagnostic message above suggests).

You are right! With cpuhp.parallel=0 we can obtain more accurate and
comprehensive startup error information as below, I agree with your
current approach to handling mistakes:

[   10.707438] CPU4 failed to report alive state
[   10.708939] CPU4 detected lack of support for 52-bit VAs
[   10.709194] CPUs may be stuck in kernel

...

[   21.013667] CPU6 failed to report alive state
[   21.014489] CPU6 detected lack of support for 4K granules

...

[   21.148989] CPU16: will not boot
[   31.426165] CPU16 failed to report alive state
[   31.432408] psci: CPU16 killed (polled 0 ms)
[   31.432618] CPU16: died during early boot

[   31.447677] CPU17: will not boot
[   41.722466] CPU17 failed to report alive state
[   41.722755] psci: CPU17 killed (polled 0 ms)
[   41.722895] CPU17: died during early boot

[   52.002883] CPU18 failed to report alive state
[   52.003366] Kernel panic - not syncing: CPU18 detected unsupported
configuration


> 
> Will


