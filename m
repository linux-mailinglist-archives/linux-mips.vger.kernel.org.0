Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6A43BC1B5
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 18:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhGEQfd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Jul 2021 12:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhGEQfc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Jul 2021 12:35:32 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097E8C061574;
        Mon,  5 Jul 2021 09:32:55 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id f12-20020a056830204cb029048bcf4c6bd9so6745641otp.8;
        Mon, 05 Jul 2021 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Aqvkw1lY3fhwqDao9mNSUZTesdZ4dEBF2KprX5GlTbk=;
        b=WPYXDu6AbKNfwfmTxx5U5jowbTWNLNWHY4v/88chMI5ESGrMkCZpvCNQXVxv25O2r1
         R3EwQQxcbycHCs0RvBG5SXZ+eLv9uEaF6zT9ieQmMFPjrhzJo84NUnEUy3/yf4UaRl6a
         /yEcoIdabu2cwZLDsUFAYnHezDBU1AiQxQJSxlZ1TG4PjexDi61NBQjjADW+Zwk6N/mn
         +zbAXxUqMtEgsff6klulYR2TklVXVu5/07WFYWlTNz7JqbT1dnM5bM5BHkBtqAm/8ZQe
         0M0ecK2ZrKUOxScqXPjaCTOEeYxYWmuM11QsQFT1alS/bJ4qHWqhk3FfI7XcV56sgmkx
         twhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Aqvkw1lY3fhwqDao9mNSUZTesdZ4dEBF2KprX5GlTbk=;
        b=KGjanAhRZogPtQ03HsrNjDIO2W6uydKfEEcOdVBR/Te+ewpDTQxOhr0467yKHGeOZI
         iIOkxAN/astpQmzgw8jqXYF3Qbr4pm+1uV/4foS8GVg4BCQzow0neAiY6Z64VDz10xZL
         leYrRmCzdPNcR6HKRdVgcf7A9bccv/u7DaGfRi6rOWIrUNPmIGQYY/sEfGPPDyawnOuB
         mMfEDVtPaRN14LNz3tXREySco85l17MbeN8Lv01bnZUajMr/BgOyinTrAu+A40Hjihwx
         /YvUKvB0/Uxnfj4A7JC8pg0nLgWFbtZn6BlwTdj3WIoKo/dJPD13n8NjakeHQk0g3vOE
         3bRA==
X-Gm-Message-State: AOAM5310zFGzAU8VrIP4tybDHPGFFsGG8tcWlNB5wjVcIYS+9q4aEvG0
        YD/MxZJNLXbqzhNoXCeZAyw=
X-Google-Smtp-Source: ABdhPJyN7tjO8+xSwA7xOIkPWV9HQrPkeILuHIp+1Cp3hrTR1y16AJ1az2LbQ+eyu36luMml77Ixyw==
X-Received: by 2002:a05:6830:1386:: with SMTP id d6mr11219313otq.115.1625502774349;
        Mon, 05 Jul 2021 09:32:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x198sm1001722oif.23.2021.07.05.09.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 09:32:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
        Lee Jones <lee.jones@linaro.org>,
        kernel test robot <lkp@intel.com>
References: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
 <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
 <a15e7f62-12a0-1ec7-5104-f01f9e3eccc7@canonical.com>
 <9d98ec40-757d-28c7-1669-a683b2cd3881@canonical.com>
 <b87bbb80-ed02-447d-f778-7997848731cd@roeck-us.net>
 <CA+Eumj4aZZPFFB-3PEeBVo6fXW_Fz97oswA3pZuu2aiysnp=nQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
Message-ID: <7fd17c09-5801-58d5-1b26-c67babcd90e0@roeck-us.net>
Date:   Mon, 5 Jul 2021 09:32:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+Eumj4aZZPFFB-3PEeBVo6fXW_Fz97oswA3pZuu2aiysnp=nQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/5/21 9:21 AM, Krzysztof Kozlowski wrote:
> On Mon, 5 Jul 2021 at 18:08, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 7/5/21 8:15 AM, Krzysztof Kozlowski wrote:
>>> On 14/05/2021 16:04, Krzysztof Kozlowski wrote:
>>>> On 14/05/2021 09:48, Guenter Roeck wrote:
>>>>> On 5/14/21 6:17 AM, Krzysztof Kozlowski wrote:
>>>>>> When rt2880_wdt watchdog driver is built as a module, the
>>>>>> rt_sysc_membase needs to be exported (it is being used via inlined
>>>>>> rt_sysc_r32):
>>>>>>
>>>>>>      ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
>>>>>>
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>>>
>>>>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>>>>
>>>>> I don't see a recent change in the code. Has that problem been there
>>>>> all along ?
>>>>
>>>> I think the problem was there always but 0-day builder did not hit it
>>>> until recently:
>>>> https://lore.kernel.org/lkml/202105082122.yrF7ploN-lkp@intel.com/
>>>
>>> Hi Guenter,
>>>
>>> It seems that patch was not applied. Anything to fix here?
>>>
>> I see commit fef532ea0cd8 ("MIPS: ralink: export rt_sysc_membase for
>> rt2880_wdt.c"). Does that not solve the problem ?
> 
> Yes, that fixes it. It was sent later, though. :(
> 

Happens to me all the time. What is important is that things are getting
fixed. Personally I don't care that much for the credit.

Note though that your patch subject was a bit misleading, and it may well
be possible that the mips maintainers didn't realize that the fix needed
to be applied to the mips tree. The subject line in the applied patch
describes the change much better as it focuses on the change (what is done),
while the subject line in your patch focuses on the impact (what it fixes).

Guenter
