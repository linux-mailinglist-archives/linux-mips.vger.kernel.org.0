Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7D7440083
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 18:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhJ2QsN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 12:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhJ2QsM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 12:48:12 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54491C061570;
        Fri, 29 Oct 2021 09:45:44 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id l1so3337879pfu.5;
        Fri, 29 Oct 2021 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LZugGOHIA7M2mY9thG3e663xJ8VDC6VN4707A7yp6kk=;
        b=PmjHIWqDZmT0dobSlGyGp7/HzK7zi2f478pFv3F7xEpXuJEUg4NpoGFDvrXHLdUh1Z
         dslI8ul0LAYgnSr0HbbRzIFZejthb2HLSic2gRE8Cn3K8s3/euuIyR6Jmy+GThJMTTSE
         3npX1FdMhhZG8VPyc/soHOkklZwiBReKPR/o6yFZP7qgLU5aVJHcHKXnqntxECwX+ZKo
         AqjtKVNUD4RDkYK0p6cFM/CxZGIV7VjTHk1Rla1nRdJUwdlWUre2ki7nQo6FNKZtLdCF
         G2y92i4cUgFdbasbMv3DdG09o4ZYGR1K2/zOAO8OqAQ8GbOBxWEa7+hQjJDT75MxeeRW
         rHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LZugGOHIA7M2mY9thG3e663xJ8VDC6VN4707A7yp6kk=;
        b=qparMR4hZvuPuZvhRCHT7mbqrstVus9BjJoKx8oc4T+t1Fo2cB177B/Wqa6qSXP3ii
         SaHUfQU7GXO/msehoHuwmpUrH7QBBLLWFTUU1gGeiWsOzKdeQwkyuxUo3D8rUk7FNtwp
         KTT7GF71qbK8PO95QRsF0/usKv9doE0ZFwfW0VG1UjrNpJYNz906kz/vVaGGYNpvI6GB
         xtmOBLPbW7Idm3mc3FYKfIJDiyC7Nv45lshGgTwtFS+3sOVWollLTj8jsVwF5izlp42Q
         ssq8voFPbjJ5lgKZWj8tA9vIQKoheDCjYUskhFwBwXrv4dOlna7QTUwHI9UcYpYu9UsI
         DyVw==
X-Gm-Message-State: AOAM533fY2bcHfAX/LOh8PFYl6IkmtfergQ+6oWofWEMMs2K4At3GGkB
        WvRZBer51OAlHT2c7+UXJ4Q=
X-Google-Smtp-Source: ABdhPJw7yL6uMrjTOUNYhN/1UQ4p/zTa44Abr2yg41XBrF2RtZPWkd0XWU4tJAfEJqiOzNEgu6zOug==
X-Received: by 2002:a05:6a00:2186:b0:473:5a61:a7f6 with SMTP id h6-20020a056a00218600b004735a61a7f6mr11881462pfi.15.1635525943754;
        Fri, 29 Oct 2021 09:45:43 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k18sm5997631pff.66.2021.10.29.09.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 09:45:43 -0700 (PDT)
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1df7e7cd-aa4c-c692-ff7f-8ee27780a6a9@gmail.com>
Date:   Fri, 29 Oct 2021 09:45:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXvxMHmx2i56sXdI@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/29/21 6:03 AM, Rob Herring wrote:
> On Fri, Oct 29, 2021 at 01:39:02PM +0200, Rafał Miłecki wrote:
>> [Rob: please kindly comment on this]
>>
>> On 28.10.2021 18:29, Florian Fainelli wrote:
>>> On 10/28/21 2:30 AM, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Hardware supported by this driver goes back to the old bcm63xx days. It
>>>> was then reused in BCM7038 and later also in BCM4908.
>>>>
>>>> Depending on SoC model registers layout differs a bit. This commit
>>>> introduces support for per-chipset registers offsets & adds BCM4908
>>>> layout.
>>>>
>>>> Later on BCM63xx SoCs support should be added too (probably as platform
>>>> devices due to missing DT). Eventually this driver should replace
>>>> bcm63xx_wdt.c.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>
>>> [snip]
>>>
>>>> +
>>>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>>>> +	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,
>>>> +	[BCM63XX_WDT_REG_CTL]		= 0x2c,
>>>> +	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,
>>>
>>> I don't understand what you are doing here and why you are not
>>> offsetting the "reg" property appropriately when you create your
>>> bcm4908-wdt Device Tree node such that the base starts at 0, and the
>>> existing driver becomes usable as-is. This does not make any sense to me
>>> when it is obviously the simplest way to make the driver "accept" the
>>> resource being passed.
>>
>> I believe that DT binding should cover the whole hardware block and
>> describe it (here: use proper compatible to allow recognizing block
>> variant).
>>
>> That's because (as far as I understand) DT should be used to describe
>> hardware as closely as possible. I think it shouldn't be adjusted to
>> make mapping match Linux's driver implementation.
>>
>>
>> So if:
>> 1. Hardware block is mapped at 0xff800400
>> 2. It has interesting registers at 0xff800428 and 0xff80042c
>>
>> I think mapping should use:
>> reg = <0xff800400 0x3c>;
>> even if we don't use the first N registers.
>>
>> That way, at some point, you can extend Linux (or whatever) driver to
>> use extra registers without reworking the whole binding. That's why I
>> think we need to map whole hardware block & handle different registers
>> layouts in a driver.
> 
> Yes, that's the correct thing to do.

So in the future if we happen to want to manage the hardware timers in
that block, they would be part of the watchdog driver? I am fairly sure
they won't be, so you will be creating a composite driver/MFD to
separate out the functions, more likely. So you might as well create
sub-nodes.

> 
> The question is whether you'd need sub nodes for the other functions. 
> Folks tend to want to have sub nodes for convenience which isn't really 
> needed and then requires a DT update ('cause they add nodes as adding 
> drivers).

Sorry but not, this is getting completely ridiculous, the

> 
> Based on the registers, you really don't need sub nodes here.

I sort of disagree here, the watchdog is a part of a sundry timer block
here, but it is logically broken up into different parts and if if I
were to imagine how this would map into different drivers, I can easily
see that we would have:

- a driver to manage the timer interrupt controller
- a driver to manage each of the 3 hardware timers, be they clockevent
or else
- a driver to manage the watchdog

The simplest way to get there, and also because these same timer blocks
are actually spread in other parts of STB chips just like the watchdog
is, but in a different layout where they stand on their own was the main
drive for defining the bcm7038_wdt binding the way it was.

Rafal, I appreciate that you are trying to leverage the bcm7038_wdt
driver and this is better than the previous patch set, but I really do
not see why having the watchdog driver not manage the *exact* subset of
the register space needed (starting at 0x28) is not being done.
--
Florian
