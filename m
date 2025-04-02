Return-Path: <linux-mips+bounces-8425-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F6BA78D5C
	for <lists+linux-mips@lfdr.de>; Wed,  2 Apr 2025 13:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1A963AB036
	for <lists+linux-mips@lfdr.de>; Wed,  2 Apr 2025 11:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD80123815B;
	Wed,  2 Apr 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GpdsdZfv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB5B236451
	for <linux-mips@vger.kernel.org>; Wed,  2 Apr 2025 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594177; cv=none; b=B24YuED65rpYBU/GhC6ZptVEbyi5x/32UoXWeuQnMhap0a/pUDws4wzvzrtcadN2WxAIvQcvp6UDAx20wTcpw/xYJxje17zrmQAt/sQ9drEv0nrIiTu5RSAJqBjQ/+nvaxKtgQj3avdj0O9LNCnCpCc6NAAMCDzlYjWw1pYI1ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594177; c=relaxed/simple;
	bh=KkTsGy5CsRwJadCXUu6zsFgtqT/OTeC9ctEnA4BXfTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVNFGpH+fZGkwmdw7QOQuOWI2TQI5xNJWrsDZWqx+M98J50jbidUs4crBklXXpbjlpbClX/vGZjxgQKy2OOQiqQ1KQfEs+Vq2jEDlPM5Bb2ExmAfVs13EVqR4IDJozybQw9/c/CDX7o4gT7eiLTej2Rcx14JVjoeCpTSgxMNbNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GpdsdZfv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54acc04516fso6285439e87.0
        for <linux-mips@vger.kernel.org>; Wed, 02 Apr 2025 04:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743594173; x=1744198973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnyFGkuf+ZlsYRxDUDzYYevuVifSXRHynvisVvI+KPo=;
        b=GpdsdZfvQvHuGnJy/Nkc2neqyg+v/5yIVawGGQDExWebhuuC6g7TsPrRrcLUZQWePn
         P/CRE2TWtOKPF8p6PXf5GPZzqsHjrV+5xnH7LwCYzpsRB5qgNW58k9CBtqP+WO+fPEwC
         pWRKSJN1Kwc+luo5RM+2MRoPpu+WQMtT4b5EZDLFIKWinmf+Mg0A7KE4ahatztj8gv+I
         FULFeDjWoc5XcmMqybjfW4npXlpPgwAXPHLbEBbWLrBdOluEDufMfWWiIWBiXYL9Nq2t
         HtHgwxtNNx2RWSlEaMc4NWuGODhW71KWEWRie0q8aLavvDDQPbfZpytyCVmG9rsU0F6t
         g9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743594173; x=1744198973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnyFGkuf+ZlsYRxDUDzYYevuVifSXRHynvisVvI+KPo=;
        b=p3Ywnvv+6TVK3IXm5I7DxPVyL1+s0ZrOUCaqJRrJq+eFyW2E4UiYQdM224UtnEv/up
         aZ0uYkttlbcUlBsojyVSSciIs3ym67J9ERPb0c3JClMgcObGxje6E8/P5nC+d7DLoc+C
         M3Fqp99WI1QNN37p35coy7D2yHGzQRsxXUbbmSyVgirx9MDucPzqn26uz2rOqtDNwnJC
         gJHNLV4HxlJ2CBL+fG3q/BJUSXHedvB/7O2FG1dA/+HW8c1co75t20Hk7mYpt4W7i7Dh
         x3uVYlwfkLrOgi0VITrwGpeT3mBDBgw+ausATHFsUWyK57thuAQLSyapYpSSuZT0S5Gc
         Cnug==
X-Gm-Message-State: AOJu0Yx+kAVMATUYcRN3ta9iE6KKonloiH98BKzV32VJ/DaP9yies4jY
	Q7CEsAmyROLZfmjYSeJgnmL+MTmuURwXzX/FMNIyUzOq6l7Q2b0OECYH4K6WDG47lWa51voQ+jq
	X8QgOhEc+JP30//WDvs6Wz57BY+XJWMI9Lx9G9A==
X-Gm-Gg: ASbGncvm90TE9U34kY+eQ/fEeetTn0YyOof4LSKMvYRcGb4MElzR3up2r2EIP3Upgrx
	9ldDeUsoLknCkCsxt5F0JDSVbLLVVSLdBo8NOcMDq3qOUWEtOW+WxRKq31eH7gjRIxzh3MXf8Mf
	XHwRvZrILSZ/pE4HijJPtl2ULNFMtlS6IfSIYgShvlTnO3ntew2VpjvuPnH+o=
X-Google-Smtp-Source: AGHT+IF4FJ1w+jiLp0Ti0X7tN2e/4jQiASB+2SdRqOfy/3p5/H5Gs+xlfgZWVDpPr5jQmB4ObvaJ0rc1Wvapx2P5RHI=
X-Received: by 2002:a05:6512:3dac:b0:54b:ed9:2cf8 with SMTP id
 2adb3069b0e04-54b10db7a82mr5263140e87.10.1743594173425; Wed, 02 Apr 2025
 04:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
 <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com> <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 2 Apr 2025 13:42:42 +0200
