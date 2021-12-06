Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BAF46A560
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 20:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242725AbhLFTNz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 14:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241910AbhLFTNz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 14:13:55 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F480C061746;
        Mon,  6 Dec 2021 11:10:26 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id q25so23374142oiw.0;
        Mon, 06 Dec 2021 11:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1wvy44REuD2h6Uc/7rNL+PWkHEEXAwYQ2dCeyv2rQbg=;
        b=mLhf1aBaADMV+H9jPllUpH1Pyaiwg0rC9pc9oDKc64uIw9xM2u+jSOjthmMBd2BZk3
         MoD9oaKuwK+hUlI3NS4ej9ryGOxT4Qtn9xVMqDkSPJyFaZUyFpi6/h/HF6M+jxuBAGht
         tewSWFHceqKfwLKDZWG2z58BC/UjUUCdCb+o+ZnjPAW1bvhuMsA6o74xoXZBTZlNfZna
         zt3UQAf66wqWCNWbIxPJ3qxX9lc0ARqomtoC9n0ZD4wA5IXIkh+l87F3VIDy5DGJAjNe
         qB9+0IBLU7kgeHBQNeVNxlk9/TeZGEcdWcP5+nAcboB6Enzor4Gs+Z8/FXYVUlzYWg77
         winw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1wvy44REuD2h6Uc/7rNL+PWkHEEXAwYQ2dCeyv2rQbg=;
        b=kU+FexLBSHTyoQQkrWOyQkMy3Em5f/lvgBOMMJdpIPHKyhsxVh2s0MxKPVbAatA8dH
         bKKuPUVUnzEnc1Ci2NYCxgCQ2MP/ENgWHYezr15oHYAoD0/QlxuQp0kmzee0bou5tHi8
         MNMXwGbbzmfsAQKlTh8/M191gaGN839pTQqjb0ZzAXXh4fjFYLCWQ7EpMqJRwyMafgGK
         8XFw7UWxo1HP++raK5AU2XJSYLby1oH9QXl67m/nVL5eynRs30dCX1I9EJ6S15dZGEsF
         2By4hh7pJzf834y9upIqnqZOPrT9iiCIuFFaWuFvAIomkbu11DiYGffHWQ7tpSDqDRaK
         lm5A==
X-Gm-Message-State: AOAM532SEnD1M0EFMTFXnv/3vaWU4+U0TKPXjJPfpIKJfBLz0L6GHb3N
        +YeIEPu2pY9ZVecfr4V/w5ucxBLds84=
X-Google-Smtp-Source: ABdhPJztnQ3AFdLK78OlYPyE0VL3m3LKQ9XGJLAJnfqEPf6HDQxy6u8hXrcUroVYT1BrHWyj4FIIow==
X-Received: by 2002:a05:6808:12:: with SMTP id u18mr489157oic.174.1638817825494;
        Mon, 06 Dec 2021 11:10:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bq5sm2963435oib.55.2021.12.06.11.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 11:10:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
To:     Lee Jones <lee.jones@linaro.org>,
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
Date:   Mon, 6 Dec 2021 11:10:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya5ctkIU+jNzDfBc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/6/21 10:55 AM, Lee Jones wrote:
> On Mon, 06 Dec 2021, Florian Fainelli wrote:
> 
>> On 12/6/21 1:05 AM, Lee Jones wrote:
>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>
>>>> On 06.12.2021 09:44, Lee Jones wrote:
>>>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>>>> On 15.11.2021 06:53, Rafał Miłecki wrote:
>>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>>
>>>>>>> This helps validating DTS files.
>>>>>>>
>>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>
>>>>>> I'm not familiar with handling multi-subsystem patchsets (here: watchdog
>>>>>> & MFD).
>>>>>>
>>>>>> Please kindly let me know: how to proceed with this patchset now to get
>>>>>> it queued for Linus?
>>>>>
>>>>> What is the requirement for these to be merged together?
>>>>
>>>> If you merge 2/2 without 1/2 then people running "make dt_binding_check"
>>>> may see 1 extra warning until both patches meet in Linus's tree.
>>>>
>>>> So it all comes to how much you care about amount of warnings produced
>>>> by "dt_binding_check".
>>>
>>> In -next, I don't, but I know Rob gets excited about it.
>>>
>>> Rob, what is your final word on this?  Is it a forced requirement for
>>> all interconnected document changes to go in together?
>>
>> The first patch is queued up in Guenter's watchdog tree here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=a5b2ebc8f6e67b5c81023e8bde6b19ff48ffdb02
>>
>> and will be submitted to Wim shortly I believe, so I suppose we should
>> take patch #2 via Guenter and Wim's tree as well logically.
> 
> If that happens, I would like a PR to an immutable branch.
> 

I don't entirely see the point of that complexity for dt changes,
but whatever. Since my tree is not the official watchdog-next tree,
that means I can not take the entire series (which goes way beyond
the dt changes and also drops the bcm63xx driver). Unless I hear
otherwise, I'll drop the series from my tree for the time being
and wait for the dt changes to be sorted out.

Guenter
