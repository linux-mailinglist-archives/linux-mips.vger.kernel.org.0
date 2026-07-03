Return-Path: <linux-mips+bounces-15443-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x2BcKruJR2oQagAAu9opvQ
	(envelope-from <linux-mips+bounces-15443-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 12:06:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443C700F97
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 12:06:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=S7QhjRah;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15443-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15443-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 381223057BD4
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 10:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24783B71BE;
	Fri,  3 Jul 2026 10:00:43 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E283B42FD;
	Fri,  3 Jul 2026 10:00:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072843; cv=none; b=bKP+8zVj1yagIV4kvXfaNTKIbJjKPARP3farIonrAqaSpKtGtJZ+cwYcFkvv2LMNUxeEBrf65nF5MzZjb6Rx1s3f8HaJIPdT1dmNkUDXM/H8SMdCgneYTyCpihEhZK+RXSKfOJh2oaXfVbStNp3dOPEbUaTnTgEcEEOtaF+uKXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072843; c=relaxed/simple;
	bh=aCTCeigzdW+DLmQcURYHBbc2LLCBHkNsbpfYvvGCiJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efMDrQXixFxldfqCojEelEg5MyDVmGw1Nhc8dVv5sHwPWG1QrR8Cm+5ypqc6s+HnDRXNoRd3t8LrqjUCQgUxBfosdniGPav7S+PlBadNck4c9w12+GoZAqvXCUpEEgpCnCongndFTTUcmnmajR7rXK4rXmWqO/kZvP3ckO+BcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S7QhjRah; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77B231FC4;
	Fri,  3 Jul 2026 03:00:23 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A98773FAA1;
	Fri,  3 Jul 2026 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783072827; bh=aCTCeigzdW+DLmQcURYHBbc2LLCBHkNsbpfYvvGCiJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7QhjRah1ACbDsWq1fyjeQXt+EKdqlo9vLYGLe10grZ3du51t6ZFb4OLnHfKmugvC
	 xYIGBaOHJhM7/+St8RX1L1+kEfNfOXq3codPouX1rlw+gMBwRumJ3t0IzbR4AAn6ks
	 AEhSYO6Tc+ug7ijrNB2evf01wmU75WbW8DbnvJvM=
Date: Fri, 3 Jul 2026 11:00:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
	Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com,
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, tsbogend@alpha.franken.de,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	luto@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, chris@zankel.net,
	jcmvbkbc@gmail.com, peterz@infradead.org, wad@chromium.org,
	thuth@redhat.com, ada.coupriediaz@arm.com, kevin.brodsky@arm.com,
	linusw@kernel.org, yeoreum.yun@arm.com, song@kernel.org,
	james.morse@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
	liqiang01@kylinos.cn, pengcan@kylinos.cn, ryan.roberts@arm.com,
	yangtiezhu@loongson.cn, sshegde@linux.ibm.com,
	mchauras@linux.ibm.com, austin.kim@lge.com, jchrist@linux.ibm.com,
	arnd@arndb.de, thomas.weissschuh@linutronix.de,
	sohil.mehta@intel.com, andrew.cooper3@citrix.com, jgross@suse.com,
	kas@kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to
 return boolean
Message-ID: <akeIK5TRCjlKbzbp@J2N7QTR9R3>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com>
 <akdp6GAu77-ipsXA@kunlun.suse.cz>
 <87cxx4mmim.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cxx4mmim.ffs@fw13>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,huawei.com,redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zytor.com,zankel.net,infradead.org,chromium.org,kylinos.cn,loongson.cn,lge.com,arndb.de,linutronix.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-15443-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mark.rutland@arm.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:msuchanek@suse.de,m:ruanjinjie@huawei.com,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:chris@zankel.net,m:jcmvbkbc@gm
 ail.com,m:peterz@infradead.org,m:wad@chromium.org,m:thuth@redhat.com,m:ada.coupriediaz@arm.com,m:kevin.brodsky@arm.com,m:linusw@kernel.org,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@li
 sts.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:from_mime,arm.com:dkim,vger.kernel.org:from_smtp,J2N7QTR9R3:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3443C700F97

On Fri, Jul 03, 2026 at 11:48:49AM +0200, Thomas Gleixner wrote:
> On Fri, Jul 03 2026 at 09:51, Michal Suchánek wrote:
> > On Mon, Jun 29, 2026 at 09:05:59PM +0800, Jinjie Ruan wrote:
> >> -	if (secure_computing())
> >> +	if (!secure_computing())
> >>  		return -1;
> >
> > Hello,
> >
> > I am not fond of this logic inversion. The boolean is meaningless in
> > itself.
> >
> > Previously -1 was used to indicate that the syscall was filtered but you
> > chose to invert the logic choosing true to mean syscall was not filtered.
> >
> > You could choose true to mean that syscall was fitered avoiding this
> > inversion.
> 
> That's just wrong. Boolean logic makes more sense with having
> (!condition()). Just because the old 0/-1 nonsense had it the other way
> round does not mean it has to stay that way.

100% agreed!

Bikeshedding below; sorry.

I think the bigger problem is just that secure_computing() is a terrible
name that does not express the intended semantic -- it's not clear
whether "secure computing" means "seccomp permit the syscall" or
"seccomp is enabled and some special rules now apply" or something else
entirely.

If we're changing the return type, it might be worth renaming the
function something like:

	seccomp_permits_syscall()

... so for the code quoted at the start of the mail, we'd have:

	if (!seccomp_permits_syscall())
		return -1;

... or for arm64, where we have NO_SYSCALL:

	 if (!seccomp_permits_syscall())
	 	return NO_SYSCALL.

Thomas, any thoughts on that?

It's also odd that seccomp aquires the syscall number itself via , rather
than than being passed down explicitly by the arch code. That completely
obscures what seccomp is doing, vs having:

	if (!seccomp_permis_syscall(syscall))
		...

... but I guess that saves some duplication in the ptrace code.

Mark.

