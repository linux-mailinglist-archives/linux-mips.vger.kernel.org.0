Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C02B4DA795
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 02:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245082AbiCPBwb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Mar 2022 21:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353024AbiCPBwa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Mar 2022 21:52:30 -0400
X-Greylist: delayed 1276 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 15 Mar 2022 18:51:15 PDT
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com [192.185.49.219])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1DE5E175
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 18:51:15 -0700 (PDT)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id A25005ADD
        for <linux-mips@vger.kernel.org>; Tue, 15 Mar 2022 20:29:58 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id UIUAnHU8M9AGSUIUAnNlzl; Tue, 15 Mar 2022 20:29:58 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=IbxGqv3Oq1sXCEpO+2j7r8BZ8/RG4aBDSa5JRx8TG/I=; b=U5YJ4Vlke+EYvoU0mefGL0XJMv
        cbCKmf/iQ6kqn+BErgDQJme33UtrO5P33xU6wT6lH9UWjZJFfrgChMYNQUwhJCyBghpXiwkhowoTk
        OVkf/k3JCQ29VHLN3oF4LAETMNZe9hpJUtpUYw2z8cEEBxUz/ePSCbJ0MC5uYqZWQLUnezrp0eJSt
        7UwTrI6l1dK1jBBS3fR3Mgkq38x2ATnM4/wdeaX5WHP25/dQRfQ+GHesG8t4JvaT558mOY/ZzrcQw
        YpyD3IRiuyCsYQSpZ/TEtT0Myz6F0HMHTkYz2jNXgKA3QoULcwXUaqeVUVcfDMFyRuXhb1grpH47A
        PHAKR8OQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57500 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nUIU8-003mWC-FR; Wed, 16 Mar 2022 01:29:56 +0000
