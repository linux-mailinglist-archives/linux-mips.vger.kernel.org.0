Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6BC1E8B89
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 00:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgE2Ww3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 18:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgE2Ww2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 18:52:28 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D519C03E969;
        Fri, 29 May 2020 15:52:28 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h95so1167904pje.4;
        Fri, 29 May 2020 15:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l2g6AswkQDY80i2eYD3J7aNhVL15I0Q1IY2Nn0B/8sk=;
        b=gCZ1YFw495sK/be7nWcidn4eBWLcxj68Uo4kSj+6INdu8797I6qnKpoMrgBPCv8MOL
         5T+ndb4ADpw1U6UmM6sQOp9vK5+13ZhGPInzcsQdsVvuGjJ2F9fr4uMhq33m6NnehtmU
         gYqcsl6RuaDFKx//V7dSC9VNDy19jD1L2r7K2a6wL0c3i62d9r4kBV0YQ9zXT0SthTFs
         vCh739B90WbDM1u7NLn3Fifreuk9i2NSFy24Ac3Dpn1kWBQ98xuuiKl4DwfQTmUFm4ts
         7/SZRizEK74YiX2nmufnRSKpsGWbGmGfK4ADh3EvoKPGUyYya/ByHeBsAMpT7x0e1GaE
         Am0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=l2g6AswkQDY80i2eYD3J7aNhVL15I0Q1IY2Nn0B/8sk=;
        b=Cb93jJsBepflRo8Pr3DRkEMUNmCikxi1L9k+Hm5VMUKnNI0jOjVK759h5IkkbP0Ojb
         0h7f8Nro96To/RrvPIYG2eOYfidyNYOnLVMQ1Gi1oJgEc/Kdda+RxJleRlwPfcmfN1YS
         vCIqUc+5n+1fg1vO2xQjHDN/h6NrsyGYGg5+gxfn2gv3COqCouD9P0GCR3PK0yZPnoBt
         JQiL0JcdIDQB6y1wmAdBgm1iJZKYrYKo0Mj5efgEleE0I13iN1BDfVPZrNVDJbQbWVXp
         CneAB2fRPJEYwF7HOVuMisldIJ7uztked2QfTyzoem0rE8Oav1dfC3xL3J9m8RzNetz/
         yxpg==
X-Gm-Message-State: AOAM5333x0kRCQ0+KO92QRtyMTrKy4Vv0pOTFtH3vh3D1bbVIOuX96AP
        sit+mxEpgLTnGZOiju1M+ns=
X-Google-Smtp-Source: ABdhPJz/N+nCo4Y1gLqHsh3azHN2EuMkNo/OHVcljf+jESCzvI7ZwqltOWzfdSUezNqqfOcNo/GNTg==
X-Received: by 2002:a17:902:47:: with SMTP id 65mr10125817pla.54.1590792747811;
        Fri, 29 May 2020 15:52:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id co16sm390730pjb.55.2020.05.29.15.52.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 15:52:27 -0700 (PDT)
Date:   Fri, 29 May 2020 15:52:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/7] watchdog: dw_wdt: Support devices with asynch
 clocks
Message-ID: <20200529225226.GA193860@roeck-us.net>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
 <20200526154123.24402-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526154123.24402-6-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 06:41:21PM +0300, Serge Semin wrote:
