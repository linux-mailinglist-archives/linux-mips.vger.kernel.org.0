Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EAF32E67E
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 11:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhCEKeO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 05:34:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhCEKdi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 05:33:38 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AB7C061574
        for <linux-mips@vger.kernel.org>; Fri,  5 Mar 2021 02:33:38 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h98so1481020wrh.11
        for <linux-mips@vger.kernel.org>; Fri, 05 Mar 2021 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e/f2HBL5HAx1NUma9mvmRmVDl3EiEhBl3GuuJNNNQY8=;
        b=Ps57ex3qdSjN6SajeH2qheQ5Uuljya8Hy8/Ycu6qOMJj1gTIuVJxai8xYZUiVeVwzw
         AuQpt1mGs74K7Gz7SLXAqT1ZCpyAAT8n6mISxvSuzKIqyddGdJAtDgt9BSI5vUTzWaUo
         qz79tdXz6shT6kc4vqMhoOV53bYXDIEWWE+M6YemL6q8AnbzX6MsCvziHgSzusyAtevp
         bX1bZOxbxL1Wd4dzXEJ/O/Sp2WFi4C8lHDU7tuVhQ6siwreNzJTuH01bQH8Znt1VxQDX
         DwEx45cieHNDHDSoGN1afR8ACVb2B1aQvdU9t4rMSAT6nkDw9vlZRNKFywIgPvEI7hbe
         1qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e/f2HBL5HAx1NUma9mvmRmVDl3EiEhBl3GuuJNNNQY8=;
        b=Hot6+KdO7Ng4+bxLC7uk38w7nxivjDynKlIpKwWyF/o/V3Zp+mDhTueEeCNwgkClSV
         41VXR/wkw6nE28M1PGqFreORxuYOZnqCpIirqOo1fnjOVsh+7hzGR6ZvetfR7s6tNz+G
         WVsZX9x5kaIL3r6ch6oA/WCz4u5K+I/G2Epz8lwqMhRqD+oFBbuf9a2NYsdVbIpkUo5X
         GhHuwzK4guR/T6Wacix3WUMf8a/kQvWoww89T+xS7XZE/Y5971NXHl9Ga7et5DYlRJzl
         tjgyb+tP9YvhebjJGULrHD6Ko8LZ+K3wM6ivfScUsxW8YhwZVl3n9lCprLBo8DoiWept
         0FhA==
X-Gm-Message-State: AOAM532+TdYG3S7sOMdJCfwqoHTqMgde2rAaeBceBhShb73/L/L2LbfE
        7IgWbM7ZWeE1lDpRiSTW6OR5Og==
X-Google-Smtp-Source: ABdhPJzkzTcQAx9qG/Sr55DSWp5FisqN0cMPXYb8CAL1I9wDHEa8kQ0XSjJTOBtJnVulk4nUetim9Q==
X-Received: by 2002:a5d:6810:: with SMTP id w16mr8729907wru.333.1614940416762;
        Fri, 05 Mar 2021 02:33:36 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id x6sm3975204wmj.32.2021.03.05.02.33.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:33:36 -0800 (PST)
Subject: Re: [PATCH 2/2] nvmem: iomap: new driver exposing NVMEM accessible
 using I/O mapping
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
References: <20210304144132.24098-1-zajec5@gmail.com>
 <20210304144132.24098-2-zajec5@gmail.com>
 <047bced8-6c20-4a0a-c7ea-e0ad83318461@linaro.org>
 <93708a21-3444-f68e-c834-a4f769a0acba@milecki.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <35e498b6-3b2c-d154-db00-d755af339b60@linaro.org>
Date:   Fri, 5 Mar 2021 10:33:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <93708a21-3444-f68e-c834-a4f769a0acba@milecki.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/03/2021 10:24, Rafał Miłecki wrote:
>>>
>>> +static int iomap_read(void *context, unsigned int offset, void *val,
>>> +              size_t bytes)
>>> +{
>>> +    struct iomap *priv = context;
>>> +    u8 *src = priv->base + offset;
>>> +    u8 *dst = val;
>>> +    size_t tmp;
>>> +
>>> +    tmp = offset % 4;
>>> +    memcpy_fromio(dst, src, tmp);
>>> +    dst += tmp;
>>> +    src += tmp;
>>> +    bytes -= tmp;
>>> +
>>> +    tmp = rounddown(bytes, 4);
>>> +    __ioread32_copy(dst, src, tmp / 4);
>>> +    dst += tmp;
>>> +    src += tmp;
>>> +    bytes -= tmp;
>>> +
>>> +    memcpy_fromio(dst, src, bytes);
>>> +
>>
>>
>> You could just do this!
>>
>>      while (bytes--)
>>          *val++ = readb(priv->base + offset + i++);
> 
> Do you mean that as replacement for "memcpy_fromio" or the whole
> function code?

Yes please!

> The reason for using __ioread32_copy() was to improve reading
> performance (using aligned 32 bit access where possible). I'm not sure
> if that really matters?

Just simple while loop is much readable than the previous code TBH!

> 

> P.S.
> Please don't yell at me in every sentence :( Makes me a bit sad :(
Sorry!! I did not mean anything as such! :-)

--srini
