Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3527573568
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jul 2022 13:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiGMLbP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jul 2022 07:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiGMLbO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Jul 2022 07:31:14 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59972102700
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 04:31:13 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so1057692wme.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XHIGiUKYBQ2BmBX53hAL/PUb45Dazt3qNy/qRDBZNkU=;
        b=2lygF/6vtdnj2q9NF/wuQ4/Br7ccxLv0jPMzBXVqUESbHYY31Rxiw37Q1PtI4C2+iI
         D4k15Fuo7FAVIrIYzHHWFjA9hp7z46sUDkCM66KEke0q4ymFApp9EdF5qvZ7rlixOPrP
         bzxS1B82MPpkf1NTf0RumuPze3PB2E15Lf6LLMDQCFNqltlhU8V97Cw0VeVovdZBw2XV
         D9oKTGubLmfe2j3F7EPQ1Htuo+9OrgbaSmT4wOLndZnvpPyh6/Ha0VP0YJpvOeYtcY4Z
         K/nArTtKZMl+ApO6wO/KcU9Atql/OaeLnwdIJ2c9sInkP2scVNwsfVZbZa7z3dJwkDhX
         5JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XHIGiUKYBQ2BmBX53hAL/PUb45Dazt3qNy/qRDBZNkU=;
        b=ZQQPkJ4HtIVxbCeXr6MKDrVU+0VboUMev6CZZTD07y44JOofBGxRIybDHOg0pM1iby
         LBSzB/5+oACjetGXEOxI+Q6Ym4IZRlbXYiQdxRM0i/yWJgZvP5WvIA9KtYomXvkvqmMq
         7S/9dFh6s3xBlIpqL3oj3FMKs8hTrkp1Tn8WeS8QsOhCZlNXuSqE0nLdv2SiWChQtYOB
         TsPtnkuh3z0EIjl9iyJRgrOV91ZjEH728goY4SAy5P/dfx0a+9Q8KA0CG7x826TKgjjd
         wh0r9ss/nc1/6zyauieaMgQBPzBMA5RkL/l0shjBDHWfSjI2xCAWlO3NlsoMqXiBTcxb
         Bu9w==
X-Gm-Message-State: AJIora9Y0DnQ8zW0krr4N1Avwhl1MCx6UtiUX3LT+cx00d1R4AevsFU+
        pBOJ0Ym40TI5yk3CHcaiR9DYAWd9jUppkYgT
X-Google-Smtp-Source: AGRyM1vWcDqRwM7GrLQp91MInOMmAaX5t3L17vth6rst5I2U+ovcM30cPeRb8r04ALOTM8e0raG8hg==
X-Received: by 2002:a05:600c:348d:b0:3a2:d019:2366 with SMTP id a13-20020a05600c348d00b003a2d0192366mr9177640wmq.187.1657711871842;
        Wed, 13 Jul 2022 04:31:11 -0700 (PDT)
Received: from [172.16.24.11] ([185.230.126.10])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d634a000000b0021b89f8662esm11110299wrw.13.2022.07.13.04.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 04:31:11 -0700 (PDT)
Message-ID: <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
Date:   Wed, 13 Jul 2022 19:31:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     linux-mips@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        aidanmacdonald.0x0@gmail.com
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
 <FVCXER.DV642VYMZNVS1@crapouillou.net>
 <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
 <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
From:   Mike Yang <reimu@sudomaker.com>
In-Reply-To: <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,


On 7/13/22 06:20, Paul Cercueil wrote:
> 
> 
> Le mer., juil. 13 2022 at 04:51:05 +0800, Mike Yang <reimu@sudomaker.com> a écrit :
>> Hi Paul,
>>
>> Thanks for the information.
>>
>>
>> On 7/13/22 04:28, Paul Cercueil wrote:
>>>  Hi Mike,
>>>
>>>  Le mer., juil. 13 2022 at 03:19:32 +0800, Mike Yang <reimu@sudomaker.com> a écrit :
>>>>  The suspend-to-ram implementation of Ingenic SoCs in the current kernel is nowhere near usable, especially for the X series SoCs. Since it involves turning off CPU core power and putting DRAM into self-refresh mode, things are a bit complicated. Turning off CPU core power means all register files and cache contents are lost. Putting DRAM into self-refresh mode means it will no longer respond to bus transactions.
>>>
>>>  Suspend-to-RAM is well-tested and has been working fine for ages on all JZ SoCs, so I wouldn't call it "nowhere near usable". Zhou also implemented it on X-series SoCs.
>>
>> With the vanilla 5.18 kernel, the system will simply become unresponsive after typing "echo mem > /sys/power/state". It won't respond to WKUP and other interrupt-enabled GPIO pins. The power consumption is a bit lower, but nowhere near 0.045W. The behavior is the same for X1000(E) and X1501.
> 
> Well, do you know why it fails? Did you try to debug it? Does it still become unresponsive if you comment the "wait" instruction?
> 
> It's a bit early to talk about power consumption if it doesn't suspend properly yet.

