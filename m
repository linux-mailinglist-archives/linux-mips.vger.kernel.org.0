Return-Path: <linux-mips+bounces-6934-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 825309EBA2E
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 20:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F82F2811C9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 19:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C0C226193;
	Tue, 10 Dec 2024 19:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOOPUG/b"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767D214229;
	Tue, 10 Dec 2024 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733859604; cv=none; b=K7/JqPl3DQtQJl0WFQmWsAYJPayLEjCnplNfOBVBrCeh9O8NEJI+aJaUwamGcct/j7uDf+G5m0lRS4e6wtnwhMbk6PjX5KdU42er1stkyDJQBhizvmnOa2Up7sdpxSmX6S6a3LiQstFbAENNuEyJxrTTN8VR0F8sHxGzhj0OiqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733859604; c=relaxed/simple;
	bh=dv49gsM9X6vxEVxhRoy9UrWifvJpzPiOHoKBO4dRQCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEDhbtjrK9vZ/RPrHyrUVPUQjV8RXw+boT+CQ2wODG6ENce5Au5d9JXOExfsv0gdlbkEb1cQo1c4pPqbGpg4SUKWH4M461i44gLY7mdJTFQk5i2D7dOcSpdFKCsyoUh1xpCr2G2aE384QgMP1yuVNIFmi1RW8Z2/0Rk4vaRlLPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOOPUG/b; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so7013687a12.1;
        Tue, 10 Dec 2024 11:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733859600; x=1734464400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=OOOPUG/b6uinLPQcZOe6VxmyO66Jkwg1lP0+h2q/i5CqarMPIyAwRcMy915tq4CmhW
         yzsXQxjZVaA1Cr73jwKCDIZcQiNTSgD0BLzNC9G4BTERMGLrMyiYKxU5cHd27YJxgp3A
         HfsRpg1Ruz8rBIaB2z9V7oJHTER525dBhyxw7qesqF0veAkP+PkOOfcJ8nzuihTUxz0H
         KgHngvj6spI2AtaIgGlWjBdn20leVyjcYXQ9gAyTlbuoXh6FlsThdL8kD69RSmlUZX5W
         83WHROVDCkkhCgItib2RybqOFFPA+JHPHg71seGz4FZx9ula+SuVLFs1994BM1QDTT4Q
         m+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859600; x=1734464400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRTnbzohup0wCZkD2CjtRfmdnuYKFBQ3yOoD8MNis+g=;
        b=KCrOt1B0ENn/MqJPmUXo251kb1LAjvmOdjmVxJiNOqeW3ZYckcW282U0EpKAaQuHrj
         O32TZ+GpwWHYw7Bxjl1SisaEmo4FEExDIP/+hNdCfAKzbq/vsV737oa/q+WgiX7uipAN
         d7kX2NdIyHPuyjEUHIxECIQzICXCvoxHEfTKm/GigREJIDXxjRbJQ7y/0m+o4I1yx6pY
         OzNiaPZSe5zGKPaqo7vZNEbtcYHgvGW8HL0iYGH8ABkC1VxwYc5c7jSJvUv5EoO7n+De
         m4eGQVB5YCZI+2fgLQYmESN4ihXeOZHPQMr981g1N9IiKkyT9en0MydehZ4hmBxedOuU
         ZJbA==
X-Forwarded-Encrypted: i=1; AJvYcCUc2f5O/2VtlQh1ucMx6DGTsA9Bw3JycXaAxGSHCpgKLbC4gnjUvFG+0vkV8WTfTgtsAeBWTYzeJKWPxw==@vger.kernel.org, AJvYcCVXwwxKxXp8MK7Gu8kiBFz8V841FqyjQyyfCYt5ciUxxa7K+kth9cWG9HkACaHFo7vf89fB2V9zDriJ9A==@vger.kernel.org, AJvYcCVYbW6+perrconKoLmGjpLOa2cADugl9ZwfYPfDLUFPPa3B8ISe5TGozaHRYLs+YOlmk9qi5+ZAuP8yNg==@vger.kernel.org, AJvYcCVclgPlNp4mTFR91UCRpuRDgpJB1Gakv9vWoI11jJL6ZhWUNLiNtDMZS6srq7piM1AfzU37kpIz7SwyXw==@vger.kernel.org, AJvYcCWuGgod93HQkp8HIPQ5Ql9/BDgnpGeqW/Dvev2aBgldosm7nNROlHaMZeosO2uicUP40dhkkU12S618j3II@vger.kernel.org, AJvYcCWxusp3GjymTs3mbo0ERL3oWrTGzOjz8t8OF/8sD1IdL20fVVCBv0cHZXzrixNTlNLC5+nKf6RGDx1n5w==@vger.kernel.org, AJvYcCXTvTDP0Dna/g3vcnXcvvmlJDrcuZGPdbLh+WqCZJ7nGXqj29hMr0FUoKqDllVP4P8/lM9uZ/f6oRz35tHL@vger.kernel.org, AJvYcCXpzZBcybp9Lk8rkXr87v6lq65vtL7Zqmh2IZiYVGwem4ck6EmUh7DtjZHud3Js//Mbg1du9su7D5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyosJwuPMsbjGbaYYuZD1Wteok68tSuwU+cF498Jr1qHrqKALhf
	A6igQXk4FE1coCOM7cMa4m2SwPVvQiIwdkxwb54D+guasYuT+7IeZcsTS2i1gtY4jFevbe5JE/q
	5gjjv9lD1+VkKn2xfVRE2S7R+Yn8=
