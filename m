Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37802359EE1
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 14:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhDIMgS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 08:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231621AbhDIMgS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 08:36:18 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F4BC061761
        for <linux-mips@vger.kernel.org>; Fri,  9 Apr 2021 05:36:05 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r20so6273237ljk.4
        for <linux-mips@vger.kernel.org>; Fri, 09 Apr 2021 05:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tg6sgY5o6KJ5S57CRLT5oBYc675XGvjvO0a75IDhy4M=;
        b=tD/+WsHQQWYusIiNpWcK7bwWVSNKlMLnyRF8CoJ3CZhMIHxMdvtXVATkH2bY6CsvV6
         4EeqLJcMu8Lx6dXjIGijM9Z71Ysw7FoPhIt4pVwzFK6l7vQQG0p8gmVQcZtmvl5D6mmc
         vnQ4vXPZDk4T7ERYAIs5HJIK9/rMwsb/PGlIkgHlPxrLJNQV9qOSD2eFT+qGhgN9rW/v
         i+5TnZ7zezyrlf0LjEA3nkURPCbcKV3D0THgJHWfMYiU94A6/Dnr2CLqYXHUaZSeUV9C
         jYnvEDTnSyDvM2CCXvtBaB8N7OxfbX9Umv48J+Clvg4cWNbqEuv5MYIvFfkzoLNaHZdC
         sk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tg6sgY5o6KJ5S57CRLT5oBYc675XGvjvO0a75IDhy4M=;
        b=VI9kSbozW6jDhCZD6wdYozJEDB4CiuexV4ns38i1PC9C8D8BIg6dBv+smPq2n15fM/
         UThl+yym/gCWHcWaC6YFXKzvhJzh/JDqtzYolOVfF9c6trb9AQ3ifnRc4W3T0SSqGK+9
         xJ92gUtLTIPdK9uJ1x5+c9CcR9z/TTpT5HHIv5Zv1/N0pCLPoc7YoHfHEowbxuEdSmfo
         cELngdHv1DgdBq0UseY9JLRPtOphqv28SZMLMYV7TTkPQ5+STZinZR/cdL24E7yZi8GW
         USUZ1v4kYT8YPiAc+6XpwGz3NUHxcGowqhSrmykWvqgYRys6uqpWKgrhb/7VCG95LFl9
         ddYQ==
X-Gm-Message-State: AOAM532DrlJE6/Cp3dDxo6UFA0/T/Lz3zFOXIcOhp6Le8FuAhKEwRfxj
        UTDUtQS51gR+o1y5h0tQOm6p/w1lETDMgRWc6Ny6jQ==
X-Google-Smtp-Source: ABdhPJxh1RNVQiQp5bCHRakekzyhAZR4aqS7papfBzgGL0DdgK61i7YYHDZZLT+jLT3UuH+d/zlCtwSkkzSHByUlUhw=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr9682701ljw.74.1617971763963;
 Fri, 09 Apr 2021 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409112035.27221-1-david@redhat.com>
In-Reply-To: <20210409112035.27221-1-david@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Apr 2021 14:35:52 +0200
Message-ID: <CACRpkdb_eQrcCFV9Q9uho8E6HO4X0dRJp1qAdJBcT82=sZ1v7A@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
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
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Eric Anholt <eric@anholt.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Peter Collingbourne <pcc@google.com>,
        Suman Anna <s-anna@ti.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        linux-mips@vger.kernel.org,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 9, 2021 at 1:20 PM David Hildenbrand <david@redhat.com> wrote:

> Random drivers should not override a user configuration of core knobs
> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
> which depends on CMA, if possible; however, these drivers also have to
> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
> driver cannot do it's job properly in some configurations.

Looks good to me. At least a lot better than what we have.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> Let's see if this approach is better for soft dependencies (and if we
> actually have some hard dependencies in there). This is the follow-up
> of
>   https://lkml.kernel.org/r/20210408092011.52763-1-david@redhat.com
>   https://lkml.kernel.org/r/20210408100523.63356-1-david@redhat.com

You can just add these to the commit message with Link:
when applying so people can easily find the discussion from the
commit.

> I was wondering if it would make sense in some drivers to warn if either
> CONFIG_DMA_CMA is not available or if DRM_CMA has not been configured
> properly - just to give people a heads up that something might more likely
> go wrong; that would, however, be future work.

I think the frameworks  (DRM_*_CMA_HELPER)
should pr_info something about it so the individual drivers
don't have to sanity check their entire world.

Yours,
Linus Walleij
