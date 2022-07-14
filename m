Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E902574220
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 06:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiGNEOO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 00:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGNEOM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 00:14:12 -0400
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com [115.124.28.219])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882A0193D4
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 21:14:10 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0745075|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.108032-0.0011757-0.890793;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.OS9Vhfr_1657772047;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.OS9Vhfr_1657772047)
          by smtp.aliyun-inc.com;
          Thu, 14 Jul 2022 12:14:08 +0800
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Paul Cercueil <paul@crapouillou.net>,
        Mike Yang <reimu@sudomaker.com>
Cc:     linux-mips@vger.kernel.org, aidanmacdonald.0x0@gmail.com
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
 <FVCXER.DV642VYMZNVS1@crapouillou.net>
 <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
 <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
 <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
 <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
 <6e1d1815-31d5-da55-f601-cce788a836c7@sudomaker.com>
 <4V8ZER.Y1888BONB1P@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <e2bd1935-b7c6-0023-7a34-c896ca7a9463@wanyeetech.com>
Date:   Thu, 14 Jul 2022 12:14:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4V8ZER.Y1888BONB1P@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2022/7/14 上午4:57, Paul Cercueil wrote:
>
>
> Le jeu., juil. 14 2022 at 03:44:34 +0800, Mike Yang 
> <reimu@sudomaker.com> a écrit :
>> Hi Paul,
>>
>> On 7/14/22 00:08, Paul Cercueil wrote:
>>>  Hi Mike,
>>>  [...]
>>>
>>>>  If I comment the "wait" instruction, it will exit the suspend 
>>>> process immediately. And yes, I don't think it suspended properly.
>>>
>>>  Ok. I was suggesting to try that since it would show if the crash 
>>> happens when a particular device gets suspended.
>>>
>>>  Are you certain that your wakeup IRQ is unmasked?
>>
>> I'm not sure. Which register should I check?
>
> Check the IMCR0 / IMCR1 registers. Everything should be masked except 
> your wakeup source. If your wakeup source is a GPIO, also check that 
> the mask register that corresponds to your GPIO.
>

Do you mean ICMR0 and ICMR1 in  the Interrupt Controller?


>>>
>>>  [...]
>>>
>>>>>>>   I'm afraid the above didn't work for me. Have you tested 
>>>>>>> suspend-to-ram in person on a X series SoC?
>>>>>
>>>>>   I didn't test on X-series, I mostly work with JZ. But that part 
>>>>> of the design didn't change since the JZ4740.
>>>>>
>>>>>   Cheers,
>>>>>   -Paul
>>>>>
>>>>>
>>>>
>>>>
>>>>  To be honest, I never owned a board with a JZ series SoC. And 
>>>> sorry for assuming the suspend-to-ram is unusable on all Ingenic 
>>>> SoCs. IIRC, all the JZ series SoCs have external DRAM, while the X 
>>>> series SoCs have internal DRAM. Also Ingenic advertised the power 
>>>> saving features of the X series SoCs heavily. Things might be 
>>>> different since it may involve additional power management.
>>>
>>>  Even if the 3.x method you were describing works, the currently 
>>> upstream method should work as well, and if it doesn't, we probably 
>>> should try to figure why.
>>>
>>>  I remember doing some tests on the JZ4770 some years ago, and I 
>>> would get a power consumption of 7mA when suspended - that's for the 
>>> whole board, measured at the 3.7V battery, so about 0.026 W. The 
>>> only things powered ON then are the RAM chips and the SoC's RTC module.
>>>
>>>>  At the time of writing the last sentence of the email, Dr. Zhou 
>>>> just pointed out that it may has something to do with the secure 
>>>> boot feature introduced in the X series SoC, although the feature 
>>>> is not enabled. I already mailed my X1000E & X1501 boards to Dr. 
>>>> Zhou for further tests. You may want to get a X1000(E) board (e.g. 
>>>> halley2) and test this by yourself.
>>>
>>>  I do have a Cu1000-Neo board, but I have never used it, I wouldn't 
>>> know how to test this.
>>>
>>>  Cheers,
>>>  -Paul
>>>
>>>
>>
>> Earlier today, Dr. Zhou and I talked to a senior engineer from 
>> Ingenic. He said an extra piece of code is necessary for the X 
>> series, and more CPM registers (other than LPM) are needed to be 
>> configured. The X series can't reconfigure the DRAM to exit 
>> self-refresh mode by themselves. He also said, if we really don't 
>> want to put the code inside the kernel, it's possible to store the 
>> $pc somewhere in the RAM and modify UBoot SPL to do additional checks 
>> (e.g. P0 powerup flag) and jump back to the $pc after reconfiguring 
>> DRAM. I'm not sure if this will work, since the core will boot 
>> straight from the BROM, and the SFC and/or MSC peripherals will be 
>> reconfigured before it can load SPL again into the SRAM. It may cause 
>> confusion to the kernel SFC/MSC drivers. From his words, we can have 
>> another method: incorporate the code inside UBoot and write it to the 
>> SRAM prior to booting the kernel. What's your opinion?
>
> The X1000 has more CPM registers and do support turning the CPU 
> completely off, which is new compared to the JZ4780, so that part is 
> true. However, the regular method to enter SLEEP mode is still 
> described in the X1000, X1830 and X2000 programming manuals, and it's 
> the exact same method described in the JZ4780 and even in the JZ4740 
> programming manuals. So allow me to doubt.
>
> Knowing that Ingenic's 3.x kernel implements the "complete shutdown" 
> sleep mode, I would think that this is why your senior engineer said 
> that an extra piece of code is necessary - because that's how they 
> implemented it. But that does not mean that it is required, and 
> nothing in any of the X-series programming manuals suggests that it is 
> required.
>
> Cheers,
> -Paul
>
