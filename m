Return-Path: <linux-mips+bounces-8362-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1151A70E62
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 02:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A682D7A66E5
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 01:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D89525634;
	Wed, 26 Mar 2025 01:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYiOizni"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7220328;
	Wed, 26 Mar 2025 01:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742952018; cv=none; b=L7HXdlIQUqJalTBqlphhnfGnkgPjMs4gBewnM1ijocsZQ/ouOvdbtEf1EkFVaGHIqAIiAhNJYSmxhg54vXrZKyQRXKXPQIPK0Z7/MgROVnlcJzJET6EckF8d/1owzH3tjOnTclqm2wMzQ7sz7hGZTusaRql2jIWYSpOQc3v+VX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742952018; c=relaxed/simple;
	bh=HhIjd/6oNo1ftzu6V9Mm4VvcqS+w5uhhbGrKWPZCObA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwRZOhwlqe6dAYb7k8Hwbp0pj5KV/VkK5m+1IKH25KyBa+AQpRKx/fUMty6kIYciyWAtSiPQJ6y3GoGkE+gHDmMNjo+iX2ZRM+3/kcdJE8+H6XxZBB/M4ThtNSzrPMIGQ54p9E44g+lfa+gfnuAjaH2Vl5bs+yqE51VrsGF3gaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYiOizni; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE38CC4CEF0;
	Wed, 26 Mar 2025 01:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742952017;
	bh=HhIjd/6oNo1ftzu6V9Mm4VvcqS+w5uhhbGrKWPZCObA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MYiOizniICp2EtSHENEqPemsQDtrFqrulLmXV+x5Azy6acZAETr52DfP6EwYT8zNc
	 r6g8fvnMnh4nMgo/z/7U6hpJ1PLBtc9hVH8x6rqUEketT6nuL0BuEL9luEBd8Jm7dU
	 VOekzVhqDXkjLj5QA8WQrLXe5mw8n1N+jzjsmMph43ZsKtSlR/8c2UCdikR+HbvOG4
	 w2eTMuRDWbXOlwTpW+vMkAD1rx20xz3vQ2hGzSj/wavX+aCj2k2OkHYq29ZeEZeTm4
	 AwPrjaNnh6R6scb+W5DABV4IXXY8vg04zDugXxFovr3UfMtgIN5JrbV4CL4yzfV6FP
	 vhG/nVjTIaH2w==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac25313ea37so881421166b.1;
        Tue, 25 Mar 2025 18:20:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWfrXntOJssB6Q15dyrmSOBywfK1+AQu4XQK1Wgm89X5EwRWnFSrF7YErs3ZhHTCG1GyghRX9Oagx+3F0=@vger.kernel.org, AJvYcCWzC0eVHkZ90DkCQI54OBWkqVpK/m/nEsED6a2xNkVh7dezzPJ00aAMmX5732+g2BQRpnQxN353xv2m/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2xtqRKmpxJp5ZkYHJU5GXDCWjVabP48Y+TX0ErEKal4Qu4sZL
	faISvfx5PqYvx1JzLVyeqMjsAbdyEPHGBzQRdDFv8ammIyYdm79uHSGrw22eGyBAVjG6mPNzcu7
	2nTjFAZ6ljijs/FBTlfvZL281Wj4=
