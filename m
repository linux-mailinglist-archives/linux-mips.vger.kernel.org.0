Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D67D0E8F
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 14:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbfJIMTx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 08:19:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40281 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729566AbfJIMTx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 08:19:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so2343231wmj.5
        for <linux-mips@vger.kernel.org>; Wed, 09 Oct 2019 05:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W8hMmTrFj6nWlNc5lOhoxzTRPIz9s33pAusTWvtUFnk=;
        b=ldvtV0XxMofX6BdpR/tS0LI0rWSdBJYy4xqrIAfTIYpPcQgnY2yLdWbCwysKDmQCY9
         gxpb+GSOGp1UctUMlzYigS5tz8csoIRBmdncOV2cyuMifIWU+U7FeGaSoH/eS3sXG4K2
         QAH3pcYmAVnhhYq4twtZKwNsE1Eb664880pIBtjin575oBNTIf5PruaGykJqrmAk2T3C
         EetPS/462b5rqG445avtlOb8QfHGV8dSmrCiRHZQ9RG6qLsLyvan11y86qXb6SYc8Rj1
         G+mSdeHKluWg+CM+ktwTbF8MWaU3n/LGR/+OgkMBdsZBPsYWSTIs71wHstAd1ml4nQBE
         Lc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W8hMmTrFj6nWlNc5lOhoxzTRPIz9s33pAusTWvtUFnk=;
        b=DEnWL+RoWJitkCmL4aFJTws012pPPaMqCvn29svA5ptW3FlbNFZEljjpAP00if7Wl+
         ml12aA1+4/EPlsG4y148gK/pxQOXQbtaQHsEMKNND4xlFMoF5KAdgGCswwU0kNKLPCXE
         nHTqfvD22XWB2tvLfeOi7MY5+f4Su3ROdeFUX0jWZ3O14idJW5zAnE4G5a+k0seN4zYB
         rZ8vSd0IgD50mEv/jKLtEmps4/hedd6Eejn521WB+3jyO7GP9wUeyDOl7grFXaElmEw8
         NiwXfAdGVo7vgZ4Ebn2sv/hQwBkmhfaQBAfEfsWYXIZka0H9uQbfMoWiM5AyF+TWs4cg
         uXnw==
X-Gm-Message-State: APjAAAVlrZJLUE0fnr5iv5cS+vifFKe+VStyv9bipUsbReCYrotFy57T
        LguQBGTyu8qP8t3/Cddsy6uocmuphAc=
X-Google-Smtp-Source: APXvYqz5wnpTDH25aJ2e2vi2Ez3aQKtaPyECbkgawqn7V2keD+VFhhOd21iYRRIf8mZD7jPzVwl6Qg==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr2539365wmh.116.1570623589954;
        Wed, 09 Oct 2019 05:19:49 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id y3sm8545830wmg.2.2019.10.09.05.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 05:19:49 -0700 (PDT)
Subject: Re: [PATCH] MIPS: Drop 32-bit asm string functions
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>,
        Alexander Lobakin <alobakin@dlink.ru>
References: <20191008194552.2176475-1-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0a625df3-dff6-0dcc-d0bd-63845d450ca3@amsat.org>
Date:   Wed, 9 Oct 2019 14:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191008194552.2176475-1-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/8/19 9:46 PM, Paul Burton wrote:
> We have assembly implementations of strcpy(), strncpy(), strcmp() &
> strncmp() which:
> 
>   - Are simple byte-at-a-time loops with no particular optimizations. As
>     a comment in the code describes, they're "rather naive".
> 
>   - Offer no clear performance advantage over the generic C
>     implementations - in microbenchmarks performed by Alexander Lobakin
>     the asm functions sometimes win & sometimes lose, but generally not
>     by large margins in either direction.

Maybe add: "See URL below for full benchmark results."

