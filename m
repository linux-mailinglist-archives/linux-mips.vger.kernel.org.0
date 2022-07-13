Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89CEA573AD2
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jul 2022 18:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiGMQIv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jul 2022 12:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234652AbiGMQIu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Jul 2022 12:08:50 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FACDEB1
        for <linux-mips@vger.kernel.org>; Wed, 13 Jul 2022 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1657728526; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tZAO11wByrd2Xu4NWxOcSFXAyHm+4+nd/5Sfdm8mBC8=;
        b=sU8o0S9PAfEmRaEZhLshBferNdUw9bQgiwj0SCX1W5e3DfZkqEYUy8R6wBlGuLISogeQHb
        JYsrhT9UwRBs6nUklRuZr+bSSedZvGwafEk7d9po/hPJFuRFdDCD356ouAJqWpbpyLS6po
        F7KUp5z1Z6+zpzm/0wsTYxh4eSEcACE=
Date:   Wed, 13 Jul 2022 17:08:37 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: RFC: Proper suspend-to-ram implementation of Ingenic SoCs
To:     Mike Yang <reimu@sudomaker.com>
Cc:     linux-mips@vger.kernel.org,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        aidanmacdonald.0x0@gmail.com
Message-Id: <DIVYER.Y90Y2FPIT9K8@crapouillou.net>
In-Reply-To: <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
References: <e58406ce-a79b-fe91-9587-09e87953d0ab@sudomaker.com>
        <FVCXER.DV642VYMZNVS1@crapouillou.net>
        <41070648-3651-a6c4-4888-c142408f3e85@sudomaker.com>
        <M1IXER.NDAP4RWR4EQZ1@crapouillou.net>
        <13337393-f416-0a0f-a835-58035a3a3203@sudomaker.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mike,
[...]

> If I comment the "wait" instruction, it will exit the suspend process 
> immediately. And yes, I don't think it suspended properly.

Ok. I was suggesting to try that since it would show if the crash 
happens when a particular device gets suspended.

Are you certain that your wakeup IRQ is unmasked?

[...]

>>>>  I'm afraid the above didn't work for me. Have you tested 
>>>> suspend-to-ram in person on a X series SoC?
>> 
>>  I didn't test on X-series, I mostly work with JZ. But that part of 
>> the design didn't change since the JZ4740.
>> 
>>  Cheers,
>>  -Paul
>> 
>> 
> 
> 
> To be honest, I never owned a board with a JZ series SoC. And sorry 
> for assuming the suspend-to-ram is unusable on all Ingenic SoCs. 
> IIRC, all the JZ series SoCs have external DRAM, while the X series 
> SoCs have internal DRAM. Also Ingenic advertised the power saving 
> features of the X series SoCs heavily. Things might be different 
> since it may involve additional power management.

Even if the 3.x method you were describing works, the currently 
upstream method should work as well, and if it doesn't, we probably 
should try to figure why.

I remember doing some tests on the JZ4770 some years ago, and I would 
get a power consumption of 7mA when suspended - that's for the whole 
board, measured at the 3.7V battery, so about 0.026 W. The only things 
powered ON then are the RAM chips and the SoC's RTC module.

> At the time of writing the last sentence of the email, Dr. Zhou just 
> pointed out that it may has something to do with the secure boot 
> feature introduced in the X series SoC, although the feature is not 
> enabled. I already mailed my X1000E & X1501 boards to Dr. Zhou for 
> further tests. You may want to get a X1000(E) board (e.g. halley2) 
> and test this by yourself.

I do have a Cu1000-Neo board, but I have never used it, I wouldn't know 
how to test this.

Cheers,
-Paul


