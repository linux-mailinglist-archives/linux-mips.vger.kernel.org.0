Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E087396BA9
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 04:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbhFAC6L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 22:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232515AbhFAC6J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 May 2021 22:58:09 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B9B3C061574;
        Mon, 31 May 2021 19:56:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvGy61k79z9sWF;
        Tue,  1 Jun 2021 12:56:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1622516184;
        bh=iY7MeF5kJVTgb76PGSIe64N6mVxLFvLQ+P911N0MgIM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mgyJJS7Mpwj0xHxjTQUJCbxWXBqEpx7u6kJmlJrory1kepRlcJMq86u8b7CRC0TBx
         2eKAPApa1yyT+8Bx3Nq7xXqq+U0aoxEZ+zVk8LZNufbS19MjY54JklUeikWPo3saVu
         rZYPlntAMlPhhFnF6Z4PsS/40mD9BayKN5dAP0deDvSFY91SZJGkqyvQLfTKpVKAj7
         nHaMrjkuyFLjQPzypNJGHxewO6DV/mxxi6HJjuKa/Hbn4YkWBejjdidjhax1ODsJHB
         2xtaQQzhaLoYsK439xsAx0/uvUVbRJkkNCZEwtolQgis+ZjvEfMSx7TFq4rv4vlYtC
         mKEDQ5CYN2DQw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Henderson <rth@twiddle.net>,
        Russell King <linux@armlinux.org.uk>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2] mm: generalize ZONE_[DMA|DMA32]
In-Reply-To: <20210528074557.17768-1-wangkefeng.wang@huawei.com>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
 <20210528074557.17768-1-wangkefeng.wang@huawei.com>
Date:   Tue, 01 Jun 2021 12:56:10 +1000
Message-ID: <87k0negunp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Kefeng Wang <wangkefeng.wang@huawei.com> writes:
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
> Acked-by: Catalin Marinas <catalin.marinas@arm.com> # for arm64
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # for m68k
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> -i386 can't enable ZONE_DMA32, fix it.
> -make ZONE_DMA default y on X86 as before.
> -collect ACKs
>
>  arch/alpha/Kconfig                     |  5 +----
>  arch/arm/Kconfig                       |  3 ---
>  arch/arm64/Kconfig                     |  9 +--------
>  arch/ia64/Kconfig                      |  4 +---
>  arch/m68k/Kconfig                      |  5 +----
>  arch/microblaze/Kconfig                |  4 +---
>  arch/mips/Kconfig                      |  7 -------
>  arch/powerpc/Kconfig                   |  4 ----
>  arch/powerpc/platforms/Kconfig.cputype |  1 +

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
