Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16CC43FE43
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 16:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJ2OSC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 10:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhJ2OSC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 10:18:02 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D3FC061570;
        Fri, 29 Oct 2021 07:15:33 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so7904596otj.11;
        Fri, 29 Oct 2021 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FjeCrfz/SMAAKTGgFnHdWUsg4jTPPYQ7mbdQ7GGvHvM=;
        b=aDJK42Tr7SOfamQgbJYbFeVTFe1tQ7jhZsu/bJuH5OH99LuDU1KKvjtp3BKBhCOsb4
         teIrlzB+AINF3n8xvk0RqbYFGDtDotVpVS0jq59JHWf5LoSqDN7ZumbXHQkqklD38seK
         gMTqmIhFBJXoiKISuqtAYAztu4OSrVaTDnc8cKTyU7ZCdsniysIXuiRjW/tm4Vr5OfG0
         NZ/ykVa45QceSKSAHXvvSbVxFIhUytH3qma7NNO/L37FmlFkAxEo98UBOAwB31dNZogj
         KyEHlbv3MlA9ZoNxi0OiFiEaeDn7uAeDH1VQBrI+PPnUm3/Q4JzPIucq9zBxyB7PcfLF
         QBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FjeCrfz/SMAAKTGgFnHdWUsg4jTPPYQ7mbdQ7GGvHvM=;
        b=XudEVIkMr9x3XtSDXUuH89qFhXivTbQoCMVafrWYUu6UwjRhZWpHcn0gQ7DpipQgej
         KJszFnuztMywffxCDR+7xa6BbMwN6Opfo5xp6mBhESVwMLltSK0xQhbrRiFFXm0rcBXo
         MEdm74z9YTeDcnBFjjv+0jmx3oro25xawvFJy0r1NsVP7HZ7sAzT7OvUpxcqTLqa0ico
         +G0Drs06F0OddppVSmrcgftWRfVhI9qD+sKNVeIAPSWmc08e2pQX+4ZK4Pf2Dy0+h4pi
         f0M77Nt7dnTWN7QJlbVdD24t1QT+IyGB7r3lj3ftGJQUzVH1KNQ4IwwrWgtttXLYOebp
         rIPA==
X-Gm-Message-State: AOAM533ehIiQrCgMVE5qd3TB/1MO3BHMXl79+yj6gSC/cjIRDHBSJT/9
        iKa4nh3+JejCl67QUTIA5fI=
X-Google-Smtp-Source: ABdhPJxlU05xYxtD/CSwsg02wBXYZLunfmb3e5xa2B76SsDlD8R04iaKh7vf073LjxlNQGmqwfLoSg==
X-Received: by 2002:a9d:748b:: with SMTP id t11mr8881816otk.151.1635516933250;
        Fri, 29 Oct 2021 07:15:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm2038496otu.59.2021.10.29.07.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 07:15:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <fb697712-9ced-04b2-f364-98027da09744@roeck-us.net>
Date:   Fri, 29 Oct 2021 07:15:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <578ae650-e5c0-cb86-8f34-18736e5d9239@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/29/21 5:15 AM, Rafał Miłecki wrote:
> On 28.10.2021 18:57, Guenter Roeck wrote:
>> On 10/28/21 9:29 AM, Florian Fainelli wrote:
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
>> Seems unrelated / irrelevant in this commit log, except maybe after '---'.
>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>
>>> [snip]
>>>
>>>> +
>>>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>>>> +    [BCM63XX_WDT_REG_DEFVAL]    = 0x28,
>>
>> REG_DEFVAL is an odd name for this register. I can see that the
>> bcm63xx driver uses it, but in reality it seems to be the timeout
>> value, not some default value, only the bcm63xx driver doesn't
>> seem to use it properly. I think REG_TIMEOUT or similar would
>> be a much better name.
> 
> I used name used in Broadcom's SDK (and as I guess also in their
> documentation too).
> 
> Take a look at this BCM60333 example:
> 
> typedef struct Timer {
>      uint32    TimerInts;        /* 0x00 */
>      uint32    TimerCtl0;        /* 0x04 */
>      uint32    TimerCtl1;        /* 0x08 */
>      uint32    TimerCtl2;        /* 0x0c */
>      uint32    TimerCnt0;        /* 0x10 */
>      uint32    TimerCnt1;        /* 0x14 */
>      uint32    TimerCnt2;        /* 0x18 */
>      uint32    WatchDogDefCount;    /* 0x1c */
>      uint32    WatchDogCtl;        /* 0x20 */
>      uint32    WDResetCount;        /* 0x24 */
> } Timer;
> 
> I got impression that Linux driver registers names usually follow what
> is used in hardware documentation.

Still, the key part of the register name is "Count", not "Def",
and there is no "val" in there.

Guenter
