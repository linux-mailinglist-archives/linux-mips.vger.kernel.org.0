Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54D933EE07
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 11:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhCQKGj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 06:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhCQKG3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 06:06:29 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D2CC06174A;
        Wed, 17 Mar 2021 03:06:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id v9so2104524lfa.1;
        Wed, 17 Mar 2021 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xawV4E1ST7uZbwHl8U0dnMGzxPO+DQ/2tFATbnPWaio=;
        b=HbBfeQFFi+RS85GxRKJXiBJ4apFvexpPsAwgcFKwWg63FnC7prQ1h59eG90h0BS49+
         k4JF3BAQ8brztdIWMGXxrFj4xHHw/Lf/uf8wnsQ3D/6bSiKRrcXgcxijlNYFsd2ltGvx
         tPzWXNHHzakl4laXn/VZ8F0hvRVRDL3T7HcoIGZDJ97eH3MaJG2gh+xJUo5fH/7wkKVh
         veG5MpTnV/j8ZabJXJX4RhOZsRajbbc2KFWH7PNhHzPvsceoT4wE+zi1BJyH10//yCib
         eaC+lal13JGnmMcuKzxs29iCmlhk/OBjPUj9YYMhBLXobsUxn6vst4dK0WvsnFkWY0kL
         YIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xawV4E1ST7uZbwHl8U0dnMGzxPO+DQ/2tFATbnPWaio=;
        b=JNF8M7ocfspOLhDLU/l3r1mOoeRaVb2EKY54CqFIIJmwA56rfVBwAcfmM8qtTzd4lK
         1+aUtH7+SqQeM9YGaYjEEtHg8AneYvB1d/tZVXCy+pghQUuh1K5VVIqQv4eWE6PpaG0a
         2IMX6/DHDpwEg9dYgC0nYDyYp0A21ZXdqWQw6qCLLUoTJQ13g1HviZOE2qHuI+48bu1I
         2auuPGYpsTedDW/QuwLbLguLpEbfxrLi2T/fiZaTwzir2VbOhiB2yNTDH0Cj1OQYmaDL
         F/IzPoiTdRlmvonyvkmbRtrUNiWpZoDHbq50L2pxFWr9OHRnnluwRSaOa6V1cvFf/m4x
         Mg6w==
X-Gm-Message-State: AOAM530BtSN7TEG9AShwwkByRI95B2dbmLH8rQOJWjRuJDQEVjhuUbAq
        WzZd6usUr9XBr6LTHC4RTR0=
X-Google-Smtp-Source: ABdhPJwSj51pi6uSE4n98WCJ6qlFpw1V9Pynw8LMBX5aeBJMp3XGG9FidFuyN3ASW2uGbM0tQGAzZQ==
X-Received: by 2002:a19:b03:: with SMTP id 3mr2000533lfl.236.1615975587590;
        Wed, 17 Mar 2021 03:06:27 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.25])
        by smtp.gmail.com with ESMTPSA id e15sm3325519lfs.83.2021.03.17.03.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 03:06:27 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org, digetx@gmail.com,
        kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
 <880d5e61-fec5-e7d6-7403-b1823c77b3c1@gmail.com>
 <856fbd45-67ae-fed2-97c4-b555993d5ae9@canonical.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <b97474c2-dc45-8751-25e2-18cdfa9fa557@gmail.com>
Date:   Wed, 17 Mar 2021 13:06:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <856fbd45-67ae-fed2-97c4-b555993d5ae9@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17.03.2021 12:56, Krzysztof Kozlowski wrote:

[...]
>>> The Ralink MIPS platform does not use Common Clock Framework and does
>>> not define certain clock operations leading to compile test failures:
>>>
>>>       /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>>>       phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>    arch/mips/ralink/clk.c | 14 ++++++++++++++
>>>    1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
>>> index 2f9d5acb38ea..8387177a47ef 100644
>>> --- a/arch/mips/ralink/clk.c
>>> +++ b/arch/mips/ralink/clk.c
>>> @@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>>>    }
>>>    EXPORT_SYMBOL_GPL(clk_round_rate);
>>>    
>>> +int clk_set_parent(struct clk *clk, struct clk *parent)
>>> +{
>>> +	WARN_ON(clk);
>>> +	return -1;
>>
>>      Shouldn't this be a proepr error code (-1 corresponds to -EPRERM)?
> 
> Could be ENODEV or EINVAL but all other stubs here and in ar7/clock.c
> use -1. Do you prefer it then to have it inconsistent with others?

    No. :-)

> Best regards,
> Krzysztof

MBR, Sergei
