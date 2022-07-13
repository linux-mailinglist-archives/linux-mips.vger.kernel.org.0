Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCC4573C75
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jul 2022 20:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbiGMSWr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jul 2022 14:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbiGMSWr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Jul 2022 14:22:47 -0400
Received: from out28-169.mail.aliyun.com (out28-169.mail.aliyun.com [115.124.28.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526EF2DA83
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 11:22:36 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07770865|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0691155-0.0108622-0.920022;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.ORrZY8i_1657736542;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.ORrZY8i_1657736542)
          by smtp.aliyun-inc.com;
          Thu, 14 Jul 2022 02:22:23 +0800
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Mike Yang <reimu@sudomaker.com>, linux-mips@vger.kernel.org,
        aidanmacdonald.0x0@gmail.com
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
 <FVCXER.DV642VYMZNVS1@crapouillou.net>
 <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
 <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
 <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
 <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
 <3d6b316f-2d9a-2be1-de51-2064ab220209@wanyeetech.com>
 <QUVYER.8FUGM3B9X7GK1@crapouillou.net>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <3c278b42-9c9f-2dd9-ac34-c5e1a0f34470@wanyeetech.com>
Date:   Thu, 14 Jul 2022 02:22:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <QUVYER.8FUGM3B9X7GK1@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2022/7/14 上午12:16, Paul Cercueil wrote:
> Hi Zhou,
>
> Le jeu., juil. 14 2022 at 00:13:22 +0800, Zhou Yanjie 
> <zhouyanjie@wanyeetech.com> a écrit :
>> Hi Paul,
>>
>> On 2022/7/14 上午12:08, Paul Cercueil wrote:
>>> Hi Mike,
>>> [...]
>>>
>>>> If I comment the "wait" instruction, it will exit the suspend 
>>>> process immediately. And yes, I don't think it suspended properly.
>>>
>>> Ok. I was suggesting to try that since it would show if the crash 
>>> happens when a particular device gets suspended.
>>>
>>> Are you certain that your wakeup IRQ is unmasked?
>>>
>>> [...]
>>>
>>>>>>>  I'm afraid the above didn't work for me. Have you tested 
>>>>>>> suspend-to-ram in person on a X series SoC?
>>>>>
>>>>>  I didn't test on X-series, I mostly work with JZ. But that part 
>>>>> of the design didn't change since the JZ4740.
>>>>>
>>>>>  Cheers,
>>>>>  -Paul
>>>>>
>>>>>
>>>>
>>>>
>>>> To be honest, I never owned a board with a JZ series SoC. And sorry 
>>>> for assuming the suspend-to-ram is unusable on all Ingenic SoCs. 
>>>> IIRC, all the JZ series SoCs have external DRAM, while the X 
>>>> series SoCs have internal DRAM. Also Ingenic advertised the power 
>>>> saving features of the X series SoCs heavily. Things might be 
>>>> different since it may involve additional power management.
>>>
>>> Even if the 3.x method you were describing works, the currently 
>>> upstream method should work as well, and if it doesn't, we probably 
>>> should try to figure why.
>>>
>>> I remember doing some tests on the JZ4770 some years ago, and I 
>>> would get a power consumption of 7mA when suspended - that's for 
>>> the whole board, measured at the 3.7V battery, so about 0.026 W. 
>>> The only things powered ON then are the RAM chips and the SoC's RTC 
>>> module.
>>>
>>>> At the time of writing the last sentence of the email, Dr. Zhou 
>>>> just pointed out that it may has something to do with the secure 
>>>> boot feature introduced in the X series SoC, although the feature 
>>>> is not enabled. I already mailed my X1000E & X1501 boards to Dr. 
>>>> Zhou for further tests. You may want to get a X1000(E) board 
>>>> (e.g. halley2) and test this by yourself.
>>>
>>> I do have a Cu1000-Neo board, but I have never used it, I wouldn't 
>>> know how to test this.
>>>
>>
>> The CU1000-Neo board does not lead out the wakeup pins, maybe it can 
>> be tested with GKD350 (X1830)?
>
> Well any GPIO can act as a wakeup pin, really. "The" wakeup pin is 
> actually masked during suspend unless you specify it as wakeup-enable.
> See: 
> https://github.com/torvalds/linux/blob/master/arch/mips/boot/dts/ingenic/gcw0.dts#L231
>

Got it, thanks!


> Cheers,
> -Paul
>
