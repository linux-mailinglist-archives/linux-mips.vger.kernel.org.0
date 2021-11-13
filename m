Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03E744F10B
	for <lists+linux-mips@lfdr.de>; Sat, 13 Nov 2021 04:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235548AbhKMDcX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 22:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbhKMDcX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 22:32:23 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1A1C061766;
        Fri, 12 Nov 2021 19:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=oLWNo6Ai7vMt6whPOWzKumar63316lzKDpoNdaiFnWE=; b=AbKnsyEuVsi4VI676DCER2/PoC
        eAy4oKTNe/E+dTSH+2Sw0UV0nhcxh+eO97I8yR0G2VQGGGhlxg+sEbl2kcYECuh8Hb+abJkXFieOI
        BqRQoC2FUfI+jhVhI++Rdi5X/CdOiPF+gyCLg5JM1q6mlem6wS+JBVY9NuLh0B6Gd/MOAq/o//qcz
        tZlIKWMIklPGJXdzdypugLcHu9b8s1mbMqUDIDMqheel6CWj5Wda3XCzwgQ2cIYMuR+PjRcaQEU4r
        apa0HGnNL8R/VbT+SVUfnBSvXbv5m1Z+PCA9FqPJwULEyrJOWH+/zBANsLxjzfvmgZukZJXxieFkn
        nzZ6O5xA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mljjO-00C6f1-I5; Sat, 13 Nov 2021 03:29:30 +0000
Subject: Re: [PATCH] MIPS: Remove a repeated word in a comment
To:     Jason Wang <wangborong@cdjrlc.com>, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211113032552.53817-1-wangborong@cdjrlc.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <140c9f26-a6ee-8063-16f1-9df9fbdf75e8@infradead.org>
Date:   Fri, 12 Nov 2021 19:29:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211113032552.53817-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/12/21 7:25 PM, Jason Wang wrote:
> The repeated word `the' in a comment is redundant, thus one
> of them was removed from the comment.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>   arch/mips/mm/c-octeon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
> index ec2ae501539a..490322b01f91 100644
> --- a/arch/mips/mm/c-octeon.c
> +++ b/arch/mips/mm/c-octeon.c
> @@ -332,7 +332,7 @@ static void co_cache_error_call_notifiers(unsigned long val)
>   }
>   
>   /*
> - * Called when the the exception is recoverable
> + * Called when the exception is recoverable
>    */
>   
>   asmlinkage void cache_parity_error_octeon_recoverable(void)
> 


-- 
~Randy
