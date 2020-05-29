Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE4D1E8BB2
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 01:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgE2XDx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 19:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgE2XDw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 19:03:52 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E1AC03E969;
        Fri, 29 May 2020 16:03:52 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id m7so1816014plt.5;
        Fri, 29 May 2020 16:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ndzMBUKACoRHXRVkdipRojb6jIrnb/f0a9K1IurFbZg=;
        b=HAha1e4VEudvL9+qwzCq8jJRaRo2oKs8q7oY27tVG2Un4zFmt/WNDielrJaHPxXEkd
         LltB40JE/AmZ8Mpj+FxwuHZwYsKQb/e9L+1QjW3/6K6NpamiVJtZAtAKYc9EKcDJyuMD
         QKQHkkFwbSpuRWqYSqLFMBKBwpUJGSNcplXRiQnOspHRitdPwFeRpoY7LbTRzsrzJEyR
         dgQatYwIjVTFKpYZhyTlYezfru3QgGuYkbhs+p7MwaM1ojlf7roi7JRa8YG/JC1PXGwk
         Kzj0Y1DDYkEwBu71Kneip2ctwFxjKhfoiZtuuxueaxBT27zusMMYYXBp4ms9nP339sQZ
         /REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ndzMBUKACoRHXRVkdipRojb6jIrnb/f0a9K1IurFbZg=;
        b=MWXXW9vcrtT8yeKkTDmCppUDYBn2wWJy+eB9nVdPMLE87tq37ERw9tBCI66h8Im9So
         Da3QrXrOoJVocYiWbJs6utsqYn24CU7JSLPBiuugGVcjuGIBDoHyjALIostgrpw1cDm2
         Ka78pCf3nFhRkebJoxhHNrxHTJejKIN2MTlOXCpYzEw7BOy5lRcu47h2Rz/4BwdSQ852
         Sp5bDCVrXJUF+nYRZpHogPIZEjCyLLmLACLQf3Q49jtyyw/XuyPCQfTOkpIFXpc+pWHW
         Ka7zz/K+0vcXYL6Fby0PWeVfJmR5FD+8lL2Zx0IYEnuYd3RBrwiAg+dfypIQX0mUN1xK
         GrEA==
X-Gm-Message-State: AOAM533kPn2+97WYTDjG9tk2MCSyAwAu8T1Ac2tO2pXF77fYyV6TByxl
        bddLhHqUe0hkfJEMpEOFXjg=
X-Google-Smtp-Source: ABdhPJxyjjrcG57XtfCniJFVDLVe8rhocrCsphaLwuljpISpMu67cocDRi9j6UQvyGYQ7Mocp24Xkg==
X-Received: by 2002:a17:902:262:: with SMTP id 89mr10007786plc.251.1590793432252;
        Fri, 29 May 2020 16:03:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q189sm8352553pfc.112.2020.05.29.16.03.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 16:03:51 -0700 (PDT)
Date:   Fri, 29 May 2020 16:03:51 -0700
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
Subject: Re: [PATCH v3 7/7] watchdog: dw_wdt: Add DebugFS files
Message-ID: <20200529230351.GA195027@roeck-us.net>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
 <20200526154123.24402-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526154123.24402-8-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 06:41:23PM +0300, Serge Semin wrote:
