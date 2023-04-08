Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D720E6DB7D8
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 02:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjDHAag (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 20:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDHAag (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 20:30:36 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A638EF98
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 17:30:35 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id bg24so68435oib.5
        for <linux-mips@vger.kernel.org>; Fri, 07 Apr 2023 17:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680913834; x=1683505834;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KY6vvqTotGVdlRSB6tps3V/rtAHtE/eNVXsZ2/tAps=;
        b=RMwxxBfEpnmf0Yuryo/JlIfO16gpN8+L+qL9Ha8tii9baEBWfILGNsYqrXDBLK77Fa
         nV41zK0bkSavr3sBO1EHPn2nSBckthzdno76UQnBPA5vZ71bcnlgvuUdmBFWaWsY/Ku4
         5H0Ta/BHFWTq2rD5M1eeyfGzP2glLEWbMS2D7XQxpzMIwF+0u5XUN4C3ClPf4TDPYft+
         PjHY4PkDNt1wennAn5rQzs8UMcJlydgIVrNsVujCSWmMfdepc8BCXwxiEGw5QusyWg5Z
         yHu95X/BBqVdzqFnaySYvwIeTvhAtpSL3HqcFeu8K3FQD3vnuiFuwJDbulZC5B1XMWGT
         J7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680913834; x=1683505834;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KY6vvqTotGVdlRSB6tps3V/rtAHtE/eNVXsZ2/tAps=;
        b=YHXz4kCkF5lvjttG/4usnuiej/4J8kA93E+QWYWzTB5Lnt0INC9Gk7Ze8GJOj5S4Uv
         5ME1PiQp/eRSDE9zSQbQzNTRy0P2k++t9qhzPYnn6MFNXFhhZWloTednMJcWFbaSrHIf
         exNjmtJsESUIKUbiVdb5pKLQb6pGCFmBd3T+nKXGRnYziACmE6t3Pj8MkoliqSsdzo9/
         SDXIo1+5lxuYdD4cSS8U6Wuu36G3C/cFM1Lb2ZpLwROeFHJxh+USixDRmSqjGRl3S+DR
         q66oy+x2H0Hzfiw/alu5/bPk+U3HDdWKkZje7MswjUWl/6GUOxJPsvB5Y8BEJ54jMh4L
         Mb7w==
X-Gm-Message-State: AAQBX9dDyUkWQk5K+SvqyaCBgeRoxbNE9dFPIL4/tsPz7gcLvmi4lTvz
        qX9FwA/3a/0WuVbbvbJzpCBNl2S2F4E=
X-Google-Smtp-Source: AKy350b9szkdfJp9afT9V93Xu/QZ2R82P8Dv922tUi3X2yU4bZbLdJ6da2vfS1oYIH3ixICzPNu8Wg==
X-Received: by 2002:a05:6808:2c3:b0:389:c44:1264 with SMTP id a3-20020a05680802c300b003890c441264mr289535oid.49.1680913834541;
        Fri, 07 Apr 2023 17:30:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10-20020acac00a000000b003848dbe505fsm2129075oif.57.2023.04.07.17.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 17:30:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <984bbd06-0fbf-3c97-32a1-a6b60af4b3d3@roeck-us.net>
Date:   Fri, 7 Apr 2023 17:30:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
In-Reply-To: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
        FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/7/23 15:35, Jiaxun Yang wrote:
> MIPS MT ASE is only available on ISA between Release 1 and Release 5.
> Add ISA level dependency to Kconfig to fix build.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

With this patch in place, I still get the second build failure.

In file included from <command-line>:
arch/mips/mm/init.c: In function 'mem_init':
././include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_437' declared with attribute error: BUILD_BUG_ON failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
   397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
       |                                             ^
././include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
   378 |                         prefix ## suffix();                             \
       |                         ^~~~~~
././include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
   397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
       |         ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
       |                                     ^~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
       |         ^~~~~~~~~~~~~~~~
arch/mips/mm/init.c:454:9: note: in expansion of macro 'BUILD_BUG_ON'
   454 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));

Also, MIPS_MT_SMP is disabled, CONFIG_TARGET_ISA_REV=0, and CPU_MIPSR{1,2,6}
is not set. Prior to "MIPS: generic: Enable all CPUs supported by virt board
in Kconfig", the configuration was

CONFIG_CPU_MIPS32_R1=y
CONFIG_CPU_MIPS32=y
CONFIG_CPU_MIPSR1=y
CONFIG_TARGET_ISA_REV=1
CONFIG_MIPS_MT_SMP=y

Ultimately it is not my decision to make what should be enabled with
mips:allmodconfig, but to me it looks like "MIPS: generic: Enable all CPUs
supported by virt board in Kconfig" doesn't enable but disable various
configurations.

Thanks,
Guenter

> ---
>   arch/mips/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 5e399a5ac3b3..ecc7a755fae6 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2194,7 +2194,8 @@ config CPU_R4K_CACHE_TLB
>   config MIPS_MT_SMP
>   	bool "MIPS MT SMP support (1 TC on each available VPE)"
>   	default y
> -	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MIPSR6 && !CPU_MICROMIPS
> +	depends on TARGET_ISA_REV > 0 && TARGET_ISA_REV < 6
> +	depends on SYS_SUPPORTS_MULTITHREADING && !CPU_MICROMIPS
>   	select CPU_MIPSR2_IRQ_VI
>   	select CPU_MIPSR2_IRQ_EI
>   	select SYNC_R4K

