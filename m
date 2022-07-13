Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA19F573AFA
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jul 2022 18:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234677AbiGMQQN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jul 2022 12:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbiGMQQM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Jul 2022 12:16:12 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECB850062
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1657728970; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/bqpvJDuk7no6kbrvl1wo8EZ5h+Y4DVPyQL7FuZ7RzU=;
        b=mSWqcVWSkkMciHKqRpUEiZsj1QsaRLFlcwpk6BBKrvaq2Hm994c/vKM9zKLtYQnIGTldCp
        ySdbugLiIGBFo0xpjqaoNioitP1F7aBEJ6/trhG8XvqlcJIPsvRwNhhwGoCStijbItQ/2Q
        aYZ3dNCiFH5cEPdX7M55HJwS9XJDSD8=
Date:   Wed, 13 Jul 2022 17:16:02 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Mike Yang <reimu@sudomaker.com>, linux-mips@vger.kernel.org,
        aidanmacdonald.0x0@gmail.com
Message-Id: <QUVYER.8FUGM3B9X7GK1@crapouillou.net>
In-Reply-To: <3d6b316f-2d9a-2be1-de51-2064ab220209@wanyeetech.com>
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
        <FVCXER.DV642VYMZNVS1@crapouillou.net>
        <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
        <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
        <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
        <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
        <3d6b316f-2d9a-2be1-de51-2064ab220209@wanyeetech.com>
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

Le jeu., juil. 14 2022 at 00:13:22 +0800, Zhou Yanjie=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Hi Paul,
>=20
> On 2022/7/14 =E4=B8=8A=E5=8D=8812:08, Paul Cercueil wrote:
>> Hi Mike,
>> [...]
>>=20
>>> If I comment the "wait" instruction, it will exit the suspend=20
>>> process =7F=7Fimmediately. And yes, I don't think it suspended properly=
.
>>=20
>> Ok. I was suggesting to try that since it would show if the crash=20
>> =7Fhappens when a particular device gets suspended.
>>=20
>> Are you certain that your wakeup IRQ is unmasked?
>>=20
>> [...]
>>=20
>>>>>>  I'm afraid the above didn't work for me. Have you tested=20
>>>>>> =7F=7F=7F=7F=7Fsuspend-to-ram in person on a X series SoC?
>>>>=20
>>>>  I didn't test on X-series, I mostly work with JZ. But that part=20
>>>> of =7F=7F=7Fthe design didn't change since the JZ4740.
>>>>=20
>>>>  Cheers,
>>>>  -Paul
>>>>=20
>>>>=20
>>>=20
>>>=20
>>> To be honest, I never owned a board with a JZ series SoC. And sorry=20
>>> =7F=7Ffor assuming the suspend-to-ram is unusable on all Ingenic SoCs.=20
>>> =7F=7FIIRC, all the JZ series SoCs have external DRAM, while the X=20
>>> series =7F=7FSoCs have internal DRAM. Also Ingenic advertised the power=
=20
>>> saving =7F=7Ffeatures of the X series SoCs heavily. Things might be=20
>>> different =7F=7Fsince it may involve additional power management.
>>=20
>> Even if the 3.x method you were describing works, the currently=20
>> =7Fupstream method should work as well, and if it doesn't, we probably=20
>> =7Fshould try to figure why.
>>=20
>> I remember doing some tests on the JZ4770 some years ago, and I=20
>> would =7Fget a power consumption of 7mA when suspended - that's for=20
>> the whole =7Fboard, measured at the 3.7V battery, so about 0.026 W.=20
>> The only things =7Fpowered ON then are the RAM chips and the SoC's RTC=20
>> module.
>>=20
>>> At the time of writing the last sentence of the email, Dr. Zhou=20
>>> just =7F=7Fpointed out that it may has something to do with the secure=20
>>> boot =7F=7Ffeature introduced in the X series SoC, although the feature=
=20
>>> is not =7F=7Fenabled. I already mailed my X1000E & X1501 boards to Dr.=20
>>> Zhou for =7F=7Ffurther tests. You may want to get a X1000(E) board=20
>>> (e.g. halley2) =7F=7Fand test this by yourself.
>>=20
>> I do have a Cu1000-Neo board, but I have never used it, I wouldn't=20
>> =7Fknow how to test this.
>>=20
>=20
> The CU1000-Neo board does not lead out the wakeup pins, maybe it can=20
> be tested with GKD350 (X1830)?

Well any GPIO can act as a wakeup pin, really. "The" wakeup pin is=20
actually masked during suspend unless you specify it as wakeup-enable.
See:=20
https://github.com/torvalds/linux/blob/master/arch/mips/boot/dts/ingenic/gc=
w0.dts#L231

Cheers,
-Paul


