Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436A03146ED
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 04:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhBIDVs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 22:21:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:51972 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230387AbhBIDTU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 22:19:20 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn_Ls_iFgJW8IAA--.10797S3;
        Tue, 09 Feb 2021 11:18:04 +0800 (CST)
Subject: Re: [PATCH] MIPS: Make check condition for SDBBP consistent with
 EJTAG spec
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1612790085-14436-1-git-send-email-yangtiezhu@loongson.cn>
 <76dbc72a-32fd-4de3-bc36-3eb0d0eebb44@www.fastmail.com>
 <d2df38f5-0894-44b3-a88c-fe9a7e595284@www.fastmail.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1bce5614-39bb-2581-f9b0-1178c6339d44@loongson.cn>
Date:   Tue, 9 Feb 2021 11:18:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d2df38f5-0894-44b3-a88c-fe9a7e595284@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn_Ls_iFgJW8IAA--.10797S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tF17ur47Xw43Aw4fZF1rCrg_yoW8ur4kpr
        4UKa4vkFWkXr1jvFyjyw4rKrn0v3yDKrWSga1vq34F9F1qgFn5tFn29rWj9ryYgr1Ika40
        v3WjqFnFyr1SyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
        VjvjDU0xZFpf9x0JU2FALUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/09/2021 10:36 AM, Jiaxun Yang wrote:
>
> On Tue, Feb 9, 2021, at 12:32 AM, Jiaxun Yang wrote:
>>
>> On Mon, Feb 8, 2021, at 9:14 PM, Tiezhu Yang wrote:
>>> According to MIPS EJTAG Specification [1], a Debug Breakpoint
>>> exception occurs when an SDBBP instruction is executed, the
>>> CP0_DEBUG bit DBp indicates that a Debug Breakpoint exception
>>> occurred, just check bit DBp for SDBBP is more accurate.
>>>
>>> [1] http://www.t-es-t.hu/download/mips/md00047f.pdf
>>>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>   arch/mips/kernel/genex.S | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
>>> index bcce32a..6336826 100644
>>> --- a/arch/mips/kernel/genex.S
>>> +++ b/arch/mips/kernel/genex.S
>>> @@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
>>>   	MTC0	k0, CP0_DESAVE
>>>   	mfc0	k0, CP0_DEBUG
>>>   
>>> -	sll	k0, k0, 30	# Check for SDBBP.
>>> -	bgez	k0, ejtag_return
>>> +	andi	k0, k0, 0x2	# Check for SDBBP.
>>> +	beqz	k0, ejtag_return
>> You'd better define a marco for it to prevent further confusion.

OK,  thanks, I will do it in v2.

>>
>> Btw I'm curious about how do kernel receive EJTAG exception?
>> In my understanding there are only two possible EJTAG exception vectors,
>> 0xbfc00480 and DSEG one. Both of them are reachable by kernel.
> ^ not
>
>> How do this piece of code work?

We can see some useful explanations from the following comment,
the firmware needs to make sure jump to except_vec_ejtag_debug.

arch/mips/kernel/genex.S
/*
  * EJTAG debug exception handler.
  * The EJTAG debug exception entry point is 0xbfc00480, which
  * normally is in the boot PROM, so the boot PROM must do an
  * unconditional jump to this vector.
  */
NESTED(except_vec_ejtag_debug, 0, sp)
         j       ejtag_debug_handler
#ifdef CONFIG_CPU_MICROMIPS
          nop
#endif
         END(except_vec_ejtag_debug)

>>
>> Thanks.
>>
>> - Jiaxun
>>
>>>   
>>>   #ifdef CONFIG_SMP
>>>   1:	PTR_LA	k0, ejtag_debug_buffer_spinlock
>>> -- 
>>> 2.1.0
>>>
>>>
>> -- 
>> - Jiaxun
>>

