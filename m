Return-Path: <linux-mips+bounces-8355-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D82A8A70357
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 15:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65CEA1884926
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760F4258CEF;
	Tue, 25 Mar 2025 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PJDsJptU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FDC255227
	for <linux-mips@vger.kernel.org>; Tue, 25 Mar 2025 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911744; cv=none; b=lL/eQM2gA6VNvNXuatuwSu/+LcQistAl2xp+z3J2Po4vswSQPZQazB/oNdt+20M3UzgPL3dmSTQcSXWQHajQ+RbBD4fbPbwMNx84zD2tB3kEuvky1pXvepHSKhL1y8s0AQVaMarWCUrop++vXrCPpBfTCSa3i5WtnxeAp/1xjRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911744; c=relaxed/simple;
	bh=yEFyQ+YEa66hv43lkoEthZojt8e1UeJhq1ZZTPWRgUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLz0PSN8yJHzlNLQ+Eq8cQzJdDWCMBxWL2afY+N/V3WqwowV2kvWX3HwEC3Wd5DXQP7TTahhDB8q2zPYmihmv80M4gqgt/1e0TQ6bl+i88LR9EN2WnobatVAffkS9hbf5cWxWSaJbZGjJBP0ESKNneJb8MRLhIcTCiYDMMpbGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PJDsJptU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6031151e87.0
        for <linux-mips@vger.kernel.org>; Tue, 25 Mar 2025 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742911740; x=1743516540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjEJTGwVhUIjztw3KP/oH70yQTBLfj6JtyAZjLxBC88=;
        b=PJDsJptUg3vJROMrz3qhSzyB+/tPWiGP8pWfUJ4xeCKVg1zvOeWecy13R9beBffkc3
         4kvENdyWtMrGxKM/CD0/15EpdYa8McrDxwm+QzgE2ADYamGEU1XgWu8XaJ6zBRmu//bg
         XZWVostlmiMnSHoKY2jyV2x7aA3pJkO6ysSuFLBYTtI9pQv76ulrIsedFEkPAzcPB72L
         ErpdLICnpVez1bnFY4jmf7A578NrvknZNJaC9o/u5CUmIkTh9NDDu/pEd+s7xlmmlySt
         Lx4mbEl1gti1eUuy2rFondwglBvv/FVUQ8eVDUXrjVq4cebSmaLYSXQN5PHqc1jevZ3R
         q5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911740; x=1743516540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjEJTGwVhUIjztw3KP/oH70yQTBLfj6JtyAZjLxBC88=;
        b=FE0URv+xd/lXIYqcq8aBhflU2DNC7Hu14Pqd+Xy0TXZbvgJQKoOg6jbBVWJxz31KUX
         Gw+xfEmUJfQXWwBtVaxSivijeblNu0HUPSZvNGfLiHn2x1w/dMsHgg4w+1IcHotjxNpQ
         nKzw2GojkdDtZYhB8OMWWGpf3fxLanr5anVFEMOz3shXNwJQbmJabexchprFAEacQKwj
         v4mVktrAr3gggeFHwyRLs+jMIFS1fzVtUIvkVM9ab+RNOP6BZoDr6E3ayJCfsP2fjJRE
         m8ML4duZxX+FN63McyEXPCtt3aV5BhwLtVQc+nbgzrVLkI7/EN6QWhZetF169KWIP+bh
         Aiow==
X-Gm-Message-State: AOJu0YzvcEMzcDJNaZ2L5rghhpxilMpe+A6BMU4itpvcPa05K+aR6hio
	Qdd9fkPTX+pAq4h4GmybJx3pjlZCCOi+G5zMMIwW4DoZ+3nnlN078zISy6roSZP15vkgaLB6JKw
	qYezQxCU2gWTp8796oV6xeOJB3qrezulqB0BHsA==
X-Gm-Gg: ASbGncvJIrJ4fU9Zy6mlaQfGyd8ZdOYlciwcOcpa9DoeEDFRwCexTh+VZ3GXOBg2hTC
	i47sTP18YPAh4HCZoqYJ/O/gBWTrdEEjidzJr+c0CWwhsQv1rvL9K1EritaGGN2Wwq0Ob2TO3h2
	/3gM+KI/y/ocdRyWAoqqkIYUuRhxsBNiekW1QVop38VlZcd6+R24kKVjCcrJc=
X-Google-Smtp-Source: AGHT+IGw6S5yD+IBHotmaDJyxDTPyEw6PJSg+VCpcrXJj7AIg+Xb8SZNfNEnKDculW6j0WN9hgtnb2ub6yP2QbppJec=
X-Received: by 2002:a05:6512:130e:b0:549:8f47:e67d with SMTP id
 2adb3069b0e04-54ad64f514amr6471396e87.34.1742911738644; Tue, 25 Mar 2025
 07:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
 <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com> <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 25 Mar 2025 15:08:47 +0100
X-Gm-Features: AQ5f1JoGtUqdWJbsEESSlI1H3F9eC50SxCsvdhJPefcOrqBa1h6p4DAHjABqL_M
Message-ID: <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

Thanks a lot for all the information.

