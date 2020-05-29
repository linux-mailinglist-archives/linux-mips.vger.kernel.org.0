Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B3E1E7933
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 11:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2JUu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 05:20:50 -0400
Received: from [115.28.160.31] ([115.28.160.31]:50294 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725562AbgE2JUu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 May 2020 05:20:50 -0400
Received: from hanazono.local (unknown [116.236.177.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0CE4E600B5;
        Fri, 29 May 2020 17:20:48 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590744048; bh=rfJZP3MBsJFZ+0w3MrNRzi/Voal3RFqUtg8DSWzN99k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fDsRX6OOnoJlj/YO0a8WLvxyiXm3GKhniq6EewVXjd7jUtmQiS76vQuGTkAcLYp2e
         s1erRcoNsDxhXBZBIpmJvf0iUCYv69hMd14iEJE6fhIag0IhwWWzw/detpt6HQok1V
         zrKlqzLCKdkIYDLKEeHtro6eBxHq9Iq1WipHf7vg=
Subject: Re: [PATCH] MIPS: Fix build warning about "PTR_STR" redefinition
To:     Huacai Chen <chenhc@lemote.com>, WANG Xuerui <kernel@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>
References: <1590740530-15649-1-git-send-email-chenhc@lemote.com>
 <d649c2a7-13b0-014b-8043-f3fdfbc72fa9@xen0n.name>
 <CAAhV-H6YVTfGi_Vz92sb0EF0jRCqFkzzN1HN2spCWt8ZRF53XQ@mail.gmail.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <9562aee3-e01c-7775-a718-415825a34b78@xen0n.name>
Date:   Fri, 29 May 2020 17:20:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6YVTfGi_Vz92sb0EF0jRCqFkzzN1HN2spCWt8ZRF53XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/5/29 17:12, Huacai Chen wrote:

> I'm sorry I forgot that, should I send V2?

Feel free to, at a *very* quick glance the implementation should have 
few problems if any...


P.S.: Please don't top post.

>
> Huacai
>
> On Fri, May 29, 2020 at 4:34 PM WANG Xuerui <kernel@xen0n.name> wrote:
>> Hi Huacai,
>>
>>
>> On 2020/5/29 16:22, Huacai Chen wrote:
>>
>>> PTR_STR is redefined when CONFIG_TEST_PRINTF is set. This causes the
>>> following build warning:
>>>
>>>     CC      lib/test_printf.o
>>> lib/test_printf.c:214:0: warning: "PTR_STR" redefined
>>>    #define PTR_STR "ffff0123456789ab"
>>>    ^
>>> In file included from ./arch/mips/include/asm/dsemul.h:11:0,
>>>                    from ./arch/mips/include/asm/processor.h:22,
>>>                    from ./arch/mips/include/asm/thread_info.h:16,
>>>                    from ./include/linux/thread_info.h:38,
>>>                    from ./include/asm-generic/preempt.h:5,
>>>                    from ./arch/mips/include/generated/asm/preempt.h:1,
>>>                    from ./include/linux/preempt.h:78,
>>>                    from ./include/linux/spinlock.h:51,
>>>                    from ./include/linux/seqlock.h:36,
>>>                    from ./include/linux/time.h:6,
>>>                    from ./include/linux/stat.h:19,
>>>                    from ./include/linux/module.h:13,
>>>                    from lib/test_printf.c:10:
>>> ./arch/mips/include/asm/inst.h:20:0: note: this is the location of the previous definition
>>>    #define PTR_STR  ".dword"
>>>    ^
>>>
>>> Instead of renaming PTR_STR again and again, it is better to move the
>>> unaligned load/store helpers from inst.h to unaligned.h, suggested by
>>> Maciej W. Rozycki.
>> I don't have time to review the implementation at the moment, but you
>> can use the Suggested-by tag to mention Maciej in a structured way.
>>
>>> Fixes: e701656ec4db ("MIPS: inst.h: Stop including asm.h to avoid various build failures")
>>> Cc: Maciej W. Rozycki" <macro@linux-mips.org>
>>> Reported-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>>> ---
>>>    arch/mips/include/asm/inst.h      | 779 ------------------------------------
>>>    arch/mips/include/asm/unaligned.h | 802 ++++++++++++++++++++++++++++++++++++++
>>>    arch/mips/kernel/unaligned.c      |   1 +
>>>    arch/mips/loongson64/cop2-ex.c    |   1 +
>>>    4 files changed, 804 insertions(+), 779 deletions(-)
>>>    create mode 100644 arch/mips/include/asm/unaligned.h
