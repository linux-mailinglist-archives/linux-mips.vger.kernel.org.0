Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE58D2A5EA5
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 08:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgKDHSR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Nov 2020 02:18:17 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49648 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727651AbgKDHSR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Nov 2020 02:18:17 -0500
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxutCwVaJfH4AFAA--.5797S3;
        Wed, 04 Nov 2020 15:18:09 +0800 (CST)
Subject: Re: [PATCH v3 5/6] MIPS: Loongson64: SMP: Fix up play_dead jump
 indicator
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
 <1604387525-23400-6-git-send-email-yangtiezhu@loongson.cn>
 <e534bc91-a946-fde7-a411-bf200abbe6a5@loongson.cn>
 <85ce1b63-1c39-d567-1bb1-8a6431c9c895@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <cf187478-8f9d-b321-3ea2-4fbaf70ed330@loongson.cn>
Date:   Wed, 4 Nov 2020 15:18:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <85ce1b63-1c39-d567-1bb1-8a6431c9c895@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxutCwVaJfH4AFAA--.5797S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWxuryrKw18Cw17tFyxXwb_yoW5Xw4rp3
        yDAay2kan8Wr1jk3Wktw18XFWUJrZIqFy5XFWqgr1ru3s09w1S9Fyakr4rWFy7Zr18Ka4U
        Zr1DCas7uFW5AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
        VjvjDU0xZFpf9x0JUffHUUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/04/2020 03:04 PM, Jiaxun Yang wrote:

>
>
> 在 2020/11/4 14:31, Jinyang He 写道:
>> Hi, all,
>>
>> On 11/03/2020 03:12 PM, Tiezhu Yang wrote:
>>> In play_dead function, the whole 64-bit PC mailbox was used as a 
>>> indicator
>>> to determine if the master core had written boot jump information.
>>>
>>> However, after we introduced CSR mailsend, the hardware will not 
>>> guarante
>>> an atomic write for the 64-bit PC mailbox. Thus we have to use the 
>>> lower
>>> 32-bit which is written at the last as the jump indicator instead.
>>>
>>> Signed-off-by: Lu Zeng <zenglu@loongson.cn>
>>> Signed-off-by: Jun Yi <yijun@loongson.cn>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>
>>> v2: No changes
>>> v3: Update the commit message and comment
>>>
>>>   arch/mips/loongson64/smp.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
>>> index 736e98d..aa0cd72 100644
>>> --- a/arch/mips/loongson64/smp.c
>>> +++ b/arch/mips/loongson64/smp.c
>>> @@ -764,9 +764,10 @@ static void loongson3_type3_play_dead(int 
>>> *state_addr)
>>>           "1: li    %[count], 0x100             \n" /* wait for init 
>>> loop */
>>>           "2: bnez  %[count], 2b                \n" /* limit mailbox 
>>> access */
>>>           "   addiu %[count], -1                \n"
>>> -        "   ld    %[initfunc], 0x20(%[base])  \n" /* get PC via 
>>> mailbox */
>> I have some confusion here. Play_dead CPUs is always brought up by 
>> cpu_up().
>> On Loongson64, it calls loongson3_boot_secondary(). The value of 
>> startargs[0]
>> is the address of smp_bootstrap() which is in CKSEG0 and a constant 
>> after the
>> kernel is compiled. That means its value likes 0xffffffff8... and 
>> only the low
>> 32bit is useful. As "lw" is sign-extended, could we replace "ld" with 
>> "lw" simply?
>
> Hi Jinyang,
>
> I'd prefer not to do so. In future we may have kernel running in other 
> spaces,
> (e.g. xkphys), and there is no reason to add a barrier on that without 
> actual benefit.
> I had check PMON firmware and it's also loading the full 64-bit address.
>
> Also to keep consistent, mailbox writing part needs to be refined to 
> match the
> behavior of reading. Otherwise other readers will be confused.
>
> Thus leaving it as is looks much more reasonable.

OK, the current code looks better,
please ignore my comment, sorry for the noise.

Thanks,
Jinyang

>
> Thanks.
>
> - Jiaxun
>
>>
>> Thanks,
>> Jinyang
>>> +        "   lw    %[initfunc], 0x20(%[base])  \n" /* check lower 
>>> 32-bit as jump indicator */
>>>           "   beqz  %[initfunc], 1b             \n"
>>>           "   nop                               \n"
>>> +        "   ld    %[initfunc], 0x20(%[base])  \n" /* get PC (whole 
>>> 64-bit) via mailbox */
>>>           "   ld    $sp, 0x28(%[base])          \n" /* get SP via 
>>> mailbox */
>>>           "   ld    $gp, 0x30(%[base])          \n" /* get GP via 
>>> mailbox */
>>>           "   ld    $a1, 0x38(%[base])          \n"

