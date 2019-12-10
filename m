Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 615231191A6
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2019 21:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfLJUOl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Dec 2019 15:14:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38137 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfLJUOl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Dec 2019 15:14:41 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so4615255wmi.3;
        Tue, 10 Dec 2019 12:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wb5TbGPX0KvJ+lhCtVVwqmj0f4j7nrDpUs0GsXTLEU4=;
        b=Vl7fPFnKmF1Kb5S2E8tovZLEgIblDgUrumahDSGY5hErwio228ZW7yn2jQ22ZHCmAG
         9tifLnRG0UcMEW7v6WN1a9UcdYKgDoGp/Eod8BI+jzQv1909R1spQi6pqoDpGXpqtLWg
         gdM3EX2slXzo+sQ9jrgS1bQauivgI4VSTqYbw/meRZ0dMxCLUzurLjLWGTDnAxvm89bM
         5+mfzB15boFjLcGRSr1wyco8yamjt3riRq2tOV+5UNzBOlpeGXPGkc6UJhmrGiNXfUuN
         S0SoRd/t/wIglglQ9O/48IKf9835hSClLV9MXhpdeaeq9qp1+lUgflqbv8KmAWoIXw1J
         0NwQ==
X-Gm-Message-State: APjAAAVrxFgZTs3X/+KY+BoPT7jjybzUi3VpQ0n7dzymilvhszrupPHc
        QLEqf8KXG3b0lAF2+tk7RjkOehgMFpA=
X-Google-Smtp-Source: APXvYqzGrjrrNnsMP+659FDYTPGsVDQ90O2UA4ZHGX60h4FU1LEqgSIrKokMAShLUquUhhJJe0zbQA==
X-Received: by 2002:a7b:c1d8:: with SMTP id a24mr7129734wmj.130.1576008878077;
        Tue, 10 Dec 2019 12:14:38 -0800 (PST)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id g2sm4439247wrw.76.2019.12.10.12.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2019 12:14:37 -0800 (PST)
Subject: Re: [PATCH] MIPS: Add KSEG*ADDR definitions to CONFIG_64BIT
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191210172739.27131-1-efremov@linux.com>
 <20191210185716.3lkhbuuqtzj2vs3l@lantea.localdomain>
From:   Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Message-ID: <54db9ec6-a60a-8202-72d8-dafef9eb2f0e@linux.com>
Date:   Tue, 10 Dec 2019 23:14:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191210185716.3lkhbuuqtzj2vs3l@lantea.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 10.12.2019 21:57, Paul Burton wrote:
> Hi Denis,
> 
> On Tue, Dec 10, 2019 at 08:27:39PM +0300, Denis Efremov wrote:
>> The patch adds KSEG0ADDR, KSEG1ADDR, KSEG2ADDR, KSEG3ADDR
>> definitions to CONFIG_64BIT ifdef. This fixes broken compilation:
>>   CC      drivers/watchdog/mtx-1_wdt.o
>> In file included from drivers/watchdog/mtx-1_wdt.c:44:
>> ./arch/mips/include/asm/mach-au1x00/au1000.h: In function ‘alchemy_rdsys’:
>> ./arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit
>>   declaration of function ‘KSEG1ADDR’; did you mean ‘CKSEG1ADDR’?
>>   [-Werror=implicit-function-declaration]
> 
> Since this driver is meant to run on a system that only supports 32 bit
> kernels, I think it would be better to correct its dependencies in
> Kconfig like so:
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 58e7c100b6ad..509cbb6d2cea 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1648,7 +1648,7 @@ config JZ4740_WDT
> 
>  config WDT_MTX1
>         tristate "MTX-1 Hardware Watchdog"
> -       depends on MIPS_MTX1 || (MIPS && COMPILE_TEST)
> +       depends on MIPS_MTX1 || (MIPS && 32BIT && COMPILE_TEST)
>         help
>           Hardware driver for the MTX-1 boards. This is a watchdog timer that
>           will reboot the machine after a 100 seconds timer expired.
> 
> And mark this with the appropriate fixes tag:
> 
>   Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> 
> What do you think?
> 
> Alternatively the driver could just use the existing & equivalent
> CKSEG1ADDR() macro as the compiler suggested, but in that case it'd be
> good to check that's the only change needed to build cleanly with
> CONFIG_64BIT=y.
> 

Thank you for the suggestion. I will prepare V2 and fix the same way other
drivers that break the compilation with CONFIG_64BIT and missing KSEG1ADDR.

> Thanks,
>     Paul
> 
