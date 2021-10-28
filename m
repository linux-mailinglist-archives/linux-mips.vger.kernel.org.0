Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF53E43E6B2
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 18:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhJ1RAO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJ1RAO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:00:14 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32524C061570;
        Thu, 28 Oct 2021 09:57:47 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so9564842otg.0;
        Thu, 28 Oct 2021 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0UK2vbdT0X4ap39M2tD9w4zH89c+ahlrON/2EDMLDT0=;
        b=GSD8KHQW+MvVegzYztDKybCvE3H4frzOgorObGphuh88D+3iCZolajunPdhjLsF610
         0LxDOsJzVCimX4sNeHdm0yZNetfrL11vDSLTbUrc07FvHUx50xbjmX2Npg4UwkcipjF1
         fvKqiVpaDxjqsK5JQTQCuINSAezvRlErpu33z+HTXWr/h52eEshWhLN24TBwSg6MLXmA
         260Ed/V1qeKwIgyD7TPRuCFnNn9CTZ0pbJiltrIKZArI0ATe2S3GJUrXle/F5yM/F8dO
         yokc9wSWwI33KtsPlzub56hbXWvxfvbcC+fLWoy3FJDGdOKKvM08vwe9jsq4Mx8o3VC3
         qtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0UK2vbdT0X4ap39M2tD9w4zH89c+ahlrON/2EDMLDT0=;
        b=T6a7o5Z5IUbkDjeNuRgAFcUbmLmonIfsOOIzk49+0Td6NKDrnMUcMzD4FWrXQb4ot9
         AWA37UlRstSZG8P1cYdCkkUYh2dIBmfwkUIpXLHZ6uRbi3LI1x03j7LYEF87j5grwpH1
         IO+outxNuBNfCuWpIKC8VtYvcaYpyGHv51DPdbVbh5PT5uDbCz0qaTM++LLQgXuFKILp
         fUC/MVdWuzldedws7D5iYgaHkfxArfS197kUt41scEjiR/AfCBJm/YRpKlge8AgGRB9n
         UZ0yzyxWLQ/9/k3pTlSnkRv2+EhIzieHhfz0OAt5Afb+V45YG9oZBvGwbfRaXJhUFldO
         NVow==
X-Gm-Message-State: AOAM533Ctar0OX0bus01eJOIGd9i9yLMpJ/r2fsvZR9Db25uONiZs3bW
        nrsFl9Uo83axSC1cTKEXjbdCe2STGz0=
X-Google-Smtp-Source: ABdhPJw/0L9Nzn89I9YK2ErLOHAi/8HUCBXzLV0+SaeVffHZ+pEKeTJV0TYLutalxJs8jgk1TgK1sQ==
X-Received: by 2002:a9d:764c:: with SMTP id o12mr4459795otl.129.1635440266374;
        Thu, 28 Oct 2021 09:57:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bn13sm1094836oib.37.2021.10.28.09.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 09:57:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
Message-ID: <ce6ccb22-a81c-336e-4b2e-44f9ad6de246@roeck-us.net>
Date:   Thu, 28 Oct 2021 09:57:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/28/21 9:29 AM, Florian Fainelli wrote:
> On 10/28/21 2:30 AM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Hardware supported by this driver goes back to the old bcm63xx days. It
>> was then reused in BCM7038 and later also in BCM4908.
>>
>> Depending on SoC model registers layout differs a bit. This commit
>> introduces support for per-chipset registers offsets & adds BCM4908
>> layout.
>>
>> Later on BCM63xx SoCs support should be added too (probably as platform
>> devices due to missing DT). Eventually this driver should replace
>> bcm63xx_wdt.c.
>>
Seems unrelated / irrelevant in this commit log, except maybe after '---'.

>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
> 
> [snip]
> 
>> +
>> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
>> +	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,

REG_DEFVAL is an odd name for this register. I can see that the
bcm63xx driver uses it, but in reality it seems to be the timeout
value, not some default value, only the bcm63xx driver doesn't
seem to use it properly. I think REG_TIMEOUT or similar would
be a much better name.

>> +	[BCM63XX_WDT_REG_CTL]		= 0x2c,
>> +	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,
> 
> I don't understand what you are doing here and why you are not
> offsetting the "reg" property appropriately when you create your
> bcm4908-wdt Device Tree node such that the base starts at 0, and the
> existing driver becomes usable as-is. This does not make any sense to me
> when it is obviously the simplest way to make the driver "accept" the
> resource being passed.
> 

Agreed. This adds a lot of complexity that could be avoided.

> I am going to send my patch series converting the bcm63xx_wdt.c driver
> over to bcm7038_wdt.c, feel free to use or discard it.
> 
For my part I am very much looking forward to it.

Guenter
