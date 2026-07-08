Return-Path: <linux-mips+bounces-15635-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w2zDM+DGTmpoTwIAu9opvQ
	(envelope-from <linux-mips+bounces-15635-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 23:53:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404472AAB2
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 23:53:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LQXgoHnJ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15635-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15635-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F5F9313C4E6
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 21:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F393FBB5E;
	Wed,  8 Jul 2026 21:50:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06463F9A1E;
	Wed,  8 Jul 2026 21:50:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547406; cv=none; b=Kj3fWai445s1Y4tEA3LBqO8D1jow3pu23e22ZXiatR/sVdwtgRHCUsSwzT7CFCOBrdwebjwrvtdd2tLZ+gYcHOQ8ZE9JfaJoBGdC9fMliIS0l9Ssf3c9GQzI5mKc4ahqVpcjIrv9YBXQBI8Hal6nif9ekdnwTMTfc3gIlKQNwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547406; c=relaxed/simple;
	bh=+8HfgLZyui7wCYW/Esm1C88V5zrlYiIi+6nE0VLErnM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TlTd8oVHLKLU/jH5bP39NifbuZIucWhHnvizTrovnrv6TpdX1Auq/dylfK0DyeHCuiflVqObPVzx+Oen/bjwmJ7n09IZ+VLwOxobCNeyfinM+j+KyjKgdh2H1hYsDINW+uGIy65T0finQnH36zt7R/lDEKgKK+DxcF/EQbvfVnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQXgoHnJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6ADD1F000E9;
	Wed,  8 Jul 2026 21:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783547400;
	bh=vmuHxwYgqm1gQOMh7c/wvEC96VXO05kzD/lM2vW9atQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LQXgoHnJBN1jyue5u35c/dE+tvbdFa3zUViq7zqGblJh/ZruG6J0COcocKehdLFfd
	 4xXw/bCoVIbrdpJZ1yxvDgT9U95yzkk950wT9I897knLqsLOwWpBR6zC0Wl0OmKtGN
	 qA7xvyVuCxc36Uggfu07lBhQDGgG4EE5F0SW1Nvv4sJgy854Xef255mh0e3TvqBF2r
	 SBr4Ish5mjPGiV3ozZVjDpPopq53Klt37AdVF1ulSRh47ns0ya3XPMuPgRNdRIF3jm
	 1AeWmFDRhRZWLT6auHwI3KvNlkgzOBPY9SYSho4DzEN/jTu7kl2ls2cvpTtmqLBfh9
	 CtbtIsoeAAukg==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>, Andy
 Lutomirski <luto@kernel.org>, Richard Henderson
 <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Chris
 Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian
 Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, Dinh Nguyen
 <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andreas
 Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Michal
 =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 11/18] seccomp, treewide: Rename and convert
 __secure_computing() to return boolean
In-Reply-To: <ak51A77h1YRIl5tz@redhat.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.230735780@kernel.org>
 <2e6ed364-ce8f-4b4b-8675-acd07f140f4f@huawei.com> <871pddsuzl.ffs@fw13>
 <ak51A77h1YRIl5tz@redhat.com>
Date: Wed, 08 Jul 2026 23:49:57 +0200
Message-ID: <87pl0xqhh6.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15635-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[huawei.com,vger.kernel.org,infradead.org,arm.com,kernel.org,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.infradead.org,lists.linux-m68k.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,dabbelt.com,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:oleg@redhat.com,m:ruanjinjie@huawei.com,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mark.rutland@arm.com,m:kees@kernel.org,m:luto@kernel.org,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kern
 el.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,fw13:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4404472AAB2

On Wed, Jul 08 2026 at 18:04, Oleg Nesterov wrote:
> On 07/08, Thomas Gleixner wrote:
>>
>> On Wed, Jul 08 2026 at 09:43, Jinjie Ruan wrote:
>> >
>> > The return value of __seccomp_filter is checked in the wrong way, check
>> > -1 should be replaced with check false, maybe:
>> >
>> > -               if (__seccomp_filter(this_syscall, true))
>> > -                       return -1;
>> > +               if (!__seccomp_filter(this_syscall, true))
>> > +                       return false;
>
> Or simply
>
> 	return __seccomp_filter(this_syscall, true);
>
> and remove "return true" below ?

Duh. Obvious now that you point it out :)

> Either way, I personally like this change, I was always confused by these -1's.

Welcome to the club!

