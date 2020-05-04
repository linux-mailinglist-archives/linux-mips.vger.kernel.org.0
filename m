Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005791C37DF
	for <lists+linux-mips@lfdr.de>; Mon,  4 May 2020 13:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728518AbgEDLTE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 May 2020 07:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728452AbgEDLTE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 May 2020 07:19:04 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5B4C061A0F
        for <linux-mips@vger.kernel.org>; Mon,  4 May 2020 04:19:02 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id z25so8464243otq.13
        for <linux-mips@vger.kernel.org>; Mon, 04 May 2020 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=deBFpZDyD7Ytv7er+9351gbbtNrttVAi3jZjoadiPO4=;
        b=glUcsG5WwYRnt+lJPOtXI4u2+uV8cO9bdXvRZGvTV68eBEUcNwFHztrwdHRujYdHDs
         za+2QmAIcNuBiVZoHk5c2TrjPwt7XJeqrhwOA5f0z/BkNND1OxBYATl7dOYGOc4jL0aM
         OrNogdlgitlS26m/bpcotVxSFTKnDWeAr50F4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=deBFpZDyD7Ytv7er+9351gbbtNrttVAi3jZjoadiPO4=;
        b=IoDdPGuetaHmRm9racX1Xk1j4V1T7oTcTVdbU8XIEOIQyKIzFUQhv+MNEa52qNIAy9
         WvLHMsRNASePhuD6172ZS3ytabqum5GcYyQaNM3MHW6VbYcWWlMbiJ1jyoKc3MjG/gfW
         97Q1A33PKJBpNiWnfMtiSz1VAEB7wTT4C4OaBFPwesWrpqjnNu9KVEtMcjIPQ2WRBdbt
         LPv3U+XmmTW0scaTt+4Vvb4ylznFq9NIAw8j5pRYvpFe0ez/5eG49X1bmr9bvP4fX/2N
         /Um+wLjf7rM2/EhM0A9A1pWrRa3kyEXtTUCzoExqJXeOlh0hVKY1kyvBPeK7hiKEl2pa
         UtWA==
X-Gm-Message-State: AGi0PuYIOcB6Dyj3qG4n+uqIB1HV6JPv2yRNUcviidIhqR5Gwa9vIfnK
        7MTwFp43eqtkAnq0DIScD2gL+PergznJaTnaZl0Isw==
X-Google-Smtp-Source: APiQypLa3Y84foLnht3d7ZcPNR2FZ3H6bsD5C/40pRpZ5N6wW+C1v22NLJcYfxdC783HNctofY9OsgbQwCLqMroI8Ls=
X-Received: by 2002:a9d:7c92:: with SMTP id q18mr7889489otn.281.1588591141860;
 Mon, 04 May 2020 04:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200504010912.982044-1-ira.weiny@intel.com> <20200504010912.982044-12-ira.weiny@intel.com>
In-Reply-To: <20200504010912.982044-12-ira.weiny@intel.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 4 May 2020 13:18:51 +0200
Message-ID: <CAKMK7uF4fd3upBYSQEzs==Nx7osn=wZPnxoKLKm9HTxwU_sZ+w@mail.gmail.com>
Subject: Re: [PATCH V2 11/11] drm: Remove drm specific kmap_atomic code
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
        linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Ingo Molnar <mingo@redhat.com>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 4, 2020 at 3:09 AM <ira.weiny@intel.com> wrote:
>
> From: Ira Weiny <ira.weiny@intel.com>
>
> kmap_atomic_prot() is now exported by all architectures.  Use this
> function rather than open coding a driver specific kmap_atomic.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

