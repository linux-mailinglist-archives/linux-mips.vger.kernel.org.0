Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DC4380AAF
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 15:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhENNua (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 09:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhENNuO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 May 2021 09:50:14 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BA7C061574;
        Fri, 14 May 2021 06:49:01 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id k127so28721183qkc.6;
        Fri, 14 May 2021 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v7envtOK34MisCuunSy9i4m5rHJ2gBT5MkdwSIGdAWs=;
        b=dNAZUugxYkn+hF4br8MJ38OZrDb7y6n7LxDIlNrqTTFx4rqs5s+ZtEdj/D7Ynf/xIc
         HFeZfxCFeYT7/Xt5AIqgyvf7G6gxZJ/3oPhBywL9PMglXz9/ML+NZVyx55krs2OxtHIH
         aDfyLpKrX/5RdRn/Y05xa2piLhxIuqu55YoRam4+JR7CFSPJWeGZf99mzvKFvCqVcyr1
         jvggqwYZJXI3VlMbhjIR1pFXBzik8ky8ni7DJzXh1cuGt9R83Kn1U3R1BS5klqGENYT5
         OKqAlPVBx3d1+oVmMsF3PIT2mV5H0177bMGeJOO/Ug92M0IZyKlnt783DuePUCio2Nm/
         3C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v7envtOK34MisCuunSy9i4m5rHJ2gBT5MkdwSIGdAWs=;
        b=j+JyNGkluVAwnPFndCpjoGEdPPJBMBo9PH0WXC3iXr0C2ZSQcAjSXTHvwjpvylmMdU
         pPgb+GlJ0dZfVrl9Dg3c4aHdj+fSM0xYIEuIbPdjFPSqHZV8+8b8/uVFZIpKEppVepZJ
         ULHWPqw+q5MFyZCai5m8d0xD5LhWRCk4cn4R02BSLCL1H3x4fq8Eq0SG+/O05pdgF2Gu
         DHN+IOdZEuXOWEqR7uggMYrAY/TOIIfYLaD7XBBB7kRNAOIW+8JBly9pdUo6CJ4Npzr+
         lM/UR+XsZOpGOpsYpN2he63vw70SiFnZFnlk5engfpd3e/k52R0BgVAUELsQVcCvqHXZ
         KccQ==
X-Gm-Message-State: AOAM532fn5SbBNXFaInarf9wP1LG5ZHXRe1o9BEh9LMOwUn8/MsWWwJu
        BoqbfBnYNale6Q0EsIIvkr8=
X-Google-Smtp-Source: ABdhPJxtT1LtsCTv7tdzgTtzPh+9uvCtjpGbihG6efIy/RujCNJRHtAKN9mYrCcS0p+lVYvZbuhGNg==
X-Received: by 2002:a37:9e44:: with SMTP id h65mr43929384qke.297.1621000140911;
        Fri, 14 May 2021 06:49:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l197sm4881001qke.121.2021.05.14.06.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 06:49:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel test robot <lkp@intel.com>
References: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
Date:   Fri, 14 May 2021 06:48:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/14/21 6:17 AM, Krzysztof Kozlowski wrote:
> When rt2880_wdt watchdog driver is built as a module, the
> rt_sysc_membase needs to be exported (it is being used via inlined
> rt_sysc_r32):
> 
>    ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

I don't see a recent change in the code. Has that problem been there
all along ?

Thanks,
Guenter

> ---
>   arch/mips/ralink/of.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
> index 0c5de07da097..b3ce706426c4 100644
> --- a/arch/mips/ralink/of.c
> +++ b/arch/mips/ralink/of.c
> @@ -24,6 +24,8 @@
>   #include "common.h"
>   
>   __iomem void *rt_sysc_membase;
> +EXPORT_SYMBOL_GPL(rt_sysc_membase);
> +
>   __iomem void *rt_memc_membase;
>   
>   __iomem void *plat_of_remap_node(const char *node)
> 

