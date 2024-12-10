Return-Path: <linux-mips+bounces-6928-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD79EA6B5
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 04:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DBAF188B4C0
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 03:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D101D5CDB;
	Tue, 10 Dec 2024 03:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meJwTSJW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38C4208A7;
	Tue, 10 Dec 2024 03:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801863; cv=none; b=GJlPsTwtR/AhvMkCHXeK2LlgsT+SLx4wYjeuWlllajBVeOwpxKnRxupNU3XFCDBmF/mDj5g21RvxkzuFCz+mbiiVZg7skQ7ezei2XkTHT0iA7oADeiffMEAvF8hmnWddzYF/BcQG9RosfMhnKmGr26s9N9RnOWj3iZnTUjVKG5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801863; c=relaxed/simple;
	bh=yXLwrYkUhhm7e8Jczp/Rq6SgG8Y2ONP7nE+CaYrO6cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke40+Cb8bQZh7kxfYrSK4KXtSoqA+bW7cRpfIuNV8/SqAb95LYnCO6TF31Bku9NsKx5pL/XdxcJotUynlw2j6MeV+63eTiHZEzXFFgD3ujB58SS2qGUtICxkgteW82Y0gh1NS3lXiaa6ZQlqAOfTU3aXSvdgQPqoL/eytQvxFbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meJwTSJW; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso4763800a12.1;
        Mon, 09 Dec 2024 19:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801859; x=1734406659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=meJwTSJWfsb02SUoa0I7uX5WIqTn4nhbN7Mpu9r7TqbixinVeQy/5X48LdpJn+Uu45
         OAEJtm3iaSxSkT/LN2yfTVJYxNthe4PyNX1tSRzti5tNKZ7McDjPIc5n3Mgc4rSCr5Mv
         I+wcBt6B0BHENc9aobrzexIjIRyuUNxNibsdrfwxzqVQwK/PYtrRdF7uSDjveEQYQg3P
         10aFVDrW9gKa4wT1leO2gXmabGcFbf2mjnZjgSVu0l48Mi7qgAd6tivq6yhvNzI7d4oO
         eYYFSDQKukrQPhO8jbX3utC71t9osOsgKeERiIZX4QI4VVpV0vcCx6nbOvNMLgow9+oN
         zU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801859; x=1734406659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=Pp7tfBfZlpIC1gp5IgO1/TXDYexNpQUhKMGlAaiCYfucDqlGq9mp6h8RTPt6ZahRaa
         mrQgRdIEXMQh8BfxzR7SmKAe5JjbjPpW7sjIwHUS4kVt9Vr8kwELJ0380cLdmmYH7HLo
         G9WpORHCUkpw/pnSawRBC2b+I3ADb2w95wXONDgc8DEZoKw3LzV0mC00O1PtksPI+brQ
         o/vBC/6XcwtUARpmp8teRQGiv5MFJl7gqqeyIcvg2WmCMdmtvAsC1BG7tTbP1MLjHt0O
         YEbTG0mndbXzoR63Dy3YhFrlbH5AOosqFPLozo7iNoZh8unDSBlW3eF0YwHEcTB7xVQv
         de2w==
