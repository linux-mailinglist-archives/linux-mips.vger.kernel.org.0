Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0403530EB53
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 04:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbhBDD6r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 22:58:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54592 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232069AbhBDD63 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 22:58:29 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSdS4cBtgHTQDAA--.3936S3;
        Thu, 04 Feb 2021 11:57:44 +0800 (CST)
Subject: Re: [PATCH] MIPS: Use common way to parse elfcorehdr
To:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1612408033-5446-1-git-send-email-hejinyang@loongson.cn>
 <57e74a56-abc1-dbc0-1277-5effb0e4e4c6@infradead.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <eff38b91-edd9-6f03-fd47-17932025f2ff@loongson.cn>
Date:   Thu, 4 Feb 2021 11:57:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <57e74a56-abc1-dbc0-1277-5effb0e4e4c6@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxSdS4cBtgHTQDAA--.3936S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXry7Wr48Wr1xJF1DGF4rZrb_yoW5uw17pr
        18Aa1jyrykCr97KrWFvrn8CF95J3W0qFy2gFW2k3WkJwnxAw13Xry09F1I9r909rZ2g3W0
        vFZY9w4rua9xtrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU5_xhJUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/04/2021 11:28 AM, Randy Dunlap wrote:

> On 2/3/21 7:07 PM, Jinyang He wrote:
>> "elfcorehdr" can be parsed at kernel/crash_dump.c
>>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> Hm, looks like that would require CONFIG_CRASH_DUMP?
Hi,

I don't think so. We expect to generate a /proc/vmcore when we reserved
memory for elfcorehdr. So put it under CONFIG_PROC_VMCORE. If only rely
on CONFIG_CRASH_DUMP and CONFIG_PROC_VMCORE is not enabled, we will
reserve these memory while cannot use these later. And the reason why
kernel/crash_dump.c being under CONFIG_CRASH_DUMP is that it provide
is_kdump_kernel() for others.

Thanks,
Jinyang

>
>> ---
>>   arch/mips/kernel/setup.c | 49 +++++++++++++++++++++---------------------------
>>   1 file changed, 21 insertions(+), 28 deletions(-)
>>
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index 7e1f8e2..4d2f915 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/of_fdt.h>
>>   #include <linux/of_reserved_mem.h>
>>   #include <linux/dmi.h>
>> +#include <linux/crash_dump.h>
>>   
>>   #include <asm/addrspace.h>
>>   #include <asm/bootinfo.h>
>> @@ -404,34 +405,32 @@ static int __init early_parse_memmap(char *p)
>>   }
>>   early_param("memmap", early_parse_memmap);
>>   
>> -#ifdef CONFIG_PROC_VMCORE
>> -static unsigned long setup_elfcorehdr, setup_elfcorehdr_size;
>> -static int __init early_parse_elfcorehdr(char *p)
>> +static void __init mips_reserve_vmcore(void)
>>   {
>> +#ifdef CONFIG_PROC_VMCORE
>>   	phys_addr_t start, end;
>>   	u64 i;
>>   
>> -	setup_elfcorehdr = memparse(p, &p);
>> -
>> -	for_each_mem_range(i, &start, &end) {
>> -		if (setup_elfcorehdr >= start && setup_elfcorehdr < end) {
>> -			/*
>> -			 * Reserve from the elf core header to the end of
>> -			 * the memory segment, that should all be kdump
>> -			 * reserved memory.
>> -			 */
>> -			setup_elfcorehdr_size = end - setup_elfcorehdr;
>> -			break;
>> +	if (!elfcorehdr_size) {
>> +		for_each_mem_range(i, &start, &end) {
>> +			if (elfcorehdr_addr >= start && elfcorehdr_addr < end) {
>> +				/*
>> +				 * Reserve from the elf core header to the end of
>> +				 * the memory segment, that should all be kdump
>> +				 * reserved memory.
>> +				 */
>> +				elfcorehdr_size = end - elfcorehdr_addr;
>> +				break;
>> +			}
>>   		}
>>   	}
>> -	/*
>> -	 * If we don't find it in the memory map, then we shouldn't
>> -	 * have to worry about it, as the new kernel won't use it.
>> -	 */
>> -	return 0;
>> -}
>> -early_param("elfcorehdr", early_parse_elfcorehdr);
>> +
>> +	pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
>> +		(unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
>> +
>> +	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
>>   #endif
>> +}
>>   
>>   #ifdef CONFIG_KEXEC
>>   
>> @@ -653,13 +652,7 @@ static void __init arch_mem_init(char **cmdline_p)
>>   	 */
>>   	memblock_set_current_limit(PFN_PHYS(max_low_pfn));
>>   
>> -#ifdef CONFIG_PROC_VMCORE
>> -	if (setup_elfcorehdr && setup_elfcorehdr_size) {
>> -		printk(KERN_INFO "kdump reserved memory at %lx-%lx\n",
>> -		       setup_elfcorehdr, setup_elfcorehdr_size);
>> -		memblock_reserve(setup_elfcorehdr, setup_elfcorehdr_size);
>> -	}
>> -#endif
>> +	mips_reserve_vmcore();
>>   
>>   	mips_parse_crashkernel();
>>   #ifdef CONFIG_KEXEC
>>
>

