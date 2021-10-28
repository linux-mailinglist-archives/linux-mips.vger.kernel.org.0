Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CA543E828
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 20:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhJ1SVN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 14:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhJ1SVN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 14:21:13 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2B6C061570;
        Thu, 28 Oct 2021 11:18:45 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso9844314otp.5;
        Thu, 28 Oct 2021 11:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w7nWFW8rgu3q0FJszagEHVtFJX/cFWmjwdA+8hKw5zg=;
        b=pXuCBj8yAutcRX6qvtAU7WWgZE8NIL3D49yvBJaCXagUDCZ910n8nNwJaM2xph/9pN
         s1MSswiX6mgNShEdr4XPq2TX8Aq+MMFCZ9lg1vT8bHWvBhzfmjBV/EDht/ofFqJ9S90K
         2t6s7EUsLGVGYEy9F1zN1WxB07cpU1l6qV7BCHEQ0XDWFjgLwgJgX5fCuxko1WkWAQgL
         5Io9DxT9FjWDqXt5Iih/fwEL6q71PwZ086t+AGehpZzcpJR76yeiU7RyDAAZL1Gpir2J
         MeGbSoHWLi/JLS9iVaY27jq09K5d3JF2kC4suSTLhTvBr4uioOtkR+bA22BlZFN98WZo
         kvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=w7nWFW8rgu3q0FJszagEHVtFJX/cFWmjwdA+8hKw5zg=;
        b=KDonqAeVA2kl6rNFXPMpkkF+IrT31NVSnNyTv/R0GG2WLJ0tapJh6Cr1vfubHK0G8g
         FoZg+S0bBJ/yS5JMAuXVAZKnDFFlM0Wv36SjILCWrLdhPJcvBFxgcPPcJZ3lIKhhFkR1
         muDqvAdNcXFCt1n+q53W2cylxm959KpKQ7gKnmrlJFNP4IbGqGaxjwbYxAnb3g4fwUTf
         O1eyE/XGj1MaAY+l9c/RPIS9Cn+NMqQhFrX9uRb9a4piu83CugWBEVZcHw02KPy8W4I/
         6Gyx2J1O83Kl3x4YWLeWdNv6wN2LQ815SE3jS0G0TBUtGjIt441/B7j0WAvlcY8rE9IN
         D0Ig==
X-Gm-Message-State: AOAM533vh56pK2Suh/JLd1K9A6g7mduYncAhNSAeNajOoFV2MVcGQpEP
        c8qE/SnfA1cXrG1DUxMnDOo=
X-Google-Smtp-Source: ABdhPJxigRqXKW/EelfF19Fcv0BBcLzdCKtUu6DSQr8700pekQ3SmkW/ey1jRNHTINR1CzJLbqW5Sg==
X-Received: by 2002:a9d:57c9:: with SMTP id q9mr4804013oti.281.1635445125121;
        Thu, 28 Oct 2021 11:18:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x17sm331109otp.78.2021.10.28.11.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:18:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 28 Oct 2021 11:18:42 -0700
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
Subject: Re: [PATCH 3/7] watchdog: bcm7038_wdt: Support platform data
 configuration
Message-ID: <20211028181842.GA705675@roeck-us.net>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
 <20211028172322.4021440-4-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028172322.4021440-4-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 28, 2021 at 10:23:18AM -0700, Florian Fainelli wrote:
> The BCM7038 watchdog driver needs to be able to obtain a specific clock
> name on BCM63xx platforms which is the "periph" clock ticking at 50MHz.
> make it possible to specify the clock name to obtain via platform data.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm7038_wdt.c            | 8 +++++++-
>  include/linux/platform_data/bcm7038_wdt.h | 8 ++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/platform_data/bcm7038_wdt.h
> 
> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
> index acaaa0005d5b..506cd7ef9c77 100644
> --- a/drivers/watchdog/bcm7038_wdt.c
> +++ b/drivers/watchdog/bcm7038_wdt.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_data/bcm7038_wdt.h>
>  #include <linux/pm.h>
>  #include <linux/watchdog.h>
>  
> @@ -133,8 +134,10 @@ static void bcm7038_clk_disable_unprepare(void *data)
>  
>  static int bcm7038_wdt_probe(struct platform_device *pdev)
>  {
> +	struct bcm7038_wdt_platform_data *pdata = pdev->dev.platform_data;
>  	struct device *dev = &pdev->dev;
>  	struct bcm7038_watchdog *wdt;
> +	const char *clk_name = NULL;
>  	int err;
>  
>  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> @@ -147,7 +150,10 @@ static int bcm7038_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
> -	wdt->clk = devm_clk_get(dev, NULL);
> +	if (pdata && pdata->clk_name)
> +		clk_name = pdata->clk_name;
> +
> +	wdt->clk = devm_clk_get(dev, clk_name);
>  	/* If unable to get clock, use default frequency */
>  	if (!IS_ERR(wdt->clk)) {
>  		err = clk_prepare_enable(wdt->clk);
> diff --git a/include/linux/platform_data/bcm7038_wdt.h b/include/linux/platform_data/bcm7038_wdt.h
> new file mode 100644
> index 000000000000..e18cfd9ec8f9
> --- /dev/null
> +++ b/include/linux/platform_data/bcm7038_wdt.h
> @@ -0,0 +1,8 @@
> +#ifndef __BCM7038_WDT_PDATA_H
> +#define __BCM7038_WDT_PDATA_H
> +
> +struct bcm7038_wdt_platform_data {
> +	const char *clk_name;
> +};
> +
> +#endif /* __BCM7038_WDT_PDATA_H */
> -- 
> 2.25.1
> 
