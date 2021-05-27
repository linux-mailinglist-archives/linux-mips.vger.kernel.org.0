Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB773930E5
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 16:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbhE0O2q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 10:28:46 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:38650 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236472AbhE0O2k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 May 2021 10:28:40 -0400
Received: by mail-ua1-f51.google.com with SMTP id d14so301139ual.5;
        Thu, 27 May 2021 07:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cM98qANGM6gq7eFVcE8HDyKOCug9AFSASwSyFw9YbSU=;
        b=GshgR7Pz1lOtp+VN5xsYUHfd7IJLnLlOZ4bffeVTDfC9a88BFpqPTUr08fq1hVob64
         wCGY9Q30/WDlB68uTyU2xKEUtkJZUwTTy7QG2iJ00w6Vuejm8fSSuD46kkKKKkdjVH5H
         abwYt3KVSC8UjFGSSphEExzeBXEbB4EbPgZ7SYE4Pr1aPvZbSscCeBUIhMLHkDQDPk84
         5TXuie58/DubET9+FILSSvDhcYaCA2n3Jrha2vAxTLHcfY1JyGluqi1/AUTL23fLHelv
         3S/EWEszlVInBphISy0A7BHl1Xja+Es1gSsB1aicONQwLjn9grEZHQls7EbZewvLjoZl
         T4kw==
X-Gm-Message-State: AOAM5321HdE+C+WGZ5QujZDMpU5g/rTLjnr9PAO1ywiB+2iWOftKY5Bo
        OCZTroqIIXCdkWaQQuQ09xVwkyjvhjZrC0y7qbBfdKhX
X-Google-Smtp-Source: ABdhPJyES3OOZdc3Rm5NIbkZQm2fOdpikY6zvw2E4r08/fVYUQL+sn3/8udU48KybuFSf+RW5DgGz5xYI5whS1QJ9so=
X-Received: by 2002:ab0:3d1:: with SMTP id 75mr1793111uau.106.1622125626361;
 Thu, 27 May 2021 07:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 16:26:54 +0200
Message-ID: <CAMuHMdW0uSDEu67CoFr9dMtH_aR8SBfDd5mpZ-SzNSjacjK7VA@mail.gmail.com>
Subject: Re: [PATCH] mm: generalize ZONE_[DMA|DMA32]
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Henderson <rth@twiddle.net>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 27, 2021 at 4:21 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
>
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/Kconfig                      |  5 +----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
