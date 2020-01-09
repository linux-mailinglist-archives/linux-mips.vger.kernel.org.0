Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8039E135D03
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 16:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbgAIPnu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 10:43:50 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:10928 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728098AbgAIPnu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 10:43:50 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47tr4g08pGz9v3p8;
        Thu,  9 Jan 2020 16:43:47 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=ilmuuzlF; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 6FBkiugPM--3; Thu,  9 Jan 2020 16:43:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47tr4f66Yyz9v3p6;
        Thu,  9 Jan 2020 16:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578584626; bh=iw8kkZomOhkO3o0LAtBm1SIFpsx8uEZAgoFK9Pp3LQw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ilmuuzlFcmIFuyVy1qltF6zJgIcY/QacfPR0xgx+hahGZEzf7+zkFRtCPK4jF6ltQ
         nRWBOULOE0hyYF+PcbYtJB7Kir2kWT7xsuCcCiEPJbWT5u/ZFWxD61ZGmkkD+SGawA
         ICWLD/eJM+3BG7VMgWcfX+y95rICvukbD7i5WdGw=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 62C3B8B82B;
        Thu,  9 Jan 2020 16:43:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id Dt_XbitFJ43g; Thu,  9 Jan 2020 16:43:48 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 266608B828;
        Thu,  9 Jan 2020 16:43:47 +0100 (CET)
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit
 fallback
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
 <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
 <CAK8P3a1gHvW2XEMDSHCcdOQ8NSs3iHk9GpujwkWZnnZ0dnw96w@mail.gmail.com>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0d8ffa6f-00fa-aefe-d255-b635fb90497f@c-s.fr>
Date:   Thu, 9 Jan 2020 16:43:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1gHvW2XEMDSHCcdOQ8NSs3iHk9GpujwkWZnnZ0dnw96w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 02/01/2020 à 12:29, Arnd Bergmann a écrit :
> On Mon, Dec 30, 2019 at 1:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>> +static __always_inline
>>> +long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
>>> +{
>>> +       struct __kernel_timespec ts;
>>> +       int ret = clock_getres_fallback(clock, &ts);
>>> +
>>> +       if (likely(!ret && _ts)) {
>>> +               _ts->tv_sec = ts.tv_sec;
>>> +               _ts->tv_nsec = ts.tv_nsec;
>>> +       }
>>> +       return ret;
>>> +}
>>
>> Please change these to call __NR_clock_gettime and __NR_clock_getres_time
>> instead of __NR_clock_gettime64/__NR_clock_getres_time64 for multiple reasons.
>>
>> - When doing migration between containers, the vdso may get copied into
>>    an application running on a kernel that does not support the time64
>>    variants, and then the fallback fails.
>>
>> - When CONFIG_COMPAT_32BIT_TIME is disabled, the time32 syscalls
>>    return -ENOSYS, and the vdso version should have the exact same behavior
>>    to avoid surprises. In particular an application that checks clock_gettime()
>>    to see if the time32 are in part of the kernel would get an incorrect result
>>    here.
>>
>> arch/arm64/include/asm/vdso/compat_gettimeofday.h already does this,
>> I think you can just copy the implementation or find a way to share it.
> 
> There was a related discussion on this after a vdso regression on mips,
> and I suggested to drop the time32 functions completely from the
> vdso when CONFIG_COMPAT_32BIT_TIME is disabled, such as
> 
> diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S
> b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> index 00c025ba4a92..605f259fa24c 100644
> --- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
> @@ -145,10 +145,12 @@ VERSION
> 
>                  __kernel_get_syscall_map;
>   #ifndef CONFIG_PPC_BOOK3S_601
> +#ifdef CONFIG_COMPAT_32BIT_TIME
>                  __kernel_gettimeofday;
>                  __kernel_clock_gettime;
>                  __kernel_clock_getres;
>                  __kernel_time;
> +#endif
>                  __kernel_get_tbfreq;
>   #endif
>                  __kernel_sync_dicache;
> 
> Any opinions on this? If everyone agrees with that approach, I can
> send a cross-architecture patch to do this everywhere. It's probably
> best though if Christophe adds that to his series as it touches a lot
> of the same files and I would prefer to avoid conflicting changes.
> 

I guess it would be wise.

I don't think my series to switch powerpc to C VDSO will get ready 
anytime soon, because (in addition to the performance impact) I'm having 
hard time with the 32 bits VDSO for PPC64. Many of the powerpc header 
files used by lib/vdso/gettimeofday.c are not ready for generating 32 
bits code for PPC64. Main problem is that at many places, #ifdef 
CONFIG_PPC64 is used instead of #ifdef __powerpc64__. There are also 
some CONFIG options like CONFIG_GENERIC_ATOMIC64 that are selected only 
when CONFIG_PPC32 is set, but which are required for building the 32 
bits VDSO. For that I don't even know how to deal with it.

So, feel free to send your patch, and if my series comes early enough to 
conflict, I'll manage it.

Christophe
