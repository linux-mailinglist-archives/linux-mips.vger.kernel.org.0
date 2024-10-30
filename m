Return-Path: <linux-mips+bounces-6554-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D029B5FE1
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690F21C20E5D
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77DD1E3DDB;
	Wed, 30 Oct 2024 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmLBYLiQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CC81E3DD3;
	Wed, 30 Oct 2024 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730283511; cv=none; b=qhD7kpyqz3XvpagxCszW6eSaepNL0eEDSFxGI8yevw96H12JAZg9NWFZzKCsiui8WrkNALXRw7u/1bPiKZbz9L562kxPdNxrrfGXstcJHduQNsdPQEb6kRz8djL065cFOPQI1yyfoKZ4F2Np1IIvmnTg3fEJ15m9BUjdQ6HItfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730283511; c=relaxed/simple;
	bh=t+xHN4yo8SpZkvNHOi0SdTDVZvJ6vp92lqDwZm0EdZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cg+IBhJwljZrk+QY7NE0dbu31+pSyVpN4YRlPvSUd1ckQAOKPmOAxpCeaSQlTGcK0rI32G9YzYjf2SM/99HUN0izKd8P+2tKgtFulvwyMiy9+qOwwfL+l0+2SUcRJgtECADq/bE1SDUubt4mWVv0owUmHaNUNTmK4h1PWdzx208=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmLBYLiQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B1DC4CEEE;
	Wed, 30 Oct 2024 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730283511;
	bh=t+xHN4yo8SpZkvNHOi0SdTDVZvJ6vp92lqDwZm0EdZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QmLBYLiQPYapLCrCW6LjVF3/vceyiJ2GZb3Y1HbV7W+pc3t8QZ5lpi923mNr9sm7f
	 nyvjnseZRo/MwsxYaWWYytCHdJCv952UC2gq3qmj8RR0q+16NO2TGWNdqWZZiG5pv/
	 aesIPF8UgtMWv2A46FcI0jSkOMH9/BWH8XlqMJYLMxy/ZZqcd217bpZYlUut5COB5k
	 JeJN4ehrkCl1dvCKXanY/MGO4W8DVLzcdC38EqXmh/GLfGkZjp/hNR+/lfBfrnqycG
	 USfM3/+EwbX4CYkVUP6oWyitWY7yQKXvlpXxNEKZe0gIffDjAWyrC7sT5F1thQgunp
	 iZmusiXaQwmtA==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99e3b3a411so113949666b.0;
        Wed, 30 Oct 2024 03:18:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG1TTSIs0h44hMUosm1xH7z9uqNIWVNrrLGiaJN6QyFq8ZBhoWLL97eQom+F2LAa3TDF3Ht3zSzetAOBE=@vger.kernel.org, AJvYcCVHiClaZgYstAFqkmrNymTKQwtvX2JLJA+hJ4tWi5+/6Dgn0CeW4j8WrhMusebxiAbTGaxQ5hA+9mPfvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz13Dl9aVtocnL/SDQMMojf1yXvnl3gFiHyF41nA30xTtGThmcU
	dGGr98NqZksnsaTAlbw2U/MJSK6yBG7oj+2cvzVlRkAyCXxX0zz9cHKQxBY+vWS4S7gCZlPWlk8
	k2cWMqr1ecXX/YuWm6nve0I5chlU=
X-Google-Smtp-Source: AGHT+IGAc6JnsOtXiiVNTGb3faYWlCbREMz3guhUI9jKNulZYKGz8L3DUoumQNWcke9Qq+sg7an5RaH7LNbOJB0dqU4=
X-Received: by 2002:a17:906:730b:b0:a9a:c57f:964b with SMTP id
 a640c23a62f3a-a9e40bc5d44mr134325766b.8.1730283509388; Wed, 30 Oct 2024
 03:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030063905.2434824-1-maobibo@loongson.cn>
