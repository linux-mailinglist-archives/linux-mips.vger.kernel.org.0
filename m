Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFE557488D
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 11:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238111AbiGNJWh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 05:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237765AbiGNJWP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 05:22:15 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0532AE24
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1657790341; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w+I3tk/TZHzQcdvoQrYaZloZZ61dEGXfgPmIsm/Y1zw=;
        b=aj4ChXF7bUWtoA428VMU0Sj5qyW4+uvwqH5DXgvi+f2tnJjtM6EhMbVOlb6VhbNVahIIYK
        /JzertlPmZtmVo8E6IrbzaO5MmFjZZWkhzLo16G8PQm0IGZEEv3yq1BdZenJLg0uVra43M
        +16MlHYm8N2P1LYVjW+kL+xER1/hJe0=
Date:   Thu, 14 Jul 2022 10:18:51 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Mike Yang <reimu@sudomaker.com>, linux-mips@vger.kernel.org,
        aidanmacdonald.0x0@gmail.com
Message-Id: <F770FR.FHB5KN6OH1SB3@crapouillou.net>
In-Reply-To: <e2bd1935-b7c6-0023-7a34-c896ca7a9463@wanyeetech.com>
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
        <FVCXER.DV642VYMZNVS1@crapouillou.net>
        <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
        <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
        <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
        <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
        <6e1d1815-31d5-da55-f601-cce788a836c7@sudomaker.com>
        <4V8ZER.Y1888BONB1P@crapouillou.net>
        <e2bd1935-b7c6-0023-7a34-c896ca7a9463@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le jeu., juil. 14 2022 at 12:14:07 +0800, Zhou Yanjie=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Hi Paul,
>=20
> On 2022/7/14 =E4=B8=8A=E5=8D=884:57, Paul Cercueil wrote:
>>=20
>>=20
>> Le jeu., juil. 14 2022 at 03:44:34 +0800, Mike Yang=20
>> =7F<reimu@sudomaker.com> a =C3=A9crit :
>>> Hi Paul,
>>>=20
>>> On 7/14/22 00:08, Paul Cercueil wrote:
>>>>  Hi Mike,
>>>>  [...]
>>>>=20
>>>>>  If I comment the "wait" instruction, it will exit the suspend=20
>>>>> =7F=7F=7F=7Fprocess immediately. And yes, I don't think it suspended=20
>>>>> properly.
>>>>=20
>>>>  Ok. I was suggesting to try that since it would show if the crash=20
>>>> =7F=7F=7Fhappens when a particular device gets suspended.
>>>>=20
>>>>  Are you certain that your wakeup IRQ is unmasked?
>>>=20
>>> I'm not sure. Which register should I check?
>>=20
>> Check the IMCR0 / IMCR1 registers. Everything should be masked=20
>> except =7Fyour wakeup source. If your wakeup source is a GPIO, also=20
>> check that =7Fthe mask register that corresponds to your GPIO.
>>=20
>=20
> Do you mean ICMR0 and ICMR1 in  the Interrupt Controller?

Yes, sorry.

Cheers,
-Paul

