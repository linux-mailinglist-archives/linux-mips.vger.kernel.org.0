Return-Path: <linux-mips+bounces-15792-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zqDpDJioUmoJSAMAu9opvQ
	(envelope-from <linux-mips+bounces-15792-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 22:33:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C51E3742CCF
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 22:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=f6nPQIDW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15792-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15792-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E217F3019B87
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2026 20:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FCC30FC03;
	Sat, 11 Jul 2026 20:33:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3350149DF1;
	Sat, 11 Jul 2026 20:33:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802001; cv=none; b=Db52uknWG2094spMaZXVnHhgF2oO1dCSetBFfbn3s2mAIQ/ieM7qy2cWtPa1aKtwbcY4dFw430klibh1rWyCyxDjqazEB5kMAvovQ0+SL6QPx+8OFEuxzHAjTTs7/xzpujQbKdvqoeCdBmVz620+l7QWv9bba+VTrwGP40MYPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802001; c=relaxed/simple;
	bh=f4WDAwb3qO/KWOBB6gOahvRfdXJNvVppVvPoOxm1wS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U9n5tUzh7GoVpiXFIhC73OMVE8Zqe1psdv7lWrbzqvFN6VMej4+QqZzYlxNNsx4KfFN3+ng3AlDIUDBQxXKJowN1nj2vrYceOvaETmoHzIAcHI75Z+yP568ncg2r7cHdM4FPoiNDuJLVCorMlwn01eN3DXXam6wsZ6isjru4Xxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6nPQIDW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74601F000E9;
	Sat, 11 Jul 2026 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783801999;
	bh=vf0x/sVLTVCL/PCgyuZ8JagPvunPhYIkJoaxGkdlgsg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=f6nPQIDWb921zxEmTCJayCTDOfYZdi0+7zYrhf0upuiSWI9j5AZ2jA4rhsOs29HYT
	 WC65M3P5E0Ndczi1cDcuiv7hGhsQJHbzIeCfUAQhsb3BAmdz9sIRmrV3HJM1BFxfHh
	 Aux4CNd9IAvECdD+RCjW44j4iuQp1Him2INHy0sHP/oX42qlbB/BPDPlYwuwpyf330
	 fm02VsUCvmZUjjgJlLWziVrF+imgTjTEQzqm6tpMlL+GLiRFtJSumKDpDKIPCbMwb6
	 NV1PwwP0Vo7BFl96u+JrYXmWPko75piPEvZ0MdoWxo/dPZ46b1HjcordjvvVp5/9ci
	 U6Hw/ms11EcEw==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Shrikanth
 Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo
 Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger
 <richard@nod.at>, Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type bool
In-Reply-To: <alDQ7isUKJFl8Va4@kunlun.suse.cz>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org> <ak5ySpil83TNWxeq@kunlun.suse.cz>
 <87se5tqkyp.ffs@fw13> <alDQ7isUKJFl8Va4@kunlun.suse.cz>
Date: Sat, 11 Jul 2026 22:33:16 +0200
Message-ID: <87a4rxqnar.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15792-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:msuchanek@suse.de,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@ker
 nel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,lwn.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fw13:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C51E3742CCF

Michal!

On Fri, Jul 10 2026 at 13:01, Michal Such=C3=A1nek wrote:
> On Wed, Jul 08, 2026 at 10:34:38PM +0200, Thomas Gleixner wrote:
>> does not make #2 magically go away. It's still the same problem whether
>> you like it or not.
>
> However, reading the syscall number from pt_regs only after
> syscall_enter_from_user_mode exits does.

That does not solve anything at all.

TBH, your communication style is annoying as hell. You fail to provide
any useful arguments and explanations despite me giving you a proper
analysis. And I'm absolutely tired of this.

So let me try again for _ONE_ last time to explain you why your ppc/s390
world view is broken and let's look at the current code (irrelevant
portions omitted).

static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsig=
ned long work)
{
	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
#1		if (syscall_user_dispatch(regs))
			return -1L;
	}
=20=20=20=20=20=20=20=20
	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
#2		ret =3D arch_ptrace_report_syscall_entry(regs);
		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
			return -1L;
	}

	/* Do seccomp after ptrace, to catch any tracer changes. */
	if (work & SYSCALL_WORK_SECCOMP) {
#3		ret =3D __secure_computing();
		if (ret =3D=3D -1L)
			return ret;
	}

	/* Either of the above might have changed the syscall number */
#4	syscall =3D syscall_get_nr(current, regs);

	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
#5		syscall =3D trace_syscall_enter(regs, syscall);

        return syscall;
}

#1) The user dispatch mechanism does not modify the syscall return
    value, but it can rollback the syscall and tell the call site to
    skip the invocation.

    The mechanism used in upstream today is to return -1L as the syscall
    number which makes the architecture specific entry code skip the
    syscall and refrain from touching the return value.

#2) ptrace

    ptrace can poke whatever it wants into the syscall number storage
    via ptrace_set_syscall_info_entry() -> syscall_set_nr()

    It does not set the return code.

    It does not abort the syscall when the poked syscall number is -1L.

    It only aborts when a fatal signal is pending.

#3) seccomp

    seccomp reads the syscall number, which might have been modified by
    ptrace and acts upon it.

    It can rewrite the syscall number even if it is -1 to begin with.

    It can rewrite the return code if it decides to refuse the syscall
    to be executed.

    If it refuses the syscall to be executed it returns -1L.

#4) Rereading the syscall number after ptrace/seccomp

    That's required to give the eventually modified number to the
    tracer.

    Obviously the tracer could do that on it's own, but with the current
    implementation it expects the eventually modified syscall number

    Changing that to make the tracer do it, is possible but does not
    change any of the actual expectations. That's just cosmetic wankery.

#5) tracing

    tracing can have a probe or bpf attached, which in turn can

      - rewrite the syscall number

      - set the return code in case that it sets the syscall number to
        -1L

        It can even set it in case it sets it to some other value, but
        the architecture code has to be resilent against that no matter
        what.

      - if it does not set the return code when it sets the syscall
        number to -1L then it has a historical expectation that the
        syscall returns -ENOSYS

        That's how it is and you can argue in circles and it's not going
        away unless you have a great argument why you can break existing
        user space probes/bpf scripts.

So now please provide in coherent sentences the argument why this solves
anything:

> However, reading the syscall number from pt_regs only after
> syscall_enter_from_user_mode exits does.

If you can, which I doubt, then please send a patch [series] against:

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry/rework

with proper change logs explaining the superiour solution.

If not, please spare us the next set of incoherent "I wan't a pony"
mails.

Thanks,

        tglx