In-Reply-To: <20241030063905.2434824-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Oct 2024 18:18:16 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4KXMyj0hpmhEWxiyapVNVcWk3K7HcshNyx5_wp2NBUWA@mail.gmail.com>
Message-ID: <CAAhV-H4KXMyj0hpmhEWxiyapVNVcWk3K7HcshNyx5_wp2NBUWA@mail.gmail.com>
Subject: Re: [PATCH v2] mm: define general function pXd_init()
To: Bibo Mao <maobibo@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Oct 30, 2024 at 2:39=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> Function pud_init(), pmd_init() and kernel_pte_init() are duplicated
> defined in file kasan.c and sparse-vmemmap.c as weak functions. Move
> them to generic header file pgtable.h, architecture can redefine them.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
> v1 ... v2:
>   1. Add general function definition about kernel_pte_init().
> ---
>  arch/loongarch/include/asm/pgtable.h |  3 +++
>  arch/mips/include/asm/pgtable-64.h   |  2 ++
>  include/linux/mm.h                   |  3 ---
>  include/linux/pgtable.h              | 21 +++++++++++++++++++++
>  mm/kasan/init.c                      | 12 ------------
>  mm/sparse-vmemmap.c                  | 12 ------------
>  6 files changed, 26 insertions(+), 27 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/includ=
e/asm/pgtable.h
> index 20714b73f14c..df5889d995f9 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -267,8 +267,11 @@ extern void set_pmd_at(struct mm_struct *mm, unsigne=
d long addr, pmd_t *pmdp, pm
>   * Initialize a new pgd / pud / pmd table with invalid pointers.
>   */
>  extern void pgd_init(void *addr);
> +#define pud_init pud_init
>  extern void pud_init(void *addr);
> +#define pmd_init pmd_init
>  extern void pmd_init(void *addr);
> +#define kernel_pte_init kernel_pte_init
>  extern void kernel_pte_init(void *addr);
>
>  /*
> diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/p=
gtable-64.h
> index 401c1d9e4409..45c8572a0462 100644
> --- a/arch/mips/include/asm/pgtable-64.h
> +++ b/arch/mips/include/asm/pgtable-64.h
> @@ -316,7 +316,9 @@ static inline pmd_t *pud_pgtable(pud_t pud)
>   * Initialize a new pgd / pud / pmd table with invalid pointers.
>   */
>  extern void pgd_init(void *addr);
> +#define pud_init pud_init
>  extern void pud_init(void *addr);
> +#define pmd_init pmd_init
>  extern void pmd_init(void *addr);
>
>  /*
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 61fff5d34ed5..651bdc1bef48 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3818,9 +3818,6 @@ void *sparse_buffer_alloc(unsigned long size);
>  struct page * __populate_section_memmap(unsigned long pfn,
>                 unsigned long nr_pages, int nid, struct vmem_altmap *altm=
ap,
>                 struct dev_pagemap *pgmap);
> -void pud_init(void *addr);
> -void pmd_init(void *addr);
> -void kernel_pte_init(void *addr);
>  pgd_t *vmemmap_pgd_populate(unsigned long addr, int node);
>  p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
>  pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e8b2ac6bd2ae..adee214c21f8 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -90,6 +90,27 @@ static inline unsigned long pud_index(unsigned long ad=
dress)
>  #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
>  #endif
>
> +#ifndef kernel_pte_init
> +static inline void kernel_pte_init(void *addr)
> +{
> +}
> +#define kernel_pte_init kernel_pte_init
> +#endif
> +
> +#ifndef pmd_init
> +static inline void pmd_init(void *addr)
> +{
> +}
> +#define pmd_init pmd_init
> +#endif
> +
> +#ifndef pud_init
> +static inline void pud_init(void *addr)
> +{
> +}
> +#define pud_init pud_init
> +#endif
> +
>  #ifndef pte_offset_kernel
>  static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address=
)
>  {
> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
> index ac607c306292..ced6b29fcf76 100644
> --- a/mm/kasan/init.c
> +++ b/mm/kasan/init.c
> @@ -106,10 +106,6 @@ static void __ref zero_pte_populate(pmd_t *pmd, unsi=
gned long addr,
>         }
>  }
>
> -void __weak __meminit kernel_pte_init(void *addr)
> -{
> -}
> -
>  static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
>                                 unsigned long end)
>  {
> @@ -145,10 +141,6 @@ static int __ref zero_pmd_populate(pud_t *pud, unsig=
ned long addr,
>         return 0;
>  }
>
> -void __weak __meminit pmd_init(void *addr)
> -{
> -}
> -
>  static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
>                                 unsigned long end)
>  {
> @@ -187,10 +179,6 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsig=
ned long addr,
>         return 0;
>  }
>
> -void __weak __meminit pud_init(void *addr)
> -{
> -}
> -
>  static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
>                                 unsigned long end)
>  {
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index c0388b2e959d..cec67c5f37d8 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -184,10 +184,6 @@ static void * __meminit vmemmap_alloc_block_zero(uns=
igned long size, int node)
>         return p;
>  }
>
> -void __weak __meminit kernel_pte_init(void *addr)
> -{
> -}
> -
>  pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, i=
nt node)
>  {
>         pmd_t *pmd =3D pmd_offset(pud, addr);
> @@ -201,10 +197,6 @@ pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, u=
nsigned long addr, int node)
>         return pmd;
>  }
>
> -void __weak __meminit pmd_init(void *addr)
> -{
> -}
> -
>  pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, i=
nt node)
>  {
>         pud_t *pud =3D pud_offset(p4d, addr);
> @@ -218,10 +210,6 @@ pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, u=
nsigned long addr, int node)
>         return pud;
>  }
>
> -void __weak __meminit pud_init(void *addr)
> -{
> -}
> -
>  p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, i=
nt node)
>  {
>         p4d_t *p4d =3D p4d_offset(pgd, addr);
>
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> --
> 2.39.3
>

