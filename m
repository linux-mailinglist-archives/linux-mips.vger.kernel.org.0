Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA30C34ED
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 14:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387600AbfJAMzP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 08:55:15 -0400
Received: from fd.dlink.ru ([178.170.168.18]:47016 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732272AbfJAMzP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 08:55:15 -0400
X-Greylist: delayed 309 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Oct 2019 08:55:13 EDT
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id D902D1B21970; Tue,  1 Oct 2019 15:50:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru D902D1B21970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1569934201; bh=+NioxogNPBQSpz1Lrwhv3KAe3UGLf5AseaMTxViYIOU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Ib1ZKsP9TExr/uQ7vLqKRregFixlvNH7VwwzjHXw6UnmrOPyeidpeBFSLeAUPRy6J
         On6WzyHvUKB4gLTyaw5hMO7hLyRam0CC3fivetku3hjmD/NF45yOGclzdM/0igLTb3
         hnYM4cb7eDHVb5hVChbazegtZ/RJTHXZo3PTrV9Y=
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,USER_IN_WHITELIST
        autolearn=disabled version=3.4.1
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 3B11B1B2183D;
        Tue,  1 Oct 2019 15:49:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 3B11B1B2183D
Received: by mail.rzn.dlink.ru (Postfix, from userid 5000)
        id 1EF8E1B20323; Tue,  1 Oct 2019 15:49:59 +0300 (MSK)
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA id 86FCC1B20311;
        Tue,  1 Oct 2019 15:49:56 +0300 (MSK)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 01 Oct 2019 15:49:56 +0300
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Dmitry Korotin <dkorotin@wavecomp.com>
Cc:     Paul Burton <pburton@wavecomp.com>, linux-mips@vger.kernel.org,
        linux-mips-owner@vger.kernel.org,
        Alexander Lobakin <alobakin@dlink.ru>
Subject: Re: [PATCH] mips: Kconfig: Add ARCH_HAS_FORTIFY_SOURCE
In-Reply-To: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
References: <CY4PR22MB04717E7C68389573AADA4E99AFB00@CY4PR22MB0471.namprd22.prod.outlook.com>
Message-ID: <1563c90e9d9ed42bd1dedd552fa0316a@dlink.ru>
X-Sender: alobakin@dlink.ru
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Maybe it's time to remove the "rather naive" block under CONFIG_32BIT at 
all and use C implementations in all cases? I'm interested in what does 
Paul think abous this.

BTW, I've tested Fortify source with this patch on random interAptiv 
board: it's not only working, but also has revealed a bunch of issues 
across the tree at compile-time. Great job!

Dmitry Korotin wrote 13.09.2019 01:53:

> FORTIFY_SOURCE detects various overflows at compile and run time.
> (6974f0c4555e ("include/linux/string.h:
> add the option of fortified string.h functions)
> 
> ARCH_HAS_FORTIFY_SOURCE means that the architecture can be built and
> run with CONFIG_FORTIFY_SOURCE.
> 
> Since mips can be built and run with that flag,
> select ARCH_HAS_FORTIFY_SOURCE as default.
> 
> Signed-off-by: Dmitry Korotin <dkorotin@wavecomp.com>
> ---
>  arch/mips/Kconfig              |    1 +
>  arch/mips/include/asm/string.h |    2 ++
>  2 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index d50fafd..63d608f 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -8,6 +8,7 @@ config MIPS
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> +	select ARCH_HAS_FORTIFY_SOURCE

We sort Kconfig options alphabetically if I'm correct (two positions 
upper in that case).

>  	select ARCH_SUPPORTS_UPROBES
>  	select ARCH_USE_BUILTIN_BSWAP
>  	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
> diff --git a/arch/mips/include/asm/string.h 
> b/arch/mips/include/asm/string.h
> index 29030cb..4b938c5 100644
> --- a/arch/mips/include/asm/string.h
> +++ b/arch/mips/include/asm/string.h
> @@ -10,6 +10,7 @@
>  #ifndef _ASM_STRING_H
>  #define _ASM_STRING_H
> 
> +#if !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE)
> 
>  /*
>   * Most of the inline functions are rather naive implementations so I 
> just
> @@ -130,6 +131,7 @@ static __inline__ int strcmp(__const__ char *__cs,
> __const__ char *__ct)
>  	return __res;
>  }
>  #endif /* CONFIG_32BIT */
> +#endif /* !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE) */
> 
>  #define __HAVE_ARCH_MEMSET
>  extern void *memset(void *__s, int __c, size_t __count);

Regards,
ᚷ ᛖ ᚢ ᚦ ᚠ ᚱ