X-Forwarded-Encrypted: i=1; AJvYcCUOOkf0KtWP6ZbOhNgY6wszpcjO2m16dnE8ulVU+388cNOvn9sagVbFJ+X6uGp3SPReHEf+v5OszK4RNw==@vger.kernel.org, AJvYcCUnHySVWR16EWckkpBqBep1abrWwhzEvxHN3IQtkXiV4pb4Oi95yEDuekrqVIFDl9vhQAwYmVTXlnUWXg==@vger.kernel.org, AJvYcCV0dAe4LWb8GcUVZU71mScY9hSPz+xKyb7gJoce3zWDiXXWNDaD9sR1RBDJ7CEhX8hNgYx/D13BdKGzvHDQ@vger.kernel.org, AJvYcCV6A6YOZGOL8IjA4t4SA729G4t2sLMrZW2OGRTGFbXVhSoFebJ9RstAF2XmgoYwkMCKlh8uVssmcZcCGQ==@vger.kernel.org, AJvYcCX28bAhyAp/k1bnpiChLyCifGGMEq0gf9WK/d6m3A7ND1hHtZZzBlHZ+ai5ZURl2hJgWxhTQOeYsh8uyR3R@vger.kernel.org, AJvYcCX5mifoH3zocPG8C5ij7G//Q+FHrGAGTyPN6WOR+peINOFqwlL459Jg8kgqgWfSny2jgU2yf8vp1lk=@vger.kernel.org, AJvYcCXeQlUJdQeGwcouKS3Bfad1k5NuyAwYDEaYB5SUZY1aWv9CZE0afQ4s18hVK5ujBt2NZR9BWdXSY9by1A==@vger.kernel.org, AJvYcCXm3ARH4GCpletEQ5Op4fYbMtbWSNuxKSX7VgKR8qGExmZgl3fGlXMAaweM9q/ajekqRGDt4RSnfbt17A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxQ0mS8emwfwQWDCD1KSXGz6ovwQ8S3BvF1Ob2EueW21oQAAML
	wZnpdGV+oDK+EYgYZVedrDaGkhyTAc906lpD0abm8kjidRC1LvxOqfTdxcYxRfjz2zjPgLeNfXP
	mDwSNHHlTpXMXBLUrDbAbDyAap78=
X-Gm-Gg: ASbGncvnLuUL9848Ezmg4d5eOj9R8iX0rOjs7vRyGx0IyHrWpAvlhZvUTt16VY4H5gC
	qlonicRQrf/9PzpuyfWlHAgcDcYt+pws4BZr6EQ==
X-Google-Smtp-Source: AGHT+IElXjz+7x/lQGuFmHk7BJtRPsIF5Xkbrc+PaOE9soOWoyJSq8aIO8IH6O/j+TzaKqiG91uZtuFho2g8MHXawAQ=
X-Received: by 2002:a05:6402:3229:b0:5d0:f6ed:4cd1 with SMTP id
 4fb4d7f45d1cf-5d41e2b4c34mr1849541a12.10.1733801858975; Mon, 09 Dec 2024
 19:37:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-18-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-18-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:37:27 -0800
Message-ID: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
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

On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
>
> Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP=
")
> fallsback to PAGE_SIZE alignment instead of THP alignment
> for anonymous mapping as long as a hint address is provided by the user
> -- even if we weren't able to allocate the unmapped area at the hint
> address in the end.
>
> This was done to address the immediate regression in anonymous mappings
> where the hint address were being ignored in some cases; due to commit
> efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
>
> It was later pointed out that this issue also existed for file-backed
> mappings from file systems that use thp_get_unmapped_area() for their
> .get_unmapped_area() file operation.
>
> The same fix was not applied for file-backed mappings since it would
> mean any mmap requests that provide a hint address would be only
> PAGE_SIZE-aligned regardless of whether allocation was successful at
> the hint address or not.
>
> Instead, use arch_mmap_hint() to first attempt allocation at the hint
> address and fallback to THP alignment if that fails.

Thanks for taking time to try to fix this.

>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  mm/huge_memory.c | 15 ++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 137abeda8602..f070c89dafc9 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +

IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
arch_get_unmapped_area_topdown() again. So we will actually look up
maple tree twice. It sounds like the second hint address search is
pointless. You should be able to set addr to 0 before calling
mm_get_unmapped_area_vmflags() in order to skip the second hint
address search.

>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         if (IS_ERR_VALUE(ret))
>                 return 0;
>
> -       /*
> -        * Do not try to align to THP boundary if allocation at the addre=
ss
> -        * hint succeeds.
> -        */
> -       if (ret =3D=3D addr)
> -               return addr;
> -
>         off_sub =3D (off - ret) & (size - 1);
>
>         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 59bf7d127aa1..6bfeec80152a 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned long =
addr, unsigned long len,
>         if (get_area) {
>                 addr =3D get_area(file, addr, len, pgoff, flags);
>         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> -                  && !addr /* no hint */
>                    && IS_ALIGNED(len, PMD_SIZE)) {
>                 /* Ensures that larger anonymous mappings are THP aligned=
. */
>                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> --
> 2.47.0.338.g60cca15819-goog
>
>