X-Gm-Gg: ASbGncsfqCMXgL1z3LAqfXnKso33sZs26xx1LQwcoPJJ9EOBfEYh9q8ExAU/F+iX4dR
	IwXqORyBLm6coN+jJx3PH3KiVREGJN0yS2Cm/Gg==
X-Google-Smtp-Source: AGHT+IGn1TGMw5Q3ZRvX4tSkpBgSMsKO1aElzvBulPGolgowmhm7A7II8tzVQjdTXusigtkhjHD3HA/xYigxPDvvUCI=
X-Received: by 2002:a05:6402:5299:b0:5d0:c9e6:30bc with SMTP id
 4fb4d7f45d1cf-5d4330814d0mr38059a12.10.1733859599911; Tue, 10 Dec 2024
 11:39:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
 <20241210024119.2488608-18-kaleshsingh@google.com> <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
 <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
In-Reply-To: <CAC_TJvdReRHzBSgg2iqOw3Kw6BBOtwGE=8nB2Hsw-nsmkxN0+g@mail.gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 10 Dec 2024 11:39:48 -0800
Message-ID: <CAHbLzkqbH_AR2jy_6LZ7KSh6bcf4L5B51Mq9DwYtdBcVz1Lu6w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 9:34=E2=80=AFAM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> On Mon, Dec 9, 2024 at 7:37=E2=80=AFPM Yang Shi <shy828301@gmail.com> wro=
te:
> >
> > On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google=
.com> wrote:
> > >
> > > Commit 249608ee4713 ("mm: respect mmap hint address when aligning for=
 THP")
> > > fallsback to PAGE_SIZE alignment instead of THP alignment
> > > for anonymous mapping as long as a hint address is provided by the us=
er
> > > -- even if we weren't able to allocate the unmapped area at the hint
> > > address in the end.
> > >
> > > This was done to address the immediate regression in anonymous mappin=
gs
> > > where the hint address were being ignored in some cases; due to commi=
t
> > > efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries"=
).
> > >
> > > It was later pointed out that this issue also existed for file-backed
> > > mappings from file systems that use thp_get_unmapped_area() for their
> > > .get_unmapped_area() file operation.
> > >
> > > The same fix was not applied for file-backed mappings since it would
> > > mean any mmap requests that provide a hint address would be only
> > > PAGE_SIZE-aligned regardless of whether allocation was successful at
> > > the hint address or not.
> > >
> > > Instead, use arch_mmap_hint() to first attempt allocation at the hint
> > > address and fallback to THP alignment if that fails.
> >
> > Thanks for taking time to try to fix this.
> >
> > >
> > > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > > ---
> > >  mm/huge_memory.c | 15 ++++++++-------
> > >  mm/mmap.c        |  1 -
> > >  2 files changed, 8 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 137abeda8602..f070c89dafc9 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         loff_t off_align =3D round_up(off, size);
> > >         unsigned long len_pad, ret, off_sub;
> > >
> > > +       /*
> > > +        * If allocation at the address hint succeeds; respect the hi=
nt and
> > > +        * don't try to align to THP boundary.
> > > +        */
> > > +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> > > +       if (addr)
> > > +               return addr;
> > > +
>
> Hi Yang,
>
> Thanks for the comments.
>
> >
> > IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
> > arch_get_unmapped_area_topdown() again. So we will actually look up
> > maple tree twice. It sounds like the second hint address search is
> > pointless. You should be able to set addr to 0 before calling
> > mm_get_unmapped_area_vmflags() in order to skip the second hint
> > address search.
>
> You are right that it would call into arch_mmap_hint() twice but it
> only attempts the lookup once since on the second attempt addr =3D=3D 0.

Aha, yeah, I missed addr is going to be reset if arch_mmap_hint()
fails to find a suitable area.

>
> Thanks,
> Kalesh
> >
> > >         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
> > >                 return 0;
> > >
> > > @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(s=
truct file *filp,
> > >         if (IS_ERR_VALUE(ret))
> > >                 return 0;
> > >
> > > -       /*
> > > -        * Do not try to align to THP boundary if allocation at the a=
ddress
> > > -        * hint succeeds.
> > > -        */
> > > -       if (ret =3D=3D addr)
> > > -               return addr;
> > > -
> > >         off_sub =3D (off - ret) & (size - 1);
> > >
> > >         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 59bf7d127aa1..6bfeec80152a 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned l=
ong addr, unsigned long len,
> > >         if (get_area) {
> > >                 addr =3D get_area(file, addr, len, pgoff, flags);
> > >         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> > > -                  && !addr /* no hint */
> > >                    && IS_ALIGNED(len, PMD_SIZE)) {
> > >                 /* Ensures that larger anonymous mappings are THP ali=
gned. */
> > >                 addr =3D thp_get_unmapped_area_vmflags(file, addr, le=
n,
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
> > >

