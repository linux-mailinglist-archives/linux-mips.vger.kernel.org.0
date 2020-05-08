Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600D61CB07F
	for <lists+linux-mips@lfdr.de>; Fri,  8 May 2020 15:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgEHNbx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 09:31:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:44862 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727940AbgEHNbx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 09:31:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jX36M-0003ty-01; Fri, 08 May 2020 15:31:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 126DDC041B; Fri,  8 May 2020 15:02:23 +0200 (CEST)
Date:   Fri, 8 May 2020 15:02:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v7] MIPS: Loongson: Add DMA support for LS7A
Message-ID: <20200508130223.GB14297@alpha.franken.de>
References: <1588926965-16134-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588926965-16134-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 08, 2020 at 04:36:05PM +0800, Tiezhu Yang wrote:
> In the current market, the most used bridge chip on the Loongson platform
> are RS780E and LS7A, the RS780E bridge chip is already supported by the
> mainline kernel.
> 
> If use the default implementation of __phys_to_dma() and __dma_to_phys()
> in dma-direct.h when CONFIG_ARCH_HAS_PHYS_TO_DMA is not set, it works
> well used with LS7A on the Loongson single-way and multi-way platform,
> and also works well used with RS780E on the Loongson single-way platform,
> but the DMA address will be wrong on the non-node0 used with RS780E on
> the Loongson multi-way platform.
> 
> Just as the description in the code comment, the devices get node id from
> 40 bit of HyperTransport bus, so we extract 2 bit node id (bit 44~45) from
> 48 bit address space of Loongson CPU and embed it into HyperTransport bus
> (bit 37-38), this operation can be done only at the software level used
> with RS780E on the Loongson multi-way platform, because it has no hardware
> function to translate address of node id, this is a hardware compatibility
> problem.
> 
> Device
>     |
>     | DMA address
>     |
> Host Bridge
>     |
>     | HT bus address (40 bit)
>     |
>    CPU
>     |
>     | physical address (48 bit)
>     |
>    RAM
> 
> The LS7A has dma_node_id_offset field in the DMA route config register,
> the hardware can use the dma_node_id_offset to translate address of
> node id automatically, so we can get correct address when just use the
> dma_pfn_offset field in struct device.
> 
> For the above reasons, in order to maintain downward compatibility
> to support the RS780E bridge chip, it is better to use the platform
> dependent implementation of __phys_to_dma() and __dma_to_phys().
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> v7:
>   - According to the discussion of the v6 patch [1],
>     use the platform dependent implementation of
>     __phys_to_dma() and __dma_to_phys()
>   - Make a slight modification based on the v4 patch [2]
>     to put ls7a things before rs780e things
> 
> [1] https://lore.kernel.org/patchwork/patch/1233541/
> [2] https://lore.kernel.org/patchwork/patch/1220010/
> 
> v6:
>   - Make loongson_dma_config() static
>   - Put ls7a things before rs780 things
> 
> v5:
>   - Use the default implementation of __phys_to_dma()
>     and __dma_to_phys() in dma-direct.h
> 
> v4:
>   - Use LS7A instead of Loongson 7A1000 in the description
>   - Use LS7A or ls7a instead of LS7A1000 or ls7a1000 in the code
> 
> v3:
>   - Modify the macro definition NODE_ID_OFFSET_ADDR to
>     make it easy to read
>   - update the commit message
> 
>  arch/mips/include/asm/mach-loongson64/boot_param.h |  5 +++++
>  arch/mips/loongson64/dma.c                         |  9 ++++++---
>  arch/mips/loongson64/env.c                         |  2 ++
>  arch/mips/loongson64/init.c                        | 17 +++++++++++++++++
>  4 files changed, 30 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
