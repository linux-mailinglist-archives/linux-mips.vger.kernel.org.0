Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D0C393510
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 19:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbhE0RpE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 13:45:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhE0RpA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 13:45:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B02F6610A0;
        Thu, 27 May 2021 17:43:23 +0000 (UTC)
Date:   Thu, 27 May 2021 18:43:21 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Henderson <rth@twiddle.net>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] mm: generalize ZONE_[DMA|DMA32]
Message-ID: <20210527174321.GI8661@arm.com>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 27, 2021 at 10:30:47PM +0800, Kefeng Wang wrote:
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

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
