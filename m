Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE51E3DFFFF
	for <lists+linux-mips@lfdr.de>; Wed,  4 Aug 2021 13:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237091AbhHDLNh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Aug 2021 07:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235606AbhHDLNc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Aug 2021 07:13:32 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EE5C06179E
        for <linux-mips@vger.kernel.org>; Wed,  4 Aug 2021 04:13:17 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id x144so798665vsx.3
        for <linux-mips@vger.kernel.org>; Wed, 04 Aug 2021 04:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1t0SNn5x7f6Dj4MvLfPbAe/nFhEaNG0D5+fMN+d0a4=;
        b=Nf2KyfVLFfCtc3VuPIByG76ejagI+MoZoGEbfaqyQkA4Edo4g7jlqu/TWtLlZBzI2Z
         s/nx4C8zYdl+AXVtju2jqdk0NwvbRNpbMn7sJOtpBwATeiCEHms9sG0ky0iednIbrJje
         8ErulyiXYP6SX4XSHeQER6RRMpM4uVyDS3WvWceptahkfNpmAaeCos8+6XMsuDosj3Yd
         au34bdb0Q+VMDOHYvMgodwhSP5NRwqRF5rIdxF/LQH5Mqif1pck1+6eRAWRmnVj+viJe
         OZWCpHHFesk0dsxMLa6m7NXG+cBA/KMcQaOeYi4wnGW8EyM+xI2+ucKP1wcogYE6UXEz
         wnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1t0SNn5x7f6Dj4MvLfPbAe/nFhEaNG0D5+fMN+d0a4=;
        b=fbs+4VJESC8lnHe65jfOpOHRQj+A1wN+/qKdhnybIb4JBQA0oz30Lqw8frcbunP0vC
         vHMcAUocIqtAzqhuJVECEDxQ2xU7gBTPUS/0lDQKiCyQtcj76kEZtPIJiuZyNEE+rwhO
         5Z2a2gAJehk0Nh/fHUTLV75DIZJOb9qr0EunC0UrBoRQrELevSoB8Ez/fG346kq6NYWR
         1mEfbfApHJuc1tkUPAtBz7F04b/71Qjj2f7F09XWPF/UiGfawv1hDFZ/Aj8pTN3QPWnN
         d0UnwOuqU6GNZcypxlO6lQWYaDc0oE8/D93YNWLu/UXqzIJ8YTmvTz6Y9zWc2w3q7Rzs
         vBDg==
X-Gm-Message-State: AOAM530AnSqI0a7r8/389sLDHa+7/OIvYrNmwKpr79Ve/d34bplnyxSA
        x2gr74ZUcDvyPNH+dyAyJByi6ljfpjEXms+I1o1Xeg==
X-Google-Smtp-Source: ABdhPJyvlEJk0kPUpk5hZjg1GBcfvcfyWBefSBKSC5X0FVKU1TS5OavoWFYJ7J3TB54jujHaG0St1s/ayVgY/H/S0V0=
X-Received: by 2002:a67:7c14:: with SMTP id x20mr9690293vsc.42.1628075596862;
 Wed, 04 Aug 2021 04:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210712060928.4161649-1-hch@lst.de> <20210712060928.4161649-3-hch@lst.de>
In-Reply-To: <20210712060928.4161649-3-hch@lst.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 4 Aug 2021 13:12:40 +0200
Message-ID: <CAPDyKFpo2kjAH6tRDdo_B3JnKGvuR_+3A9Fe6bCtuP12Lfqd2w@mail.gmail.com>
Subject: Re: [PATCH 2/6] mmc: mmc_spi: replace flush_kernel_dcache_page with flush_dcache_page
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Alex Shi <alexs@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>, linux-mm@kvack.org,
        Linux Documentation <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 12 Jul 2021 at 08:11, Christoph Hellwig <hch@lst.de> wrote:
>
> Pages passed to block drivers can be mapped page cache pages, so we
> must use flush_dcache_page here instead of the more limited
> flush_kernel_dcache_page that is intended for highmem pages only.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Apologies for the delay!

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/host/mmc_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
> index 65c65bb5737f..3d28a3d3001b 100644
> --- a/drivers/mmc/host/mmc_spi.c
> +++ b/drivers/mmc/host/mmc_spi.c
> @@ -948,7 +948,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
>
>                 /* discard mappings */
>                 if (direction == DMA_FROM_DEVICE)
> -                       flush_kernel_dcache_page(sg_page(sg));
> +                       flush_dcache_page(sg_page(sg));
>                 kunmap(sg_page(sg));
>                 if (dma_dev)
>                         dma_unmap_page(dma_dev, dma_addr, PAGE_SIZE, dir);
> --
> 2.30.2
>
