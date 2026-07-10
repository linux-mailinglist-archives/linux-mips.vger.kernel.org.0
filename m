Return-Path: <linux-mips+bounces-15746-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZXNeBlftUGpl8gIAu9opvQ
	(envelope-from <linux-mips+bounces-15746-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 15:02:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167873B035
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 15:02:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="N/y7Bwyk";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15746-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15746-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD45230356D7
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 12:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404114279E4;
	Fri, 10 Jul 2026 12:54:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA194426D3F
	for <linux-mips@vger.kernel.org>; Fri, 10 Jul 2026 12:54:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688070; cv=none; b=JaIIx2h56Qen8vON4BDdaKhL4Y6nTxqa/AY795oqVNqTDXScezTrWb3v6lXP/MvhQ3qQSSi2sXVsZVjrMM360O5spKP3S+CdC/PvUxV00FZjT0nKv4sPIBTlDLeUfANawW+mXyATxOWdpJPanQxL3hAe2OJOrNi1gLNgtYdsrwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688070; c=relaxed/simple;
	bh=sxv6a13OPgrK6TOsUQ/kBJYeYtA4hSsjpL/QVUw8MJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd8cK9tyfj9uMcoNiP6L1U+lbK8M5FfsS+RepXFGcfP0E7Ph4cVjNd+E39gF1YZMnmy6YM2NvkNkIR9D2u0ZtAbA+2H7OfN0wzydvGSQsNYCMS+RumhlvaS/9bucKYpQlZwb7m+YDLFAt2hMlP4gdUp0DuYYEJQal1WJ1zWqTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N/y7Bwyk; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783688067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTxMckJ71iKdcnC625lbZ9WJQgTp+gyXuVTaxsSZYeA=;
	b=N/y7BwykZYq1G+GFKH8L5ofuNBuDQoBUYObf2JoEgUM4UrF8zXUbHwNwLZbSTjyQySzDCy
	XSI/bZlYFTugtM26DUf4R+5T8+EkGjvYOjUU4lko/MyqWmYff7AontBg0ToB0zD0tIzeMg
	/ax+fV3Myt4SCwt6Q7Nal5d98b0rbCE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-duefXCb_NOaqJcpTJsNlCw-1; Fri,
 10 Jul 2026 08:53:17 -0400
X-MC-Unique: duefXCb_NOaqJcpTJsNlCw-1
X-Mimecast-MFC-AGG-ID: duefXCb_NOaqJcpTJsNlCw_1783687991
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AAE061801379;
	Fri, 10 Jul 2026 12:53:07 +0000 (UTC)
Received: from fedora (unknown [10.44.49.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 8AEF2180029C;
	Fri, 10 Jul 2026 12:52:47 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri, 10 Jul 2026 14:53:07 +0200 (CEST)
Date: Fri, 10 Jul 2026 14:52:40 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Cc: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Andy Lutomirski <luto@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Weinberger <richard@nod.at>,
	Chris Zankel <chris@zankel.net>,
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type bool
Message-ID: <alDrGBMdTuoLcVyy@redhat.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org>
 <ak5ySpil83TNWxeq@kunlun.suse.cz>
 <87se5tqkyp.ffs@fw13>
 <alDQ7isUKJFl8Va4@kunlun.suse.cz>
 <alDaOw8t-e3rxIPm@redhat.com>
 <alDmTcgzMlKiio9H@kunlun.suse.cz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alDmTcgzMlKiio9H@kunlun.suse.cz>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15746-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,lwn.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:msuchanek@suse.de,m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@ker
 nel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[oleg@redhat.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleg@redhat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0167873B035

On 07/10, Michal Suchánek wrote:
>
> On Fri, Jul 10, 2026 at 01:40:43PM +0200, Oleg Nesterov wrote:
> >
> > I can only say that ptrace users do want to skip the syscall and set the
> > return value on entry.
> >
> > See
> > 	[PATCH v5 1/2] ptrace: add PTRACE_SET_SYSCALL_INFO syscall skipping support
> > 	https://lore.kernel.org/all/20260709100949.94345-2-renzo@cs.unibo.it/
> >
> > The changelog explains that currently this doesn't work because
> > among the arches which define HAVE_ARCH_TRACEHOOK (at least) arch/mips is
> > broken in this regard.
>
> Or it could be documented that setting the return value has to be done
> in the exit trace, and that would than work on any architecture AFAICT.

Well, ptrace users know the problem. And this what they have to do
currently.

> With ppc and s390 using the same register for the syscall number and
> syscall return value it's very much impossible to poke the return value
> on entry into a register using the generic register access function. As
> of now there is no place to store the value ot of the return value
> outside of the registers, either.

I know nothing about ppc and s390. Can't comment right now.

> And the current PTRACE_SET_SYSCALL_INFO indeed sets the syscall nr and
> arguments on entry and the syscall return value on exit, that
> disctincion is implemented.
>
> Not sure how the patchset you point out is relevant, it only adds
> changes in the exit case.

No. It allows to skip-and-set-retval on PTRACE_EVENT_SECCOMP.

But ENTRY -> EXIT transition is not yet allowed due to the problems
above.

Oleg.


