Return-Path: <linux-mips+bounces-6888-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C82669E4F94
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 09:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96799163AE0
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 08:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736FD1CEADC;
	Thu,  5 Dec 2024 08:19:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF02194A43;
	Thu,  5 Dec 2024 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733386785; cv=none; b=NSBvrFR8YpNm8Qzfyncf27U1aKLe5EwRgWJHgpwIr17Z/6fn7SgwpQDD4pgGMoO9wPvVM2eLnKSdEvOqTwsovP1FaSvIuEiuzDqLSGswcVDf/bacWi/Tf77m5+X6z2sDk5GvjCvwNrehc/5rSRn/s06aq21gsUWiTmT5H9qEqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733386785; c=relaxed/simple;
	bh=z4VF1DfxTuTvepvJLfhUZ5kZWxEqBij7/UOzaZn9R2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvNHTC2MD0xYlDgYZxZj/fmkBTYVmqOxAmYdK/VMj7TB9/330BrUSxYMyI8zbDCK5OfxFu6jMkgm/Ochk2Q0vyiWQ/iEpIxPkRkk7dTM8c+9dv2zYx+O4UNPi+m7Fvv+VCi38nMVsdD2h7IJt8LUSV+OeTueo3Ykka9a8xBYViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afa4094708so152334137.0;
        Thu, 05 Dec 2024 00:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733386780; x=1733991580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TymhtJQJLO1d2er5Qpo5wpVgQe9RLPvK7Re/NeMOgM8=;
        b=EGHzNRLsZo79vBioMNR+drcptTTDrL9JFnJu5/9GXgfPWVDgcovSAVuGB+hQzEG2HS
         Bk1hXWIZmZMR4LGjAAoNPXGcdSaGrJoHelrI870w7XE7LBrDi3tjtfasP76RaEAR7sPA
         VsmLECBGFo3djKFhrgw7/NGXBgHfXDyax5mgCDl8qvWHEkWXbPA+AUsDVg/dIor7m4hq
         Q9zFpQH3qQdipAgZPn8lp07216gWyKs1wcni5+E0SDiUiqTYinl66QW+bs/OUmZ8K/hN
         jyzrXnH4wf9aIUD45YUbZBi85hReM90GpO/fDbRKLFd+rn/Q5CSOsXbQGKoJsMDpJmzf
         U7TA==
X-Forwarded-Encrypted: i=1; AJvYcCWuU1iOVDhuu97DNno2Y6Y07rHszFnTwaVo21M4IhRRtdhN1EZEpdfSH99H9Bj4P0B3r/Gah83zm4P0maA=@vger.kernel.org, AJvYcCXplEDIHEkmelzZR3F0QVvxRi3ID4bRTWpZ47Yn0mXJGPGk1GO0QBhbp5Jb5gMoyUq/tiUt6Ziae2/Lug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS5yp0TLlY8LC8+yQh+PTkBrQ1CBwparTY8zDltDQnf0s56Y03
	BNEZPIYOsoVMwzZFKqbMOdNuwuPuEvyaqnaR1jS1nKUey6o4Smg73uxAYpg7
X-Gm-Gg: ASbGncuAyLwW24XNpb4O7no5YGN54jpvhW9nIg9DtkE9Jz64HESHYmg+Q8+SIAP+iOQ
	dsQXTrg18YQp6sVys6SctrJIuyKQIbSsllNP3EQTQlnzdOyLUZdWkZl48MBgCw2BImP0HtcxVcQ
	cj19PRiv7+vtz80G5XSxVY0jdxK+nrNUoi0s+hkj9+1eedMs9Z9v+4VGrSdtZcEbgb2UXxVIi3q
	7IbYrmSjI5h4ciCf4FyFZBGOJgctXbSUnFb/ynPqEFNcu7FfMHjL4AoDEdvTIjw3M5m6QdAMIrr
	5gEoVA0J3s7J
