Return-Path: <linux-mips+bounces-6897-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E09E691A
	for <lists+linux-mips@lfdr.de>; Fri,  6 Dec 2024 09:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8638A283858
	for <lists+linux-mips@lfdr.de>; Fri,  6 Dec 2024 08:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6978C18A6C6;
	Fri,  6 Dec 2024 08:37:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341FF1E0DEA;
	Fri,  6 Dec 2024 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733474250; cv=none; b=llZyPFHgy/oZuVBzAinuLyNIxeoKRQ7lAdXsysWJrdxhRrv4uddp+EjBCIg5FNB3g4guVAf1LibNlyRaMozSJjHoy9tFfwl/UtAoJ8Nbtt9fFIhoDV5PakVnOcieVrMZi+GBNCnuD8TVk0BZF7Fq6A4dzgsYJypriqh5bzjOJjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733474250; c=relaxed/simple;
	bh=MZiZlwyJvBXLiAN8X1GJNiiIBfiMgKlUj8LxXBXDkdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiFib3mskdeMe3sACyizL068vA2HLphP4h/HSUZxgcz5v+IJpeQdzCZDEGINxneO/y1IFQdQ3NmPu93cUiEiPAtg7aNmy+RxV23p/mj1olmjcj26t/mHqnwRSUdTE5AhEXo3Q+2ty/qGrF7FQzvSId6pOY/T9P1UD1MPdrI9Ucw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4af5dd908bfso530243137.2;
        Fri, 06 Dec 2024 00:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733474246; x=1734079046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p52l+EzfUjM05v2ng7V2LMMN7gKNSNOhsoEffeujg0Y=;
        b=HfZcbB5+gWJ3tbFRf1aqt5FJJkQIxOubbu2FPlMJmk18XG6LBPtmAswWYuZyxdFXuQ
         X9mM/XdLoiL1F0L3H9PGiWybziOLVWyqNH+uTIvyrjVR/vvqXwATFsJAOjXnSbbXe1Rw
         99exEMc0QShyl06w/fdLmNXYMkXeGQWzv3EAGHtkITfAzmxsc6NHXtEQXnFxeCY8KMfs
         YBABkUo8elRyCe8AEFyjC0NkeBVHlQrHeb9gRqMGoDa+oEslJHlmREFuW6l7ipN04NT9
         5oIP6l68oGuJY7BNDGo2HiKvyO9MPF32VlowTkSCTHL6GqzYV12XskysrsFPjdMLBKdS
         DapQ==
X-Forwarded-Encrypted: i=1; AJvYcCX21/0CioUFPsmmqiiLOCFoKWA9+n4nL+Vyfh9rxG1rGEGxZribeqxfaDzXHu2M17J8ry7syKCEuiKfEzs=@vger.kernel.org, AJvYcCXgnom5yHUeVrusG+NGosI0czA0EBzT6apSkmnHwfzOXaIPIIPPoHyIGHkbIDZdJZCkPqw3Bpb2jfrwmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSHilrpvdcssP0jc9UuqHayqSTaaGC42JbMKXM2YK3h3uI5Dl
	08ckooRvE/+6q19Yntvpi715givtI/5Swy/0RGHsqgFjAMpRAKQvAf4FIl4O
X-Gm-Gg: ASbGnctJxgDjxNenbV6sYfmzDodDV6hu8flxMRHIa9WxW3ZJZCTeqRvVOh1A/SDHQgJ
	sl5TXTdE3NpBp3bvSk6m3Wt48H+Mr3wXXzWUnhsPGKx6Oyd5a6Wv+EjNQNTLy81oPz1vwXD4vnQ
	QtKXHLqjFsr33GFgtqUFuYuj5R1/9vrfnjwCSfq+rG5HiWzppbqtAFZ1YpXUbz4rXfMTnqrI1cN
	xZ7fgRrF+Td+4vQrDWw2Gs25mU5YymUdcB3u2taSq0QUOmMrBx1c4V9yY48CfXTeQv79YU7hckM
	/jZryyAk16nu
X-Google-Smtp-Source: AGHT+IHKIqIv95RkbOCuh5jd+ftjHUFLudgQL3v6Rl5x/wqWAfDNqt2cJk7OjyUUTa95HNJbhHDr/Q==
X-Received: by 2002:a05:6102:3a13:b0:4af:400e:2a9c with SMTP id ada2fe7eead31-4afcab255e3mr3112474137.25.1733474245655;
        Fri, 06 Dec 2024 00:37:25 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd21a2044sm50963137.29.2024.12.06.00.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 00:37:24 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85c4d855fafso58276241.2;
        Fri, 06 Dec 2024 00:37:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjZfG62lOEDvOxHp81NRqvnCglG4e6lpVT9l4BVxkXhWIDr1q2lYTrOO160IHF6pJCXfWxqz0m23oNrQ==@vger.kernel.org, AJvYcCWdtOYXIRHmUc3La3+scWMuNIpZgtM28ICZCdqoa3AFPvyY4IU0sRYSvjyJG41djE9IAaVntBNqZgGUqVc=@vger.kernel.org
