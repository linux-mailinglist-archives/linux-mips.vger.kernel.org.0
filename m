Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4E8AA4C80
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 00:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbfIAWxM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 18:53:12 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33183 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729148AbfIAWxM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 18:53:12 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so12120134wrr.0
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kEN5O5ugyMLDF6OlTsLtZvPJWibHR9n5mnib6Obd/Iw=;
        b=MjvxloYyXrCRFsYLl99bZNzJOalFpjY/DJAs1ltOOxFsxwrLoS5no1382TaYC6WV9+
         YzPPycPoLYcQnHWPYEwYdzJXE3yZcvD6EYgsRlk6j0OIEJ+YozHNUY6m088PsbjVUSgT
         /NPeeeBBH4Ws7d1/aEMsLingKJvKqlddp8TZz1g3hDa4v3rqwmwINsfEt8QC1BxFyjZh
         2BAgoIoBlidlPnnIDv7MQNatg9MDsNLIwn4eomrsKaQbTkZX/thRTtUxSmpKjatRogtu
         Zcs80ksYK2McySAG/9s+LsDAiV4kFDYbRaBaU5iCr80D3eG34yJ8+fdUBukHgliSQPUy
         8Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kEN5O5ugyMLDF6OlTsLtZvPJWibHR9n5mnib6Obd/Iw=;
        b=gMDiwYUbWSjIqpw9RiA7CjtawyMRNhzzKsMYulESs7LBtswGcp6d4UF+fmyXEDXibQ
         CgmB/r2JdO1uxQXnmoAhCDuDNQV2Jp6ApwhvSXxJ5CXliChuzT2cI6iLFalQLNTQyNgX
         k5ILqRkBTx9hEI0ZdMNaZkqnTkoBTlPtEI3+Dj0GceD13moo2zJy4mYY3p3QhMZrypd9
         w4GI38uUe6v/Hk0HE0KT0dwBpYHRFFacz3JkIletJ/cTFc7yn2M74LRR9Nx4XYA1+A7c
         PTeuonhYmKFsFKD6oZTCdWdLqw4PHSl0lHPoG5pkj44T4tqTkV1PaJgS5YJTjJ0H9MV/
         Q4VQ==
X-Gm-Message-State: APjAAAXOXWjqGEmB8ZkqGpHAUhk318wnO8xTBhXhm8xOxIrdzV8kRhIT
        FeVFZGYutbOORdnAANqJNfvYJ4es
X-Google-Smtp-Source: APXvYqxX+TqAD5goW+taTgrJ3EmSaAqC2td1Fnc/G8mRwn+pXrA7uSdZCQUXlmHQ8VgIK8Vb3qpUyw==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr10089319wrn.40.1567378390299;
        Sun, 01 Sep 2019 15:53:10 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id c8sm11769791wrn.50.2019.09.01.15.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 15:53:09 -0700 (PDT)
Subject: Re: [PATCH] MIPS: Drop Loongson _CACHE_* definitions
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>, Huacai Chen <chenhc@lemote.com>
References: <20190831154145.7328-1-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b84f3910-6b0d-db6c-1dba-9ddf30d7d86d@amsat.org>
Date:   Mon, 2 Sep 2019 00:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190831154145.7328-1-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/31/19 5:41 PM, Paul Burton wrote:
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
>  arch/mips/include/asm/pgtable-bits.h | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
> index 5f1ced8cba07..409ae01ed7be 100644
> --- a/arch/mips/include/asm/pgtable-bits.h
> +++ b/arch/mips/include/asm/pgtable-bits.h
> @@ -221,13 +221,6 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
>  
>  #define _CACHE_CACHABLE_NONCOHERENT (5<<_CACHE_SHIFT)
>  
> -#elif defined(CONFIG_CPU_LOONGSON3)
> -
> -/* Using COHERENT flag for NONCOHERENT doesn't hurt. */
> -
> -#define _CACHE_CACHABLE_NONCOHERENT (3<<_CACHE_SHIFT)  /* LOONGSON       */
> -#define _CACHE_CACHABLE_COHERENT    (3<<_CACHE_SHIFT)  /* LOONGSON-3     */
> -
>  #elif defined(CONFIG_MACH_INGENIC)
>  
>  /* Ingenic uses the WA bit to achieve write-combine memory writes */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
