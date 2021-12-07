Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9106146BF49
	for <lists+linux-mips@lfdr.de>; Tue,  7 Dec 2021 16:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233578AbhLGPco (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 10:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233423AbhLGPco (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Dec 2021 10:32:44 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9CEC061574;
        Tue,  7 Dec 2021 07:29:13 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id be32so28269846oib.11;
        Tue, 07 Dec 2021 07:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z9RUOEZo4xree+0izzh+j6TqNLpi9ndJ337BRAB5cjo=;
        b=V5jAqa69DXXVJn1NPFefZbN39FxlV+q8NtDBmuHQaVxWna0NRwk+XVcV/QcvpXxk9I
         8Am8PoJ0+U/pOwKIwDICYVYdrFDCQq8GJFRO5yIKMIdvQvVDMW4s7ZRj4RdDFgHzu0DO
         1bDhEsCt2VHh/sSBZtmFWoY4I2HQMrQCW10LmygGAYuzTAF2E2Yw18M20aEcmKiDovd2
         8UKO6bucKhTDRcXq8qVSjrcnsjA3CF0zHK9hyZUlXTQldChF5Y63iKYT4ANNaOLVbdxu
         nS4vIqcx/8BCtGRMyIh67aPLntGCZwhmGc7XF9x9EN+XTeLrqrsv+j7juS20wXAbSWNF
         3XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z9RUOEZo4xree+0izzh+j6TqNLpi9ndJ337BRAB5cjo=;
        b=yYNr2Flt+wuvrumA4qB3jJCVtu4zmm3ygHXM4fm70W6VkEHdnTt39JRNHtb7oPeCkt
         p3RkPgnuDHMA/eIpI3puJ1rTeJ+BUXoNr5Y3vZJztN0YOHODCudwwSX8no/LsawBXwvB
         fNXFbBybEYzmOdnBKzKQgN18N9wz9ohu1UjsTaqxwXpHyF84NPpvdeuWudY2Nfhi0m3M
         JshYUTZsO7hRC1sbT2iWVfSRQ14gIsg6/8OdLewL3aPmaFSBZh5s9dFb5fKHvBkhxmcT
         xYyFyu6/TO4l5W+KycU0EP8iwnMc68VkqHH85anI47LlepQhXjh4inGgXGeU5G1GUvjz
         Vw6Q==
X-Gm-Message-State: AOAM533Aydm8u+LDiO6udk2YPESQaj/wGyffo6nf/7CMaPHgu8tL0EXh
        abh0M4DWclioIEvSwOAtpka9f4hb2OA=
X-Google-Smtp-Source: ABdhPJy4dsAuklFeKUGXZcITAIs4kzrxEkRN0AXTM7reS8PLGa4kqJDl0yEKR/93R3qzODqZ2+Z5Dw==
X-Received: by 2002:a05:6808:228a:: with SMTP id bo10mr5880704oib.72.1638890953384;
        Tue, 07 Dec 2021 07:29:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd6sm3527674oib.53.2021.12.07.07.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 07:29:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
References: <Ya3NaVKf1NRc8rrx@google.com>
 <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
 <Ya3SU6U6YT6mlFu8@google.com>
 <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
 <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
 <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
 <20211206195115.GC3759192@roeck-us.net> <Ya8xhUR5GbTxVE8w@google.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <a86d5998-8d84-7afe-e34e-a632aa890683@roeck-us.net>
Date:   Tue, 7 Dec 2021 07:29:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya8xhUR5GbTxVE8w@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/7/21 2:03 AM, Lee Jones wrote:
[ ... ]
>> It sounded to me like Lee wanted an immutable branch for that
> 
> Not exactly, I said:
> 
>    "> Suppose we should take patch #2 via [Watchdog] as well.
> 
>     If that happens, I would like a PR to an immutable branch."
> 
> The alternative is that I take the patch and provide an immutable
> branch to you, which I am in a position to do.
> 

I understand, only I am not in a position to take it since my tree
isn't the official watchdog-next tree, and it doesn't show up in -next.
If Wim takes it into the official watchdog-next tree or not would be
completely up to him.

I personally don't care if the bindings check is clean in my inofficial
tree, so maybe this is a non-issue.

Guenter
