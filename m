Return-Path: <linux-mips+bounces-10717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EEAB39759
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 10:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E6A1C2759B
	for <lists+linux-mips@lfdr.de>; Thu, 28 Aug 2025 08:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E73B2EBDD3;
	Thu, 28 Aug 2025 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p29dZu8R"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97482EBDC2
	for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370637; cv=none; b=edAJUuIWJu/OVh4yDztwR2aRF7AURuxPg2MsYqNbnts5H428Ln5Vl/y2kzxTR1GWQUsh6UGpWQAo1uYI1LYjcBG1JU4SKVJSRHNfw/g97Bu2IQvJWzax108QnEoHBAPj0tiD7I2gmq76/GYn9R/yeCnkFNiEElJ/qyWPpdWXwhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370637; c=relaxed/simple;
	bh=dtF3GY0txqUlnrqvH6O65DtDqS/OwB3kNXWzpcWqR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbDal5KV4PpHf4M1L8eq7eAKsAHmY71nDYaBVClFbFH+MJjrXxLFcCO0EXtkKqkNMAixejj3r3eoYay4fZgzf+MVBeGPkrPIZwjNEsLiPgyTvgrnLA0maW3zLZo6FwwNuGJsgbgEqe2UrtKzTuefhgZU1siuHZBvh9wIGyLz5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p29dZu8R; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24456ce0b96so8419525ad.0
        for <linux-mips@vger.kernel.org>; Thu, 28 Aug 2025 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756370633; x=1756975433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLT2osl3N94HJBBJWKPAk2avCo16Lo88yw1WJjz/wsM=;
        b=p29dZu8RbOb7kdgd3ZtBE+clhKPFI9QwXvom3vRpu7v7a1BNfOf04PU5L6eIb+0FBr
         ZJ7mWZfZ2mcXw1UHzo0Vs9d33gwzevLkpSu0YJr2E2fKiWCrzULRqrXnPXb5kSTJ3ER1
         lekjoGVJMRclMo/7IcBNF97sqSiEiVAty0uAbdjvDiroutPRgdOc+q//92w7WV45D9pi
         e1UtjxHBW+qEvW8peS4A2hkdOiciAuwA9wtJGZwCluOTwVwjbKgf5e+TmJfJSwogxt8I
         /2BnHGYkw7OpFqwTxwo1VxGML77arPgfw3R+ucnsXcN4AJBKvuEX402Rpp+gQpculFrr
         AiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756370633; x=1756975433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLT2osl3N94HJBBJWKPAk2avCo16Lo88yw1WJjz/wsM=;
        b=hZ6OuXv8P8eq9yhm7ezwisd/Zc49i1WCYCg0vbhkF/lm3lyRTZPDuokyPJTQVBCp3t
         KNV3Ttq4/YK2Tppe58jnmNM07chKgzq+Ivfpt7V83PczfNl/OuF5uKM7cuQeICrR3VO7
         yhLdTnGPInbkChznFbIkcTL1ruHIEpQFb17A0BZ1dmP5D6rxE6GyFAQZuO46fqHYqeoA
         icSZ5zA7MVPPd/jeeuGwWpbU/1yA2zwE1kxgidPLf9hDIiDsgZpQwtNxoOztc+H0w26p
         dPxixsRqvJHwZU/NllfkiqDHUJ2kiSaCStTaCzJDFXMQjGi5TI8gmari4JiLJhYJaE96
         qOBw==
X-Forwarded-Encrypted: i=1; AJvYcCViPkftWJlRPH5QTT6PebYIikPFMQvCepADnAGb2QMOCECBA0YD9Ji24qM0XFY2qrmBMdZU5Wf3VuiG@vger.kernel.org
X-Gm-Message-State: AOJu0YzNkt+l7wX4duYmqIKywDM8IMr+kpUZntddMiuHOCqTjcvQ0cBe
	BvvmsUsAwp0KhmzrcPYlb8criNy9RPnuqqaXO7L2lAHI5m9IQcJhTJ0U8f6iuB65tdphTusXZ+1
	zqxS3U2MxAQJ2odGGY5JF56YAhEb21BoSAcoGIg+1
