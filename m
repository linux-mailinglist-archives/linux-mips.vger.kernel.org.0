Return-Path: <linux-mips+bounces-15717-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fX9zK+DLT2ruoQIAu9opvQ
	(envelope-from <linux-mips+bounces-15717-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 18:27:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AC73371A
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 18:27:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=f66IYRb3;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15717-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15717-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20FA93022B18
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 16:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28E642DA2C;
	Thu,  9 Jul 2026 16:27:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11631435EE9
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 16:27:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614427; cv=none; b=XppDehPpNYkDDF9sd4tuDa6QSeh4tuZ3fWoUHxwCT4kKJwVMzQEnoCbpNNubZj+nuFd16nU78tPNFXunOaU+nJ4/0wGehe7AQEzj1yzmY3ZEhtsF7W5i0tVqYhpfCqm9D5Q850v6A15MAKh1Kg/y0Fen4yadJtf8MsMp7tUO4g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614427; c=relaxed/simple;
	bh=S/xAtxH9kCAjFwM1/MAEgEQMpcNiqhEBM0MEXLopRqg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FELSPzNx7ooNFNzuOTcd+6ff7zRl9WETchUD2E3B7PSPKRfCwmq92hFdTZiFj80feEHkhClxBJp1AEiEPDU3/ayROsNUSOve+gjg/RCVs0cJKQ28OgEV8iE2squewnaJm2o9pU6WrMBGNCBivyYuADqKr+zKv7azKFlBlHBBcSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f66IYRb3; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b7612475so18619135e9.3
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783614423; x=1784219223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEOL8DOWD1Msvjz7k5cAG0xDAOqwGsu0BnpwMff10wU=;
        b=f66IYRb3W3n4wUp60vuJmeagFdempVA19+GvfglfbGXQNr32Jgf6Zu59Uj+bcep6dg
         jsx4MIO/Rg0Jc8lrVT/RQMxMMW76zzTchDs11lEHMl8wueX5jr2m95gnsMPuCp+FiVia
         BXcS1RfCaig3WVexG8fiT0f1WyIZI2ZFqmCdfMorSUHquBf0Y5WGXwn3lYxbxm4/2faj
         NWGL5ZyKcF+WzWoxiQjAkz+rxwePY89gZ4a0ESMuDMMFx4G3ZLECB3j0O5NlKwsrjWw/
         4IqBiE/i3mAHjgYbMO+ob6qHoEPfbgtS+ClBm3imDY87X4M/jBzC1B5Fmge7V4/JxTvX
         p0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614423; x=1784219223;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEOL8DOWD1Msvjz7k5cAG0xDAOqwGsu0BnpwMff10wU=;
        b=hxZGVuIcdPBHP2gviIJyXPYNuBGjxxlDnNbUXKpnGC6fTlbEvKNOKa1f6efji9dYca
         DU9OqqOueqAH/tLb7z2CWejNv5HlqGSxGR130W1ejcuXod/CcHB5yMwWgPrAsTkgqwtC
         APOIh2m5KPwUa/SDDYDvNxLJV4hL/wVmWoCXFv62DkrDrdKqLdnrpZsY3UrPMiJNw+QY
         k+/ov690UxCuL3LRV362Snwrer0EHSH2xMF6OLS8PNbIp2w875pptI2FPtuKyZWGmhJp
         ces997fsLD+UUvL6J7oPBliKuMUuRovTz6kXyl53K0gSbkkRlN5v8cuboPA0yGXR17+8
         6ehg==
X-Forwarded-Encrypted: i=1; AHgh+RqNZWCo1EcYlVUNn94+UMJ7o5fyJglanBF8tSKhhOtdMzKTOh1JcOFW+JowlleOUdXM1mVfToVE5M8v@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHkxKaHhOTlfi2rbUFbtQC7GkpbQzdCAR5c+l4lshEp/y3RdD
	WzdzSqUF5z/HZJOsDmhOJ8V/XhbLQza7R4dOCse3OKYu1OjHotYiTdKi
X-Gm-Gg: AfdE7ckRBVM09kcZh6yit32Mkqow+UHNsO/d1ArK0BqMIErW7tZsNdqWfm+NF9fZ4ik
	socjpKAoTgzzji5hkZP++3PNmhamU+1pRIJ7+Qxep16RGRhmRnyhn0H/vnsFE0IbF2W8xvG145Q
	4TqDXY7MDbmDDfwRXF9QkVfuFUj3CPWY1yeBq8VXJ+fRYW3fowQ4f5QoYKBg6UNmy6cuYvmr8lf
	O45918gvx4hS+nL/2cS20j0PIf2/ku1QKZY3uwMz0mufNvjKx1b77Q+QveHeDW0eKMtFkkLWPei
	6SQQY1N13eGnanLQ4B9BoIC9IyY9iDIl0Q8pdNpNWyFQ0IHJJluevK/fbccZShgdWAGUhU9oaG3
	SO5CBaOXzWW1xPTD+7eGMnL63GC2DluHuIPnlhCxg/i0hR+aSPpHCJIzaHYFqSZu4mwq3Xkdq8n
	/A0a20NbTju5syEl2lXoUsWCZQFiHZEtzvqKtJCcp2+7qUoQ==
X-Received: by 2002:a05:600d:6405:10b0:493:eec0:2b8c with SMTP id 5b1f17b1804b1-493eec02c80mr19641245e9.12.1783614423204;
        Thu, 09 Jul 2026 09:27:03 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm70023415e9.0.2026.07.09.09.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:27:02 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:26:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook
 <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Guo Ren
 <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
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
Subject: Re: [patch 13/18] entry: Make trace_syscall_enter() return type
 bool
Message-ID: <20260709172659.7040db33@pumpkin>
In-Reply-To: <87ik6pqdkf.ffs@fw13>
References: <20260707181957.433213175@kernel.org>
	<20260707190254.338083894@kernel.org>
	<ak5ySpil83TNWxeq@kunlun.suse.cz>
	<87se5tqkyp.ffs@fw13>
	<87ik6pqdkf.ffs@fw13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15717-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:msuchanek@suse.de,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@ker
 nel.org,m:will@kernel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 680AC73371A

On Thu, 09 Jul 2026 01:14:24 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> On Wed, Jul 08 2026 at 22:34, Thomas Gleixner wrote:
> > On Wed, Jul 08 2026 at 17:52, Michal Such=C3=A1nek wrote:
> > Q: Is it perfect?
> > A: No
> >
> > Q: Can it be made perfect?
> > A: No, because you can't change history and established practice.
> >
> > Just for illustration. Changing the logic in trace_syscall_enter() to:
> >
> > --- a/kernel/entry/syscall-common.c
> > +++ b/kernel/entry/syscall-common.c
> > @@ -9,13 +9,15 @@
> > =20
> >  bool trace_syscall_enter(struct pt_regs *regs, long *syscall)
> >  {
> > +	long orig_syscall =3D *syscall;
> > +
> >  	trace_sys_enter(regs, *syscall);
> >  	/*
> >  	 * Probes or BPF hooks in the tracepoint may have changed the
> >  	 * system call number. Reread it.
> >  	 */
> >  	*syscall =3D syscall_get_nr(current, regs);
> > -	return *syscall !=3D -1L;
> > +	return *syscall =3D=3D orig_syscall || *syscall !=3D -1L;
> >  }
> > =20
> >  void trace_syscall_exit(struct pt_regs *regs, long ret)
> >
> > does not make #2 magically go away. It's still the same problem whether
> > you like it or not. =20
>=20
> And just to be entirely clear, the syscall() interface has to be correct
> in the first place, but then it's all about performance.
>=20
> So the sequence of:
>=20
>    pt_regs =3D PUSH_REGS();
>    syscall =3D pt_regs->syscall_reg;
>    pt_regs->result =3D -ENOSYS;
>=20
>    arch_syscall(pt_regs, syscall) {
>       if (likely(syscall_enter_from_user_mode(pt_regs, &syscall) {

I guess most architectures inline that to avoid the &syscall.
Otherwise you'd want:
	syscall =3D syscall_enter_from_user_mode(pt_regs, syscall);
with the 'error' return being selected to fail the test below
(which -1L converted to ~0UL will do nicely).

	David

>          if (syscall < SYSCALL_max)
>             pt_regs->result =3D invoke_syscall(pt_regs, syscall);
>       }
>       ,,,,
>    }
>    pt_regs->($RETURN_VALUE) =3D pt_regs->result;
>    POP_REGS();
>    return;
>=20
> is the correct and obviuosly most efficient way idependent of the -1L
> return value overload in the original implementation, which this series
> gets rid of for clarity.
>=20
> If an architecture decide[sd] to do otherwise and makes up it's own rules
> which only cover parts of the problem then it _is_ an architecture
> problem and not something which has to be solved by claiming that every
> architecture has to implement the same nonsense as you falsely claimed
> in your RFC^WPOC^Whack thread:
>=20
>   "However, the API should be specified in a way that does not require
>    everyone implementing such flag."
>=20
> There is _ZERO_ requirement for any architecture to implement that
> flag. Just because S390 decided it's a brilliant idea to do so does not
> make it a requirement for everyone.
>=20
> No. Every other architecture got it right because they looked at the
> historical patterns despite having correct documentation at hand.
>=20
> Feel free to prove me wrong with actual facts.
>=20
> Thanks,
>=20
>         tglx
>=20


