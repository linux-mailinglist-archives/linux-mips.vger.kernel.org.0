Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4647316EBB
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 19:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234300AbhBJScn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 13:32:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42668 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234041AbhBJSaj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 13:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612981745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fYYBsxu73w7K0XguXXBeoWTwhLVvhJ5OOGR+uAgX+h4=;
        b=YkF052rp7m5mLbunPUSNjSSkOpQdLb6hHYKdnRr78QHETCnCi/jkAo1aInhMJx3lK2jKW0
        WiJp3OBlLcisVVnobi+dYqbXUaeY2yvsGWJQL4Gu+oESInkx+ckkT1PclClBTQriDfJnYY
        gWbd9ear3GbCpgD6BrmdR7jhF1zl/Cw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-E2VZCFrwMiGe0Y0cTuaTTg-1; Wed, 10 Feb 2021 13:29:00 -0500
X-MC-Unique: E2VZCFrwMiGe0Y0cTuaTTg-1
Received: by mail-wm1-f71.google.com with SMTP id x20so1826174wmc.0
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 10:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fYYBsxu73w7K0XguXXBeoWTwhLVvhJ5OOGR+uAgX+h4=;
        b=Ab1BuB/9rugbZ93eR/XTlI5v0kWXHSnAaQ45auX0drsottApltijBaxq8Jv9k73Kr/
         VxeJPp0/FQ7X5PDkCTZzFgulBmkgEO09eAfsEdURqkoF418Cwlz13Hu7yFuHOG0usRf6
         ZFWJWln/0bHiRYoZsFJ9yz/J73OS9lC3a1sCYaX89dw3PhpWN1t33I8wbCbMc8vUjvZz
         /cEiJDuGIpJ3rj9cYR3/E88iCmmbB7vQ8wcMIIz4/Ep7G6s4TYCUNaxtasyXa1qdTf5p
         SmZm7KkjOpmft+mz7NwhHgPK+mgQxD2VLy7m8bln70fq648seyAnWJjyDcSLtplbZsMl
         Htbg==
X-Gm-Message-State: AOAM530NYSkGnUbo573gAuJHOYsqkFLO3BSxElbD8WBM0k7BBWOu1BWD
        C8gpfltdwk7xo9UuzbGt7IU0YD2nSZkSQAj8zZuWxzBM70/ifVXF5dvDsAMdNxxBtHJTV0ay64U
        a5OE44IUTtzzPg662PBIQ7Q==
X-Received: by 2002:a1c:4483:: with SMTP id r125mr223844wma.80.1612981739028;
        Wed, 10 Feb 2021 10:28:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmxlNWuCd4Xp+dCygWJQUgZ2qxgJCc955uVLjJdnKvNrD9YC2BN6UDsWfR7xqj2wXggvYDdg==
X-Received: by 2002:a1c:4483:: with SMTP id r125mr223811wma.80.1612981738761;
        Wed, 10 Feb 2021 10:28:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id w2sm3766006wmg.27.2021.02.10.10.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 10:28:58 -0800 (PST)
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
        Guenter Roeck <linux@roeck-us.net>,
        Ben Gardon <bgardon@google.com>
References: <20210210144556.10932-1-longman@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1d7d564c-cc73-372b-be8b-1cfd51cf476c@redhat.com>
Date:   Wed, 10 Feb 2021 19:28:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210144556.10932-1-longman@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/02/21 15:45, Waiman Long wrote:
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

arch/sparc/include/asm/spinlock_64.h is missing.  Also, the include in 
kernel/locking/qrwlock.c is not necessary (it may be there for aesthetic 
reasons, but it complicates thing in this case).

I'll send a v2 that is based on the kvm/next tree.

Paolo

> ---
>   arch/arm64/include/asm/spinlock.h  | 2 +-
>   arch/mips/include/asm/spinlock.h   | 2 +-
>   arch/xtensa/include/asm/spinlock.h | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/spinlock.h b/arch/arm64/include/asm/spinlock.h
> index 9083d6992603..0525c0b089ed 100644
> --- a/arch/arm64/include/asm/spinlock.h
> +++ b/arch/arm64/include/asm/spinlock.h
> @@ -5,8 +5,8 @@
>   #ifndef __ASM_SPINLOCK_H
>   #define __ASM_SPINLOCK_H
>   
> -#include <asm/qrwlock.h>
>   #include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
>   
>   /* See include/linux/spinlock.h */
>   #define smp_mb__after_spinlock()	smp_mb()
> diff --git a/arch/mips/include/asm/spinlock.h b/arch/mips/include/asm/spinlock.h
> index 8a88eb265516..6ce2117e49f6 100644
> --- a/arch/mips/include/asm/spinlock.h
> +++ b/arch/mips/include/asm/spinlock.h
> @@ -10,7 +10,6 @@
>   #define _ASM_SPINLOCK_H
>   
>   #include <asm/processor.h>
> -#include <asm/qrwlock.h>
>   
>   #include <asm-generic/qspinlock_types.h>
>   
> @@ -27,5 +26,6 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
>   }
>   
>   #include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
>   
>   #endif /* _ASM_SPINLOCK_H */
> diff --git a/arch/xtensa/include/asm/spinlock.h b/arch/xtensa/include/asm/spinlock.h
> index 584b0de6f2ca..41c449ece2d8 100644
> --- a/arch/xtensa/include/asm/spinlock.h
> +++ b/arch/xtensa/include/asm/spinlock.h
> @@ -12,8 +12,8 @@
>   #define _XTENSA_SPINLOCK_H
>   
>   #include <asm/barrier.h>
> -#include <asm/qrwlock.h>
>   #include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
>   
>   #define smp_mb__after_spinlock()	smp_mb()
>   
> 