Date:   Tue, 15 Mar 2022 18:29:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v8 11/16] watchdog: Make use of devm_clk_get_enabled()
Message-ID: <20220316012954.GA4167754@roeck-us.net>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-12-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220314141643.22184-12-u.kleine-koenig@pengutronix.de>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nUIU8-003mWC-FR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57500
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 14, 2022 at 03:16:38PM +0100, Uwe Kleine-König wrote:
> Several drivers manually register a devm handler to disable their clk.
> Convert them to devm_clk_get_enabled().
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/cadence_wdt.c    | 17 +----------------
>  drivers/watchdog/davinci_wdt.c    | 18 +-----------------
>  drivers/watchdog/imgpdc_wdt.c     | 31 +++----------------------------
>  drivers/watchdog/imx2_wdt.c       | 15 +--------------
>  drivers/watchdog/imx7ulp_wdt.c    | 15 +--------------
>  drivers/watchdog/loongson1_wdt.c  | 17 +----------------
>  drivers/watchdog/lpc18xx_wdt.c    | 30 ++----------------------------
>  drivers/watchdog/meson_gxbb_wdt.c | 16 +---------------
>  drivers/watchdog/of_xilinx_wdt.c  | 16 +---------------
>  drivers/watchdog/pic32-dmt.c      | 15 +--------------
>  drivers/watchdog/pic32-wdt.c      | 17 +----------------
>  drivers/watchdog/pnx4008_wdt.c    | 15 +--------------
>  drivers/watchdog/qcom-wdt.c       | 16 +---------------
>  drivers/watchdog/rtd119x_wdt.c    | 16 +---------------
>  drivers/watchdog/st_lpc_wdt.c     | 16 +---------------
>  drivers/watchdog/stm32_iwdg.c     | 31 ++-----------------------------
>  drivers/watchdog/visconti_wdt.c   | 18 +-----------------
>  17 files changed, 21 insertions(+), 298 deletions(-)
> 
> diff --git a/drivers/watchdog/cadence_wdt.c b/drivers/watchdog/cadence_wdt.c
> index bc99e9164930..23d41043863f 100644
> --- a/drivers/watchdog/cadence_wdt.c
> +++ b/drivers/watchdog/cadence_wdt.c
> @@ -274,11 +274,6 @@ static const struct watchdog_ops cdns_wdt_ops = {
>  	.set_timeout = cdns_wdt_settimeout,
>  };
>  
> -static void cdns_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  /************************Platform Operations*****************************/
>  /**
>   * cdns_wdt_probe - Probe call for the device.
> @@ -333,21 +328,11 @@ static int cdns_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_reboot(cdns_wdt_device);
>  	watchdog_set_drvdata(cdns_wdt_device, wdt);
>  
> -	wdt->clk = devm_clk_get(dev, NULL);
> +	wdt->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(wdt->clk))
>  		return dev_err_probe(dev, PTR_ERR(wdt->clk),
>  				     "input clock not found\n");
>  
> -	ret = clk_prepare_enable(wdt->clk);
> -	if (ret) {
> -		dev_err(dev, "unable to enable clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, cdns_clk_disable_unprepare,
> -				       wdt->clk);
> -	if (ret)
> -		return ret;
> -
>  	clock_f = clk_get_rate(wdt->clk);
>  	if (clock_f <= CDNS_WDT_CLK_75MHZ) {
>  		wdt->prescaler = CDNS_WDT_PRESCALE_512;
> diff --git a/drivers/watchdog/davinci_wdt.c b/drivers/watchdog/davinci_wdt.c
> index 584a56893b81..5f2184bda7b2 100644
> --- a/drivers/watchdog/davinci_wdt.c
> +++ b/drivers/watchdog/davinci_wdt.c
> @@ -189,14 +189,8 @@ static const struct watchdog_ops davinci_wdt_ops = {
>  	.restart	= davinci_wdt_restart,
>  };
>  
> -static void davinci_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int davinci_wdt_probe(struct platform_device *pdev)
>  {
> -	int ret = 0;
>  	struct device *dev = &pdev->dev;
>  	struct watchdog_device *wdd;
>  	struct davinci_wdt_device *davinci_wdt;
> @@ -205,21 +199,11 @@ static int davinci_wdt_probe(struct platform_device *pdev)
>  	if (!davinci_wdt)
>  		return -ENOMEM;
>  
> -	davinci_wdt->clk = devm_clk_get(dev, NULL);
> +	davinci_wdt->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(davinci_wdt->clk))
>  		return dev_err_probe(dev, PTR_ERR(davinci_wdt->clk),
>  				     "failed to get clock node\n");
>  
> -	ret = clk_prepare_enable(davinci_wdt->clk);
> -	if (ret) {
> -		dev_err(dev, "failed to prepare clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, davinci_clk_disable_unprepare,
> -				       davinci_wdt->clk);
> -	if (ret)
> -		return ret;
> -
>  	platform_set_drvdata(pdev, davinci_wdt);
>  
>  	wdd			= &davinci_wdt->wdd;
> diff --git a/drivers/watchdog/imgpdc_wdt.c b/drivers/watchdog/imgpdc_wdt.c
> index b57ff3787052..a55f801895d4 100644
> --- a/drivers/watchdog/imgpdc_wdt.c
> +++ b/drivers/watchdog/imgpdc_wdt.c
> @@ -175,16 +175,11 @@ static const struct watchdog_ops pdc_wdt_ops = {
>  	.restart        = pdc_wdt_restart,
>  };
>  
> -static void pdc_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int pdc_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	u64 div;
> -	int ret, val;
> +	int val;
>  	unsigned long clk_rate;
>  	struct pdc_wdt_dev *pdc_wdt;
>  
> @@ -196,38 +191,18 @@ static int pdc_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(pdc_wdt->base))
>  		return PTR_ERR(pdc_wdt->base);
>  
> -	pdc_wdt->sys_clk = devm_clk_get(dev, "sys");
> +	pdc_wdt->sys_clk = devm_clk_get_enabled(dev, "sys");
>  	if (IS_ERR(pdc_wdt->sys_clk)) {
>  		dev_err(dev, "failed to get the sys clock\n");
>  		return PTR_ERR(pdc_wdt->sys_clk);
>  	}
>  
> -	pdc_wdt->wdt_clk = devm_clk_get(dev, "wdt");
> +	pdc_wdt->wdt_clk = devm_clk_get_enabled(dev, "wdt");
>  	if (IS_ERR(pdc_wdt->wdt_clk)) {
>  		dev_err(dev, "failed to get the wdt clock\n");
>  		return PTR_ERR(pdc_wdt->wdt_clk);
>  	}
>  
> -	ret = clk_prepare_enable(pdc_wdt->sys_clk);
> -	if (ret) {
> -		dev_err(dev, "could not prepare or enable sys clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, pdc_clk_disable_unprepare,
> -				       pdc_wdt->sys_clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(pdc_wdt->wdt_clk);
> -	if (ret) {
> -		dev_err(dev, "could not prepare or enable wdt clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, pdc_clk_disable_unprepare,
> -				       pdc_wdt->wdt_clk);
> -	if (ret)
> -		return ret;
> -
>  	/* We use the clock rate to calculate the max timeout */
>  	clk_rate = clk_get_rate(pdc_wdt->wdt_clk);
>  	if (clk_rate == 0) {
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index 51bfb796898b..273d720588bf 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -248,11 +248,6 @@ static const struct regmap_config imx2_wdt_regmap_config = {
>  	.max_register = 0x8,
>  };
>  
> -static void imx2_wdt_action(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int __init imx2_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -277,7 +272,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  		return PTR_ERR(wdev->regmap);
>  	}
>  
> -	wdev->clk = devm_clk_get(dev, NULL);
> +	wdev->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(wdev->clk)) {
>  		dev_err(dev, "can't get Watchdog clock\n");
>  		return PTR_ERR(wdev->clk);
> @@ -297,14 +292,6 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>  				      dev_name(dev), wdog))
>  			wdog->info = &imx2_wdt_pretimeout_info;
>  
> -	ret = clk_prepare_enable(wdev->clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(dev, imx2_wdt_action, wdev->clk);
> -	if (ret)
> -		return ret;
> -
>  	wdev->clk_is_on = true;
>  
>  	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 922b60374295..61517abf2dba 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -200,11 +200,6 @@ static int imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
>  	return ret;
>  }
>  
> -static void imx7ulp_wdt_action(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int imx7ulp_wdt_probe(struct platform_device *pdev)
>  {
>  	struct imx7ulp_wdt_device *imx7ulp_wdt;
> @@ -222,20 +217,12 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx7ulp_wdt->base))
>  		return PTR_ERR(imx7ulp_wdt->base);
>  
> -	imx7ulp_wdt->clk = devm_clk_get(dev, NULL);
> +	imx7ulp_wdt->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(imx7ulp_wdt->clk)) {
>  		dev_err(dev, "Failed to get watchdog clock\n");
>  		return PTR_ERR(imx7ulp_wdt->clk);
>  	}
>  
> -	ret = clk_prepare_enable(imx7ulp_wdt->clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(dev, imx7ulp_wdt_action, imx7ulp_wdt->clk);
> -	if (ret)
> -		return ret;
> -
>  	wdog = &imx7ulp_wdt->wdd;
>  	wdog->info = &imx7ulp_wdt_info;
>  	wdog->ops = &imx7ulp_wdt_ops;
> diff --git a/drivers/watchdog/loongson1_wdt.c b/drivers/watchdog/loongson1_wdt.c
> index bb3d075c0633..c55656cfb403 100644
> --- a/drivers/watchdog/loongson1_wdt.c
> +++ b/drivers/watchdog/loongson1_wdt.c
> @@ -79,11 +79,6 @@ static const struct watchdog_ops ls1x_wdt_ops = {
>  	.set_timeout = ls1x_wdt_set_timeout,
>  };
>  
> -static void ls1x_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int ls1x_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -100,20 +95,10 @@ static int ls1x_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(drvdata->base))
>  		return PTR_ERR(drvdata->base);
>  
> -	drvdata->clk = devm_clk_get(dev, pdev->name);
> +	drvdata->clk = devm_clk_get_enabled(dev, pdev->name);
>  	if (IS_ERR(drvdata->clk))
>  		return PTR_ERR(drvdata->clk);
>  
> -	err = clk_prepare_enable(drvdata->clk);
> -	if (err) {
> -		dev_err(dev, "clk enable failed\n");
> -		return err;
> -	}
> -	err = devm_add_action_or_reset(dev, ls1x_clk_disable_unprepare,
> -				       drvdata->clk);
> -	if (err)
> -		return err;
> -
>  	clk_rate = clk_get_rate(drvdata->clk);
>  	if (!clk_rate)
>  		return -EINVAL;
> diff --git a/drivers/watchdog/lpc18xx_wdt.c b/drivers/watchdog/lpc18xx_wdt.c
> index 60b6d74f267d..1b9b5f21a0df 100644
> --- a/drivers/watchdog/lpc18xx_wdt.c
> +++ b/drivers/watchdog/lpc18xx_wdt.c
> @@ -197,16 +197,10 @@ static const struct watchdog_ops lpc18xx_wdt_ops = {
>  	.restart        = lpc18xx_wdt_restart,
>  };
>  
> -static void lpc18xx_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int lpc18xx_wdt_probe(struct platform_device *pdev)
>  {
>  	struct lpc18xx_wdt_dev *lpc18xx_wdt;
>  	struct device *dev = &pdev->dev;
> -	int ret;
>  
>  	lpc18xx_wdt = devm_kzalloc(dev, sizeof(*lpc18xx_wdt), GFP_KERNEL);
>  	if (!lpc18xx_wdt)
> @@ -216,38 +210,18 @@ static int lpc18xx_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(lpc18xx_wdt->base))
>  		return PTR_ERR(lpc18xx_wdt->base);
>  
> -	lpc18xx_wdt->reg_clk = devm_clk_get(dev, "reg");
> +	lpc18xx_wdt->reg_clk = devm_clk_get_enabled(dev, "reg");
>  	if (IS_ERR(lpc18xx_wdt->reg_clk)) {
>  		dev_err(dev, "failed to get the reg clock\n");
>  		return PTR_ERR(lpc18xx_wdt->reg_clk);
>  	}
>  
> -	lpc18xx_wdt->wdt_clk = devm_clk_get(dev, "wdtclk");
> +	lpc18xx_wdt->wdt_clk = devm_clk_get_enabled(dev, "wdtclk");
>  	if (IS_ERR(lpc18xx_wdt->wdt_clk)) {
>  		dev_err(dev, "failed to get the wdt clock\n");
>  		return PTR_ERR(lpc18xx_wdt->wdt_clk);
>  	}
>  
> -	ret = clk_prepare_enable(lpc18xx_wdt->reg_clk);
> -	if (ret) {
> -		dev_err(dev, "could not prepare or enable sys clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, lpc18xx_clk_disable_unprepare,
> -				       lpc18xx_wdt->reg_clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(lpc18xx_wdt->wdt_clk);
> -	if (ret) {
> -		dev_err(dev, "could not prepare or enable wdt clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, lpc18xx_clk_disable_unprepare,
> -				       lpc18xx_wdt->wdt_clk);
> -	if (ret)
> -		return ret;
> -
>  	/* We use the clock rate to calculate timeouts */
>  	lpc18xx_wdt->clk_rate = clk_get_rate(lpc18xx_wdt->wdt_clk);
>  	if (lpc18xx_wdt->clk_rate == 0) {
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index d3c9e2f6e63b..cf65d096f3c0 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -146,16 +146,10 @@ static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
>  
> -static void meson_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct meson_gxbb_wdt *data;
> -	int ret;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -165,18 +159,10 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->reg_base))
>  		return PTR_ERR(data->reg_base);
>  
> -	data->clk = devm_clk_get(dev, NULL);
> +	data->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(data->clk))
>  		return PTR_ERR(data->clk);
>  
> -	ret = clk_prepare_enable(data->clk);
> -	if (ret)
> -		return ret;
> -	ret = devm_add_action_or_reset(dev, meson_clk_disable_unprepare,
> -				       data->clk);
> -	if (ret)
> -		return ret;
> -
>  	platform_set_drvdata(pdev, data);
>  
>  	data->wdt_dev.parent = dev;
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 3318544366b8..2a079ca04aa3 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -154,11 +154,6 @@ static u32 xwdt_selftest(struct xwdt_device *xdev)
>  		return XWT_TIMER_FAILED;
>  }
>  
> -static void xwdt_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int xwdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -193,7 +188,7 @@ static int xwdt_probe(struct platform_device *pdev)
>  
>  	watchdog_set_nowayout(xilinx_wdt_wdd, enable_once);
>  
> -	xdev->clk = devm_clk_get(dev, NULL);
> +	xdev->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(xdev->clk)) {
>  		if (PTR_ERR(xdev->clk) != -ENOENT)
>  			return PTR_ERR(xdev->clk);
> @@ -211,15 +206,6 @@ static int xwdt_probe(struct platform_device *pdev)
>  				 "The watchdog clock freq cannot be obtained\n");
>  	} else {
>  		pfreq = clk_get_rate(xdev->clk);
> -		rc = clk_prepare_enable(xdev->clk);
> -		if (rc) {
> -			dev_err(dev, "unable to enable clock\n");
> -			return rc;
> -		}
> -		rc = devm_add_action_or_reset(dev, xwdt_clk_disable_unprepare,
> -					      xdev->clk);
> -		if (rc)
> -			return rc;
>  	}
>  
>  	/*
> diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
> index f43062b3c4c8..bc4ccddc75a3 100644
> --- a/drivers/watchdog/pic32-dmt.c
> +++ b/drivers/watchdog/pic32-dmt.c
> @@ -164,11 +164,6 @@ static struct watchdog_device pic32_dmt_wdd = {
>  	.ops		= &pic32_dmt_fops,
>  };
>  
> -static void pic32_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int pic32_dmt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -184,20 +179,12 @@ static int pic32_dmt_probe(struct platform_device *pdev)
>  	if (IS_ERR(dmt->regs))
>  		return PTR_ERR(dmt->regs);
>  
> -	dmt->clk = devm_clk_get(dev, NULL);
> +	dmt->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(dmt->clk)) {
>  		dev_err(dev, "clk not found\n");
>  		return PTR_ERR(dmt->clk);
>  	}
>  
> -	ret = clk_prepare_enable(dmt->clk);
> -	if (ret)
> -		return ret;
> -	ret = devm_add_action_or_reset(dev, pic32_clk_disable_unprepare,
> -				       dmt->clk);
> -	if (ret)
> -		return ret;
> -
>  	wdd->timeout = pic32_dmt_get_timeout_secs(dmt);
>  	if (!wdd->timeout) {
>  		dev_err(dev, "failed to read watchdog register timeout\n");
> diff --git a/drivers/watchdog/pic32-wdt.c b/drivers/watchdog/pic32-wdt.c
> index 41715d68d9e9..6d1a00222991 100644
> --- a/drivers/watchdog/pic32-wdt.c
> +++ b/drivers/watchdog/pic32-wdt.c
> @@ -162,11 +162,6 @@ static const struct of_device_id pic32_wdt_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, pic32_wdt_dt_ids);
>  
> -static void pic32_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int pic32_wdt_drv_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -186,22 +181,12 @@ static int pic32_wdt_drv_probe(struct platform_device *pdev)
>  	if (!wdt->rst_base)
>  		return -ENOMEM;
>  
> -	wdt->clk = devm_clk_get(dev, NULL);
> +	wdt->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(wdt->clk)) {
>  		dev_err(dev, "clk not found\n");
>  		return PTR_ERR(wdt->clk);
>  	}
>  
> -	ret = clk_prepare_enable(wdt->clk);
> -	if (ret) {
> -		dev_err(dev, "clk enable failed\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, pic32_clk_disable_unprepare,
> -				       wdt->clk);
> -	if (ret)
> -		return ret;
> -
>  	if (pic32_wdt_is_win_enabled(wdt)) {
>  		dev_err(dev, "windowed-clear mode is not supported.\n");
>  		return -ENODEV;
> diff --git a/drivers/watchdog/pnx4008_wdt.c b/drivers/watchdog/pnx4008_wdt.c
> index e0ea133c1690..87a44a5675a1 100644
> --- a/drivers/watchdog/pnx4008_wdt.c
> +++ b/drivers/watchdog/pnx4008_wdt.c
> @@ -179,11 +179,6 @@ static struct watchdog_device pnx4008_wdd = {
>  	.max_timeout = MAX_HEARTBEAT,
>  };
>  
> -static void pnx4008_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int pnx4008_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -195,18 +190,10 @@ static int pnx4008_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt_base))
>  		return PTR_ERR(wdt_base);
>  
> -	wdt_clk = devm_clk_get(dev, NULL);
> +	wdt_clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(wdt_clk))
>  		return PTR_ERR(wdt_clk);
>  
> -	ret = clk_prepare_enable(wdt_clk);
> -	if (ret)
> -		return ret;
> -	ret = devm_add_action_or_reset(dev, pnx4008_clk_disable_unprepare,
> -				       wdt_clk);
> -	if (ret)
> -		return ret;
> -
>  	pnx4008_wdd.bootstatus = (readl(WDTIM_RES(wdt_base)) & WDOG_RESET) ?
>  			WDIOF_CARDRESET : 0;
>  	pnx4008_wdd.parent = dev;
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 0d2209c5eaca..d776474dcdf3 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -175,11 +175,6 @@ static const struct watchdog_info qcom_wdt_pt_info = {
>  	.identity	= KBUILD_MODNAME,
>  };
>  
> -static void qcom_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>  	.offset = reg_offset_data_apcs_tmr,
>  	.pretimeout = false,
> @@ -226,21 +221,12 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(wdt->base))
>  		return PTR_ERR(wdt->base);
>  
> -	clk = devm_clk_get(dev, NULL);
> +	clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(clk)) {
>  		dev_err(dev, "failed to get input clock\n");
>  		return PTR_ERR(clk);
>  	}
>  
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "failed to setup clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, qcom_clk_disable_unprepare, clk);
> -	if (ret)
> -		return ret;
> -
>  	/*
>  	 * We use the clock rate to calculate the max timeout, so ensure it's
>  	 * not zero to avoid a divide-by-zero exception.
> diff --git a/drivers/watchdog/rtd119x_wdt.c b/drivers/watchdog/rtd119x_wdt.c
> index 834b94ff3f90..95c8d7abce42 100644
> --- a/drivers/watchdog/rtd119x_wdt.c
> +++ b/drivers/watchdog/rtd119x_wdt.c
> @@ -94,16 +94,10 @@ static const struct of_device_id rtd119x_wdt_dt_ids[] = {
>  	 { }
>  };
>  
> -static void rtd119x_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int rtd119x_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct rtd119x_watchdog_device *data;
> -	int ret;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
> @@ -113,18 +107,10 @@ static int rtd119x_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(data->base))
>  		return PTR_ERR(data->base);
>  
> -	data->clk = devm_clk_get(dev, NULL);
> +	data->clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(data->clk))
>  		return PTR_ERR(data->clk);
>  
> -	ret = clk_prepare_enable(data->clk);
> -	if (ret)
> -		return ret;
> -	ret = devm_add_action_or_reset(dev, rtd119x_clk_disable_unprepare,
> -				       data->clk);
> -	if (ret)
> -		return ret;
> -
>  	data->wdt_dev.info = &rtd119x_wdt_info;
>  	data->wdt_dev.ops = &rtd119x_wdt_ops;
>  	data->wdt_dev.timeout = 120;
> diff --git a/drivers/watchdog/st_lpc_wdt.c b/drivers/watchdog/st_lpc_wdt.c
> index 14ab6559c748..d79823e1b07e 100644
> --- a/drivers/watchdog/st_lpc_wdt.c
> +++ b/drivers/watchdog/st_lpc_wdt.c
> @@ -142,11 +142,6 @@ static struct watchdog_device st_wdog_dev = {
>  	.ops		= &st_wdog_ops,
>  };
>  
> -static void st_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int st_wdog_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -190,7 +185,7 @@ static int st_wdog_probe(struct platform_device *pdev)
>  		return PTR_ERR(regmap);
>  	}
>  
> -	clk = devm_clk_get(dev, NULL);
> +	clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(clk)) {
>  		dev_err(dev, "Unable to request clock\n");
>  		return PTR_ERR(clk);
> @@ -210,15 +205,6 @@ static int st_wdog_probe(struct platform_device *pdev)
>  	st_wdog_dev.max_timeout = 0xFFFFFFFF / st_wdog->clkrate;
>  	st_wdog_dev.parent = dev;
>  
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "Unable to enable clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, st_clk_disable_unprepare, clk);
> -	if (ret)
> -		return ret;
> -
>  	watchdog_set_drvdata(&st_wdog_dev, st_wdog);
>  	watchdog_set_nowayout(&st_wdog_dev, WATCHDOG_NOWAYOUT);
>  
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index 570a71509d2a..01849720310d 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -150,50 +150,23 @@ static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> -static void stm32_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int stm32_iwdg_clk_init(struct platform_device *pdev,
>  			       struct stm32_iwdg *wdt)
>  {
>  	struct device *dev = &pdev->dev;
> -	u32 ret;
>  
> -	wdt->clk_lsi = devm_clk_get(dev, "lsi");
> +	wdt->clk_lsi = devm_clk_get_enabled(dev, "lsi");
>  	if (IS_ERR(wdt->clk_lsi))
>  		return dev_err_probe(dev, PTR_ERR(wdt->clk_lsi), "Unable to get lsi clock\n");
>  
>  	/* optional peripheral clock */
>  	if (wdt->data->has_pclk) {
> -		wdt->clk_pclk = devm_clk_get(dev, "pclk");
> +		wdt->clk_pclk = devm_clk_get_enabled(dev, "pclk");
>  		if (IS_ERR(wdt->clk_pclk))
>  			return dev_err_probe(dev, PTR_ERR(wdt->clk_pclk),
>  					     "Unable to get pclk clock\n");
> -
> -		ret = clk_prepare_enable(wdt->clk_pclk);
> -		if (ret) {
> -			dev_err(dev, "Unable to prepare pclk clock\n");
> -			return ret;
> -		}
> -		ret = devm_add_action_or_reset(dev,
> -					       stm32_clk_disable_unprepare,
> -					       wdt->clk_pclk);
> -		if (ret)
> -			return ret;
>  	}
>  
> -	ret = clk_prepare_enable(wdt->clk_lsi);
> -	if (ret) {
> -		dev_err(dev, "Unable to prepare lsi clock\n");
> -		return ret;
> -	}
> -	ret = devm_add_action_or_reset(dev, stm32_clk_disable_unprepare,
> -				       wdt->clk_lsi);
> -	if (ret)
> -		return ret;
> -
>  	wdt->rate = clk_get_rate(wdt->clk_lsi);
>  
>  	return 0;
> diff --git a/drivers/watchdog/visconti_wdt.c b/drivers/watchdog/visconti_wdt.c
> index 83ef55e66ca8..1127e42734f4 100644
> --- a/drivers/watchdog/visconti_wdt.c
> +++ b/drivers/watchdog/visconti_wdt.c
> @@ -112,11 +112,6 @@ static const struct watchdog_ops visconti_wdt_ops = {
>  	.set_timeout	= visconti_wdt_set_timeout,
>  };
>  
> -static void visconti_clk_disable_unprepare(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static int visconti_wdt_probe(struct platform_device *pdev)
>  {
>  	struct watchdog_device *wdev;
> @@ -134,20 +129,9 @@ static int visconti_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -	clk = devm_clk_get(dev, NULL);
> +	clk = devm_clk_get_enabled(dev, NULL);
>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "Could not get clock\n");
> -
> -	ret = clk_prepare_enable(clk);
> -	if (ret) {
> -		dev_err(dev, "Could not enable clock\n");
> -		return ret;
> -	}
> -
> -	ret = devm_add_action_or_reset(dev, visconti_clk_disable_unprepare, clk);
> -	if (ret)
> -		return ret;
> -
>  	clk_freq = clk_get_rate(clk);
>  	if (!clk_freq)
>  		return -EINVAL;
> -- 
> 2.35.1
> 