> DW Watchdog IP core can be synthesised with asynchronous timer/APB
> clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
> separate clock signals are supposed to be used to feed watchdog timer
> and APB interface of the device. Currently the driver supports
> the synchronous mode only. Since there is no way to determine which
> mode was actually activated for device from its registers, we have to
> rely on the platform device configuration data. If optional "pclk"
> clock source is supplied, we consider the device working in asynchronous
> mode, otherwise the driver falls back to the synchronous configuration.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changelog v2:
> - Rearrange SoBs.
> ---
>  drivers/watchdog/dw_wdt.c | 48 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 693c0d1fd796..efbc36872670 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -68,6 +68,7 @@ struct dw_wdt_timeout {
>  struct dw_wdt {
>  	void __iomem		*regs;
>  	struct clk		*clk;
> +	struct clk		*pclk;
>  	unsigned long		rate;
>  	struct dw_wdt_timeout	timeouts[DW_WDT_NUM_TOPS];
>  	struct watchdog_device	wdd;
> @@ -274,6 +275,7 @@ static int dw_wdt_suspend(struct device *dev)
>  	dw_wdt->control = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
>  	dw_wdt->timeout = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  
> +	clk_disable_unprepare(dw_wdt->pclk);
>  	clk_disable_unprepare(dw_wdt->clk);
>  
>  	return 0;
> @@ -287,6 +289,12 @@ static int dw_wdt_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	err = clk_prepare_enable(dw_wdt->pclk);
> +	if (err) {
> +		clk_disable_unprepare(dw_wdt->clk);
> +		return err;
> +	}
> +
>  	writel(dw_wdt->timeout, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  	writel(dw_wdt->control, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
>  
> @@ -393,9 +401,18 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(dw_wdt->regs))
>  		return PTR_ERR(dw_wdt->regs);
>  
> -	dw_wdt->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(dw_wdt->clk))
> -		return PTR_ERR(dw_wdt->clk);
> +	/*
> +	 * Try to request the watchdog dedicated timer clock source. It must
> +	 * be supplied if asynchronous mode is enabled. Otherwise fallback
> +	 * to the common timer/bus clocks configuration, in which the very
> +	 * first found clock supply both timer and APB signals.
> +	 */
> +	dw_wdt->clk = devm_clk_get(dev, "tclk");
> +	if (IS_ERR(dw_wdt->clk)) {
> +		dw_wdt->clk = devm_clk_get(dev, NULL);
> +		if (IS_ERR(dw_wdt->clk))
> +			return PTR_ERR(dw_wdt->clk);
> +	}
>  
>  	ret = clk_prepare_enable(dw_wdt->clk);
>  	if (ret)
> @@ -407,10 +424,27 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  		goto out_disable_clk;
>  	}
>  
> +	/*
> +	 * Request APB clock if device is configured with async clocks mode.
> +	 * In this case both tclk and pclk clocks are supposed to be specified.
> +	 * Alas we can't know for sure whether async mode was really activated,
> +	 * so the pclk phandle reference is left optional. If it couldn't be
> +	 * found we consider the device configured in synchronous clocks mode.
> +	 */
> +	dw_wdt->pclk = devm_clk_get_optional(dev, "pclk");
> +	if (IS_ERR(dw_wdt->pclk)) {
> +		ret = PTR_ERR(dw_wdt->pclk);
> +		goto out_disable_clk;
> +	}
> +
> +	ret = clk_prepare_enable(dw_wdt->pclk);
> +	if (ret)
> +		goto out_disable_clk;
> +
>  	dw_wdt->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
>  	if (IS_ERR(dw_wdt->rst)) {
>  		ret = PTR_ERR(dw_wdt->rst);
> -		goto out_disable_clk;
> +		goto out_disable_pclk;
>  	}
>  
>  	reset_control_deassert(dw_wdt->rst);
> @@ -449,10 +483,13 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  
>  	ret = watchdog_register_device(wdd);
>  	if (ret)
> -		goto out_disable_clk;
> +		goto out_disable_pclk;
>  
>  	return 0;
>  
> +out_disable_pclk:
> +	clk_disable_unprepare(dw_wdt->pclk);
> +
>  out_disable_clk:
>  	clk_disable_unprepare(dw_wdt->clk);
>  	return ret;
> @@ -464,6 +501,7 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
>  
>  	watchdog_unregister_device(&dw_wdt->wdd);
>  	reset_control_assert(dw_wdt->rst);
> +	clk_disable_unprepare(dw_wdt->pclk);
>  	clk_disable_unprepare(dw_wdt->clk);
>  
>  	return 0;
