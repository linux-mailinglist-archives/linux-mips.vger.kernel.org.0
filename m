Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4520024B589
	for <lists+linux-mips@lfdr.de>; Thu, 20 Aug 2020 12:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbgHTKZE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Aug 2020 06:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbgHTKYy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Aug 2020 06:24:54 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C78EC061342
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 03:24:49 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i6so1168865edy.5
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FU3+CiJFzLHmOFDuQMwlaisWRGuHRN+5AV6txupwZrU=;
        b=QFNCCjnhRiVXX1RwHJMrjJrm3FMIDmNx/PgDGVaGoYPr2orRHBTBO48N0vE/bjgnJ+
         SYuYytDiRhiYZtZgJZ7z4/4vPKus2MwWgTKmnlMmLZQ4o8gAgDqGKHg0dO0uTStdh95b
         tHYxvzFh9iEVHBmlKA/EhqmNwNT52r2I3xUhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FU3+CiJFzLHmOFDuQMwlaisWRGuHRN+5AV6txupwZrU=;
        b=HKfZXbh/NkziFDH7Ob/QaDhzqTNLK/MphUc2Ldmv7CtapTqgYOy/oLb000N5a8TarM
         SqTmKcBV52EUHWgkU/tzmSoSjoIpW41r62xsP89AhsD+qnWvnm0ouwbz1bBUOMmPbW+A
         ABhznXpRBkUxgXKV4jBeaElT7BgeikZdfnmm1ediOOlfv54v+xt2pp3IKOttZht+OvWB
         Woy/bFDbCSyf663G/+1A12AJwjwbsUp5/svQ1eUSNd3OWMtbx6aHF/g9mMZZyAGuZgc1
         uY3W6PI/KjKwGa6OByR8A3QZrvz1E+mRQUoCuVPLTk35NdBQ0iyexCT0z+s2H1298/EF
         DK/A==
X-Gm-Message-State: AOAM531IKmXOewBE5BUngdoRqX1YK5Ddhh6p5Njsd8GdJFdx8ZrjMEGX
        hV7xcXvKvSoECchnPX2RK3sRAprImyQoqgDq
X-Google-Smtp-Source: ABdhPJwPua1c0UmBuai8WOg7lZqt0snynQGdFJXBzxLk4iPsRhCTpZCB6QoYJNEDVLIP1xKE7PGJhw==
X-Received: by 2002:aa7:d70a:: with SMTP id t10mr2180905edq.68.1597919087507;
        Thu, 20 Aug 2020 03:24:47 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id s5sm1150673ejv.67.2020.08.20.03.24.46
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:24:47 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id l2so1495976wrc.7
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 03:24:46 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr2717742wrw.105.1597919084826;
 Thu, 20 Aug 2020 03:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com> <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com> <20200820050214.GA4815@lst.de>
In-Reply-To: <20200820050214.GA4815@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 12:24:31 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
Message-ID: <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, alsa-devel@alsa-project.org,
        linux-ia64@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-scsi@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Pawel Osciak <pawel@osciak.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 20, 2020 at 7:02 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 03:07:04PM +0100, Robin Murphy wrote:
> >> FWIW, I asked back in time what the plan is for non-coherent
> >> allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> >> dma_sync_*() was supposed to be the right thing to go with. [2] The
> >> same thread also explains why dma_alloc_pages() isn't suitable for the
> >> users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.
> >
> > AFAICS even back then Christoph was implying getting rid of NON_CONSISTENT
> > and *replacing* it with something streaming-API-based - i.e. this series -
> > not encouraging mixing the existing APIs. It doesn't seem impossible to
> > implement a remapping version of this new dma_alloc_pages() for
> > IOMMU-backed ops if it's really warranted (although at that point it seems
> > like "non-coherent" vb2-dc starts to have significant conceptual overlap
> > with vb2-sg).
>
> You can alway vmap the returned pages from dma_alloc_pages, but it will
> make cache invalidation hell - you'll need to use
> invalidate_kernel_vmap_range and flush_kernel_vmap_range to properly
> handle virtually indexed caches.
>
> Or with remapping you mean using the iommu do de-scatter/gather?

Ideally, both.

For remapping in the CPU sense, there are drivers which rely on a
contiguous kernel mapping of the vb2 buffers, which was provided by
dma_alloc_attrs(). I think they could be reworked to work on single
pages, but that would significantly complicate the code. At the same
time, such drivers would actually benefit from a cached mapping,
because they often have non-bursty, random access patterns.

Then, in the IOMMU sense, the whole idea of videobuf2-dma-contig is to
rely on the DMA API to always provide device-contiguous memory, as
required by the hardware which only has a single pointer and size.

>
> You can implement that trivially implement it yourself for the iommu
> case:
>
> {
>         merge_boundary = dma_get_merge_boundary(dev);
>         if (!merge_boundary || merge_boundary > chunk_size - 1) {
>                 /* can't coalesce */
>                 return -EINVAL;
>         }
>
>
>         nents = DIV_ROUND_UP(total_size, chunk_size);
>         sg = sgl_alloc();
>         for_each_sgl() {
>                 sg->page = __alloc_pages(get_order(chunk_size))
>                 sg->len = chunk_size;
>         }
>         dma_map_sg(sg, DMA_ATTR_SKIP_CPU_SYNC);
>         // you are guaranteed to get a single dma_addr out
> }
>
> Of course this still uses the scatterlist structure with its annoying
> mix of input and output parametes, so I'd rather not expose it as
> an official API at the DMA layer.

The problem with the above open coded approach is that it requires
explicit handling of the non-IOMMU and IOMMU cases and this is exactly
what we don't want to have in vb2 and what was actually the job of the
DMA API to hide. Is the plan to actually move the IOMMU handling out
of the DMA API?

Do you think we could instead turn it into a dma_alloc_noncoherent()
helper, which has similar semantics as dma_alloc_attrs() and handles
the various corner cases (e.g. invalidate_kernel_vmap_range and
flush_kernel_vmap_range) to achieve the desired functionality without
delegating the "hell", as you called it, to the users?

Best regards,
Tomasz
