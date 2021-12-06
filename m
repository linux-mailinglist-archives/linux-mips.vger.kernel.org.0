Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAFF46A2A2
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 18:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237917AbhLFRXe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 12:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237420AbhLFRXd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 12:23:33 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6FB6C061746;
        Mon,  6 Dec 2021 09:20:04 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id g19so10777306pfb.8;
        Mon, 06 Dec 2021 09:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uaRVPQXHVl1LGgZ34LZ0iqcI9fvowi4WfJg3g/FhQpU=;
        b=RyzSlIcLnsLjCDUBrUqd7rOlMCEo9YyUshYNsAWUL6q/K5Mv/vIDf22cKQH7X7NwBt
         Ya/4XkcgTiuyRt2V7KidrmkTUtRgC39EIrhhNMMhpcnWAh9OllguZcsafGil+6fnKUx3
         Pszd9Yj9VBvTLYUazp3HoN0GnvQOAUJEK9Il5VNd8WDgcd38bu057PdZTK69w/+SE3ZD
         WYO80isb3XepLwWOmujO67DlKYsWyk7Y8KbX6QfRqpmPeNdGKb2idAjkFQhZ2S0ZKlKn
         0Lb27m7xlb7VVz9yx+XukKeUa5zjQPSkS8Mv52jFeP+6QNDhSpxwiBzTFEmLqTgH6rnm
         fKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uaRVPQXHVl1LGgZ34LZ0iqcI9fvowi4WfJg3g/FhQpU=;
        b=UgIarVR3aPsosA2TJwTvLS3ynINJJY7F51p33zC8vtEcL253Ov4Lh+y09tqniARRC3
         lyeV1NvJC/Z1KVu5z8NAJvwalF5xo0GjG1vLCa36pI0Aa7CDIylgF6tVEdNClllPgZ7u
         1m3UxM1z6zhXRsjFzgq8MSJkrFXcD29ZzmjKZwEYFJNZbu3hB/2o+cwBZ10x5t72aUWt
         iP9Sv5MwgvJDUOTqj/vPcWg8KdsDccUfcYZG5STzttFpweDmAF8dKs8N/ox5Mz7imrCX
         ibWCh4RIVWqdEM5KzpEp3YTXsPaMLhxBh2OKsonL+7aeaYMEhMy1iDo98dd8RWI78hUO
         NQTQ==
X-Gm-Message-State: AOAM533HNkwr3qvSSIrCmhENcxCoa2RQ8JS8pNBZzEkPGXbQu1vWz9a4
        jee4mTP7NB0h/4q9VJGkYUE=
X-Google-Smtp-Source: ABdhPJxkpUPhwzCiuSju3fP0Pq7bFNrNt2b0e3r632HUrdt1UHhJwwWLCIyAY1h7ReKw+1c/fKNzLw==
X-Received: by 2002:a63:8141:: with SMTP id t62mr19552041pgd.5.1638811204412;
        Mon, 06 Dec 2021 09:20:04 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id c5sm10560036pjm.52.2021.12.06.09.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 09:20:03 -0800 (PST)
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
To:     Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
Date:   Mon, 6 Dec 2021 09:20:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya3SU6U6YT6mlFu8@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/6/21 1:05 AM, Lee Jones wrote:
> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
> 
>> On 06.12.2021 09:44, Lee Jones wrote:
>>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>>>> On 15.11.2021 06:53, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>
>>>>> This helps validating DTS files.
>>>>>
>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>
>>>> I'm not familiar with handling multi-subsystem patchsets (here: watchdog
>>>> & MFD).
>>>>
>>>> Please kindly let me know: how to proceed with this patchset now to get
>>>> it queued for Linus?
>>>
>>> What is the requirement for these to be merged together?
>>
>> If you merge 2/2 without 1/2 then people running "make dt_binding_check"
>> may see 1 extra warning until both patches meet in Linus's tree.
>>
>> So it all comes to how much you care about amount of warnings produced
>> by "dt_binding_check".
> 
> In -next, I don't, but I know Rob gets excited about it.
> 
> Rob, what is your final word on this?  Is it a forced requirement for
> all interconnected document changes to go in together?

The first patch is queued up in Guenter's watchdog tree here:

https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=a5b2ebc8f6e67b5c81023e8bde6b19ff48ffdb02

and will be submitted to Wim shortly I believe, so I suppose we should
take patch #2 via Guenter and Wim's tree as well logically.
-- 
Florian
