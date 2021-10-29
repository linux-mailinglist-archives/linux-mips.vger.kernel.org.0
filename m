Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D914400C5
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 18:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhJ2Q6u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 12:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhJ2Q6t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 12:58:49 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1210BC061570;
        Fri, 29 Oct 2021 09:56:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i13so12693933lfe.4;
        Fri, 29 Oct 2021 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=TIWvEmA6S0hEGsxd95Qnjs7UTBzd6Hsx0TVASRvQ0hM=;
        b=VpyWtXHsDP6xs3T24b8bG2Gb0jksaH2nqRTgXbGWnIGBDjYqO0XIC4AnS/vaWrArVG
         slhdrhsbz7AxC5j85TpJ9ak/wvnAknUnbvXsu8TdpFKRwKX8iyWeLa5fwLlQypl6VLTC
         A6Xzqhp3iLULhLMp2yvfRj82g7QzHwxT7+QQ+NbmO0DYZYSqXNe3sdQ7vINr2egUJchD
         sw9I/1N+YUodh3jdkyLFGeuRnIkwUcUqDZ8Sh1phCPfFRe1+y6lbW9VDIZyB8dm1PT4T
         y+UT3rsCKacK+Aqy1Sq6Q+7QDzeoaVPZMxXoacZp+az+Cdf3PIPEHrJX7q9z84B+mD1A
         bw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TIWvEmA6S0hEGsxd95Qnjs7UTBzd6Hsx0TVASRvQ0hM=;
        b=IbYfqbb5YDhnttsv9AMOKLPyRcFSOQujDAq9iZ3ChaC5nlqU42Xm7CtEedMS2+pN3t
         HgHyra9VmR4+yEP1wFqDFTv2rqApQUWkFQ5xQ+62EzviNyzT/LY10EN300a7YwPt8Er1
         UhDbV/kQxlU+c4NH4FVARxzN7XKW7UxV9DUpG2fja+5+s1Q75BQyeLHpEoEWNQ7tbJWu
         tXiVxDM2TdMevwqXtTiWgWMs556dm1VAUnXk+6ToiFGpp+j6djMsj02LZ29gSVudFaHK
         x5SUyWkRnbgJdVnTmE3St/1vhY7MX5nurkBL+dYRe3uhi+ZoL1TtV8OHC6SVkfKGB2qX
         D8xA==
X-Gm-Message-State: AOAM5332fVJPhNv24dIT3gxwB0fwsh8TI3v4sShhOyO9v5/0g8T9rkLX
        JlCnNtXcrsU89thRVufIHBc=
X-Google-Smtp-Source: ABdhPJzQ8KIDOQACbr9zq7NCP8qBbOhOUi2YsKK3t4X/cnIeaIiR518qFFGdD0WlYAfJSb1hmdFNnQ==
X-Received: by 2002:a05:6512:2355:: with SMTP id p21mr10019278lfu.428.1635526579441;
        Fri, 29 Oct 2021 09:56:19 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id u14sm300817lfo.221.2021.10.29.09.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 09:56:18 -0700 (PDT)
Message-ID: <d16f78c4-ef20-54fc-6ee7-3b63ceb2fef1@gmail.com>
Date:   Fri, 29 Oct 2021 18:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
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
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1df7e7cd-aa4c-c692-ff7f-8ee27780a6a9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29.10.2021 18:45, Florian Fainelli wrote:
> On 10/29/21 6:03 AM, Rob Herring wrote:
>> On Fri, Oct 29, 2021 at 01:39:02PM +0200, Rafał Miłecki wrote:
>>> [Rob: please kindly comment on this]
>>>
>>> On 28.10.2021 18:29, Florian Fainelli wrote:
>>>> On 10/28/21 2:30 AM, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>
>>>>> Hardware supported by this driver goes back to the old bcm63xx days. It
>>>>> was then reused in BCM7038 and later also in BCM4908.
>>>>>
>>>>> Depending on SoC model registers layout differs a bit. This commit
>>>>> introduces support for per-chipset registers offsets & adds BCM4908
>>>>> layout.
>>>>>
>>>>> Later on BCM63xx SoCs support should be added too (probably as platform
>>>>> devices due to missing DT). Eventually this driver should replace
>>>>> bcm63xx_wdt.c.
>>>>>
>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>> ---
>>>>
>>>> [snip]
>>>>
>>>>> +
>>>>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>>>>> +	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,
>>>>> +	[BCM63XX_WDT_REG_CTL]		= 0x2c,
>>>>> +	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,
>>>>
>>>> I don't understand what you are doing here and why you are not
>>>> offsetting the "reg" property appropriately when you create your
>>>> bcm4908-wdt Device Tree node such that the base starts at 0, and the
>>>> existing driver becomes usable as-is. This does not make any sense to me
>>>> when it is obviously the simplest way to make the driver "accept" the
>>>> resource being passed.
>>>
>>> I believe that DT binding should cover the whole hardware block and
>>> describe it (here: use proper compatible to allow recognizing block
>>> variant).
>>>
>>> That's because (as far as I understand) DT should be used to describe
>>> hardware as closely as possible. I think it shouldn't be adjusted to
>>> make mapping match Linux's driver implementation.
>>>
>>>
>>> So if:
>>> 1. Hardware block is mapped at 0xff800400
>>> 2. It has interesting registers at 0xff800428 and 0xff80042c
>>>
>>> I think mapping should use:
>>> reg = <0xff800400 0x3c>;
>>> even if we don't use the first N registers.
>>>
>>> That way, at some point, you can extend Linux (or whatever) driver to
>>> use extra registers without reworking the whole binding. That's why I
>>> think we need to map whole hardware block & handle different registers
>>> layouts in a driver.
>>
>> Yes, that's the correct thing to do.
> 
> So in the future if we happen to want to manage the hardware timers in
> that block, they would be part of the watchdog driver? I am fairly sure
> they won't be, so you will be creating a composite driver/MFD to
> separate out the functions, more likely. So you might as well create
> sub-nodes.
> 
>>
>> The question is whether you'd need sub nodes for the other functions.
>> Folks tend to want to have sub nodes for convenience which isn't really
>> needed and then requires a DT update ('cause they add nodes as adding
>> drivers).
> 
> Sorry but not, this is getting completely ridiculous, the
> 
>>
>> Based on the registers, you really don't need sub nodes here.
> 
> I sort of disagree here, the watchdog is a part of a sundry timer block
> here, but it is logically broken up into different parts and if if I
> were to imagine how this would map into different drivers, I can easily
> see that we would have:
> 
> - a driver to manage the timer interrupt controller
> - a driver to manage each of the 3 hardware timers, be they clockevent
> or else
> - a driver to manage the watchdog
> 
> The simplest way to get there, and also because these same timer blocks
> are actually spread in other parts of STB chips just like the watchdog
> is, but in a different layout where they stand on their own was the main
> drive for defining the bcm7038_wdt binding the way it was.
> 
> Rafal, I appreciate that you are trying to leverage the bcm7038_wdt
> driver and this is better than the previous patch set, but I really do
> not see why having the watchdog driver not manage the *exact* subset of
> the register space needed (starting at 0x28) is not being done.

Sure, let's get this discussed before pushing my patches. I'm happy to
have you and Rob involved here. Once we get into agreement we can decide
how to proceed.
