Return-Path: <linux-mips+bounces-10443-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2427B306E0
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 22:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 151CE7B387C
	for <lists+linux-mips@lfdr.de>; Thu, 21 Aug 2025 20:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB632FC00B;
	Thu, 21 Aug 2025 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C4WRUAk7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3D52FC00D
	for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 20:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808280; cv=none; b=CJONEIsbfYvsaNPsrAtVH1eZFf/sAgpdhDARa/HLEDN8ijBJg3wjbX8ehGJxRZQSqiN2IC3dVZzV46aTxi2a+WzZiZNzqB+pPcSi3nQ3ulR1B9DADxf6cl0zx5psE4b0V0KQ1KfRXhd/nFZSP2e1JH7DyJxZRvN+2JpFs5QhjUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808280; c=relaxed/simple;
	bh=oA3XFTq+X9InxrtY53OI1FqTpqPTKR+1uoMqvtlA0+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtRja/teoGQiRVJSZpaVvOMXF+Dij8ufGDOtEF8z4AuAeRquwOBqJbmN7qe0CZVY8NGLP5mvJUvDwVBtHeypZUad3Ev4644uN9KTSKkXWvvA5pwy/6bcq7Y83TS8qSk7oRFNRmh84qYdhLdh+O+SZYPTdTbrukupXQRJCq8/AnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C4WRUAk7; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e870316b79so165547885a.0
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808277; x=1756413077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
        b=C4WRUAk76RbrOfHYvfAWJk84qmqrm6T43s3Wj6rHo/QCfD/QRtQ3RS0jj2zREigR+V
         AY5F2KhOuciURbE49lyZrMQe+PqXwX8DywahB9Dxznbg3TCTf3FvME7/FAVupHfxMtP4
         sgYrwhZ+4aLAQ/uEsfZjd956GS/6JrMeEvAKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808277; x=1756413077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
        b=KpYCCtHg77BF1Gw1OKnkq7DAt7hInAqdF5FVIcM6xVx2/jnkmbdS1YKNvrVxd3ylZT
         kRbUVXeFp3XxJYoyvrrVf2W23BEFfN66kIpA4kflAilt3XKGSyWPP5O6OOXlo552qmDo
         J4kER32sOJf8UcUlYeSx4EMo6hpn5prev/B9mUzeKpazh4fNZ3XglxcUZvYW3HOI0TyM
         zib1yMQmMP8kTRHkxw+gumMbmeDnnAKnJUBmdM4Wf9T33boCeXc96ByrddWY+lfewVGa
         CSULWDstCkyyCItd4XuTVURgCRerVCapJENlJXXUSgGZcvEVAwqIxYlp+BNnpNqeGdp9
         Jk+w==
X-Forwarded-Encrypted: i=1; AJvYcCVi+SkvyMUtdT+kByjIcSnOJnFgu9LYfT0EpaGqMg9kFZqDTxyitTRD6poevJzcySJltmYVvXnFx2aj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3VCoKz52iQCt0sdTRNCLJR3A5lN3yAUkWWtAJzBcNzVIZr7oP
	Vv5rvsRW9AUg8B3SZjrar7ZfbbON7mrDiY5hpcUt9dZCOdQdOKqEDxOzjlomYqnLUb+gy3G7QDV
	38BFYhx6uXQ==
X-Gm-Gg: ASbGncsVppsvqI8uI9QYU+dvnWnWWCPFTzz/IPjfaCnphr6fHy/adSi0jde7zbdc+jH
	RgglgHcO2Zui/QryJGIswncE7ulsyR7jmYvF93RlLkGaGAiuNiyobvdBBRvF/Bf3AW9p6wx6qnM
	PafbgL8wQHwUsOnf4uf3CD3Rd2RHFSopcqiepELuQH4eW88o/GHYzLNxvO1k21+JhzadrBvNIc/
	uRzz6shLUmmX9Uj14gGiLohUOgpD1b9F9tAPUvPYswmJKDmmhGaH/CCLsZbIDARZrKehzqARG3M
	VnumkDSiU6WgW6zCx/TqDTQVYW/h34K8ppFkU2RsKEo9dSgYkPj0y9QqhiFOgFFblQxURyYSEiL
	c2/QV2cgUDl/0ZbpChKES8ndppfSugMAZbocwk3QSEw9n+M4/j0eH7UenQO+YojYm4Lv5OoFc+H
	rj
X-Google-Smtp-Source: AGHT+IGBLHJQjPLYxO06WSVRN8vVL21gZs/QCE1oEKTA1ih/17ZtvSC1VXsrJYAdcEfo9YPt6z9o6A==
X-Received: by 2002:a05:6214:2aab:b0:707:63b8:3d46 with SMTP id 6a1803df08f44-70d9727cf86mr11708216d6.30.1755808276608;
        Thu, 21 Aug 2025 13:31:16 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f819sm112394556d6.9.2025.08.21.13.31.16
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:31:16 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b109919a09so17881811cf.0
        for <linux-mips@vger.kernel.org>; Thu, 21 Aug 2025 13:31:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJo0786A9b21L6l5yY+sn/x+EODPV1723thY4/PZ9Dd2dGsz3k5AtI7WUCrhAmNprf9a7lifTn/dij@vger.kernel.org
X-Received: by 2002:a05:6122:1ad2:b0:53c:896e:2870 with SMTP id
 71dfb90a1353d-53c8a40b923mr212315e0c.12.1755807884664; Thu, 21 Aug 2025
 13:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
In-Reply-To: <20250821200701.1329277-32-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:24:23 -0400
X-Gmail-Original-Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
X-Gm-Features: Ac12FXxaZhwn04a0gbwY6rjh9UGLxnRlGOG0Jy0WjRbVAG0UxLDqNy0Wydj0GQk
Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
Subject: Re: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Jackman <jackmanb@google.com>, 
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	iommu@lists.linux.dev, io-uring@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@axis.com, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, 
	x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Aug 2025 at 16:08, David Hildenbrand <david@redhat.com> wrote:
>
> -       page = nth_page(page, offset >> PAGE_SHIFT);
> +       page += offset / PAGE_SIZE;

Please keep the " >> PAGE_SHIFT" form.

Is "offset" unsigned? Yes it is, But I had to look at the source code
to make sure, because it wasn't locally obvious from the patch. And
I'd rather we keep a pattern that is "safe", in that it doesn't
generate strange code if the value might be a 's64' (eg loff_t) on
32-bit architectures.

Because doing a 64-bit shift on x86-32 is like three cycles. Doing a
64-bit signed division by a simple constant is something like ten
strange instructions even if the end result is only 32-bit.

And again - not the case *here*, but just a general "let's keep to one
pattern", and the shift pattern is simply the better choice.

             Linus

