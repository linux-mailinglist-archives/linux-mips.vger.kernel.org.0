Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21E026898C
	for <lists+linux-mips@lfdr.de>; Mon, 14 Sep 2020 12:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgINKkd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Sep 2020 06:40:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45462 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726474AbgINKk2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Sep 2020 06:40:28 -0400
Received: from [10.130.0.187] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf8d3SF9f_i8VAA--.5680S3;
        Mon, 14 Sep 2020 18:39:52 +0800 (CST)
Subject: Re: [PATCH] MIPS: Remove unused BOOT_MEM_INIT_RAM
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1599875955-9207-1-git-send-email-tangyouling@loongson.cn>
 <f2349dc3-8086-64ee-e2d7-7a69afac6623@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <06109011-21af-ad1d-41cb-18542b9b77f6@loongson.cn>
Date:   Mon, 14 Sep 2020 18:39:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f2349dc3-8086-64ee-e2d7-7a69afac6623@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf8d3SF9f_i8VAA--.5680S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4ruF4rJw17XF1Utr48Crg_yoW8GryfpF
        4DA3WkGFWkWrW7ta40qwnxuF12y345tF1q9F42gFyvy3WDZFn7WF17Kry5ArykXFWkta12
        q3WfGa45Z39IqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
        6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU8XJ55UUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 09/14/2020 12:32 PM, Jiaxun Yang wrote:
>
>
> 在 2020/9/12 9:59, Youling Tang 写道:
>> Commit a94e4f24ec83 ("MIPS: init: Drop boot_mem_map") left
>> the BOOT_MEM_INIT_RAM unused, remove it.
>>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> ---
>>   arch/mips/include/asm/bootinfo.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/mips/include/asm/bootinfo.h 
>> b/arch/mips/include/asm/bootinfo.h
>> index 147c932..39196ae 100644
>> --- a/arch/mips/include/asm/bootinfo.h
>> +++ b/arch/mips/include/asm/bootinfo.h
>> @@ -91,7 +91,6 @@ extern unsigned long mips_machtype;
>>   #define BOOT_MEM_RAM        1
>>   #define BOOT_MEM_ROM_DATA    2
>>   #define BOOT_MEM_RESERVED    3
>> -#define BOOT_MEM_INIT_RAM    4
>
> If you're willing to remove that you'd better turn the memtype struct
> into a enum.
>
Hi  Jiaxun,
Do you mean to modify it as follows?

enum boot_memtype {
                 BOOT_MEM_RAM,
                 BOOT_MEM_ROM_DATA,
                 BOOT_MEM_RESERVED,
                 BOOT_MEM_NOMAP,
};

Thanks.

- Youling
> Btw: It seems you've done a lot of minor clean-up works recently,
> if you'd like to I think you can try to turn all the platforms into 
> memblock
> and remove all these gules between memblock and legacy code.
>
> Thanks.
>
> - Jiaxun
>
>>   #define BOOT_MEM_NOMAP        5
>>     extern void add_memory_region(phys_addr_t start, phys_addr_t 
>> size, long type);

