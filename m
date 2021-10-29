Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6D54401F8
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhJ2Sgr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbhJ2Sgq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:36:46 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4C4C061714;
        Fri, 29 Oct 2021 11:34:17 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q187so10726350pgq.2;
        Fri, 29 Oct 2021 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ciI5iryyruFov1T0ma2aKRdnaHtK3Ppb+7gVjUGLj28=;
        b=AREq5zTFR/pt9gCkQVxg5sOlLaxl0XHIJUGKleG/Cwp4upMFdakU7JXZRR0o6/ZTDj
         i6Z9UKBNFulIwXzoUxuF6gst6SUACJsmaK8/VlP0KQ+4PTZIBSs/1mE9ZpklS8PMn4Bc
         nY9gShxeDU2YcuGpf+Z2LO+Y5DYpDLtgj+pkebP4+ol2LiJaDc9Hjyf9u0P7YOOmlYyz
         1QFUuVkz5X8BTxaypAMx2xeoYrUN4te8iPQjuticy37X6pv2PW2JdbG53CGAQbnHpu79
         YSgxNBba7KBIyak1OfqfGEI+11G9+Sk0TWU666QzWyMzZize34yU19G3KIKqDSziOunF
         /Bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ciI5iryyruFov1T0ma2aKRdnaHtK3Ppb+7gVjUGLj28=;
        b=rTGCEgWuTMIKcu9jM1XQQYYsSIJAqmMOKC9za/tDEsK2wtgWsKjdcTUhxHHOqTneHt
         FI843e9HomdG9TLX7wBzQzzp1s1iKb885oi+egY1tPjyEfNsY1Vv6N8NFAfZG4vBxbt2
         QgRfKvMvAECr6pKZVGMfI3TpPtyr5U/q5iibYe6DRXxaRiBNn0iiQi2Ca9WhHHuwm2XG
         47DvRSKWTTVxRUIBW1zw0asweAkuxO5zbwCEoo1RSldaDmf14TnTIbwb7xtM8tuIxdBu
         LS+TeJoZHzEykGv8ee8wvbTxLFP7aurTdLGuUOewsqQopsR1jYZ9YtyM+gdJQRFy5r5L
         tajQ==
X-Gm-Message-State: AOAM531b0lDPQWm92e9Onww70Afg4OuOsbdrpmlPjl3tRyxg6r3EwUtu
        oAg+QNM5PcduokhTyyVlPI8=
X-Google-Smtp-Source: ABdhPJwtqLisSULzrE1662JucFFODElh//nnqMxtL0Qwan9VieOf5qxal7nCe9DgQrrt6C/4eCBE4g==
X-Received: by 2002:a63:3c50:: with SMTP id i16mr9414406pgn.304.1635532457143;
        Fri, 29 Oct 2021 11:34:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id pi9sm7282864pjb.31.2021.10.29.11.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 11:34:16 -0700 (PDT)
Subject: Re: [PATCH 5/7] watchdog: bcm7038_wdt: Add platform device id for
 bcm63xx-wdt
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com,
        Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
 <20211028172322.4021440-6-f.fainelli@gmail.com>
 <02cb3c1a160854c92895d024e59a831b@milecki.pl>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <86bee996-d9ea-ba85-d89f-64faf9a4a44a@gmail.com>
Date:   Fri, 29 Oct 2021 11:34:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <02cb3c1a160854c92895d024e59a831b@milecki.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/29/21 5:37 AM, Rafał Miłecki wrote:
> On 2021-10-28 19:23, Florian Fainelli wrote:
>> In order to phase out bcm63xx_wdt and use bcm7038_wdt instead, introduce
>> a platform_device_id table that allows both names to be matched.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  drivers/watchdog/bcm7038_wdt.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/watchdog/bcm7038_wdt.c
>> b/drivers/watchdog/bcm7038_wdt.c
>> index 506cd7ef9c77..2535f450e8a1 100644
>> --- a/drivers/watchdog/bcm7038_wdt.c
>> +++ b/drivers/watchdog/bcm7038_wdt.c
>> @@ -223,6 +223,13 @@ static const struct of_device_id
>> bcm7038_wdt_match[] = {
>>  };
>>  MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
>>
>> +static const struct platform_device_id bcm7038_wdt_devtype[] = {
>> +    { .name = "bcm7038-wdt" },
>> +    { .name = "bcm63xx-wdt" },
>> +    { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(platform, bcm7038_wdt_devtype);
> 
> Do we really want "bcm7038-wdt" here? I don't think it will ever be used
> as apparently BCM7038 uses DT.

Let me dig through the platform_device_id code, but I believe we somehow do.
-- 
Florian