X-Gm-Features: AQ5f1JpZUgtL2TOq7uImkDhamnm4M177atcJvXYiPZxvQbXGcOihm9yVWRFSpr8
Message-ID: <CAAofZF6Gnzm9isPt3NUuSPBmBWQsj56O43pPZAf64WEP8no2Rg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

> Well, you should be able to set a breakpoint at `rollback_handle_int' and
> fiddle with $epc by hand to see if the code sequence correctly skips over
> WAIT.  Though I reckon QEMU used to have an issue with presenting the MIP=
S
> privileged context over its debug stub.  Has the issue been fixed?  Eithe=
r
> way you should be able to just operate on the copy in $k0 retrieved with
> (D)MFC0.

Nope, seems not fixed so far. But yes, changing $k0 is working fine.
With the cpu in idle code (executing "wait"), ctrl+c, then placed a bp
in rollback_handle_init+4. Then "c" to hit the bp.
When the bp is hit, I can see $k0 =3D r4k_wait_exit.

I changed $k0 with an address inside the region, and setting a bp on "bne",
 the value is equal to $k1. I'm assuming the value is also saved
correctly in $epc,
considering it points correctly to r4k_wait_exit.

> See Section 3.5 of the latter manual for further
> discussion of the ISA bit.

Thank you, I found the manuals for rev. 5,
I still didn't have enough time to take a look anyhow.

> See the comment at said macro in <linux/compiler_types.h> and also commit
> 6727ad9e206c ("nmi_backtrace: generate one-line reports for idle cpus").

Aha, thanks!

 > Hmm, "skipover" maybe?

Now that I'm looking at the code, shouldn't it be better to address this in=
 a
separate patch or another time?

I can see the rollback_handler* is exported also in arch/mips/kernel/traps.=
c
And there are a few parts that makes use of the "rollback" name; I'm
wondering if also
the code should be refactored a bit then,
eg arch/mips /include/asm/idle.h:using_rollback_handler()


Thank you!


On Mon, Mar 31, 2025 at 10:09=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
> On Mon, 31 Mar 2025, Marco Crivellari wrote:
>
> > > There's some complication here coming from the need to factor in the =
ISA
> > > bit in the microMIPS mode; something that hasn't been discussed so fa=
r.
> > > The `.fill 0' approach is a hack and it has struck me that we need to=
 add
> > > a `.noinsn' pseudo-op to GAS for this purpose, complementing `.insn',=
 but
> > > we need to stick with the hack for now anyway as it will take years u=
ntil
> > > we can rely on a new feature in the assembler.
> >
> > Ah, interesting. So de facto having the "repeat" to 0, will generate no=
thing.
>
>  Correct, and as a side effect this pseudo-op clears the ISA bit on any
> label attached, as it is not an instruction.
>
> > > I can't imagine how we'd advance past WAIT without these instructions=
,
> > > what do you have in mind?
> >
> > I've not been precise, sorry.
> > I meant to remove the instructions like they are now because the
> > region would have
> > been different, then.
> > So, those instructions would have needed a change, in practice.
>
>  OK, so this is precisely what happened here with my proposal.  Thanks fo=
r
> clarifying.
>
> > > NB how do you actually verify this stuff with QEMU?  Is it by injecti=
ng
> > > an interrupt by hand at a chosen code location via GDB attached to QE=
MU's
> > > built-in debug stub?
> >
> > Short answer: I am not able to fully test this, I can only boot.
> >
> > The reason is that gdb-multiarch is not working as expected.
> > The binary in my distribution has the python support broken. So when I =
try to
> > inject the interrupt, I'm receiving a python error (actually, I receive=
 the same
