Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEA72DB956
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 03:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgLPCpL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 21:45:11 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54696 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725841AbgLPCpL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Dec 2020 21:45:11 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax2cmHdNlfQhABAA--.2970S3;
        Wed, 16 Dec 2020 10:44:24 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Give chance to build under !CONFIG_NUMA
 and !CONFIG_SMP
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1606998772-5904-1-git-send-email-yangtiezhu@loongson.cn>
 <20201215132123.GA9201@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3eb215e2-82ae-2834-2837-55f429027840@loongson.cn>
Date:   Wed, 16 Dec 2020 10:44:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201215132123.GA9201@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax2cmHdNlfQhABAA--.2970S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZrWDGF4UCw4UuFy3Cr1fCrg_yoW5Kw4Dpa
        nakwsxKr4kWrW5Ars3A34kWry5J3s5JrZxtFWxt34UWF9F9a48Arn5tF18ZF9rArWvq3W0
        gF93WF12kayIyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
        AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j
        6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
        UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/15/2020 09:21 PM, Thomas Bogendoerfer wrote:
> On Thu, Dec 03, 2020 at 08:32:52PM +0800, Tiezhu Yang wrote:
>> In the current code, we can not build under !CONFIG_NUMA and !CONFIG_SMP
>> on the Loongson64 platform, it seems bad for the users who just want to
>> use pure single core (not nosmp) to debug, so do the following things to
>> give them a chance:
>>
>> (1) Do not select NUMA and SMP for MACH_LOONGSON64 in Kconfig, make NUMA
>> depends on SMP, and then just set them in the loongson3_defconfig.
>> (2) Move szmem() from numa.c to init.c and add prom_init_memory() under
>> !CONFIG_NUMA.
>> (3) Clean up szmem() due to the statements of case SYSTEM_RAM_LOW and
>> SYSTEM_RAM_HIGH are the same.
>> (4) Remove the useless declaration of prom_init_memory() and add the
>> declaration of szmem() in loongson.h to avoid build error.
>>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/Kconfig                                |  3 +-
>>   arch/mips/configs/loongson3_defconfig            |  2 +
>>   arch/mips/include/asm/mach-loongson64/loongson.h |  2 +-
>>   arch/mips/loongson64/init.c                      | 49 ++++++++++++++++++++++
>>   arch/mips/loongson64/numa.c                      | 52 +-----------------------
>>   5 files changed, 54 insertions(+), 54 deletions(-)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 44a47ad..2034c66 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -490,8 +490,6 @@ config MACH_LOONGSON64
>>   	select SYS_SUPPORTS_ZBOOT
>>   	select SYS_SUPPORTS_RELOCATABLE
>>   	select ZONE_DMA32
>> -	select NUMA
>> -	select SMP
>>   	select COMMON_CLK
>>   	select USE_OF
>>   	select BUILTIN_DTB
>> @@ -2755,6 +2753,7 @@ config ARCH_SPARSEMEM_ENABLE
>>   config NUMA
>>   	bool "NUMA Support"
>>   	depends on SYS_SUPPORTS_NUMA
>> +	depends on SMP
> can you solve your problem without this hunk ? I don't want to make NUMA
> depeding on SMP. NUMA just selects memory archtitecture.

Hi Thomas,

I have tested the following three configs on the Loongson platform:
(1) !NUMA and !SMP,
(2) !NUMA and SMP,
(3) NUMA and SMP,
everything is all right.

But there exists the following build error under NUMA and !SMP:

   CC      arch/mips/kernel/asm-offsets.s
In file included from ./include/linux/gfp.h:9:0,
                  from ./include/linux/xarray.h:14,
                  from ./include/linux/radix-tree.h:19,
                  from ./include/linux/fs.h:15,
                  from ./include/linux/compat.h:17,
                  from arch/mips/kernel/asm-offsets.c:12:
./include/linux/topology.h: In function ‘numa_node_id’:
./include/linux/topology.h:119:2: error: implicit declaration of 
function ‘cpu_logical_map’ [-Werror=implicit-function-declaration]
   return cpu_to_node(raw_smp_processor_id());
   ^
cc1: some warnings being treated as errors
scripts/Makefile.build:117: recipe for target 
'arch/mips/kernel/asm-offsets.s' failed
make[1]: *** [arch/mips/kernel/asm-offsets.s] Error 1
arch/mips/Makefile:396: recipe for target 'archprepare' failed
make: *** [archprepare] Error 2

I find a patch to fix this kind of build errors [1], but it seems
meaningless.

According to the NUMA and SMP description in arch/mips/Kconfig,
we will use only one CPU of a multiprocessor machine if !SMP,
on single node systems leave NUMA disabled.

So I think there is no need to use NUMA if !SMP, and also we should
make NUMA depend on SMP to avoid build errors.

Thanks,
Tiezhu

[1] MIPS: Loongson: Fix complie errors without CONFIG_SMP
https://lore.kernel.org/patchwork/patch/1295704/

>
> Thomas.
>