X-Google-Smtp-Source: AGHT+IGzdaPzp74umM20fxzWrRWwHdaUZ7ur1fJz6xT6CX/rzxu42VK6CIPtiSBq9urhnDpx22+qFw==
X-Received: by 2002:a05:6102:5113:b0:4af:59a2:8425 with SMTP id ada2fe7eead31-4afa52f0755mr9472439137.26.1733386780629;
        Thu, 05 Dec 2024 00:19:40 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba8b1f9sm121544241.19.2024.12.05.00.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 00:19:39 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so147608241.3;
        Thu, 05 Dec 2024 00:19:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUnOj3LOUmmzupONUubH7bksHBF3zTC1pKXXeh9H/WBmUwAiV++/BQUFhHeYfGDJd2IWVqx+Ukg5A8edc=@vger.kernel.org, AJvYcCVq/JlhnCwkxVVmIb0M1UOaz7gIhLl7ISx25kGpJ2vYa2/23kBfxW7ZzqEOWPO9Jeo/jFbmk6IQlSyGrw==@vger.kernel.org
X-Received: by 2002:a05:6102:358c:b0:4af:ad73:ffd7 with SMTP id
 ada2fe7eead31-4afad741481mr5868855137.7.1733386778916; Thu, 05 Dec 2024
 00:19:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011150304.709590-1-ziy@nvidia.com> <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com> <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com> <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <B65776A4-D434-4D9F-9C42-1C45DAE5A72A@nvidia.com>
In-Reply-To: <B65776A4-D434-4D9F-9C42-1C45DAE5A72A@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 09:19:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1hkwajxDWk6AWj_QR_qPkEni0u=tnQWdt1-M83NE0ig@mail.gmail.com>
Message-ID: <CAMuHMdV1hkwajxDWk6AWj_QR_qPkEni0u=tnQWdt1-M83NE0ig@mail.gmail.com>
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with init_on_alloc=1
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>, 
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zi,

On Wed, Dec 4, 2024 at 5:58=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> On 4 Dec 2024, at 11:29, Matthew Wilcox wrote:
> > On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
> >>> So maybe the clearing done as part of page allocator isn't enough her=
e.
> >>>
> >> Basically, mips needs to flush data cache if kmap address is aliased t=
o
> >
> > People use "aliased" in contronym ways.  Do you mean "has a
> > non-congruent alias" or "has a congruent alias"?
>
> I mean if kmap address goes into a different cache line than userspace
> address, a cache flush is needed to make sure data is visible to
> userspace.
>
> >
> >> userspace address. This means when mips has THP on, the patch below
> >> is not enough to fix the issue.
> >>
> >> In post_alloc_hook(), it does not make sense to pass userspace address
> >> in to determine whether to flush dcache or not.
> >>
> >> One way to fix it is to add something like arch_userpage_post_alloc()
> >> to flush dcache if kmap address is aliased to userspace address.
> >> But my questions are that
> >> 1) if kmap address will always be the same for two separate kmap_local=
() calls,
> >
> > No.  It just takes the next address in the stack.
>
> So this fix will not work, since it is possible that first kmap and secon=
d
> kmap have different pages_do_alias() return values.
>
> Another way would be to make a special case for mips, like below.
> But that looks ugly, let me think about it more.
>
> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> index bc3e3484c1bf..ef3c6f0b9159 100644
> --- a/arch/mips/include/asm/page.h
> +++ b/arch/mips/include/asm/page.h
> @@ -95,6 +95,19 @@ struct vm_area_struct;
>  extern void copy_user_highpage(struct page *to, struct page *from,
>         unsigned long vaddr, struct vm_area_struct *vma);
>
> +struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
> +                                  unsigned long vaddr)
> + {
> +       struct folio *folio;
> +
> +       folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
> +       if (folio)
> +               clear_user_highpage(&folio->page, vaddr);
> +
> +       return folio;
> + }
> +#define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
> +
>  #define __HAVE_ARCH_COPY_USER_HIGHPAGE
>
>  /*
> diff --git a/mm/internal.h b/mm/internal.h
> index cb8d8e8e3ffa..d513fa683aa3 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1287,7 +1287,8 @@ void touch_pmd(struct vm_area_struct *vma, unsigned=
 long addr,
>
>  static inline bool alloc_zeroed(void)
>  {
> -       return static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
> +       return !IS_ENABLED(CONFIG_MIPS) &&
> +               static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
>                         &init_on_alloc);
>  }

After adding a missing static inline, #include <linux/gfp.h>, and still
getting compile failures, I gave up...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

