Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4079D390089
	for <lists+linux-mips@lfdr.de>; Tue, 25 May 2021 14:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbhEYMFf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 May 2021 08:05:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49362 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbhEYMFe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 May 2021 08:05:34 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llVn1-00085o-8e
        for linux-mips@vger.kernel.org; Tue, 25 May 2021 12:04:03 +0000
Received: by mail-vs1-f71.google.com with SMTP id q16-20020a67d7900000b0290228198e77b6so12769975vsj.23
        for <linux-mips@vger.kernel.org>; Tue, 25 May 2021 05:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ov2aOGWwe13sRFaggK9ebqlQkrTYdvNCRKExlndHI9g=;
        b=CdWVG4iJAqmPCpfjeqtSXQOELj5jhlAOw3t5Kh6+oouBaNeWwmHVTxdhDXpm7RJK+y
         kUR4AanyFsLb/aFUZIV5skp3SUybn+TjNS8kegVsRj92p8psJqdpZv6AQ24fdF6yhcmJ
         XjuwKFzcsiC6jv8phaaekaj5l1EyFtenoemaBtKSWnxcxedZ6YI2apmWHaPycqN8UkHk
         AJ4kIUPxwoK9uV5gB2l9lirS+TBuh+Xg9DJ52z8PjJBZPSDu2uUgcLogMStneq/ngbOF
         Su4zGljDPFgyuFJzdsrzMzLAGDSGABxtqVA3pY7Ya5lgw15o83UFVXP/YeX46g1l2dkP
         jgVg==
X-Gm-Message-State: AOAM532NgrZrpooyBnXXiMpLvf9mr70Whth0YfuYrmdnB0B/wNke7F5n
        H60D0KqvPqKA3pnlUeozXF9TyqOVNvk/XGcYqYJIns05SIE9ntiCiEoUJd6iJlsswEuFD9sEP8n
        ousls03pSzLA52imlO9DoRJf4hWH/Ks5ygsZnRAo=
X-Received: by 2002:a05:6122:a16:: with SMTP id 22mr24550332vkn.18.1621944242240;
        Tue, 25 May 2021 05:04:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/dj3Oduy8Xo23it+mIa7HBuI+j2VM7Wl2RfwLkeKdxRH0+SiUcz9Gmlw4vhVOBjjBWTrS3w==
X-Received: by 2002:a05:6122:a16:: with SMTP id 22mr24550298vkn.18.1621944241996;
        Tue, 25 May 2021 05:04:01 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.1])
        by smtp.gmail.com with ESMTPSA id b81sm1247160vke.8.2021.05.25.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 05:04:01 -0700 (PDT)
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK
 enabled
To:     Dmitry Osipenko <digetx@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
References: <20210523232556.15017-1-digetx@gmail.com>
 <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
 <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f12b4622-6cea-ac65-2d94-f50a85c29215@canonical.com>
Date:   Tue, 25 May 2021 08:03:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/05/2021 08:39, Dmitry Osipenko wrote:
> 24.05.2021 11:54, Geert Uytterhoeven пишет:
>> Hi Dmitry,
>>
>> On Mon, May 24, 2021 at 1:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>> There are couple older platforms that can't be compile-tested because they
>>> partially implement CLK API. It causes build failure of kernel drivers due
>>> to the missing symbols of the unimplemented part of CLK API.
>>>
>>> These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
>>>                      MIPS Ralink.
>>>
>>> Disable compile-testing for HAVE_LEGACY_CLK=y.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>
>> Thanks for your patch!
>>
>>> --- a/init/Kconfig
>>> +++ b/init/Kconfig
>>> @@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
>>>
>>>  config COMPILE_TEST
>>>         bool "Compile also drivers which will not load"
>>> -       depends on HAS_IOMEM
>>> +       depends on HAS_IOMEM && !HAVE_LEGACY_CLK
>>
>> That sounds a bit drastic to me.  Usually we just try to implement the
>> missing functionality, or provide stubs.
>> Which functions are missing?
> 
> Everything that belongs to CONFIG_COMMON_CLK needs stubs.
> 
> That is everything under CONFIG_HAVE_CLK [1], excluding functions
> belonging to clk-devres.o and clk-bulk.o [2]. The HAVE_LEGACY_CLK
> selects HAVE_CLK, but the COMMON_CLK is under HAVE_CLK too.
> 
> [1]
> https://elixir.bootlin.com/linux/v5.13-rc3/source/include/linux/clk.h#L786
> [2]
> https://elixir.bootlin.com/linux/v5.13-rc3/source/drivers/clk/Makefile#L3
> 
> This problem is repeated over and over again for the past years. Some
> maintainers are adding "depends on COMMON_CLK" for COMPILE_TEST of each
> driver, but this doesn't solve the root of the problem, and thus, it's
> constantly reoccurring.
> 
> Recently Krzysztof Kozlowski added couple more clk stubs for MIPS, but
> still lots of stubs are missing. Some platforms don't have any stubs at
> all and apparently nobody cares to fix them.
> 
> There 3 possible solutions:
> 
> 1. Factor out COMMON_CLK from HAVE_LEGACY_CLK, if this is possible
> 2. Build stubs universally, maybe using weak functions.

I vote for this one - global stubs.

Or for a new one:
4. Disable COMPILE_TEST for specific platforms (mentioned in commit
msg). Eventually could be like:
config RALINK
	depends !COMPILE_TEST || (COMPILE_TEST && COMMON_CLK)

Why? Because it is expected that a driver requiring/using missing clock
stubs won't run on such legacy platform. Currently it cannot run because
simply missing stubs will break build. Option (2) would make them
compileable but not runnable, which is fine. However having a build time
failure is better, so maybe let's just isolate platforms which are very
poor in compile testing and don't enable them for most of the configs.


Best regards,
Krzysztof
