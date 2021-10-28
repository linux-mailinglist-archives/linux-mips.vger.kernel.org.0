Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CF043E82D
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 20:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbhJ1SVZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 14:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhJ1SVY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 14:21:24 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1C0C061570;
        Thu, 28 Oct 2021 11:18:57 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id x16-20020a9d7050000000b00553d5d169f7so8132596otj.6;
        Thu, 28 Oct 2021 11:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hJJvM4OVSq3FE6QwPUFBXHlNCsmWmONWQDVttZJn9Ow=;
        b=puLXBz6j2oPa7Vm0NTlP3SNMF+eeN8O35oik51cstM6oBN/v2Mt8jD02q9DxgaLLVx
         4POc1hddzvmQdwm0Dsz/MX6Ra+9f1au9OEy1jrtCI6oPXSyDqdN05BVD+erT/+dQdzya
         92aS+uBT3rssNtdyrZuQpjlfTNNidUbJlYDEFDc4zc7NTmGFeY5u08lI5XGkWnixeJsz
         xKZP2RyrIhjrTeyNOkkHIT3mnwk+5DZGs84UZdp2PXFAUkeUNQ5rZ6EHIhE5gSQefJT4
         QWHpTd+kx9wGejNMY20sUg+/Kf0WTt+MTt7X/XCGV5PGgne5lpGeFlkPh8Tc6WKB2uGl
         dQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=hJJvM4OVSq3FE6QwPUFBXHlNCsmWmONWQDVttZJn9Ow=;
        b=gPIvDR4HgyiVFtQL9ate9cC1MAZeQS/F4nkzoMpuYe0jRgLmxYT8cVX/ZUr9LW/Hmp
         0yHACUVjm+z0/PkCIHT1jDgsWg9oLj7VzSATVs6WqwLq/GU1IaRwk7Dy69cPDUMqShKw
         SXqZ5Bvjt5+x69j4tNoawxqKf6qPZF3DJb0jZs9SNYYWdu4NvDg2DS+gfWJO4kBHhzXY
         PhT9ywxoBDaF9cd1WzUpA8Z7k5oM5cyNMb6UDvD2C9R1iFAv1YI34b7F+7W0KBOkmXKQ
         A0H6L0UWCvfXTpY/fq+tO1D3uprGcVGrgbB1jqtxaWABwxslUQ/j8mbWoiBgUVPeV9c1
         8+dw==
X-Gm-Message-State: AOAM5324+kkyLXxqdaI9tpb5gRQgm9uaY8Pj4Bsl91na+hVOg+9V7OM7
        pngeCU6zmSyvtf75OKvzaVA=
X-Google-Smtp-Source: ABdhPJw6lPestbj12caiCcuQsgAKktCzOhUyeJGLMw4Q+USzTs0xyfmmIEAE6RKKRvIUwg0lYXLATw==
X-Received: by 2002:a05:6830:1d6e:: with SMTP id l14mr4629805oti.147.1635445137239;
        Thu, 28 Oct 2021 11:18:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c17sm1398513ots.35.2021.10.28.11.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:18:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 28 Oct 2021 11:18:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, rafal@milecki.pl,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "maintainer:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Justin Chen <justinpopo6@gmail.com>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "moderated list:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/7] watchdog: Allow building BCM7038_WDT for BCM63XX
Message-ID: <20211028181855.GB705675@roeck-us.net>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
 <20211028172322.4021440-5-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028172322.4021440-5-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 28, 2021 at 10:23:19AM -0700, Florian Fainelli wrote:
> CONFIG_BCM63XX denotes the legacy MIPS-based DSL SoCs which utilize the
> same piece of hardware as a watchdog, make it possible to select that
> driver for those platforms.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..24a775dd2bf1 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1756,12 +1756,13 @@ config BCM7038_WDT
>  	tristate "BCM7038 Watchdog"
>  	select WATCHDOG_CORE
>  	depends on HAS_IOMEM
> -	depends on ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST
> +	depends on ARCH_BRCMSTB || BMIPS_GENERIC || BCM63XX || COMPILE_TEST
>  	help
>  	 Watchdog driver for the built-in hardware in Broadcom 7038 and
>  	 later SoCs used in set-top boxes.  BCM7038 was made public
>  	 during the 2004 CES, and since then, many Broadcom chips use this
> -	 watchdog block, including some cable modem chips.
> +	 watchdog block, including some cable modem chips and DSL (63xx)
> +	 chips.
>  
>  config IMGPDC_WDT
>  	tristate "Imagination Technologies PDC Watchdog Timer"
> -- 
> 2.25.1
> 
