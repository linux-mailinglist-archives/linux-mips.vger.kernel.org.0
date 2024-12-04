Return-Path: <linux-mips+bounces-6860-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC759E37FE
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 11:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79B82B23246
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 10:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B93E1885A0;
	Wed,  4 Dec 2024 10:42:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21872B9B7;
	Wed,  4 Dec 2024 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308931; cv=none; b=HnIWsX1Wmtr9VkKU4dFXvPmRxkDo+QFaOfPIpqSIOy3GIuKxKn1i99cZ0A3vha8LSAtPZl9nI4jfB3kgt7qHq2tZxZmilIp/PcAxtno7jSGbv7Rr6QZlN7tb5Pskz/N6C9XllvSWbmoAztb9DMSmcYOMSLxxIkcoY5s4fd+6LxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308931; c=relaxed/simple;
	bh=M1dpb5TLHirLWXPNAaAcJXprzy4nBHb8rzgQv9g9wQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=up/tRjtLskGaYW3R6EgprlzgnWjlXvEFH79t++QnufBvkQHFDW3gW/Mb1y0rX9oSLYONJEmh9CWUisnJVLxPCjgEhyka6gU41AFwez/VEmc16g3vod3bs9Y/5tfvoMBS/tZ9INLI9V3LlHYiZeASBrnEkxXAzORx0mQ/VoeG3pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5153c989426so1775668e0c.1;
        Wed, 04 Dec 2024 02:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308925; x=1733913725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vX2WH4n+GCNlvwADoU6DFdzKV/JxC1BRNEGUr+yTDEw=;
        b=LR1pa4Jk8Tuh1A5M3yNsc7pSB8sGUVuKGf8TbAFSPdhY6FhWlhTFwoo5RgpU+ZmETM
         9BSIUALg6STMRGM4FRwAq7BavOpBmsQJLSq1BxDKbj2f4cHaFvZJoh+SSZXVma4CMlW8
         /fQb0McDWNAuWiN/zxt6FU3lSOzCLBZ1O2OdG4IjSh1gZmCevIv4BPqzs00Wf5qVgH3S
         W/N/TdWrm8cmlJl0piGNEfPxqMkHU//Wn3xElns1kmq0iSZEhOFBQuSn+4Q7v4Kyzz19
         2J89IEaf4ifCm8VEMS8plobmlxFIh61iG9pT2M5V9wz8JOXvCLGl/wc34ai2vYrExvQI
         xf5A==
X-Forwarded-Encrypted: i=1; AJvYcCUeRrzs2/XHy/1tEOSNBWFXS2RX+uI3HOKH9M7RQVAZ0UPybUhkyTGRKQpQBjUF3WLKNP6umSjtzkyBga0=@vger.kernel.org, AJvYcCXbfcUHGFYtvmx7vALFxGRnOBx4BsMyKS0shrPPORAxBEhGINBkBrd6FcT8ORfzzKce5xQTBrMglNwzZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxou67pTx0/uL08VcbRT6ssvzMCuzwN1Ii7+aVXbMGjqsIkmkFC
	I3B6PmxoEyWNIOyxAXEgEYMU+4C+gN5DF+IMZCM3JHTtDcUaCF0BS7x1l8zm
X-Gm-Gg: ASbGncuCz04G03LCFGeZ4Nli0u8FTs8/1yeKR7dmXchD5MiKgghp1eUGKwO314+Vcyq
	nEZH3hGY8elET+Y4I93Pf+yxgWT0fF8xR//uSOa7DbfIkxrwJxB1lkBj5hJMafC+OhRL6AAsUTH
	mXPZbgqyCh16yCt5x4gTPHw85QoLqQAowU+H7cqZ505ifLGMM7v55aO6Rb/DyKtRFf6oLXMKlqA
	N8/ipFW8wpEV/qjI2l+WzTvhxTUU2MZOzassNfOf7kX4vwrfCBjl+43A1UcmuwdEBzn/6TB+p9M
	m/MlXY4TBUEF
X-Google-Smtp-Source: AGHT+IFq43S6jpA8LHNW0XdJDnTqiXBVcoWfecb7wCqWfUjqpjacoaPv9zB3MI02ai6stbDxKLcN3g==
X-Received: by 2002:a05:6122:d89:b0:50a:318:b3c2 with SMTP id 71dfb90a1353d-515bf2a1292mr8523130e0c.2.1733308925521;
        Wed, 04 Dec 2024 02:42:05 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0c19d1sm1497911e0c.32.2024.12.04.02.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 02:42:04 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c15e283bfso194367241.2;
        Wed, 04 Dec 2024 02:42:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWk8LdtPNc7krLuQoQX39M6yeIrsZB/20rw1BKTiqgvczmAqDHU1YyReA2FIfid3ZZZh5/LVgULU6pGu7w=@vger.kernel.org, AJvYcCWoQz+R3gHVZBRggYJp1BDQApMjubCvvhSiemo70wgBUAb2OWgncllqaXqwI7e6aDlpYukT1fOX1Z+3dQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c92:b0:4af:56c:1cb5 with SMTP id
 ada2fe7eead31-4af973adffdmr7164816137.19.1733308924354; Wed, 04 Dec 2024
 02:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011150304.709590-1-ziy@nvidia.com>
