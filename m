Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD3C24A124
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 16:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgHSOFE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 10:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbgHSOFB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 10:05:01 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3664C061757
        for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2020 07:05:00 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id d6so26438640ejr.5
        for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2020 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6xkguvOzsgzZf/2nZcmiUdLktaalZbMKG8kwCTKJnbQ=;
        b=m4IkKgPlDJh9Ow/m1Q5dtgZrYLnaRCS7od5vd7CevPl4aSkNJcXDYSbofI9IVrnSM1
         T0Nk8lAEv28vGxYfqJpLVc+ygPg3eNS610ZSiKpYmXTIZXUzbw+fr6qoGPkql89ad0SH
         sz82upHUpsjkfyqDK6oYGAHuFg3NLWv3KpWnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6xkguvOzsgzZf/2nZcmiUdLktaalZbMKG8kwCTKJnbQ=;
        b=ukbA9/duNsTVeAdOBdXYlD4loBDc2Uy8kX0Aze9TXh6Hqs9QbHZGhn5PO5G+KyhkmL
         pxAvvcMhi3nhn2ml5b2NrwHyJYFsXa5690sNq8eZ+opITX1zKt58peVkRAaEp0oTneJy
         OjHVl6fy+P030Ctug4avmXzPs8kXsHASMGWeUoJ77ReP6VzwNRvDylxcsa3/zR+vBjkg
         l201k2BTGUr1rN24HsPCae57UH/9zUOAImxmIE146VCmPinY4ESkC+lKocP+pE/JUuYj
         8DyXb1UoXy2KtC9a7OEiRPfTuhA327+b1CGBRJMYjLVyFdcr/yw5eohsdfz4yl4P5Ky0
         /Y0A==
X-Gm-Message-State: AOAM533MbLT5i1FQh4Min1McklaUCjMZ7/VXJtSWMDdtuRJv4GnxXOlJ
        bCwzWlefciajgl4cs5gL2orMngLZuKKQ5w==
X-Google-Smtp-Source: ABdhPJwL0luV0U2BOhuSLXtjRDSKGX07TsKU/Oqq4bh2PZrVhWoLKXCRBttM8QOpUzCvTGOy8/+mtQ==
X-Received: by 2002:a17:906:78e:: with SMTP id l14mr26932861ejc.67.1597845899269;
        Wed, 19 Aug 2020 07:04:59 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id gl20sm18964789ejb.86.2020.08.19.07.04.58
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 07:04:59 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id c19so1744560wmd.1
        for <linux-mips@vger.kernel.org>; Wed, 19 Aug 2020 07:04:58 -0700 (PDT)
X-Received: by 2002:a1c:5581:: with SMTP id j123mr5137250wmb.11.1597845489930;
 Wed, 19 Aug 2020 06:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com> <20200819135454.GA17098@lst.de>
In-Reply-To: <20200819135454.GA17098@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 19 Aug 2020 15:57:53 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
Message-ID: <CAAFQd5BuXP7t3d-Rwft85j=KTyXq7y4s24mQxLr=VoY9krEGZw@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        alsa-devel@alsa-project.org,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-parisc@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-nvme@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 19, 2020 at 3:55 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 01:16:51PM +0200, Tomasz Figa wrote:
> > Hi Christoph,
> >
> > On Wed, Aug 19, 2020 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > The V4L2-FLAG-MEMORY-NON-CONSISTENT flag is entirely unused,
> >
> > Could you explain what makes you think it's unused? It's a feature of
> > the UAPI generally supported by the videobuf2 framework and relied on
> > by Chromium OS to get any kind of reasonable performance when
> > accessing V4L2 buffers in the userspace.
>
> Because it doesn't do anything except on PARISC and non-coherent MIPS,
> so by definition it isn't used by any of these media drivers.

It's still an UAPI feature, so we can't simply remove the flag, it
must stay there as a no-op, until the problem is resolved.

Also, it of course might be disputable as an out-of-tree usage, but
selecting CONFIG_DMA_NONCOHERENT_CACHE_SYNC makes the flag actually do
something on other platforms, including ARM64.

Best regards,
Tomasz
