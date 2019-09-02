Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77094A4CE4
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 02:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbfIBArX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 20:47:23 -0400
Received: from forward100o.mail.yandex.net ([37.140.190.180]:39334 "EHLO
        forward100o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729172AbfIBArX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 20:47:23 -0400
Received: from mxback26o.mail.yandex.net (mxback26o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::77])
        by forward100o.mail.yandex.net (Yandex) with ESMTP id 4E70E4AC09D1;
        Mon,  2 Sep 2019 03:47:18 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback26o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id b3VIohjMzX-lHsOAla5;
        Mon, 02 Sep 2019 03:47:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567385238;
        bh=Y69PKgzkeeHcozYiYq9Y/wDkSyCxOhBN6xOilhe241A=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=wAan+tCq2iSP6YWxATQpLK7IBVQvSHY+LHRgiPE7iJ3SR7jLEjHEjj4ZosYtWNMIR
         iA1jZymUCfi9OrrPlwB2AA3IUDpTFhM5ikIMmA1QCTHjI611RRJe6+9fXzO7/FBNsd
         A4leQRwfFiH/pi6sa/NTwEw5glNv65Klu2mqKXNk=
Authentication-Results: mxback26o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 9PFoxbHUkH-l61W65ac;
        Mon, 02 Sep 2019 03:47:09 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH] MIPS: Drop Loongson _CACHE_* definitions
To:     =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20190831154145.7328-1-paul.burton@mips.com>
 <tencent_136CE6EE297BEA5D2910DF5B@qq.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <a16c6cef-02fd-ec15-1618-144e77b370f0@flygoat.com>
Date:   Mon, 2 Sep 2019 08:47:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <tencent_136CE6EE297BEA5D2910DF5B@qq.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2019/9/1 10:41, 陈华才 写道:
> Hi, Paul,
>
> I found that _CACHE_CACHABLE_COHERENT is removed since 3.18, so this patch need to CC stable?

Hi Huacai

According to stable policy, stable tree won't accept this kind of 
trivial fixes.

Thanks.

--

Jiaxun Yang

> Huacai
>   
> ------------------ Original ------------------
> From:  "Paul Burton"<paul.burton@mips.com>;
> Date:  Sat, Aug 31, 2019 11:41 PM
> To:  "linux-mips@vger.kernel.org"<linux-mips@vger.kernel.org>;
> Cc:  "Paul Burton"<pburton@wavecomp.com>; "Huacai Chen"<chenhc@lemote.com>;
> Subject:  [PATCH] MIPS: Drop Loongson _CACHE_* definitions
>   
> _CACHE_CACHABLE_NONCOHERENT is defined as 3<<_CACHE_SHIFT by default, so
> there's no need to define it as such specifically for Loongson.
>
> _CACHE_CACHABLE_COHERENT is not used anywhere in the kernel, so there's
> no need to define it at all.
>
> Finally the comment found alongside these definitions seems incorrect -
> it suggests that we're defining _CACHE_CACHABLE_NONCOHERENT such that it
> actually provides coherence, but the opposite seems to be true & instead
> the unused _CACHE_CACHABLE_COHERENT is defined as the typically
> incoherent value.
>
> Delete the whole thing, which will have no effect on the compiled code
> anyway.
>
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Cc: Huacai Chen <chenhc@lemote.com>
> ---
>
>   arch/mips/include/asm/pgtable-bits.h | 7 -------
>   1 file changed, 7 deletions(-)
>
> diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
> index 5f1ced8cba07..409ae01ed7be 100644
> --- a/arch/mips/include/asm/pgtable-bits.h
> +++ b/arch/mips/include/asm/pgtable-bits.h
> @@ -221,13 +221,6 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
>   
>   #define _CACHE_CACHABLE_NONCOHERENT (5<<_CACHE_SHIFT)
>   
> -#elif defined(CONFIG_CPU_LOONGSON3)
> -
> -/* Using COHERENT flag for NONCOHERENT doesn't hurt. */
> -
> -#define _CACHE_CACHABLE_NONCOHERENT (3<<_CACHE_SHIFT)  /* LOONGSON       */
> -#define _CACHE_CACHABLE_COHERENT    (3<<_CACHE_SHIFT)  /* LOONGSON-3     */
> -
>   #elif defined(CONFIG_MACH_INGENIC)
>   
>   /* Ingenic uses the WA bit to achieve write-combine memory writes */
