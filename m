Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B94359FE4
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 15:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbhDINff (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 09:35:35 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:60757 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhDINff (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 09:35:35 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKKd7-1lHJaB3nAt-00Lmj3; Fri, 09 Apr 2021 15:35:21 +0200
Received: by mail-ot1-f46.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so5711168otn.1;
        Fri, 09 Apr 2021 06:35:20 -0700 (PDT)
X-Gm-Message-State: AOAM532xvLKvGNL2LF61vwvwtwLHReYP9333LL2z5p1rlYjdMf69CKzw
        fSpUfUYdMVyq9818UN5Y7dhxe7yzwRDpnGLAGHc=
X-Google-Smtp-Source: ABdhPJynlbx4kLNikSNjAjnCb5vtFq6G/850R+R5+xWMARHqWLy+tfY7F0Z+Hrp7Hz4KWDmPvvGBCrUcX4hM8LkZWnk=
X-Received: by 2002:a9d:758b:: with SMTP id s11mr12240759otk.305.1617975319390;
 Fri, 09 Apr 2021 06:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210409112035.27221-1-david@redhat.com>
In-Reply-To: <20210409112035.27221-1-david@redhat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 9 Apr 2021 15:35:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Message-ID: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Eric Anholt <eric@anholt.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Peter Collingbourne <pcc@google.com>,
        Suman Anna <s-anna@ti.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/7zXw/c1UfESlEruqAGXS8UzIHuJI2NxiDK7tVwMgfdq4wYKuFS
 6pXkdJchhga4+TmhN9Ms++pwBTz9yL9aKgjVvkvHHvhiWjciAWR+WA3f421jDGE5exNDCzr
 Zk5rhoQb9IDWjo/pGPYYeB2HOtt/KqEOaWYPozig6+QzGPuhVphXpUk/7G2o29IHNdPUcek
 fajs/Hllr8UunECmkMm7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ug59u7F3OJQ=:3IXoa0MamCC3tSceenqEE6
 Q79+SXOGJ/h7Ykjqa6HuOBjWxBa8k1io25xcFGxpQDn5WLf5vIQ04Q7VygmOtvaDZU34kLSWx
 3WtRiTo6IJMGXSre12X0/Tp6Yzk7E81VxdfylZacU9F8rwfU8fpA5K5e8gx8N/QAE4FZLg6AW
 5wU9f6mF6tQuLiyMAonPYwaVG0slmNcPh447tFDuIc9sQPklyKSNEBzRsSoFxmvPmWWASKKEW
 BblFUNyAg6zFxLiQZeahg/nmKUn//83+AutMsoa5nDPJmO8xSe6MIyetduAmheLONxu5JJYfG
 p/TpJ6nkCuxUfDqGueDOCICsT7xcRKuQNdCODZhVZCmHt5oVXblvQQTU8RpfzPbN19SXMoLRb
 EbiTZbIFeHKKv5M++TMmBAT4T2WFokbdEyo5UT1cFpUmNgeCCizy7OXCSouDqXcv6yGaHGiuo
 g9Ph9lviL6CiZVSiRw51AcD+QMmrz2o=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 9, 2021 at 1:21 PM David Hildenbrand <david@redhat.com> wrote:
>
> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
> which depends on CMA, if possible; however, these drivers also have to
> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
> driver cannot do it's job properly in some configurations.
>
> For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and DMA_CMA if
> available") documents
>         While this is no build dependency, etnaviv will only work correctly
>         on most systems if CMA and DMA_CMA are enabled. Select both options
>         if available to avoid users ending up with a non-working GPU due to
>         a lacking kernel config.
> So etnaviv really wants to have DMA_CMA, however, can deal with some cases
> where it is not available.
>
> Let's introduce WANT_DMA_CMA and use it in most cases where drivers
> select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
> of recursive dependency issues).
>
> We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
> DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.
>
> With this change, distributions can disable CONFIG_CMA or
> CONFIG_DMA_CMA, without it silently getting enabled again by random
> drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
> and CONFIG_DMA_CMA if they are unspecified and any driver is around that
> selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
> DRM_KMS_CMA_HELPER.
>
> For example, if any driver selects WANT_DMA_CMA and we do a
> "make olddefconfig":
>
> 1. With "# CONFIG_CMA is not set" and no specification of
>    "CONFIG_DMA_CMA"
>
> -> CONFIG_DMA_CMA won't be part of .config
>
> 2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA
>
> Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
> DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)
>
> 3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"
>
> -> CONFIG_DMA_CMA will be removed from .config
>
> Note: drivers/remoteproc seems to be special; commit c51e882cd711
> ("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains that
> there is a real dependency to DMA_CMA for it to work; leave that dependency
> in place and don't convert it to a soft dependency.

I don't think this dependency is fundamentally different from the others,
though davinci machines tend to have less memory than a lot of the
other machines, so it's more likely to fail without CMA.

Regardless of this,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
