Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5542E22D83A
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 16:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGYOwB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 10:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbgGYOwA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 10:52:00 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559B4C08C5C0;
        Sat, 25 Jul 2020 07:52:00 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so339219wma.2;
        Sat, 25 Jul 2020 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NUySQypdmMDcCjyizFGGshWvKEgs/kUZVuiHmjAgNgI=;
        b=Rw8VSfA6VTMjTMKZERFHOH+q73EJ3Sl5OnKXJlVR6+qkVBDdJC2/Up2tppPUYz8A6T
         kWA1SWt74K6pASB/RsxbnnNJPtExNS70lTY5OFnUqXdHu+7k92DGtwA9xV7GF5tvPVi6
         efcP7zQv9VleIxCUqZ+6EdQtCC5RJGn51plZ1avyovvXzpGe2c8HdoJAcHhsXsf/ACO5
         21MvX5vanzPW97/+H1jSwjNQj+dSmttiaswj2nT4CtM2BEJocHlS2wq/UcQcu+l2NSIz
         Kbe64OZhrDyemFipgHQFXmzMYUuznDox5byQLE12cEHujgVYUvCjF6mqNaD1o7uNKCQA
         +VYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NUySQypdmMDcCjyizFGGshWvKEgs/kUZVuiHmjAgNgI=;
        b=R8CDuMg7CzJD2vn1/BYt/o7ZdpV0YBzoxf7RH30jxnlJv5qnJnaovXiegx53am50h9
         7eq0TR8IdhoK/WjITxyBZKAwktMj15ifHdAP7X4XzkWcimGn4l6j8yJZIvI5gjVgD8C9
         iA3yxoylQKkmzAL4dpT42DtRQO+yCTo/oCI82iIQbM38o3zzDOmkWDL8gNMXKsHhm3uG
         STwAqggXtvgbc0NJjwcHnfZ0sVvtgS/cbeEU6TyvzRUwJSRYfZZsRGEvesbzChY2q9iI
         5Dc+Jnt/UL7G4FXmsNReLkUNwprB/0fLcBaMjzgeY7AYv3nCQouvd10d/6kPK5qEwM6H
         QkQw==
X-Gm-Message-State: AOAM532iUDm8sIIA6TPUlPAbQL84acQzqZDCSmW5Sy1QzVPH40Fmtpya
        yIm5cqjRhWxFzP3XSsbo6YH77rkA
