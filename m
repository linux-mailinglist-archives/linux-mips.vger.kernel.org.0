Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5498119F0F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2019 00:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfLJXEo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 18:04:44 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40019 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLJXEn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 18:04:43 -0500
Received: by mail-ed1-f66.google.com with SMTP id c93so17565381edf.7;
        Tue, 10 Dec 2019 15:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZrxsNfGWvY11/hqYgDHiPByGf83bV4638CHULu2o0fU=;
        b=srdUMEYa4nOTJxN3y4TFLK4PvVKWkV0HOTM/2WYU1X6BmExK4xDMi2f2dWVbZD8ZLy
         H/g8UYjxljVo8AWtZ1Fe4EbNrb6bUJaE5O8QwY3chEe+cYjgL1Tg4ukYVF7LDzQJjXfH
         bhmYe7byX+8rhXmZbxVk0qmcMlMj31mBt6PIlSzFtiafz5oJLGf39asrFOZkb5+nW1xD
         4p2qFPCeh1gY7toPzjzQ1d82hEPH0M7riCdSBPhUa+NQJxH7mj+TW6u67UOqcPl9OTwf
         dgZ5QHOYMMCeb6oVArwxDi34Um9VFzIQMNd9LgpckMds1QnsfCSlk2pmgYMx++GnWJGI
         3Lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZrxsNfGWvY11/hqYgDHiPByGf83bV4638CHULu2o0fU=;
        b=blR2c3a1wWg3cxEQkJDQRbrfMe1VpQScXJqIU5qBH+pSilmCO0TJqVj8rzqSCJa9Rb
         +4mBeIZJwHC048dUp8c933IqQkuvkj4U6TPh/ey97FAidF5FRH97hzn2jMlEkxDqm5nW
         cijypbIB5O5h21IizsTPuRD3T1apiso16lASMEUd904yMOnJ55p1OoN1y6VEoYt65NwM
         kGZ4d2Fr0nBU45PQiJ74+Ks/cwMtcLavHkTMdpE6sNegV+XPYNtp4GKsidOB32EOgIrt
         UqBKfvSdI7xP6/a5xNQpKeuPP7YUKDqeQT3ilwdSbMkFZ890MkNQIJApGf7VcDgXZ7G0
         Ic9g==
X-Gm-Message-State: APjAAAUlNIOsCPWdev28eTqUtv1NryBY+vBqixkGFqpmC4uociuLxdE+
        QkxdBuybel7yW1Dn9UC5k4QJB5zw
X-Google-Smtp-Source: APXvYqyopOuvGpcALW/lRbD18nFLVQGKQamh6lTv9is8OOb7vLiJsjwQNFXRl5U0OwVKjaHAGK4Phw==
X-Received: by 2002:a17:906:82d0:: with SMTP id a16mr6663852ejy.206.1576019080839;
        Tue, 10 Dec 2019 15:04:40 -0800 (PST)
Received: from [10.67.50.53] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id y20sm124016edu.7.2019.12.10.15.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 15:04:40 -0800 (PST)
Subject: Re: [PATCH] MIPS: Add KSEG*ADDR definitions to CONFIG_64BIT
To:     Denis Efremov <efremov@linux.com>,
        Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191210172739.27131-1-efremov@linux.com>
 <20191210185716.3lkhbuuqtzj2vs3l@lantea.localdomain>
 <54db9ec6-a60a-8202-72d8-dafef9eb2f0e@linux.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <d709de95-c736-464d-9a92-e7b4df5df697@gmail.com>
Date:   Tue, 10 Dec 2019 15:04:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <54db9ec6-a60a-8202-72d8-dafef9eb2f0e@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/10/19 12:14 PM, Denis Efremov wrote:
> Hi,
> 
> On 10.12.2019 21:57, Paul Burton wrote:
>> Hi Denis,
>>
>> On Tue, Dec 10, 2019 at 08:27:39PM +0300, Denis Efremov wrote:
>>> The patch adds KSEG0ADDR, KSEG1ADDR, KSEG2ADDR, KSEG3ADDR
>>> definitions to CONFIG_64BIT ifdef. This fixes broken compilation:
>>>   CC      drivers/watchdog/mtx-1_wdt.o
>>> In file included from drivers/watchdog/mtx-1_wdt.c:44:
>>> ./arch/mips/include/asm/mach-au1x00/au1000.h: In function ‘alchemy_rdsys’:
>>> ./arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit
>>>   declaration of function ‘KSEG1ADDR’; did you mean ‘CKSEG1ADDR’?
>>>   [-Werror=implicit-function-declaration]
>>
>> Since this driver is meant to run on a system that only supports 32 bit
>> kernels, I think it would be better to correct its dependencies in
>> Kconfig like so:
>>
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 58e7c100b6ad..509cbb6d2cea 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -1648,7 +1648,7 @@ config JZ4740_WDT
>>
>>  config WDT_MTX1
>>         tristate "MTX-1 Hardware Watchdog"
>> -       depends on MIPS_MTX1 || (MIPS && COMPILE_TEST)
>> +       depends on MIPS_MTX1 || (MIPS && 32BIT && COMPILE_TEST)
>>         help
>>           Hardware driver for the MTX-1 boards. This is a watchdog timer that
>>           will reboot the machine after a 100 seconds timer expired.
>>
>> And mark this with the appropriate fixes tag:
>>
>>   Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
>>
>> What do you think?
>>
>> Alternatively the driver could just use the existing & equivalent
>> CKSEG1ADDR() macro as the compiler suggested, but in that case it'd be
>> good to check that's the only change needed to build cleanly with
>> CONFIG_64BIT=y.
>>
> 
> Thank you for the suggestion. I will prepare V2 and fix the same way other
> drivers that break the compilation with CONFIG_64BIT and missing KSEG1ADDR.

There is a much simpler solution actually:

diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
index 8aa1cb4a295f..ea1bbf5ee528 100644
--- a/drivers/watchdog/mtx-1_wdt.c
+++ b/drivers/watchdog/mtx-1_wdt.c
@@ -41,8 +41,6 @@
 #include <linux/uaccess.h>
 #include <linux/gpio/consumer.h>

-#include <asm/mach-au1x00/au1000.h>
-
 #define MTX1_WDT_INTERVAL      (5 * HZ)

 static int ticks = 100 * HZ;

and then you can even push this further with:

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 1679e0dc869b..982897ff074e 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1651,7 +1651,7 @@ config JZ4740_WDT

 config WDT_MTX1
        tristate "MTX-1 Hardware Watchdog"
-       depends on MIPS_MTX1 || (MIPS && COMPILE_TEST)
+       depends on MIPS_MTX1 || COMPILE_TEST
        help
          Hardware driver for the MTX-1 boards. This is a watchdog timer
that
          will reboot the machine after a 100 seconds timer expired.

I checked both an alchemy, non-alchemy MIPS build as well as a x86_64
build with the two patches applied.

In fact, this entire driver is just an older version of
drivers/watchdog/gpio_wdt.c and should be converted to it, if only I had
that box available.
-- 
Florian
