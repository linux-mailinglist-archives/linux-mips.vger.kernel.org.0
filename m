Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4492DA708
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 05:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgLOELb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Dec 2020 23:11:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45956 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725843AbgLOELb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Dec 2020 23:11:31 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGco4N9hfrH8AAA--.1271S3;
        Tue, 15 Dec 2020 12:10:32 +0800 (CST)
Subject: Re: [PATCH] MIPS: No need to check CPU 0 in
 {loongson3,bmips,octeon}_cpu_disable()
To:     "liwei (GF)" <liwei391@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Florian Fainelli <f.fainelli@gmail.com>
References: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
 <0aafd8a7-a9ec-524e-7279-d40dbf246375@huawei.com>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <30ca12e6-5725-c289-06b1-a62bdee8dbb7@loongson.cn>
Date:   Tue, 15 Dec 2020 12:10:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <0aafd8a7-a9ec-524e-7279-d40dbf246375@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxGco4N9hfrH8AAA--.1271S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWDuFWxGFykXr4rGw4kWFg_yoW5XF4xpw
        40k3WDtr4IqFyUAF9Y9r1rXrWjqrn8Jr4I9w1jkFWUZ3Z8Wr1vqFn3tr1rXryxur409a4F
        gFyruFWkua1IkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfUe89NUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/15/2020 11:26 AM, liwei (GF) wrote:
> Hi,
>
> On 2020/11/25 18:11, Tiezhu Yang wrote:
>> After commit 9cce844abf07 ("MIPS: CPU#0 is not hotpluggable"),
> Why CPU#0 is not hotpluggable on MIPS? Does that unrealizable?

The early discussion is here:
https://patchwork.kernel.org/project/linux-mips/patch/1594896024-16624-1-git-send-email-chenhc@lemote.com/

As Jiaxun said, it seems that this is a software limitation.
I think the initial aim of commit 9cce844abf07 ("MIPS: CPU#0 is not 
hotpluggable")
is to solve ltp test failure.

>
>> c->hotpluggable is 0 for CPU 0 and it will not generate a control
>> file in sysfs for this CPU:
>>
>> [root@linux loongson]# cat /sys/devices/system/cpu/cpu0/online
>> cat: /sys/devices/system/cpu/cpu0/online: No such file or directory
>> [root@linux loongson]# echo 0 > /sys/devices/system/cpu/cpu0/online
>> bash: /sys/devices/system/cpu/cpu0/online: Permission denied
>>
>> So no need to check CPU 0 in {loongson3,bmips,octeon}_cpu_disable(),
> missing cps_cpu_disable()?

Yes, thank you, let me send a patch to do it.

Thanks,
Tiezhu

>
> Thanks,
> Wei
>
>> just remove them.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/cavium-octeon/smp.c | 3 ---
>>   arch/mips/kernel/smp-bmips.c  | 3 ---
>>   arch/mips/loongson64/smp.c    | 3 ---
>>   3 files changed, 9 deletions(-)
>>
>> diff --git a/arch/mips/cavium-octeon/smp.c b/arch/mips/cavium-octeon/smp.c
>> index 076db9a..66ce552 100644
>> --- a/arch/mips/cavium-octeon/smp.c
>> +++ b/arch/mips/cavium-octeon/smp.c
>> @@ -290,9 +290,6 @@ static int octeon_cpu_disable(void)
>>   {
>>   	unsigned int cpu = smp_processor_id();
>>   
>> -	if (cpu == 0)
>> -		return -EBUSY;
>> -
>>   	if (!octeon_bootloader_entry_addr)
>>   		return -ENOTSUPP;
>>   
>> diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
>> index 1dbfb5a..359b176 100644
>> --- a/arch/mips/kernel/smp-bmips.c
>> +++ b/arch/mips/kernel/smp-bmips.c
>> @@ -362,9 +362,6 @@ static int bmips_cpu_disable(void)
>>   {
>>   	unsigned int cpu = smp_processor_id();
>>   
>> -	if (cpu == 0)
>> -		return -EBUSY;
>> -
>>   	pr_info("SMP: CPU%d is offline\n", cpu);
>>   
>>   	set_cpu_online(cpu, false);
>> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
>> index aa0cd72..b8c1fc3 100644
>> --- a/arch/mips/loongson64/smp.c
>> +++ b/arch/mips/loongson64/smp.c
>> @@ -544,9 +544,6 @@ static int loongson3_cpu_disable(void)
>>   	unsigned long flags;
>>   	unsigned int cpu = smp_processor_id();
>>   
>> -	if (cpu == 0)
>> -		return -EBUSY;
>> -
>>   	set_cpu_online(cpu, false);
>>   	calculate_cpu_foreign_map();
>>   	local_irq_save(flags);
>>

