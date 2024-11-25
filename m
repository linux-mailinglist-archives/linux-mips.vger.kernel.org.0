Return-Path: <linux-mips+bounces-6795-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC89D8C69
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2024 19:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF23D169DB1
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2024 18:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122181B982C;
	Mon, 25 Nov 2024 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iXWQXGW9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09F1B415F
	for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 18:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560503; cv=none; b=Ow2S2KJbRuATftQS49a8EmbZZQVi+JwedollQZGURaO9IOB7lBoLQB8dkSIf6qqxaek+HFjRhmynXK0pXUmom6rxBws++4e8QkQ4gKWVL8abzeACS1n7c7I7Ee8iOmLiCGAQ8KpcipIOgnw+3+6/LJuR/rqOJjdTHzFxXPMZ9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560503; c=relaxed/simple;
	bh=o0LAhU0U8nC7QUJI8ywMMY9AbpnQ1yZpDdqBR+ACi7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjTxrF2FfNC0jPdxp2x71qQ58HLId+QU5D8OXN0HcNvob+tMzUey3coR6yxuI5pCrU7bC1DzcA8xxOge02O97jh4KFRoxVVgLZva8SvDyykT80QIbkjOsZveC5Ofv3J/apwz2A+33+VMYXM6HD3vWRzMxT16Bx1bwXUywG5wh/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iXWQXGW9; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4635b03a3cdso10021cf.1
        for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 10:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732560499; x=1733165299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1R1Jcugf3q9SkQGyzKFZdgHWnoNvKou2YarOZUBQQ4=;
        b=iXWQXGW94cGp3bY98cOfAg1duHSCJ2ZNvNYxrvWlLt+0ZcVvCGOZnQ5XSK0CWcVi83
         d6apfWGzr2grjxbKZKzlyhQlIm4VaSzirepx3rO6VXGaQ6x0+cqapSrSXtJdaixw5Xvu
         THxvez4zL+2VebaRtqskXxYnSxGFUAQBU/hMMtttX+lqEcQtieq6JYMeB5yQn4LSeKoR
         eioDVWBIMuEI4uky5EHBF7coDIIS5LpKDG+tACs8Zo2QFI/p5tY0Grc6pZCGuF9MP4V+
         9RIc965RnOgRWdY5g6YO50O2ZRzg1GLSw0G/ElZOcSV+z3Yb9cmZPJql/bcfksmOarJG
         ZX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732560499; x=1733165299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1R1Jcugf3q9SkQGyzKFZdgHWnoNvKou2YarOZUBQQ4=;
        b=ei1L1Za/IpoOFz3RDDTY0sLchI5lNezTiIzUlNcu6Kb+NGJ8I1kcP20h7/RjCLHLJ3
         HwvOmwFT7ksgHNLDeaCoiyX3e5m6zq2InxS/1FcrxsB7RrJKzhY+DgcHggqEKAVNPxor
         D+dIhRSiyobf0emRZ5b1sTONkGP/jGZCJz9kGv6myn5lTjNZR3Ft/VMKHRwVUjb53QFh
         FkHaFKf5dCJjg50qObrIqgM09K+17SE/Rmmd96A54Ks/QQ+m7D1WYmwotYHOlkv+U784
         /z2oupvJiiPC3DajeG+9bsGSfZFB6Gc0y9e5KTgDILcBBEqW8pIjBXkBPWraUTVbcgon
         8+WA==
X-Forwarded-Encrypted: i=1; AJvYcCX0l03znci1ypfsOvDTDN3WAR0T2y9zCQ5T6ZnVoutLPk5r8ea+cXP33cQrVxd5h/E5Qt0OTVWxcU1J@vger.kernel.org
X-Gm-Message-State: AOJu0YwsFY9FU3nxw/YpwA2sEdsOkGbk3MCxajFMZrAu9TWEyaCLgt7f
	sH5g0AoObElfQ5DeZeYp371wjn/R8Mn2v0eLqT+34JGEayso7/S+w2+QcagvC1z6fiLXbpEtAiZ
	aG74qVB3tjzJTcvwDfnYTvKKITY3rFhxcR+o4m8+WmFYqLPkGNtrp
X-Gm-Gg: ASbGncsY3xqvlnrtd5/d2BLXWIuvBgCAsJ3Xl8yl2aOewlS7k1pmPABSWVK0TsNFlMv
	OAB1inZ/6+46mHHJGOMYavNRU8sQbMN5Fx4QgWALXBZtCioFcmPiGEJnT0GYU3w==
