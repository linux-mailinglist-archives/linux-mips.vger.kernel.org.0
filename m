Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEFD29FDE5
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 07:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgJ3GhK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Oct 2020 02:37:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43170 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgJ3GhK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Oct 2020 02:37:10 -0400
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKtCQtJtflvACAA--.647S3;
        Fri, 30 Oct 2020 14:37:05 +0800 (CST)
Subject: Re: [PATCH 4/6] MIPS: Loongson64: Add Mail_Send support for 3A4000+
 CPU
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
 <1603958581-4723-5-git-send-email-yangtiezhu@loongson.cn>
 <8acd5e34-43c1-4571-fa29-5a145d4834bc@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>,
        Jianmin Lv <lvjianmin@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1e1595d5-e721-8ea7-441d-c5f73dbd5963@loongson.cn>
Date:   Fri, 30 Oct 2020 14:37:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8acd5e34-43c1-4571-fa29-5a145d4834bc@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKtCQtJtflvACAA--.647S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKr4kAw4fWF13Ww43ur1ftFb_yoWxAF47pF
        yqy3W3GFW0qas7urs8J3y5Xr18JryDGanFyF4IyF4jgas8CwnxWFyxG3ZrJrs7AFZxXF4f
        Zr1v9rWDK3ZrCa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfU1uc_DUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/30/2020 12:06 PM, Jiaxun Yang wrote:
