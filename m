Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8313FA8404
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 15:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIDM6J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 08:58:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:55999 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIDM6J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 08:58:09 -0400
Received: from [10.8.0.76] (unknown [89.187.165.41])
        by mail (Coremail) with SMTP id QMiowPCxIM_VtG9dwT08AA--.6515S2;
        Wed, 04 Sep 2019 20:58:09 +0800 (CST)
Subject: Re: Something about loongson_llsc_mb
To:     ambrosehua@icloud.com
Cc:     Paul Burton <paul.burton@mips.com>, jhogan <jhogan@kernel.org>,
        "jiaxun.yang" <jiaxun.yang@flygoat.com>,
        linux-mips <linux-mips@vger.kernel.org>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <tencent_34DDA31F622119EE5003B7F4@qq.com>
 <2019090410032559707512@loongson.cn>
 <20190904092154.GC2349@hirez.programming.kicks-ass.net>
From:   Huang Pei <huangpei@loongson.cn>
Message-ID: <270f90f1-cbe5-b8e3-4f67-dc13781719e5@loongson.cn>
Date:   Wed, 4 Sep 2019 20:57:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190904092154.GC2349@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QMiowPCxIM_VtG9dwT08AA--.6515S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFWftFyrZw1UWF45KrW7Arb_yoW5XF15p3
        yIkF42yr4vyr4Iywsay3yDX3WS9395Ar9rZFyrurZIkas2g3sxtrW09r9rurWDJr93Gr42
        yFWDC3W7XFykuFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE1syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
        xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
        MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v2
        6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
        bVAw3UUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/04/2019 05:21 PM, Peter Zijlstra wrote:
> 
> *why* are you replying to some random unrelated thread?

Chen ask me if whether your patch has more sync than needed, but I'm not sure 
whether sync before and after *cmpxchg_local* is.
> 
> Also, please use a sane MUA and wrap your lines <80 chars.

Sorry, I finally got thunderbird in plain text mode with < 80 chars. It wont 
happen again.

> 
> On Wed, Sep 04, 2019 at 10:03:31AM +0800, huangpei@loongson.cn wrote:
>>> Hi, Peter,
>>>
>>> I found that this patch has been merged but I haven't received the e-mail for some unknown reasons.
>>> https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=1c6c1ca318585f1096d4d04bc722297c85e9fb8a
>>>
>>> Firstly, your comments are correct, so the barrier.h part is perfect.
>>>
>>> Secondly, most of the rest is useless, because smp_mb__before_llsc, loongson_llsc_mb and other memory barriers are the same thing on Loongson-3. We don't need to add loongson_llsc_mb if there is already a smp_mb__before_llsc.
> 
> There wasn't. Take for example set_bit(), that didn't have
> smp_mb__before_llsc on.
> 
> Also; MIPS should probably convert to asm-generic/bitops/atomic.h.
> 
>>> Thirdly, maybe the only exception is syscall.c, but mips_atomic_set is not used on Loongson-3. And if in some cases we use it, I think the user-to-kernel context switch has the same effect of a memory barrier.
> 
> And how is some random person trying to make sense of MIPS to know that?
> 
> You all created a badly documented inconsitent trainwreck. You're
> 'lucky' the MIPS maintainers accepted that mess in the first place.
> 
> Anyway, yes there are too many barrers now in some cases, in a previous
> version I had:
> 
>    https://lkml.kernel.org/r/20190424124421.693353463@infradead.org
> 
> But because I dropped changes to local.h that might not be true anymore;
> it needs careful consideration. Please audit carefully and if you find
> all smp_mb__before_llsc() usage is now superfluous for this 'funny' chip
> of yours, then re-submit the above patch.
> 
>> +. per-cpu like local_t *should only* be written by local cpu, and may be read by remote cpu sometimes
>>
>> +. if and only if local cpu can write per-cpu, then Loongson3's llsc bug would not be triggerd.
>>
>> same as this_cpu_cmpxchg_double
>>
>> If so, then no need to add sync before and after cmpxchg_local
> 
> Correct, we already dropped the change for other local.h stuff.
> 

What about cmpxchg_local? Your patch add sync before and after ll/sc in 
__cmpxchg, so *cmpxchg_local* has sync around it. But cmpxchg_local operate on 
per-cpu, which *shall not* trigger loongson's LLSC bug, since only *this* cpu 
write, other cpus read.

