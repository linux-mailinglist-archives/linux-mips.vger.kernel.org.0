Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDAA1E8BA8
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 01:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgE2XCX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 19:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE2XCW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 19:02:22 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABB2C03E969;
        Fri, 29 May 2020 16:02:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s10so607963pgm.0;
        Fri, 29 May 2020 16:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2uhwZb/yY2ReA1dnc8igt7/bL63119LrclIQCXTIDlI=;
        b=eiMHLHPPGgdAVBxFbxfcdDvlqyg+iBmJT0xBTqwFs+JjtzgTn7WowS6+dHiTDHi7Zl
         cZg+hFLaexVT3osHJk57GMJIAB3qaOP11L3IGU2/YPPnBlLoZrp6Nt5DqUpCdDuDRmcj
         T7u3r9qzZlHbvS/A/08pGfC0EIRjDjhPFvVtui4Yl1f5VtNPtNMwJl/ZSTpJiCfBl9od
         ECwts9VvqvTeiOyBxK6lX6P8vga1me1YNv8wnXVkNwE+Su+Q0gMAzW81VVSun4uFwevS
         Vo6Rlq4OO66LZVY1MvmFCVCSGO5LlLxGpRsyOs3YAuyMkPMATa0sN571GkP1vE8OYtZy
         Ydng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2uhwZb/yY2ReA1dnc8igt7/bL63119LrclIQCXTIDlI=;
        b=P84nsoHmS9ccHIsoVHYr3RwZisyS/bd0EEUSayAcN/LZHZguHKwoa9DHaMQcq6uZ+n
         hXkjUNqnSLIkktcOXsJ8QXKcNXg8cEKOtrLuLBk0mh+tcUvwy5b3GASHWj81/Yj3e5Gk
         eJcxh3VBmCmOrg6MRzt1JpKTEclr+zg07FFpZ6vXI/mw3bKDzP/3E9UES5SQoWg3+0OJ
         yJEats1L+tUuyXuMuc3nYfJc8/UnIKbLi3qBebQXu9E5B5HVgMGjsD2ESWDWdzH592OL
         oq5zQOYYKCyg61Rf4vFV4XcBG1ajWnADWBeyAfHC2tIWtBgR2SKHykO0bbfMUEVaAw3G
         fg3A==
X-Gm-Message-State: AOAM532K4hdN5H2PObt3kvtVwJ4gGcoH/nrnhYdGupytWmqoz5wzlv4Y
        gpKFYefVbyyURgtGpilI54c=
X-Google-Smtp-Source: ABdhPJyF73ypVI+MS+7r435YpVGQfZ6ut10jU/NrGFZRuaEQ/ga8CUWrN7zO7B+5v5eBR3uM0kT/5g==
X-Received: by 2002:a62:1807:: with SMTP id 7mr11205433pfy.18.1590793341287;
        Fri, 29 May 2020 16:02:21 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a2sm8174881pfg.98.2020.05.29.16.02.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 16:02:20 -0700 (PDT)
Date:   Fri, 29 May 2020 16:02:19 -0700
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
Subject: Re: [PATCH v3 6/7] watchdog: dw_wdt: Add pre-timeouts support
Message-ID: <20200529230219.GA194766@roeck-us.net>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
 <20200526154123.24402-7-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526154123.24402-7-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 06:41:22PM +0300, Serge Semin wrote:
> DW Watchdog can rise an interrupt in case if IRQ request mode is enabled
> and timer reaches the zero value. In this case the IRQ lane is left
> pending until either the next watchdog kick event (watchdog restart) or
> until the WDT_EOI register is read or the device/system reset. This
> interface can be used to implement the pre-timeout functionality
> optionally provided by the Linux kernel watchdog devices.
> 
> IRQ mode provides a two stages timeout interface. It means the IRQ is
> raised when the counter reaches zero, while the system reset occurs only
> after subsequent timeout if the timer restart is not performed. Due to
> this peculiarity the pre-timeout value is actually set to the achieved
> hardware timeout, while the real watchdog timeout is considered to be
> twice as much of it. This applies a significant limitation on the
> pre-timeout values, so current implementation supports either zero value,
> which disables the pre-timeout events, or non-zero values, which imply
> the pre-timeout to be at least half of the current watchdog timeout.
> 
> Note that we ask the interrupt controller to detect the rising-edge
> pre-timeout interrupts to prevent the high-level-IRQs flood, since
> if the pre-timeout happens, the IRQ lane will be left pending until
> it's cleared by the timer restart.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org

