Return-Path: <linux-mips+bounces-15577-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zdw3AZnaTGrPqwEAu9opvQ
	(envelope-from <linux-mips+bounces-15577-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 12:53:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA8071AA92
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 12:53:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CZ4uHiVi;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15577-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15577-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80B0630091D9
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 10:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55C03ED138;
	Tue,  7 Jul 2026 10:30:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D22F3E559B;
	Tue,  7 Jul 2026 10:30:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420257; cv=none; b=o/0pqkdu8gRQOk1q6ya0ZkXc1Q1wIIoS8zu6B+JVETrTYFFxc5DEzTVHBBQ0i7+NXfN19ELD3jUTR/hrb8jbn8qxq+VCfi2j8tP37eiQLhXoqPWmysqhCBeTqqGf6JwfiH6Iblu2wqbUlhZYvLzTdAcHN1m7GldiZ0qI48uU6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420257; c=relaxed/simple;
	bh=KT/bp9GyDiEMwHQdlZkXyzyzQKZxlu6viQaq8oww4k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPkScAgQ5NIfSnNEgIyUIQgjmHtPAbe8EnPTfuUN/bAWnj9Ey4XPFt9WJLHOz50f82GE3IXHWFWdOkxgXwokASjxshyxpdCOifxPVRs3PEtJ3iU3LuVSagXbxBvwjlcOWQ9wl+5niU8QEA6+0CZqmd4AUApml6kCGrRu0dKjDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZ4uHiVi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2031F000E9;
	Tue,  7 Jul 2026 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783420256;
	bh=1/cTRdo+GJL5Yh+CZpV8uwi7exk4QvIR8V1Wfs6Ld7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZ4uHiVi/JIurn8joz1Hau1rp0Gu8K5SAekAw+AVegx0wrBuSzIiAQsdNCIrgwuYB
	 kXUoBb/kfzXzMBHruIC8xrVTLeyDxLGxA0b3yy7M5D7bmwRMp0eSpLztTANkMsJ3IE
	 rO4nlVc8vyiDDOWDrN/0CKBLmqCNrW2+2CQMYf/djbJ+gEt70DqkYjxDgVNdOtKLe+
	 z1Pdiorrs5b/Pqb3HINaBCCEwCsqQH6aKxgn7eTMtkDCAlDsQgV6W+igSg8iie1Jn3
	 KauQEtxtWLawEg2Em7sodFcHMi3ySICCAQagzhI1/CpDmTzLmABqJofChbTxLNm1s7
	 4ShAljprq81ug==
Date: Tue, 7 Jul 2026 11:30:45 +0100
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
Subject: Re: [PATCH v3 12/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <akzVVSWMOomcw1pG@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-13-ruanjinjie@huawei.com>
 <bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bddf7a68-7789-4ec2-819c-aaaee8173c70@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-15577-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BA8071AA92

On Tue, Jul 07, 2026 at 12:00:12PM +0800, Jinjie Ruan wrote:
> 
> 
> On 6/24/2026 5:25 PM, Jinjie Ruan wrote:
> > Support for parallel secondary CPU bringup is already utilized by x86,
> > MIPS and RISC-V. This patch brings this capability to the arm64
> > architecture.
> > 
> > To fully enable HOTPLUG_PARALLEL, this patch implements an arm64-specific
> > arch_cpuhp_init_parallel_bringup() handler.
> > 
> > In parallel bringup, early `set_cpu_present(cpu, 0)` inside
> > cpu_die_early() removes the secondary CPU prematurely, causing the primary
> > CPU's second-stage cpuhp_bringup_mask() sweep to skip it and drop
> > failure logs.
> 
> 
> Hi, Will,
> 
> In parallel bringup, cpu_die_early() calls set_cpu_present(cpu, 0),
> which removes the failing secondary CPU from the mask. This causes the
> primary CPU's cpuhp_bringup_mask() sweep to skip it and drop any failure
> log.
> 
> Have you seen this before, and what do you think about the fix?

Yes, I tried to fix this here:

https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=7e1e4144a54a80e05017e56e0e28e759bd790daa

by moving the manipulation of the present mask to
arch_cpuhp_cleanup_kick_cpu(). I'd just like to nail down the RCU and
cpufeature issues before posting that lot.

Will

