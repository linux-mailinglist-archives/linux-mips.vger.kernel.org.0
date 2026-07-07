Return-Path: <linux-mips+bounces-15571-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cKsgOGy2TGo8ogEAu9opvQ
	(envelope-from <linux-mips+bounces-15571-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 10:18:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CFE718FF2
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 10:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=IzNCTzrr;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15571-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15571-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1ACB5305A4A3
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 08:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EF82EA154;
	Tue,  7 Jul 2026 08:14:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A030100E;
	Tue,  7 Jul 2026 08:14:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412059; cv=none; b=j+xMuaxboobZsClxaEs6Y3iNKLyTbx/ivDSByVOb8F1WYzlhMySbidtATzJw/H3Q1U4ogJ9+vQIo5LdOX6CdEL5VjM2vdYkjyyyOxkKZB5/OCfFO1fKVZfbM80Trg4WLU06GSrTEoxz+OuncONGB+9Ad/kAm/YoYE7bbMI1PAvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412059; c=relaxed/simple;
	bh=vEm6rkxrMcjupt2WUoJ7vGYydxNzQTOwrk0yGLPhdAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eZbUz9DpGLZMc8O2KBZ+WG1/ORnJOn3Z1Rq2gsCAcoDQ46+/6IWOmW1zL2AXCD5KsYpL4MtOzqgtPB05XUKBlLq35iDWhECh63kg8L5zXfVeT4JkPS3oGhQm34Dpr+z1/yT6NCoNe96HJXi0psQB3ZKvx2Ubwnd2JmzJL2x8Iv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=IzNCTzrr; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MNiAUryehkfQt6EHtDjlZ3Arn5sC2Et5x7DQMPHkElY=;
	b=IzNCTzrrKdBLrX7rMyWwqfn0aluESgDkkbgVAl9USu/Eiplc+ZDOa923SydtGIy8c6mVPkoRB
	TR/KlQvD+ta7qIvWJL0ifOV7Ag45Tunv2OaksgUIkkxKUyFZ5b1PHSJUfpZcDX6V7qUNfD0duF5
	AXERuZ3T8JbJ74BCXSuNbtU=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gvYfv453xz1prq7;
	Tue,  7 Jul 2026 16:04:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E57C040579;
	Tue,  7 Jul 2026 16:14:10 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 16:14:07 +0800
Message-ID: <3bf910b8-c7e8-4a22-8e1d-fa701694369f@huawei.com>
Date: Tue, 7 Jul 2026 16:14:06 +0800
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
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akvoN5vvQaW3MdmI@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15571-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,huawei.com:from_mime,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74CFE718FF2



On 7/7/2026 1:39 AM, Will Deacon wrote:
> Hi Jinjie,
> 
> On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
>> On 6/24/2026 8:16 PM, Will Deacon wrote:
>>> Please just give me the time I asked for. If you want to help out in the
>>> meantime, there are plenty of patches that need reviewing...
>>
>> It was a mistake on my part, and I sincerely apologize for wasting
>> community review resources and disrupting your schedule.
>>
>> I will absolutely back off now and wait for your official series. Lesson
>> learned. Thanks for your patience and for calling me out on this.
> 
> So I've mostly got the old series back on its feet:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

Hi Will,

I tested the above-mentioned latest patch on v7.2-rc1 with error inject
on QEMU, which constructed the following errors:

1、CPU4 does not support 52-bit VA

2、CPU6 does not support 4K granule

3、CPU16 and CPU17 call cpu_die_early() early in check_early_cpu_features().

4、CPU18 call cpu_panic_kernel() early in check_early_cpu_features().

The error output is not correct especially for CPU4, CPU6, and CPU18 as
below, it seems that some error messages are overlapping on the same
CPU, and some errors are causing the CPU to be misidentified.:

(This leaves another blind spot where the 'failed to report alive state'
message is skipped for CPU16 and CPU17, as pointed out in
https://lore.kernel.org/all/bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com/):

[    0.594323] CPU16: will not boot
[    0.605818] CPU17: will not boot

...

[   11.052387] CPU4 failed to report alive state
[   11.059799] Parallel CPU bringup failed; consider passing
"cpuhp.parallel=off" for a more accurate diagnosis.
[   11.060179] CPU4 detected lack of support for 52-bit VAs
[   11.060426] CPU4 detected lack of support for 4K granules

[   11.061103] Kernel panic - not syncing: CPU4 detected unsupported
configuration
[   11.061534] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
7.2.0-rc1-00019-g52296829d92b #305 PREEMPT
[   11.062052] Hardware name: linux,dummy-virt (DT)
[   11.062230] Call trace:
[   11.062339]  show_stack+0x18/0x24 (C)
[   11.062528]  dump_stack_lvl+0x11c/0x168
[   11.062684]  dump_stack+0x18/0x24
[   11.062818]  vpanic+0x568/0x574
[   11.062947]  do_panic_on_target_cpu+0x0/0x1c
[   11.063111]  secondary_start_kernel+0x0/0x188
[   11.063276]  cpuhp_bringup_ap+0x244/0x254
[   11.063430]  cpuhp_invoke_callback+0x168/0x2ac
[   11.063594]  __cpuhp_invoke_callback_range+0x90/0x118
[   11.063776]  _cpu_up+0xec/0x1b8
[   11.063905]  cpu_up+0xcc/0x158
[   11.064032]  cpuhp_bringup_mask+0x9c/0xe0
[   11.064189]  bringup_nonboot_cpus+0x12c/0x14c
[   11.064352]  smp_init+0x30/0x8c
[   11.064481]  kernel_init_freeable+0x18c/0x40c
[   11.064645]  kernel_init+0x24/0x1dc
[   11.064785]  ret_from_fork+0x10/0x20
[   11.066612] SMP: stopping secondary CPUs
[   11.068198] ---[ end Kernel panic - not syncing: CPU4 detected
unsupported configuration ]---

The expected output is as below:

        CPU4 failed to report alive state
        CPU4: is stuck in kernel
        CPU4: does not support 52-bit VAs

        CPU6 failed to report alive state
        CPU6: is stuck in kernel
        CPU6: does not support 4K granule

        GICv3: CPU8: found redistributor 8 region 0:0x00000000081a0000
        GICv3: CPU8: using allocated LPI pending table @0x0000000100360000
        CPU8: Booted secondary processor 0x0000000008 [0x410fd034]
        ...
        CPU16 failed to report alive state
        psci: CPU16 killed (polled 0 ms)
        CPU16: died during early boot

        CPU17: will not boot
        CPU17 failed to report alive state
        psci: CPU17 killed (polled 0 ms)
        CPU17: died during early boot

        CPU18 failed to report alive state
        Kernel panic - not syncing: CPU18 detected unsupported configuration

Best regards,
Jinjie

> 
> but there are still two issues left to resolve:
> 
>   1. The printing that can happen before RCU has started. Although I've
>      reduced this somewhat, there are still error paths in e.g.
>      verify_local_cpu_capabilities() that print a message before dying.
> 
>   2. check_local_cpu_capabilities() can mutate the system capability
>      state via update_cpu_capabilities(), so it's really dodgy running
>      that prior to synchronisation.
> 
> Since you've added patches in this series that try to tackle these
> problems, I'll reply on those two so we can figure out how we would like
> to proceed.
> 
> Cheers,
> 
> Will


