Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A3C365041
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 04:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhDTCRB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 22:17:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42222 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229534AbhDTCRA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Apr 2021 22:17:00 -0400
Received: from [10.130.0.193] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxU+B4OX5ga8oKAA--.18176S3;
        Tue, 20 Apr 2021 10:16:26 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix cmdline "mem=" parameter parsing
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1618829425-11873-1-git-send-email-tangyouling@loongson.cn>
 <5d4d31aa-7fe5-bf8d-1d77-a1605f0c2793@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jinyang He <hejinyang@loongson.cn>
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <3e8be714-6017-b0c7-9c71-7464d9b2b793@loongson.cn>
Date:   Tue, 20 Apr 2021 10:16:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5d4d31aa-7fe5-bf8d-1d77-a1605f0c2793@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxU+B4OX5ga8oKAA--.18176S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWkur1UXFy7ArW3ur15urg_yoW8Cr4xpw
        4UCa4Fka1qgr9Fg3W0y395uw1rJas5GFWxJF47Zwn5A3WqqF1xJF1FqF15uFyIvrW7K3WI
        qa4j9ryUuan7ZFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
        73UjIFyTuYvjfUnhFxUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun

On 04/20/2021 09:05 AM, Jiaxun Yang wrote:
>
> 在 2021/4/19 18:50, Youling Tang 写道:
>> This problem may only occur on NUMA platforms. When machine start 
>> with the
>> "mem=" parameter on Loongson64, it cannot boot. When parsing the "mem="
>> parameter, first remove all RAM, and then add memory through 
>> memblock_add(),
>> which causes the newly added memory to be located on MAX_NUMNODES.
>>
>> The solution is to add the current "mem=" parameter range to the 
>> memory area
>> of the corresponding node, instead of adding all of it to the 
>> MAX_NUMNODES
>> node area. Get the node number corresponding to the "mem=" parameter 
>> range
>> through pa_to_nid(), and then add it to the corresponding node through
>> memblock_add_node().
>>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> ---
>>   arch/mips/kernel/setup.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index 279be01..b86e241 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -359,7 +359,7 @@ static int __init early_parse_mem(char *p)
>>       if (*p == '@')
>>           start = memparse(p + 1, &p);
>>   -    memblock_add(start, size);
>> +    memblock_add_node(start, size, pa_to_nid(start));
>
> pa_to_nid is not available for all platforms.
>
Thanks for your correction.

pa_to_nid() only has actual definitions in mach-ip27 and mach-loongson64 
(only
for NUMA platform).

In arch/mips/include/asm/mmzone.h:
#ifndef pa_to_nid
#define pa_to_nid(addr) 0
#endif

So only need #include <asm/mmzone.h> to solve the "error: implicit 
declaration
of function'pa_to_nid'" compilation error.

Thanks,
Youling
>
> Thanks.
>
> - Jiaxun
>
>>         return 0;
>>   }

