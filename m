Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 959B83169B9
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 16:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhBJPG1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 10:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhBJPGZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 10:06:25 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF71FC061574;
        Wed, 10 Feb 2021 07:05:43 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id r21so2012893otk.13;
        Wed, 10 Feb 2021 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xh/4GvcrwII2kJiteIw5mx/oRYtYKkb/NuG0S8ho7hw=;
        b=mX+8AbCl4shnQJKYDyEbkCUQfHgCxM4BJGmhl6PEKNtWf3772WOndz/xtz9PzSdl8j
         xGhcr6zB1hr6SFojNj4A+i8XFjvJeaqizwuhafuMKRaa/1cw59ypSgBRYScgywgrAqBI
         dEhy423X5Gy3Jc8DSkEQr5BUaIkT+svFFzTDMypFIF4vhUm5pAnujF+B9wzREbv/X1yt
         F/+kbW/7hLbYpqrcbqpwhQWZeyjfk9mKLqe1nmkUW3iKsI+QY2dyQHh9PIt5Zjhyx4GB
         rPmRU+BKeLsHso8OtQtIByZlbEBKgIiPhbJP1htaQIeF1+2XwlHs85YZySIwAosytrak
         XmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xh/4GvcrwII2kJiteIw5mx/oRYtYKkb/NuG0S8ho7hw=;
        b=ogBqEgm2RMq6HQAesZbr5y6686gsQdID/jg5tlI5fvRQR7IH4iJwg2eCSEOx1P3gB8
         gl7llIq9Mmi6mBuaQV+Cx/YddbyH+GS/9w5qPupBeg8fvj5vPLKhTxcYOLwodEqlb1ls
         HJ62gqFtmSeTXx1JzdDtIJ5xx5ndcFIh7dx5vTev1YDfz37ZeFCxDriyw/b4MPFBgpCh
         GNujXqIAOsesikKUGe2SpL5Sldj1vpStb1w24s1FYuLCgl7XjuE/VFCuSwfpk5U4bgIH
         mzpZK2TI94VgXUzTq8kiwOXjI/YAYk0Rr5X0AXhKp3raaP9IqIOGPvfkFXfE558r2BC5
         A1zw==
X-Gm-Message-State: AOAM533KvnJVJj+TmkrwkyucAnlO8E2rOXZbB4DKeTFUE6sEYyzEF6GE
        vnvkLlLjr3Visonez3CZAto=
X-Google-Smtp-Source: ABdhPJwW+JuTJXRIaXHS6A7Rjk3oyx+veG2cyHDMZHVynbzNxTWyJOzkl+bQY/RNO35DNhyp6ywUxg==
X-Received: by 2002:a05:6830:4109:: with SMTP id w9mr2432557ott.176.1612969543258;
        Wed, 10 Feb 2021 07:05:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e6sm420447otl.63.2021.02.10.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 07:05:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] locking/arch: Move qrwlock.h include after qspinlock.h
To:     Waiman Long <longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Ben Gardon <bgardon@google.com>
References: <20210210144556.10932-1-longman@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <401dbbe1-096c-8af5-4e21-e355e602272e@roeck-us.net>
Date:   Wed, 10 Feb 2021 07:05:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210144556.10932-1-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/10/21 6:45 AM, Waiman Long wrote:
> The queued rwlock code has a dependency on the current spinlock
> implementation (likely to be qspinlock), but not vice versa. Including
> qrwlock.h before qspinlock.h can be problematic when expanding qrwlock
> functionality.
> 
> If both qspinlock.h and qrwlock.h are to be included, the qrwlock.h
> include should always be after qspinlock.h. Update the current set of
> asm/spinlock.h files to enforce that.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

There should be a Fixes: tag here. If the SHA of the offending commit is not
stable, there should be a better reference than "The queued rwlock code".

This patch fixes the build problem I had observed on mips. I also tested
xtensa:defconfig and arm64:defconfig with no problems observed.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  arch/arm64/include/asm/spinlock.h  | 2 +-
>  arch/mips/include/asm/spinlock.h   | 2 +-
>  arch/xtensa/include/asm/spinlock.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/spinlock.h b/arch/arm64/include/asm/spinlock.h
> index 9083d6992603..0525c0b089ed 100644
> --- a/arch/arm64/include/asm/spinlock.h
> +++ b/arch/arm64/include/asm/spinlock.h
> @@ -5,8 +5,8 @@
>  #ifndef __ASM_SPINLOCK_H
>  #define __ASM_SPINLOCK_H
>  
> -#include <asm/qrwlock.h>
>  #include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
>  
>  /* See include/linux/spinlock.h */
>  #define smp_mb__after_spinlock()	smp_mb()
> diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
> index 8a88eb265516..6ce2117e49f6 100644
> --- a/arch/mips/include/asm/spinlock.h
> +++ b/arch/mips/include/asm/spinlock.h
> @@ -10,7 +10,6 @@
>  #define _ASM_SPINLOCK_H
>  
>  #include <asm/processor.h>
> -#include <asm/qrwlock.h>
>  
>  #include <asm-generic/qspinlock_types.h>
>  
> @@ -27,5 +26,6 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
>  }
>  
>  #include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
>  
>  #endif /* _ASM_SPINLOCK_H */
> diff --git a/arch/xtensa/include/asm/spinlock.h b/arch/xtensa/include/asm/spinlock.h
> index 584b0de6f2ca..41c449ece2d8 100644
> --- a/arch/xtensa/include/asm/spinlock.h
> +++ b/arch/xtensa/include/asm/spinlock.h
> @@ -12,8 +12,8 @@
>  #define _XTENSA_SPINLOCK_H
>  
>  #include <asm/barrier.h>
> -#include <asm/qrwlock.h>
>  #include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
>  
>  #define smp_mb__after_spinlock()	smp_mb()
>  
> 

