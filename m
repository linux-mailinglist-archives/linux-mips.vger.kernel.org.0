Return-Path: <linux-mips+bounces-15578-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gUNmEzPYTGr7qgEAu9opvQ
	(envelope-from <linux-mips+bounces-15578-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 12:42:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C771A8C5
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 12:42:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=b2EbRhZx;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15578-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15578-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2757E30166F8
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 10:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01043ECBEB;
	Tue,  7 Jul 2026 10:37:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D39D3D904D;
	Tue,  7 Jul 2026 10:37:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420665; cv=none; b=tLqse3Ffm4Cx03Y8GQqCdiYCUOV06DLMeqhbI2pdaTixSFGD6AyTUYvBDrlkEpIOkv79pUi6J7DSk0zlP3i6rTGoEhg6QkwclLhMkO80PMkqvY5wideOiTLHls1FPmTYpn0FNN7Ora7HUgJUZUGPJ7XyPyqnsGb9YKqDYvcC+qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420665; c=relaxed/simple;
	bh=DBW3+xmIkiA7bcVmsoLX7N9y5YIfu5fHR2J5CTKVG24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBcn3zhSTGHzjIAms9hNLbYzLxxmKs660dieFTD17o6PI1eaIcGQoIoZyzlzJa5m/Our4J9Gd79veBvzvKeq2Up3dgmC+MKpEGtzuNJWYjeMiKW1kQa5ll0TQLY+khIeyDkqCIVcQFmFe+Q4uM/kQ2SBuDJYYAIC3m6xBEMWQT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2EbRhZx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1225A1F000E9;
	Tue,  7 Jul 2026 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783420664;
	bh=M5O3kKa+EQ5uAjyG128pW8I8XY6LFNYAh7h21UFVGtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2EbRhZxTe2YotdF+J+gGbv+GMMbo+NMUuhwVDb4IEx+n1ieO+I0Nll2mMyqZbLFm
	 yc5Kk5R1tBJuIsojhCKa/XTU1+H9veSADqcMUOdMce0HV3qOoUdVLULeUldzF6xuKd
	 m92XRaz26xwKNhdQx+X+39ZkNcNCwVTgk1X/P4MkfXwMQZMMqeqF461M5iDfl6gIOk
	 JgQQAfeYGq4Aeajc+6VeVuoyZUg0KqBLCI4fDS+UHeWZXH7eONhSspu9IF2Ru24bgU
	 htXPRN9xcD4L0lR2wfLKiZZnk816LwEUcLQFaKUgDTDCC27G4h9dgzRd75upT+zD6Q
	 0fK5uN7UZ9QUA==
Date: Tue, 7 Jul 2026 11:37:32 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <akzW7HrxNkj2DMas@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
 <3bf910b8-c7e8-4a22-8e1d-fa701694369f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bf910b8-c7e8-4a22-8e1d-fa701694369f@huawei.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:sshegde@linux.ibm.com,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.c
 om,m:tim.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15578-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[will@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,alpha.franken.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.ibm.com,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B82C771A8C5

On Tue, Jul 07, 2026 at 04:14:06PM +0800, Jinjie Ruan wrote:
> 
> 
> On 7/7/2026 1:39 AM, Will Deacon wrote:
> > Hi Jinjie,
> > 
> > On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
> >> On 6/24/2026 8:16 PM, Will Deacon wrote:
> >>> Please just give me the time I asked for. If you want to help out in the
> >>> meantime, there are plenty of patches that need reviewing...
> >>
> >> It was a mistake on my part, and I sincerely apologize for wasting
> >> community review resources and disrupting your schedule.
> >>
> >> I will absolutely back off now and wait for your official series. Lesson
> >> learned. Thanks for your patience and for calling me out on this.
> > 
> > So I've mostly got the old series back on its feet:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
> 
> Hi Will,
> 
> I tested the above-mentioned latest patch on v7.2-rc1 with error inject
> on QEMU, which constructed the following errors:
> 
> 1、CPU4 does not support 52-bit VA
> 
> 2、CPU6 does not support 4K granule
> 
> 3、CPU16 and CPU17 call cpu_die_early() early in check_early_cpu_features().
> 
> 4、CPU18 call cpu_panic_kernel() early in check_early_cpu_features().
> 
> The error output is not correct especially for CPU4, CPU6, and CPU18 as
> below, it seems that some error messages are overlapping on the same
> CPU, and some errors are causing the CPU to be misidentified.:
> 
> (This leaves another blind spot where the 'failed to report alive state'
> message is skipped for CPU16 and CPU17, as pointed out in
> https://lore.kernel.org/all/bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com/):
> 
> [    0.594323] CPU16: will not boot
> [    0.605818] CPU17: will not boot
> 
> ...
> 
> [   11.052387] CPU4 failed to report alive state
> [   11.059799] Parallel CPU bringup failed; consider passing
> "cpuhp.parallel=off" for a more accurate diagnosis.
> [   11.060179] CPU4 detected lack of support for 52-bit VAs
> [   11.060426] CPU4 detected lack of support for 4K granules
> 
> [   11.061103] Kernel panic - not syncing: CPU4 detected unsupported
> configuration
> [   11.061534] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 7.2.0-rc1-00019-g52296829d92b #305 PREEMPT
> [   11.062052] Hardware name: linux,dummy-virt (DT)
> [   11.062230] Call trace:
> [   11.062339]  show_stack+0x18/0x24 (C)
> [   11.062528]  dump_stack_lvl+0x11c/0x168
> [   11.062684]  dump_stack+0x18/0x24
> [   11.062818]  vpanic+0x568/0x574
> [   11.062947]  do_panic_on_target_cpu+0x0/0x1c
> [   11.063111]  secondary_start_kernel+0x0/0x188
> [   11.063276]  cpuhp_bringup_ap+0x244/0x254
> [   11.063430]  cpuhp_invoke_callback+0x168/0x2ac
> [   11.063594]  __cpuhp_invoke_callback_range+0x90/0x118
> [   11.063776]  _cpu_up+0xec/0x1b8
> [   11.063905]  cpu_up+0xcc/0x158
> [   11.064032]  cpuhp_bringup_mask+0x9c/0xe0
> [   11.064189]  bringup_nonboot_cpus+0x12c/0x14c
> [   11.064352]  smp_init+0x30/0x8c
> [   11.064481]  kernel_init_freeable+0x18c/0x40c
> [   11.064645]  kernel_init+0x24/0x1dc
> [   11.064785]  ret_from_fork+0x10/0x20
> [   11.066612] SMP: stopping secondary CPUs
> [   11.068198] ---[ end Kernel panic - not syncing: CPU4 detected
> unsupported configuration ]---

I think this is actually working as intended. CPU4 has detected the
problems and the system has panicked as expected. Systems like this are
horribly broken anyway, so if you _really_ need to identify the CPUs
causing problems, you can disable parallel onlining on the cmdline (as
the diagnostic message above suggests).

Will

