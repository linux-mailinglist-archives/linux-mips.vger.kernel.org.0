Return-Path: <linux-mips+bounces-8369-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A475FA7140D
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 10:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE2AD18989B4
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 09:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1263A1ADC7C;
	Wed, 26 Mar 2025 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dS0IZ9JA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E11ACED7
	for <linux-mips@vger.kernel.org>; Wed, 26 Mar 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982385; cv=none; b=iVNH+2TzyGFaAwTSit7VKJ//ndaCCT+DHxkNWB3JD0+6wSkN5iCviZOnAbqpXGaLqZ/t04hL8YxEkU/p6lKnTE0JBfMi54pqmh9g31LEExpX72egh7PCTY7G1jmfpcu6tNNF4SH6Rdle4S0tEAylBnpFki1IUyUQFRFwGrzZvaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982385; c=relaxed/simple;
	bh=OLm2NDU+f3fxSPefoFTu44hZydq90XpR5rmarbi++1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nty/WmdTEjeLGbC4FoIk5RLdp1VE05WnEZHQ99aC/e6IT9HC5o5qO5wFnckqqeJlX3aH5HrTlUwdlszyvJsGnmZGy6SvJXR3DuQoRLoY7iGhSrb7rtg78rG/mIxlURsi6mWZ+t4f/dFAU3H5uwCkjjvs1dzKIrtD2hUj3tPNngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dS0IZ9JA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54963160818so7734274e87.2
        for <linux-mips@vger.kernel.org>; Wed, 26 Mar 2025 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742982381; x=1743587181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di4HbPtps/vZaIVsnnfkU3gBNA4h8hopxZA5u72GX94=;
        b=dS0IZ9JA4tOyAmdNrYzliuLUPDpz/lr1/+8w02mF3SwZ3yOdcua7RQ98HAJ7IJPkUv
         BI20xclbZEwCcwlv4h0kQnSRQDCpRJguSpjnRLitjqIa2aJ8yWqU6Dj6rnpU/Nrkacuu
         mJKHbRX4zR38k8RQtrmV93Apv6KQa2Z7QVSkDP/nMfOxeZhnaCspSSdIIGmB4jlEox9c
         fI7ZrQmIGbSxiFUp2LyrTClnOlahl9HK800FsqA03purr8g8qMbG7E1u4gErgHZ2hKVS
         YXr/M4a3JYHI1pcYTX488bUUMF+DWO5Y565v2PkOalq8Y75RiG/aDm75DjltooIHcYQZ
         lwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982381; x=1743587181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Di4HbPtps/vZaIVsnnfkU3gBNA4h8hopxZA5u72GX94=;
        b=akK/q5J08zHmJVxhRhgfJucVWuKuQC76C47pVR0kEMLOXmOnlsHWxwCQxl6Csu2j5o
         D5PZLv3QUJYXSNwELO43oOXChmo4/NJg5pjUxbYnuFCSpK0AXY7aJvtjwSWNW8E/EpGo
         cBEbKhyovyDi2qspBIKeordIurO5+mrZWRYe17pqhwncSPCysWydUeZkUrM8BdtIxY1S
         ZnDwkbVgGXGIJfRrzEoOr2CqYw+wy9UEKf5aOPLRW4C4q7B7AoWQ+7HJYFQdhDXBpHus
         v2k40CSzeWzwwSTyQaC3/xZPV1V0L04fOpXhh9wuiKVlVPd/6K7ec1XhgRxsZZIo1NRV
         3d4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUF/k/Eu/+HriwlftCiPOS9voe/oYccarRzRaiAbeOatQCH92n1d4g2ttN4Tih2ezRqI+34DpVqb254@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CxITJB7lKmCu9N4dm0unOGkYjukLKmPkw2TgZahOIQ1QTRl9
	z7nD7y6f2XhN72ILAhst4Yd2CYzxMDuk7apQwRkGrmBJmhQJ0QwHKcDuv3aWR67yQbfOpWjW7t4
	heaO12sy9cQ1dqYVb3tDDVs/ECRdw2sAjdrf+ZQ==
X-Gm-Gg: ASbGncuf9y7fNT6wHS6ndG87WicUmFJDeEzVDpE+pvu4+gkdOkQnL7TgXhunVjjbfIh
	6W/vWLtZh4ryL3xHZ1T9tXmc7M+++RlFzlPcCImxrOemZ0pQpeXqQ/AC30pm4YIwaEes9RMUHW/
	P7OYl2R/ZVfQy+buIEV0hXlmjfvmvk/EnpCSQSZqiy2dvA56+dVCn3GjYYA00=
