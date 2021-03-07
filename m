Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9163302CB
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 16:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhCGP4O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 7 Mar 2021 10:56:14 -0500
Received: from aposti.net ([89.234.176.197]:34344 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232294AbhCGPzt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 10:55:49 -0500
Date:   Sun, 07 Mar 2021 15:55:36 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH -next] watchdog: jz4740: Fix return value check in
 jz4740_wdt_probe()
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-mips@vger.kernel.org,
        linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Message-Id: <O8WLPQ.PW3WC815EH61@crapouillou.net>
In-Reply-To: <20210304045909.945799-1-weiyongjun1@huawei.com>
References: <20210304045909.945799-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu. 4 mars 2021 à 4:59, 'Wei Yongjun <weiyongjun1@huawei.com> a 
écrit :
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function device_node_to_regmap() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Fixes: 6d532143c915 ("watchdog: jz4740: Use regmap provided by TCU 
> driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/watchdog/jz4740_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c 
> b/drivers/watchdog/jz4740_wdt.c
> index bdf9564efa29..395bde79e292 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -176,9 +176,9 @@ static int jz4740_wdt_probe(struct 
> platform_device *pdev)
>  	watchdog_set_drvdata(jz4740_wdt, drvdata);
> 
>  	drvdata->map = device_node_to_regmap(dev->parent->of_node);
> -	if (!drvdata->map) {
> +	if (IS_ERR(drvdata->map)) {
>  		dev_err(dev, "regmap not found\n");
> -		return -EINVAL;
> +		return PTR_ERR(drvdata->map);
>  	}
> 
>  	return devm_watchdog_register_device(dev, &drvdata->wdt);
> 


