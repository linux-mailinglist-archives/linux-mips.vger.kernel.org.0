Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C908324A1B9
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 16:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgHSO2V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 10:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbgHSO2Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 10:28:16 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC12C061757
        for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2020 07:28:16 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a26so26549377ejc.2
        for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2020 07:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uEY7dk9y/9x4HcaWjwFAfwvm+T0doGz7atsT11F+few=;
        b=MwoQKU4RRVGBwswghQT2kEA4PWtzNJ9PP0GlvGH+VtAzrSvBnEW2dUpr0fs6tqB36t
         NEatNz3nTo9Srl8JZAX9oVp9pc5TQLgcK+vTRNeNePaaHI1s5H4G84GiGqxdAJ9X51ZU
         9RjLZl32ILMLyADH9W9JtyN4rfe/+nXKgJFvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uEY7dk9y/9x4HcaWjwFAfwvm+T0doGz7atsT11F+few=;
        b=CoNjWv9COOX0/pkWwmCofHSYaEPv7Pn2KSt76kwNu6AVPXZlTwaQfRDzju99ku8jgN
         hwGDOmUU5vO+IRzX9qjzOFfQ+SYg05lx7zOhZFdxa/G8LOiFlwZRkRMXr+PD+XuArykE
         yBXh1EVwyyo+88lPVmTrcS78oBmsOAknj47L9SAe2lSDiMNOTZvmQULawhxC/P5naUvV
         /ggG6ZueB4Xx3POqhXly0yWalz81pBrFIJxW/h9ZG+Mal+Yw8uJ1UXcPuzJmZxM06/Lz
         MsIgH/+wgiNP4xqtQvG0ClkL9h8yCzEVBsZlT3SPrVtFYIkQ94ztKhVXmTuJU7Z9ypZ7
         73FA==
X-Gm-Message-State: AOAM532hiLvNefS//1Dqa9JbKjQvTy1NrM4Q00PzAt1X0aYH8B8BIA0Q
        tj1GxxUjVp+DPBxHsTpn2Ke8YJ/6GL6R4g==
X-Google-Smtp-Source: ABdhPJybXOVm87l7NJjL9vmY6O/Htb+huFGh38RSt5uZJ/EUH1hImlB6j55eLDAg9knbXhrzSKS91A==
X-Received: by 2002:a17:906:d159:: with SMTP id br25mr4352621ejb.16.1597847294327;
        Wed, 19 Aug 2020 07:28:14 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id i35sm6682164edi.41.2020.08.19.07.28.13
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 07:28:14 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id a5so21757565wrm.6
        for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2020 07:28:13 -0700 (PDT)
X-Received: by 2002:adf:ec45:: with SMTP id w5mr25495420wrn.415.1597846966201;
 Wed, 19 Aug 2020 07:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com> <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com>
In-Reply-To: <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 19 Aug 2020 16:22:29 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DrEq7UVi_aH=-DO4xYC3SbjJ3m1aQSbt=8THL-W+orMQ@mail.gmail.com>
Message-ID: <CAAFQd5DrEq7UVi_aH=-DO4xYC3SbjJ3m1aQSbt=8THL-W+orMQ@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, alsa-devel@alsa-project.org,
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

