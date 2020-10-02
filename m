Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE8528179D
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 18:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733260AbgJBQQC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 12:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgJBQQC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Oct 2020 12:16:02 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93AFC0613D0;
        Fri,  2 Oct 2020 09:16:01 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id m13so1861046otl.9;
        Fri, 02 Oct 2020 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zgX1Y61lwKmXwg6phLhqeeQJhLp0kcTvn9poeXISdLQ=;
        b=oDfLUS95hwMnH8jsEnGP60kCAk4zBIe5VFqPlHaDy2qkqvxPlttBuZEACVs9lY2jYW
         VAcldaeIZH48/0+diHOhfGSl1e9TikXG+Xw07T0xdN7jPcpX+UfVR9751xmSfz5nJ2gs
         fXuzBkeAl6ZrOoLEvf2mop0EoElwOZViEh5tuS4wiZfTEera9B2LJZC2uE/O9exgkzXY
         1iLE7g5pxHERmY/qmLPwhg/ZvxmQjKMAMpz637MHZDVSftGnpY/NAcwuRhD+4DgRyXMq
         whycCfpuPatQ+X7GvVKvL/82lv0YzymHi0n8NHyi3L31TvBfRA8rHbNK++8bNxTgQYHB
         Z3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zgX1Y61lwKmXwg6phLhqeeQJhLp0kcTvn9poeXISdLQ=;
        b=gpP8U28elgbna1WtMVboXUO81hxmqN17iVE4RXaNMjhfAsTrG3l0XaTtvGUN20VblH
         YJ7rnOxaTTXpS7iY4CVYs9w1yF69ulw0AHn/IshPWTxokKlN1EZvn0fNzwqB4KQSLz+a
         sgJFzAIe3EcR8cqffMdhQeTMaRpb9Pxdn6DsgzJVQcNF2rXlGbR/Uf485GAQxeL9qYen
         skHKNOkm7dd6aRwICEbEEp83tE9fqvaPamLiRIl8o+bHkJfSaO77QR2g04urHvOhaz1E
         eV58cJOS5Cx5MrVe2lj+cf1DFFzShMv+mj9IC/G++FneNJpBJ6+HZXj98PxK/TjPwGgT
         bs+w==
X-Gm-Message-State: AOAM5304vHRhi/XwKDDBwDGqGXf86+P/DOMBdkhGfAl0Jx2lOITtQu+j
        P49Put93loGReduQAHvZcemGEkGiyas=
X-Google-Smtp-Source: ABdhPJy6TzDf05pU7QIHZkPVm9E0kw1IbYD6c2XuOfusl/k4OKVZXHu3ep9hcioiSsR3uNwhcm5P+w==
X-Received: by 2002:a9d:6a19:: with SMTP id g25mr2320636otn.267.1601655361364;
        Fri, 02 Oct 2020 09:16:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s20sm529135oot.15.2020.10.02.09.16.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:16:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Oct 2020 09:15:59 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: bt1-pvt: Wait for the completion with timeout
Message-ID: <20201002161559.GA44651@roeck-us.net>
References: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
 <20200920110924.19741-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920110924.19741-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 02:09:23PM +0300, Serge Semin wrote:
> If the PVT sensor is suddenly powered down while a caller is waiting for
> the conversion completion, the request won't be finished and the task will
> hang up on this procedure until the power is back up again. Let's call the
> wait_for_completion_timeout() method instead to prevent that. The cached
> timeout is exactly what we need to predict for how long conversion could
> normally last.
> 
> Fixes: 87976ce2825d ("hwmon: Add Baikal-T1 PVT sensor driver")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/bt1-pvt.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
> index 2600426a3b21..3e1d56585b91 100644
> --- a/drivers/hwmon/bt1-pvt.c
> +++ b/drivers/hwmon/bt1-pvt.c
> @@ -477,6 +477,7 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
>  			 long *val)
>  {
>  	struct pvt_cache *cache = &pvt->cache[type];
> +	unsigned long timeout;
>  	u32 data;
>  	int ret;
>  
> @@ -500,7 +501,14 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
>  	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID, 0);
>  	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, PVT_CTRL_EN);
>  
> -	wait_for_completion(&cache->conversion);
> +	/*
> +	 * Wait with timeout since in case if the sensor is suddenly powered
> +	 * down the request won't be completed and the caller will hang up on
> +	 * this procedure until the power is back up again. Multiply the
> +	 * timeout by the factor of two to prevent a false timeout.
> +	 */
> +	timeout = 2 * usecs_to_jiffies(ktime_to_us(pvt->timeout));
> +	ret = wait_for_completion_timeout(&cache->conversion, timeout);
>  
>  	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
>  	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_DVALID,
> @@ -510,6 +518,9 @@ static int pvt_read_data(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
>  
>  	mutex_unlock(&pvt->iface_mtx);
>  
> +	if (!ret)
> +		return -ETIMEDOUT;
> +
>  	if (type == PVT_TEMP)
>  		*val = pvt_calc_poly(&poly_N_to_temp, data);
>  	else
