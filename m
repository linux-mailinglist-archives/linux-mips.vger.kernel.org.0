Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8806412A05C
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 12:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfLXLM1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Dec 2019 06:12:27 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:17931 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbfLXLM0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Dec 2019 06:12:26 -0500
Received: from localhost (mailhub1-ext [192.168.12.233])
        by localhost (Postfix) with ESMTP id 47htpw3bjjz9tyXM;
        Tue, 24 Dec 2019 12:12:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=MvKlVWsI; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id DhOumcXGkzWb; Tue, 24 Dec 2019 12:12:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47htpw28BKz9tyXL;
        Tue, 24 Dec 2019 12:12:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1577185944; bh=Bn7IZfCcqw5bT2ttt8/4pM+iuD9f7XixnnqnooPsUO8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MvKlVWsI0nhGXz1jiEzJgtsO3vre9b9taOd50nQEl4NtQ8XZ3gLcegD4mGQBWSKK2
         TTyqxkgAFFOLrKfmRrtzeuOO6v+SE4+x6E4aUxR22pmu3jsA79yAvhgE5ex0ylbUmL
         FwCieuRAWn5hiSJ/qG7Zj3Zqlf5cj4c53n1w9sSA=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C3B18B783;
        Tue, 24 Dec 2019 12:12:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id ZGl4WaMQ75fX; Tue, 24 Dec 2019 12:12:25 +0100 (CET)
Received: from [192.168.232.53] (unknown [192.168.232.53])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 685338B782;
        Tue, 24 Dec 2019 12:12:24 +0100 (CET)
Subject: Re: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in
 __c_kernel_time()
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
 <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
From:   christophe leroy <christophe.leroy@c-s.fr>
Message-ID: <abc4b4a6-d355-4dfd-a207-603e877b2b23@c-s.fr>
Date:   Tue, 24 Dec 2019 12:12:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CALCETrV1TWD4iMoGFX6abxXFukz081Y2XaXy6p1KJBNLpp6ZTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Antivirus: Avast (VPS 191223-0, 23/12/2019), Outbound message
X-Antivirus-Status: Not-Tested
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 24/12/2019 à 02:58, Andy Lutomirski a écrit :
> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
>>
>> READ_ONCE() forces the read of the 64 bit value of
>> vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec allthough
>> only the lower part is needed.
> 
> Seems reasonable and very unlikely to be harmful.  That being said,
> this function really ought to be considered deprecated -- 32-bit
> time_t is insufficient.
> 
> Do you get even better code if you move the read into the if statement?

Euh ...

How can you return t when time pointer is NULL if you read t only when 
time pointer is not NULL ?

Christophe
