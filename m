Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A00D81E8B82
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 00:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgE2WuZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 18:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgE2WuY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 18:50:24 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5197C03E969;
        Fri, 29 May 2020 15:50:24 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 185so577880pgb.10;
        Fri, 29 May 2020 15:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iTM72MGLxFRXjmOn9EdIM1+rWPiMf7F4szuyS/1na2Y=;
        b=D6yDz+ETu3AXMPWLRuC1cYmWdlLcAsVC1t6moAQBYL4DZayvMDMs3tlKWKAd9nRW9d
         OGU+xtQxdBl/wtPlrvh2SOGTpTw/VhGu+/B6TuYCItMgQsIP+LjDy/ZHMr5LmhgT1qLs
         kYXlt5Cb785trutQdFXkSn/kONpET/b7qeYb8Lt8rgpI3/1nKxtLABRc5rPcWKYObpXs
         eabfIgXYvJiHCo8spWxX4xGMk/LTrcQQqdJzwtULva3gazMF2446Z8q5XOvUaLpPHfKH
         o11Be9SEhIbrsebd8P5MpfnnoqnLQlZAUwb43XXYCwxpVEuHKzkpNztI2Ty4IU7GaadW
         2lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=iTM72MGLxFRXjmOn9EdIM1+rWPiMf7F4szuyS/1na2Y=;
        b=Gwfb9/1JKeWu6vVGU4d+pLxH5CKskfDvbHe1pTm5fsfPg5a2sHF/1+AAmvCeU2xMrl
         fcCnLu4cMeUDEftYED36UOHYCy06iWXtfOBkds+/OTiTyH8HZuTyHLykeOh1f/qpRyZA
         iLhtLQxQll7Yo0DVv7biqaQmsWdpd9nBMg5L7YzmS5vz19lQebHNsZ8NpK7haY7cb5tm
         CgPUFOluQ5s22P3ZqbwOGwD/oqB72yw323REa8p+Mmldmy3/yTYbpOQFxuhwOPjLXm98
         J2drcSwAiIsT7jJ5Q4zcS3AmSFuhGplWQsShcHX8xlZwMtFE8bCaySXo6XlqGrtUc/gb
         sUjw==
X-Gm-Message-State: AOAM5331tlRLrfn7Yno1ETz3ZtE9Bdca+6fHwfZQ/vdEnvhg6nMKIuVl
        dYVwJ+j8mxd2O1rGyADlgcYT8V80
X-Google-Smtp-Source: ABdhPJw0JUdwFCgxxEkiRj9Vem0nuVxul/YMo4QgDWSIg3P7cCxYq62sFb/DbFJAl9fhDNrAXeLymw==
X-Received: by 2002:a62:7b0b:: with SMTP id w11mr11291042pfc.7.1590792623872;
        Fri, 29 May 2020 15:50:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w190sm7951335pfw.35.2020.05.29.15.50.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 15:50:23 -0700 (PDT)
Date:   Fri, 29 May 2020 15:50:22 -0700
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
Subject: Re: [PATCH v3 4/7] watchdog: dw_wdt: Support devices with non-fixed
 TOP values
Message-ID: <20200529225022.GA193721@roeck-us.net>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
 <20200526154123.24402-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526154123.24402-5-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 06:41:20PM +0300, Serge Semin wrote:
