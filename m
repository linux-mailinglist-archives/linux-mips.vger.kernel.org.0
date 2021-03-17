Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0501C33F970
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 20:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbhCQTiF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 15:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbhCQTht (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 15:37:49 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F068C06174A;
        Wed, 17 Mar 2021 12:37:49 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z8so4610727ljm.12;
        Wed, 17 Mar 2021 12:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w41ZIh9j7rrS3aQxa5uyyXCBDM6IRF6XQH2RP+GTPpM=;
        b=jEcLBd8AbZ9wS88VOf/WD7P6gS74R1Js8V+4Qe9uYMI7xG3i/rfeY0L9fEQFkSBS/I
         cbQNMhKQqz/wGOr2C3EDZoh3mHV8riMv6/XsW+7wAUpx355hI7djPBrTUebbE1xlSATW
         CmkAkSuSwFssaTaqZY0yemKpg0DpyJx0GwvDQhhr4ZToXt4bQSGgV4bE0+uJowlT3Ya9
         JHFDWSPqsu1nLFkOjYjwXiO8vu26fULvXZIpaIj3g3m0cEt65gm/jTqGlCJznZsY7guV
         lbF3H0K4qfktzEC844h9wgj8Yv0e2p6+PWOBzR+TbZBSaDP3PdujcDvaDvX7MDSOHhRo
         lojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w41ZIh9j7rrS3aQxa5uyyXCBDM6IRF6XQH2RP+GTPpM=;
        b=bcstn1yqWu6qGaWICD4huTgmYMl3sPJu0nfQ1IfFxvxdoLQvkXsI8d+hDAxIGYK54J
         EA7RtItrJ60zzobAPyJqRj0v1+JQmB74OQlrdBiumUPfB6EjSUiIcxlq5EuuNxr/JQzn
         YqnQknFn4+U9DCjuc9IZZ+mhmj7WSnvYixCMykalOdV73JxcFbC9VxAxCtpDe1EQyjr7
         WnR7SO1SdltbtQIjdI7n+OW+sgyhjM7R6neyrFJFE4LQIi/GyQ9uBrOhwaxY95yeTeK7
         lwux01lHqZazFPcdm0Os6LKGLpj5rExbzND/8atmBUliGdAgHUL2yeHG1wkw3/+/V+E8
         W6ew==
X-Gm-Message-State: AOAM530TIa00kz7tznhyku1dJiYe4FoK/Mob/lRRosftTuEBswx66Idr
        hAiKYtnrTD29SLXqDm1k7J4=
X-Google-Smtp-Source: ABdhPJwoOY5L+/BwT3yME6nvQdFG8vDP8BRM9wXeVEXi0UspePVWdN+BOzS/k2BmnpuZVZmqyCaB2A==
X-Received: by 2002:a2e:9a96:: with SMTP id p22mr3153990lji.167.1616009867603;
        Wed, 17 Mar 2021 12:37:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id h3sm3467817ljc.67.2021.03.17.12.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 12:37:46 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
 <880d5e61-fec5-e7d6-7403-b1823c77b3c1@gmail.com>
 <856fbd45-67ae-fed2-97c4-b555993d5ae9@canonical.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1cd074f0-3a58-d1bf-2a72-4fadd0d3b796@gmail.com>
Date:   Wed, 17 Mar 2021 22:37:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <856fbd45-67ae-fed2-97c4-b555993d5ae9@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

17.03.2021 12:56, Krzysztof Kozlowski пишет:
> On 17/03/2021 10:52, Sergei Shtylyov wrote:
>> Hello!
>>
>> On 16.03.2021 20:57, Krzysztof Kozlowski wrote:
>>
>>> The Ralink MIPS platform does not use Common Clock Framework and does
>>> not define certain clock operations leading to compile test failures:
>>>
>>>      /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>>>      phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>   arch/mips/ralink/clk.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
>>> index 2f9d5acb38ea..8387177a47ef 100644
>>> --- a/arch/mips/ralink/clk.c
>>> +++ b/arch/mips/ralink/clk.c
>>> @@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>>>   }
>>>   EXPORT_SYMBOL_GPL(clk_round_rate);
>>>   
>>> +int clk_set_parent(struct clk *clk, struct clk *parent)
>>> +{
>>> +	WARN_ON(clk);
>>> +	return -1;
>>
>>     Shouldn't this be a proepr error code (-1 corresponds to -EPRERM)?
> 
> Could be ENODEV or EINVAL but all other stubs here and in ar7/clock.c
> use -1. Do you prefer it then to have it inconsistent with others?

I don't see where -1 is used, ar7/clock.c returns 0. Other drivers
either return 0 or EINVAL.

Since linux/clk.h returns 0 in the stub, I think 0 is the correct variant.
