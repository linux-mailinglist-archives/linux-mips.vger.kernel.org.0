Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6E62C3AB8
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 09:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgKYIPZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 03:15:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38340 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725776AbgKYIPY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Nov 2020 03:15:24 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxatCPEr5fpnMWAA--.36216S3;
        Wed, 25 Nov 2020 16:15:12 +0800 (CST)
Subject: Re: [PATCH RESEND 1/2] MIPS: cacheinfo: Add missing VCache
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
 <20200820004253.3418-2-jiaxun.yang@flygoat.com>
 <20200821165539.GA15948@alpha.franken.de>
 <79476b22-04ef-968b-584a-10aa4357ee6b@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <6133d081-6f80-d438-1004-a7224873c61d@loongson.cn>
Date:   Wed, 25 Nov 2020 16:15:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <79476b22-04ef-968b-584a-10aa4357ee6b@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxatCPEr5fpnMWAA--.36216S3
X-Coremail-Antispam: 1UD129KBjvJXoWxur17uw4UKr4kAr47Ar15CFg_yoW5Gry5pr
        ZrGFsxGr48ZrZ7C34Sqrn5Xw1ft34rXF18Cw13JayrZw1a9r1UXrykG34F9F9Fvr18GF4f
        Xw17GF13WFn0yFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfUe2NtDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/03/2020 01:40 PM, Jiaxun Yang wrote:
>
>
> 在 2020/8/22 0:55, Thomas Bogendoerfer 写道:
>> On Thu, Aug 20, 2020 at 08:42:49AM +0800, Jiaxun Yang wrote:
>>> Victim Cache is defined by Loongson as per-core unified
>>> private Cache.
>>> Add this into cacheinfo and make cache levels selfincrement
>>> instead of hardcode levels.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>   arch/mips/kernel/cacheinfo.c | 34 ++++++++++++++++++++++++++--------
>>>   1 file changed, 26 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/mips/kernel/cacheinfo.c 
>>> b/arch/mips/kernel/cacheinfo.c
>>> index 47312c529410..83548331ee94 100644
>>> --- a/arch/mips/kernel/cacheinfo.c
>>> +++ b/arch/mips/kernel/cacheinfo.c
>>> @@ -35,6 +35,11 @@ static int __init_cache_level(unsigned int cpu)
>>>         leaves += (c->icache.waysize) ? 2 : 1;
>>>   +    if (c->vcache.waysize) {
>>> +        levels++;
>>> +        leaves++;
>>> +    }
>>> +
>>>       if (c->scache.waysize) {
>>>           levels++;
>>>           leaves++;
>>> @@ -74,25 +79,38 @@ static int __populate_cache_leaves(unsigned int 
>>> cpu)
>>>       struct cpuinfo_mips *c = &current_cpu_data;
>>>       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>>>       struct cacheinfo *this_leaf = this_cpu_ci->info_list;
>>> +    int level = 1;
>>>         if (c->icache.waysize) {
>>> -        /* L1 caches are per core */
>>> +        /* D/I caches are per core */
>>>           fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
>>> -        populate_cache(dcache, this_leaf, 1, CACHE_TYPE_DATA);
>>> +        populate_cache(dcache, this_leaf, level, CACHE_TYPE_DATA);
>>>           fill_cpumask_siblings(cpu, &this_leaf->shared_cpu_map);
>>> -        populate_cache(icache, this_leaf, 1, CACHE_TYPE_INST);
>>> +        populate_cache(icache, this_leaf, level, CACHE_TYPE_INST);
>>> +        level++;
>>>       } else {
>>> -        populate_cache(dcache, this_leaf, 1, CACHE_TYPE_UNIFIED);
>>> +        populate_cache(dcache, this_leaf, level, CACHE_TYPE_UNIFIED);
>>> +        level++;
>>> +    }
>>> +
>>> +    if (c->vcache.waysize) {
>> why can't we insert vcache as level 4 and leave the rest of the file
>> alone ?
>
> Hi Thomas,
>
> Oops I forgot this patch.
>
> Because  VCache is physicaly placed between Scache and I/D Cache as per
> core chahe, it will confuse userspace program otherwise.
>
> Also I do think the level should be continues.

With this patch, we can see the vcache info as L2 cache
and scache info as L3 cache on the Loongson 3A3000
and 3A4000 platform.

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

>
> Thanks
>
> - Jiaxun
>
>>
>> Thomas.
>>

