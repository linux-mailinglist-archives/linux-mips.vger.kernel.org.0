Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56016299A2
	for <lists+linux-mips@lfdr.de>; Tue, 15 Nov 2022 14:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238247AbiKONHP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Nov 2022 08:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238251AbiKONHM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Nov 2022 08:07:12 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A22972494F;
        Tue, 15 Nov 2022 05:07:09 -0800 (PST)
Received: from loongson.cn (unknown [10.180.13.64])
        by gateway (Coremail) with SMTP id _____8DxTLb8jnNjL0UHAA--.9807S3;
        Tue, 15 Nov 2022 21:07:08 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx9Vb6jnNjO6UTAA--.34062S2;
        Tue, 15 Nov 2022 21:07:07 +0800 (CST)
Subject: Re: [PATCH v2 1/2] gpio: loongson: add dts/acpi gpio support
To:     WANG Xuerui <kernel@xen0n.name>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>, zhuyinbo@loongson.cn,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        lvjianmin <lvjianmin@loongson.cn>,
        zhanghongchen <zhanghongchen@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>
References: <20221114095332.21079-1-zhuyinbo@loongson.cn>
 <CAMRc=McnEiSj1Q51pG3Lc8e+HcXE_uU7dm=1VoOa__xOgyoZPg@mail.gmail.com>
 <8b24e3df-8c22-bd09-cfc1-b27e39a05c25@loongson.cn>
 <fd5cc541-dfc6-d1cf-0865-669b11ce2e7a@xen0n.name>
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <9a448680-0bb6-c4f0-93d2-29a86fede2d4@loongson.cn>
Date:   Tue, 15 Nov 2022 21:07:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fd5cc541-dfc6-d1cf-0865-669b11ce2e7a@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx9Vb6jnNjO6UTAA--.34062S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WF1rurWfGw4kCw1xXFW7twb_yoWxWryDpF
        n3AayxGFWUGr1xAr1qq34UZryayry5JwnFqF1rJa4UCryqq3Wjqr1UXF1q9F18Gr4rAF1j
        qry8Gr47uF45ZrUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bDkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE
        52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I
        80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCj
        c4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI
        0_JF0_Jw1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCj
        c4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
        Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
        6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
        AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
        1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8k-BtUUUUU==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2022/11/15 下午6:17, WANG Xuerui 写道:
