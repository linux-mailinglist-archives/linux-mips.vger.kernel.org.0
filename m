Return-Path: <linux-mips+bounces-4333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 077BD93188F
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 18:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CACB1F2252E
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2024 16:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32E01C6A0;
	Mon, 15 Jul 2024 16:38:22 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED041B947;
	Mon, 15 Jul 2024 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061502; cv=none; b=bwKgVTeSxjoEOe7dHlqGMVqhAbcLTlah9QZZ1/yS5kYxTpA+GguTyMvURlGHG6BtSfKnoBoj8nnvNkDqlgYAzFTuGIcUEd+pzTpaVVyryMzCvj4au2PZ51HiSAYDOmaO0lE7h0hq86Fnl1zCKp9l1naDGSmknlMpSmWe5J+wCVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061502; c=relaxed/simple;
	bh=qgu/lqYAbsMY3Y/CR7P9kueQ+mkWNglW5jmKaUpiKvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sybipmr/AOxG4AVnh2kZMxA1w32TYxJtHE0DCETYJN4r7LjA5tyCUAzCfMuf+zXI4VKnfi0555d9/63fka+l4aErwRjmRd1xiOmyh8KUt9xTc5sywiQCIVZQM2FXaJp135vM0MQSYQfDTI1pZblbOrxYU9dg1XMLMqJQD9M4UzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e03a8955ae3so4321537276.1;
        Mon, 15 Jul 2024 09:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061500; x=1721666300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCfzf+ZYr6fSEcwCU6k1QzgjmW+yoSht8cV8vDR8q08=;
        b=WOIddJhQ+CCxKcLVsnfVlrzCHG12LZ7FFDW4q9dIGW9EkLO3Eq99zOHqvUO3/H8tVI
         z6eMIOXCphXxSvRVoytgBxtJ7jq8sJX7bltpuurbpu5H/Bj98dzV6sctqnnNlTBHd9bb
         E4M/tv/US5d9pq25TkR/gn+s+FrmgJSt8yyT1akCXxl7gR6VcCRzgz+p4+ZaaTUo3WLx
         ATRfhgNuZOOWvZMd89VRD7hXhVxPwMFnTRIZfVKVn/MH/7nUmgiPKPWGTt6zt0N3k4nG
         mHb6TWbM5JwV126ZyzTug7XSkq5x5giHZvo5XAqn1HSWrbok6VzFrAFKK1IDZ72NeTWB
         BTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ib2Qmob+fiSsfgAHoDrh+jumD18QAVltRMcWQkU7Qqyb9kpwH2tAOjF1JqP69gbuZkV8B3HIjqR0NDh7RoEdA7gUJEf0oxkit4Z96hmoPOUUXpe0RixhgmfkHCU+RCqBOE9tE3V26agQE7+coReP3BAqyigyPAyC/fVWI2NN3VVmSg==
X-Gm-Message-State: AOJu0Yz18Hr49e0wpxoEgYVMk2IAFj7SbHc5aDg28zaNgAXZ3HOuSaQp
	PrJlpby0iIVdUuqNn97HWjyZPbUGY6rE/ADtFPS6Oe1dkpNxdW6BDHWre6Vbnydwb4/RFmGutyq
	inm7Avg5Qtnbg3g2cx5syRdQoCM0=
X-Google-Smtp-Source: AGHT+IHO3MFh0Zcrn7/0Ez1ZK0BiKXuuGpYtz6OSAt++roYQ1HSLajvoAdDxIfBC3vp6Cxha1htLluUOJucczWkgPy8=
X-Received: by 2002:a05:6902:c01:b0:e03:a1e4:441c with SMTP id
 3f1490d57ef6-e05d3abf469mr140440276.16.1721061499918; Mon, 15 Jul 2024
 09:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de> <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk> <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de> <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
 <Zo457UgAkhbAgm2R@alpha.franken.de> <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk>
 <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com> <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk>
 <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com> <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk>
 <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com> <alpine.DEB.2.21.2407150225310.58077@angie.orcam.me.uk>
 <ac94941f-3ac3-4820-b94d-aeb72a7a7a5c@app.fastmail.com> <alpine.DEB.2.21.2407151422040.51207@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2407151422040.51207@angie.orcam.me.uk>
From: YunQiang Su <syq@debian.org>
Date: Tue, 16 Jul 2024 00:38:08 +0800
Message-ID: <CAKcpw6UNM2xNw7vXhTSSq-bZ+TO_0Yy=frPtE3N4sZkNUSio1A@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Nick Clifton <nickc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maciej W. Rozycki <macro@orcam.me.uk> =E4=BA=8E2024=E5=B9=B47=E6=9C=8815=E6=
=97=A5=E5=91=A8=E4=B8=80 22:02=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 15 Jul 2024, Jiaxun Yang wrote:
>
> > >  I don't know what prctl(2) has to do with this.  If you don't implem=
ent
> > > this part, then your change will cause Linux to behave inconsistently=
 and
