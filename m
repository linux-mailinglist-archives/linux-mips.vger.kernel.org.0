Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C232C3C7C7F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 05:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237443AbhGNDQO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Jul 2021 23:16:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237368AbhGNDQO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Jul 2021 23:16:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86777613B2;
        Wed, 14 Jul 2021 03:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626232403;
        bh=eHqXqU0BSC/4FXMxbMmPUP5y/NWhQgyVoBJ51q6I6VI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RneN6lR7Gk+SyuzkEGUgXr7XT7IriiK0Ld1//j6zYRb/qjM02yKdHFlCHwgq90qaq
         OPjucaISjtpHs8RTbetzrdLw0tATbov36tOsLzqUKF7hgRqLXL5M0yHnn/NxKihWk6
         XATsATEQtu6TsePkHQkvwWzzh8U31KxpN30+TtitWfM10iGQUE9q/fcjs7X+unaStk
         ZHtv2y0Nl7o/khL5FkiHbf6WW2QL+zHAkOE6vysdoTfYAllTgQtdsaRVGM7lQfpLRT
         dmpkufnoyEh3lCAwyau7PA+Fd+WvV0VZCuzN3IWCM8tiQ264dk4mqkI34mlyVof+4q
         TRVyTjlfWJ2GQ==
Received: by mail-lf1-f51.google.com with SMTP id f30so1030255lfj.1;
        Tue, 13 Jul 2021 20:13:23 -0700 (PDT)
X-Gm-Message-State: AOAM530pSEqh7KJjPhG2VJJFCX81jVTCkMwj+xPGFp/iTIsvS6iWV+XB
        7P8QBLGWQxm+IlIYtxD0RijxGQ8AC2XoBmB5Wcg=
X-Google-Smtp-Source: ABdhPJxjtzRmeK8gT6oxvZVQIbBescQdPKCDPRyAmUuPGRj8zSZMbMltcH961OP7xUnOjUvePsuZ4INz3sZLDriTjNw=
X-Received: by 2002:ac2:42d6:: with SMTP id n22mr6034055lfl.41.1626232401837;
 Tue, 13 Jul 2021 20:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210712060928.4161649-1-hch@lst.de>
In-Reply-To: <20210712060928.4161649-1-hch@lst.de>
From:   Guo Ren <guoren@kernel.org>
Date:   Wed, 14 Jul 2021 11:13:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRaRp2nVKGp3+vVnQ3RCvaDxsgHh_vhPTuOxnT51XBXFg@mail.gmail.com>
Message-ID: <CAJF2gTRaRp2nVKGp3+vVnQ3RCvaDxsgHh_vhPTuOxnT51XBXFg@mail.gmail.com>
Subject: Re: flush_kernel_dcache_page fixes and removal
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Acked-by for csky abiv1 part.=EF=BC=88No change to our execution path after
the patch set.=EF=BC=89

On Mon, Jul 12, 2021 at 2:10 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> while looking to convert the block layer away from kmap_atomic towards
> kmap_local_page and prefeably the helpers that abstract it away I noticed
> that a few block drivers directly or implicitly call
> flush_kernel_dcache_page before kunmapping a page that has been written
> to.  flush_kernel_dcache_page is documented to to be used in such cases,
> but flush_dcache_page is actually required when the page could be in
> the page cache and mapped to userspace, which is pretty much always the
> case when kmapping an arbitrary page.  Unfortunately the documentation
> doesn't exactly make that clear, which lead to this misused.  And it turn=
s
> out that only the copy_strings / copy_string_kernel in the exec code
> were actually correct users of flush_kernel_dcache_page, which is why
> I think we should just remove it and eat the very minor overhead in
> exec rather than confusing poor driver writers.
>
> Diffstat:
>  Documentation/core-api/cachetlb.rst                    |   86 +++++++---=
-------
>  Documentation/translations/zh_CN/core-api/cachetlb.rst |    9 -
>  arch/arm/include/asm/cacheflush.h                      |    4
>  arch/arm/mm/flush.c                                    |   33 ------
>  arch/arm/mm/nommu.c                                    |    6 -
>  arch/csky/abiv1/cacheflush.c                           |   11 --
>  arch/csky/abiv1/inc/abi/cacheflush.h                   |    4
>  arch/mips/include/asm/cacheflush.h                     |    8 -
>  arch/nds32/include/asm/cacheflush.h                    |    3
>  arch/nds32/mm/cacheflush.c                             |    9 -
>  arch/parisc/include/asm/cacheflush.h                   |    8 -
>  arch/parisc/kernel/cache.c                             |    3
>  arch/sh/include/asm/cacheflush.h                       |    8 -
>  block/blk-map.c                                        |    2
>  drivers/block/ps3disk.c                                |    2
>  drivers/mmc/host/jz4740_mmc.c                          |    4
>  drivers/mmc/host/mmc_spi.c                             |    2
>  drivers/scsi/aacraid/aachba.c                          |    1
>  fs/exec.c                                              |    6 -
>  include/linux/highmem.h                                |    5
>  lib/scatterlist.c                                      |    5
>  tools/testing/scatterlist/linux/mm.h                   |    1
>  22 files changed, 55 insertions(+), 165 deletions(-)



--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