X-Google-Smtp-Source: ABdhPJw50ICXbQxHqZI6tMZjKB9ghpYMkOxrPYZ+omxbW/Y7q/Hmhr4ZspmttxKOAQqS1XEXkVyGLA==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr12695927wme.19.1595688718590;
        Sat, 25 Jul 2020 07:51:58 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521? (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
        by smtp.gmail.com with ESMTPSA id 32sm5204093wrn.86.2020.07.25.07.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2020 07:51:58 -0700 (PDT)
Subject: Re: [PATCH] mips: Do not include hi and lo in clobber list for R6
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1ASmWH5c3covyVGVn1zArosoLlRC98vkQ6Ww4wFSchBjH8_jrScPAdXVD08qeStKkFOA-SGqKIPZ80zib9FmHiIkRvJ4uiWaPKvorjdodDs=@pm.me>
From:   Romain Naour <romain.naour@gmail.com>
Message-ID: <1c379050-b9de-d3cf-fad6-9c0bf9d4b920@gmail.com>
Date:   Sat, 25 Jul 2020 16:51:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1ASmWH5c3covyVGVn1zArosoLlRC98vkQ6Ww4wFSchBjH8_jrScPAdXVD08qeStKkFOA-SGqKIPZ80zib9FmHiIkRvJ4uiWaPKvorjdodDs=@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexander,

Le 25/07/2020 à 16:32, Alexander Lobakin a écrit :
> Hi Romain,
> 
> From: Romain Naour <romain.naour@gmail.com>
> Date: Sat, 25 Jul 2020 15:25:33 +0200
> 
>> From [1]
>> "GCC 10 (PR 91233) won't silently allow registers that are not architecturally
>> available to be present in the clobber list anymore, resulting in build failure
>> for mips*r6 targets in form of:
>> ...
>> .../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
>>   146 |  __asm__ volatile (      \
>>       |  ^~~~~~~
>>
>> This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
>> This patch provides the alternative clobber list for r6 targets that won't include
>> those registers."
>>
>> Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
>> for mips r6 cpus with gcc 10 for the same reason as glibc.
>>
>> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> ---
>>  arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
>> index c63ddcaea54c..6192d94928b9 100644
>> --- a/arch/mips/include/asm/vdso/gettimeofday.h
>> +++ b/arch/mips/include/asm/vdso/gettimeofday.h
>> @@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
>>  	register long nr asm("v0") = __NR_gettimeofday;
>>  	register long error asm("a3");
>>  
>> +#if __mips_isa_rev >= 6
> 
> You should use MIPS_ISA_REV macro from arch/mips/include/asm/isa-rev.h
> instead of compiler definitions.
> The main reason is that __mips_isa_rev is not defined by GCC for
> pre-MIPS32 processors, so you'll get a compiler warning like:
> 
> "Warning: macro '__mips_isa_rev' is not defined, evaluates to 0"
> 
> MIPS_ISA_REV handles this case and is always defined regardless of
> the actual ISA family.

Thanks for the review.
Fixed in v2.

Best regards,
Romain

> 
>> +	asm volatile(
>> +	"       syscall\n"
>> +	: "=r" (ret), "=r" (error)
>> +	: "r" (tv), "r" (tz), "r" (nr)
>> +	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>> +	  "$14", "$15", "$24", "$25", "memory");
>> +#else
>>  	asm volatile(
>>  	"       syscall\n"
>>  	: "=r" (ret), "=r" (error)
>>  	: "r" (tv), "r" (tz), "r" (nr)
>>  	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>>  	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
>> +#endif
>>  
>>  	return error ? -ret : ret;
>>  }
>> @@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
>>  #endif
>>  	register long error asm("a3");
>>  
>> +#if __mips_isa_rev >= 6
>> +	asm volatile(
>> +	"       syscall\n"
>> +	: "=r" (ret), "=r" (error)
>> +	: "r" (clkid), "r" (ts), "r" (nr)
>> +	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>> +	  "$14", "$15", "$24", "$25", "memory");
>> +#else
>>  	asm volatile(
>>  	"       syscall\n"
>>  	: "=r" (ret), "=r" (error)
>>  	: "r" (clkid), "r" (ts), "r" (nr)
>>  	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>>  	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
>> +#endif
>>  
>>  	return error ? -ret : ret;
>>  }
>> @@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
>>  #endif
>>  	register long error asm("a3");
>>  
>> +#if __mips_isa_rev >= 6
>> +	asm volatile(
>> +	"       syscall\n"
>> +	: "=r" (ret), "=r" (error)
>> +	: "r" (clkid), "r" (ts), "r" (nr)
>> +	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>> +	  "$14", "$15", "$24", "$25", "memory");
>> +#else
>>  	asm volatile(
>>  	"       syscall\n"
>>  	: "=r" (ret), "=r" (error)
>>  	: "r" (clkid), "r" (ts), "r" (nr)
>>  	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>>  	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
>> +#endif
>>  
>>  	return error ? -ret : ret;
>>  }
>> @@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
>>  	register long nr asm("v0") = __NR_clock_gettime;
>>  	register long error asm("a3");
>>  
>> +#if __mips_isa_rev >= 6
>> +	asm volatile(
>> +	"       syscall\n"
>> +	: "=r" (ret), "=r" (error)
>> +	: "r" (clkid), "r" (ts), "r" (nr)
>> +	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>> +	  "$14", "$15", "$24", "$25", "memory");
>> +#else
>>  	asm volatile(
>>  	"       syscall\n"
>>  	: "=r" (ret), "=r" (error)
>>  	: "r" (clkid), "r" (ts), "r" (nr)
>>  	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>>  	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
>> +#endif
>>  
>>  	return error ? -ret : ret;
>>  }
>> @@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
>>  	register long nr asm("v0") = __NR_clock_getres;
>>  	register long error asm("a3");
>>  
>> +#if __mips_isa_rev >= 6
>> +	asm volatile(
>> +	"       syscall\n"
>> +	: "=r" (ret), "=r" (error)
>> +	: "r" (clkid), "r" (ts), "r" (nr)
>> +	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>> +	  "$14", "$15", "$24", "$25", "memory");
>> +#else
>>  	asm volatile(
>>  	"       syscall\n"
>>  	: "=r" (ret), "=r" (error)
>>  	: "r" (clkid), "r" (ts), "r" (nr)
>>  	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
>>  	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
>> +#endif
>>  
>>  	return error ? -ret : ret;
>>  }
>> -- 
>> 2.25.4
> 

