Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F7F38E6BE
	for <lists+linux-mips@lfdr.de>; Mon, 24 May 2021 14:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbhEXMkw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 May 2021 08:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbhEXMkv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 May 2021 08:40:51 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4253FC061574;
        Mon, 24 May 2021 05:39:23 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i9so40451808lfe.13;
        Mon, 24 May 2021 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=13zcyWdsm4gpffNG5ZgDMwvczQG34AV4139pdXe/s/0=;
        b=Ukzs1lpffefInt+Tc3rj13rbWCFBfbLYbuOBDb1j5YTp/JNEMJrM+0BS9pYYP38s9n
         7HnDgswflfy/VLz9qqAzPEQ99K+h8Qw9BP4SNjW8CFWmWgh5JMUSDfFAJeK+RZdsaGGL
         E/Dufo5c9cUI5wYk5ZS925uvNbuEl/D0DVzT9JJnHjAK1LG65AMdNhVEY5bjp2L2ZkJx
         xTyf1oVqYbmYguDJ4dsI4rGt5dv+nSIZOdciE20NRNrrOmtUf9V4AfSlhip/ALqlXDCi
         a3xqCn7eZwwF4XtCyKGnbWeeDVyinyJ8tey0f34ksGlX16trBozo1SFW0R8FUHxTuMe2
         gCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=13zcyWdsm4gpffNG5ZgDMwvczQG34AV4139pdXe/s/0=;
        b=JPtwYE8hRhKABXJqAdQPEmS/j++lk9UmOM98vt2+exheyVdkYJyhD3XKbkieLeMkqL
         /UHrG5P34T7pgyKMjm7tYUro2k/bNz5UjhoS0FeZtZeMRMrF+PUZDhp2E6Nexp93rb1f
         DVVmp2GE0TIukOoJtXuZoF9czCz2kJ3gmg+tGP5aQRuWZb6Hg8CDqHeWhOmUvWH6SkVx
         VUVniWHnHdYwP0nz2h3s4ZhLVBgyW5KMY2K4TIG2Uf6Qck41AbhHhcSAyEpiIIVdieG9
         2wkXGhDq7EseZM03ePl8uRyWjf6rPdDGtFegsHRW6OgBREFluVHCx3ZKSM7UvuOhJlug
         9OfQ==
X-Gm-Message-State: AOAM533KhURQfuH5gHNIe/ch3AcEg24inlOXm8PTgtQ+2smqFB8dpza0
        JZsPVjBoZ88+S3e9qraZZZD7vr48hSM=
X-Google-Smtp-Source: ABdhPJyhCOFQn/Z1pKRmtZeJWu1d4dSY2QLiSj+ONw56eIR3cGKanVoF3Tn/DOinhtQ09s5N7gDupw==
X-Received: by 2002:a05:6512:128c:: with SMTP id u12mr10567429lfs.160.1621859961442;
        Mon, 24 May 2021 05:39:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id p21sm1409745lfg.97.2021.05.24.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 05:39:21 -0700 (PDT)
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK
 enabled
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com>
Date:   Mon, 24 May 2021 15:39:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

24.05.2021 11:54, Geert Uytterhoeven пишет:
> Hi Dmitry,
> 
> On Mon, May 24, 2021 at 1:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>> There are couple older platforms that can't be compile-tested because they
>> partially implement CLK API. It causes build failure of kernel drivers due
>> to the missing symbols of the unimplemented part of CLK API.
>>
>> These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
>>                      MIPS Ralink.
>>
>> Disable compile-testing for HAVE_LEGACY_CLK=y.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Thanks for your patch!
> 
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
>>
>>  config COMPILE_TEST
>>         bool "Compile also drivers which will not load"
>> -       depends on HAS_IOMEM
>> +       depends on HAS_IOMEM && !HAVE_LEGACY_CLK
> 
> That sounds a bit drastic to me.  Usually we just try to implement the
> missing functionality, or provide stubs.
> Which functions are missing?

Everything that belongs to CONFIG_COMMON_CLK needs stubs.

That is everything under CONFIG_HAVE_CLK [1], excluding functions
belonging to clk-devres.o and clk-bulk.o [2]. The HAVE_LEGACY_CLK
selects HAVE_CLK, but the COMMON_CLK is under HAVE_CLK too.

[1]
https://elixir.bootlin.com/linux/v5.13-rc3/source/include/linux/clk.h#L786
[2]
https://elixir.bootlin.com/linux/v5.13-rc3/source/drivers/clk/Makefile#L3

This problem is repeated over and over again for the past years. Some
maintainers are adding "depends on COMMON_CLK" for COMPILE_TEST of each
driver, but this doesn't solve the root of the problem, and thus, it's
constantly reoccurring.

Recently Krzysztof Kozlowski added couple more clk stubs for MIPS, but
still lots of stubs are missing. Some platforms don't have any stubs at
all and apparently nobody cares to fix them.

There 3 possible solutions:

1. Factor out COMMON_CLK from HAVE_LEGACY_CLK, if this is possible
2. Build stubs universally, maybe using weak functions.
3. Disable compile-testing for HAVE_LEGACY_CLK

The third option is the simplest. If anyone will care to fix those
legacy platforms properly, then compile-testing could be re-enabled for
them. This is my proposal.
