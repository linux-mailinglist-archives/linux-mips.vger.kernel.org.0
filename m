Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299F324C4B2
	for <lists+linux-mips@lfdr.de>; Thu, 20 Aug 2020 19:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgHTRlh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Aug 2020 13:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgHTRlV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Aug 2020 13:41:21 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F5DC061342
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 10:41:20 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o23so3532871ejr.1
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 10:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdWdmS9KmpqRDKTTx4ZFKlZV0sk8Q5cLOhIOkZ1gD+w=;
        b=cAZtzVYP2n3YvXgVkbJ7dbST+g3SP0UPbXQ9iKKyhX4VXr8jHpSYHqZMaG5ucNVipI
         bzzpnQCIz78GKzn14VpRAj8Y6mpMr87iyH7UMbPsjr5O6z0niDquexdhhjTmn1y5QjQv
         l8iJOpqbyOslL4LKhF6zS+g3cTQ+z78POnoVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdWdmS9KmpqRDKTTx4ZFKlZV0sk8Q5cLOhIOkZ1gD+w=;
        b=h3u/KrYsu/xEJvHBOHnzEY1SnA0KL5Tup1ewYLmxV6kVuPHZYMeRVW4TqqYTceYFnk
         Mz9Ub5lvlJXvmyjHdW+MMtq7Glw2O+DN44nYx3Q+34GVbiJ/e3fXaWpJTAs9mLaAH/C0
         HlCl+k09WqZm04c8av+TVqV5ZZxBFpdTZhpbkAhTDgEJaUI+IeU4jRv0iJZcdPcAKat0
         W26HtDKTOvOHSv0zZ2ZaoG17EYt2jZCdhRVpeFhc4jvk2UGxRipKwDgE++UgkRZHmKFE
         Cumaa0jzUuyh6/d1LjQNlIH/0RldCXBBOqwloNeSBajAHXeVB7RRKV5++wIo3QwVghbx
         F9SA==
X-Gm-Message-State: AOAM531AZx0tO1z3/83WNqPaNo//0WA0rXZWY9EHKF6Vp2MObpeBQ/od
        QjTO2RLLEk4up9dH7LOSB4JbRMx2RxdOwg==
X-Google-Smtp-Source: ABdhPJzB0Bm8lXP340kwm9TilSdL7stjYJ7HXKj2es8jORAC4YkgRB7ZLI76KnbJ58PzdGtTqMJBBw==
X-Received: by 2002:a17:906:d209:: with SMTP id w9mr4277317ejz.93.1597945279372;
        Thu, 20 Aug 2020 10:41:19 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id x21sm1654875edq.84.2020.08.20.10.41.17
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 10:41:18 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id c80so2399723wme.0
        for <linux-mips@vger.kernel.org>; Thu, 20 Aug 2020 10:41:17 -0700 (PDT)
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr4512279wmh.55.1597945276327;
 Thu, 20 Aug 2020 10:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com> <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com> <20200820050214.GA4815@lst.de>
 <CAAFQd5AknYpP5BamC=wJkEJyO-q47V6Gc+HT65h6B+HyT+-xjQ@mail.gmail.com> <20200820165213.GC12693@lst.de>
In-Reply-To: <20200820165213.GC12693@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 19:41:03 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BcH-_S=WDvqYvSPxMvQuN5atO8q=xktbMaPS-DOCAYbw@mail.gmail.com>
Message-ID: <CAAFQd5BcH-_S=WDvqYvSPxMvQuN5atO8q=xktbMaPS-DOCAYbw@mail.gmail.com>
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

On Thu, Aug 20, 2020 at 6:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 20, 2020 at 12:24:31PM +0200, Tomasz Figa wrote:
> > > Of course this still uses the scatterlist structure with its annoying
> > > mix of input and output parametes, so I'd rather not expose it as
> > > an official API at the DMA layer.
> >
> > The problem with the above open coded approach is that it requires
> > explicit handling of the non-IOMMU and IOMMU cases and this is exactly
> > what we don't want to have in vb2 and what was actually the job of the
> > DMA API to hide. Is the plan to actually move the IOMMU handling out
> > of the DMA API?
> >
> > Do you think we could instead turn it into a dma_alloc_noncoherent()
> > helper, which has similar semantics as dma_alloc_attrs() and handles
> > the various corner cases (e.g. invalidate_kernel_vmap_range and
> > flush_kernel_vmap_range) to achieve the desired functionality without
> > delegating the "hell", as you called it, to the users?
>
> Yes, I guess I could do something in that direction.  At least for
> dma-iommu, which thanks to Robin should be all you'll need in the
> foreseeable future.

That would be really great. Let me know if we can help by testing with
V4L2/vb2 or in any other way.

Best regards,
Tomasz
