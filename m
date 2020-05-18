Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91ED1D6F05
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 04:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgERCg7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 May 2020 22:36:59 -0400
Received: from [115.28.160.31] ([115.28.160.31]:47348 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726675AbgERCg6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 May 2020 22:36:58 -0400
Received: from hanazono.local (unknown [116.236.177.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 84462600B4;
        Mon, 18 May 2020 10:36:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1589769415; bh=454XuQiZGJz74cqtV7Y1qbVoNSIrGmbj8yrfjhw0qtA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=r3dnNW0elBCA4uWOORwzxVfGu+MZYQZY5rf9WnjOjHMW4w1ENP0tmK2bxFzTxCRQF
         buFI2C018iaYYJtrMtnOZhcE/N9aAjs/MHQGNu9umix9eCXGTfLUj7JjhV+ZYvPQ1L
         AIIpkezGmUSwdws1Ks2PmJ0jy3WxMR2ieZIiU+Es=
Subject: Re: [PATCH] MIPS: Loongson: Add support for serial console
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1589612588-29196-1-git-send-email-yangtiezhu@loongson.cn>
 <5aadf1a7-51c7-453e-beaa-3df6ceca5354@xen0n.name>
 <d5fde4bc-69a9-c9c0-70de-106968ecc7c4@loongson.cn>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <b9317e89-24e6-8ed1-96c2-12f82b8a7049@xen0n.name>
Date:   Mon, 18 May 2020 10:36:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <d5fde4bc-69a9-c9c0-70de-106968ecc7c4@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/5/18 09:08, Tiezhu Yang wrote:

> On 05/16/2020 07:09 PM, WANG Xuerui wrote:
>> On 5/16/20 3:03 PM, Tiezhu Yang wrote:
>>
>>> After commit 87fcfa7b7fe6 ("MIPS: Loongson64: Add generic dts"),
>>> there already exists the node and property of Loongson CPU UART0
>>> in loongson3-package.dtsi:
>>>
>>> cpu_uart0: serial@1fe001e0 {
>>>          compatible = "ns16550a";
>>>          reg = <0 0x1fe001e0 0x8>;
>>>          clock-frequency = <33000000>;
>>>          interrupt-parent = <&liointc>;
>>>          interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
>>>          no-loopback-test;
>>> };
>>>
>>> In order to support for serial console on the Loongson platform,
>>> add CONFIG_SERIAL_OF_PLATFORM=y to loongson3_defconfig.
>>>
>>> With this patch, we can see the following boot message:
>>>
>>> [    1.877745] printk: console [ttyS0] disabled
>>> [    1.881979] 1fe001e0.serial: ttyS0 at MMIO 0x1fe001e0 (irq = 16, 
>>> base_baud = 2062500) is a 16550A
>>> [    1.890838] printk: console [ttyS0] enabled
>>>
>>> And also, we can login normally from the serial console.
>>>
>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> ---
>>>
>>> Hi Jiaxun,
>>>
>>> Thank you very much for your suggestion.
>>>
>>>   arch/mips/configs/loongson3_defconfig | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/mips/configs/loongson3_defconfig 
>>> b/arch/mips/configs/loongson3_defconfig
>>> index 6768c16..cd95f08 100644
>>> --- a/arch/mips/configs/loongson3_defconfig
>>> +++ b/arch/mips/configs/loongson3_defconfig
>>> @@ -217,6 +217,7 @@ CONFIG_SERIAL_8250_EXTENDED=y
>>>   CONFIG_SERIAL_8250_MANY_PORTS=y
>>>   CONFIG_SERIAL_8250_SHARE_IRQ=y
>>>   CONFIG_SERIAL_8250_RSA=y
>>> +CONFIG_SERIAL_OF_PLATFORM=y
>>>   CONFIG_HW_RANDOM=y
>>>   CONFIG_RAW_DRIVER=m
>>>   CONFIG_I2C_CHARDEV=y
>>
>> Hi,
>>
>> The patch title is again exaggerating things. This is a defconfig 
>> change, so please refer to `git log` output of `arch/mips/configs` 
>> and use something like "MIPS: Loongson: loongson3_defconfig: enable 
>> serial console" or "MIPS: Loongson: enable serial console in 
>> defconfig". The current title reads as if Loongson kernels never were 
>> able to use a serial console in the past.
>
> Hi Xuerui,
>
> Thanks for your suggestion.
>
> We can not use the serial console without this patch,
> so I use the current patch subject.

One can always use their own config to build in whatever support they 
want. Only people blindly following defconfig are affected. That's why I 
think the original patch title is exaggerating.

>
> Anyway, let me modify the patch subject to make it more accurate,
> I think the following is better:
> "MIPS: Loongson: Enable devicetree based probing for 8250 ports"
>
> drivers/tty/serial/8250/Kconfig:
> config SERIAL_OF_PLATFORM
>         tristate "Devicetree based probing for 8250 ports"
>
> I will send v2 later.
>
No problem. Just make it clear that these are defconfig changes so 
people don't misunderstand, even if they're otherwise unfamiliar with 
the current state of things.
> Thanks,
> Tiezhu Yang
>
