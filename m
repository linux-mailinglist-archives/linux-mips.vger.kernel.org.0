Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE97190DCE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 13:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbgCXMjC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 08:39:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39064 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727443AbgCXMjC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 08:39:02 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2hW_3leCH8fAA--.1S3;
        Tue, 24 Mar 2020 20:38:48 +0800 (CST)
Subject: Re: [PATCH v2 1/3] MIPS: Loongson: Get host bridge information
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
 <1584932355-3642-2-git-send-email-yangtiezhu@loongson.cn>
 <C251FD7C-87F0-454E-83D7-5198A6E060E2@flygoat.com>
 <c8702862-f9a7-4776-68b9-cc17dba5d6f6@loongson.cn>
 <BF29AC74-29B6-44F3-9B5A-037FB4FE1778@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1c5b830e-ac2d-f35b-ec7f-1a4eb20a9984@loongson.cn>
Date:   Tue, 24 Mar 2020 20:38:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <BF29AC74-29B6-44F3-9B5A-037FB4FE1778@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr2hW_3leCH8fAA--.1S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1fWr43KrWrtw47Aw18Krg_yoWrXw4kp3
        y7Aa1UGr48Wr17CrsIv3y5Xr9ayFZ8tFZ3WF47t3Wjgryqv3W3Xr4DGF1UCr4xZF1rGa40
        qFyvgr4xWF13G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5sjjDU
        UUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/24/2020 06:02 PM, Jiaxun Yang wrote:
>
> 于 2020年3月24日 GMT+08:00 下午5:58:33, Tiezhu Yang <yangtiezhu@loongson.cn> 写到:
>> On 03/24/2020 03:36 PM, Jiaxun Yang wrote:
>>> 于 2020年3月23日 GMT+08:00 上午10:59:13, Tiezhu Yang
>> <yangtiezhu@loongson.cn> 写到:
>>>> Read the address of HyperTransport Configuration Space to get the
>>>> vendor ID
>>>> and device ID of bridge chip, and then we can distinguish various
>> types
>>>> of
>>>> bridge chip such as Loongson 7A1000 or AMD RS780E.
>>>>
>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>>> ---
>>>> arch/mips/include/asm/mach-loongson64/boot_param.h |  6 ++++++
>>>> arch/mips/loongson64/env.c                         | 16
>>>> ++++++++++++++++
>>>> 2 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h
>>>> b/arch/mips/include/asm/mach-loongson64/boot_param.h
>>>> index 8c286be..5e8c70d 100644
>>>> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
>>>> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
>>>> @@ -190,6 +190,11 @@ struct boot_params {
>>>> 	struct efi_reset_system_t reset_system;
>>>> };
>>>>
>>>> +enum loongson_bridge_type {
>>>> +	RS780E = 1,
>>>> +	LS7A1000 = 2
>>>> +};
>>>> +
>>>> struct loongson_system_configuration {
>>>> 	u32 nr_cpus;
>>>> 	u32 nr_nodes;
>>>> @@ -198,6 +203,7 @@ struct loongson_system_configuration {
>>>> 	u16 boot_cpu_id;
>>>> 	u16 reserved_cpus_mask;
>>>> 	enum loongson_cpu_type cputype;
>>>> +	enum loongson_bridge_type bridgetype;
>>>> 	u64 ht_control_base;
>>>> 	u64 pci_mem_start_addr;
>>>> 	u64 pci_mem_end_addr;
>>>> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
>>>> index 0daeb7b..42542c7 100644
>>>> --- a/arch/mips/loongson64/env.c
>>>> +++ b/arch/mips/loongson64/env.c
>>>> @@ -19,6 +19,8 @@
>>>> #include <boot_param.h>
>>>> #include <workarounds.h>
>>>>
>>>> +#define HT1_LO_BUS_CONFIG_BASE	0x90000efdfe000000
>>>> +
>>>> u32 cpu_clock_freq;
>>>> EXPORT_SYMBOL(cpu_clock_freq);
>>>> struct efi_memory_map_loongson *loongson_memmap;
>>>> @@ -42,6 +44,8 @@ void __init prom_init_env(void)
>>>> 	struct system_loongson *esys;
>>>> 	struct efi_cpuinfo_loongson *ecpu;
>>>> 	struct irq_source_routing_table *eirq_source;
>>>> +	u32 id;
>>>> +	u16 vendor, device;
>>>>
>>>> 	/* firmware arguments are initialized in head.S */
>>>> 	boot_p = (struct boot_params *)fw_arg2;
>>>> @@ -155,4 +159,16 @@ void __init prom_init_env(void)
>>>> 		memcpy(loongson_sysconf.sensors, esys->sensors,
>>>> 			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
>>>> 	pr_info("CpuClock = %u\n", cpu_clock_freq);
>>>> +
>>>> +	id = readl((u32 *)HT1_LO_BUS_CONFIG_BASE);
>>> Is that pointer cast required?
>> Yes, otherwise it will compile failed:
>> arch/mips/loongson64/env.c:163:13: error: passing argument 1 of ‘readl’
> I don't like it through....
> Can we cast it in macro?
> At least it should be void __iomem *.

OK, I will modify the code to make it easy to read.

>
>
>> makes pointer from integer without a cast [-Werror]
>>    id = readl(HT1_LO_BUS_CONFIG_BASE);
>>               ^
>>> And you'd better add a comment here like
>>> /* Read HT PCI 00:00:00 Host Bridge's ID to detect bridge model */
>>> Otherwise it's hard for others to understand what you are doing.
>> OK, I will do it.
>>
>>>> +	vendor = id & 0xffff;
>>>> +	device = (id >> 16) & 0xffff;
>>>> +
>>>> +	if (vendor == 0x0014 && device == 0x7a00) {
>>> Please confirm with hardware design guys that bridge chip in future
>> will have different dev ID.
>>
>> Yes, it maybe have a new device ID for the new bridge chip.
>>
>>> Thanks.
>>>
>>>> +		pr_info("The bridge chip is Loongson 7A1000\n");
>>>> +		loongson_sysconf.bridgetype = LS7A1000;
>>>> +	} else {
>>>> +		pr_info("The bridge chip is AMD RS780E or SR5690\n");
>>>> +		loongson_sysconf.bridgetype = RS780E;
>>>> +	}
>>>> }

