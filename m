Return-Path: <linux-mips+bounces-15576-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GayWHMnWTGqQqgEAu9opvQ
	(envelope-from <linux-mips+bounces-15576-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 12:36:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB4071A76C
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 12:36:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AYQQX6xq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15576-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15576-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7B513130FE1
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 10:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382223EB0FC;
	Tue,  7 Jul 2026 10:27:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB13E172C;
	Tue,  7 Jul 2026 10:27:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420042; cv=none; b=LBOHbzgqhK4Z2xEz/qbOXZoS0aHp7Svouahf1SPs7DuhFrqRyguo5xQlelmJY7Yn8cMw+XVxBbZIE8L68Ekekb4fcI1vcdeNDihR1mZwjid0cgkM8Wwof+lokepW20Vg7Cehu/YgmiBENPQJ8Ayf71oGmYA1jvxxHTSbah1MweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420042; c=relaxed/simple;
	bh=hwkciJaYcxIzG6ZEHEs/RLFQvJeCJtd3tjyqXwMhryQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hob786wek74vrZbBWMzyQ9qVI/dfKNW2gRwwbggbrf1ZHgC9++TvvVd8cm/rpXIQYJQLzbfcc+XveDLdFf0FyVokgMKqgQ5zTOy2iFfLNfSfpT/bB8lBaJPb3DebC0ZlWdq0T5D+GUfDxx34BnqgKP+KASKTLOc+hdKfisd3O8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYQQX6xq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D840A1F000E9;
	Tue,  7 Jul 2026 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783420039;
	bh=HCUXZj1UudD81J+tzs1iNoS5NARfatylA2v+XY7w0pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYQQX6xqoBaQvhhm8WxPal1Czc3Nsm4qzpqq/veoFkttYnv5OubhCsCtzvx423TO2
	 OQH5I8dpRYNxo9+D1JwUr2qRQYFgz8TStY2wEQGfOZO11H9EqiN++b4RLIAOVNbZ1/
	 m8nD2iN7DDdB05+HW4wYHIzROTXwent0P+GN7QcChPsD32M4gUsN1E+pd3e3Hy+xPD
	 LgqLKveiNXmQ5n4QJgelDe2B6/sGChVFieuwNQ0LWAV434leNc1326gHSSV4JhBquk
	 ClDEAHmHs0GF5jx5XboyDmKuP9Ekbboe18xcXYhdgGlg1TueweSgdIDp5xFwTZFlQV
	 QeDxw/JZa7j/A==
Date: Tue, 7 Jul 2026 11:27:07 +0100
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
Subject: Re: [PATCH v3 05/12] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <akzUe3aIKZiEr4at@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <20260624092537.2916971-6-ruanjinjie@huawei.com>
 <akvoVCNFwDorQg6y@willie-the-truck>
 <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58a9fd8b-387c-41c6-91a2-48ec885870d5@huawei.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-15576-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,willie-the-truck:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAB4071A76C

Jinjie,

On Tue, Jul 07, 2026 at 11:02:32AM +0800, Jinjie Ruan wrote:
> On 7/7/2026 1:39 AM, Will Deacon wrote:
> > ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting() earlier") was to
> > handle the useless print in cpuinfo_detect_icache_policy(), but I've
> > decided just to remove that one. So I think the remaining prints we have
> > to worry about in this early boot code are from error paths in the
> > CPU feature detection logic (check_local_cpu_capabilities()).
> > 
> > Given that those error paths should all be fatal, perhaps we could
> > rework cpu_die_early() and cpu_panic_kernel() as macros that take a
> > string argument and either call printk_deferred() (similarly to what you
> > suggested in a previous version of your series [1]) or do the
> > lockdep_off() there before a pr_crit().
> > 
> > What do you think?
> 
> That is an excellent point. Reworking cpu_die_early() and
> cpu_panic_kernel() to uniformly use printk_deferred() based on the
> specific error type or the string argument is a much cleaner approach.
> 
> This makes perfect sense because these paths are inherently fatal, and
> switching to deferred printing avoids the risky lock-taking and RCU
> runtime constraints during early boot entirely. It cleanly resolves the
> diagnostic noise without broadly blinding lockdep or hiding potential
> locking issues down the line.
> 
> I fully agree with this approach.

It's great that your AI chatbot thinks this is fantastic, but what do
_you_ think? I'm much more interested in your opinion, as you have
already spent time thinking about this.

Will