> For the sake of the easier device-driver debug procedure, we added a
> DebugFS file with the controller registers state. It's available only if
> kernel is configured with DebugFS support.
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
> - Discard timeout/pretimeout/ping/enable DebugFS nodes. Registers state
>   dump node is only left.
> ---
>  drivers/watchdog/dw_wdt.c | 68 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index 3cd7c485cd70..012681baaa6d 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -28,6 +28,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
>  #include <linux/watchdog.h>
> +#include <linux/debugfs.h>
>  
>  #define WDOG_CONTROL_REG_OFFSET		    0x00
>  #define WDOG_CONTROL_REG_WDT_EN_MASK	    0x01
> @@ -39,8 +40,14 @@
>  #define WDOG_COUNTER_RESTART_KICK_VALUE	    0x76
>  #define WDOG_INTERRUPT_STATUS_REG_OFFSET    0x10
>  #define WDOG_INTERRUPT_CLEAR_REG_OFFSET     0x14
> +#define WDOG_COMP_PARAMS_5_REG_OFFSET       0xe4
> +#define WDOG_COMP_PARAMS_4_REG_OFFSET       0xe8
> +#define WDOG_COMP_PARAMS_3_REG_OFFSET       0xec
> +#define WDOG_COMP_PARAMS_2_REG_OFFSET       0xf0
>  #define WDOG_COMP_PARAMS_1_REG_OFFSET       0xf4
>  #define WDOG_COMP_PARAMS_1_USE_FIX_TOP      BIT(6)
> +#define WDOG_COMP_VERSION_REG_OFFSET        0xf8
> +#define WDOG_COMP_TYPE_REG_OFFSET           0xfc
>  
>  /* There are sixteen TOPs (timeout periods) that can be set in the watchdog. */
>  #define DW_WDT_NUM_TOPS		16
> @@ -85,6 +92,10 @@ struct dw_wdt {
>  	/* Save/restore */
>  	u32			control;
>  	u32			timeout;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct dentry		*dbgfs_dir;
> +#endif
>  };
>  
>  #define to_dw_wdt(wdd)	container_of(wdd, struct dw_wdt, wdd)
> @@ -484,6 +495,59 @@ static int dw_wdt_init_timeouts(struct dw_wdt *dw_wdt, struct device *dev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +
> +#define DW_WDT_DBGFS_REG(_name, _off) \
> +{				      \
> +	.name = _name,		      \
> +	.offset = _off		      \
> +}
> +
> +static const struct debugfs_reg32 dw_wdt_dbgfs_regs[] = {
> +	DW_WDT_DBGFS_REG("cr", WDOG_CONTROL_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("torr", WDOG_TIMEOUT_RANGE_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("ccvr", WDOG_CURRENT_COUNT_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("crr", WDOG_COUNTER_RESTART_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("stat", WDOG_INTERRUPT_STATUS_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param5", WDOG_COMP_PARAMS_5_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param4", WDOG_COMP_PARAMS_4_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param3", WDOG_COMP_PARAMS_3_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param2", WDOG_COMP_PARAMS_2_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("param1", WDOG_COMP_PARAMS_1_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("version", WDOG_COMP_VERSION_REG_OFFSET),
> +	DW_WDT_DBGFS_REG("type", WDOG_COMP_TYPE_REG_OFFSET)
> +};
> +
> +static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt)
> +{
> +	struct device *dev = dw_wdt->wdd.parent;
> +	struct debugfs_regset32 *regset;
> +
> +	regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
> +	if (!regset)
> +		return;
> +
> +	regset->regs = dw_wdt_dbgfs_regs;
> +	regset->nregs = ARRAY_SIZE(dw_wdt_dbgfs_regs);
> +	regset->base = dw_wdt->regs;
> +
> +	dw_wdt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> +
> +	debugfs_create_regset32("registers", 0444, dw_wdt->dbgfs_dir, regset);
> +}
> +
> +static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt)
> +{
> +	debugfs_remove_recursive(dw_wdt->dbgfs_dir);
> +}
> +
> +#else /* !CONFIG_DEBUG_FS */
> +
> +static void dw_wdt_dbgfs_init(struct dw_wdt *dw_wdt) {}
> +static void dw_wdt_dbgfs_clear(struct dw_wdt *dw_wdt) {}
> +
> +#endif /* !CONFIG_DEBUG_FS */
> +
>  static int dw_wdt_drv_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -607,6 +671,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out_disable_pclk;
>  
> +	dw_wdt_dbgfs_init(dw_wdt);
> +
>  	return 0;
>  
>  out_disable_pclk:
> @@ -621,6 +687,8 @@ static int dw_wdt_drv_remove(struct platform_device *pdev)
>  {
>  	struct dw_wdt *dw_wdt = platform_get_drvdata(pdev);
>  
> +	dw_wdt_dbgfs_clear(dw_wdt);
> +
>  	watchdog_unregister_device(&dw_wdt->wdd);
>  	reset_control_assert(dw_wdt->rst);
>  	clk_disable_unprepare(dw_wdt->pclk);
