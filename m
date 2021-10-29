Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B81F4401B9
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhJ2SNY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhJ2SNY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:13:24 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCB9C061570;
        Fri, 29 Oct 2021 11:10:55 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so14660821otq.12;
        Fri, 29 Oct 2021 11:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vvM2Sar7hcaGuon53bxL2Osvqre/0BS+GlamH3/0uD4=;
        b=TumXUEdis0PbfsDDpB9Oqan9/brFym9R001g5a6xsMxx7csj3I0OTJwNZFkjaJKVsv
         XmoQTNPIsvgnXvDTMuh9h4nOAOxy1Ddavtn30NqvWIpB4eBEqr8/ayiCBPMvH+OjtDgF
         UinDaM5uEXmv3XC5c+A2CoTBA/7Y+0M/+pEZ4zfvu5rP63odDoY4/Qr0MOgrBPJKPRwY
         30CqONRnlkzR0ECEQKlZ/1yUXnEVpQD5XUGbs51NI7/lrXbSMK4lHtChroV9iBZ8XQRC
         3RSMyjQqq85z+IAxE/sNi9XuOUkT+PwlKogyHyfd/OZysD+GlfCkt1l7k9rhqNa3b4Bw
         7dUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vvM2Sar7hcaGuon53bxL2Osvqre/0BS+GlamH3/0uD4=;
        b=UiVSSLsDjIu40vt9vjFWX4ejgZ8Q51Q9fdGDNzaRSRakFOZyauPtwq0zQVRK1TmiDU
         /jbb/3vXVeZ06+K3eKSwdxJ2j/OTwhgTcMyjb2uTrE7BMhbgq6F2xTBSEwTyrkLiGi4Q
         fBtzDMuAVz72W76ZPPU7rhsAPC36uAzKSBXIwhYGHRZR5kz+RcH6x6FTaAL9waexZ1dY
         Cg9ykmYoZU5wbeyRpWlcyjdxWI14rYVdZzZ2vK78EhnWrr1ILvJqBlxptAvEjwapWsKz
         8Er5WE5EIEcUHcAWxaNUnzOhHo/5P9uxAqetw6i4cBDguAfB4QnFwzyv7Uky30k5w8B1
         dLMA==
X-Gm-Message-State: AOAM532rGyWz+kRPsCO+Hs7jIwl49X2sf1QsNo86oTaycQ0oODd/nowC
        fASeVlysjuBfGj77aJLHmxc23Lgjnp8=
X-Google-Smtp-Source: ABdhPJzdPna22Yv/r528q9JQDocCBgtZZE1clqR9uqpTqaW27sk/6EtHgGXU0nindYJb6wqc12FCwA==
X-Received: by 2002:a05:6830:1f55:: with SMTP id u21mr9808311oth.233.1635531054969;
        Fri, 29 Oct 2021 11:10:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c17sm1900458oom.33.2021.10.29.11.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 11:10:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211028093059.32535-1-zajec5@gmail.com>
 <20211028093059.32535-3-zajec5@gmail.com>
 <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
 <9d57d026-19f3-e92d-4c02-d7e8e2c2bc25@gmail.com>
 <YXvxMHmx2i56sXdI@robh.at.kernel.org>
 <1df7e7cd-aa4c-c692-ff7f-8ee27780a6a9@gmail.com>
 <a14d1265-9e8f-6011-3f34-0881c0c49dd5@roeck-us.net>
 <5d5b6fbb-6ba4-088c-ad9b-a2698c23f751@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
