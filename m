Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB7546A5DA
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 20:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245156AbhLFTrF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 14:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239522AbhLFTrC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 14:47:02 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEBFC061746;
        Mon,  6 Dec 2021 11:43:33 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id r130so11174142pfc.1;
        Mon, 06 Dec 2021 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HqwYoUP/jRWg7u8E/R7YzlssvwUpbbSjDEhlxXMDq+M=;
        b=YPS2/QWvHhbDH0s4QNfyhRvn0mrabbmaSzPymo7tzblxuwjvM3GLvAne/fADuzEiP3
         r4jfVuuvkkDRXtiKvoqYJYGgIRuxP4mhJGZt62tBxHyetnDThTvtn78EatI/DD4USQPc
         Vvka1qoXvE1flXKyNOl0N7D4JsEilUR3vm6aWgh5gNjL3DLFpO5cCohYwfv4nzUFr5bd
         UMiuVc9fX0OnOdH0e1sLy47X3gYdxTidDc8iQNqLkV2cyL5Fz1GT1J/tx9aW2uSSHZo2
         AbCrNjVun4uF6pja5cKR6GjFxuoSQmgMQubYVrJQi8nJY4RGPY12Hm3V9saWAe0eLmjF
         pqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HqwYoUP/jRWg7u8E/R7YzlssvwUpbbSjDEhlxXMDq+M=;
        b=HmXJTfeqNpGVozs0Xy3U5AahLIsDoXlK1F0ZdGfRPSetY8f6AWzizfGSyyLzbFoLxd
         LsmrAv+G0Shnlm5P60CrltYstBCNfofbZOidBPYCr1iH5lAfcOApDDjj71bOTrzYBgOc
         60W5R+MCCI/ORdTELOYjTziN46k5KGa4FejRcI55P8gw5eqmXJr+lhWGLnYF1UDl60b+
         adwxMUXoT1dz7sF2zjkjnTARz8Ue5KL0Up6iF39M7e4AU8arPVA1Nk6bRtQUw7FOZtSf
         EgiAivEu903IkXphuIDT5wsgRuHkMwpasrqOfBTrjDcWiOeA6wIRmj9JmARYmvv+sJLN
         XcRg==
X-Gm-Message-State: AOAM532uVMAViP9EmsjvrKjkrEiaSROOXWDFAhulhw16HomGgkLps0UX
        Ku6e8GSx/UFakJi9Sger9x0=
X-Google-Smtp-Source: ABdhPJwiRckOP36k/eWb9vMSPnejLEXLs58KcyV/o8gnK7zF/AFimEPFJU650slFNpiqGbNtFtDY/w==
X-Received: by 2002:a63:ef18:: with SMTP id u24mr20781981pgh.573.1638819813416;
        Mon, 06 Dec 2021 11:43:33 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id j20sm423844pjl.3.2021.12.06.11.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 11:43:32 -0800 (PST)
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
To:     Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
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
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
Date:   Mon, 6 Dec 2021 11:43:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/6/21 11:37 AM, Guenter Roeck wrote:
> On 12/6/21 11:13 AM, Florian Fainelli wrote:
>> On 12/6/21 11:10 AM, Guenter Roeck wrote:
>>> On 12/6/21 10:55 AM, Lee Jones wrote:
>>>> On Mon, 06 Dec 2021, Florian Fainelli wrote:
>>>>
>>>>> On 12/6/21 1:05 AM, Lee Jones wrote:
>>>>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>>>>
>>>>>>> On 06.12.2021 09:44, Lee Jones wrote:
>>>>>>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>>>>>>> On 15.11.2021 06:53, Rafał Miłecki wrote:
>>>>>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>>>>
>>>>>>>>>> This helps validating DTS files.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>>>>
>>>>>>>>> I'm not familiar with handling multi-subsystem patchsets (here:
>>>>>>>>> watchdog
>>>>>>>>> & MFD).
>>>>>>>>>
>>>>>>>>> Please kindly let me know: how to proceed with this patchset now
>>>>>>>>> to get
>>>>>>>>> it queued for Linus?
>>>>>>>>
>>>>>>>> What is the requirement for these to be merged together?
>>>>>>>
>>>>>>> If you merge 2/2 without 1/2 then people running "make
>>>>>>> dt_binding_check"
>>>>>>> may see 1 extra warning until both patches meet in Linus's tree.
>>>>>>>
>>>>>>> So it all comes to how much you care about amount of warnings
>>>>>>> produced
>>>>>>> by "dt_binding_check".
>>>>>>
>>>>>> In -next, I don't, but I know Rob gets excited about it.
>>>>>>
>>>>>> Rob, what is your final word on this?  Is it a forced requirement for
>>>>>> all interconnected document changes to go in together?
>>>>>
>>>>> The first patch is queued up in Guenter's watchdog tree here:
>>>>>
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=a5b2ebc8f6e67b5c81023e8bde6b19ff48ffdb02
>>>>>
>>>>>
>>>>>
>>>>> and will be submitted to Wim shortly I believe, so I suppose we should
>>>>> take patch #2 via Guenter and Wim's tree as well logically.
>>>>
>>>> If that happens, I would like a PR to an immutable branch.
>>>>
>>>
>>> I don't entirely see the point of that complexity for dt changes,
>>> but whatever. Since my tree is not the official watchdog-next tree,
>>> that means I can not take the entire series (which goes way beyond
>>> the dt changes and also drops the bcm63xx driver). Unless I hear
>>> otherwise, I'll drop the series from my tree for the time being
>>> and wait for the dt changes to be sorted out.
>>
>> There is simply no rush in getting the bcm7038-wdt driver to support
>> 4908 *just now*, so why don't you just take the bcm63xx-wdt series that
>> I posed, and Rafal posts an updated series that adds support for the
>> 4908 watchdog for the 5.18 cycle?
>>
> 
> Your series includes the patch discussed here, and it is the first patch
> of your series. The second patch in your series depends on it. Are you
> telling me that I should drop those two patches from your series ?

No, quite the contrary, I want you to keep the entire 7 patches that
converted the bcm7038-wdt binding to YAML and get rid of the bcm63xx-wdt
changes, the branch that you have right now is good in that regard.

I don't see why you should be creating an immutable branch for Lee and
not simply merge Rafal's "[PATCH V4 RESEND 2/2] dt-bindings: mfd: add
Broadcom's Timer-Watchdog block" patch with Lee's ack directly. This is
a new file, so I don't see how it would create conflicts as long as we
don't pile up changes on top.
-- 
Florian
