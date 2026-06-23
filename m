Return-Path: <linux-mips+bounces-15172-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z6BuHLaYOmqIBAgAu9opvQ
	(envelope-from <linux-mips+bounces-15172-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 16:31:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37F6B7E88
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 16:31:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ie1vNp+H;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15172-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15172-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E78B30314C7
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 14:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBAA38CFE7;
	Tue, 23 Jun 2026 14:30:14 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4507274B2A;
	Tue, 23 Jun 2026 14:30:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225014; cv=none; b=TZ/6SDukDx822ZhaXxAJOBjI8dk9Wpy/4dTyQn1dEmzheNqHFQPfLf1JD/fJnxtw8MDZuPeB/xFOx5Ru+Vwu5jOY1ByZLlmy6L5atGYpkCYM2LKUZhi+Jd9zrUr8jlhgnp7OevGwKdYdRT5J9vMgBou4PPY6z+3mk/HXYQx70jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225014; c=relaxed/simple;
	bh=an/ST/rGVpmf7GcymBcOALgnL54NpRKSu/EJ3wlNqf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgbJJvExYLoIU7w/6qkM8vpv9QISjb2WEb81NhtuxBaJCTzxl6ri6i0Y2he4uX9oEzzhCc3aDzd7WSg/CemmWOdh9J94KXD4i524F16m+FP0xYwNXv8PplGrDt+iM9YMIe3HR50Nz48cWH0+M5Hmo9KhpgVZ4gxmLZ0pzoxuKhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ie1vNp+H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6021F000E9;
	Tue, 23 Jun 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225012;
	bh=+WOKyD1Rs8KI4TFU2iAMfZNF7RUu66RNK0cgJJH7Hh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ie1vNp+HwT4kChz++sdxq3g9aY9z+Vm5DYWZa1lrf7bHVA1ni3VAwJGjckFhfV3cK
	 SnDfkLgnEQfEDWOPg8fTQS3WuOuUetSNXmz0r4+XEfufckpIvXCkg8JoJUNWNfgqnd
	 xXJ6yMKEKHd8T8z+zE4O3ciang7EPjUYvI5Nq5qi92heRfkADAstoZ25ijGE1RSH9/
	 TeGX0D82UaggvFA5Jx46D/amaoftWsouz2M1WnttJo8sfMG4yaqCPPELBkee/HygGn
	 SDMNTfo2N1kNbNJW8U4VFj/xpiUlNFUbnsqsFTJBr7azteQJCRMLrtiGWCZZRWZNiC
	 cgg1fhb5XS7LQ==
Date: Tue, 23 Jun 2026 15:30:02 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"yeoreum.yun@arm.com" <yeoreum.yun@arm.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>,
	"mrigendra.chaubey@gmail.com" <mrigendra.chaubey@gmail.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <ajqYaklhIyvaNLlk@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
 <ajPitENEHWa8lDfC@willie-the-truck>
 <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a34ff43-78a0-4d99-885a-0e7f560634ca@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15172-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:mhklinux@outlook.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[will@kernel.org,linux-mips@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[outlook.com,arm.com,alpha.franken.de,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,linaro.org,google.com,gmail.com,arndb.de,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[willie-the-truck:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,huawei.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E37F6B7E88

On Mon, Jun 22, 2026 at 04:06:38PM +0800, Jinjie Ruan wrote:
> On 6/18/2026 8:21 PM, Will Deacon wrote:
> > On Mon, Jun 15, 2026 at 04:51:48PM +0800, Jinjie Ruan wrote:
> >> On 6/12/2026 11:45 PM, Michael Kelley wrote:
> >>> From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
> >>>>
> >>>> Support for parallel secondary CPU bringup is already utilized by x86,
> >>>> MIPS, and RISC-V. This patch brings this capability to the arm64
> >>>> architecture.
> >>>>
> >>>> Rework the global `secondary_data` accessed during early boot into
> >>>> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
> >>>> enabling the early boot code in head.S to resolve each secondary CPU's
> >>>> logical ID concurrently.
> >>>>
> >>>> To fully enable HOTPLUG_PARALLEL, this patch implements:
> >>>> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
> >>>> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
> >>>>
> >>>> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
> >>>>
> >>>> |     test kernel	   | secondary CPUs boot time |
> >>>> |  ---------------------   |	--------------------  |
> >>>> |   Without this patch     |		155.672	      |
> >>>> |   cpuhp.parallel=0	   |		62.897	      |
> >>>> |   cpuhp.parallel=1	   |		166.703	      |
> >>>
> >>> The last two rows seem mixed up. I would expect parallel=0 to
> >>> result in a longer boot time.
> >>
> >> The results are correct and not mixed up.
> >>
> >> Compared to the original non‑HOTPLUG_PARALLEL approach, the advantage of
> >> cpuhp.parallel=0 lies in its use of cpu_relax(`yield` on arm64) instead
> >> of the wait_for_completion_timeout() mechanism (which may cause sleep
> >> and context switching). This significantly reduces the overhead of VM
> >> exits and context switches in a KVM guest, thereby cutting the secondary
> >> CPU boot time by more than half.
> > 
> > I don't think that's a particularly compelling reason to enable this for
> > arm64, in all honesty. The yield instruction typically doesn't do
> > anything on actual arm64 silicon, so this probably means that you're
> > introducing busy-loops which tend to be bad for power and scalability.
> 
> After updating the implementation in v2, the performance gains are
> primarily observed on actual hardware.

... but that's presumably because the secondary cores are busy-looping.
That's not something we should do during boot. It might be "fast" on
your machine but it will probably be "hot" as well.

> > I implemented this a while ago [1] but didn't manage to see much in terms
> > of performance improvement and so I didn't bother to send the patches out
> 
> As shown in v2 below, on actual hardware, this results in a 40%–60%
> reduction in boot time.
> 
> Bringup Time Comparison (ms, lower is better):
> 
> |     Platform		| Baseline|   P=0   |   P=1  | Delta(%)|
> | --------------------- | ------- | ------- | ------ | ------- |
> | 64-core ATF QEMU	| 2075.8  | 2080.7  | 1653.4 | 20.34%  |
> | 192-core server(HIP12)| 14619.2 | 14619.1 | 8589.4 | 41.21%  |
> | 32-core board	        | 2776.5  | 2881.0  | 1045.0 | 62.36%  |
> 
> Link:
> https://lore.kernel.org/all/20260618092444.1316336-5-ruanjinjie@huawei.com/

To be honest, I'm pretty confused with all these numbers. Your first
table above suggests that parallel boot is *slower* but then this table
suggests the opposite. However, it also has a QEMU entry despite being
"on actual hardware". Is that in a VM?

> > after talking about it at KVM forum [2]. However, as mentioned at the end
> > of that talk, it _is_ still useful for confidential VMs using PSCI so
> > let me dust off my old series and send it out to see what you think.
> > 
> > It relies on PSCI v0.2, which means we don't need the NR_CPUS size array
> > for secondary_data and I also have some support for error handling (it
> > doesn't look like you handle __early_cpu_boot_status properly).
> 
> I need some time to look closely at your patch. Alternatively, I will
> integrate your changes, re-test everything on actual hardware, and then
> send out a revised version.

Please just give me a week or so to rebase my changes and send them out
for discussion. It'll be interesting to see what numbers you get.

> It seems that the following patch removing
> `rcutree_report_cpu_starting()` will reintroduce the original issue as
> commit ce3d31ad3cac ("arm64/smp: Move
> rcu_cpu_starting() earlier") soloved.
> 
> Link:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=bba4b62f45f2614bf6085e6cd3f233528f85bf26
> 
> Indeed, I also noticed that the invocation order of
> rcutree_report_cpu_starting() on arm64 is somewhat suboptimal. It
> hinders the implementation of parallel bringup on arm64 and could
> potentially lead to RCU stalls.
> 
> Link:
> https://lore.kernel.org/all/20260618092444.1316336-4-ruanjinjie@huawei.com/
> 
> [    0.329017] smp: Bringing up secondary CPUs ...
> [    0.343628] Detected VIPT I-cache on CPU1
> [    0.343788]
> [    0.343806] =============================
> [    0.343816] WARNING: suspicious RCU usage
> [    0.343966] 7.1.0-rc1-g27c1871848a2 #109 Not tainted
> [    0.344087] -----------------------------
> [    0.344098] kernel/locking/lockdep.c:3801 RCU-list traversed in
> non-reader section!!

Thanks, I'll look into this.

Will

