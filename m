Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069BC1D6E6D
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 03:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgERBIV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 21:08:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42568 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726665AbgERBIV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 21:08:21 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2v+38FeaOA1AA--.34S3;
        Mon, 18 May 2020 09:08:15 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson: Add support for serial console
To:     WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1589612588-29196-1-git-send-email-yangtiezhu@loongson.cn>
 <5aadf1a7-51c7-453e-beaa-3df6ceca5354@xen0n.name>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d5fde4bc-69a9-c9c0-70de-106968ecc7c4@loongson.cn>
Date:   Mon, 18 May 2020 09:08:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5aadf1a7-51c7-453e-beaa-3df6ceca5354@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr2v+38FeaOA1AA--.34S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1UZF1kCw1rXr43Aw47Jwb_yoW5Gr43pF
        4rJa1UKrWktFnYq397CrWkZrWFyrZxJFyDGF47Jr15ua98K34Fvw1xK34jv3y7WF95ta10
        vFykKF9IkF47C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/16/2020 07:09 PM, WANG Xuerui wrote:
> On 5/16/20 3:03 PM, Tiezhu Yang wrote:
>
>> After commit 87fcfa7b7fe6 ("MIPS: Loongson64: Add generic dts"),
>> there already exists the node and property of Loongson CPU UART0
>> in loongson3-package.dtsi:
>>
>> cpu_uart0: serial@1fe001e0 {
>>          compatible = "ns16550a";
>>          reg = <0 0x1fe001e0 0x8>;
>>          clock-frequency = <33000000>;
>>          interrupt-parent = <&liointc>;
>>          interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
>>          no-loopback-test;
>> };
>>
>> In order to support for serial console on the Loongson platform,
>> add CONFIG_SERIAL_OF_PLATFORM=y to loongson3_defconfig.
>>
>> With this patch, we can see the following boot message:
>>
>> [    1.877745] printk: console [ttyS0] disabled
>> [    1.881979] 1fe001e0.serial: ttyS0 at MMIO 0x1fe001e0 (irq = 16, 
>> base_baud = 2062500) is a 16550A
>> [    1.890838] printk: console [ttyS0] enabled
>>
>> And also, we can login normally from the serial console.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
>> Hi Jiaxun,
>>
>> Thank you very much for your suggestion.
>>
>>   arch/mips/configs/loongson3_defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/mips/configs/loongson3_defconfig 
>> b/arch/mips/configs/loongson3_defconfig
>> index 6768c16..cd95f08 100644
>> --- a/arch/mips/configs/loongson3_defconfig
>> +++ b/arch/mips/configs/loongson3_defconfig
>> @@ -217,6 +217,7 @@ CONFIG_SERIAL_8250_EXTENDED=y
>>   CONFIG_SERIAL_8250_MANY_PORTS=y
>>   CONFIG_SERIAL_8250_SHARE_IRQ=y
>>   CONFIG_SERIAL_8250_RSA=y
>> +CONFIG_SERIAL_OF_PLATFORM=y
>>   CONFIG_HW_RANDOM=y
>>   CONFIG_RAW_DRIVER=m
>>   CONFIG_I2C_CHARDEV=y
>
> Hi,
>
> The patch title is again exaggerating things. This is a defconfig 
> change, so please refer to `git log` output of `arch/mips/configs` and 
> use something like "MIPS: Loongson: loongson3_defconfig: enable serial 
> console" or "MIPS: Loongson: enable serial console in defconfig". The 
> current title reads as if Loongson kernels never were able to use a 
> serial console in the past.

Hi Xuerui,

Thanks for your suggestion.

We can not use the serial console without this patch,
so I use the current patch subject.

Anyway, let me modify the patch subject to make it more accurate,
I think the following is better:
"MIPS: Loongson: Enable devicetree based probing for 8250 ports"

drivers/tty/serial/8250/Kconfig:
config SERIAL_OF_PLATFORM
         tristate "Devicetree based probing for 8250 ports"

I will send v2 later.

Thanks,
Tiezhu Yang