In-Reply-To: <20241011150304.709590-1-ziy@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Dec 2024 11:41:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
Message-ID: <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with init_on_alloc=1
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Miaohe Lin <linmiaohe@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	John Hubbard <jhubbard@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Alexander Potapenko <glider@google.com>, 
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zi,

On Fri, Oct 11, 2024 at 5:13=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> Commit 6471384af2a6 ("mm: security: introduce init_on_alloc=3D1 and
> init_on_free=3D1 boot options") forces allocated page to be zeroed in
> post_alloc_hook() when init_on_alloc=3D1.
>
> For order-0 folios, if arch does not define
> vma_alloc_zeroed_movable_folio(), the default implementation again zeros
> the page return from the buddy allocator. So the page is zeroed twice.
> Fix it by passing __GFP_ZERO instead to avoid double page zeroing.
> At the moment, s390,arm64,x86,alpha,m68k are not impacted since they
> define their own vma_alloc_zeroed_movable_folio().
>
> For >0 order folios (mTHP and PMD THP), folio_zero_user() is called to
> zero the folio again. Fix it by calling folio_zero_user() only if
> init_on_alloc is set. All arch are impacted.
>
> Added alloc_zeroed() helper to encapsulate the init_on_alloc check.
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

Thanks for your patch, which is now commit 5708d96da20b99b4 ("mm:
avoid zeroing user movable page twice with init_on_alloc=3D1")
in v6.13-rc1.

This causing a panic when starting userspace on MIPS64 RBTX4927:

    Run /sbin/init as init process
    process '/lib/systemd/systemd' started with executable stack
    Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x000000=
0b
    ---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x0000000b ]---

or

    Run /sbin/init as init process
    process '/lib/systemd/systemd' started with executable stack
    do_page_fault(): sending SIGSEGV to init for invalid read access
from 00000000583399f8
    epc =3D 0000000077e2b094 in ld-2.19.so[3094,77e28000+22000]
    ra  =3D 0000000077e2afcc in ld-2.19.so[2fcc,77e28000+22000]
    Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x000000=
0b
    ---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x0000000b ]---

or

    Run /sbin/init as init process
    process '/lib/systemd/systemd' started with executable stack
    /sbin/inKernel panic - not syncing: Attempted to kill init!
exitcode=3D0x00007f00
    ---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x00007f00 ]---
    it: error while loading shared libraries: libpthread.so.0: object
file has no dynamic section

Reverting the commit (and fixing the trivial conflict) fixes the issue.

> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -224,13 +224,7 @@ static inline
>  struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>                                    unsigned long vaddr)
>  {
> -       struct folio *folio;
> -
> -       folio =3D vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0, vma, vaddr);
> -       if (folio)
> -               clear_user_highpage(&folio->page, vaddr);
> -
> -       return folio;
> +       return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma,=
 vaddr);
>  }
>  #endif
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 82f464865570..5dcbea96edb7 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1176,7 +1176,8 @@ static struct folio *vma_alloc_anon_folio_pmd(struc=
t vm_area_struct *vma,
>         }
>         folio_throttle_swaprate(folio, gfp);
>
> -       folio_zero_user(folio, addr);
> +       if (!alloc_zeroed())
> +               folio_zero_user(folio, addr);
>         /*
>          * The memory barrier inside __folio_mark_uptodate makes sure tha=
t
>          * folio_zero_user writes become visible before the set_pmd_at()
> diff --git a/mm/internal.h b/mm/internal.h
> index 906da6280c2d..508f7802dd2b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1233,6 +1233,12 @@ void touch_pud(struct vm_area_struct *vma, unsigne=
d long addr,
>  void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
>                pmd_t *pmd, bool write);
>
> +static inline bool alloc_zeroed(void)
> +{
> +       return static_branch_maybe(CONFIG_INIT_ON_ALLOC_DEFAULT_ON,
> +                       &init_on_alloc);
> +}
> +
>  enum {
>         /* mark page accessed */
>         FOLL_TOUCH =3D 1 << 16,
> diff --git a/mm/memory.c b/mm/memory.c
> index c67359ddb61a..88252f0e06d0 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4719,7 +4719,8 @@ static struct folio *alloc_anon_folio(struct vm_fau=
lt *vmf)
>                                 goto next;
>                         }
>                         folio_throttle_swaprate(folio, gfp);
> -                       folio_zero_user(folio, vmf->address);
> +                       if (!alloc_zeroed())
> +                               folio_zero_user(folio, vmf->address);
>                         return folio;
>                 }
>  next:

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