> 
>   - Don't support 64-bit kernels, where we already make use of the
>     generic C implementations.
> 
>   - Tend to bloat kernel code size due to inlining.
> 
>   - Don't support CONFIG_FORTIFY_SOURCE.
> 
>   - Won't support nanoMIPS without rework.
> 
> For all of these reasons, delete the asm implementations & make use of
> the generic C implementations for 32-bit kernels just like we already do
> for 64-bit kernels.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> URL: https://lore.kernel.org/linux-mips/a2a35f1cf58d6db19eb4af9b4ae21e35@dlink.ru/
> Cc: Alexander Lobakin <alobakin@dlink.ru>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>   arch/mips/include/asm/string.h | 123 ---------------------------------
>   1 file changed, 123 deletions(-)
> 
> diff --git a/arch/mips/include/asm/string.h b/arch/mips/include/asm/string.h
> index 4b938c55b397..1de3bbce8e88 100644
> --- a/arch/mips/include/asm/string.h
> +++ b/arch/mips/include/asm/string.h
> @@ -10,129 +10,6 @@
>   #ifndef _ASM_STRING_H
>   #define _ASM_STRING_H
>   
> -#if !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE)
> -
> -/*
> - * Most of the inline functions are rather naive implementations so I just
> - * didn't bother updating them for 64-bit ...
> - */
> -#ifdef CONFIG_32BIT
> -
> -#ifndef IN_STRING_C
> -
> -#define __HAVE_ARCH_STRCPY
> -static __inline__ char *strcpy(char *__dest, __const__ char *__src)
> -{
> -  char *__xdest = __dest;
> -
> -  __asm__ __volatile__(
> -	".set\tnoreorder\n\t"
> -	".set\tnoat\n"
> -	"1:\tlbu\t$1,(%1)\n\t"
> -	"addiu\t%1,1\n\t"
> -	"sb\t$1,(%0)\n\t"
> -	"bnez\t$1,1b\n\t"
> -	"addiu\t%0,1\n\t"
> -	".set\tat\n\t"
> -	".set\treorder"
> -	: "=r" (__dest), "=r" (__src)
> -	: "0" (__dest), "1" (__src)
> -	: "memory");
> -
> -  return __xdest;
> -}
> -
> -#define __HAVE_ARCH_STRNCPY
> -static __inline__ char *strncpy(char *__dest, __const__ char *__src, size_t __n)
> -{
> -  char *__xdest = __dest;
> -
> -  if (__n == 0)
> -    return __xdest;
> -
> -  __asm__ __volatile__(
> -	".set\tnoreorder\n\t"
> -	".set\tnoat\n"
> -	"1:\tlbu\t$1,(%1)\n\t"
> -	"subu\t%2,1\n\t"
> -	"sb\t$1,(%0)\n\t"
> -	"beqz\t$1,2f\n\t"
> -	"addiu\t%0,1\n\t"
> -	"bnez\t%2,1b\n\t"
> -	"addiu\t%1,1\n"
> -	"2:\n\t"
> -	".set\tat\n\t"
> -	".set\treorder"
> -	: "=r" (__dest), "=r" (__src), "=r" (__n)
> -	: "0" (__dest), "1" (__src), "2" (__n)
> -	: "memory");
> -
> -  return __xdest;
> -}
> -
> -#define __HAVE_ARCH_STRCMP
> -static __inline__ int strcmp(__const__ char *__cs, __const__ char *__ct)
> -{
> -  int __res;
> -
> -  __asm__ __volatile__(
> -	".set\tnoreorder\n\t"
> -	".set\tnoat\n\t"
> -	"lbu\t%2,(%0)\n"
> -	"1:\tlbu\t$1,(%1)\n\t"
> -	"addiu\t%0,1\n\t"
> -	"bne\t$1,%2,2f\n\t"
> -	"addiu\t%1,1\n\t"
> -	"bnez\t%2,1b\n\t"
> -	"lbu\t%2,(%0)\n\t"
> -#if defined(CONFIG_CPU_R3000)
> -	"nop\n\t"
> -#endif
> -	"move\t%2,$1\n"
> -	"2:\tsubu\t%2,$1\n"
> -	"3:\t.set\tat\n\t"
> -	".set\treorder"
> -	: "=r" (__cs), "=r" (__ct), "=r" (__res)
> -	: "0" (__cs), "1" (__ct));
> -
> -  return __res;
> -}
> -
> -#endif /* !defined(IN_STRING_C) */
> -
> -#define __HAVE_ARCH_STRNCMP
> -static __inline__ int
> -strncmp(__const__ char *__cs, __const__ char *__ct, size_t __count)
> -{
> -	int __res;
> -
> -	__asm__ __volatile__(
> -	".set\tnoreorder\n\t"
> -	".set\tnoat\n"
> -	"1:\tlbu\t%3,(%0)\n\t"
> -	"beqz\t%2,2f\n\t"
> -	"lbu\t$1,(%1)\n\t"
> -	"subu\t%2,1\n\t"
> -	"bne\t$1,%3,3f\n\t"
> -	"addiu\t%0,1\n\t"
> -	"bnez\t%3,1b\n\t"
> -	"addiu\t%1,1\n"
> -	"2:\n\t"
> -#if defined(CONFIG_CPU_R3000)
> -	"nop\n\t"
> -#endif
> -	"move\t%3,$1\n"
> -	"3:\tsubu\t%3,$1\n\t"
> -	".set\tat\n\t"
> -	".set\treorder"
> -	: "=r" (__cs), "=r" (__ct), "=r" (__count), "=r" (__res)
> -	: "0" (__cs), "1" (__ct), "2" (__count));
> -
> -	return __res;
> -}
> -#endif /* CONFIG_32BIT */
> -#endif /* !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE) */
> -
>   #define __HAVE_ARCH_MEMSET
>   extern void *memset(void *__s, int __c, size_t __count);
>   
> 
