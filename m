Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C7C386D00
	for <lists+linux-mips@lfdr.de>; Tue, 18 May 2021 00:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242674AbhEQWh3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 18:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236978AbhEQWh2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 18:37:28 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E99C061573;
        Mon, 17 May 2021 15:36:10 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id k10so6087080qtp.9;
        Mon, 17 May 2021 15:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/BL81Zvw47CwZwFDCCckd5WGqcHgC/YA9bmIFVjzNT0=;
        b=JTNH/INRb5+rdbfSEjXZ/kvPEYZTwfpcpJpgIQCj5G9kViFSAHDWb31Ckhy6Tp13zt
         GCmgQ9cGbnnwk0UVUHBcHh3xWxvVgQX1Kp212V3oz7Y8j5RZYSqzNQjsU1BO1M+d4XgO
         Ttk62KvtpkdxjHFLa10cpODOLiuzykNlSazLFJoB1ykjeN9hQVIxTJYIRmhapY2BxyVM
         swEFhmQPNHpVFbk5vwOBAD32L2dUGV39mGvo5KK0Nik8QlUUX63nhboWLAM7ox0cML98
         UXJ/CjMiN3p/8G5z4JQ4soahT3tjjfB4Xd/jaEq4VqQmBiE/Zlk5EqK3kZWxkNpnXqqv
         2+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=/BL81Zvw47CwZwFDCCckd5WGqcHgC/YA9bmIFVjzNT0=;
        b=txilG4wYGKQ67a7poMzyQ/YHrj9mB482kCAgy3dG0adx0Fbgzz7n7tPqs4bPO8wO3J
         JZDLc6ZBqnoCsmRSrnIvsHnPNzP7PQmv1SLERRmzZga8e3gfRFHFa+hPLmmBIR0fwX08
         Pq/o3Gq6ta7qtHat8p0Zg+kAGLpePJfG0d2QKNrQAD6pQTp0Og4Wqa/jydDF/0/hApoN
         viDLQSWeqU3NxfVkV6dFFE4SbDADE+I1YXcT5ZmLRSe9lUbS48oZuGqO7EznharnNthD
         wsl+4Pic4rFvG71VWYt5d6DDwxYOCwgx9/WQT9c5uSZ5QaM9N32k5J6+Rxw0PHXHDMEB
         NbkA==
X-Gm-Message-State: AOAM5318lzVVvvQ7bh70vhPC75Xp2QgWPP67kma6UQQDC/9H3OiJbYoW
        jE3c76RXonqZxS5Ze9AZ7rc=
X-Google-Smtp-Source: ABdhPJw8fL/eLIB8o69xiooADp1RJIks4Qz1C3Bv3bpYnXa2jFykj0Mlx8098hm+PQz4FqaRP+fxYg==
X-Received: by 2002:ac8:7956:: with SMTP id r22mr1016958qtt.361.1621290970055;
        Mon, 17 May 2021 15:36:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w7sm11143840qtn.91.2021.05.17.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:36:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 17 May 2021 15:36:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-mips@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] watchdog: jz4740: Fix return value check in
 jz4740_wdt_probe()
Message-ID: <20210517223608.GA3628982@roeck-us.net>
References: <20210304045909.945799-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304045909.945799-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 04, 2021 at 04:59:09AM +0000, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function device_node_to_regmap() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Fixes: 6d532143c915 ("watchdog: jz4740: Use regmap provided by TCU driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/jz4740_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/jz4740_wdt.c b/drivers/watchdog/jz4740_wdt.c
> index bdf9564efa29..395bde79e292 100644
> --- a/drivers/watchdog/jz4740_wdt.c
> +++ b/drivers/watchdog/jz4740_wdt.c
> @@ -176,9 +176,9 @@ static int jz4740_wdt_probe(struct platform_device *pdev)
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
