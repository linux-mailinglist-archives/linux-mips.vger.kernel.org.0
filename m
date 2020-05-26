Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA9E1E2100
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 13:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731923AbgEZLjN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 07:39:13 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34326 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731446AbgEZLjN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 07:39:13 -0400
Received: from halation.net.flygoat.com (unknown [IPv6:240e:390:49e:d1a0::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 95B291F9D6;
        Tue, 26 May 2020 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590493152; bh=FccvEX+tojtAeWr19IUq+/lNlcOESKdlNwioTrMOC48=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MAVO61fAYRKZfIFTT8nRz7KxXUf6YCCiXeXHQVGGVgdTTlaP9OTw6KvEADvpvuAqL
         t6nNAdrOrU8AfXodu4bjLJ2c/Xg6VQqMb5/6OflBwmGTC6WXoGY3LH4yFgMRM5NtKL
         JpHzE7zJvDkYXbHI75EzEl7lhsL3tOd6M9RL6OUWo44LTjguAL7d9WgJlCGpizjjkE
         clQFtRCkRIRWDl4eHWHvV74aVvc9hmQTzvuM300VqfLJFc6fZcVzEIWpsbPhVq9s/Q
         /X2g9hCUi5opepseOPG/a2YTs/Ig51RgW2iobRv9E8AmY9wztM6mZCXNXDpG3+7RaX
         0/jAqbLySqqsQ==
Date:   Tue, 26 May 2020 19:38:59 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Lichao Liu <liulichao@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
Message-ID: <20200526193859.0adaea3b@halation.net.flygoat.com>
In-Reply-To: <20200526111438.3788-1-liulichao@loongson.cn>
References: <20200526111438.3788-1-liulichao@loongson.cn>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 26 May 2020 19:14:38 +0800
Lichao Liu <liulichao@loongson.cn> wrote:

> CPU_LOONGSON2EF need software to maintain cache consistency,
> so modify the 'cpu_needs_post_dma_flush' function to return true
> when the cpu type is CPU_LOONGSON2EF.


Hi Lichao,

I don't think that's required for Loongson-2EF,

According to the comment in code:

The affected CPUs below in 'cpu_needs_post_dma_flush()' can
speculatively
fill random cachelines with stale data at any time, requiring an
extra flush post-DMA.

And according to my understanding that's not going to happen on
Loongson-2EF. We're always allocating coherent DMA memory in uncached
range, Loongson-2EF's writeback policy will ensure it won't writeback
random lines to the memory but only modified dirty lines.

We've been fine without post flush for almost 10 years, there is no
stability issue revealed.

Btw: Please keep me CCed for Loongson-2EF patches. I'm not very active
on 2EF development but I'll still review patches.

Thanks.


> ---
>  arch/mips/mm/dma-noncoherent.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/mm/dma-noncoherent.c
> b/arch/mips/mm/dma-noncoherent.c index fcea92d95d86..563c2c0d0c81
> 100644 --- a/arch/mips/mm/dma-noncoherent.c
> +++ b/arch/mips/mm/dma-noncoherent.c
> @@ -33,6 +33,7 @@ static inline bool cpu_needs_post_dma_flush(void)
>  	case CPU_R10000:
>  	case CPU_R12000:
>  	case CPU_BMIPS5000:
> +	case CPU_LOONGSON2EF:
>  		return true;
>  	default:
>  		/*
--
Jiaxun Yang