X-Gm-Gg: ASbGncuzsF1TkJjuK5vnmp8q4dWauFYCVlmLSeefefTBdC+QtNYKhFGBL5oVZdXK3jW
	FgVDYr27i125zaFNw8Z+me9jJhgcQ5WnzmegJfTuKw1p7XoB7ZqcPUEaICEtLRIqn7NB4vsX4GU
	U6YUrNmli8BDQee5kSZtTfcIoCBOcGxEzHevyMslDtl5hjmLbKb0Oh0Fq/Oj9e6rFHB7hzxIUxv
	XKu8tu6/8LN/BaYpxwrc+fdLow=
X-Google-Smtp-Source: AGHT+IGJmjz+YHPyNxr90AMhiQNNDQu9deq8PWwNfyq+zFWi/YcgUyPYkmS3VX3aACMgtkUmoKeOvBcyBRDmMb3NDeE=
X-Received: by 2002:a17:903:3d06:b0:248:8063:a8b4 with SMTP id
 d9443c01a7336-2488063abcbmr89508125ad.22.1756370632768; Thu, 28 Aug 2025
 01:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827220141.262669-1-david@redhat.com> <20250827220141.262669-35-david@redhat.com>
In-Reply-To: <20250827220141.262669-35-david@redhat.com>
From: Marco Elver <elver@google.com>
Date: Thu, 28 Aug 2025 10:43:16 +0200
X-Gm-Features: Ac12FXwMzUnIHp_v7uH0kV3Hu6ram9vqgPmCMZ3TyuNNAlhDfe6K8rTgx1FpO8k
Message-ID: <CANpmjNP8-dM-cizCfsVOUNDS2jBaY6d=0Wx8OGen5RbXgaqcfQ@mail.gmail.com>
Subject: Re: [PATCH v1 34/36] kfence: drop nth_page() usage
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	iommu@lists.linux.dev, io-uring@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, 
	x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Aug 2025 at 00:11, 'David Hildenbrand' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> We want to get rid of nth_page(), and kfence init code is the last user.
>
> Unfortunately, we might actually walk a PFN range where the pages are
> not contiguous, because we might be allocating an area from memblock
> that could span memory sections in problematic kernel configs (SPARSEMEM
> without SPARSEMEM_VMEMMAP).
>
> We could check whether the page range is contiguous
> using page_range_contiguous() and failing kfence init, or making kfence
> incompatible these problemtic kernel configs.
>
> Let's keep it simple and simply use pfn_to_page() by iterating PFNs.
>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Marco Elver <elver@google.com>

Thanks.

> ---
>  mm/kfence/core.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 0ed3be100963a..727c20c94ac59 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -594,15 +594,14 @@ static void rcu_guarded_free(struct rcu_head *h)
>   */
>  static unsigned long kfence_init_pool(void)
>  {
> -       unsigned long addr;
> -       struct page *pages;
> +       unsigned long addr, start_pfn;
>         int i;
>
>         if (!arch_kfence_init_pool())
>                 return (unsigned long)__kfence_pool;
>
>         addr = (unsigned long)__kfence_pool;
> -       pages = virt_to_page(__kfence_pool);
> +       start_pfn = PHYS_PFN(virt_to_phys(__kfence_pool));
>
>         /*
>          * Set up object pages: they must have PGTY_slab set to avoid freeing
> @@ -613,11 +612,12 @@ static unsigned long kfence_init_pool(void)
>          * enters __slab_free() slow-path.
>          */
>         for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> -               struct slab *slab = page_slab(nth_page(pages, i));
> +               struct slab *slab;
>
>                 if (!i || (i % 2))
>                         continue;
>
> +               slab = page_slab(pfn_to_page(start_pfn + i));
>                 __folio_set_slab(slab_folio(slab));
>  #ifdef CONFIG_MEMCG
>                 slab->obj_exts = (unsigned long)&kfence_metadata_init[i / 2 - 1].obj_exts |
> @@ -665,10 +665,12 @@ static unsigned long kfence_init_pool(void)
>
>  reset_slab:
>         for (i = 0; i < KFENCE_POOL_SIZE / PAGE_SIZE; i++) {
> -               struct slab *slab = page_slab(nth_page(pages, i));
> +               struct slab *slab;
>
>                 if (!i || (i % 2))
>                         continue;
> +
> +               slab = page_slab(pfn_to_page(start_pfn + i));
>  #ifdef CONFIG_MEMCG
>                 slab->obj_exts = 0;
>  #endif
> --
> 2.50.1
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20250827220141.262669-35-david%40redhat.com.