> In case if the DW Watchdog IP core is synthesised with
> WDT_USE_FIX_TOP == false, the TOP interval indexes make the device
> to load a custom periods to the counter. These periods are hardwired
> at the IP synthesis stage and can be within [2^8, 2^(WDT_CNT_WIDTH - 1)].
> Alas their values can't be detected at runtime and must be somehow
> supplied to the driver so one could properly determine the watchdog
> timeout intervals. For this purpose we suggest to have a vendor-
> specific dts property "snps,watchdog-tops" utilized, which would
> provide an array of sixteen counter values. At device probe stage they
> will be used to initialize the watchdog device timeouts determined
> from the array values and current clocks source rate.
> 
> In order to have custom TOP values supported the driver must be
> altered in the following way. First of all the fixed-top values
> ready-to-use array must be determined for compatibility with currently
> supported devices, which were synthesised with WDT_USE_FIX_TOP == true.
> It will be used if either fixed TOP feature is detected being enabled or
> no custom TOPs are fetched from the device dt node. Secondly at the probe
> stage we must initialize an array of the watchdog timeouts corresponding
> to the detected TOPs list and the reference clock rate. For generality the
> procedure of initialization is designed in a way to support the TOPs array
> with no limitations on the items order or value. Finally the watchdog
> period search methods should be altered to support the new timeouts data
> structure.
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
> - Add "ms" suffix to the methods returning msec and convert the methods
>   with no "ms" suffix to return a timeout in sec.
> - Make sure minimum timeout is at least 1 sec.
> - Refactor the timeouts calculation procedure to retain the timeouts in
>   the ascending order.
> - Make sure there is no integer overflow in milliseconds calculation. It
>   is saved in a dedicated uint field of the timeout structure.
> ---
>  drivers/watchdog/dw_wdt.c | 191 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 167 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index fba21de2bbad..693c0d1fd796 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -13,6 +13,8 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/limits.h>
> +#include <linux/kernel.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -34,21 +36,40 @@
>  #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
>  #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
>  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
> +#define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
> +#define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
>  
> -/* The maximum TOP (timeout period) value that can be set in the watchdog. */
> -#define DW_WDT_MAX_TOP		15
> +/* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
> +#define DW_WDT_NUM_TOPS		16
> +#define DW_WDT_FIX_TOP(_idx)	(1U << (16 + _idx))
>  
>  #define DW_WDT_DEFAULT_SECONDS	30
>  
> +static const u32 dw_wdt_fix_tops[DW_WDT_NUM_TOPS] = {
> +	DW_WDT_FIX_TOP(0), DW_WDT_FIX_TOP(1), DW_WDT_FIX_TOP(2),
> +	DW_WDT_FIX_TOP(3), DW_WDT_FIX_TOP(4), DW_WDT_FIX_TOP(5),
> +	DW_WDT_FIX_TOP(6), DW_WDT_FIX_TOP(7), DW_WDT_FIX_TOP(8),
> +	DW_WDT_FIX_TOP(9), DW_WDT_FIX_TOP(10), DW_WDT_FIX_TOP(11),
> +	DW_WDT_FIX_TOP(12), DW_WDT_FIX_TOP(13), DW_WDT_FIX_TOP(14),
> +	DW_WDT_FIX_TOP(15)
> +};
> +
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
>  		 "(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +struct dw_wdt_timeout {
> +	u32 top_val;
> +	unsigned int sec;
> +	unsigned int msec;
> +};
> +
>  struct dw_wdt {
>  	void __iomem		*regs;
>  	struct clk		*clk;
>  	unsigned long		rate;
> +	struct dw_wdt_timeout	timeouts[DW_WDT_NUM_TOPS];
>  	struct watchdog_device	wdd;
>  	struct reset_control	*rst;
>  	/* Save/restore */
> @@ -64,20 +85,66 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
>  		WDOG_CONTROL_REG_WDT_EN_MASK;
>  }
>  
> -static inline int dw_wdt_top_in_seconds(struct dw_wdt *dw_wdt, unsigned top)
> +static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
> +					 unsigned int timeout, u32 *top_val)
>  {
> +	int idx;
> +
>  	/*
> -	 * There are 16 possible timeout values in 0..15 where the number of
> -	 * cycles is 2 ^ (16 + i) and the watchdog counts down.
> +	 * Find a TOP with timeout greater or equal to the requested number.
> +	 * Note we'll select a TOP with maximum timeout if the requested
> +	 * timeout couldn't be reached.
>  	 */
> -	return (1U << (16 + top)) / dw_wdt->rate;
> +	for (idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
> +		if (dw_wdt->timeouts[idx].sec >= timeout)
> +			break;
> +	}
> +
> +	if (idx == DW_WDT_NUM_TOPS)
> +		--idx;
> +
> +	*top_val = dw_wdt->timeouts[idx].top_val;
> +
> +	return dw_wdt->timeouts[idx].sec;
>  }
>  
> -static int dw_wdt_get_top(struct dw_wdt *dw_wdt)
> +static unsigned int dw_wdt_get_min_timeout(struct dw_wdt *dw_wdt)
>  {
> -	int top = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET) & 0xF;
> +	int idx;
> +
> +	/*
> +	 * We'll find a timeout greater or equal to one second anyway because
> +	 * the driver probe would have failed if there was none.
> +	 */
> +	for (idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
> +		if (dw_wdt->timeouts[idx].sec)
> +			break;
> +	}
>  
> -	return dw_wdt_top_in_seconds(dw_wdt, top);
> +	return dw_wdt->timeouts[idx].sec;
> +}
> +
> +static unsigned int dw_wdt_get_max_timeout_ms(struct dw_wdt *dw_wdt)
> +{
> +	struct dw_wdt_timeout *timeout = &dw_wdt->timeouts[DW_WDT_NUM_TOPS - 1];
> +	u64 msec;
> +
> +	msec = (u64)timeout->sec * MSEC_PER_SEC + timeout->msec;
> +
> +	return msec < UINT_MAX ? msec : UINT_MAX;
> +}
> +
> +static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
> +{
> +	int top_val = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET) & 0xF;
> +	int idx;
> +
> +	for (idx = 0; idx < DW_WDT_NUM_TOPS; ++idx) {
> +		if (dw_wdt->timeouts[idx].top_val == top_val)
> +			break;
> +	}
> +
> +	return dw_wdt->timeouts[idx].sec;
>  }
>  
>  static int dw_wdt_ping(struct watchdog_device *wdd)
> @@ -93,17 +160,10 @@ static int dw_wdt_ping(struct watchdog_device *wdd)
>  static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  {
>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> -	int i, top_val = DW_WDT_MAX_TOP;
> +	unsigned int timeout;
> +	u32 top_val;
>  
> -	/*
> -	 * Iterate over the timeout values until we find the closest match. We
> -	 * always look for >=.
> -	 */
> -	for (i = 0; i <= DW_WDT_MAX_TOP; ++i)
> -		if (dw_wdt_top_in_seconds(dw_wdt, i) >= top_s) {
> -			top_val = i;
> -			break;
> -		}
> +	timeout = dw_wdt_find_best_top(dw_wdt, top_s, &top_val);
>  
>  	/*
>  	 * Set the new value in the watchdog.  Some versions of dw_wdt
> @@ -120,7 +180,7 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  	 * wdd->max_hw_heartbeat_ms
>  	 */
>  	if (top_s * 1000 <= wdd->max_hw_heartbeat_ms)
> -		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +		wdd->timeout = timeout;
>  	else
>  		wdd->timeout = top_s;
>  
> @@ -238,6 +298,86 @@ static int dw_wdt_resume(struct device *dev)
>  
>  static SIMPLE_DEV_PM_OPS(dw_wdt_pm_ops, dw_wdt_suspend, dw_wdt_resume);
>  
> +/*
> + * In case if DW WDT IP core is synthesized with fixed TOP feature disabled the
> + * TOPs array can be arbitrary ordered with nearly any sixteen uint numbers
> + * depending on the system engineer imagination. The next method handles the
> + * passed TOPs array to pre-calculate the effective timeouts and to sort the
> + * TOP items out in the ascending order with respect to the timeouts.
> + */
> +
> +static void dw_wdt_handle_tops(struct dw_wdt *dw_wdt, const u32 *tops)
> +{
> +	struct dw_wdt_timeout tout, *dst;
> +	int val, tidx;
> +	u64 msec;
> +
> +	/*
> +	 * We walk over the passed TOPs array and calculate corresponding
> +	 * timeouts in seconds and milliseconds. The milliseconds granularity
> +	 * is needed to distinguish the TOPs with very close timeouts and to
> +	 * set the watchdog max heartbeat setting further.
> +	 */
> +	for (val = 0; val < DW_WDT_NUM_TOPS; ++val) {
> +		tout.top_val = val;
> +		tout.sec = tops[val] / dw_wdt->rate;
> +		msec = (u64)tops[val] * MSEC_PER_SEC;
> +		do_div(msec, dw_wdt->rate);
> +		tout.msec = msec - ((u64)tout.sec * MSEC_PER_SEC);
> +
> +		/*
> +		 * Find a suitable place for the current TOP in the timeouts
> +		 * array so that the list is remained in the ascending order.
> +		 */
> +		for (tidx = 0; tidx < val; ++tidx) {
> +			dst = &dw_wdt->timeouts[tidx];
> +			if (tout.sec > dst->sec || (tout.sec == dst->sec &&
> +			    tout.msec >= dst->msec))
> +				continue;
> +			else
> +				swap(*dst, tout);
> +		}
> +
> +		dw_wdt->timeouts[val] = tout;
> +	}
> +}
> +
> +static int dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
> +{
> +	u32 data, of_tops[DW_WDT_NUM_TOPS];
> +	const u32 *tops;
> +	int ret;
> +
> +	/*
> +	 * Retrieve custom or fixed counter values depending on the
> +	 * WDT_USE_FIX_TOP flag found in the component specific parameters
> +	 * #1 register.
> +	 */
> +	data = readl(dw_wdt->regs + WDOG_COMP_PARAMS_1_REG_OFFSET);
> +	if (data & WDOG_COMP_PARAMS_1_USE_FIX_TOP) {
> +		tops = dw_wdt_fix_tops;
> +	} else {
> +		ret = of_property_read_variable_u32_array(dev_of_node(dev),
> +			"snps,watchdog-tops", of_tops, DW_WDT_NUM_TOPS,
> +			DW_WDT_NUM_TOPS);
> +		if (ret < 0) {
> +			dev_warn(dev, "No valid TOPs array specified\n");
> +			tops = dw_wdt_fix_tops;
> +		} else {
> +			tops = of_tops;
> +		}
> +	}
> +
> +	/* Convert the specified TOPs into an array of watchdog timeouts. */
> +	dw_wdt_handle_tops(dw_wdt, tops);
> +	if (!dw_wdt->timeouts[DW_WDT_NUM_TOPS - 1].sec) {
> +		dev_err(dev, "No any valid TOP detected\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dw_wdt_drv_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -275,12 +415,15 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  
>  	reset_control_deassert(dw_wdt->rst);
>  
> +	ret = dw_wdt_init_timeouts(dw_wdt, dev);
> +	if (ret)
> +		goto out_disable_clk;
> +
>  	wdd = &dw_wdt->wdd;
>  	wdd->info = &dw_wdt_ident;
>  	wdd->ops = &dw_wdt_ops;
> -	wdd->min_timeout = 1;
> -	wdd->max_hw_heartbeat_ms =
> -		dw_wdt_top_in_seconds(dw_wdt, DW_WDT_MAX_TOP) * 1000;
> +	wdd->min_timeout = dw_wdt_get_min_timeout(dw_wdt);
> +	wdd->max_hw_heartbeat_ms = dw_wdt_get_max_timeout_ms(dw_wdt);
>  	wdd->parent = dev;
>  
>  	watchdog_set_drvdata(wdd, dw_wdt);
> @@ -293,7 +436,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  	 * devicetree.
>  	 */
>  	if (dw_wdt_is_enabled(dw_wdt)) {
> -		wdd->timeout = dw_wdt_get_top(dw_wdt);
> +		wdd->timeout = dw_wdt_get_timeout(dw_wdt);
>  		set_bit(WDOG_HW_RUNNING, &wdd->status);
>  	} else {
>  		wdd->timeout = DW_WDT_DEFAULT_SECONDS;
