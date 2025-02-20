Return-Path: <linux-mips+bounces-7879-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED047A3D579
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2025 10:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715573B1591
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2025 09:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804F31EE7C4;
	Thu, 20 Feb 2025 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S0PgP5/o"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678291E5B9D
	for <linux-mips@vger.kernel.org>; Thu, 20 Feb 2025 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045149; cv=none; b=mYTiGKREhSYJhXW0drb/v7eFHdL1Ab+udPcPFWyP52P9R38o9+fif5NYgkeGMhq8WBI2mpxG8iD5gg2ymouaMy/HLb9YqOFrO4+uQNOmPKN7X2Ze/Mu/kx7Gtby4AhTtJjTdYr6a/jbgYlmAkzt5MLj1+cqO5AX5uZBzLFiThuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045149; c=relaxed/simple;
	bh=Avox+9aYAAKMeIOQ9gNoIDG7HYxbANJiD1j9EPevwQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzGhpXFLSzJzkNcFT7PptZxmT83hqsNAMxvsqtdIPqLIinaMHyjIA/40PgxgZVixz1L1C1eaTPaesRPJy+mIYGO+/MIK1tt0yg2+xpUqUsFzU+yxXddwMw+16j6QZkZ0DxdAYIsMx0mKtD1Rx1PVX5oRJZObje8EncfAtWWMJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S0PgP5/o; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so852701e87.1
        for <linux-mips@vger.kernel.org>; Thu, 20 Feb 2025 01:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740045144; x=1740649944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE4jG7N6H3Izke338DenNbafdjP4bLAo7XRV2ASpmTA=;
        b=S0PgP5/otRmyRqofhofSHr5OiirVfK1jsyodoXEQ4hm/9axwqhP+kGYjV9252AeMzZ
         BnmjSVqMl7grWK9B1YBAeQ111+76FvbytEFxi/XtQVMXH8tNK7Yjv+2MOBSKwl7YXVUy
         ll4YHNCuEU9xFgjVm0om5S2bow18ihRFVCXBQFv0YbH/m9Fy05la7+E51ts6A75KmZYk
         MflRDGMKcr19PfLh79SRWaUI9SJCJLgd84pD4nsCgCLY+4XD5Yo3mwOz53MSXQURn5gK
         Lrr/en/A1OBjXN6wVA5nVT0la+kHhlSbbTKphS+lu6O2jSjVcuROBYORP7h6xoyCWIz1
         CL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740045144; x=1740649944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kE4jG7N6H3Izke338DenNbafdjP4bLAo7XRV2ASpmTA=;
        b=b1FTdPRcVLAE5lVgfm7tH8yV05KfTVMk98dGHxPw0+Gx/oa3/7/uGq5XPqekqUnLF6
         PX0sWNK2tv14o+PDyhdG2Xu6h31iHCyVyzV8lqLs/TMMbY0Z0PC4Ij3LfD6yacOGatsY
         82za0+wvN5uuLSBtcSYVUBAcLm3Km0uD3fP2Z41Q1wLQbMJSwZtnuIp9DuKBlpmKZTkB
         zV4pqYKI5yOeY/tVMu7T2UP28p8W9l1+bc5pFSYsYMUSVxDe3HKtTNgslYZaXlRgLi5a
         jdMwqqOQTbvGv1e3is9KVCCSuVwRO+knP/7dswrwx5laS4bBM/cx/Q+mR3kbzGlDzNv8
         l8zg==
X-Forwarded-Encrypted: i=1; AJvYcCXXztJ93TJw+TuWAs99XhhAn+t9HXuF4BMCF69Uy+Z6VBnW1VKEtZI5W4iLUZUqdmtaN8LdPXW9ZTov@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3nnqGdClazimlRZ2ScRjLnnCouS0KGDBmYbfgI1gc4cofIxTV
	+Mxas2rhDQfcs5j6o0lOhoGpb7EvKWPrU7HjgmeKB0FZPT73UuUgqhLHOhMZjZzekBUH0c76CDe
	5xN/+j3ISXGXuXsiLvf2iJmCTW3CQdm+y+eGiEwwRXqkkbU9AvSA=
X-Gm-Gg: ASbGnct7bw/N2sCzVuM25vYRvBMMYNbVYaCSmRetfY3cS8Kzdn/OPAHhR5V7lIJu5ef
	q5o9pZXtkJbfGdv6HIP1wyPZmR96WdFJ+nFAcsPIrDGaSN3BQ1R94+6oQADnq+qjoYWECLDdz4s
	RuhjXXGM28g8oDdussbeMZhRXWFUYY7Q==
X-Google-Smtp-Source: AGHT+IGr8YvHEETsNyvTWOQRFut/UUXdenIoZDJncYUJi3iUiyBB5rGYcnt+ccguPMxQB11np4EyftCfzIKctruTiaQ=
X-Received: by 2002:a05:6512:3052:b0:542:9757:d5df with SMTP id
 2adb3069b0e04-5462eee68d1mr2494309e87.21.1740045144302; Thu, 20 Feb 2025
 01:52:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218090203.43137-1-marco.crivellari@suse.com>
 <20250218090203.43137-2-marco.crivellari@suse.com> <Z7R2GqWOufd8l6NZ@alpha.franken.de>
 <CAAhV-H7ygGqCYyQf_tvFrgEBR6uva35auGP9yhxQFqw4mpQBwA@mail.gmail.com>
 <Z7SQNhL0FYGkX0Ng@alpha.franken.de> <alpine.DEB.2.21.2502181447490.65342@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2502181447490.65342@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 20 Feb 2025 10:52:13 +0100