>
>
> 在 2020/10/29 16:02, Tiezhu Yang 写道:
>> Loongson 3A4000+ CPU has per-core Mail_Send register to send mail,
>> there is no need to maintain register address of each core and node,
>> just simply specify cpu number.
>>
>> Signed-off-by: Lu Zeng <zenglu@loongson.cn>
>> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   .../include/asm/mach-loongson64/loongson_regs.h    | 10 +++
>>   arch/mips/loongson64/smp.c                         | 75 
>> +++++++++++++++++-----
>>   2 files changed, 68 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h 
>> b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
>> index 83dbb9f..1659935 100644
>> --- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
>> +++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
>> @@ -227,6 +227,16 @@ static inline void csr_writeq(u64 val, u32 reg)
>>   #define CSR_IPI_SEND_CPU_SHIFT    16
>>   #define CSR_IPI_SEND_BLOCK    BIT(31)
>>   +#define LOONGSON_CSR_MAIL_BUF0        0x1020
>> +#define LOONGSON_CSR_MAIL_SEND        0x1048
>> +#define CSR_MAIL_SEND_BLOCK        BIT_ULL(31)
>> +#define CSR_MAIL_SEND_BOX_LOW(box)    (box << 1)
>> +#define CSR_MAIL_SEND_BOX_HIGH(box)    ((box << 1) + 1)
>> +#define CSR_MAIL_SEND_BOX_SHIFT        2
>> +#define CSR_MAIL_SEND_CPU_SHIFT        16
>> +#define CSR_MAIL_SEND_BUF_SHIFT        32
>> +#define CSR_MAIL_SEND_H32_MASK        0xFFFFFFFF00000000ULL
>> +
>>   static inline u64 drdtime(void)
>>   {
>>       int rID = 0;
>> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
>> index 7d58853..33597d2 100644
>> --- a/arch/mips/loongson64/smp.c
>> +++ b/arch/mips/loongson64/smp.c
>> @@ -54,6 +54,26 @@ static uint32_t core0_c0count[NR_CPUS];
>>   u32 (*ipi_read_clear)(int cpu);
>>   void (*ipi_write_action)(int cpu, u32 action);
>>   +/* send mail via Mail_Send register for 3A4000+ CPU */
>> +static void csr_mail_send(uint64_t data, int cpu, int mailbox)
>> +{
>> +    uint64_t val;
>> +
>> +    /* send high 32 bits */
>> +    val = CSR_MAIL_SEND_BLOCK;
>> +    val |= (CSR_MAIL_SEND_BOX_HIGH(mailbox) << 
>> CSR_MAIL_SEND_BOX_SHIFT);
>> +    val |= (cpu << CSR_MAIL_SEND_CPU_SHIFT);
>> +    val |= (data & CSR_MAIL_SEND_H32_MASK);
>> +    csr_writeq(val, LOONGSON_CSR_MAIL_SEND);
>> +
>> +    /* send low 32 bits */
>> +    val = CSR_MAIL_SEND_BLOCK;
>> +    val |= (CSR_MAIL_SEND_BOX_LOW(mailbox) << CSR_MAIL_SEND_BOX_SHIFT);
>> +    val |= (cpu << CSR_MAIL_SEND_CPU_SHIFT);
>> +    val |= (data << CSR_MAIL_SEND_BUF_SHIFT);
>> +    csr_writeq(val, LOONGSON_CSR_MAIL_SEND);
>> +};
>> +
>>   static u32 csr_ipi_read_clear(int cpu)
>>   {
>>       u32 action;
>> @@ -348,7 +368,10 @@ static void loongson3_init_secondary(void)
>>       /* Set interrupt mask, but don't enable */
>>       change_c0_status(ST0_IM, imask);
>>   -    loongson3_ipi_write32(0xffffffff, 
>> ipi_en0_regs[cpu_logical_map(cpu)]);
>> +    if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & 
>> LOONGSON_CSRF_IPI)
>> +        csr_writel(0xffffffff, LOONGSON_CSR_IPI_EN);
>
> Hi Tiezhu,
>
> Feature cheking is duplicated. could you please abstract them to 
> callbacks and set
> them in csr_ipi probe?

Hi Jiaxun,

Thanks for your suggestion. I will do it and then send v2.

Thanks,
Tiezhu

>
> e.g.
> ipi_write_enable
>
>
>> +    else
>> +        loongson3_ipi_write32(0xffffffff, 
>> ipi_en0_regs[cpu_logical_map(cpu)]);
>>         per_cpu(cpu_state, cpu) = CPU_ONLINE;
>>       cpu_set_core(&cpu_data[cpu],
>> @@ -380,8 +403,12 @@ static void loongson3_smp_finish(void)
>>         write_c0_compare(read_c0_count() + mips_hpt_frequency/HZ);
>>       local_irq_enable();
>> -    loongson3_ipi_write64(0,
>> -            ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
>> +
>> +    if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & 
>> LOONGSON_CSRF_IPI)
>> +        csr_writel(0, LOONGSON_CSR_MAIL_BUF0);
>> +    else
>> +        loongson3_ipi_write64(0, 
>> ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
>> +
>
> ditto here,
> ipi_write_buf
>
>>       pr_info("CPU#%d finished, CP0_ST=%x\n",
>>               smp_processor_id(), read_c0_status());
>>   }
>> @@ -414,12 +441,18 @@ static void __init loongson3_smp_setup(void)
>>       }
>>         csr_ipi_probe();
>> -    ipi_set0_regs_init();
>> -    ipi_clear0_regs_init();
>> -    ipi_status0_regs_init();
>> -    ipi_en0_regs_init();
>> -    ipi_mailbox_buf_init();
>> -    loongson3_ipi_write32(0xffffffff, 
>> ipi_en0_regs[cpu_logical_map(0)]);
>> +
>> +    if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & 
>> LOONGSON_CSRF_IPI) {
>> +        csr_writel(0xffffffff, LOONGSON_CSR_IPI_EN);
>> +    } else {
>> +        ipi_set0_regs_init();
>> +        ipi_clear0_regs_init();
>> +        ipi_status0_regs_init();
>> +        ipi_en0_regs_init();
>> +        ipi_mailbox_buf_init();
>> +        loongson3_ipi_write32(0xffffffff, 
>> ipi_en0_regs[cpu_logical_map(0)]);
>> +    }
>> +
>>       cpu_set_core(&cpu_data[0],
>>                cpu_logical_map(0) % loongson_sysconf.cores_per_package);
>>       cpu_data[0].package = cpu_logical_map(0) / 
>> loongson_sysconf.cores_per_package;
>> @@ -452,14 +485,22 @@ static int loongson3_boot_secondary(int cpu, 
>> struct task_struct *idle)
>>       pr_debug("CPU#%d, func_pc=%lx, sp=%lx, gp=%lx\n",
>>               cpu, startargs[0], startargs[1], startargs[2]);
>>   -    loongson3_ipi_write64(startargs[3],
>> -            ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
>> -    loongson3_ipi_write64(startargs[2],
>> -            ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
>> -    loongson3_ipi_write64(startargs[1],
>> -            ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
>> -    loongson3_ipi_write64(startargs[0],
>> -            ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
>> +    if (cpu_has_csr() && csr_readl(LOONGSON_CSR_FEATURES) & 
>> LOONGSON_CSRF_IPI) {
>> +        csr_mail_send(startargs[3], cpu_logical_map(cpu), 3);
>> +        csr_mail_send(startargs[2], cpu_logical_map(cpu), 2);
>> +        csr_mail_send(startargs[1], cpu_logical_map(cpu), 1);
>> +        csr_mail_send(startargs[0], cpu_logical_map(cpu), 0);
> ditto
>
> Thanks.
>
> - Jiaxun
>
>> +    } else {
>> +        loongson3_ipi_write64(startargs[3],
>> +                ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x18);
>> +        loongson3_ipi_write64(startargs[2],
>> +                ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x10);
>> +        loongson3_ipi_write64(startargs[1],
>> +                ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x8);
>> +        loongson3_ipi_write64(startargs[0],
>> +                ipi_mailbox_buf[cpu_logical_map(cpu)] + 0x0);
>> +    }
>> +
>>       return 0;
>>   }

