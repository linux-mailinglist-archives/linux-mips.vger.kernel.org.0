Return-Path: <linux-mips+bounces-15173-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z96DMJCZOmoYBQgAu9opvQ
	(envelope-from <linux-mips+bounces-15173-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 16:34:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFE6B7F1D
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 16:34:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Rh2lkpja;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15173-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15173-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8A7B3073961
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jun 2026 14:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7BD38655C;
	Tue, 23 Jun 2026 14:33:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2DF35AC33;
	Tue, 23 Jun 2026 14:33:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225201; cv=none; b=jINxcJlMkqL2VpVLpd0r0UTZvLJhEsnkvfdkil8XXjLvLLuPAr77SzFCyHCn0b+693nthSYwrp+V9D2OUG9z+C3yc4yJmI1dtgpjqphsE6eYUPSQDw8IjDXvQiV8wd+P6orioGMB6shITyT38z9giSPS2J9nk84BIFUJb4nhFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225201; c=relaxed/simple;
	bh=Zn4m3kuUcLrL/xXBX49xFll89eVmUVousq1z828fFhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S27tplsl4s7hhNkivFa7xTFjisu0X0HhqlorI6Op8/LFjzkSilmfPFp+NoHaIBoA5yEd6Cq9VXoS3oz0XtBFVUfMQeO2GAKUasR17GoFOjqUxYDdm5sgBhjDItQLM/WMwbwmPQDHfb1hK57kFso4uwLNo3KXUFQ3sMDm0dyJpNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rh2lkpja; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A16A1F000E9;
	Tue, 23 Jun 2026 14:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225200;
	bh=UZpCUInDhnBDublTX9djjKn8UqqE1Mq1Xlz/SmoClrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rh2lkpja7usItkPkL21c8D3oJ/sJj+BeFrnINZg5ZXo0XMUiBESVoC+NJFfXTbGmw
	 AlnyN0+/A3OUoh3Gu+FZC8xXzD82M78lnXhvuOg9K59PmLI28Y1f2H5RDHcUBaHILM
	 9U85m9rQNzb4T6oym6ZfRoJrXLD/5pl9F2NrhPym4KLK5CEqLCIPi8kdypSuYfEQYg
	 tBpL8EaOn00V0r66V62qxNtLYpopmL7XMZay7CpFB//6dDan+H/ry4r2Q5pRiVGML6
	 qPsyx5/D8JKoez9yuuxDzpkh7TPifKGVum5HmBDVUWthTVp4vYhfu/Vi189GVcTKmh
	 kPWqXifwjASWw==
Date: Tue, 23 Jun 2026 15:33:09 +0100
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
Message-ID: <ajqZJVBCu_D-BkTy@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
 <ajPitENEHWa8lDfC@willie-the-truck>
 <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b828dd7a-0363-46cf-aad0-e4962e299338@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15173-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:mhklinux@outlook.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:tabba@google.com,m:mrigendra.chaubey@gmail.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[will@kernel.org,linux-mips@vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BEFE6B7F1D

On Mon, Jun 22, 2026 at 05:16:30PM +0800, Jinjie Ruan wrote:
> 
> 
> On 6/18/2026 8:21 PM, Will Deacon wrote:
> > Hi Jinjie,
> > 
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
> >> Hi, Michael,
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
> > 
> > I implemented this a while ago [1] but didn't manage to see much in terms
> > of performance improvement and so I didn't bother to send the patches out
> > after talking about it at KVM forum [2]. However, as mentioned at the end
> > of that talk, it _is_ still useful for confidential VMs using PSCI so
> > let me dust off my old series and send it out to see what you think.
> 
> Hi Will,
> 
> Thanks for the insights! Your point about using PSCI v0.2's Context ID
> to avoid the NR_CPUS array for input parameters (like
> secondary_data.task) is incredibly elegant.
> 
> However, if I understand your series correctly, it seems your approach
> primarily targets preventing the concurrent use of secondary_data.task,
> but it doesn't seem to account for the potential data trampling on
> secondary_data.status when multiple secondary CPUs are brought up
> simultaneously.
> 
> update_cpu_boot_status()
>   -> WRITE_ONCE(secondary_data.status.flags[val], 1)
> 
> arch_cpuhp_cleanup_kick_cpu()
>   -> status = READ_ONCE(secondary_data.status)

I need to dust it back off but IIRC I made that thing a byte array, with
a separate byte for each failure reason.

Will

