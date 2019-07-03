Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7BD15E043
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2019 10:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfGCIyY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 3 Jul 2019 04:54:24 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35597 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfGCIyX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Jul 2019 04:54:23 -0400
Received: by mail-qt1-f194.google.com with SMTP id d23so1719730qto.2;
        Wed, 03 Jul 2019 01:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MSjZcZaarsSFJ2hu2ClYcmZVIX7oo4qCsiK4ex6LbOI=;
        b=rpJJNYR8pHarR3zG2F7L9hmYg0ADqULRTwBnnfisItIg4Y9v4IPIAT4ftXyKCvrAGC
         CSCwr2YDpqfAoHh0mkQ9JBfgDbt9w01AEwZ9MT6bjfs0o4AShkKByDGg9Q1XApfAMvr7
         OmAcsdu1cpavEm4BdC9dfEf4N9gPFUphSOMDQEdWt3MtWceCcMBO5FzN5z2CiSPlL45G
         qYAJAHuLgdp3p6kxYFJ3Wg0AvTaVtdhi4jxIbBrClTRCd8ITaHYCkBGlEoGqZi0JWD9X
         btT5/VdMiZgFty7TZJd7qLtv89hxjloHgM2x43/v691eeLRyCetIdFTb3Mf5fm/yMdvV
         rtmQ==
X-Gm-Message-State: APjAAAWZg9pjaNgHsirVvrj/cqLN520rZvGtkWQIJCHO5n4qEZuLy1Rz
        DBGgbVRJkcrBoCMTIamKxBSk9YpqURe7fo4UNqI=
X-Google-Smtp-Source: APXvYqwUYSO3x//KZTXG6yv2dZ3NcZk20NbjruJN9Xn8+zo86d+e94GBeKk5SizQIKzkTw9NBTZSnlR8ipikN2uBVs8=
X-Received: by 2002:a0c:b88e:: with SMTP id y14mr29883517qvf.93.1562144062650;
 Wed, 03 Jul 2019 01:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190430110032.25301-1-hch@lst.de> <20190430110032.25301-6-hch@lst.de>
 <20190430201041.536amvinrcvd2wua@pburton-laptop> <20190430202947.GA30262@lst.de>
 <20190430211105.ielntedm46uqamca@pburton-laptop> <20190501131339.GA890@lst.de>
 <20190501171355.7wnrutfnax5djkpx@pburton-laptop> <20190603064855.GA22023@lst.de>
In-Reply-To: <20190603064855.GA22023@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 3 Jul 2019 10:54:05 +0200
Message-ID: <CAK8P3a0+mmc_DsHZZeM85xGUUB8zc50ROUu3=i3UN1XwD8UGeQ@mail.gmail.com>
Subject: Re: [PATCH 5/7 v2] MIPS: use the generic uncached segment support in dma-direct
To:     Christoph Hellwig <hch@lst.de>
Cc:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 3, 2019 at 8:50 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 01, 2019 at 05:13:57PM +0000, Paul Burton wrote:
> > Hi Christoph,
> >
> > On Wed, May 01, 2019 at 03:13:39PM +0200, Christoph Hellwig wrote:
> > > Stop providing our arch alloc/free hooks and just expose the segment
> > > offset instead.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  arch/mips/Kconfig              |  1 +
> > >  arch/mips/include/asm/page.h   |  3 ---
> > >  arch/mips/jazz/jazzdma.c       |  6 ------
> > >  arch/mips/mm/dma-noncoherent.c | 26 +++++++++-----------------
> > >  4 files changed, 10 insertions(+), 26 deletions(-)
> >
> > This one looks good to me now, for patches 1 & 5:
> >
> >   Acked-by: Paul Burton <paul.burton@mips.com>
>
> Thanks, I've merged thos into the dma-mapping tree.

I think this is the cause of some kernelci failures in current
linux-next builds:

https://kernelci.org/build/next/branch/master/kernel/next-20190702/

bigsur_defconfig ‐ mips3 warnings — 1 error
cavium_octeon_defconfig ‐ mips3 warnings — 1 error
ip27_defconfig ‐ mips3 warnings — 1 error
loongson3_defconfig ‐ mips3 warnings — 1 error
mips_paravirt_defconfig ‐ mips3 warnings — 1 error
nlm_xlp_defconfig ‐ mips3 warnings — 1 error
nlm_xlr_defconfig ‐ mips1 warning — 1 error

/home/buildslave/workspace/workspace/kernel-build@8/linux/build/../kernel/dma/direct.c:144:
undefined reference to `arch_dma_prep_coherent'
2/home/buildslave/workspace/kernel-build/linux/build/../kernel/dma/direct.c:144:
undefined reference to `arch_dma_prep_coherent'
2(.text+0xafc): undefined reference to `arch_dma_prep_coherent'
1direct.c:(.text+0x934): undefined reference to `arch_dma_prep_coherent'
1(.text+0xb84): undefined reference to `arch_dma_prep_coherent'

I haven't looked into the details, but I suspect all machines
with cache-coherent DMA are broken.

       Arnd