Nitpick below, but I don't really know what to do about it, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changelog v2:
> - Rearrange SoBs.
> - Make the Pre-timeout IRQ being optionally supported.
> ---
>  drivers/watchdog/dw_wdt.c | 138 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 130 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index efbc36872670..3cd7c485cd70 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -22,6 +22,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> +#include <linux/interrupt.h>
>  #include <linux/of.h>
>  #include <linux/pm.h>
>  #include <linux/platform_device.h>
> @@ -36,6 +37,8 @@
>  #define WDOG_CURRENT_COUNT_REG_OFFSET	    0x08
>  #define WDOG_COUNTER_RESTART_REG_OFFSET     0x0c
>  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
> +#define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
> +#define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
>  #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
>  #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
>  
> @@ -59,6 +62,11 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
>  		 "(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>  
> +enum dw_wdt_rmod {
> +	DW_WDT_RMOD_RESET = 1,
> +	DW_WDT_RMOD_IRQ = 2
> +};
> +
>  struct dw_wdt_timeout {
>  	u32 top_val;
>  	unsigned int sec;
> @@ -70,6 +78,7 @@ struct dw_wdt {
>  	struct clk		*clk;
>  	struct clk		*pclk;
>  	unsigned long		rate;
> +	enum dw_wdt_rmod	rmod;
>  	struct dw_wdt_timeout	timeouts[DW_WDT_NUM_TOPS];
>  	struct watchdog_device	wdd;
>  	struct reset_control	*rst;
> @@ -86,6 +95,20 @@ static inline int dw_wdt_is_enabled(struct dw_wdt *dw_wdt)
>  		WDOG_CONTROL_REG_WDT_EN_MASK;
>  }
>  
> +static void dw_wdt_update_mode(struct dw_wdt *dw_wdt, enum dw_wdt_rmod rmod)
> +{
> +	u32 val;
> +
> +	val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> +	if (rmod == DW_WDT_RMOD_IRQ)
> +		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	else
> +		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> +
> +	dw_wdt->rmod = rmod;
> +}
> +
>  static unsigned int dw_wdt_find_best_top(struct dw_wdt *dw_wdt,
>  					 unsigned int timeout, u32 *top_val)
>  {
> @@ -145,7 +168,11 @@ static unsigned int dw_wdt_get_timeout(struct dw_wdt *dw_wdt)
>  			break;
>  	}
>  
> -	return dw_wdt->timeouts[idx].sec;
> +	/*
> +	 * In IRQ mode due to the two stages counter, the actual timeout is
> +	 * twice greater than the TOP setting.
> +	 */
> +	return dw_wdt->timeouts[idx].sec * dw_wdt->rmod;
>  }
>  
>  static int dw_wdt_ping(struct watchdog_device *wdd)
> @@ -164,7 +191,20 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  	unsigned int timeout;
>  	u32 top_val;
>  
> -	timeout = dw_wdt_find_best_top(dw_wdt, top_s, &top_val);
> +	/*
> +	 * Note IRQ mode being enabled means having a non-zero pre-timeout
> +	 * setup. In this case we try to find a TOP as close to the half of the
> +	 * requested timeout as possible since DW Watchdog IRQ mode is designed
> +	 * in two stages way - first timeout rises the pre-timeout interrupt,
> +	 * second timeout performs the system reset. So basically the effective
> +	 * watchdog-caused reset happens after two watchdog TOPs elapsed.
> +	 */
> +	timeout = dw_wdt_find_best_top(dw_wdt, DIV_ROUND_UP(top_s, dw_wdt->rmod),
> +				       &top_val);
> +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
> +		wdd->pretimeout = timeout;
> +	else
> +		wdd->pretimeout = 0;
>  
>  	/*
>  	 * Set the new value in the watchdog.  Some versions of dw_wdt
> @@ -175,25 +215,47 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>  	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>  	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>  
> +	/* Kick new TOP value into the watchdog counter if activated. */
> +	if (watchdog_active(wdd))
> +		dw_wdt_ping(wdd);
> +
>  	/*
>  	 * In case users set bigger timeout value than HW can support,
>  	 * kernel(watchdog_dev.c) helps to feed watchdog before
>  	 * wdd->max_hw_heartbeat_ms
>  	 */
>  	if (top_s * 1000 <= wdd->max_hw_heartbeat_ms)
> -		wdd->timeout = timeout;
> +		wdd->timeout = timeout * dw_wdt->rmod;
>  	else
>  		wdd->timeout = top_s;
>  
>  	return 0;
>  }
>  
> +static int dw_wdt_set_pretimeout(struct watchdog_device *wdd, unsigned int req)
> +{
> +	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> +
> +	/*
> +	 * We ignore actual value of the timeout passed from user-space
> +	 * using it as a flag whether the pretimeout functionality is intended
> +	 * to be activated.
> +	 */
> +	dw_wdt_update_mode(dw_wdt, req ? DW_WDT_RMOD_IRQ : DW_WDT_RMOD_RESET);
> +	dw_wdt_set_timeout(wdd, wdd->timeout);
> +
> +	return 0;
> +}
> +
>  static void dw_wdt_arm_system_reset(struct dw_wdt *dw_wdt)
>  {
>  	u32 val = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
>  
> -	/* Disable interrupt mode; always perform system reset. */
> -	val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	/* Disable/enable interrupt mode depending on the RMOD flag. */
> +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ)
> +		val |= WDOG_CONTROL_REG_RESP_MODE_MASK;
> +	else
> +		val &= ~WDOG_CONTROL_REG_RESP_MODE_MASK;
>  	/* Enable watchdog. */
>  	val |= WDOG_CONTROL_REG_WDT_EN_MASK;
>  	writel(val, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
> @@ -231,6 +293,7 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
>  
>  	writel(0, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
> +	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
>  	if (dw_wdt_is_enabled(dw_wdt))
>  		writel(WDOG_COUNTER_RESTART_KICK_VALUE,
>  		       dw_wdt->regs + WDOG_COUNTER_RESTART_REG_OFFSET);
> @@ -246,9 +309,19 @@ static int dw_wdt_restart(struct watchdog_device *wdd,
>  static unsigned int dw_wdt_get_timeleft(struct watchdog_device *wdd)
>  {
>  	struct dw_wdt *dw_wdt = to_dw_wdt(wdd);
> +	unsigned int sec;
> +	u32 val;
> +
> +	val = readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET);
> +	sec = val / dw_wdt->rate;
>  
> -	return readl(dw_wdt->regs + WDOG_CURRENT_COUNT_REG_OFFSET) /
> -		dw_wdt->rate;
> +	if (dw_wdt->rmod == DW_WDT_RMOD_IRQ) {
> +		val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
> +		if (!val)
> +			sec += wdd->pretimeout;
> +	}
> +
> +	return sec;
>  }
>  
>  static const struct watchdog_info dw_wdt_ident = {
> @@ -257,16 +330,41 @@ static const struct watchdog_info dw_wdt_ident = {
>  	.identity	= "Synopsys DesignWare Watchdog",
>  };
>  
> +static const struct watchdog_info dw_wdt_pt_ident = {
> +	.options	= WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT |
> +			  WDIOF_PRETIMEOUT | WDIOF_MAGICCLOSE,
> +	.identity	= "Synopsys DesignWare Watchdog",
> +};
> +
>  static const struct watchdog_ops dw_wdt_ops = {
>  	.owner		= THIS_MODULE,
>  	.start		= dw_wdt_start,
>  	.stop		= dw_wdt_stop,
>  	.ping		= dw_wdt_ping,
>  	.set_timeout	= dw_wdt_set_timeout,
> +	.set_pretimeout	= dw_wdt_set_pretimeout,
>  	.get_timeleft	= dw_wdt_get_timeleft,
>  	.restart	= dw_wdt_restart,
>  };
>  
> +static irqreturn_t dw_wdt_irq(int irq, void *devid)
> +{
> +	struct dw_wdt *dw_wdt = devid;
> +	u32 val;
> +
> +	/*
> +	 * We don't clear the IRQ status. It's supposed to be done by the
> +	 * following ping operations.
> +	 */
> +	val = readl(dw_wdt->regs + WDOG_INTERRUPT_STATUS_REG_OFFSET);
> +	if (!val)
> +		return IRQ_NONE;
> +
> +	watchdog_notify_pretimeout(&dw_wdt->wdd);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int dw_wdt_suspend(struct device *dev)
>  {
> @@ -447,6 +545,31 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  		goto out_disable_pclk;
>  	}
>  
> +	/* Enable normal reset without pre-timeout by default. */
> +	dw_wdt_update_mode(dw_wdt, DW_WDT_RMOD_RESET);
> +
> +	/*
> +	 * Pre-timeout IRQ is optional, since some hardware may lack support
> +	 * of it. Note we must request rising-edge IRQ, since the lane is left
> +	 * pending either until the next watchdog kick event or up to the
> +	 * system reset.
> +	 */
> +	ret = platform_get_irq_optional(pdev, 0);
> +	if (ret >= 0) {

I keep seeing notes that an interrupt value of 0 is invalid.

> +		ret = devm_request_irq(dev, ret, dw_wdt_irq,
> +				       IRQF_SHARED | IRQF_TRIGGER_RISING,
> +				       pdev->name, dw_wdt);
> +		if (ret)
> +			goto out_disable_pclk;
> +
> +		dw_wdt->wdd.info = &dw_wdt_pt_ident;
> +	} else {
> +		if (ret == -EPROBE_DEFER)
> +			goto out_disable_pclk;
> +
> +		dw_wdt->wdd.info = &dw_wdt_ident;
> +	}
> +
>  	reset_control_deassert(dw_wdt->rst);
>  
>  	ret = dw_wdt_init_timeouts(dw_wdt, dev);
> @@ -454,7 +577,6 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  		goto out_disable_clk;
>  
>  	wdd = &dw_wdt->wdd;
> -	wdd->info = &dw_wdt_ident;
>  	wdd->ops = &dw_wdt_ops;
>  	wdd->min_timeout = dw_wdt_get_min_timeout(dw_wdt);
>  	wdd->max_hw_heartbeat_ms = dw_wdt_get_max_timeout_ms(dw_wdt);
