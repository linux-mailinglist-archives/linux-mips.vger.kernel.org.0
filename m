Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B57477250
	for <lists+linux-mips@lfdr.de>; Thu, 16 Dec 2021 13:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237029AbhLPM4X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Dec 2021 07:56:23 -0500
Received: from elvis.franken.de ([193.175.24.41]:50496 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237016AbhLPM4W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Dec 2021 07:56:22 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mxqJ3-0000kq-00; Thu, 16 Dec 2021 13:56:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5829CC08B1; Thu, 16 Dec 2021 13:49:48 +0100 (CET)
Date:   Thu, 16 Dec 2021 13:49:48 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/4] MIPS: fix local_{add,sub}_return on MIPS64
Message-ID: <20211216124948.GA12930@alpha.franken.de>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-2-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215084500.24444-2-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 15, 2021 at 04:44:57PM +0800, Huang Pei wrote:
> Use "daddu/dsubu" for long int on MIPS64 instead of "addu/subu"
> 
> Fixes: 7232311ef14c ("local_t: mips extension")
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/include/asm/llsc.h  | 4 ++++
>  arch/mips/include/asm/local.h | 8 ++++----
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
> index ec09fe5d6d6c..8cc28177c37f 100644
> --- a/arch/mips/include/asm/llsc.h
> +++ b/arch/mips/include/asm/llsc.h
> @@ -14,10 +14,14 @@
>  #if _MIPS_SZLONG == 32
>  #define __LL		"ll	"
>  #define __SC		"sc	"
> +#define __ADDU		"addu	"
> +#define __SUBU		"subu	"
>  #define __INS		"ins	"
>  #define __EXT		"ext	"
>  #elif _MIPS_SZLONG == 64
>  #define __LL		"lld	"
> +#define __ADDU		"daddu	"
> +#define __SUBU		"dsubu	"
>  #define __SC		"scd	"
>  #define __INS		"dins	"
>  #define __EXT		"dext	"

maybe I wasn't clear enough, I don't want your orginal fix, but use
fix patch using __stringify(LONG_ADDU)/__stringify(LONG_SUBU).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
