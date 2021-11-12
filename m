Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4738B44EF8A
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235989AbhKLWp4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233013AbhKLWpz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:45:55 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC58C061766;
        Fri, 12 Nov 2021 14:43:04 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id h63so2332172pgc.12;
        Fri, 12 Nov 2021 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MbtQ+ajorhyNAMJtElA+ShnQkX9WSq4VFHz7M8Bi/ZI=;
        b=p8H7XUOZLMiEYoeTtCso+KfKJDF/tKhUIP0BP3Bk5tzS9QaMIn4Mh0YvjKIyIMqHQi
         XnyyaT6QZ//eBmKJ3n25/bACFXQ4DsTuewkObgys59V5ASIoqy97necTgEV3IzES7tGg
         1B/B4h+Q7AYYOVp3iWDr3UUclRog/nSPRuk5BIXaFHfwzkfs8mLmatio8vX2HAQSWG29
         IDMbm9VYozH9mPXgb9BGGuTj+vTvA9cf4Tg8sTgIxPgUt8asa9TzXQ6FDQXa3jorYuUC
         ymcRG1wdu1bdRI387iuLfaZnokHynL7pZih4aFf0YDYZLraeuZzwLgVFhTBZ10UU3Atv
         DVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MbtQ+ajorhyNAMJtElA+ShnQkX9WSq4VFHz7M8Bi/ZI=;
        b=k0H0LsQI5NXlKdVUox7wzDu/rm5J67DEM1/egoxBCplR7YnlwCWORBG4VmAL6wXOeP
         Fdf2Fku/5yoeJnMDwnWSbkkczNWgIOAZb87ALHR0aiJCGdqEC6sLMg9emBWtGDSTAK+U
         8DaELO9CRHMN10KunC2DpSGvSCkuSxK60OdJFJoP5FKwsLvF+gZeMm8UhMJxcakzrAs8
         GkTXmanb3EwV86A4pOeC1ZnOR2lUSjvC4IG6cX75svLItOF6Ng4uyH9dwnc4zQBeMn3j
         kDY0MDkKCzmtM2SVETlT/setXs12bP7arnWOnRJ47kZlflPKMcGNSOYNyXV5CGQZAKPG
         /uww==
X-Gm-Message-State: AOAM5325+JrbsZdTT/F4cXPslvwhMMlFLjTEOVbswZ4ngAAklrauuxd6
        CBpvvWIz7MybIwQaaL98TPM=
X-Google-Smtp-Source: ABdhPJz3I5W2+eT1UJJ8EDLqKIDCHHKqkjxDJJ+gxXsw6S0BzCVebK/au9bAD/DJEwljkLxsX2qyYw==
X-Received: by 2002:a63:1d20:: with SMTP id d32mr12085041pgd.471.1636756983790;
        Fri, 12 Nov 2021 14:43:03 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id a8sm5643522pgh.84.2021.11.12.14.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 14:43:03 -0800 (PST)
Subject: Re: [PATCH v4 5/7] watchdog: bcm7038_wdt: Add platform device id for
 bcm63xx-wdt
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "maintainer:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Justin Chen <justinpopo6@gmail.com>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "moderated list:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
 <20211105154208.614260-6-f.fainelli@gmail.com>
 <f54640c8-941a-d4c2-822b-9b21bc134811@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f1b1919c-d2aa-5e15-374c-d7f1a1ca8c75@gmail.com>
Date:   Fri, 12 Nov 2021 14:43:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f54640c8-941a-d4c2-822b-9b21bc134811@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/9/21 2:38 AM, Rafał Miłecki wrote:
> On 05.11.2021 16:42, Florian Fainelli wrote:
>> In order to phase out bcm63xx_wdt and use bcm7038_wdt instead, introduce
>> a platform_device_id table that allows both names to be matched.
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/watchdog/bcm7038_wdt.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/watchdog/bcm7038_wdt.c
>> b/drivers/watchdog/bcm7038_wdt.c
>> index 506cd7ef9c77..a8a0e8485125 100644
>> --- a/drivers/watchdog/bcm7038_wdt.c
>> +++ b/drivers/watchdog/bcm7038_wdt.c
>> @@ -223,8 +223,16 @@ static const struct of_device_id
>> bcm7038_wdt_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
>>   +static const struct platform_device_id bcm7038_wdt_devtype[] = {
>> +    { .name = "bcm7038-wdt" },
>> +    { .name = "bcm63xx-wdt" },
>> +    { /* sentinel */ },
>> +};
> 
> I don't think I received answer on this: do we really need or want
> "bcm7038-wdt" there? BCM7038 uses DT so it should never use a platform
> devices created by arch code.

I did not respond to you on that, tested it and turned out we don't need
that bcm7038-wdt string when probed via DT, but we do when probed via
platform_data. Will drop it.
-- 
Florian
