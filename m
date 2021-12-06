Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB2D46A5C4
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 20:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346168AbhLFTki (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 14:40:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345083AbhLFTki (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 14:40:38 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0258C061746;
        Mon,  6 Dec 2021 11:37:08 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id bj13so23406623oib.4;
        Mon, 06 Dec 2021 11:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=28mBvOsZrJ2zOB/2a8QoBhYjW6OUwvR4EpgzsEEyub8=;
        b=AC8iWufM6h7ZFu9F/aRYfRhOKvHwjJzWhUW6N/JOmuIe0/jW9ptYZ+/JCvDjwvupO9
         1TIofUEZR2R61e3IOxbqXFAvqVnem+pXtQ/CGF5jS5mz8DX2n9MU0SsfxGjNta+dd2Al
         Jx407bRtt99k+IOHIm3XLUfRt+dt/58c9lI0FgxiT+HmzCFtUNZCFEQtJ1jK2dRlru9l
         ZQLxY+hEma7uq73mcedDbo632nHDe9lF8vFYvfnKSZHvvOg7wwS/ggazOBvVYzRUo8bP
         8qQLWJsV/jDMycERyLWvKcRdqQYFR9qkyln4rJpqFR7Mxb28ajhAeaLo/G/6zvs2X2k/
         Fzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=28mBvOsZrJ2zOB/2a8QoBhYjW6OUwvR4EpgzsEEyub8=;
        b=6h+ZfNcaxz2PIqJUvXCJoDIPH8u11ujXs++pLK7JJqT4XUfJH2NV0ag7V7K09A5uap
         4lcmt3FPJsXKsOOzhEpmVLb7iN/4uWJSZ4xlbG9HRiUax/SxCAlgiMCrmOC+gXGFA2aA
         H1oY+2b1BBCKjfSDXwkIpmaW1+sx8e1wdc9NCK4i183upR6ckvntTWoySuWdR0XoHoLT
         Km5ogibsK3AR+eGWCNCPAW3kKbc8ezo3lLb2fF+a/CfPf5u3xzLsh9gK7rhVhFik8kV0
         p/2g0lmp1xY27EcX2bUCDpyDumF8hXyDtqJjYDaOgqIR3N3xHBhOycdb7pIWzgCEfDaD
         MLAw==
X-Gm-Message-State: AOAM530INC8sdR+zeOjSxi4+Rr2ARMadwrIztnnsofhV3g4DEebhas3q
        B2oq8V37m6NTOMf7R+Hqk+I=
X-Google-Smtp-Source: ABdhPJyNgfDr4IGy7+lkGNwBEanWKpj8p9Ho+Tczc0tQ7W4bhWbviO5oyF9TZcpNmydsJLMRhRFxUw==
X-Received: by 2002:a54:4595:: with SMTP id z21mr585015oib.169.1638819428280;
        Mon, 06 Dec 2021 11:37:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bk41sm2950654oib.31.2021.12.06.11.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 11:37:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
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
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
Date:   Mon, 6 Dec 2021 11:37:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/6/21 11:13 AM, Florian Fainelli wrote:
> On 12/6/21 11:10 AM, Guenter Roeck wrote:
>> On 12/6/21 10:55 AM, Lee Jones wrote:
>>> On Mon, 06 Dec 2021, Florian Fainelli wrote:
>>>
>>>> On 12/6/21 1:05 AM, Lee Jones wrote:
>>>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>>>
>>>>>> On 06.12.2021 09:44, Lee Jones wrote:
>>>>>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>>>>>> On 15.11.2021 06:53, Rafał Miłecki wrote:
>>>>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>>>
>>>>>>>>> This helps validating DTS files.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>>>
>>>>>>>> I'm not familiar with handling multi-subsystem patchsets (here:
>>>>>>>> watchdog
>>>>>>>> & MFD).
>>>>>>>>
>>>>>>>> Please kindly let me know: how to proceed with this patchset now
>>>>>>>> to get
>>>>>>>> it queued for Linus?
>>>>>>>
>>>>>>> What is the requirement for these to be merged together?
>>>>>>
>>>>>> If you merge 2/2 without 1/2 then people running "make
>>>>>> dt_binding_check"
>>>>>> may see 1 extra warning until both patches meet in Linus's tree.
>>>>>>
>>>>>> So it all comes to how much you care about amount of warnings produced
>>>>>> by "dt_binding_check".
>>>>>
>>>>> In -next, I don't, but I know Rob gets excited about it.
>>>>>
>>>>> Rob, what is your final word on this?  Is it a forced requirement for
>>>>> all interconnected document changes to go in together?
>>>>
>>>> The first patch is queued up in Guenter's watchdog tree here:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=a5b2ebc8f6e67b5c81023e8bde6b19ff48ffdb02
>>>>
>>>>
>>>> and will be submitted to Wim shortly I believe, so I suppose we should
>>>> take patch #2 via Guenter and Wim's tree as well logically.
>>>
>>> If that happens, I would like a PR to an immutable branch.
>>>
>>
>> I don't entirely see the point of that complexity for dt changes,
>> but whatever. Since my tree is not the official watchdog-next tree,
>> that means I can not take the entire series (which goes way beyond
>> the dt changes and also drops the bcm63xx driver). Unless I hear
>> otherwise, I'll drop the series from my tree for the time being
>> and wait for the dt changes to be sorted out.
> 
> There is simply no rush in getting the bcm7038-wdt driver to support
> 4908 *just now*, so why don't you just take the bcm63xx-wdt series that
> I posed, and Rafal posts an updated series that adds support for the
> 4908 watchdog for the 5.18 cycle?
> 

Your series includes the patch discussed here, and it is the first patch
of your series. The second patch in your series depends on it. Are you
telling me that I should drop those two patches from your series ?

For reference, the patches are

079a2959e68b dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
a5b2ebc8f6e6 dt-bindings: watchdog: convert Broadcom's WDT to the json-schema

in my watchdog-next branch.

Guenter
