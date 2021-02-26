Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5510F325E0B
	for <lists+linux-mips@lfdr.de>; Fri, 26 Feb 2021 08:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBZHLp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Feb 2021 02:11:45 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52658 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229967AbhBZHLn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 26 Feb 2021 02:11:43 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOdT6njhgSeEPAA--.20337S3;
        Fri, 26 Feb 2021 15:10:52 +0800 (CST)
Subject: Re: [PATCH RFC] MIPS: Remove detect_memory_region()
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
References: <1614171720-13221-1-git-send-email-hejinyang@loongson.cn>
 <987b0dc5-9306-4271-afc0-7c44dba644b7@www.fastmail.com>
 <a657ea7c-3d0e-6b92-5ad6-c445e827a845@loongson.cn>
 <ba014ac1-6a83-7b11-e9a7-e6ad9ba1aa62@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <15ea0085-eaf6-13aa-9568-9405fe9d48b6@loongson.cn>
Date:   Fri, 26 Feb 2021 15:10:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ba014ac1-6a83-7b11-e9a7-e6ad9ba1aa62@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxOdT6njhgSeEPAA--.20337S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFy3Ar4xAw4UZry5Cw47CFg_yoW5Cr4fpr
        W5CFsFkr4Dtr1Ivws2vw1kWayIy34rJa1rXryYyr9ru3s09rnayr4xtw4jka4qvr1xGFWj
        va18XF17Z3s8ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU5pwZ3UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/26/2021 02:52 PM, Jiaxun Yang wrote:

> 在 2021/2/26 上午9:37, Jinyang He 写道:
>> On 02/24/2021 11:40 PM, Jiaxun Yang wrote:
>>
>>>
>>> On Wed, Feb 24, 2021, at 9:02 PM, Jinyang He wrote:
>>>> detect_memory_region() was committed by Commit 4d9f77d25268 ("MIPS: 
>>>> add
>>>> detect_memory_region()"). Then it was equipped by Commit dd63b00804a5
>>>> ("MIPS: ralink: make use of the new memory detection code") and
>>>> Commit 9b75733b7b5e ("MIPS: ath79: make use of the new memory 
>>>> detection
>>>> code"). Its code is based on early ath79 platform code.
>>>>
>>>> What puzzles me is that how memcmp() detect the memory region. If 
>>>> `break`
>>>> was touched, the function could make sense. That means memcmp() should
>>>> return zero. Otherwise, the loop will be end by size > sz_max.
>>>>
>>>> I have tested detect_memory_region() on Loongson64 3A3000. On our 
>>>> design,
>>>> kseg0 low 256MB maps real memory and kseg0 high 256MB maps IO/PCI. The
>>>> function runs and last stopped on kseg1 where is uncached. In this 
>>>> process
>>>> memcmp also returned non-zero when detected kseg0 high 256MB. Then 
>>>> I did
>>>> another thing. memcpy first and test memcmp then (after &_end). It 
>>>> works
>>>> well on 3A3000 but badly on 3A4000. Maybe because kseg0 high 256MB 
>>>> maps
>>>> IO/PCI and it is dangerous to write like write memory.
>>>>
>>>> At last, read memory from where is not memory region may always 
>>>> return 0.
>>>> (Or trigger exception.) This function have been used several years and
>>>> seems no error occur. Maybe it's a fallback way.
>>> That is not true for other platforms like ath79 or mtk.
>>> They'll wrap around or return 0xffffffff for out of boundary accessing.
>>>
>>> Loongson does not apply to this case as it have special "Address 
>>> Window"
>>> design to accurately describe address regions.
>>> Any access beyond described windows will be handled by MC and return 
>>> 0 or random stuff.
>>>
>>> Again, please don't make changes because you can.
>>>
>>> Thanks.
>>>
>>> - Jiaxun
>>
>> Hi, Jiaxun,
>>
>> Thank you for answering this puzzle for me in detail.
>>
>> Assume that the machine has 8MB real memory and dm address is (base + 
>> 3M).
>> When size = 8MB, there will be a phenomenon of `wrap around`, the actual
>> content of (dm + 8M + 3M) is content of (dm + 3M), so it will trigger
>> `break`, right? At this time, the kernel will add 8M to the memory.
>
> Hi Jingyang,
>
> How can you boot kernel with 8M memory in present days ;-)
> (Ohh with respect to Nintendo64 developer who had proven it's possible)
>
> For what I can say, detect_memory_region exists because many devices
> doesn't have a way to pass memory size information from bootloader to
> kernel. Or their bootloader even don't care about memory size.
>
> Kernel needs it to get memory size correctly. Although it seems fragile.
>
> That's life, we must accept imperfect past and don't repeat it in future.
>
> Thanks.
>
> - Jiaxun
>
>
That's just a assume. Because it looks fresh to me.
Thank you very much. :-D

>>
>> Thanks,
>> Jinyang
>>

