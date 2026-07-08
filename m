Return-Path: <linux-mips+bounces-15637-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AXEGNtrZTmqnVQIAu9opvQ
	(envelope-from <linux-mips+bounces-15637-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 01:14:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA22F72B0E1
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 01:14:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U7j9DuQ2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15637-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15637-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3512C300D4F2
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 23:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3753839D6D9;
	Wed,  8 Jul 2026 23:14:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB931CA4E;
	Wed,  8 Jul 2026 23:14:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552469; cv=none; b=cNTZ8Ibo6UElWrWrTIczEnoQMAnftapAtr0+NTB61KVqVcuOZUCr/wWLwowzEQq3Es2TQXBXE29j7Bvan0OAj9LHlPKyL/Fb2LDYGQoEq6AGtloOm2sCvVEf2U3Uvs/FXx9x5OzKZciCHxFPP+ZpLU8CzzI7wG5uRk4M9k33QR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552469; c=relaxed/simple;
	bh=SkGVtiGzBaQGD2MgVwXs0xyAs7utyWEIxaZuHZIRv7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f7p5kr5T+wzMvNGKNCOxRfwU3zwlO9zN5niZQ18wj+W+rBNLr1lI/ZV4guElwcFMatjmpaIkLpcnL2RKYvtF9hI8HWtWI9RZCSmkEGurICiuAYoMih46iz5Ey370a/iGrv0R0qnnY7jZZD3GQdq7ldOEtbMi17YwtCC/QlI80CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7j9DuQ2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FD11F000E9;
	Wed,  8 Jul 2026 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783552467;
	bh=znSNM+MGjR1fppYrLy7qoTqjpqFxQICpffN75ccsbrI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=U7j9DuQ2nc8ydd23uGNZv2p9cQUiXygCkAVxSq71mj+NkX2cdLrmoGsFASFGg4Ml0
	 bDwc3/JpNMt1iiuBfO2+u2t8OwVWEKPRBEqFojt4WTEHrS5dyU+Rrl+iHhRZJ43XFU
	 Tp4PiEAswwCoD7KapE0e4aTY0MQO/lRQruojDYgw6tkvWRm9BrYDb1Uy0bxO7Zv6Ig
	 NQWzkZJfqj2mxHN2D5QfuxwgKNzrkIccqqWhDuluZJB6zK0q7BbhRN+Pi08TxExqdC
	 M1JIWRaFxQmoW8FElnvw5Vst8d3UaIMnUJuT2C8niIgtq2a4qubF9EJ5FQZPKi1rPF
	 fpIGbT8HGVkAQ==
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
In-Reply-To: <87se5tqkyp.ffs@fw13>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.338083894@kernel.org> <ak5ySpil83TNWxeq@kunlun.suse.cz>
 <87se5tqkyp.ffs@fw13>
Date: Thu, 09 Jul 2026 01:14:24 +0200
Message-ID: <87ik6pqdkf.ffs@fw13>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15637-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:msuchanek@suse.de,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@ker
 nel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fw13:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA22F72B0E1

On Wed, Jul 08 2026 at 22:34, Thomas Gleixner wrote:
> On Wed, Jul 08 2026 at 17:52, Michal Such=C3=A1nek wrote:
> Q: Is it perfect?
> A: No
>
> Q: Can it be made perfect?
> A: No, because you can't change history and established practice.
>
> Just for illustration. Changing the logic in trace_syscall_enter() to:
>
> --- a/kernel/entry/syscall-common.c
> +++ b/kernel/entry/syscall-common.c
> @@ -9,13 +9,15 @@
>=20=20
>  bool trace_syscall_enter(struct pt_regs *regs, long *syscall)
>  {
> +	long orig_syscall =3D *syscall;
> +
>  	trace_sys_enter(regs, *syscall);
>  	/*
>  	 * Probes or BPF hooks in the tracepoint may have changed the
>  	 * system call number. Reread it.
>  	 */
>  	*syscall =3D syscall_get_nr(current, regs);
> -	return *syscall !=3D -1L;
> +	return *syscall =3D=3D orig_syscall || *syscall !=3D -1L;
>  }
>=20=20
>  void trace_syscall_exit(struct pt_regs *regs, long ret)
>
> does not make #2 magically go away. It's still the same problem whether
> you like it or not.

And just to be entirely clear, the syscall() interface has to be correct
in the first place, but then it's all about performance.

So the sequence of:

   pt_regs =3D PUSH_REGS();
   syscall =3D pt_regs->syscall_reg;
   pt_regs->result =3D -ENOSYS;

   arch_syscall(pt_regs, syscall) {
      if (likely(syscall_enter_from_user_mode(pt_regs, &syscall) {
         if (syscall < SYSCALL_max)
            pt_regs->result =3D invoke_syscall(pt_regs, syscall);
      }
      ,,,,
   }
   pt_regs->($RETURN_VALUE) =3D pt_regs->result;
   POP_REGS();
   return;

is the correct and obviuosly most efficient way idependent of the -1L
return value overload in the original implementation, which this series
gets rid of for clarity.

If an architecture decide[sd] to do otherwise and makes up it's own rules
which only cover parts of the problem then it _is_ an architecture
problem and not something which has to be solved by claiming that every
architecture has to implement the same nonsense as you falsely claimed
in your RFC^WPOC^Whack thread:

  "However, the API should be specified in a way that does not require
   everyone implementing such flag."

There is _ZERO_ requirement for any architecture to implement that
flag. Just because S390 decided it's a brilliant idea to do so does not
make it a requirement for everyone.

No. Every other architecture got it right because they looked at the
historical patterns despite having correct documentation at hand.

Feel free to prove me wrong with actual facts.

Thanks,

        tglx