On Wed, Aug 19, 2020 at 4:07 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-08-19 13:49, Tomasz Figa wrote:
> > On Wed, Aug 19, 2020 at 1:51 PM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> Hi Tomasz,
> >>
> >> On 2020-08-19 12:16, Tomasz Figa wrote:
> >>> Hi Christoph,
> >>>
> >>> On Wed, Aug 19, 2020 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
> >>>>
> >>>> The V4L2-FLAG-MEMORY-NON-CONSISTENT flag is entirely unused,
> >>>
> >>> Could you explain what makes you think it's unused? It's a feature of
> >>> the UAPI generally supported by the videobuf2 framework and relied on
> >>> by Chromium OS to get any kind of reasonable performance when
> >>> accessing V4L2 buffers in the userspace.
> >>>
> >>>> and causes
> >>>> weird gymanstics with the DMA_ATTR_NON_CONSISTENT flag, which is
> >>>> unimplemented except on PARISC and some MIPS configs, and about to be
> >>>> removed.
> >>>
> >>> It is implemented by the generic DMA mapping layer [1], which is used
> >>> by a number of architectures including ARM64 and supposed to be used
> >>> by new architectures going forward.
> >>
> >> AFAICS all that V4L2_FLAG_MEMORY_NON_CONSISTENT does is end up
> >> controling whether DMA_ATTR_NON_CONSISTENT is added to vb2_queue::dma_attrs.
> >>
> >> Please can you point to where DMA_ATTR_NON_CONSISTENT does anything at
> >> all on arm64?
> >>
> >
> > With the default config it doesn't, but with
> > CONFIG_DMA_NONCOHERENT_CACHE_SYNC enabled it makes dma_pgprot() keep
> > the pgprot value as is, without enforcing coherence attributes.
>
> How active are the PA-RISC and MIPS ports of Chromium OS?

Not active. We enable CONFIG_DMA_NONCOHERENT_CACHE_SYNC for ARM64,
given the directions received back in April when discussing the
noncoherent memory functionality on the mailing list in the thread I
pointed out in my previous message and no clarification on why it is
disabled for ARM64 in upstream, despite making several attempts to get
some.

>
> Hacking CONFIG_DMA_NONCOHERENT_CACHE_SYNC into an architecture that
> doesn't provide dma_cache_sync() is wrong, since at worst it may break
> other drivers. If downstream is wildly misusing an API then so be it,
> but it's hardly a strong basis for an upstream argument.

I guess it means that we're wildly misusing the API, but it still does
work. Could you explain how it could break other drivers?

>
> >> Also, I posit that videobuf2 is not actually relying on
> >> DMA_ATTR_NON_CONSISTENT anyway, since it's clearly not using it properly:
> >>
> >> "By using this API, you are guaranteeing to the platform
> >> that you have all the correct and necessary sync points for this memory
> >> in the driver should it choose to return non-consistent memory."
> >>
> >> $ git grep dma_cache_sync drivers/media
> >> $
> >
> > AFAIK dma_cache_sync() isn't the only way to perform the cache
> > synchronization. The earlier patch series that I reviewed relied on
> > dma_get_sgtable() and then dma_sync_sg_*() (which existed in the
> > vb2-dc since forever [1]). However, it looks like with the final code
> > the sgtable isn't acquired and the synchronization isn't happening, so
> > you have a point.
>
> Using the streaming sync calls on coherent allocations has also always
> been wrong per the API, regardless of the bodies of code that have
> happened to get away with it for so long.
>
> > FWIW, I asked back in time what the plan is for non-coherent
> > allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
> > dma_sync_*() was supposed to be the right thing to go with. [2] The
> > same thread also explains why dma_alloc_pages() isn't suitable for the
> > users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.
>
> AFAICS even back then Christoph was implying getting rid of
> NON_CONSISTENT and *replacing* it with something streaming-API-based -

That's not how I read his reply from the thread I pointed to, but that
might of course be my misunderstanding.

> i.e. this series - not encouraging mixing the existing APIs. It doesn't
> seem impossible to implement a remapping version of this new
> dma_alloc_pages() for IOMMU-backed ops if it's really warranted
> (although at that point it seems like "non-coherent" vb2-dc starts to
> have significant conceptual overlap with vb2-sg).

No, there is no overlap between vb2-dc and vb2-sg. They differ on
another level - the former is to be used by devices without
scatter-gather or internal mapping capabilities and gives the driver a
single DMA address for the whole buffer, regardless of whether it's
IOVA-contiguous (for devices behind an IOMMU) or physically contiguous
(for the others), while the latter gives the driver an sgtable, which
of course may be DMA-contiguous internally, but doesn't have to and
usually isn't. This model makes it possible to hide the SoC
implementation details from particular drivers, since those are very
often reused on many SoCs which differ in the availability of IOMMU,
DMA addressing restrictions and so on.

Best regards,
Tomasz
