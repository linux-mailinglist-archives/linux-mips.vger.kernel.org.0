Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29ED46A56A
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 20:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348317AbhLFTQx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 14:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348316AbhLFTQx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 14:16:53 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B853C061746;
        Mon,  6 Dec 2021 11:13:24 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id f125so11459841pgc.0;
        Mon, 06 Dec 2021 11:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jutYnOpnNjumg6PKKNeJupVKYy4+l+32fzyBGYL/63o=;
        b=jjDEUBIivjmYbDCWCxbxRRgql+P3piJTcZPjb1n33nPGQhFb1UoyPb/Lr+97Y9f0EG
         7Uv//kzaXwlwqtJpGwax9wHuQq5np4n5yPq1kbK+9YertIESVQFvjUNMPtacpo+swuRa
         K46X8NoVyuRVHwpBE4POiGBZRnYkUbybjyFbS3tc4nb9sT/kljhW3sz/l1oeOxMviSoD
         gcULTCaDhBgb10Q8Kalp5zZtncX6yc4kqSuTLwdcJp+sTDALJRBgQuwsnXyBPkZoSqbV
         kxXcbx4dIMaOcmAj2tKYYKx5GRhVIe//xtfrHAbx6mLeAEPcYsTq0sOl59FGSsapVa7T
         0WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jutYnOpnNjumg6PKKNeJupVKYy4+l+32fzyBGYL/63o=;
        b=xf9erAH0IVCbYfOi9dnYWdQedPna09o5OmTUPvJjBNKw6zgHc7zfrteVsUGnfJumhZ
         vYKtVhAxGDOiIy/+9mbcEWz2LAV12Y9VwlQwmvrNj+oEY7GbOWVvrEE/FgOWWGY2OWVC
         wXROTO5ag3i/jURgGPd5sy0xLf5w55Ns9SmtABJR2I0Z+X22F/gRL0fO0YediQcfJ4en
         yplExgA2z0JxZ5tHLnrDjU8RN/L3MpiK0j6PKDZtwpsSZfmbvfx8dH6IUMXyqxlR2Dzd
         kv0tokaYxnVlvYOhwATOXVrA4DMZqFJDpo2ki+K+rrJD0aYwOoWaR3ed3CPeqtAsaEi4
         38Ng==
X-Gm-Message-State: AOAM532Rn4NPnPoQU6wUkyueTZ9601Wkh4DfUIKnAKnelCqO7aEBV9Rk
        5UeP8zynUpJTzhj4C/NJPior4lndGUw=
X-Google-Smtp-Source: ABdhPJxt0tX8CGsYgKA1bKBLbKOcTHGbyWZi38epu4nGuOaccZePm8pa0//JHCPDfZUfJHaKQxnLOg==
X-Received: by 2002:a05:6a00:1744:b0:4a4:f4e6:1cc0 with SMTP id j4-20020a056a00174400b004a4f4e61cc0mr37862377pfc.15.1638818003648;
        Mon, 06 Dec 2021 11:13:23 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u5sm10391374pgm.60.2021.12.06.11.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 11:13:23 -0800 (PST)
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
To:     Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
 <Ya3NaVKf1NRc8rrx@google.com>
 <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
 <Ya3SU6U6YT6mlFu8@google.com>
 <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
 <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
Date:   Mon, 6 Dec 2021 11:13:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/6/21 11:10 AM, Guenter Roeck wrote:
> On 12/6/21 10:55 AM, Lee Jones wrote:
>> On Mon, 06 Dec 2021, Florian Fainelli wrote:
>>
>>> On 12/6/21 1:05 AM, Lee Jones wrote:
>>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>>
>>>>> On 06.12.2021 09:44, Lee Jones wrote:
>>>>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>>>>> On 15.11.2021 06:53, Rafał Miłecki wrote:
>>>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>>
>>>>>>>> This helps validating DTS files.
>>>>>>>>
>>>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>>
>>>>>>> I'm not familiar with handling multi-subsystem patchsets (here:
>>>>>>> watchdog
>>>>>>> & MFD).
>>>>>>>
>>>>>>> Please kindly let me know: how to proceed with this patchset now
>>>>>>> to get
>>>>>>> it queued for Linus?
>>>>>>
>>>>>> What is the requirement for these to be merged together?
>>>>>
>>>>> If you merge 2/2 without 1/2 then people running "make
>>>>> dt_binding_check"
>>>>> may see 1 extra warning until both patches meet in Linus's tree.
>>>>>
>>>>> So it all comes to how much you care about amount of warnings produced
>>>>> by "dt_binding_check".
>>>>
>>>> In -next, I don't, but I know Rob gets excited about it.
>>>>
>>>> Rob, what is your final word on this?  Is it a forced requirement for
>>>> all interconnected document changes to go in together?
>>>
>>> The first patch is queued up in Guenter's watchdog tree here:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=a5b2ebc8f6e67b5c81023e8bde6b19ff48ffdb02
>>>
>>>
>>> and will be submitted to Wim shortly I believe, so I suppose we should
>>> take patch #2 via Guenter and Wim's tree as well logically.
>>
>> If that happens, I would like a PR to an immutable branch.
>>
> 
> I don't entirely see the point of that complexity for dt changes,
> but whatever. Since my tree is not the official watchdog-next tree,
> that means I can not take the entire series (which goes way beyond
> the dt changes and also drops the bcm63xx driver). Unless I hear
> otherwise, I'll drop the series from my tree for the time being
> and wait for the dt changes to be sorted out.

There is simply no rush in getting the bcm7038-wdt driver to support
4908 *just now*, so why don't you just take the bcm63xx-wdt series that
I posed, and Rafal posts an updated series that adds support for the
4908 watchdog for the 5.18 cycle?
-- 
Florian
