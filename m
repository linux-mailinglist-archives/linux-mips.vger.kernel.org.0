Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9E5D13D68D
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 10:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgAPJQX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 04:16:23 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:1558 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726970AbgAPJQW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 04:16:22 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47yz8L74yxz9tyQR;
        Thu, 16 Jan 2020 10:16:18 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=kHJ/FujL; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id lt8jAOtwQ37r; Thu, 16 Jan 2020 10:16:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47yz8L5yqZz9tyQP;
        Thu, 16 Jan 2020 10:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1579166178; bh=zhSNNoA19/DJtyqK00k6NS1e1aITemDpv4Uo0GCOeHg=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=kHJ/FujLNVI5NHn588r9Xp2wHJbaCU+ZBkfGxNVcWiwtRBmZW0lfLLuD4NqyCZjiq
         +rTgIsm7pFN1rx7YTTWhuMQluEkHnAwg5Mf/G4PgNahbW9tMt03xitw118O2by2nT9
         rGG+pJM5Wh/XK2tpcgdQ3yLjIqpixSaM9eK0L1tQ=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id DA4C58B811;
        Thu, 16 Jan 2020 10:16:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id FPW2Cv_UNA79; Thu, 16 Jan 2020 10:16:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 212448B810;
        Thu, 16 Jan 2020 10:16:19 +0100 (CET)
Subject: Re: [RFC PATCH v3 08/12] lib: vdso: allow arches to provide vdso data
 pointer
From:   Christophe Leroy <christophe.leroy@c-s.fr>
To:     Thomas Gleixner <tglx@linutronix.de>, luto@kernel.org
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        vincenzo.frascino@arm.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
 <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr>
 <87ftghbpuu.fsf@nanos.tec.linutronix.de>
 <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr>
Message-ID: <b5fddcf8-99ff-fc0d-40c0-0eb81ad4e94a@c-s.fr>
Date:   Thu, 16 Jan 2020 10:16:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas, Andy,

Le 15/01/2020 à 07:15, Christophe Leroy a écrit :
> 
> 
> Le 15/01/2020 à 00:06, Thomas Gleixner a écrit :
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>   static __maybe_unused int
>>> +#ifdef VDSO_GETS_VD_PTR_FROM_ARCH
>>> +__cvdso_clock_gettime_common(const struct vdso_data *vd, clockid_t 
>>> clock,
>>> +              struct __kernel_timespec *ts)
>>> +{
>>> +#else
>>>   __cvdso_clock_gettime_common(clockid_t clock, struct 
>>> __kernel_timespec *ts)
>>>   {
>>>       const struct vdso_data *vd = __arch_get_vdso_data();
>>> +#endif
>>>       u32 msk;
>>
>> If we do that, then there is no point in propagating this to the inner
>> functions. It's perfectly fine to have this distinction at the outermost
>> level.
> 
> In v2, I did it at the arch level (see 
> https://patchwork.ozlabs.org/patch/1214983/). Andy was concerned about 
> it being suboptimal for arches which (unlike powerpc) have PC related 
> data addressing mode.
> 
> Wouldn't it be the same issue if doing it at the outermost level of 
> generic VDSO ?

Any opinion on this ?

 From your point of view, what should I do:
A/ __arch_get_vdso_data() handled entirely at arch level and arches 
handing over the vdso data pointer to generic C VDSO functions all the 
time (as in my v2 series) ?
B/ Data pointer being handed over all the way up for arches wanting to 
do so, no changes at all for others (as in my v3 series) ?
C/ __arch_get_vdso_data() being called at the outermost generic level 
for arches not interested in handling data pointer from the caller (as 
suggested by Thomas) ?

Andy, with A/ you were concerned about arches being able to do PC 
related accesses. Would it be an issue for C/ as well ? If not, I guess 
C/ would be cleaner than B/ allthought not as clean as A which doesn't 
add any #ifdefery at all.

Thanks
Christophe
