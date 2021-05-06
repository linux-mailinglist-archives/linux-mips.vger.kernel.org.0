Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179C8374D96
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 04:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhEFCgI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 22:36:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34472 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231370AbhEFCgH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 May 2021 22:36:07 -0400
Received: from [10.130.0.193] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_+7RVZNgZ44SAA--.12183S3;
        Thu, 06 May 2021 10:34:57 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Fix build error 'secondary_kexec_args'
 undeclared under !SMP
To:     Randy Dunlap <rdunlap@infradead.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
 <1e8a74a8-3139-c77a-3eab-4ae0ff42ee0b@infradead.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <50cc491b-2264-7fbc-854b-df98ca20f062@loongson.cn>
Date:   Thu, 6 May 2021 10:34:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1e8a74a8-3139-c77a-3eab-4ae0ff42ee0b@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_+7RVZNgZ44SAA--.12183S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4rZF1kZF1ftFWDAw47urg_yoW8ur1rpF
        4rG3W5KFWrXr42yrWfZry5Z34ru39xJr47XFn7C3s8K34DJrWUXryIgF4UXF97Zr45KFW8
        ZF4Sqr1DCFnrC37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7IU5sTmPUUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,Randy

On 05/06/2021 10:19 AM, Randy Dunlap wrote:
> On 5/5/21 7:02 PM, Youling Tang wrote:
>> On the Loongson64 platform, if CONFIG_SMP is not set, the following build
>> error will occur:
>> arch/mips/loongson64/reset.c:133:2: error:'secondary_kexec_args' undeclared
>>
>> Because the definition and declaration of secondary_kexec_args are in the
>> CONFIG_SMP, the secondary_kexec_args variable should be used in CONFIG_SMP.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> ---
>>   arch/mips/loongson64/reset.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
>> index c97bfdc..758d5d2 100644
>> --- a/arch/mips/loongson64/reset.c
>> +++ b/arch/mips/loongson64/reset.c
>> @@ -126,11 +126,12 @@ static void loongson_kexec_shutdown(void)
>>   	for_each_possible_cpu(cpu)
>>   		if (!cpu_online(cpu))
>>   			cpu_device_up(get_cpu_device(cpu));
>> +
>> +	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>>   #endif
>>   	kexec_args[0] = kexec_argc;
>>   	kexec_args[1] = fw_arg1;
>>   	kexec_args[2] = fw_arg2;
>> -	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>>   	memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
>>   	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>>   }
>> @@ -141,7 +142,9 @@ static void loongson_crash_shutdown(struct pt_regs *regs)
>>   	kexec_args[0] = kdump_argc;
>>   	kexec_args[1] = fw_arg1;
>>   	kexec_args[2] = fw_arg2;
>> +#ifdef CONFIG_SMP
>>   	secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>> +#endif
>>   	memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
>>   	memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>>   }
>>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>
> Yep, slightly better than my version:
> https://lore.kernel.org/lkml/20210430205055.13594-1-rdunlap@infradead.org/
Sorry, I didn’t see the patch you sent at that time.

Thanks,
Youling.