I'm assuming this lands through some other tree or a topic branch or whatev=
er.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c    | 56 ++--------------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 16 ++++----
>  include/drm/ttm/ttm_bo_api.h         |  4 --
>  3 files changed, 12 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 52d2b71f1588..f09b096ba4fd 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -257,54 +257,6 @@ static int ttm_copy_io_page(void *dst, void *src, un=
signed long page)
>         return 0;
>  }
>
> -#ifdef CONFIG_X86
> -#define __ttm_kmap_atomic_prot(__page, __prot) kmap_atomic_prot(__page, =
__prot)
> -#define __ttm_kunmap_atomic(__addr) kunmap_atomic(__addr)
> -#else
> -#define __ttm_kmap_atomic_prot(__page, __prot) vmap(&__page, 1, 0,  __pr=
ot)
> -#define __ttm_kunmap_atomic(__addr) vunmap(__addr)
> -#endif
> -
> -
> -/**
> - * ttm_kmap_atomic_prot - Efficient kernel map of a single page with
> - * specified page protection.
> - *
> - * @page: The page to map.
> - * @prot: The page protection.
> - *
> - * This function maps a TTM page using the kmap_atomic api if available,
> - * otherwise falls back to vmap. The user must make sure that the
> - * specified page does not have an aliased mapping with a different cach=
ing
> - * policy unless the architecture explicitly allows it. Also mapping and
> - * unmapping using this api must be correctly nested. Unmapping should
> - * occur in the reverse order of mapping.
> - */
> -void *ttm_kmap_atomic_prot(struct page *page, pgprot_t prot)
> -{
> -       if (pgprot_val(prot) =3D=3D pgprot_val(PAGE_KERNEL))
> -               return kmap_atomic(page);
> -       else
> -               return __ttm_kmap_atomic_prot(page, prot);
> -}
> -EXPORT_SYMBOL(ttm_kmap_atomic_prot);
> -
> -/**
> - * ttm_kunmap_atomic_prot - Unmap a page that was mapped using
> - * ttm_kmap_atomic_prot.
> - *
> - * @addr: The virtual address from the map.
> - * @prot: The page protection.
> - */
> -void ttm_kunmap_atomic_prot(void *addr, pgprot_t prot)
> -{
> -       if (pgprot_val(prot) =3D=3D pgprot_val(PAGE_KERNEL))
> -               kunmap_atomic(addr);
> -       else
> -               __ttm_kunmap_atomic(addr);
> -}
> -EXPORT_SYMBOL(ttm_kunmap_atomic_prot);
> -
>  static int ttm_copy_io_ttm_page(struct ttm_tt *ttm, void *src,
>                                 unsigned long page,
>                                 pgprot_t prot)
> @@ -316,13 +268,13 @@ static int ttm_copy_io_ttm_page(struct ttm_tt *ttm,=
 void *src,
>                 return -ENOMEM;
>
>         src =3D (void *)((unsigned long)src + (page << PAGE_SHIFT));
> -       dst =3D ttm_kmap_atomic_prot(d, prot);
> +       dst =3D kmap_atomic_prot(d, prot);
>         if (!dst)
>                 return -ENOMEM;
>
>         memcpy_fromio(dst, src, PAGE_SIZE);
>
> -       ttm_kunmap_atomic_prot(dst, prot);
> +       kunmap_atomic(dst);
>
>         return 0;
>  }
> @@ -338,13 +290,13 @@ static int ttm_copy_ttm_io_page(struct ttm_tt *ttm,=
 void *dst,
>                 return -ENOMEM;
>
>         dst =3D (void *)((unsigned long)dst + (page << PAGE_SHIFT));
> -       src =3D ttm_kmap_atomic_prot(s, prot);
> +       src =3D kmap_atomic_prot(s, prot);
>         if (!src)
>                 return -ENOMEM;
>
>         memcpy_toio(dst, src, PAGE_SIZE);
>
> -       ttm_kunmap_atomic_prot(src, prot);
> +       kunmap_atomic(src);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_blit.c
> index bb46ca0c458f..94d456a1d1a9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -374,12 +374,12 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_=
line_data *d,
>                 copy_size =3D min_t(u32, copy_size, PAGE_SIZE - src_page_=
offset);
>
>                 if (unmap_src) {
> -                       ttm_kunmap_atomic_prot(d->src_addr, d->src_prot);
> +                       kunmap_atomic(d->src_addr);
>                         d->src_addr =3D NULL;
>                 }
>
>                 if (unmap_dst) {
> -                       ttm_kunmap_atomic_prot(d->dst_addr, d->dst_prot);
> +                       kunmap_atomic(d->dst_addr);
>                         d->dst_addr =3D NULL;
>                 }
>
> @@ -388,8 +388,8 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_li=
ne_data *d,
>                                 return -EINVAL;
>
>                         d->dst_addr =3D
> -                               ttm_kmap_atomic_prot(d->dst_pages[dst_pag=
e],
> -                                                    d->dst_prot);
> +                               kmap_atomic_prot(d->dst_pages[dst_page],
> +                                                d->dst_prot);
>                         if (!d->dst_addr)
>                                 return -ENOMEM;
>
> @@ -401,8 +401,8 @@ static int vmw_bo_cpu_blit_line(struct vmw_bo_blit_li=
ne_data *d,
>                                 return -EINVAL;
>
>                         d->src_addr =3D
> -                               ttm_kmap_atomic_prot(d->src_pages[src_pag=
e],
> -                                                    d->src_prot);
> +                               kmap_atomic_prot(d->src_pages[src_page],
> +                                                d->src_prot);
>                         if (!d->src_addr)
>                                 return -ENOMEM;
>
> @@ -499,9 +499,9 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>         }
>  out:
>         if (d.src_addr)
> -               ttm_kunmap_atomic_prot(d.src_addr, d.src_prot);
> +               kunmap_atomic(d.src_addr);
>         if (d.dst_addr)
> -               ttm_kunmap_atomic_prot(d.dst_addr, d.dst_prot);
> +               kunmap_atomic(d.dst_addr);
>
>         return ret;
>  }
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 0a9d042e075a..de1ccdcd5703 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -668,10 +668,6 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, stru=
ct ttm_buffer_object *bo);
>  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
>                 struct ttm_bo_device *bdev);
>
> -void *ttm_kmap_atomic_prot(struct page *page, pgprot_t prot);
> -
> -void ttm_kunmap_atomic_prot(void *addr, pgprot_t prot);
> -
>  /**
>   * ttm_bo_io
>   *
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
