Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1558573E5C
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jul 2022 22:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236931AbiGMU5T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jul 2022 16:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiGMU5S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Jul 2022 16:57:18 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30976CD9
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1657745833; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7XkYy96DNFlhSHPiCHo0d1+HJdQxhiPmF9oOysh/Jo=;
        b=w4F32DlAZn9/wN/yO0w6PD6iolms1gJuQcbdmsM+rI98LwVRTFRbewtXtQ5JXSvoU77/oh
        1cCDSCpBM92kVOQFkQ3dj1cz4W/15R1JROX80KBL/91ZmoZIrCeabFoKgQoepBgshZFCI3
        +RLyx1BlMXt+xpZRtanVGzxx01FSkRY=
Date:   Wed, 13 Jul 2022 21:57:04 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Mike Yang <reimu@sudomaker.com>
Cc:     linux-mips@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        aidanmacdonald.0x0@gmail.com
Message-Id: <4V8ZER.Y1888BONB1P@crapouillou.net>
In-Reply-To: <6e1d1815-31d5-da55-f601-cce788a836c7@sudomaker.com>
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
        <FVCXER.DV642VYMZNVS1@crapouillou.net>
        <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
        <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
        <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
        <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
        <6e1d1815-31d5-da55-f601-cce788a836c7@sudomaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu., juil. 14 2022 at 03:44:34 +0800, Mike Yang=20
<reimu@sudomaker.com> a =E9crit :
> Hi Paul,
>=20
> On 7/14/22 00:08, Paul Cercueil wrote:
>>  Hi Mike,
>>  [...]
>>=20
>>>  If I comment the "wait" instruction, it will exit the suspend=20
>>> process immediately. And yes, I don't think it suspended properly.
>>=20
>>  Ok. I was suggesting to try that since it would show if the crash=20
>> happens when a particular device gets suspended.
>>=20
>>  Are you certain that your wakeup IRQ is unmasked?
>=20
> I'm not sure. Which register should I check?

Check the IMCR0 / IMCR1 registers. Everything should be masked except=20
your wakeup source. If your wakeup source is a GPIO, also check that=20
the mask register that corresponds to your GPIO.

>>=20
>>  [...]
>>=20
>>>>>>   I'm afraid the above didn't work for me. Have you tested=20
>>>>>> suspend-to-ram in person on a X series SoC?
>>>>=20
>>>>   I didn't test on X-series, I mostly work with JZ. But that part=20
>>>> of the design didn't change since the JZ4740.
>>>>=20
>>>>   Cheers,
>>>>   -Paul
>>>>=20
>>>>=20
>>>=20
>>>=20
>>>  To be honest, I never owned a board with a JZ series SoC. And=20
>>> sorry for assuming the suspend-to-ram is unusable on all Ingenic=20
>>> SoCs. IIRC, all the JZ series SoCs have external DRAM, while the X=20
>>> series SoCs have internal DRAM. Also Ingenic advertised the power=20
>>> saving features of the X series SoCs heavily. Things might be=20
>>> different since it may involve additional power management.
>>=20
>>  Even if the 3.x method you were describing works, the currently=20
>> upstream method should work as well, and if it doesn't, we probably=20
>> should try to figure why.
>>=20
>>  I remember doing some tests on the JZ4770 some years ago, and I=20
>> would get a power consumption of 7mA when suspended - that's for the=20
>> whole board, measured at the 3.7V battery, so about 0.026 W. The=20
>> only things powered ON then are the RAM chips and the SoC's RTC=20
>> module.
>>=20
>>>  At the time of writing the last sentence of the email, Dr. Zhou=20
>>> just pointed out that it may has something to do with the secure=20
>>> boot feature introduced in the X series SoC, although the feature=20
>>> is not enabled. I already mailed my X1000E & X1501 boards to Dr.=20
>>> Zhou for further tests. You may want to get a X1000(E) board (e.g.=20
>>> halley2) and test this by yourself.
>>=20
>>  I do have a Cu1000-Neo board, but I have never used it, I wouldn't=20
>> know how to test this.
>>=20
>>  Cheers,
>>  -Paul
>>=20
>>=20
>=20
> Earlier today, Dr. Zhou and I talked to a senior engineer from=20
> Ingenic. He said an extra piece of code is necessary for the X=20
> series, and more CPM registers (other than LPM) are needed to be=20
> configured. The X series can't reconfigure the DRAM to exit=20
> self-refresh mode by themselves. He also said, if we really don't=20
> want to put the code inside the kernel, it's possible to store the=20
> $pc somewhere in the RAM and modify UBoot SPL to do additional checks=20
> (e.g. P0 powerup flag) and jump back to the $pc after reconfiguring=20
> DRAM. I'm not sure if this will work, since the core will boot=20
> straight from the BROM, and the SFC and/or MSC peripherals will be=20
> reconfigured before it can load SPL again into the SRAM. It may cause=20
> confusion to the kernel SFC/MSC drivers. From his words, we can have=20
> another method: incorporate the code inside UBoot and write it to the=20
> SRAM prior to booting the kernel. What's your opinion?

The X1000 has more CPM registers and do support turning the CPU=20
completely off, which is new compared to the JZ4780, so that part is=20
true. However, the regular method to enter SLEEP mode is still=20
described in the X1000, X1830 and X2000 programming manuals, and it's=20
the exact same method described in the JZ4780 and even in the JZ4740=20
programming manuals. So allow me to doubt.

Knowing that Ingenic's 3.x kernel implements the "complete shutdown"=20
sleep mode, I would think that this is why your senior engineer said=20
that an extra piece of code is necessary - because that's how they=20
implemented it. But that does not mean that it is required, and nothing=20
in any of the X-series programming manuals suggests that it is required.

Cheers,
-Paul