> Sorry for jumping in, but...
> 
> On 2022/11/15 17:53, Yinbo Zhu wrote:
>>
>>
>> 在 2022/11/15 下午5:05, Bartosz Golaszewski 写道:
>>> On Mon, Nov 14, 2022 at 10:53 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
>>>>
>>>> The latest Loongson series platform use dts or acpi framework to
>>>> register gpio device resources, such as the Loongson-2 series
>>>> SoC of LOONGARCH architecture. In order to support dts, acpi and
>>>> compatibility with previous platform device resources in driver,
>>>> this patch was added.
>>>>
>>>> Signed-off-by: lvjianmin <lvjianmin@loongson.cn>
>>>> Signed-off-by: zhanghongchen <zhanghongchen@loongson.cn>
>>>> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
>>>> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
>>>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>>>> ---
>>>> Change in v2:
>>>>                  1. Fixup of_loongson_gpio_get_props and remove the 
>>>> parse logic about
>>>>                     "loongson,conf_offset", "loongson,out_offset", 
>>>> "loongson,in_offset",
>>>>                     "loongson,gpio_base", "loongson,support_irq" 
>>>> then kernel driver will
>>>>                     initial them that depend compatible except 
>>>> "loongson,gpio_base".
>>>>
>>>>   arch/loongarch/include/asm/loongson.h         |  13 +
>>>>   .../include/asm/mach-loongson2ef/loongson.h   |  12 +
>>>>   .../include/asm/mach-loongson64/loongson.h    |  13 +
>>>>   drivers/gpio/Kconfig                          |   6 +-
>>>>   drivers/gpio/gpio-loongson.c                  | 422 
>>>> +++++++++++++++---
>>>>   5 files changed, 391 insertions(+), 75 deletions(-)
>>>>
>>>> diff --git a/arch/loongarch/include/asm/loongson.h 
>>>> b/arch/loongarch/include/asm/loongson.h
>>>> index 00db93edae1b..383fdda155f0 100644
>>>> --- a/arch/loongarch/include/asm/loongson.h
>>>> +++ b/arch/loongarch/include/asm/loongson.h
>>>> @@ -60,6 +60,19 @@ static inline void xconf_writeq(u64 val64, 
>>>> volatile void __iomem *addr)
>>>>          );
>>>>   }
>>>>
>>>> +/* ============== Data structrues =============== */
>>>> +
>>>> +/* gpio data */
>>>> +struct platform_gpio_data {
>>>> +       u32 gpio_conf;
>>>> +       u32 gpio_out;
>>>> +       u32 gpio_in;
>>>> +       u32 support_irq;
>>>> +       char *label;
>>>> +       int gpio_base;
>>>> +       int ngpio;
>>>> +};
>>>
>>> This is a terrible name for an exported structure. You would at least
>>> need some kind of a namespace prefix. But even then the need to add a
>>> platform data structure is very questionable. We've moved past the
>>> need for platform data in the kernel. I don't see anyone setting it up
>>> in this series either. Could you provide more explanation on why you
>>> would need it and who would use it?
>> okay, I will add a namespace prefix, about this platform data was added
>> that was to compatible with legacy platforms that do not support dts or
>> acpi, then, the mips loongson platform or loongarch loongson platform
> 
> Why are you trying to support "legacy" LoongArch platforms when the 
> architecture was just upstreamed *this year*?
the leagacy gpio driver had support LoongArch, and you can find some
gpio register defined in arch/loongarch/include
/asm/loongson.h in legacy gpio driver, such as LOONGSON_GPIODATA,
The legacy gpio driver is the driver that doesn't include my gpio patch.
> 
>> can implement the gpio device driver to initialize the
>> platform_gpio_data structure as needed after exporting the structure.
>>>
>>>> +
>>>>   /* ============== LS7A registers =============== */
>>>>   #define LS7A_PCH_REG_BASE              0x10000000UL
>>>>   /* LPC regs */
>>>> diff --git a/arch/mips/include/asm/mach-loongson2ef/loongson.h 
>>>> b/arch/mips/include/asm/mach-loongson2ef/loongson.h
>>>> index ca039b8dcde3..b261cea4fee1 100644
>>>> --- a/arch/mips/include/asm/mach-loongson2ef/loongson.h
>>>> +++ b/arch/mips/include/asm/mach-loongson2ef/loongson.h
>>>> @@ -315,4 +315,16 @@ extern unsigned long _loongson_addrwincfg_base;
>>>>
>>>>   #endif /* ! CONFIG_CPU_SUPPORTS_ADDRWINCFG */
>>>>
>>>> +/* ============== Data structrues =============== */
>>>> +
>>>> +/* gpio data */
>>>> +struct platform_gpio_data {
>>>> +       u32 gpio_conf;
>>>> +       u32 gpio_out;
>>>> +       u32 gpio_in;
>>>> +       u32 support_irq;
>>>> +       char *label;
>>>> +       int gpio_base;
>>>> +       int ngpio;
>>>> +};
>>>
>>> No idea why you would need to duplicate it like this either. And why
>>> put it in arch/.
>> because loongson platform include mips and loongarch, and the gpio 
>> device data was defined in arch/ in leagcy loongson gpio driver.  so the
>> latest loongson gpio drvier add platform_gpio_data in same dir.
> 
> I think at this point it's hopefully clear, that the way forward to 
> supporting Loongson IP blocks shared between MIPS/LoongArch SoCs is to 
> start over and do things properly, making the code as platform-agnostic 
> as possible. Just make sure the drivers can get initialized via DT and 
> ACPI then you're all set -- the upstream kernel is guaranteed to use one 
> of the two well-established boot flows for every Loongson chip it 
> supports. Be it hard-coded DT in arch/mips/boot/dts/loongson, or the 
> LoongArch ACPI/upcoming DT, no need for hard-coding things in arch/ in 
> either case.
Our old platforms are used by customers, but we will not maintain those
platforms. Adding dts/acpi support to those old platforms not only makes
no sense, but also affects their use. Because the configuration of
dts/acpi requires the support of the firmware team, but in fact, we have
no one to maintain those old platforms.

in a words, My patch to upstream was supposed to consider dts/acpi in
LoongArch platform  But I have to consider the original legacy gpio
driver and to compatible with it.
> 
>>>
>>> [snip]
>>>
>>> I will hold off reviewing the rest of the patch until we get that 
>>> clarified.
>>>
>>> Bartosz
>>>
>>
> 