Message-ID: <6c057f80-77af-aa4c-cdcc-a89d92f3e9cc@roeck-us.net>
Date:   Fri, 29 Oct 2021 11:10:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5d5b6fbb-6ba4-088c-ad9b-a2698c23f751@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/29/21 10:53 AM, Florian Fainelli wrote:
> On 10/29/21 10:43 AM, Guenter Roeck wrote:
>> On 10/29/21 9:45 AM, Florian Fainelli wrote:
>>> On 10/29/21 6:03 AM, Rob Herring wrote:
>>>> On Fri, Oct 29, 2021 at 01:39:02PM +0200, Rafał Miłecki wrote:
>>>>> [Rob: please kindly comment on this]
>>>>>
>>>>> On 28.10.2021 18:29, Florian Fainelli wrote:
>>>>>> On 10/28/21 2:30 AM, Rafał Miłecki wrote:
>>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>
>>>>>>> Hardware supported by this driver goes back to the old bcm63xx
>>>>>>> days. It
>>>>>>> was then reused in BCM7038 and later also in BCM4908.
>>>>>>>
>>>>>>> Depending on SoC model registers layout differs a bit. This commit
>>>>>>> introduces support for per-chipset registers offsets & adds BCM4908
>>>>>>> layout.
>>>>>>>
>>>>>>> Later on BCM63xx SoCs support should be added too (probably as
>>>>>>> platform
>>>>>>> devices due to missing DT). Eventually this driver should replace
>>>>>>> bcm63xx_wdt.c.
>>>>>>>
>>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>>> ---
>>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>> +
>>>>>>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>>>>>>> +    [BCM63XX_WDT_REG_DEFVAL]    = 0x28,
>>>>>>> +    [BCM63XX_WDT_REG_CTL]        = 0x2c,
>>>>>>> +    [BCM63XX_WDT_REG_SOFTRESET]    = 0x34,
>>>>>>
>>>>>> I don't understand what you are doing here and why you are not
>>>>>> offsetting the "reg" property appropriately when you create your
>>>>>> bcm4908-wdt Device Tree node such that the base starts at 0, and the
>>>>>> existing driver becomes usable as-is. This does not make any sense
>>>>>> to me
>>>>>> when it is obviously the simplest way to make the driver "accept" the
>>>>>> resource being passed.
>>>>>
>>>>> I believe that DT binding should cover the whole hardware block and
>>>>> describe it (here: use proper compatible to allow recognizing block
>>>>> variant).
>>>>>
>>>>> That's because (as far as I understand) DT should be used to describe
>>>>> hardware as closely as possible. I think it shouldn't be adjusted to
>>>>> make mapping match Linux's driver implementation.
>>>>>
>>>>>
>>>>> So if:
>>>>> 1. Hardware block is mapped at 0xff800400
>>>>> 2. It has interesting registers at 0xff800428 and 0xff80042c
>>>>>
>>>>> I think mapping should use:
>>>>> reg = <0xff800400 0x3c>;
>>>>> even if we don't use the first N registers.
>>>>>
>>>>> That way, at some point, you can extend Linux (or whatever) driver to
>>>>> use extra registers without reworking the whole binding. That's why I
>>>>> think we need to map whole hardware block & handle different registers
>>>>> layouts in a driver.
>>>>
>>>> Yes, that's the correct thing to do.
>>>
>>> So in the future if we happen to want to manage the hardware timers in
>>> that block, they would be part of the watchdog driver? I am fairly sure
>>> they won't be, so you will be creating a composite driver/MFD to
>>> separate out the functions, more likely. So you might as well create
>>> sub-nodes.
>>>
>>>>
>>>> The question is whether you'd need sub nodes for the other functions.
>>>> Folks tend to want to have sub nodes for convenience which isn't really
>>>> needed and then requires a DT update ('cause they add nodes as adding
>>>> drivers).
>>>
>>> Sorry but not, this is getting completely ridiculous, the
>>>
>>>>
>>>> Based on the registers, you really don't need sub nodes here.
>>>
>>> I sort of disagree here, the watchdog is a part of a sundry timer block
>>> here, but it is logically broken up into different parts and if if I
>>> were to imagine how this would map into different drivers, I can easily
>>> see that we would have:
>>>
>>> - a driver to manage the timer interrupt controller
>>> - a driver to manage each of the 3 hardware timers, be they clockevent
>>> or else
>>> - a driver to manage the watchdog
>>>
>>> The simplest way to get there, and also because these same timer blocks
>>> are actually spread in other parts of STB chips just like the watchdog
>>> is, but in a different layout where they stand on their own was the main
>>> drive for defining the bcm7038_wdt binding the way it was.
>>>
>>> Rafal, I appreciate that you are trying to leverage the bcm7038_wdt
>>> driver and this is better than the previous patch set, but I really do
>>> not see why having the watchdog driver not manage the *exact* subset of
>>> the register space needed (starting at 0x28) is not being done.
>>
>> Agreed, especially since other sub-devices of bcm4908 are alredy modeled
>> this way. See arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi.
>> At this point, before accepting anything, I'll want to have an explanation
>> how and why the watchdog interface is handled differently than, say,
>> its reset controller. Also, I'd like to understand the memory region
>> assigned to bcm7038, which happens to be something like:
>>
>>      compatible = "brcm,bcm7038-wdt";
>>          reg = <0xf040a7e8 0x16>;
>>
>> because it seems unlikely that this is a chip subsystem that just happens
>> to start at such an odd boundary. More specifically, I see in actual
>> .dtsi files data such as:
>>
>>                  watchdog: watchdog@4066a8 {
>>                          clocks = <&upg_clk>;
>>                          compatible = "brcm,bcm7038-wdt";
>>                          reg = <0x4066a8 0x14>;
>>                          status = "disabled";
>>                  };
>> ...
>>                  timers: timer@406680 {
>>                          compatible = "brcm,brcmstb-timers";
>>                          reg = <0x406680 0x40>;
>>                  };
>>
>> So there happen to be timers in the same region, and the offset
>> between timer and watchdog registers is 0x28. Coincidentally, that
>> just happens to be the extra offset defined in this patch for the
>> bcm4908 watchdog. Really ? Sorry, this sounds very inconsistent
>> and arbitrary to me.
> 
> To Rafal's defense, we could have defined the bcm7038-wdt binding such
> that the watchdog would have been at 0x28 from the beginning of the
> timer block, but as I wrote earlier, that same watchdog which is really
> just 8 bytes worth of register is sometimes instantiated on its own
> without the rest of the timer block. This is not visible in a DTS that
> is upstream but it does happen in some of the Cable Modem chips. That
> was the main motivation for defining the binding the way it was, such
> that we could just map those 8 bytes wherever they are.
> 
>>
>> Overall, I suspect I'll have to see datasheets if we really end up
>> having different offsets for each chip, because I'll want to confirm
>> that the watchdog subsystem isn't treated differently than other
>> subsystems, and that the offset calculations are appropriate and
>> consistent across the different chips.
> 
> Datasheets are not public however sharing the structures documenting the
> register layout is something that is possible. For consistency, if we do
> let 4908 define the watchdog to include that 0x28 offset, then we are
> not mapping just the watchdog, but the entire timer block, which then
> raises the question of what happens to the timer interrupt enable/status
> and timer registers, how do we end-up sub-dividing that register space
> in a logical manner.
> 

I can only see me accepting that if it is consistent across chips.
I am perfectly fine with using that offset and including the timer region,
but then you'd have to change the code and devicetree files for existing
chips as well to be consistent across chips. I can not see that happening.

To me it seems that the rules for assigning memory regions in devicetree
files are being changed, and the brunt of those changes is pushed into
driver code, making it messy (plus, it would create messy devicetree files,
some including the offset and some not). I do not think this is a good idea,
and I strongly object to it. I don't mind if rules are changed, but please
do it for new chips and bindings, chips which require new drivers, not
when adding devices to existing bindings.

Guenter
