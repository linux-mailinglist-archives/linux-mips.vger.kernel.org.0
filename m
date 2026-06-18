Return-Path: <linux-mips+bounces-15140-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cmahIWrjM2q/HgYAu9opvQ
	(envelope-from <linux-mips+bounces-15140-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 14:24:10 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BE69FFF9
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 14:24:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Abiv2iO4;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15140-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15140-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E0C4301AF78
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 12:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D3D3F44F0;
	Thu, 18 Jun 2026 12:21:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4273F482F;
	Thu, 18 Jun 2026 12:21:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785280; cv=none; b=oGVqyHub10/I1bt2vSC30OpioHLM016lb8ErSZelRXhFX95Jy9VsCIMp7qz2/V43H1E9MGnBwaZdKbbmG5AxPGT3rKZgdiiu6lJMfPUKLyRgSjVsxmb7I7UGSHIyWu99tmk3lCet26clZN+gfTTKcIlk1ZHpwizbRakI1WOk2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785280; c=relaxed/simple;
	bh=zp90YTIJ6vbWST2ul07R2+yqZIM3o0z6Cl92XVCQI9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMyDXSkQQ6P3k2qZkqr0ET6L+RuGN+Os8nk2AH0RCurC6bUNVEB51tKxkLYFAuhoVlRtCbppxUIYBX8s6k/jjO0sMBaI9eowIGCuPMydsgHBvAlKhp7Iuw3o4GkDCKGMt9MUA71/Rg+UBcApluR7kJz7HlUQ53+aJioC87rttoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Abiv2iO4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014171F000E9;
	Thu, 18 Jun 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781785278;
	bh=Jxvhe6p1siX027yhrT2z3XtNk0V+WNmEv1s3Z1RR4ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Abiv2iO4RiW//8pR9dLhCcfHcyT0i58RzDg5KzLOl4m1sOVrs9DawRFk1ryHLcLTZ
	 GPY4ji0YfFluVDNoGFEQXe/s9wWAINc1y53L2TgIChzRQy+tck3KRiTB4YXjBtxuF/
	 dKOzf0YDV7JDGJYBomYM/m/3eJJw0ECQPGWyOA2dny3d1EqMKYJ5bv0qL/FdTFInjo
	 UwObl+tH/TA8ZI2XIv81QMpK+UGTHEWY2yqpQg+12mo83OKk5o3NZmROcMePyhmjO+
	 piAkoCTIX25wwfovDDqzcGs4sdtJWDhEf0M8suoHHDosU2AvUXb3uErsuxUgwmrIPT
	 xJGfjxrHWZ73A==
Date: Thu, 18 Jun 2026 13:21:08 +0100
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
Message-ID: <ajPitENEHWa8lDfC@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15140-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:email,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D69BE69FFF9

Hi Jinjie,

On Mon, Jun 15, 2026 at 04:51:48PM +0800, Jinjie Ruan wrote:
> On 6/12/2026 11:45 PM, Michael Kelley wrote:
> > From: Jinjie Ruan <ruanjinjie@huawei.com> Sent: Thursday, June 11, 2026 6:38 AM
> >>
> >> Support for parallel secondary CPU bringup is already utilized by x86,
> >> MIPS, and RISC-V. This patch brings this capability to the arm64
> >> architecture.
> >>
> >> Rework the global `secondary_data` accessed during early boot into
> >> a per-CPU array. This array maps logical CPU IDs to MPIDR_EL1 values,
> >> enabling the early boot code in head.S to resolve each secondary CPU's
> >> logical ID concurrently.
> >>
> >> To fully enable HOTPLUG_PARALLEL, this patch implements:
> >> 1) An arm64-specific arch_cpuhp_kick_ap_alive() handler.
> >> 2) Callbacks to cpuhp_ap_sync_alive() inside secondary_start_kernel().
> >>
> >> Successfully tested on QEMU ARM64 virt machine (KVM on, 128 vCPUs).
> >>
> >> |     test kernel	   | secondary CPUs boot time |
> >> |  ---------------------   |	--------------------  |
> >> |   Without this patch     |		155.672	      |
> >> |   cpuhp.parallel=0	   |		62.897	      |
> >> |   cpuhp.parallel=1	   |		166.703	      |
> > 
> > The last two rows seem mixed up. I would expect parallel=0 to
> > result in a longer boot time.
> 
> Hi, Michael,
> 
> The results are correct and not mixed up.
> 
> Compared to the original non‑HOTPLUG_PARALLEL approach, the advantage of
> cpuhp.parallel=0 lies in its use of cpu_relax(`yield` on arm64) instead
> of the wait_for_completion_timeout() mechanism (which may cause sleep
> and context switching). This significantly reduces the overhead of VM
> exits and context switches in a KVM guest, thereby cutting the secondary
> CPU boot time by more than half.

I don't think that's a particularly compelling reason to enable this for
arm64, in all honesty. The yield instruction typically doesn't do
anything on actual arm64 silicon, so this probably means that you're
introducing busy-loops which tend to be bad for power and scalability.

I implemented this a while ago [1] but didn't manage to see much in terms
of performance improvement and so I didn't bother to send the patches out
after talking about it at KVM forum [2]. However, as mentioned at the end
of that talk, it _is_ still useful for confidential VMs using PSCI so
let me dust off my old series and send it out to see what you think.

It relies on PSCI v0.2, which means we don't need the NR_CPUS size array
for secondary_data and I also have some support for error handling (it
doesn't look like you handle __early_cpu_boot_status properly).

It looks like I could include your first patch, though!

Will

[1] https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
[2] https://www.youtube.com/watch?v=Q6kOshnnQuE

