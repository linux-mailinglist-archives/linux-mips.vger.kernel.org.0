Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7267923D802
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 10:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgHFIcX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 04:32:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37830 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727768AbgHFIcW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 6 Aug 2020 04:32:22 -0400
Received: from [10.130.0.75] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9wNwCtfckAFAA--.925S3;
        Thu, 06 Aug 2020 16:32:15 +0800 (CST)
Subject: Re: [PATCH] MIPS: Introduce cmdline argument writecombine=
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
 <10e04885-b775-e7db-b927-6400382fd32d@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <cc0c8b89-748d-0d38-bcc8-1c2dbb0996bf@loongson.cn>
Date:   Thu, 6 Aug 2020 16:32:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <10e04885-b775-e7db-b927-6400382fd32d@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP9wNwCtfckAFAA--.925S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyDCrWkZFyrZFWxJrWrZrb_yoWrJrWUpF
        WDG3ZxGr4fKr1jyF9xArnFqrWYvrn3AF9xAr1UGr1UZas09r1kKFn2qrWagF4kZryxKa40
        yFW09FyUKw10y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IUYbjjPUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/06/2020 03:39 PM, Jiaxun Yang wrote:
>
>
> 在 2020/8/6 下午3:09, Tiezhu Yang 写道:
>> Loongson processors have a writecombine issue that maybe failed to
>> write back framebuffer used with ATI Radeon or AMD GPU at times,
>> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
>> mapping for MIPS"), there exists some errors such as blurred screen
>> and lockup, and so on.
>>
>> With this patch, disable writecombine by default for Loongson64 to
>> work well with ATI Radeon or AMD GPU, and it has no influence on the
>> other platforms due to writecombine is enabled by default.
>>
>> Additionally, if it is necessary, writecombine=on can be set manually
>> in the cmdline to enhance the performance for Loongson LS7A integrated
>> graphics in the future.
>>
>> [   60.958721] radeon 0000:03:00.0: ring 0 stalled for more than 
>> 10079msec
>> [   60.965315] radeon 0000:03:00.0: GPU lockup (current fence id 
>> 0x0000000000000112 last fence id 0x000000000000011d on ring 0)
>> [   60.976525] radeon 0000:03:00.0: ring 3 stalled for more than 
>> 10086msec
>> [   60.983156] radeon 0000:03:00.0: GPU lockup (current fence id 
>> 0x0000000000000374 last fence id 0x00000000000003a8 on ring 3)
> Hi Tiezhu,
>
> Thanks for your patch.
> Personally I didn't have any issue with writecombine on my test 
> systems, but there
> are some complains about unstable graphic card from users. So 
> generally a cmdline
> writecombine switch is necessary.
>
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/include/asm/pgtable.h |  4 ++++
>>   arch/mips/kernel/cpu-probe.c    | 19 +++++++++++++++++++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/pgtable.h 
>> b/arch/mips/include/asm/pgtable.h
>> index dd7a0f5..34869f7 100644
>> --- a/arch/mips/include/asm/pgtable.h
>> +++ b/arch/mips/include/asm/pgtable.h
>> @@ -473,6 +473,10 @@ static inline pgprot_t pgprot_noncached(pgprot_t 
>> _prot)
>>   static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>>   {
>>       unsigned long prot = pgprot_val(_prot);
>> +    extern bool mips_writecombine;
>> +
>> +    if (!mips_writecombine)
>> +        return pgprot_noncached(_prot);
>
> You can simply override c->writecombine to _CACHE_UNCACHED in 
> cpu-probe.c with
> out this kind of hijack.
>
>>         /* cpu_data[0].writecombine is already shifted by 
>> _CACHE_SHIFT */
>>       prot = (prot & ~_CACHE_MASK) | cpu_data[0].writecombine;
>> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>> index e2955f1..98777ca 100644
>> --- a/arch/mips/kernel/cpu-probe.c
>> +++ b/arch/mips/kernel/cpu-probe.c
>> @@ -459,6 +459,25 @@ static int __init ftlb_disable(char *s)
>>     __setup("noftlb", ftlb_disable);
>>   +#ifdef CONFIG_MACH_LOONGSON64
>> +bool mips_writecombine; /* initialise to false by default */
>> +#else
>> +bool mips_writecombine = true;
>> +#endif
>> +EXPORT_SYMBOL(mips_writecombine);
> There is no need to export this symbol, see comment before.
>> +
>> +static int __init writecombine_setup(char *str)
>> +{
>> +    if (strcmp(str, "on") == 0)
>> +        mips_writecombine = true;
>> +    else if (strcmp(str, "off") == 0)
>> +        mips_writecombine = false;
>> +
>> +    return 1;
>> +}
>> +
>> +__setup("writecombine=", writecombine_setup);
>
> Use early_param here seems more reasonable, it will be probed earlier.

Hi Jiaxun,

Thanks for your suggestion, it looks better.

I will modify and test it, then I will send v2 with another
document patch to explain this cmdline argument.

Thanks,
Tiezhu

>
>> +
>>   /*
>>    * Check if the CPU has per tc perf counters
>>    */
> Thanks
>
> - Jiaxun