> > > therefore I'll have to NAK it.
> >
> > I think your concern was regarding user space application needs to set =
NaN2008 bits
> > at runtime?
>
>  Nope, following the objective of your change: the EF_MIPS_NAN2008 ELF
> file header flag instructs the kernel to choose between hardware and
> emulated hard float and that's not supposed to change later on throughout
> the life of the program, because it's not something the program can do
> itself, because writes to FCSR.NAN2008 are ignored by hardware.  And it's
> not a functional regression, because flipping FCSR.NAN2008 isn't allowed
> by hardware concerned anyway, we just want to have it consistent includin=
g
> the debugger interface.
>
> > >  It's not much to do anyway, as I have prepared `ptrace_setfcr31' alr=
eady
> > > to handle masking correctly, so all you have to do is to set the mask=
 as
> > > required for the right thing to happen.  I shouldn't have needed to p=
oint
> > > you at it though, as that code is easy to find.
> >
> > I think I got your point, will try to implement it.
>
>  Thank you.
>
> > >  This doesn't matter either, as your change only addresses the case w=
here
> > > FCSR.NAN2008 isn't writable anyway, which is the sole reason you want=
 to
> > > switch between native hard float support and emulation, doesn't it?
> > >
> > >  In fact where FCSR.NAN2008 is writable your new mode has to be equiv=
alent
> > > to "ieee754=3Dstrict", because then there is no need to trigger emula=
tion
> > > for either NaN mode.  Please do verify that this is the case.
> >
> > This had been verified with perf math-emu counters to ensure no unneces=
sary emulation
> > is triggered.
>
>  Thanks.
>
> > >  That doesn't matter for us here (and I have a bad suspicion anyway),=
 but
> > > the Debian team is of course free to do what they want here, the GNU =
GPL
> > > applies.
> >
> > We care about our downstream users, don't we?
>
>  There is a balance for us to keep.  Requests made have to be reasonable
> and code contributed has to be architected well and meet quality criteria=
.
> Every change carries its associated cost and especially with the limited
> manpower available we can't afford having a technical debt created.  Any
> unclean piece of code accepted will strike us back sooner or later.
>
> > They asked me to help and that was my solution. I sincerely want to get=
 this change upstreamed
> > to cover some downstream use cases.
>
>  If it's your own genuine from-scratch implementation, then I have more
> faith in it.
>
> > I don't know what theory do you have here, but that's all stories behin=
d.
>
>  I have seen odd requests and code changes stemming from embarassing lack
> of understanding how things work with the MIPS architecture.
>

I won't think that your reply makes any sense since you have a typo here.  =
;)

There is nothing in the world perfect I guess, while we need to
continue our life
and there are always new problems needing to be solved in our life.

Once the problem happens, we need a solution for it.
I think that a solution is a good one if it
    won't break something more
    we cannot forecast it will break something more in future
    It won't be very hard to rollback or drop it in future

I don't think that it is a good behavioral pattern to say "let's
destroy the world
since it is not perfect".  Anyway we live in a world full of tradeoffs.

> > >  And also they can always use the "nofpu" kernel parameter to run the=
ir
> > > verification.  I used it for mine back at ImgTec before 2008 NaN hard=
ware
> > > was available, also to verify emulation, which I wrote too.  Perhaps =
that
> > > is also the right solution for Debian actually?
> >
> > I'll suggest to them, thanks.
>
>  I note that it's been like this since 2015 and it has been documented:
>
>         ieee754=3D        [MIPS] Select IEEE Std 754 conformance mode
>                         Format: { strict | legacy | 2008 | relaxed }
>                         Default: strict
> [...]
>                         The FPU emulator is always able to support both N=
aN
>                         encodings, so if no FPU hardware is present or it=
 has
>                         been disabled with 'nofpu', then the settings of
>                         'legacy' and '2008' strap the emulator accordingl=
y,
>                         'relaxed' straps the emulator for both legacy-NaN=
 and
>                         2008-NaN, whereas 'strict' enables legacy-NaN onl=
y on
>                         legacy processors and both NaN encodings on MIPS3=
2 or
>                         MIPS64 CPUs.
>
> (see the part following the last comma in particular).  It usually makes
> sense to read documentation and I'd expect MIPS Debian port experts to do
> it from time to time.
>
>   Maciej
>

