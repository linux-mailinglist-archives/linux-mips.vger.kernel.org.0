Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA5B43FE4E
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 16:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhJ2OV0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 10:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhJ2OVU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 10:21:20 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A9AC061570;
        Fri, 29 Oct 2021 07:18:50 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u21so21361734lff.8;
        Fri, 29 Oct 2021 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=F7QSFpbcFbt/cSbxiQTnO2fYzTtjzgpmtOyFBj3FFAo=;
        b=DScG9cuNNf8VCcYkbT/HJDfXy7ZCnXDO7ntohcJJJqGYo3AFDTvH+TuU17qzEt3Nef
         Zz1HuSdEyy3V8xSg95k5fSxIcxKDDSZrVMQBa7ZVSFL/44pu/F2RJcCrwnLCFG5mBizk
         ptIrQVu9BwDmeMSyeCyTlck7MByAhksLXVLNmJEtXcst0o9yycyyyx2oGwJHy6QvPV7F
         dp3gAEWFe5nuVQLjembGM4MIDXeBXQ0UHCgbz58heMdqr3o87jS8HBSCaKIu5vqWHDdQ
         8cHMKcXv7g4/c9W2n4WCOKwVlZK0IpsObr0bdB/y4OExl2xBky5OQ6vHn0NhI04cO61G
         F0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=F7QSFpbcFbt/cSbxiQTnO2fYzTtjzgpmtOyFBj3FFAo=;
        b=VKDtB2S5w7lwMk92ItTNZa6GJAUmShxGGsXB0z/FgMkgvYpQWz0fgSO9g0XJCUCV+R
         xF154mk++MVNpAVrgOhVSgblmHSN1RyUnC6Lo3yNMCVFHj/EC5jJEoeZ/bhQLt7+Lw1m
         hGOBJIunzar6YSGdUzdZBLuqtLS6HOquQ6ZsXwrqbdE47/qK5soO46cw6bDXRXYHDwJS
         svEZaj6Duh7ZLhjkUjWhPZ2QKU06icagW068uXrDTlBmPfGWfsEfyb0QOHjA7pOjMCRg
         5iTEH62hxV5WPLXBWrOU0NpLfN9x7ff9Xv1f5LE/kA7WnEkqc/YgNVFYDZFRMHl194c+
         bbNA==
X-Gm-Message-State: AOAM531NvnDXnrsCHcUk2FK4pOf/4oX60PjZtCiSuJXOf6Dijwd+SS89
        sVZc7Q6H6TnNkv4q4Wvd/hg=
X-Google-Smtp-Source: ABdhPJw8KVI8RagdGalgSGcRdHcLGg5b4b+dTqlapI1mwzryNnpjks/J+B9EC0HiK8yDwvCfKHJSLw==
X-Received: by 2002:ac2:4acf:: with SMTP id m15mr10741519lfp.581.1635517129043;
        Fri, 29 Oct 2021 07:18:49 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id s5sm385497lfi.7.2021.10.29.07.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 07:18:48 -0700 (PDT)
Message-ID: <034037ed-6dee-7c81-ebf6-fdd4d884112a@gmail.com>
Date:   Fri, 29 Oct 2021 16:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211028093059.32535-1-zajec5@gmail.com>
 <20211028093059.32535-3-zajec5@gmail.com>
 <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
 <ce6ccb22-a81c-336e-4b2e-44f9ad6de246@roeck-us.net>
 <578ae650-e5c0-cb86-8f34-18736e5d9239@gmail.com>
 <fb697712-9ced-04b2-f364-98027da09744@roeck-us.net>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <fb697712-9ced-04b2-f364-98027da09744@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29.10.2021 16:15, Guenter Roeck wrote:
> On 10/29/21 5:15 AM, Rafał Miłecki wrote:
>> On 28.10.2021 18:57, Guenter Roeck wrote:
>>> On 10/28/21 9:29 AM, Florian Fainelli wrote:
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
>>> Seems unrelated / irrelevant in this commit log, except maybe after '---'.
>>>
>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>> ---
>>>>
>>>> [snip]
>>>>
>>>>> +
>>>>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>>>>> +    [BCM63XX_WDT_REG_DEFVAL]    = 0x28,
>>>
>>> REG_DEFVAL is an odd name for this register. I can see that the
>>> bcm63xx driver uses it, but in reality it seems to be the timeout
>>> value, not some default value, only the bcm63xx driver doesn't
>>> seem to use it properly. I think REG_TIMEOUT or similar would
>>> be a much better name.
>>
>> I used name used in Broadcom's SDK (and as I guess also in their
>> documentation too).
>>
>> Take a look at this BCM60333 example:
>>
>> typedef struct Timer {
>>      uint32    TimerInts;        /* 0x00 */
>>      uint32    TimerCtl0;        /* 0x04 */
>>      uint32    TimerCtl1;        /* 0x08 */
>>      uint32    TimerCtl2;        /* 0x0c */
>>      uint32    TimerCnt0;        /* 0x10 */
>>      uint32    TimerCnt1;        /* 0x14 */
>>      uint32    TimerCnt2;        /* 0x18 */
>>      uint32    WatchDogDefCount;    /* 0x1c */
>>      uint32    WatchDogCtl;        /* 0x20 */
>>      uint32    WDResetCount;        /* 0x24 */
>> } Timer;
>>
>> I got impression that Linux driver registers names usually follow what
>> is used in hardware documentation.
> 
> Still, the key part of the register name is "Count", not "Def",
> and there is no "val" in there.

Absolutely right. No idea where did I take it from and how did I miss that.

