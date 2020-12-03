Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5BF2CD303
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 10:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387531AbgLCJ42 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 04:56:28 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47858 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387616AbgLCJ41 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Dec 2020 04:56:27 -0500
Received: from [10.130.0.58] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9MdtshfGl8ZAA--.56052S3;
        Thu, 03 Dec 2020 17:55:42 +0800 (CST)
Subject: Re: [PATCH 2/2] MIPS: Add fix_range_node after parse "mem=" parameter
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1606985867-9791-1-git-send-email-hejinyang@loongson.cn>
 <1606985867-9791-3-git-send-email-hejinyang@loongson.cn>
 <A9C59E61-FBF7-4AED-AF87-DB3AAB913871@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <485bbccb-4a18-16fb-b3ac-9f796d7cb4fd@loongson.cn>
Date:   Thu, 3 Dec 2020 17:55:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <A9C59E61-FBF7-4AED-AF87-DB3AAB913871@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn9MdtshfGl8ZAA--.56052S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZrW5Zr17AFW3GF4DtFWrZrb_yoW5trWUpr
        ZrCFn5GF4kWr97Za4ft348uryrAws5KFWfua17CF15Xas0qr9rAr1SgF15u34jvrW8K3WF
        vF10g3srua12yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU0nXo5UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 12/03/2020 05:27 PM, Jiaxun Yang wrote:
>
> 于 2020年12月3日 GMT+08:00 下午4:57:47, Jinyang He <hejinyang@loongson.cn> 写到:
>> This problem may only occur on NUMA platforms. When machine start
>> with the "mem=" parameter on Loongson64, it cannot boot. When parsing the
>> "mem=" parameter, first all the RAM was removed, and then the memory was
>> not added by memblock_add_node(), which caused the newly added memory to
>> be on MAX_NUMNODES. The key to solve this problem is to fix these memory
>> nodes through memblock_set_node() before bootmem_init() or earlier. So
>> it would be better to fix it before check_kernel_sections_mem().
>> The check_kernel_sections_mem() will check whether the current RAM can be
>> used by the kernel. If this fix is added after that, it will do a redundant
>> memblock_add operation. Adding the fixup_region_node() function can also
>> provide a reference for future platforms using NUMA when encountering
>> such problems.
> Hi Jingyang,
>
> Is it possible to do it when parsing cmdline to avoid this kind of fixup?
>
> Thanks.
>
> - Jiaxun

Hi, Jiaxun,

Of course. But "memmap=" could cause same problem , "mem=" could
parse many times. So it better to fix it after these parse opertion 
having done.

Thanks,
Jinyang.

>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>> arch/mips/include/asm/bootinfo.h |  1 +
>> arch/mips/kernel/setup.c         |  6 +++++-
>> arch/mips/loongson64/numa.c      | 11 +++++++++++
>> 3 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
>> index aa03b12..ddc17b1 100644
>> --- a/arch/mips/include/asm/bootinfo.h
>> +++ b/arch/mips/include/asm/bootinfo.h
>> @@ -91,6 +91,7 @@ const char *get_system_type(void);
>> extern unsigned long mips_machtype;
>>
>> extern void detect_memory_region(phys_addr_t start, phys_addr_t sz_min,  phys_addr_t sz_max);
>> +extern void fixup_region_node(void);
>>
>> extern void prom_init(void);
>> extern void prom_free_prom_memory(void);
>> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
>> index b3a711e..fe93882 100644
>> --- a/arch/mips/kernel/setup.c
>> +++ b/arch/mips/kernel/setup.c
>> @@ -110,6 +110,8 @@ void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_add
>> 	memblock_add(start, size);
>> }
>>
>> +void __weak fixup_region_node(void) {}
>> +
>> /*
>>   * Manage initrd
>>   */
>> @@ -631,8 +633,10 @@ static void __init arch_mem_init(char **cmdline_p)
>>
>> 	parse_early_param();
>>
>> -	if (usermem)
>> +	if (usermem) {
>> 		pr_info("User-defined physical RAM map overwrite\n");
>> +		fixup_region_node();
>> +	}
>>
>> 	check_kernel_sections_mem();
>>
>> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
>> index c6f0c48..d8661cc 100644
>> --- a/arch/mips/loongson64/numa.c
>> +++ b/arch/mips/loongson64/numa.c
>> @@ -220,6 +220,17 @@ void __init mem_init(void)
>> 	mem_init_print_info(NULL);
>> }
>>
>> +void __init fixup_region_node(void)
>> +{
>> +	phys_addr_t start, end;
>> +	u64 i;
>> +
>> +	for_each_mem_range(i, &start, &end) {
>> +		memblock_set_node(start, end - start,
>> +				  &memblock.memory, pa_to_nid(start));
>> +	}
>> +}
>> +
>> /* All PCI device belongs to logical Node-0 */
>> int pcibus_to_node(struct pci_bus *bus)
>> {

