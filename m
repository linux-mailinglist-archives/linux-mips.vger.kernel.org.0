Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F36ED8FCA0
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 09:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbfHPHnw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 03:43:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36729 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfHPHnw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Aug 2019 03:43:52 -0400
Received: by mail-oi1-f196.google.com with SMTP id c15so4200179oic.3;
        Fri, 16 Aug 2019 00:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvAyBsUlIJF0bF+3UmDVqzcZaxe3TRuVyFQ4SKm03Ag=;
        b=E3uaTcRhnwbVjEtkeJrcbenro/5PLBVjBjdU3eiyAZmgl6dVLKGsCjZpDKI7Lk7k/y
         rwJoA+T+Ub9xhWFZ6+A06nuTSoLjqmmJRt1n9DL2s47P2GKzn7uuNT0Pq60sl4Xo/dwZ
         K0mXHsEdQ6Mt6HSocPl4wBjZvlunZ2uxsF6Yj4WaNqlj7TEjEX1QDWjG7ugAFG/IlHDr
         XkhOVZjQoE32D2qkVdWXIfjLoFGPqYVKv2qFK9lCSBZP+SQ2PwLM36rcXw/8lTyMNVxt
         iTGmEHj90sWtgzC45mFzqXHnz5303+bN7OS5mgYb6TXXRay3NtQtkO6ysfkuqYTYBtb3
         df9A==
X-Gm-Message-State: APjAAAU7n7U271lLrH4+qEA6R+6qQ0TYSrdJALou+cgAHJ3sCbtpc4qE
        xurdBZAup1grDCzo0w+lMW1dijEOfij3PljjHn2aoQ==
X-Google-Smtp-Source: APXvYqxDhwWwhe23FnPOhfwBJdvvv1RZQ4uxY4zTeFQQdGxuUoRdT5WMzdETbuNlDvSjEY17/b21joZDSXi2Bi1nfwg=
X-Received: by 2002:a54:478d:: with SMTP id o13mr4253177oic.54.1565941431065;
 Fri, 16 Aug 2019 00:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190816070754.15653-1-hch@lst.de> <20190816070754.15653-5-hch@lst.de>
In-Reply-To: <20190816070754.15653-5-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 09:43:40 +0200
Message-ID: <CAMuHMdVk3LZk3Ro3PYn9aOZ6NRUr5AOp+NwSNiaq2hBTS0-BtQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] dma-mapping: remove arch_dma_mmap_pgprot
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux IOMMU <iommu@lists.linux-foundation.org>,
        Shawn Anastasio <shawn@anastas.io>,
        Will Deacon <will@kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Guan Xuetao <gxt@pku.edu.cn>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 16, 2019 at 9:19 AM Christoph Hellwig <hch@lst.de> wrote:
> arch_dma_mmap_pgprot is used for two things:
>
>  1) to override the "normal" uncached page attributes for mapping
>     memory coherent to devices that can't snoop the CPU caches
>  2) to provide the special DMA_ATTR_WRITE_COMBINE semantics on older
>     arm systems
>
> Replace one with the pgprot_dmacoherent macro that is already provided
> by arm and much simpler to use, and lift the DMA_ATTR_WRITE_COMBINE
> handling to common code with an explicit arch opt-in.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig                  |  1 -
>  arch/m68k/include/asm/pgtable_mm.h |  3 +++
>  arch/m68k/kernel/dma.c             |  3 +--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
