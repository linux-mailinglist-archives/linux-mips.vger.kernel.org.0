Return-Path: <linux-mips+bounces-15162-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mJxQJ2MBOWovlQcAu9opvQ
	(envelope-from <linux-mips+bounces-15162-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 11:33:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC536AE445
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 11:33:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=iDpQu2YA;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15162-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15162-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D179306383E
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2026 09:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9644B387375;
	Mon, 22 Jun 2026 09:16:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BE738F654;
	Mon, 22 Jun 2026 09:16:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119804; cv=none; b=Q0mgSF25RUNzP8q80kXpRKtCVNL8wZotTX6FHrRWcnMcWFXp+fjOOoe2jH1tqBrr/GryCFniUTe8mkimza2pZjs5TvGOj6x8L4kJVoiC4Ntzb044mjTFOFp5edY5019Amp4dkNiFgc5OJ8521HhgHjkdy3KhSLx+PmXbTV8qdmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119804; c=relaxed/simple;
	bh=W0hF4GGJkYtUenCH5S7QVN6oKn0Md5E318ZtUbgsJao=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jby0hB6eABoCT2Qot/oFSohSpBwCx98QG9JWuI8lpjoUwHIevEqT2Y91quF/HZHgxVdifRuW40gvVnWDFTPp8a5RgjDnKtq91FZfyi+9/27ILq5GP21v6Z9btG/25Rdcmgi/K806R374mFaFn+y9Im/KiJE/CB9MDWtywW9y35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=iDpQu2YA; arc=none smtp.client-ip=113.46.200.223
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gz16ZH9DYGPBkD+pXEoFxanVGNLD5CokSPREwvD3FzM=;
	b=iDpQu2YAQjuV/tnUvSFc/IfA/QHC+chs6j95gLPcVQDfxvY/K61tKJpDenU9U7gsY/W785auK
	9ejn1uywZpaNZ7Vj+jKp5Dm6tlLP0o/tzv2/8bC1jUjx+iZd7VRGgxpVFtAPXBYiMcWzdJ9+MZB
	kEGLm0Rldmi+TYDWir3I0uo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gkMm12tWrzmVD1;
	Mon, 22 Jun 2026 17:07:29 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id AA77E40539;
	Mon, 22 Jun 2026 17:16:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 22 Jun 2026 17:16:31 +0800
Message-ID: <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
Date: Mon, 22 Jun 2026 17:16:30 +0800
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
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[outlook.com,arm.com,alpha.franken.de,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15162-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:mhklinux@outlook.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBC536AE445



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
> 
> I implemented this a while ago [1] but didn't manage to see much in terms
> of performance improvement and so I didn't bother to send the patches out
> after talking about it at KVM forum [2]. However, as mentioned at the end
> of that talk, it _is_ still useful for confidential VMs using PSCI so
> let me dust off my old series and send it out to see what you think.

Hi Will,

Thanks for the insights! Your point about using PSCI v0.2's Context ID
to avoid the NR_CPUS array for input parameters (like
secondary_data.task) is incredibly elegant.

However, if I understand your series correctly, it seems your approach
primarily targets preventing the concurrent use of secondary_data.task,
but it doesn't seem to account for the potential data trampling on
secondary_data.status when multiple secondary CPUs are brought up
simultaneously.

update_cpu_boot_status()
  -> WRITE_ONCE(secondary_data.status.flags[val], 1)

arch_cpuhp_cleanup_kick_cpu()
  -> status = READ_ONCE(secondary_data.status)

Best regards,
Jinjie

> 
> It relies on PSCI v0.2, which means we don't need the NR_CPUS size array
> for secondary_data and I also have some support for error handling (it
> doesn't look like you handle __early_cpu_boot_status properly).
> 
> It looks like I could include your first patch, though!
> 
> Will
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
> [2] https://www.youtube.com/watch?v=Q6kOshnnQuE
> 


