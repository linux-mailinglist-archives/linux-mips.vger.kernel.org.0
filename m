Return-Path: <linux-mips+bounces-15160-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x2yfKd/uOGoNkQcAu9opvQ
	(envelope-from <linux-mips+bounces-15160-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 10:14:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE66D6AD99A
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 10:14:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=JVcKeZfR;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15160-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15160-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7400F304CEAC
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 08:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CA438E8D3;
	Mon, 22 Jun 2026 08:06:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EF03546C0;
	Mon, 22 Jun 2026 08:06:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115613; cv=none; b=t4lOYJKC4D09usZTkfLzrNBHCdBBMDqIt4jXp6s7Vp0FcjUAUYbV1XRqMgwnbrdUAz4s0xNIybLOcXsg0xqBeta2JHnWMV/VYrCjllldsyNQNCcKAm1EJCA9ZnLKl+LeOTddh6WGOnHOK8qR0k/nNbW31/ZYnYCpySUZ1vOtxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115613; c=relaxed/simple;
	bh=pQ0VT/icavP+ROo+jQ9zfnCb1GPi9K70g8eI5q2SOmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bpBdJngGUs0OV7DV+QD0N5OQycwGaYFhom4sAyCkifmaH+M2A41wjakVuvgSuQhsL86xefHoJghA1ruD2yrLH7Ac3QxvmtaChiFs/Py8WOcFt19Jmo3OE6GrD2WFDRNUd4PVvznA5gvvVl46w0Z2v6PpT/B2FU7TYZbN3ovir8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=JVcKeZfR; arc=none smtp.client-ip=113.46.200.221
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7l3MIp31Oqn6l35ANG2oeSNGQ5mPwFEIt+3BHRhEgFs=;
	b=JVcKeZfRvP8T8eSthBTDPagvkz4L0tUeCdqiAVGv4Eh3T3SVTQXrwmvOHMtG0cUUpo0xQ5/O4
	aR6aIwZIftD9mfmnCd56hixc1MZIztHFios6RgBUF+IkCieMOqGm+NmJXzvSoKNNHpGsbDuVE/n
	scbJtcuZ3SQZ7BdsHKOvpH4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gkLCQ6hV0zRhVP;
	Mon, 22 Jun 2026 15:57:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AB1BA40363;
	Mon, 22 Jun 2026 16:06:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 16:06:39 +0800
Message-ID: <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
Date: Mon, 22 Jun 2026 16:06:38 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for secondary
 CPUs
To: Will Deacon <will@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "kees@kernel.org" <kees@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>, "linusw@kernel.org"
	<linusw@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"david.kaplan@amd.com" <david.kaplan@amd.com>, "lukas.bulwahn@redhat.com"
	<lukas.bulwahn@redhat.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"maz@kernel.org" <maz@kernel.org>, "timothy.hayes@arm.com"
	<timothy.hayes@arm.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>, "oupton@kernel.org"
	<oupton@kernel.org>, "yeoreum.yun@arm.com" <yeoreum.yun@arm.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>, "tabba@google.com"
	<tabba@google.com>, "mrigendra.chaubey@gmail.com"
	<mrigendra.chaubey@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
 <ajPitENEHWa8lDfC@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ajPitENEHWa8lDfC@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15160-lists,linux-mips=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:mhklinux@outlook.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[outlook.com,arm.com,alpha.franken.de,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE66D6AD99A



On 6/18/2026 8:21 PM, Will Deacon wrote:
> Hi Jinjie,
> 
> On Mon, Jun 15, 2026 at 04:51:48PM +0800, Jinjie Ruan wrote:
>> On 6/12/2026 11:45 PM, Michael Kelley wrote:
>>> From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
>>>>
>>>> Support for parallel secondary CPU bringup is already utilized by x86,
>>>> MIPS, and RISC-V. This patch brings this capability to the arm64
>>>> architecture.
>>>>
>>>> Rework the global `secondary_data` accessed during early boot into
>>>> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
>>>> enabling the early boot code in head.S to resolve each secondary CPU's
>>>> logical ID concurrently.
>>>>
>>>> To fully enable HOTPLUG_PARALLEL, this patch implements:
>>>> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
>>>> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
>>>>
>>>> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
>>>>
>>>> |     test kernel	   | secondary CPUs boot time |
>>>> |  ---------------------   |	--------------------  |
>>>> |   Without this patch     |		155.672	      |
>>>> |   cpuhp.parallel=0	   |		62.897	      |
>>>> |   cpuhp.parallel=1	   |		166.703	      |
>>>
>>> The last two rows seem mixed up. I would expect parallel=0 to
>>> result in a longer boot time.
>>
>> Hi, Michael,
>>
>> The results are correct and not mixed up.
>>
>> Compared to the original non‑HOTPLUG_PARALLEL approach, the advantage of
>> cpuhp.parallel=0 lies in its use of cpu_relax(`yield` on arm64) instead
>> of the wait_for_completion_timeout() mechanism (which may cause sleep
>> and context switching). This significantly reduces the overhead of VM
>> exits and context switches in a KVM guest, thereby cutting the secondary
>> CPU boot time by more than half.
> 
> I don't think that's a particularly compelling reason to enable this for
> arm64, in all honesty. The yield instruction typically doesn't do
> anything on actual arm64 silicon, so this probably means that you're
> introducing busy-loops which tend to be bad for power and scalability.

After updating the implementation in v2, the performance gains are
primarily observed on actual hardware.

> 
> I implemented this a while ago [1] but didn't manage to see much in terms
> of performance improvement and so I didn't bother to send the patches out

As shown in v2 below, on actual hardware, this results in a 40%–60%
reduction in boot time.

Bringup Time Comparison (ms, lower is better):

|     Platform		| Baseline|   P=0   |   P=1  | Delta(%)|
| --------------------- | ------- | ------- | ------ | ------- |
| 64-core ATF QEMU	| 2075.8  | 2080.7  | 1653.4 | 20.34%  |
| 192-core server(HIP12)| 14619.2 | 14619.1 | 8589.4 | 41.21%  |
| 32-core board	        | 2776.5  | 2881.0  | 1045.0 | 62.36%  |

Link:
https://lore.kernel.org/all/20260618092444.1316336-5-ruanjinjie@huawei.com/

> after talking about it at KVM forum [2]. However, as mentioned at the end
> of that talk, it _is_ still useful for confidential VMs using PSCI so
> let me dust off my old series and send it out to see what you think.
> 
> It relies on PSCI v0.2, which means we don't need the NR_CPUS size array
> for secondary_data and I also have some support for error handling (it
> doesn't look like you handle __early_cpu_boot_status properly).

I need some time to look closely at your patch. Alternatively, I will
integrate your changes, re-test everything on actual hardware, and then
send out a revised version.

> 
> It looks like I could include your first patch, though!

Thank you very much.

> 
> Will
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

It seems that the following patch removing
`rcutree_report_cpu_starting()` will reintroduce the original issue as
commit ce3d31ad3cac ("arm64/smp: Move
rcu_cpu_starting() earlier") soloved.

Link:
https://web.git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=bba4b62f45f2614bf6085e6cd3f233528f85bf26

Indeed, I also noticed that the invocation order of
rcutree_report_cpu_starting() on arm64 is somewhat suboptimal. It
hinders the implementation of parallel bringup on arm64 and could
potentially lead to RCU stalls.

Link:
https://lore.kernel.org/all/20260618092444.1316336-4-ruanjinjie@huawei.com/

[    0.329017] smp: Bringing up secondary CPUs ...
[    0.343628] Detected VIPT I-cache on CPU1
[    0.343788]
[    0.343806] =============================
[    0.343816] WARNING: suspicious RCU usage
[    0.343966] 7.1.0-rc1-g27c1871848a2 #109 Not tainted
[    0.344087] -----------------------------
[    0.344098] kernel/locking/lockdep.c:3801 RCU-list traversed in
non-reader section!!
[    0.344112]
[    0.344112] other info that might help us debug this:
[    0.344112]
[    0.344135]
[    0.344135] RCU used illegally from offline CPU!
[    0.344135] rcu_scheduler_active = 1, debug_locks = 1
[    0.344174] no locks held by swapper/1/0.
[    0.344204]
[    0.344204] stack backtrace:
[    0.344611] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted
7.1.0-rc1-g27c1871848a2 #109 PREEMPT
[    0.344707] Hardware name: linux,dummy-virt (DT)
[    0.345267] Call trace:
[    0.345436]  show_stack+0x18/0x24 (C)
[    0.345593]  dump_stack_lvl+0x90/0xd0
[    0.345620]  dump_stack+0x18/0x24
[    0.345639]  lockdep_rcu_suspicious+0x170/0x234
[    0.345665]  __lock_acquire+0xdd4/0x2078
[    0.345688]  lock_acquire+0x1c4/0x3f0
[    0.345711]  _raw_spin_lock_irqsave+0x60/0x88
[    0.345736]  down_trylock+0x18/0x48
[    0.345758]  __down_trylock_console_sem+0x38/0xc4
[    0.345782]  vprintk_emit+0x23c/0x3d0
[    0.345802]  vprintk_default+0x38/0x44
[    0.345822]  vprintk+0x28/0x34
[    0.345841]  _printk+0x5c/0x84
[    0.345864]  cpuinfo_store_cpu+0x174/0x298
[    0.345884]  secondary_start_kernel+0xbc/0x150
[    0.345905]  __secondary_switched+0xc0/0xc4
[    0.350307] GICv3: CPU1: found redistributor 1 region
0:0x00000000080c0000
[    0.350523] GICv3: CPU1: using allocated LPI pending table
@0x00000001042f0000
[    0.351303] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[    0.387425] Detected VIPT I-cache on CPU2


> [2] https://www.youtube.com/watch?v=Q6kOshnnQuE
> 


