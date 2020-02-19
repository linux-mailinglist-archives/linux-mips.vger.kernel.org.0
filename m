Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86EE9163F8C
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 09:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgBSIps (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 03:45:48 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:29343 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbgBSIps (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Feb 2020 03:45:48 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 48MrsP1rpLz9v6b8;
        Wed, 19 Feb 2020 09:45:45 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=Z05PqepO; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id keiKTMYSteB4; Wed, 19 Feb 2020 09:45:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 48MrsN71T3z9v6b7;
        Wed, 19 Feb 2020 09:45:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1582101945; bh=5A070PBG/NLKWQpTrZybAuA+otVPzj/KnbWKO2e8w8o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Z05PqepONeujNziQ5YL8gnf1Z3+G6cb6ihOxmxz8uWdJtZ5jvdl2W5nDGv6hQ627P
         yeH79Ly2Y6BDHEAClz4F0Sl7Ug7F7nBhocpqGaYZNQCnKXBAU1M4joGRYAVfpvCCT5
         7XWc5FDRGFtiGRD1v2TVtmoHayh/6+4PxTcYWAOs=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 055918B829;
        Wed, 19 Feb 2020 09:45:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 39Yl18DznLEK; Wed, 19 Feb 2020 09:45:45 +0100 (CET)
Received: from [172.25.230.102] (unknown [172.25.230.102])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BA9888B756;
        Wed, 19 Feb 2020 09:45:45 +0100 (CET)
Subject: Re: Surprising code generated for vdso_read_begin()
To:     Arnd Bergmann <arnd@arndb.de>,
        Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
 <20200109200733.GS3191@gate.crashing.org>
 <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr>
 <20200111113328.GX3191@gate.crashing.org>
 <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <305fcee5-2e1b-ea4d-9a2a-a0e8034d40a8@c-s.fr>
Date:   Wed, 19 Feb 2020 09:45:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 16/02/2020 à 19:10, Arnd Bergmann a écrit :
> On Sat, Jan 11, 2020 at 12:33 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
>>
>> On Fri, Jan 10, 2020 at 07:45:44AM +0100, Christophe Leroy wrote:
>>> Le 09/01/2020 à 21:07, Segher Boessenkool a écrit :
>>>> It looks like the compiler did loop peeling.  What GCC version is this?
>>>> Please try current trunk (to become GCC 10), or at least GCC 9?
>>>
>>> It is with GCC 5.5
>>>
>>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have more
>>> recent than 8.1
>>
>> Arnd, can you update the tools?  We are at 8.3 and 9.2 now :-)  Or is
>> this hard and/or painful to do?
> 
> To follow up on this older thread, I have now uploaded 6.5, 7.5, 8.3 and 9.2
> binaries, as well as a recent 10.0 snapshot.
> 

Thanks Arnd,

I have built the VDSO with 9.2, I get less performant result than with 
8.2 (same performance as with 5.5).

After a quick look, I see:
- Irrelevant NOPs to align loops and stuff, allthough -mpcu=860 should 
avoid that.
- A stack frame is set for saving r31 in __c_kernel_clock_gettime. GCC 
8.1 don't need that, all VDSO functions are frameless with 8.1

Christophe
