Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AEE331130
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 15:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhCHOrV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Mar 2021 09:47:21 -0500
Received: from aposti.net ([89.234.176.197]:47378 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229697AbhCHOq5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 09:46:57 -0500
Date:   Mon, 08 Mar 2021 14:46:26 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] mmc: jz4740: Add support for monitoring PLL clock
 rate changes
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org
Message-Id: <EPNNPQ.GYRRY95IUVFU@crapouillou.net>
In-Reply-To: <20210307170742.70949-3-paul@crapouillou.net>
References: <20210307170742.70949-1-paul@crapouillou.net>
        <20210307170742.70949-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le dim. 7 mars 2021 à 17:07, Paul Cercueil <paul@crapouillou.net> a 
écrit :
> The main PLL can have its rate changed at any moment. To keep the MMC
> clock running at a rate that fits the specifications, we need to
> recompute the MMC clock rate every time the PLL rate changes.
> 
> Use a mutex to ensure that the MMC is idle before performing the PLL 
> and
> MMC rate changes.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/mmc/host/jz4740_mmc.c | 70 
> ++++++++++++++++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/jz4740_mmc.c 
> b/drivers/mmc/host/jz4740_mmc.c
> index b3c636edbb46..1197b8c6b6ed 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -18,6 +18,7 @@
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/slot-gpio.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of_device.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> @@ -149,6 +150,10 @@ struct jz4740_mmc_host {
>  	struct platform_device *pdev;
>  	struct clk *clk;
> 
> +	atomic_t clk_mutex_count;
> +	struct mutex clk_mutex;
> +	struct notifier_block clock_nb;
> +
>  	enum jz4740_mmc_version version;
> 
>  	int irq;
> @@ -338,6 +343,9 @@ static void jz4740_mmc_pre_request(struct 
> mmc_host *mmc,
>  	struct jz4740_mmc_host *host = mmc_priv(mmc);
>  	struct mmc_data *data = mrq->data;
> 
> +	if (atomic_inc_and_test(&host->clk_mutex_count))
> +		mutex_lock(&host->clk_mutex);

There's an obvious race here, let me rewrite this using the proper 
locking mechanism.

-Paul

> +
>  	if (!host->use_dma)
>  		return;
> 
> @@ -353,6 +361,9 @@ static void jz4740_mmc_post_request(struct 
> mmc_host *mmc,
>  	struct jz4740_mmc_host *host = mmc_priv(mmc);
>  	struct mmc_data *data = mrq->data;
> 
> +	if (atomic_dec_return(&host->clk_mutex_count) == -1)
> +		mutex_unlock(&host->clk_mutex);
> +
>  	if (data && data->host_cookie != COOKIE_UNMAPPED)
>  		jz4740_mmc_dma_unmap(host, data);
> 
> @@ -955,6 +966,48 @@ static const struct mmc_host_ops jz4740_mmc_ops 
> = {
>  	.enable_sdio_irq = jz4740_mmc_enable_sdio_irq,
>  };
> 
> +static inline struct jz4740_mmc_host *
> +jz4740_mmc_nb_get_priv(struct notifier_block *nb)
> +{
> +	return container_of(nb, struct jz4740_mmc_host, clock_nb);
> +}
> +
> +static struct clk *jz4740_mmc_get_parent_clk(struct clk *clk)
> +{
> +	/*
> +	 * Return the first clock above the one that will effectively modify
> +	 * its rate when clk_set_rate(clk) is called.
> +	 */
> +	clk = clk_get_first_to_set_rate(clk);
> +
> +	return clk_get_parent(clk);
> +}
> +
> +static int jz4740_mmc_update_clk(struct notifier_block *nb,
> +				 unsigned long action,
> +				 void *data)
> +{
> +	struct jz4740_mmc_host *host = jz4740_mmc_nb_get_priv(nb);
> +
> +	/*
> +	 * PLL may have changed its frequency; our clock may be running 
> above
> +	 * spec. Wait until MMC is idle (using host->clk_mutex) before 
> changing
> +	 * the PLL clock, and after it's done, reset our clock rate.
> +	 */
> +
> +	switch (action) {
> +	case PRE_RATE_CHANGE:
> +		mutex_lock(&host->clk_mutex);
> +		break;
> +	default:
> +		clk_set_rate(host->clk, host->mmc->f_max);
> +		mutex_unlock(&host->clk_mutex);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  static const struct of_device_id jz4740_mmc_of_match[] = {
>  	{ .compatible = "ingenic,jz4740-mmc", .data = (void *) 
> JZ_MMC_JZ4740 },
>  	{ .compatible = "ingenic,jz4725b-mmc", .data = (void 
> *)JZ_MMC_JZ4725B },
> @@ -971,6 +1024,7 @@ static int jz4740_mmc_probe(struct 
> platform_device* pdev)
>  	struct mmc_host *mmc;
>  	struct jz4740_mmc_host *host;
>  	const struct of_device_id *match;
> +	struct clk *parent_clk;
> 
>  	mmc = mmc_alloc_host(sizeof(struct jz4740_mmc_host), &pdev->dev);
>  	if (!mmc) {
> @@ -1058,12 +1112,24 @@ static int jz4740_mmc_probe(struct 
> platform_device* pdev)
>  		goto err_free_irq;
>  	host->use_dma = !ret;
> 
> +	atomic_set(&host->clk_mutex_count, -1);
> +	mutex_init(&host->clk_mutex);
> +	host->clock_nb.notifier_call = jz4740_mmc_update_clk;
> +
> +	parent_clk = jz4740_mmc_get_parent_clk(host->clk);
> +
> +	ret = clk_notifier_register(parent_clk, &host->clock_nb);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to register clock notifier\n");
> +		goto err_release_dma;
> +	}
> +
>  	platform_set_drvdata(pdev, host);
>  	ret = mmc_add_host(mmc);
> 
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to add mmc host: %d\n", ret);
> -		goto err_release_dma;
> +		goto err_unregister_clk_notifier;
>  	}
>  	dev_info(&pdev->dev, "Ingenic SD/MMC card driver registered\n");
> 
> @@ -1074,6 +1140,8 @@ static int jz4740_mmc_probe(struct 
> platform_device* pdev)
> 
>  	return 0;
> 
> +err_unregister_clk_notifier:
> +	clk_notifier_unregister(parent_clk, &host->clock_nb);
>  err_release_dma:
>  	if (host->use_dma)
>  		jz4740_mmc_release_dma_channels(host);
> --
> 2.30.1
> 


