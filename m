Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75200572933
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jul 2022 00:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbiGLWUX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jul 2022 18:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbiGLWUW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Jul 2022 18:20:22 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBC633343
        for <linux-mips@vger.kernel.org>; Tue, 12 Jul 2022 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1657664419; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mubt9pe+pxBaUUJAigk+4T/drZu6yYpxqLXa8Z8DYoU=;
        b=Y5m0qzE8oHC2vuHyC76+8t6bMerAdQBLd4PwMOhM2N0BGgVm5bErTlLLpqPh8RNI8B2JEB
        bAgWyzWFM8uRvRnyXEJJjvRIK5HRXzU1hppCf0ZqGGgJmdo7ol4bS5toW5uBR/r2JNDBpY
        dvoeaJH9zuT3Rp31Xt4plQlQp/tZF8o=
Date:   Tue, 12 Jul 2022 23:20:10 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Mike Yang <reimu@sudomaker.com>
Cc:     linux-mips@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        aidanmacdonald.0x0@gmail.com
Message-Id: <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
In-Reply-To: <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
        <FVCXER.DV642VYMZNVS1@crapouillou.net>
        <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
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



Le mer., juil. 13 2022 at 04:51:05 +0800, Mike Yang=20
<reimu@sudomaker.com> a =E9crit :
> Hi Paul,
>=20
> Thanks for the information.
>=20
>=20
> On 7/13/22 04:28, Paul Cercueil wrote:
>>  Hi Mike,
>>=20
>>  Le mer., juil. 13 2022 at 03:19:32 +0800, Mike Yang=20
>> <reimu@sudomaker.com> a =E9crit :
>>>  The suspend-to-ram implementation of Ingenic SoCs in the current=20
>>> kernel is nowhere near usable, especially for the X series SoCs.=20
>>> Since it involves turning off CPU core power and putting DRAM into=20
>>> self-refresh mode, things are a bit complicated. Turning off CPU=20
>>> core power means all register files and cache contents are lost.=20
>>> Putting DRAM into self-refresh mode means it will no longer respond=20
>>> to bus transactions.
>>=20
>>  Suspend-to-RAM is well-tested and has been working fine for ages on=20
>> all JZ SoCs, so I wouldn't call it "nowhere near usable". Zhou also=20
>> implemented it on X-series SoCs.
>=20
> With the vanilla 5.18 kernel, the system will simply become=20
> unresponsive after typing "echo mem > /sys/power/state". It won't=20
> respond to WKUP and other interrupt-enabled GPIO pins. The power=20
> consumption is a bit lower, but nowhere near 0.045W. The behavior is=20
> the same for X1000(E) and X1501.

Well, do you know why it fails? Did you try to debug it? Does it still=20
become unresponsive if you comment the "wait" instruction?

It's a bit early to talk about power consumption if it doesn't suspend=20
properly yet.

> I asked Dr. Zhou about this in person and he said he never tested the=20
> suspend-to-ram, nor he confirmed it working.
>=20
>>=20
>>>  I ported the implementation from Ingenic's 3.10 kernel to 5.18,=20
>>> and it worked. But it involves a separate piece of executable code,=20
>>> and apparently there's no way to eliminate it. During pm_enter(),=20
>>> various CPM registers are configured to turn off CPU core and put=20
>>> DRAM into self-refresh upon issuing the "wait" instruction, this=20
>>> piece of executable code will be copied to the on-chip SRAM, and=20
>>> its entry address will be written into the CPM.SLPC register. Then,=20
>>> cache will be flushed and CPU register files (incl. CP0, CP1 stuff)=20
>>> will also be saved in the SRAM. Finally, the "wait" instruction=20
>>> will be issued, and the suspend procedure completed. When any=20
>>> external events trigger a resume, the CPU is powered on, and=20
>>> immediately jumps to the PC stored in CPM.SLPC, and starts=20
>>> executing the piece of code. The code will perform the usual crt0=20
>>> stuff on MIPS machines, reconfigure the DRAM into normal mode, and=20
>>> finally restore the register files. Then the control flow goes back=20
>>> to
>>>  pm_enter(), and the resume procedure is completed.
>>=20
>>  This sounds extremely complex and way overkill. But you don't need=20
>> any of this.
>>=20
>>>  The suspend-to-ram really saves a lot of power. For my particular=20
>>> board, the idle power consumption is about 0.24W (1.25V Vcore,=20
>>> 1.2GHz, 1000Hz, preempt). After suspend-to-ram, it drops to only=20
>>> 0.045W.
>>=20
>>  Yes, doesn't surprise me. The RG-350 (JZ4770 based) can last about=20
>> ~6 hours of up-time, and when put  to sleep it will survive a few=20
>> weeks.
>>=20
>>>  So here are my questions:
>>>  1. I don't see a way to eliminate the piece of executable code in=20
>>> SRAM. Is there any other ways?
>>=20
>>  There is what's already implemented, yes. When triggering a=20
>> suspend, the CPM.LCR.LPM setting is set to SLEEP mode=20
>> (drivers/clk/ingenic/pm.c), then the ingenic_pm_enter() function=20
>> (arch/mips/generic/board-ingenic.c) just executes the "wait" CPU=20
>> instruction to put the CPU to sleep. All clocks but the RTC one are=20
>> disabled until an interrupt is raised.
>>=20
>>>  2. If we can't eliminate the code in SRAM, what's the accepted way=20
>>> of integrating it into the kernel tree?
>>=20
>>  Already upstream :)
>>=20
>>>  3. If the hardware doesn't have 32k crystal connected, or the RTC=20
>>> is stripped off (e.g. X1501), some CPM registers need to be=20
>>> configured differently. How could we provide this configuration?
>>=20
>>  It's already supported. The RTC clock can be re-parented (in device=20
>> tree) to the EXT/512 clock, which is (as its name suggests) derived=20
>> from the external EXT oscillator.
>>=20
>>  Hopefully I answered all your questions.
>>=20
>>  Cheers,
>>  -Paul
>>=20
>>=20
>=20
> I'm afraid the above didn't work for me. Have you tested=20
> suspend-to-ram in person on a X series SoC?

I didn't test on X-series, I mostly work with JZ. But that part of the=20
design didn't change since the JZ4740.

Cheers,
-Paul