If I comment the "wait" instruction, it will exit the suspend process immediately. And yes, I don't think it suspended properly.

> 
>> I asked Dr. Zhou about this in person and he said he never tested the suspend-to-ram, nor he confirmed it working.
>>
>>>
>>>>  I ported the implementation from Ingenic's 3.10 kernel to 5.18, and it worked. But it involves a separate piece of executable code, and apparently there's no way to eliminate it. During pm_enter(), various CPM registers are configured to turn off CPU core and put DRAM into self-refresh upon issuing the "wait" instruction, this piece of executable code will be copied to the on-chip SRAM, and its entry address will be written into the CPM.SLPC register. Then, cache will be flushed and CPU register files (incl. CP0, CP1 stuff) will also be saved in the SRAM. Finally, the "wait" instruction will be issued, and the suspend procedure completed. When any external events trigger a resume, the CPU is powered on, and immediately jumps to the PC stored in CPM.SLPC, and starts executing the piece of code. The code will perform the usual crt0 stuff on MIPS machines, reconfigure the DRAM into normal mode, and finally restore the register files. Then the control flow goes back to
>>>>  pm_enter(), and the resume procedure is completed.
>>>
>>>  This sounds extremely complex and way overkill. But you don't need any of this.
>>>
>>>>  The suspend-to-ram really saves a lot of power. For my particular board, the idle power consumption is about 0.24W (1.25V Vcore, 1.2GHz, 1000Hz, preempt). After suspend-to-ram, it drops to only 0.045W.
>>>
>>>  Yes, doesn't surprise me. The RG-350 (JZ4770 based) can last about ~6 hours of up-time, and when put  to sleep it will survive a few weeks.
>>>
>>>>  So here are my questions:
>>>>  1. I don't see a way to eliminate the piece of executable code in SRAM. Is there any other ways?
>>>
>>>  There is what's already implemented, yes. When triggering a suspend, the CPM.LCR.LPM setting is set to SLEEP mode (drivers/clk/ingenic/pm.c), then the ingenic_pm_enter() function (arch/mips/generic/board-ingenic.c) just executes the "wait" CPU instruction to put the CPU to sleep. All clocks but the RTC one are disabled until an interrupt is raised.
>>>
>>>>  2. If we can't eliminate the code in SRAM, what's the accepted way of integrating it into the kernel tree?
>>>
>>>  Already upstream :)
>>>
>>>>  3. If the hardware doesn't have 32k crystal connected, or the RTC is stripped off (e.g. X1501), some CPM registers need to be configured differently. How could we provide this configuration?
>>>
>>>  It's already supported. The RTC clock can be re-parented (in device tree) to the EXT/512 clock, which is (as its name suggests) derived from the external EXT oscillator.
>>>
>>>  Hopefully I answered all your questions.
>>>
>>>  Cheers,
>>>  -Paul
>>>
>>>
>>
>> I'm afraid the above didn't work for me. Have you tested suspend-to-ram in person on a X series SoC?
> 
> I didn't test on X-series, I mostly work with JZ. But that part of the design didn't change since the JZ4740.
> 
> Cheers,
> -Paul
> 
> 


To be honest, I never owned a board with a JZ series SoC. And sorry for assuming the suspend-to-ram is unusable on all Ingenic SoCs. IIRC, all the JZ series SoCs have external DRAM, while the X series SoCs have internal DRAM. Also Ingenic advertised the power saving features of the X series SoCs heavily. Things might be different since it may involve additional power management.



At the time of writing the last sentence of the email, Dr. Zhou just pointed out that it may has something to do with the secure boot feature introduced in the X series SoC, although the feature is not enabled. I already mailed my X1000E & X1501 boards to Dr. Zhou for further tests. You may want to get a X1000(E) board (e.g. halley2) and test this by yourself.


Regards,
Mike