X-Google-Smtp-Source: AGHT+IFFoqICBg3/2VlFm+oUDxj2X0WGExTZw7EWBYX1rt0NOmB23EDYayRfmPwBbL9bypFP4W+JtgajlnNNmmIMpKo=
X-Received: by 2002:a05:6512:1105:b0:549:7145:5d28 with SMTP id
 2adb3069b0e04-54ad6492e6dmr5623522e87.25.1742982380428; Wed, 26 Mar 2025
 02:46:20 -0700 (PDT)
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
 <CAAhV-H7Tko290LSCJPuVFE2qds81N4C=8RPz4edC-xddFvZGjA@mail.gmail.com>
In-Reply-To: <CAAhV-H7Tko290LSCJPuVFE2qds81N4C=8RPz4edC-xddFvZGjA@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 26 Mar 2025 10:46:08 +0100
X-Gm-Features: AQ5f1JpgTQ1SqmyR3a5xmBD_8Mo146X-iNLNkrJ8C_qhiyfg-2DRPNGOh7-zOw8
Message-ID: <CAAofZF52_yKcpd+GBE9ygggeNTOVQDP7AKau5xZE+N4fHGCgSQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: Huacai Chen <chenhuacai@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm mostly thinking about future changes in this part of the code.
But if it is ok what we have now, and future changes are not a
problem, let's keep this version.

Would this be ok with you @Maciej?

If so, the region is now 40 bytes. This is what I did yesterday:

@@ -110,6 +110,7 @@ LEAF(__r4k_wait)
       .set    noreorder
       /* Start of idle interrupt region. */
       MFC0    t0, CP0_STATUS
+       nop
       /* Enable interrupt. */
       ori     t0, 0x1f
       xori    t0, 0x1e
@@ -128,7 +129,11 @@ LEAF(__r4k_wait)
        */
       wait
       /* End of idle interrupt region. */
-1:
+__r4k_wait_exit:
+       /* Check idle interrupt region size. */
+       .if ((__r4k_wait_exit - __r4k_wait) !=3D 40)
+       .error  "Idle interrupt region size mismatch: expected 40 bytes."
+       .endif
       jr      ra
        nop
       .set    pop
@@ -139,10 +144,10 @@ LEAF(__r4k_wait)
       .set    push
       .set    noat
       MFC0    k0, CP0_EPC
-       PTR_LA  k1, 1b
-       /* 36 byte idle interrupt region. */
+       PTR_LA  k1, __r4k_wait_exit
+       /* 40 byte idle interrupt region. */
       ori     k0, 0x1f
-       PTR_ADDIU       k0, 5
+       PTR_ADDIU       k0, 9
       bne     k0, k1, \handler
       MTC0    k0, CP0_EPC
       .set pop

Under QEMU is working, but I'm not so sure the latest part is correct.

Thanks!



