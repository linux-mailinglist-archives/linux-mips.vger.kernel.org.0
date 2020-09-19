Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E62C270BD8
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 10:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgISI3r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Sep 2020 04:29:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38778 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726041AbgISI3r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 19 Sep 2020 04:29:47 -0400
Received: from [10.130.0.187] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD91zwWVfAG0WAA--.6874S3;
        Sat, 19 Sep 2020 16:29:40 +0800 (CST)
Subject: Re: [PATCH] MIPS: kexec: Add crashkernel=YM handling
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1600480546-10448-1-git-send-email-tangyouling@loongson.cn>
 <3F79DD89-BE1E-456F-9297-273DDBB4E12A@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <e0154fb4-f2bd-5017-17ea-9827b95b8e68@loongson.cn>
Date:   Sat, 19 Sep 2020 16:29:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <3F79DD89-BE1E-456F-9297-273DDBB4E12A@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD91zwWVfAG0WAA--.6874S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWF47XrWDZr1DCr1rtrW8JFb_yoWrWr1xpr
        yUAa15GF4xGF9rGw4fArn3CryFyw1vvayUKrs5tryFkF909F1ktr4fWF17uryqvr1vgF1x
        ZFs2qFsF9w1FyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU0-djtUUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 09/19/2020 03:02 PM, Jiaxun Yang wrote:
>
> 于 2020年9月19日 GMT+08:00 上午9:55:46, Youling Tang <tangyouling@loongson.cn> 写到:
>> When the kernel crashkernel parameter is specified with just a size,
>> we are supposed to allocate a region from RAM to store the crashkernel.
>> However, MIPS merely reserves physical address zero with no checking
>> that there is even RAM there.
>>
>> Fix this by lifting similar code from x86, importing it to MIPS with the
>> MIPS specific parameters added. In the absence of any platform specific
>> information, we allocate the crashkernel region from the first 512MB of
>> physical memory (limited to CKSEG0 or KSEG0 address range).
>>
>> When X is not specified, crash_base defaults to 0 (crashkernel=YM@XM).
>>
>> E.g. without this patch:
>>
>> The environment as follows:
>> [    0.000000] MIPS: machine is loongson,loongson64c-4core-ls7a
>> ...
>> [    0.000000] Kernel command line: root=/dev/sda2 crashkernel=96M ...
>>
>> The warning as follows:
>> [    0.000000] Invalid memory region reserved for crash kernel
>>
>> And the iomem as follows:
>> 00200000-0effffff : System RAM
>>   00200000-00b47f87 : Kernel code
>>   00b47f88-00dfffff : Kernel data
>>   00e60000-01f73c7f : Kernel bss
>> 1a000000-1bffffff : pci@1a000000
>> ...
>>
>> With this patch:
>>
>> After increasing crash_base <= 0 handling.
>>
>> And the iomem as follows:
>> 00200000-0effffff : System RAM
>>   00200000-00b47f87 : Kernel code
>>   00b47f88-00dfffff : Kernel data
>>   00e60000-01f73c7f : Kernel bss
>>   04000000-09ffffff : Crash kernel
>> 1a000000-1bffffff : pci@1a000000
>> ...
>>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> ---
>> arch/mips/kernel/setup.c | 24 +++++++++++++++++++++---
>> 1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index bf5f5ac..59a88ea 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -477,6 +477,11 @@ early_param("elfcorehdr", early_parse_elfcorehdr);
>> #endif
>>
>> #ifdef CONFIG_KEXEC
>> +
>> +/* 64M alignment for crash kernel regions */
>> +#define CRASH_ALIGN	SZ_64M
>> +#define CRASH_ADDR_MAX	SZ_512M
> Hi Youling
>
> How do you determine the alignment requirement?
>
> Can we relax it?
>
> Thanks.
>
> - Jiaxun
Hi Jiaxun

Only when XM is not specified, 64M alignment is specified.

After the capture kernel is configured with CRASH_DUMP, PHYSICAL_START
defaults to 0x0xffffffff84000000 (64M). The kexec -p operation will
succeed only when the reserved Crash kernel start address is consistent
with PHYSICAL_START.

The description of PHYSICAL_START in arch/mips/Kconfig:2996 is as follows:
This gives the CKSEG0 or KSEG0 address where the kernel is loaded.If you
plan to use kernel for capturing the crash dump change this value to start
of the reserved region (the "X" value as specified in the 
"crashkernel=YM@XM"
command line boot parameter passed to the panic-ed kernel).

Thanks,

- Youling
>> +
>> static void __init mips_parse_crashkernel(void)
>> {
>> 	unsigned long long total_mem;
>> @@ -489,9 +494,22 @@ static void __init mips_parse_crashkernel(void)
>> 	if (ret != 0 || crash_size <= 0)
>> 		return;
>>
>> -	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 1)) {
>> -		pr_warn("Invalid memory region reserved for crash kernel\n");
>> -		return;
>> +	if (crash_base <= 0) {
>> +		crash_base = memblock_find_in_range(CRASH_ALIGN, CRASH_ADDR_MAX,
>> +							crash_size, CRASH_ALIGN);
>> +		if (!crash_base) {
>> +			pr_warn("crashkernel reservation failed - No suitable area found.\n");
>> +			return;
>> +		}
>> +	} else {
>> +		unsigned long long start;
>> +
>> +		start = memblock_find_in_range(crash_base, crash_base + crash_size,
>> +						crash_size, 1);
>> +		if (start != crash_base) {
>> +			pr_warn("Invalid memory region reserved for crash kernel\n");
>> +			return;
>> +		}
>> 	}
>>
>> 	crashk_res.start = crash_base;

