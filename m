Return-Path: <linux-mips+bounces-15194-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L4JZAfqqO2pEbAgAu9opvQ
	(envelope-from <linux-mips+bounces-15194-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 12:01:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C86BD275
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 12:01:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=qlRqlki8;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15194-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15194-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1574A3027AA0
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2026 10:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F99C3B8105;
	Wed, 24 Jun 2026 10:00:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032973AFCFC;
	Wed, 24 Jun 2026 10:00:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295258; cv=none; b=qFBI/XMfyURM+pzJf8mSprqnEiqOS6/2cfQguuOOdweJnLcJ1RKra0tQCGzUAhM0ywwkJaownqvl8/kxpOdrhpI87QtomNK7zygfwmE6CB7sQOrrTx1rPOq/S4t8lTE+GMYr0bUFixj9ju0bX1QtjMTPItzNqe8uaB/HX+aUQbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295258; c=relaxed/simple;
	bh=dJJUXV6NeuW1qn0h1mROj4BDOaxxeX2+im4Q4TptAlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IET2TCKMJjqYhOdG+CcHsOaKeu/gNZgHMDJZay9DRdahghGGw/jMtyEiQCvQPucjReYEK8Ww49e33Ba/Md91S3SC1eKFTPbJrpa+qD+36eKqYOG0w8QB8c5bQQN7FP4Aemh9PtlNImJpjCZO7xSq3pZvl/EbS/38e3cM8Qnwe2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=qlRqlki8; arc=none smtp.client-ip=113.46.200.220
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1395hZTLdzjvGEUA5mY2MXbrSyHdvWfUix1ZT9yBBvU=;
	b=qlRqlki8Vete58SPLgzXr/AdeIESPRlfvmDp+qvgdcQ9hdmA0UUGgAXDOKcsXvSaxXgIiKOXt
	3DjyBcgH9e3sBFpLQEQzJHUd57n5Xz+/Cmhtv/VSkMbJOFp8Ulw3OyOt2bVX4hKemQQiKbc1Qfp
	7EHlN4/awC+2PYDruCMPWZw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4glcfW6d8Rz12LCg;
	Wed, 24 Jun 2026 17:52:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F21A540575;
	Wed, 24 Jun 2026 18:00:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 24 Jun 2026 18:00:48 +0800
Message-ID: <a0a531b7-6f1e-4055-ad0c-c1ebf3fadba3@huawei.com>
Date: Wed, 24 Jun 2026 18:00:47 +0800
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
 <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
 <ajqYaklhIyvaNLlk@willie-the-truck>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ajqYaklhIyvaNLlk@willie-the-truck>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,arm.com,alpha.franken.de,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-15194-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:mhklinux@outlook.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[ruanjinjie@huawei.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 492C86BD275



On 6/23/2026 10:30 PM, Will Deacon wrote:
> On Mon, Jun 22, 2026 at 04:06:38PM +0800, Jinjie Ruan wrote:
>> On 6/18/2026 8:21 PM, Will Deacon wrote:
>>> On Mon, Jun 15, 2026 at 04:51:48PM +0800, Jinjie Ruan wrote:
>>>> On 6/12/2026 11:45 PM, Michael Kelley wrote:
>>>>> From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
>>>>>>
>>>>>> Support for parallel secondary CPU bringup is already utilized by x86,
>>>>>> MIPS, and RISC-V. This patch brings this capability to the arm64
>>>>>> architecture.
>>>>>>
>>>>>> Rework the global `secondary_data` accessed during early boot into
>>>>>> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
>>>>>> enabling the early boot code in head.S to resolve each secondary CPU's
>>>>>> logical ID concurrently.
>>>>>>
>>>>>> To fully enable HOTPLUG_PARALLEL, this patch implements:
>>>>>> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
>>>>>> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
>>>>>>
>>>>>> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
>>>>>>
>>>>>> |     test kernel	   | secondary CPUs boot time |
>>>>>> |  ---------------------   |	--------------------  |
>>>>>> |   Without this patch     |		155.672	      |
>>>>>> |   cpuhp.parallel=0	   |		62.897	      |
>>>>>> |   cpuhp.parallel=1	   |		166.703	      |
>>>>>
>>>>> The last two rows seem mixed up. I would expect parallel=0 to
>>>>> result in a longer boot time.
>>>>
>>>> The results are correct and not mixed up.
>>>>
>>>> Compared to the original non‑HOTPLUG_PARALLEL approach, the advantage of
>>>> cpuhp.parallel=0 lies in its use of cpu_relax(`yield` on arm64) instead
>>>> of the wait_for_completion_timeout() mechanism (which may cause sleep
>>>> and context switching). This significantly reduces the overhead of VM
>>>> exits and context switches in a KVM guest, thereby cutting the secondary
>>>> CPU boot time by more than half.
>>>
>>> I don't think that's a particularly compelling reason to enable this for
>>> arm64, in all honesty. The yield instruction typically doesn't do
>>> anything on actual arm64 silicon, so this probably means that you're
>>> introducing busy-loops which tend to be bad for power and scalability.
>>
>> After updating the implementation in v2, the performance gains are
>> primarily observed on actual hardware.
> 
> ... but that's presumably because the secondary cores are busy-looping.
> That's not something we should do during boot. It might be "fast" on
> your machine but it will probably be "hot" as well.

Hi, Will,

I see your point regarding the 'hot boot' issue, which is indeed a valid
concern for power-constrained devices,

My optimization is tailored for servers and continuously powered single
boards, where boot-up speed is much more critical than temporary power
usage during the early boot phase.

Perhaps we could replace the "yield" instruction with "WFE / SEV"
instructions to coordinate the parallel boot of the primary and
secondary cores. This approach would allow the secondary cores to enter
a low-power standby state rather than busy-looping, effectively
preventing the thermal and power issues on battery-constrained machines.

> 
>>> I implemented this a while ago [1] but didn't manage to see much in terms
>>> of performance improvement and so I didn't bother to send the patches out
>>
>> As shown in v2 below, on actual hardware, this results in a 40%–60%
>> reduction in boot time.
>>
>> Bringup Time Comparison (ms, lower is better):
>>
>> |     Platform		| Baseline|   P=0   |   P=1  | Delta(%)|
>> | --------------------- | ------- | ------- | ------ | ------- |
>> | 64-core ATF QEMU	| 2075.8  | 2080.7  | 1653.4 | 20.34%  |
>> | 192-core server(HIP12)| 14619.2 | 14619.1 | 8589.4 | 41.21%  |
>> | 32-core board	        | 2776.5  | 2881.0  | 1045.0 | 62.36%  |
>>
>> Link:
>> https://lore.kernel.org/all/20260618092444.1316336-5-ruanjinjie@huawei.com/
> 
> To be honest, I'm pretty confused with all these numbers. Your first
> table above suggests that parallel boot is *slower* but then this table
> suggests the opposite. However, it also has a QEMU entry despite being
> "on actual hardware". Is that in a VM?

Sorry, there is a little confused. 192-core server(HIP12) and 32-core
board are tested on real hardware, which has 40%–60% reduction in boot time.

> 
>>> after talking about it at KVM forum [2]. However, as mentioned at the end
>>> of that talk, it _is_ still useful for confidential VMs using PSCI so
>>> let me dust off my old series and send it out to see what you think.
>>>
>>> It relies on PSCI v0.2, which means we don't need the NR_CPUS size array
>>> for secondary_data and I also have some support for error handling (it
>>> doesn't look like you handle __early_cpu_boot_status properly).
>>
>> I need some time to look closely at your patch. Alternatively, I will
>> integrate your changes, re-test everything on actual hardware, and then
>> send out a revised version.
> 
> Please just give me a week or so to rebase my changes and send them out
> for discussion. It'll be interesting to see what numbers you get.

Sounds good! Take your time, and I'm looking forward to your series.

In the meantime, I have just sent out v3 of this patch. While working
closely with your previous code, I identified a few bugs (including the
multi-CPU status trampling issue we discussed) and addressed them in
this new version.I wanted to share v3 with you now so you can easily
review the fixes and potentially integrate them when you rebase your
changes next week. It also includes the updated performance numbers on
my setup for your reference.

Link:
https://lore.kernel.org/all/20260624092537.2916971-1-ruanjinjie@huawei.com/

Looking forward to the discussion!

Best regards,
Jinjie

> 
>> It seems that the following patch removing
>> `rcutree_report_cpu_starting()` will reintroduce the original issue as
>> commit ce3d31ad3cac ("arm64/smp: Move
>> rcu_cpu_starting() earlier") soloved.
>>
>> Link:
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=bba4b62f45f2614bf6085e6cd3f233528f85bf26
>>
>> Indeed, I also noticed that the invocation order of
>> rcutree_report_cpu_starting() on arm64 is somewhat suboptimal. It
>> hinders the implementation of parallel bringup on arm64 and could
>> potentially lead to RCU stalls.
>>
>> Link:
>> https://lore.kernel.org/all/20260618092444.1316336-4-ruanjinjie@huawei.com/
>>
>> [    0.329017] smp: Bringing up secondary CPUs ...
>> [    0.343628] Detected VIPT I-cache on CPU1
>> [    0.343788]
>> [    0.343806] =============================
>> [    0.343816] WARNING: suspicious RCU usage
>> [    0.343966] 7.1.0-rc1-g27c1871848a2 #109 Not tainted
>> [    0.344087] -----------------------------
>> [    0.344098] kernel/locking/lockdep.c:3801 RCU-list traversed in
>> non-reader section!!
> 
> Thanks, I'll look into this.
> 
> Will
> 