On Wed, Mar 26, 2025 at 2:20=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Tue, Mar 25, 2025 at 10:09=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
> > Hi Maciej,
> >
> > Thanks a lot for all the information.
> >
> > >  Unlike `__r4k_wait' that code is not in a `.set noreorder' region an=
d
> > > the assembler will therefore resolve the hazard by inserting a NOP wh=
ere
> > > required by the architecture level requested (with `-march=3D...', et=
c.).
> > > Try compiling that function for a MIPS III configuration such as
> > > decstation_r4k_defconfig or just by hand with `-march=3Dmips3' and se=
e
> > > what machine code is produced.
> >
> > I tried with the configuration you suggested, and indeed I can see a NO=
P.
> >
> > >  Whatever manual you quote it refers to MIPS Release 2, which is only
> > > dated 2003
> >
> > About the MIPS manual, anyhow, it is "MIPS32 M4 Processor Core" (year 2=
008).
> > Maybe I've also picked the wrong manual.
> >
> > I've also found the manual you mentioned online, thanks.
> >
> > >  Best is to avoid using a `.set noreorder' region in the first place.
> > > But is it really needed here?  Does the rollback area have to be of a
> > > hardcoded size rather than one calculated by the assembler based on
> > > actual machine code produced?  It seems to me having it calculated wo=
uld
> > > reduce complexity here and let us use the EI instruction where availa=
ble
> > > as well.
> >
> > Well, considering the complexity and how the code looks fragile even wi=
th
> > a small change, yes, that's likely better to avoid noreorder.
> In my opinion keeping "noreorder" is the simplest, which means just
> add an "nop" after MFC0 in the current version.
>
> Huacai
>
> >
> > I think I'm going to need some guidance here.
> > Please, correct me where something is wrong.
> >
> > 1)
> > When you say "let us use the EI instruction where available" are you
> > referring to do
> > something like below?
> >
> > #if defined(CONFIG_CPU_HAS_DIEI)
> > ei
> > #else
> > MFC0    t0, CP0_STATUS
> > ori     t0, 0x1f
> > xori    t0, 0x1e
> > MTC0    t0, CP0_STATUS
> > #endif
> >
> > 2)
> > Removing "noreorder" would let the compiler add "nops" where they are n=
eeded.
> > But that still means the 3 ssnop and ehb are still needed, right?
> >
> > My subsequent dumb question is: there is the guarantee that the
> > compiler will not
> > reorder / change something we did?
> > This question also came after reading the manual you quoted (paragraph
> > "Coprocessor Hazards"):
> >
> > "For example, after an mtc0 to the Status register which changes an
> > interrupt mask bit,
> > there will be two further instructions before the interrupt is
> > actually enabled or disabled.
> > [...]
> > To cope with these situations usually requires the programmer to take e=
xplicit
> > action to prevent the assembler from scheduling inappropriate
> > instructions after a
> > dangerous mtc0. This is done by using the .set noreorder directive,
> > discussed below"
> >
> > 3)
> > Considering the size is determined by the compiler, the check about
> > the idle interrupt
> > size region should not be needed, correct?
> >
> > 4)
> > ori and PTR_ADDIU should be removed of course from the rollback handler=
 macro.
> > Can I have some hints about the needed change?
> > Using QEMU is always working, so I'm not sure if what I will change is
> > also correct.
> >
> >
> > Many thanks in advance, also for your time!
> >
> >
> >
> >
> > On Fri, Mar 21, 2025 at 9:11=E2=80=AFPM Maciej W. Rozycki <macro@orcam.=
me.uk> wrote:
> > >
> > > On Fri, 21 Mar 2025, Marco Crivellari wrote:
> > >
> > > > >  This instruction sequence still suffers from the coprocessor mov=
e delay
> > > > > hazard.  How many times do I need to request to get it fixed (cou=
nting
> > > > > three so far)?
> > > >
> > > > Can I have more details about this?
> > > >
> > > > I can see it is the same code present also in local_irq_enable()
> > > > (arch_local_irq_enable()),
> > >
> > >  Unlike `__r4k_wait' that code is not in a `.set noreorder' region an=
d
> > > the assembler will therefore resolve the hazard by inserting a NOP wh=
ere
> > > required by the architecture level requested (with `-march=3D...', et=
c.).
> > > Try compiling that function for a MIPS III configuration such as
> > > decstation_r4k_defconfig or just by hand with `-march=3Dmips3' and se=
e
> > > what machine code is produced.
> > >
> > > > and from the manual I've seen:
> > > >
> > > > "The Spacing column shown in Table 2.6 and Table 2.7 indicates the
> > > > number of unrelated instructions (such as NOPs or SSNOPs) that,
> > > > prior to the capabilities of Release 2, would need to be placed
> > > > between the producer and consumer of the hazard in order to ensure
> > > > that the effects of the first instruction are seen by the second in=
struction."
> > > >
> > > > The "Spacing column" value is 3, indeed.
> > > >
> > > > "With the hazard elimination instructions available in Release 2, t=
he
> > > > preferred method to eliminate hazards is to place one of the
> > > > instructions listed in Table 2.8 between the producer and consumer =
of the
> > > > hazard. Execution hazards can be removed by using the EHB [...]"
> > >
> > >  Whatever manual you quote it refers to MIPS Release 2, which is only
> > > dated 2003 (following Release 1 from 2001), but `__r4k_wait' has to
> > > continue handling older architecture revisions going back to MIPS III
> > > ISA from 1991.  We also support MIPS I ISA from 1985 which has furthe=
r
> > > instruction scheduling requirements, but `__r4k_wait' is for newer
> > > processors only, because older ones had no WAIT instruction, so we ca=
n
> > > ignore them (but note that the MIPS I load delay slot is regardless
> > > observed in current code in the form of a NOP inserted after LONG_L).
> > >
> > > > What am I missing?
> > >
> > >  This is common MIPS knowledge really, encoded in the GNU toolchain a=
nd
> > > especially GAS since forever.  While I can't cite a canonical referen=
ce,
> > > the hazard is listed e.g. in Table 13.1 "Instructions with scheduling
> > > implications" and Table 13.3 "R4xxx/R5000 Coprocessor 0 Hazards" from
> > > "IDT MIPS Microprocessor Family Software Reference Manual," Version 2=
.0,
> > > from October 1996.  I do believe the document is available online.
> > >
> > >  I'm fairly sure the hazard is also listed there in Dominic Sweetman'=
s
> > > "See MIPS Run Linux," but I don't have my copy handy right now.
> > >
> > >  Best is to avoid using a `.set noreorder' region in the first place.
> > > But is it really needed here?  Does the rollback area have to be of a
> > > hardcoded size rather than one calculated by the assembler based on
> > > actual machine code produced?  It seems to me having it calculated wo=
uld
> > > reduce complexity here and let us use the EI instruction where availa=
ble
> > > as well.
> > >
> > >  HTH,
> > >
> > >   Maciej
> >
> >
> >
> > --
> >
> > Marco Crivellari
> >
> > L3 Support Engineer, Technology & Product
> >
> >
> >
> >
> > marco.crivellari@suse.com



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