>>>>=20
>>>>  [...]
>>>>=20
>>>>>>>>   I'm afraid the above didn't work for me. Have you tested=20
>>>>>>>> =7F=7F=7F=7F=7F=7F=7Fsuspend-to-ram in person on a X series SoC?
>>>>>>=20
>>>>>>   I didn't test on X-series, I mostly work with JZ. But that=20
>>>>>> part =7F=7F=7F=7F=7Fof the design didn't change since the JZ4740.
>>>>>>=20
>>>>>>   Cheers,
>>>>>>   -Paul
>>>>>>=20
>>>>>>=20
>>>>>=20
>>>>>=20
>>>>>  To be honest, I never owned a board with a JZ series SoC. And=20
>>>>> =7F=7F=7F=7Fsorry for assuming the suspend-to-ram is unusable on all=20
>>>>> Ingenic =7F=7F=7F=7FSoCs. IIRC, all the JZ series SoCs have external=20
>>>>> DRAM, while the X =7F=7F=7F=7Fseries SoCs have internal DRAM. Also=20
>>>>> Ingenic advertised the power =7F=7F=7F=7Fsaving features of the X ser=
ies=20
>>>>> SoCs heavily. Things might be =7F=7F=7F=7Fdifferent since it may invo=
lve=20
>>>>> additional power management.
>>>>=20
>>>>  Even if the 3.x method you were describing works, the currently=20
>>>> =7F=7F=7Fupstream method should work as well, and if it doesn't, we=20
>>>> probably =7F=7F=7Fshould try to figure why.
>>>>=20
>>>>  I remember doing some tests on the JZ4770 some years ago, and I=20
>>>> =7F=7F=7Fwould get a power consumption of 7mA when suspended - that's=20
>>>> for the =7F=7F=7Fwhole board, measured at the 3.7V battery, so about=20
>>>> 0.026 W. The =7F=7F=7Fonly things powered ON then are the RAM chips an=
d=20
>>>> the SoC's RTC module.
>>>>=20
>>>>>  At the time of writing the last sentence of the email, Dr. Zhou=20
>>>>> =7F=7F=7F=7Fjust pointed out that it may has something to do with the=
=20
>>>>> secure =7F=7F=7F=7Fboot feature introduced in the X series SoC, altho=
ugh=20
>>>>> the feature =7F=7F=7F=7Fis not enabled. I already mailed my X1000E &=20
>>>>> X1501 boards to Dr. =7F=7F=7F=7FZhou for further tests. You may want =
to=20
>>>>> get a X1000(E) board (e.g. =7F=7F=7F=7Fhalley2) and test this by your=
self.
>>>>=20
>>>>  I do have a Cu1000-Neo board, but I have never used it, I=20
>>>> wouldn't =7F=7F=7Fknow how to test this.
>>>>=20
>>>>  Cheers,
>>>>  -Paul
>>>>=20
>>>>=20
>>>=20
>>> Earlier today, Dr. Zhou and I talked to a senior engineer from=20
>>> =7F=7FIngenic. He said an extra piece of code is necessary for the X=20
>>> =7F=7Fseries, and more CPM registers (other than LPM) are needed to be=20
>>> =7F=7Fconfigured. The X series can't reconfigure the DRAM to exit=20
>>> =7F=7Fself-refresh mode by themselves. He also said, if we really don't=
=20
>>> =7F=7Fwant to put the code inside the kernel, it's possible to store=20
>>> the =7F=7F$pc somewhere in the RAM and modify UBoot SPL to do=20
>>> additional checks =7F=7F(e.g. P0 powerup flag) and jump back to the $pc=
=20
>>> after reconfiguring =7F=7FDRAM. I'm not sure if this will work, since=20
>>> the core will boot =7F=7Fstraight from the BROM, and the SFC and/or MSC=
=20
>>> peripherals will be =7F=7Freconfigured before it can load SPL again=20
>>> into the SRAM. It may cause =7F=7Fconfusion to the kernel SFC/MSC=20
>>> drivers. From his words, we can have =7F=7Fanother method: incorporate=20
>>> the code inside UBoot and write it to the =7F=7FSRAM prior to booting=20
>>> the kernel. What's your opinion?
>>=20
>> The X1000 has more CPM registers and do support turning the CPU=20
>> =7Fcompletely off, which is new compared to the JZ4780, so that part=20
>> is =7Ftrue. However, the regular method to enter SLEEP mode is still=20
>> =7Fdescribed in the X1000, X1830 and X2000 programming manuals, and=20
>> it's =7Fthe exact same method described in the JZ4780 and even in the=20
>> JZ4740 =7Fprogramming manuals. So allow me to doubt.
>>=20
>> Knowing that Ingenic's 3.x kernel implements the "complete shutdown"=20
>> =7Fsleep mode, I would think that this is why your senior engineer=20
>> said =7Fthat an extra piece of code is necessary - because that's how=20
>> they =7Fimplemented it. But that does not mean that it is required,=20
>> and =7Fnothing in any of the X-series programming manuals suggests=20
>> that it is =7Frequired.
>>=20
>> Cheers,
>> -Paul
>>=20