X-Gm-Features: AWEUYZn22_LXgOCkEjqLvRN9aQTb8m1zBAPf5m_hMLKPPZMKxzotLtaTM-ZcKss
Message-ID: <CAAofZF6VppnQZXMj59o=QDCMbw9GV=6sMRoNWnpWn+mBpE0egg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the late reply.

> Umm, there's the commit description to document justification for such
>changes made and it's not the reviewer's duty to chase every such detail
>that has been omitted from a submission.
>
 >FAOD this is a request to include this detail in v3.

How does it sound integrate the v3 commit message with:

CONFIG_CPU_MICROMIPS has been removed along with the nop instructions.
There, NOPs are 2 byte in size, so change the code with 3 _ssnop which are
always 4 byte and remove the ifdef. Added ehb to make sure the hazard
is always cleared.

something more accurate to suggest?

Thank you

On Tue, Feb 18, 2025 at 4:23=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Tue, 18 Feb 2025, Thomas Bogendoerfer wrote:
>
> > > > > diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> > > > > index a572ce36a24f..9747b216648f 100644
> > > > > --- a/arch/mips/kernel/genex.S
> > > > > +++ b/arch/mips/kernel/genex.S
> > > > > @@ -104,25 +104,27 @@ handle_vcei:
> > > > >
> > > > >       __FINIT
> > > > >
> > > > > -     .align  5       /* 32 byte rollback region */
> > > > > +     .align  5
> > > > >  LEAF(__r4k_wait)
> > > > >       .set    push
> > > > >       .set    noreorder
> > > > > -     /* start of rollback region */
> > > > > -     LONG_L  t0, TI_FLAGS($28)
> > > > > -     nop
> > > > > -     andi    t0, _TIF_NEED_RESCHED
> > > > > -     bnez    t0, 1f
> > > > > -      nop
> > > > > -     nop
> > > > > -     nop
> > > > > -#ifdef CONFIG_CPU_MICROMIPS
> > > > > -     nop
> > > > > -     nop
> > > > > -     nop
> > > > > -     nop
> > > > > -#endif
> > > >
> > > > My quick search didnn't find the reason for the extra NOPs on MICRO=
MIPS, but
> > > > they are here for a purpose. I might still need them...
> > > The original code needs #ifdef CONFIG_CPU_MICROMIPS because nop in
> > > MICROMIPS is 2 bytes, so need another four nop to align. But _ssnop i=
s
> > > always 4 bytes, so we can remove #ifdefs.
> >
> > ic
>
>  This was wrong anyway (and I had arguments about it with people back in
> the time, but it was a hopeless battle).  Instead `.align ...' or an
> equivalent pseudo-op (`.balign', etc.) should have been used, removing th=
e
> fragility of this piece or the need for CONFIG_CPU_MICROMIPS conditional.
> Here and in other places.
>
> > > > > +     _ssnop
> > > > > +     _ssnop
> > > > > +     _ssnop
> > > >
> > > > instead of handcoded hazard nops, use __irq_enable_hazard for that
> > > No, I don't think so, this region should make sure be 32 bytes on eac=
h
> > > platform, but __irq_enable_hazard is not consistent, 3 _ssnop is the
> > > fallback implementation but available for all MIPS.
> >
> > you are right for most cases, but there is one case
> >
> > #elif (defined(CONFIG_CPU_MIPSR1) && !defined(CONFIG_MIPS_ALCHEMY)) || =
\
> >         defined(CONFIG_CPU_BMIPS)
> >
> > which uses
> >
> > #define __irq_enable_hazard                                            =
 \
> >         ___ssnop;                                                      =
 \
> >         ___ssnop;                                                      =
 \
> >         ___ssnop;                                                      =
 \
> >         ___ehb
> >
> > if MIPSR1 || BMIPS needs "rollback" handler 3 ssnnop would be wrong as
> > irq enable hazard.
>
>  Indeed, EHB must always be included, because for R2+ CPUs SSNOP doesn't
> clear the hazard (it never clears, but with earlier CPUs it just stalls
> the pipeline long enough for the hazard to eventually clear by itself).
>
> > > > But I doubt this works, because the wait instruction is not aligned=
 to
> > > > a 32 byte boundary, but the code assuemes this, IMHO.
> > > Why? After this patch we only use 4 byte instructions.
> >
> > I've should have looked at the compiled output, sorry for the noise
>
>  Umm, there's the commit description to document justification for such
> changes made and it's not the reviewer's duty to chase every such detail
> that has been omitted from a submission.
>
>  FAOD this is a request to include this detail in v3.
>
> > Still this construct feels rather fragile.
>
>  I think `.align', etc. can still be used to ensure enough space has been
> consumed and if you want to make a code sequence's size check, then a
> piece such as:
>
> 0:
>         nop
>         nop
>         nop
>         nop
> 1:
>         .ifne   1b - 0b - 32
>         .error  "code consistency verification failure"
>         .endif
>
> should do even where alignment does not matter.  And you could possibly d=
o
> smarter stuff with `.rept' if (1b - 0b) turns out below rather than above
> the threshold required, but I'm leaving it as an exercise for the reader.
>
>   Maciej



--=20

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

