Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE2A14C6D9
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2020 08:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgA2H0n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jan 2020 02:26:43 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:22127 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbgA2H0m (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Jan 2020 02:26:42 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 486w5q6898z9txVs;
        Wed, 29 Jan 2020 08:26:39 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=j/GZoeZ7; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id fPfSf9D4r1FM; Wed, 29 Jan 2020 08:26:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 486w5q51hdz9txVr;
        Wed, 29 Jan 2020 08:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1580282799; bh=5Fxvw/jc8y//pgWf3Spr5zDn1R4mwLPSzwzdVvG6uYE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=j/GZoeZ7wNtfHmMjeTo0R1mIA/Jal8yTZuk8S1UKYG452qCeEkzIOsUiHWQUbSUyA
         xN2AF+i5Dd7yrwJNyYNINzj08Cqz55AfcregSWbEZxjqj7g9/tN/qj4szTYq+Jf9oz
         itEzCxCoNxR03K2bPrvRD7TAnf0KTL/yWQEVRw14=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 913908B7FE;
        Wed, 29 Jan 2020 08:26:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id FlKTzVgQvj4i; Wed, 29 Jan 2020 08:26:40 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 88FFC8B768;
        Wed, 29 Jan 2020 08:26:39 +0100 (CET)
Subject: Re: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns
 shift operation
To:     Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
 <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
 <877e1rfa40.fsf@nanos.tec.linutronix.de>
 <CALCETrX5B0SEJN2WG7rzuzbGhWa_dEwVVpMu6deXof3H+K_LdQ@mail.gmail.com>
 <87mua64tv0.fsf@nanos.tec.linutronix.de>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1329105a-aa6b-bd40-3a62-5c7e130d2a7b@c-s.fr>
Date:   Wed, 29 Jan 2020 08:26:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <87mua64tv0.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 29/01/2020 à 08:14, Thomas Gleixner a écrit :
> Andy Lutomirski <luto@kernel.org> writes:
> 
>> On Thu, Jan 16, 2020 at 11:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>>>
>>> Andy Lutomirski <luto@kernel.org> writes:
>>>> On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
>>>>
>>>> Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
>>>> assume the shift is less than 32?  That function exists to benefit
>>>> 32-bit arches.
>>>
>>> We'd want mul_u64_u32_shr() for this. The rules for mult and shift are:
>>>
>>
>> That's what I meant to type...
> 
> Just that it does not work. The math is:
> 
>       ns = d->nsecs;   // That's the nsec value shifted left by d->shift
> 
>       ns += ((cur - d->last) & d->mask) * mult;
> 
>       ns >>= d->shift;
> 
> So we cannot use mul_u64_u32_shr() because we need the addition there
> before shifting. And no, we can't drop the fractional part of
> d->nsecs. Been there, done that, got sporadic time going backwards
> problems as a reward. Need to look at that again as stuff has changed
> over time.
> 
> On x86 we enforce that mask is 64bit, so the & operation is not there,
> but due to the nasties of TSC we have that conditional
> 
>      if (cur > last)
>         return (cur - last) * mult;
>      return 0;
> 
> Christophe, on PPC the decrementer/RTC clocksource masks are 64bit as
> well, so you can spare that & operation there too.
> 

Yes, I did it already. It spares reading d->mast, that the main advantage.

Christophe