> > error after the "target remote" command).
> > I've also tried to compile the binary from source, but again,
> > I understand why in OBS the build I found is broken...
>
>  Well, you should be able to set a breakpoint at `rollback_handle_int' an=
d
> fiddle with $epc by hand to see if the code sequence correctly skips over
> WAIT.  Though I reckon QEMU used to have an issue with presenting the MIP=
S
> privileged context over its debug stub.  Has the issue been fixed?  Eithe=
r
> way you should be able to just operate on the copy in $k0 retrieved with
> (D)MFC0.
>
> > > Below I've included a complete change based on the outline above.  It
> > > seems to do the right thing for a couple of my configurations, but I'=
ve
> > > only eyeballed the resulting code and haven't tried running it.  Most=
 of
> > > my hardware doesn't implement the WAIT instruction anyway.
> >
> > It means it would be better to have someone else try the resulting
> > patch, I guess.
>
>  Exhaustive run-time verification is not always necessary if you can
> demonstrate that your code is correct via other means, including
> proofreading.
>
>  FAOD I have one MIPS32r2 system wired for testing, but that might not be
> the most interesting configuration to verify as it'll now just use EI/EHB
> to enable interrupts ahead of WAIT.  I could try an R1 kernel instead, bu=
t
> I'm not sure if it can be made to work owing to the differences in the FP=
U
> between R1 and R2 for the MIPS32 ISA.  I used to have a MIPS64 (R1) syste=
m
> there, but the CPU daughtercard sadly stopped working 3 years ago and I
> wasn't able to repair it, owing to the lack of available spare parts (it'=
s
> most likely a dead CPU).
>
> > > Let me know if you find anything here unclear or have any questions o=
r
> > > comments.
> >
> > 1)
> >
> > > /* Keep the ISA bit clear for calculations on local labels here. */
> >
> > The ISA bit should be the bit 0, correct?
> > So, also in the macro code, it's done to preserve that bit.
>
>  Correct, the bit will be set according to the ISA mode at the time the
> originating machine instruction is executed, in EPC or any other register
> the PC is copied to, e.g. $ra.  Likewise any instruction setting the PC
> such as JR or ERET will set the ISA mode from the ISA bit of the source
> register (the ISA bit for exception entry is set from CP0 Config3.ISAOnEx=
c
> register bit).
>
>  All code labels in microMIPS code will have the bit set, so that
> relocations correctly calculate immediates used to make register jumps.
>
>  The ISA mode can be switched explicitly with the JALX instruction (you
> can mix regular MIPS and microMIPS code as long as hardware supports the
> other ISA mode; either or both can be implemented in a given piece of
> silicon).
>
>  Other immediate jumps and branches preserve the current ISA mode, but th=
e
> assembler and linker verify you don't attempt to use these instructions t=
o
> pass control to code in the other mode; this is an assembly or link error
> depending at what stage the label reference is resolved.
>
>  FYI the documents for the microMIPS mode of operation are respectively:
>
> - "MIPS Architecture For Programmers Volume I-B: Introduction to the
>    microMIPS32 Architecture"
>
> - "MIPS Architecture for Programmers Volume II-B: The microMIPS32
>    Instruction Set"
>
> and their microMIPS64 counterparts (although the first document is almost
> an exact copy of its regular MIPS variant).  Be sure to download revision
> 5.xx, because revision 6.xx describes an entirely different ISA which we
> currently have no support for (downstream patches were never submitted;
> also microMIPSr6 removed branch delay slots, which caused all sorts of
> portability issues).  See Section 3.5 of the latter manual for further
> discussion of the ISA bit.
>
> > 2)
> > .section .cpuidle.text,"ax"
> >
> > This should be a single patch, right?
> > Based on what I understood, 'a' should be the allocation, and 'x' the
> > executable attribute.
>
>  Both correct (see the GAS manual for the section flags); this just
> matches the __cpuidle macro from <linux/compiler_types.h>.
>
> > This should be in order to mark those symbols like "cpuidle text":
> >
> > $ nm -n vmlinux | grep -A3 "cpuidle_text"
> > ffffffff80a127e0 T __cpuidle_text_start
> > ffffffff80a127e0 T r4k_wait
> > ffffffff80a12800 t r4k_wait_insn
> > ffffffff80a12804 t r4k_wait_exit
> > --
> > ffffffff80a12c00 T __cpuidle_text_end
> > ffffffff80a12c00 T __noinstr_text_end
> > ffffffff80a12c00 t rest_init
> > ffffffff80a12ccc t kernel_init
> >
> > I guess it is used in order to understand if the instruction pointer is=
 inside
> > one of these functions / labels.
>
>  See the comment at said macro in <linux/compiler_types.h> and also commi=
t
> 6727ad9e206c ("nmi_backtrace: generate one-line reports for idle cpus").
>
> > How does a commit description sound like this?
> >
> > "
> > mips: Add dedicated .cpuidle.text section for CPU idle routines
> >
> > Add a dedicated executable section for CPU idle code to properly organi=
ze
> > and identify idle-related functions inside the .text section.
> > "
>
>  How about:
>
> "
> MIPS: Move __r4k_wait() to .cpuidle.text section
>
> Fix missing .cpuidle.text section assignment for __r4k_wait() to correct
> backtracing with nmi_backtrace().
>
> Fixes: 97c8580e85cf ("MIPS: Annotate cpu_wait implementations with __cpui=
dle")
> "
>
> or suchlike (based on the commit referred)?
>
>  This probably does not itself qualify for linux-stable as the issue is
> only annoying rather than fatal, but I think the annotation should be
> there in case someone wants to backport it downstream.
>
> > 3)
> >
> > > I think we also need to replace "rollback" with
> > > another name as with new code we don't roll back anymore.
> >
> > Should be changed with "region", instead of rollback, maybe?
> > Do you have something better to suggest?
>
>  Hmm, "skipover" maybe?
>
>   Maciej



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