X-Received: by 2002:a05:6102:dcd:b0:4af:cba5:e496 with SMTP id
 ada2fe7eead31-4afcba5e701mr2269468137.5.1733474244664; Fri, 06 Dec 2024
 00:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011150304.709590-1-ziy@nvidia.com> <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com> <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com> <Z1CDbrrTn6RgNmYn@casper.infradead.org>
 <B65776A4-D434-4D9F-9C42-1C45DAE5A72A@nvidia.com> <CAMuHMdV1hkwajxDWk6AWj_QR_qPkEni0u=tnQWdt1-M83NE0ig@mail.gmail.com>
 <EF8F5058-83CA-45FE-8721-08224B489361@nvidia.com>
In-Reply-To: <EF8F5058-83CA-45FE-8721-08224B489361@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 09:37:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbugTBrK5yqRB6ysHcEq8POCu3O37BUPU4i-8rLsQY2g@mail.gmail.com>
Message-ID: <CAMuHMdXbugTBrK5yqRB6ysHcEq8POCu3O37BUPU4i-8rLsQY2g@mail.gmail.com>
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

On Thu, Dec 5, 2024 at 6:33=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> Can you try the patch below (it compiles locally for mips and x86) to see
> if your issue is fixed? Can you please make THP always on in your config,
> since THP is also affected by the same issue? The patch you tested only
> fixed non THP config.

Thanks, this works both without THP, and with
CONFIG_TRANSPARENT_HUGEPAGE=3Dy
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Thanks. I appreciate your help. :)

Thanks, I appreciate your quick responses and solutions!

> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -224,7 +224,13 @@ static inline
>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>                                    unsigned long vaddr)
>  {
> -       return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma,=
 vaddr);
> +       struct folio *folio;
> +
> +       folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
> +       if (folio && alloc_need_zeroing())
> +               clear_user_highpage(&folio->page, vaddr);
> +
> +       return folio;
>  }
>  #endif
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c39c4945946c..6ac0308c4380 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4175,6 +4175,23 @@ static inline int do_mseal(unsigned long start, si=
ze_t len_in, unsigned long fla
>  }
>  #endif
>
> +/*
> + * alloc_need_zeroing checks if a user folio from page allocator needs t=
o be
> + * zeroed or not.
> + */
> +static inline bool alloc_need_zeroing(void)
> +{
> +       /*
> +        * for user folios, arch with cache aliasing requires cache flush=
 and
> +        * arc sets folio->flags, so always return false to make caller u=
se
> +        * clear_user_page()/clear_user_highpage()
> +        */
> +       return (IS_ENABLED(CONFIG_ARCH_HAS_CPU_CACHE_ALIASING) ||
> +               IS_ENABLED(CONFIG_ARC)) ||
> +              !static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
> +                                  &init_on_alloc);
> +}
> +
>  int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __=
user *status);
>  int arch_set_shadow_stack_status(struct task_struct *t, unsigned long st=
atus);
>  int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long s=
tatus);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index ee335d96fc39..107130a5413a 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1176,11 +1176,12 @@ static struct folio *vma_alloc_anon_folio_pmd(str=
uct vm_area_struct *vma,
>         folio_throttle_swaprate(folio, gfp);
>
>         /*
> -       * When a folio is not zeroed during allocation (__GFP_ZERO not us=
ed),
> -       * folio_zero_user() is used to make sure that the page correspond=
ing
> -       * to the faulting address will be hot in the cache after zeroing.
> +       * When a folio is not zeroed during allocation (__GFP_ZERO not us=
ed)
> +       * or user folios require special handling, folio_zero_user() is u=
sed to
> +       * make sure that the page corresponding to the faulting address w=
ill be
> +       * hot in the cache after zeroing.
>         */
> -       if (!alloc_zeroed())
> +       if (alloc_need_zeroing())
>                 folio_zero_user(folio, addr);
>         /*
>          * The memory barrier inside __folio_mark_uptodate makes sure tha=
t
> diff --git a/mm/internal.h b/mm/internal.h
> index cb8d8e8e3ffa..3bd08bafad04 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1285,12 +1285,6 @@ void touch_pud(struct vm_area_struct *vma, unsigne=
d long addr,
>  void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
>                pmd_t *pmd, bool write);
>
> -static inline bool alloc_zeroed(void)
> -{
> -       return static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
> -                       &init_on_alloc);
> -}
> -
>  /*
>   * Parses a string with mem suffixes into its order. Useful to parse ker=
nel
>   * parameters.
> diff --git a/mm/memory.c b/mm/memory.c
> index 75c2dfd04f72..cf1611791856 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4733,12 +4733,12 @@ static struct folio *alloc_anon_folio(struct vm_f=
ault *vmf)
>                         folio_throttle_swaprate(folio, gfp);
>                         /*
>                          * When a folio is not zeroed during allocation
> -                        * (__GFP_ZERO not used), folio_zero_user() is us=
ed
> -                        * to make sure that the page corresponding to th=
e
> -                        * faulting address will be hot in the cache afte=
r
> -                        * zeroing.
> +                        * (__GFP_ZERO not used) or user folios require s=
pecial
> +                        * handling, folio_zero_user() is used to make su=
re
> +                        * that the page corresponding to the faulting ad=
dress
> +                        * will be hot in the cache after zeroing.
>                          */
> -                       if (!alloc_zeroed())
> +                       if (alloc_need_zeroing())
>                                 folio_zero_user(folio, vmf->address);
>                         return folio;
>                 }

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

