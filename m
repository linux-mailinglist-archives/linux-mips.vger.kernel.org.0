Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7629573D50
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jul 2022 21:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbiGMToT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jul 2022 15:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiGMToT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Jul 2022 15:44:19 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1623A167CC
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 12:44:16 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id bk26so16898619wrb.11
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sudomaker-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WMKf4CNdwTJ1RBN6voVAioVofgaTZQLoR5SKl0MbSL4=;
        b=3+Ow1psypNtKsBLdvqN53Qx4I6az16/QV/CI0QoUuo14qq7K4eaxbdCxHJslQqa3vv
         EXjqKnTqZkiqs/Ibp4ga+7IbY3n+0I0SZnYuClEEIF8Bq8NT2PXh7DdfcRy7KHV1lf34
         L+vnOzCvehexAsfUUQGKlV4Rsp4ahFvoyMlmM3o87zJahS4U2P2jQ9P5/xWIMoxsFvXg
         AMH0EgEaOWjpAvBqodB6Gs5uEV6TKYDE72JoYd7ZsaAKguWJ14Ghbg54ak2uMeHp72mI
         lqxChPT4cV0CkymdxSiiJOzIQQr99DH4KaEsH8DSRoON8HnDLkPRP+rHWenD9ZBGLuBQ
         /QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WMKf4CNdwTJ1RBN6voVAioVofgaTZQLoR5SKl0MbSL4=;
        b=hK79q2Q661keYdbtZYY1Hm3olUSmrUMGAQ5gAMnhqXUUbjNNoOYqNZ1V8D4d4GSosv
         7GPVhwn15omxb+hPwtntTgnmhf3pPxOf7pQWFqmNAcgUBjwT2KU1t7y2LKft6y13oXTN
         JsUEes8OMel4XNgS9rvrqLAEetU2jXk5YRIQOMjAIZz2Wikvk5Lbr4IvxMTP+iKb2zfA
         5qPEvuqIISq+sk7jggQGgyg2Es3Gc2g2FmdQmJDoAnDPKsnGXH2P00q4KWGrE+/Lclz7
         akqqnTccL8NSvykXdPik2MrApBncNE8XhMJiPXiTgmV/jB20xaJboA/rNZGVlGqIqsN6
         Grvw==
X-Gm-Message-State: AJIora9ZRz+uN+F5mYnln7nLxj0m9D/C3Z242tPiKYKF1VUKheNnOxt/
        oMY50e/CUFIfjgcLR0j068rN9g==
X-Google-Smtp-Source: AGRyM1v0n5Oxk2tVcUvS12jUsfxWMKe+FtsMKZ62aRS34Oez5UqcDcTb4fWPUl6f+7mBoL+jTMBDLQ==
X-Received: by 2002:a05:6000:1869:b0:21d:6e7a:6e4 with SMTP id d9-20020a056000186900b0021d6e7a06e4mr5016565wri.295.1657741454630;
        Wed, 13 Jul 2022 12:44:14 -0700 (PDT)
Received: from [172.16.24.11] ([185.230.126.10])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c100900b003a2cf1ba9e2sm3026503wmc.6.2022.07.13.12.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 12:44:13 -0700 (PDT)
Message-ID: <6e1d1815-31d5-da55-f601-cce788a836c7@sudomaker.com>
Date:   Thu, 14 Jul 2022 03:44:34 +0800
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
 <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
 <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
From:   Mike Yang <reimu@sudomaker.com>
In-Reply-To: <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
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

On 7/14/22 00:08, Paul Cercueil wrote:
> Hi Mike,
> [...]
> 
>> If I comment the "wait" instruction, it will exit the suspend process immediately. And yes, I don't think it suspended properly.
> 
> Ok. I was suggesting to try that since it would show if the crash happens when a particular device gets suspended.
> 
> Are you certain that your wakeup IRQ is unmasked?

I'm not sure. Which register should I check?

> 
> [...]
> 
>>>>>  I'm afraid the above didn't work for me. Have you tested suspend-to-ram in person on a X series SoC?
>>>
>>>  I didn't test on X-series, I mostly work with JZ. But that part of the design didn't change since the JZ4740.
>>>
>>>  Cheers,
>>>  -Paul
>>>
>>>
>>
>>
>> To be honest, I never owned a board with a JZ series SoC. And sorry for assuming the suspend-to-ram is unusable on all Ingenic SoCs. IIRC, all the JZ series SoCs have external DRAM, while the X series SoCs have internal DRAM. Also Ingenic advertised the power saving features of the X series SoCs heavily. Things might be different since it may involve additional power management.
> 
> Even if the 3.x method you were describing works, the currently upstream method should work as well, and if it doesn't, we probably should try to figure why.
> 
> I remember doing some tests on the JZ4770 some years ago, and I would get a power consumption of 7mA when suspended - that's for the whole board, measured at the 3.7V battery, so about 0.026 W. The only things powered ON then are the RAM chips and the SoC's RTC module.
> 
>> At the time of writing the last sentence of the email, Dr. Zhou just pointed out that it may has something to do with the secure boot feature introduced in the X series SoC, although the feature is not enabled. I already mailed my X1000E & X1501 boards to Dr. Zhou for further tests. You may want to get a X1000(E) board (e.g. halley2) and test this by yourself.
> 
> I do have a Cu1000-Neo board, but I have never used it, I wouldn't know how to test this.
> 
> Cheers,
> -Paul
> 
> 

Earlier today, Dr. Zhou and I talked to a senior engineer from Ingenic. He said an extra piece of code is necessary for the X series, and more CPM registers (other than LPM) are needed to be configured. The X series can't reconfigure the DRAM to exit self-refresh mode by themselves. He also said, if we really don't want to put the code inside the kernel, it's possible to store the $pc somewhere in the RAM and modify UBoot SPL to do additional checks (e.g. P0 powerup flag) and jump back to the $pc after reconfiguring DRAM. I'm not sure if this will work, since the core will boot straight from the BROM, and the SFC and/or MSC peripherals will be reconfigured before it can load SPL again into the SRAM. It may cause confusion to the kernel SFC/MSC drivers. From his words, we can have another method: incorporate the code inside UBoot and write it to the SRAM prior to booting the kernel. What's your opinion?


Regards,
Mike