>  Unlike `__r4k_wait' that code is not in a `.set noreorder' region and
> the assembler will therefore resolve the hazard by inserting a NOP where
> required by the architecture level requested (with `-march=3D...', etc.).
> Try compiling that function for a MIPS III configuration such as
> decstation_r4k_defconfig or just by hand with `-march=3Dmips3' and see
> what machine code is produced.

I tried with the configuration you suggested, and indeed I can see a NOP.

>  Whatever manual you quote it refers to MIPS Release 2, which is only
> dated 2003

About the MIPS manual, anyhow, it is "MIPS32 M4 Processor Core" (year 2008)=
.
Maybe I've also picked the wrong manual.

I've also found the manual you mentioned online, thanks.

>  Best is to avoid using a `.set noreorder' region in the first place.
> But is it really needed here?  Does the rollback area have to be of a
> hardcoded size rather than one calculated by the assembler based on
> actual machine code produced?  It seems to me having it calculated would
> reduce complexity here and let us use the EI instruction where available
> as well.

Well, considering the complexity and how the code looks fragile even with
a small change, yes, that's likely better to avoid noreorder.

I think I'm going to need some guidance here.
Please, correct me where something is wrong.

1)
When you say "let us use the EI instruction where available" are you
referring to do
something like below?

#if defined(CONFIG_CPU_HAS_DIEI)
ei
#else
MFC0    t0, CP0_STATUS
ori     t0, 0x1f
xori    t0, 0x1e
MTC0    t0, CP0_STATUS
#endif

2)
Removing "noreorder" would let the compiler add "nops" where they are neede=
d.
But that still means the 3 ssnop and ehb are still needed, right?

My subsequent dumb question is: there is the guarantee that the
compiler will not
reorder / change something we did?
This question also came after reading the manual you quoted (paragraph
"Coprocessor Hazards"):

"For example, after an mtc0 to the Status register which changes an
interrupt mask bit,
there will be two further instructions before the interrupt is
actually enabled or disabled.
[...]
To cope with these situations usually requires the programmer to take expli=
cit
action to prevent the assembler from scheduling inappropriate
instructions after a
dangerous mtc0. This is done by using the .set noreorder directive,
discussed below"

3)
Considering the size is determined by the compiler, the check about
the idle interrupt
size region should not be needed, correct?

4)
ori and PTR_ADDIU should be removed of course from the rollback handler mac=
ro.
Can I have some hints about the needed change?
Using QEMU is always working, so I'm not sure if what I will change is
also correct.


Many thanks in advance, also for your time!




On Fri, Mar 21, 2025 at 9:11=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Fri, 21 Mar 2025, Marco Crivellari wrote:
>
> > >  This instruction sequence still suffers from the coprocessor move de=
lay
> > > hazard.  How many times do I need to request to get it fixed (countin=
g
> > > three so far)?
> >
> > Can I have more details about this?
> >
> > I can see it is the same code present also in local_irq_enable()
> > (arch_local_irq_enable()),
>
>  Unlike `__r4k_wait' that code is not in a `.set noreorder' region and
> the assembler will therefore resolve the hazard by inserting a NOP where
> required by the architecture level requested (with `-march=3D...', etc.).
> Try compiling that function for a MIPS III configuration such as
> decstation_r4k_defconfig or just by hand with `-march=3Dmips3' and see
> what machine code is produced.
>
> > and from the manual I've seen:
> >
> > "The Spacing column shown in Table 2.6 and Table 2.7 indicates the
> > number of unrelated instructions (such as NOPs or SSNOPs) that,
> > prior to the capabilities of Release 2, would need to be placed
> > between the producer and consumer of the hazard in order to ensure
> > that the effects of the first instruction are seen by the second instru=
ction."
> >
> > The "Spacing column" value is 3, indeed.
> >
> > "With the hazard elimination instructions available in Release 2, the
> > preferred method to eliminate hazards is to place one of the
> > instructions listed in Table 2.8 between the producer and consumer of t=
he
> > hazard. Execution hazards can be removed by using the EHB [...]"
>
>  Whatever manual you quote it refers to MIPS Release 2, which is only
> dated 2003 (following Release 1 from 2001), but `__r4k_wait' has to
> continue handling older architecture revisions going back to MIPS III
> ISA from 1991.  We also support MIPS I ISA from 1985 which has further
> instruction scheduling requirements, but `__r4k_wait' is for newer
> processors only, because older ones had no WAIT instruction, so we can
> ignore them (but note that the MIPS I load delay slot is regardless
> observed in current code in the form of a NOP inserted after LONG_L).
>
> > What am I missing?
>
>  This is common MIPS knowledge really, encoded in the GNU toolchain and
> especially GAS since forever.  While I can't cite a canonical reference,
> the hazard is listed e.g. in Table 13.1 "Instructions with scheduling
> implications" and Table 13.3 "R4xxx/R5000 Coprocessor 0 Hazards" from
> "IDT MIPS Microprocessor Family Software Reference Manual," Version 2.0,
> from October 1996.  I do believe the document is available online.
>
>  I'm fairly sure the hazard is also listed there in Dominic Sweetman's
> "See MIPS Run Linux," but I don't have my copy handy right now.
>
>  Best is to avoid using a `.set noreorder' region in the first place.
> But is it really needed here?  Does the rollback area have to be of a
> hardcoded size rather than one calculated by the assembler based on
> actual machine code produced?  It seems to me having it calculated would
> reduce complexity here and let us use the EI instruction where available
> as well.
>
>  HTH,
>
>   Maciej



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