X-Google-Smtp-Source: AGHT+IGFWABXotexkrSzRTJC/p+T5eM5vBKUtT0VyVorJwkIzAja1G3XupgLC8Y99gEa5OaGBRY9emDlxg0EYIMOXcQ=
X-Received: by 2002:a05:622a:5b86:b0:466:923f:a749 with SMTP id
 d75a77b69052e-466923fa7aamr3443181cf.15.1732560499024; Mon, 25 Nov 2024
 10:48:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz>
 <84d9200e-25b4-4bd8-8eb5-c954ff92ac08@alliedtelesis.co.nz>
 <CAF1bQ=RU2dZU3ENy3MLM4FvrZNaZprgPAM5vbRtUVDixJNQ_zg@mail.gmail.com> <c6719149-8531-4174-824e-a3caf4bc6d0e@alliedtelesis.co.nz>
In-Reply-To: <c6719149-8531-4174-824e-a3caf4bc6d0e@alliedtelesis.co.nz>
From: Rong Xu <xur@google.com>
Date: Mon, 25 Nov 2024 10:48:07 -0800
Message-ID: <CAF1bQ=QEL3XZYsNL-f7jmbDOVWHSVfhZSYx0iddct3nz8_Yf1A@mail.gmail.com>
Subject: Re: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "Han Yao Yeo (atg)" <hanyao.yeo@alliedtelesis.com.sg>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Gotoh <gotoh@allied-telesis.co.jp>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for confirming this! It looks like we do need to put all
symbols from head.o before any other symbols.
To be clear, the patch I mentioned was not trying to do that -- it
just makes sure the _stext is in the right places.

I'll draft a patch for this.

On Sun, Nov 24, 2024 at 12:40=E2=80=AFPM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
> Hi Rong,
>
> On 22/11/24 18:02, Rong Xu wrote:
> > Does the following patch fix your issue?
> > https://lore.kernel.org/lkml/CAK7LNAQSpM2hh2=3DWgribb92nHF5_peRb+gxdO1B=
t1MkeL8N+hw@mail.gmail.com/t/
> >
> > Masahiro Yamada already applied the patch to kbuild-tree.
> >
> > I also proposed a similar fix as yours. But we believe the above patch
> > should also work (and probably is better).
> >
> > Please try and let us know.
>
> Looks like linux-next already has that patch and no it doesn't fix my
> issue. For the record here's the start of my System.map
>
> $ head System.map
> ffffffff80100000 T __split_text_end
> ffffffff80100000 T __split_text_start
> ffffffff80100000 T __unlikely_text_start
> ffffffff80100000 T _stext
> ffffffff80100000 T _text
> ffffffff80100000 t run_init_process
> ffffffff80100138 t try_to_run_init_process
> ffffffff8010018c t put_page
> ffffffff801001d0 t nr_blocks.isra.0
> ffffffff80100208 T ack_bad_irq
>
> It does look like whatever is supposed to put head.o first isn't kicking
> in for me.
>
> >
> > Thanks!
> >
> > -Rong
> >
> > On Thu, Nov 21, 2024 at 6:29=E2=80=AFPM Chris Packham
> > <chris.packham@alliedtelesis.co.nz> wrote:
> >>
> >> On 22/11/24 14:58, Chris Packham wrote:
> >>> Hi Rong,
> >>>
> >>> I was just trying some of my in-flight changes against linux-next and
> >>> found that my RTL9300* based board no longer boots (nothing on the
> >>> serial console after U-Boot hands off to the kernel).
> >>>
> >>> A bisect between Linus's tree and linux-next/master points to commit
> >>> d4a7f2510ff4 ("vmlinux.lds.h: Adjust symbol ordering in text output
> >>> section"). A build on d4a7f2510ff4^ boots successfully. That series i=
s
> >>> well beyond my area of knowledge, there may be something that the MIP=
S
> >>> SoCs are doing (or not doing) that is being affected by the sections
> >>> moving.
> >> Based on the sparc change that accompanied this commit the following
> >> does seem to restore working order for me:
> >>
> >> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux=
.lds.S
> >> index d575f945d422..e90b0f68290c 100644
> >> --- a/arch/mips/kernel/vmlinux.lds.S
> >> +++ b/arch/mips/kernel/vmlinux.lds.S
> >> @@ -62,6 +62,8 @@ SECTIONS
> >>           _text =3D .;      /* Text and read-only data */
> >>           _stext =3D .;
> >>           .text : {
> >> +               /* Match text section symbols in head.S first */
> >> +               *head.o(.text)
> >>                   TEXT_TEXT
> >>                   SCHED_TEXT
> >>                   LOCK_TEXT
> >>
> >> No idea if that's appropriate
> >>