X-Google-Smtp-Source: AGHT+IFg54WXJce4TYhN+dQD40FhzcLKDryheKsA3LuZQoxyka4EX08Pij1otqx90OEOpxTxH5WW1UVWXw8s3aK77Oo=
X-Received: by 2002:a17:907:a58b:b0:abf:641a:5727 with SMTP id
 a640c23a62f3a-ac3f20b8571mr2053731466b.7.1742952016202; Tue, 25 Mar 2025
 18:20:16 -0700 (PDT)
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
In-Reply-To: <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Mar 2025 09:20:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Tko290LSCJPuVFE2qds81N4C=8RPz4edC-xddFvZGjA@mail.gmail.com>
X-Gm-Features: AQ5f1JqgVYijHU5sOnrmBCwIEoO071ijzC3jEVQO80Y3KxBIpqE5NiFxfkW-KfM
Message-ID: <CAAhV-H7Tko290LSCJPuVFE2qds81N4C=8RPz4edC-xddFvZGjA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 10:09=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Hi Maciej,
>
> Thanks a lot for all the information.
>
> >  Unlike `__r4k_wait' that code is not in a `.set noreorder' region and
> > the assembler will therefore resolve the hazard by inserting a NOP wher=
e
> > required by the architecture level requested (with `-march=3D...', etc.=
).
> > Try compiling that function for a MIPS III configuration such as
> > decstation_r4k_defconfig or just by hand with `-march=3Dmips3' and see
> > what machine code is produced.
>
> I tried with the configuration you suggested, and indeed I can see a NOP.
>
> >  Whatever manual you quote it refers to MIPS Release 2, which is only
> > dated 2003
>
> About the MIPS manual, anyhow, it is "MIPS32 M4 Processor Core" (year 200=
8).
> Maybe I've also picked the wrong manual.
>
> I've also found the manual you mentioned online, thanks.
>
> >  Best is to avoid using a `.set noreorder' region in the first place.
> > But is it really needed here?  Does the rollback area have to be of a
> > hardcoded size rather than one calculated by the assembler based on
> > actual machine code produced?  It seems to me having it calculated woul=
d
> > reduce complexity here and let us use the EI instruction where availabl=
e
> > as well.
>
> Well, considering the complexity and how the code looks fragile even with
> a small change, yes, that's likely better to avoid noreorder.
In my opinion keeping "noreorder" is the simplest, which means just
add an "nop" after MFC0 in the current version.

Huacai

>
> I think I'm going to need some guidance here.
> Please, correct me where something is wrong.
>
> 1)
> When you say "let us use the EI instruction where available" are you
> referring to do
> something like below?
>
> #if defined(CONFIG_CPU_HAS_DIEI)
> ei
> #else
> MFC0    t0, CP0_STATUS
> ori     t0, 0x1f
> xori    t0, 0x1e
> MTC0    t0, CP0_STATUS
> #endif
>
> 2)
> Removing "noreorder" would let the compiler add "nops" where they are nee=
ded.
> But that still means the 3 ssnop and ehb are still needed, right?
>
> My subsequent dumb question is: there is the guarantee that the
> compiler will not
> reorder / change something we did?
> This question also came after reading the manual you quoted (paragraph
> "Coprocessor Hazards"):
>
> "For example, after an mtc0 to the Status register which changes an
> interrupt mask bit,
> there will be two further instructions before the interrupt is
> actually enabled or disabled.
> [...]
> To cope with these situations usually requires the programmer to take exp=
licit
> action to prevent the assembler from scheduling inappropriate
> instructions after a
> dangerous mtc0. This is done by using the .set noreorder directive,
> discussed below"
>
> 3)
> Considering the size is determined by the compiler, the check about
> the idle interrupt
> size region should not be needed, correct?
>
> 4)
> ori and PTR_ADDIU should be removed of course from the rollback handler m=
acro.
> Can I have some hints about the needed change?
> Using QEMU is always working, so I'm not sure if what I will change is
> also correct.
>
>
> Many thanks in advance, also for your time!
>
>
>
>
> On Fri, Mar 21, 2025 at 9:11=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me=
.uk> wrote:
> >
> > On Fri, 21 Mar 2025, Marco Crivellari wrote:
> >
> > > >  This instruction sequence still suffers from the coprocessor move =
delay
> > > > hazard.  How many times do I need to request to get it fixed (count=
ing
> > > > three so far)?
> > >
> > > Can I have more details about this?
> > >
> > > I can see it is the same code present also in local_irq_enable()
> > > (arch_local_irq_enable()),
> >
> >  Unlike `__r4k_wait' that code is not in a `.set noreorder' region and
> > the assembler will therefore resolve the hazard by inserting a NOP wher=
e
> > required by the architecture level requested (with `-march=3D...', etc.=
).
> > Try compiling that function for a MIPS III configuration such as
> > decstation_r4k_defconfig or just by hand with `-march=3Dmips3' and see
> > what machine code is produced.
> >
> > > and from the manual I've seen:
> > >
> > > "The Spacing column shown in Table 2.6 and Table 2.7 indicates the
> > > number of unrelated instructions (such as NOPs or SSNOPs) that,
> > > prior to the capabilities of Release 2, would need to be placed
> > > between the producer and consumer of the hazard in order to ensure
> > > that the effects of the first instruction are seen by the second inst=
ruction."
> > >
> > > The "Spacing column" value is 3, indeed.
> > >
> > > "With the hazard elimination instructions available in Release 2, the
> > > preferred method to eliminate hazards is to place one of the
> > > instructions listed in Table 2.8 between the producer and consumer of=
 the
> > > hazard. Execution hazards can be removed by using the EHB [...]"
> >
> >  Whatever manual you quote it refers to MIPS Release 2, which is only
> > dated 2003 (following Release 1 from 2001), but `__r4k_wait' has to
> > continue handling older architecture revisions going back to MIPS III
> > ISA from 1991.  We also support MIPS I ISA from 1985 which has further
> > instruction scheduling requirements, but `__r4k_wait' is for newer
> > processors only, because older ones had no WAIT instruction, so we can
> > ignore them (but note that the MIPS I load delay slot is regardless
> > observed in current code in the form of a NOP inserted after LONG_L).
> >
> > > What am I missing?
> >
> >  This is common MIPS knowledge really, encoded in the GNU toolchain and
> > especially GAS since forever.  While I can't cite a canonical reference=
,
> > the hazard is listed e.g. in Table 13.1 "Instructions with scheduling
> > implications" and Table 13.3 "R4xxx/R5000 Coprocessor 0 Hazards" from
> > "IDT MIPS Microprocessor Family Software Reference Manual," Version 2.0=
,
> > from October 1996.  I do believe the document is available online.
> >
> >  I'm fairly sure the hazard is also listed there in Dominic Sweetman's
> > "See MIPS Run Linux," but I don't have my copy handy right now.
> >
> >  Best is to avoid using a `.set noreorder' region in the first place.
> > But is it really needed here?  Does the rollback area have to be of a
> > hardcoded size rather than one calculated by the assembler based on
> > actual machine code produced?  It seems to me having it calculated woul=
d
> > reduce complexity here and let us use the EI instruction where availabl=
e
> > as well.
> >
> >  HTH,
> >
> >   Maciej
>
>
>
> --
>
> Marco Crivellari
>
> L3 Support Engineer, Technology & Product
>
>
>
>
> marco.crivellari@suse.com

