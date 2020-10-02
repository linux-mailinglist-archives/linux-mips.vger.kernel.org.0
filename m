Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C320C281799
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 18:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbgJBQPg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 12:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgJBQPg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Oct 2020 12:15:36 -0400
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B4AC0613D0;
        Fri,  2 Oct 2020 09:15:36 -0700 (PDT)
Received: by mail-oo1-xc42.google.com with SMTP id k13so476613oor.2;
        Fri, 02 Oct 2020 09:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sJZhl3JKaf7Elmg2WAU+s2HDNeG1D9Zh4FYY7Fo0jrk=;
        b=ORzGdMIOcXX7WjHsjUtYPm3OI8/ZD/Qu36UVtrshLkWVUvoX48mlwKKswmklwrckps
         cPTZ9DcVQOK9szOTSpeuT9V+58PRm1kl/nkB5h5bgRdNyKySm58o47SB7itckigaId5u
         rUtCw5j39NZy55JIa27T7cbkCspag8Z+qIsGRKpJMRAHlDcUWLhTbJ9RERIIFzrO8kDY
         TkcWcGgAQ4pTLbvB7y0q81gzdsRlv8Jrwf07jnbs4uIrvTkCO9VbV9e0zezCdcbLci5e
         dtruduIs/kHe21qyQHQOpCw/N1mmw9KoSBlH4WumZ6yMR/6g35pBrQJI+alR79Kb9+UY
         pB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=sJZhl3JKaf7Elmg2WAU+s2HDNeG1D9Zh4FYY7Fo0jrk=;
        b=gAgQAYE6Id1oPQUw/UKR6cWF+dK+84DX8HPgWWMRlrNXn3LszHLZoSgpMQd9yfsRCA
         5X59zSdYiV4jY2G0yhS6DdJzwhLzeQIGG0O/7c5BYPMvw59u6pKrAdAObwCaOZp/Vnmt
         R5O+af5FGfXVcR68b20Erc4Bqqn8fMwS9z97GhT94HJgLaaELJKHlEUQXBo3Z+1bU9ol
         VAB+3s2ITEvruV/toq8FtrWG5szqMdaGE0TExW2bQNLHatu4HHh37dWfPYIkL75llZXh
         MKM8S9v0Ny/QPzGsksRGNxaub1WMdputUcDSf/u6fgoAOZIX/tGwGQEB9tS59zlFI/C1
         IlKg==
X-Gm-Message-State: AOAM531joesVmJkCiT+eE01sXp9Ojg07tj3i0BdiXOjymg2iLagtN1Qv
        +apvk175ncj8M9haY7F4AWo4tMai2h4=
X-Google-Smtp-Source: ABdhPJy6rrTxCihwcUU1nNtNc0R3Z+6zZ6E277LVCHgkEWdMyjCsLXelhsjhq92MOKT59tIfNHEadQ==
X-Received: by 2002:a4a:c541:: with SMTP id j1mr2449130ooq.13.1601655335379;
        Fri, 02 Oct 2020 09:15:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y24sm522412ooq.38.2020.10.02.09.15.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:15:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Oct 2020 09:15:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: bt1-pvt: Test sensor power supply on probe
Message-ID: <20201002161532.GA44582@roeck-us.net>
References: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
 <20200920110924.19741-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920110924.19741-2-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 02:09:21PM +0300, Serge Semin wrote:
> Baikal-T1 PVT sensor has got a dedicated power supply domain (feed up by
> the external GPVT/VPVT_18 pins). In case if it isn't powered up, the
> registers will be accessible, but the sensor conversion just won't happen.
> Due to that an attempt to read data from any PVT sensor will cause the
> task hanging up.  For instance that will happen if XP11 jumper isn't
> installed on the Baikal-T1-based BFK3.1 board. Let's at least test whether
> the conversion work on the device probe procedure. By doing so will make
> sure that the PVT sensor is powered up at least at boot time.
> 
> Fixes: 87976ce2825d ("hwmon: Add Baikal-T1 PVT sensor driver")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/bt1-pvt.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
> index 94698cae0497..f4b7353c078a 100644
> --- a/drivers/hwmon/bt1-pvt.c
> +++ b/drivers/hwmon/bt1-pvt.c
> @@ -13,6 +13,7 @@
>  #include <linux/bitops.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
> @@ -982,6 +983,41 @@ static int pvt_request_clks(struct pvt_hwmon *pvt)
>  	return 0;
>  }
>  
> +static int pvt_check_pwr(struct pvt_hwmon *pvt)
> +{
> +	unsigned long tout;
> +	int ret = 0;
> +	u32 data;
> +
> +	/*
> +	 * Test out the sensor conversion functionality. If it is not done on
> +	 * time then the domain must have been unpowered and we won't be able
> +	 * to use the device later in this driver.
> +	 * Note If the power source is lost during the normal driver work the
> +	 * data read procedure will either return -ETIMEDOUT (for the
> +	 * alarm-less driver configuration) or just stop the repeated
> +	 * conversion. In the later case alas we won't be able to detect the
> +	 * problem.
> +	 */
> +	pvt_update(pvt->regs + PVT_INTR_MASK, PVT_INTR_ALL, PVT_INTR_ALL);
> +	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, PVT_CTRL_EN);
> +	pvt_set_tout(pvt, 0);
> +	readl(pvt->regs + PVT_DATA);
> +
> +	tout = PVT_TOUT_MIN / NSEC_PER_USEC;
> +	usleep_range(tout, 2 * tout);
> +
> +	data = readl(pvt->regs + PVT_DATA);
> +	if (!(data & PVT_DATA_VALID)) {
> +		ret = -ENODEV;
> +		dev_err(pvt->dev, "Sensor is powered down\n");
> +	}
> +
> +	pvt_update(pvt->regs + PVT_CTRL, PVT_CTRL_EN, 0);
> +
> +	return ret;
> +}
> +
>  static void pvt_init_iface(struct pvt_hwmon *pvt)
>  {
>  	u32 trim, temp;
> @@ -1109,6 +1145,10 @@ static int pvt_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = pvt_check_pwr(pvt);
> +	if (ret)
> +		return ret;
> +
>  	pvt_init_iface(pvt);
>  
>  	ret = pvt_request_irq(pvt);
