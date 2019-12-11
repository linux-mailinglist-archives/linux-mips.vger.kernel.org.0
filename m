Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 290B811A8DA
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2019 11:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbfLKK1m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Dec 2019 05:27:42 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34962 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728839AbfLKK1m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Dec 2019 05:27:42 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so23430577wro.2;
        Wed, 11 Dec 2019 02:27:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=izYbmOCoes/LsYGzfApweM/paZftNhc8ig2YmA93Iek=;
        b=dktV8W3qjSWDFsMCCmSkupvyv2D5omOSWSwl6P5a7dA2dMxgkT/EQgC3h8HIs4QVQ/
         gWLXsVKT25j9/c1klc74wS7zpsFi6A+vcHjxVoZ6Wasw5El4rj0WQTVU/EPfeeMri+Mw
         cIOPguow8HvR5xUAHxRe112D+TY58ZADZW1y6mpk8YSL/Igznlmuj1QUl+IRz2CGWd1M
         ASsNLSTd4+qTacSmeGxPXlvA8BdHBD2EZAeIKX/cGZsQ23b2g/avCvPVwW74cL/IaF24
         oEI3H1q81BRmSiwzK1beN45g8YLlXlQHcvO9vnD2a69GyEgVXwkGcUKJAZGrz7y7978J
         2l/Q==
X-Gm-Message-State: APjAAAVZkHRhKfG9pxh+3XnKDe4zeZ3QeTZd/w7wMAV1GX2XABghVoYX
        r+AfKq4brpJmh7d56nHc8fmvalNUVV8=
X-Google-Smtp-Source: APXvYqyKefPhCuv8OWJdNzJS6knz9WRw9M/rJ9/ZpIY7x3A1aYhhcZqTdcBBs3ixzoOkVIsZqVjMoQ==
X-Received: by 2002:a5d:4a91:: with SMTP id o17mr3129463wrq.232.1576060059698;
        Wed, 11 Dec 2019 02:27:39 -0800 (PST)
Received: from [10.10.2.174] (bran.ispras.ru. [83.149.199.196])
        by smtp.gmail.com with ESMTPSA id v3sm1707333wru.32.2019.12.11.02.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 02:27:39 -0800 (PST)
Reply-To: efremov@linux.com
Subject: Re: [PATCH] MIPS: Add KSEG*ADDR definitions to CONFIG_64BIT
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191210172739.27131-1-efremov@linux.com>
 <20191210185716.3lkhbuuqtzj2vs3l@lantea.localdomain>
 <54db9ec6-a60a-8202-72d8-dafef9eb2f0e@linux.com>
 <d709de95-c736-464d-9a92-e7b4df5df697@gmail.com>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <132b4840-f499-01c2-dbb4-6bc9665c9335@linux.com>
Date:   Wed, 11 Dec 2019 13:27:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <d709de95-c736-464d-9a92-e7b4df5df697@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/11/19 2:04 AM, Florian Fainelli wrote:
> On 12/10/19 12:14 PM, Denis Efremov wrote:
>> Hi,
>>
>> On 10.12.2019 21:57, Paul Burton wrote:
>>> Hi Denis,
>>>
>>> On Tue, Dec 10, 2019 at 08:27:39PM +0300, Denis Efremov wrote:
>>>> The patch adds KSEG0ADDR, KSEG1ADDR, KSEG2ADDR, KSEG3ADDR
>>>> definitions to CONFIG_64BIT ifdef. This fixes broken compilation:
>>>>   CC      drivers/watchdog/mtx-1_wdt.o
>>>> In file included from drivers/watchdog/mtx-1_wdt.c:44:
>>>> ./arch/mips/include/asm/mach-au1x00/au1000.h: In function ‘alchemy_rdsys’:
>>>> ./arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit
>>>>   declaration of function ‘KSEG1ADDR’; did you mean ‘CKSEG1ADDR’?
>>>>   [-Werror=implicit-function-declaration]
>>>
>>> Since this driver is meant to run on a system that only supports 32 bit
>>> kernels, I think it would be better to correct its dependencies in
>>> Kconfig like so:
>>>
>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>>> index 58e7c100b6ad..509cbb6d2cea 100644
>>> --- a/drivers/watchdog/Kconfig
>>> +++ b/drivers/watchdog/Kconfig
>>> @@ -1648,7 +1648,7 @@ config JZ4740_WDT
>>>
>>>  config WDT_MTX1
>>>         tristate "MTX-1 Hardware Watchdog"
>>> -       depends on MIPS_MTX1 || (MIPS && COMPILE_TEST)
>>> +       depends on MIPS_MTX1 || (MIPS && 32BIT && COMPILE_TEST)
>>>         help
>>>           Hardware driver for the MTX-1 boards. This is a watchdog timer that
>>>           will reboot the machine after a 100 seconds timer expired.
>>>
>>> And mark this with the appropriate fixes tag:
>>>
>>>   Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
>>>
>>> What do you think?
>>>
>>> Alternatively the driver could just use the existing & equivalent
>>> CKSEG1ADDR() macro as the compiler suggested, but in that case it'd be
>>> good to check that's the only change needed to build cleanly with
>>> CONFIG_64BIT=y.
>>>
>>
>> Thank you for the suggestion. I will prepare V2 and fix the same way other
>> drivers that break the compilation with CONFIG_64BIT and missing KSEG1ADDR.
> 
> There is a much simpler solution actually:

Well, I think you know better how to fix this. I think it will be better if you
prepare the patch. Your solution seems more elegant, at least to me.

> 
> diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
> index 8aa1cb4a295f..ea1bbf5ee528 100644
> --- a/drivers/watchdog/mtx-1_wdt.c
> +++ b/drivers/watchdog/mtx-1_wdt.c
> @@ -41,8 +41,6 @@
>  #include <linux/uaccess.h>
>  #include <linux/gpio/consumer.h>
> 
> -#include <asm/mach-au1x00/au1000.h>
> -
>  #define MTX1_WDT_INTERVAL      (5 * HZ)
> 
>  static int ticks = 100 * HZ;
> 
> and then you can even push this further with:
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 1679e0dc869b..982897ff074e 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1651,7 +1651,7 @@ config JZ4740_WDT
> 
>  config WDT_MTX1
>         tristate "MTX-1 Hardware Watchdog"
> -       depends on MIPS_MTX1 || (MIPS && COMPILE_TEST)
> +       depends on MIPS_MTX1 || COMPILE_TEST
>         help
>           Hardware driver for the MTX-1 boards. This is a watchdog timer
> that
>           will reboot the machine after a 100 seconds timer expired.
> 
> I checked both an alchemy, non-alchemy MIPS build as well as a x86_64
> build with the two patches applied.
> 
> In fact, this entire driver is just an older version of
> drivers/watchdog/gpio_wdt.c and should be converted to it, if only I had
> that box available.


Thanks,
Denis
