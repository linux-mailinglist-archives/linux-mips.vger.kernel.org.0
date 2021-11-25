Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8162645DE6A
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 17:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245385AbhKYQPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 11:15:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:41070 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356572AbhKYQNq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 11:13:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mqHKR-0005zr-01; Thu, 25 Nov 2021 17:10:31 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DD3DCC2F82; Thu, 25 Nov 2021 16:55:13 +0100 (CET)
Date:   Thu, 25 Nov 2021 16:55:13 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 3/4] MIPS: use 3-level pgtable for 64KB page size on
 MIPS_VA_BITS_48
Message-ID: <20211125155513.GB11524@alpha.franken.de>
References: <20211125105949.27147-1-huangpei@loongson.cn>
 <20211125105949.27147-4-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125105949.27147-4-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 25, 2021 at 06:59:48PM +0800, Huang Pei wrote:
> It hangup when booting Loongson 3A1000 with BOTH
> CONFIG_PAGE_SIZE_64KB and CONFIG_MIPS_VA_BITS_48, that it turn
> out to use 2-level pgtable instead of 3-level. 64KB page size
> with 2-level pgtable only cover 42 bits VA, use 3-level pgtable
> to cover all 48 bits VA(55 bits)
> 
> Fixes: 1e321fa917fb ("MIPS64: Support of at least 48 bits of SEGBITS)
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index de60ad190057..0215dc1529e9 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3097,7 +3097,7 @@ config STACKTRACE_SUPPORT
>  config PGTABLE_LEVELS
>  	int
>  	default 4 if PAGE_SIZE_4KB && MIPS_VA_BITS_48
> -	default 3 if 64BIT && !PAGE_SIZE_64KB
> +	default 3 if 64BIT && (!PAGE_SIZE_64KB || MIPS_VA_BITS_48)
>  	default 2
>  
>  config MIPS_AUTO_PFN_OFFSET
> -- 
> 2.20.1

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
