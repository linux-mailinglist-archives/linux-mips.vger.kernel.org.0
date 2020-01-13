Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB5D1390AD
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 13:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgAMMES (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 07:04:18 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:9166 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728641AbgAMMES (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 07:04:18 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47xC1R5FbGz9txxD;
        Mon, 13 Jan 2020 13:04:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=RYPWm/IX; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id Hval_bWc400h; Mon, 13 Jan 2020 13:04:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47xC1R4CpHz9txxC;
        Mon, 13 Jan 2020 13:04:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578917051; bh=MvSTc3YCiZWGwG0qnYB8ibq5lqkALByXbfzJloZm6VI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RYPWm/IXQ/KxMHRniZs4sJA0UPIhBFyVBryEW3BKqF+e4rY1+/0Wr9KTb1Oy2Acmm
         QrU95xCviWgxho42vEOCHJ/Ec2LbEtDqIZJ4fGcLpTEgDDzqFJ3q5Tte95EDnP9ZWN
         /49rH0RisWsJHOGyX6JNukoKDcuHt44/tBSegBbY=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 82B088B7B7;
        Mon, 13 Jan 2020 13:04:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 5C6xgoSYmG2P; Mon, 13 Jan 2020 13:04:16 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 47C788B79F;
        Mon, 13 Jan 2020 13:04:16 +0100 (CET)
Subject: Re: [PATCH] lib: vdso: mark __cvdso_clock_getres() as static
To:     Thomas Gleixner <tglx@linutronix.de>, arnd@arndb.de,
        vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
References: <e7becc50bee355e3872b84d91cc68ae8d7776bb9.1578764712.git.christophe.leroy@c-s.fr>
 <875zhhsr0h.fsf@nanos.tec.linutronix.de>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <658045cd-3f97-946d-6920-bea772e9be24@c-s.fr>
Date:   Mon, 13 Jan 2020 13:04:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <875zhhsr0h.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le 11/01/2020 à 20:59, Thomas Gleixner a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> When __cvdso_clock_getres() became __cvdso_clock_getres_common()
>> and a new __cvdso_clock_getres() was added, static qualifier was
>> forgotten.
>>
>> Fixes: 502a590a170b ("lib/vdso: Move fallback invocation to the callers")
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> I've already queued:
> 
>       https://lore.kernel.org/r/20191128111719.8282-1-vincenzo.frascino@arm.com
> 
> but thanks for caring!
> 


Is there a git tree with the latest VDSO status ?

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git?h=timers%2Fvdso 
is 6 monthes old.

Christophe
