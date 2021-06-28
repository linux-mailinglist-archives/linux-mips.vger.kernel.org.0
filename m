Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54CB43B56E1
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 03:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhF1Bru (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 21:47:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39042 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231678AbhF1Brr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 21:47:47 -0400
Received: from [10.130.0.191] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH0OaKdlgoWYZAA--.32349S3;
        Mon, 28 Jun 2021 09:45:08 +0800 (CST)
Subject: Re: [PATCH v2] MIPS: Loongson64: Add Loongson-2K1000 reset support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>
References: <20210627073806.32564-1-zhangqing@loongson.cn>
 <08a4ce65-91e0-122e-6f17-b66e08270350@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <120495f9-ad22-29a2-a7a5-b9dd933a41ad@loongson.cn>
Date:   Mon, 28 Jun 2021 09:44:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <08a4ce65-91e0-122e-6f17-b66e08270350@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH0OaKdlgoWYZAA--.32349S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFy5ur1xCF47KF18trW3trb_yoWrXrykpr
        9xAa1DKF4fZr1UuF1FqFyDCFWUZr98Jrs2kFW2q3WUC3sF934ftwn5GFyFkFn7ZrW7ua10
        vrW8WrWxCF4fu3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
        jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU8xMaUUUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/28/2021 09:12 AM, Jiaxun Yang wrote:
>
> 在 2021/6/27 下午3:38, Qing Zhang 写道:
>> Add power management register operations to support reboot and poweroff.
>>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>> ---
>>
>> v1-v2:
>> - Add pm block node
>>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>>
>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi 
>> b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> index 569e814def83..929e8ddf86eb 100644
>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> @@ -101,6 +101,14 @@ uart0: serial@1fe00000 {
>>               no-loopback-test;
>>           };
>>   +        pm: power-controller {
>> +            device_type = "power management";
>
> Hi Qing,
>
> Not compatible?
>
>
>> +            reg = <0 0x1fe0700c 0 0x8>,
>> +                <0 0x1fe07014 0 0x8>,
>> +                <0 0x1fe07030 0 0x8>;
>> +            reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
>> +        };
>> +
>>           pci@1a000000 {
>>               compatible = "loongson,ls2k-pci";
>>               device_type = "pci";
>> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
>> index c97bfdc8c922..ea125e925d44 100644
>> --- a/arch/mips/loongson64/reset.c
>> +++ b/arch/mips/loongson64/reset.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/init.h>
>>   #include <linux/kexec.h>
>> +#include <linux/of_address.h>
>>   #include <linux/pm.h>
>>   #include <linux/slab.h>
>>   @@ -20,12 +21,50 @@
>>   #include <loongson.h>
>>   #include <boot_param.h>
>>   +static char *pm_reg_name[] = {"pm1_sts", "pm1_cnt", "rst_cnt"};
>> +
>> +static void __iomem *get_reg_byname(struct device_node *node, const 
>> char *name)
>> +{
>> +    int index = of_property_match_string(node, "reg-names", name);
>> +
>> +    if (index < 0)
>> +        return NULL;
>> +
>> +    return of_iomap(node, index);
>> +}
>
> We do have that helper in of_address.h.
>
> Btw, I'd prefer make it as a driver in driver/platform/mips.
>
> Also the approach using PRID to tell protocol type doesn't really make 
> sense to me.
>
> You can override _machine_restart callback in diver once FDT node is 
> found.

Hi jiaxun,

Thanks for your suggestion,
I will send v3 in the soon.

Thanks.,

Qing
>
> Thanks.
>
> - Jiaxun
>
>> +
>> +static int  __init loongson_fdt_reset_init(void)
>> +{
>> +    struct device_node *np;
>> +    int i;
>> +
>> +    np = of_find_node_by_type(NULL, "power management");
>> +    if (!np) {
>> +        pr_info("Failed to get PM node\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    for (i = 0; i < sizeof(pm_reg_name)/sizeof(char *); i++) {
>> +        pm_reg_name[i] = get_reg_byname(np, pm_reg_name[i]);
>> +        if (!pm_reg_name[i])
>> +            iounmap(pm_reg_name[i]);
>> +    }
>> +
>> +    of_node_put(np);
>> +    return 0;
>> +}
>> +arch_initcall(loongson_fdt_reset_init);
>> +
>>   static void loongson_restart(char *command)
>>   {
>> +    if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
>> +        writel(0x1, (void *)pm_reg_name[2]);
>> +    } else {
>> +        void (*fw_restart)(void) = (void 
>> *)loongson_sysconf.restart_addr;
>>   -    void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
>> +        fw_restart();
>> +    }
>>   -    fw_restart();
>>       while (1) {
>>           if (cpu_wait)
>>               cpu_wait();
>> @@ -34,9 +73,18 @@ static void loongson_restart(char *command)
>>     static void loongson_poweroff(void)
>>   {
>> -    void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
>> +    if ((read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64R) {
>> +        /* Clear */
>> +        writel((readl((void *)pm_reg_name[0]) & 0xffffffff), (void 
>> *)pm_reg_name[0]);
>> +        /* Sleep Enable | Soft Off*/
>> +        writel(GENMASK(12, 10)|BIT(13), (void *)pm_reg_name[1]);
>> +    } else {
>> +
>> +        void (*fw_poweroff)(void) = (void 
>> *)loongson_sysconf.poweroff_addr;
>> +
>> +        fw_poweroff();
>> +    }
>>   -    fw_poweroff();
>>       while (1) {
>>           if (cpu_wait)
>>               cpu_wait();

