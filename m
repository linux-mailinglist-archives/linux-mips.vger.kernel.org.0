Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9116628179C
	for <lists+linux-mips@lfdr.de>; Fri,  2 Oct 2020 18:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388028AbgJBQPt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Oct 2020 12:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726569AbgJBQPt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Oct 2020 12:15:49 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E36AC0613D0;
        Fri,  2 Oct 2020 09:15:49 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 60so1886773otw.3;
        Fri, 02 Oct 2020 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QcJsglaN6j8ELnY041jtpp41fjDg5iQTHgXI92/h56Q=;
        b=MsQYL8D5lweKeucYrJYblZEnBbnXr0kwsw7yxVxkKc41euIKhgG6qHSIEhk5t+TfUj
         LCWWJ4HdjEYib0NyA8Xeu98P7XmeOWp4s5anqL35yfbyPdMmdNSWIqOccUx/N4Cn84vM
         3z8HU2bV4maC6SQ3iBBAkTsKljXP11nnYxwR1kTtrVAFbFlnSgLkzCgV+rZdIXePqCLM
         Khx8kyWI2SpiY0RXc+R+hLZvdItmMxD4KPYQ1x952uRTCy53Onb9gjWT3aTU/roJ3Gn1
         Vg85uDSX8X2Xli7yTSA1yQi6IVBytaaSS5sLzW2fxY5rdMGaArY2HGs9DLrI0fMm/AM3
         r6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QcJsglaN6j8ELnY041jtpp41fjDg5iQTHgXI92/h56Q=;
        b=eyVu46wIwpyg9UtZMiM5TJD6zj/BLLrczMvv416ioFFZuOmlhIhoHipJYGGR+6H5YA
         egpT9W4a9YdLAtR5tWqCJk8/K8QiI+PhGafpi/ghegPGI7BI/X4hggnuJ9+aS5FYFr6X
         kCM7xHATOTgek/m44+o17bdVwTbF2O1je5civkHqSYFkhMG5QiEoAH5iygNP9aimZG27
         9RU0TEdwuBXi9FHFgVSzxRvZ/d2yTp82oDDVgROzS6sRL6N2NGZtu2YILMP9FEo4dy5n
         +CK3ry37qYWmrzdd+ujNqik5PWqbGQ+szM0R2CEKd2E9QN384Jjlet6Nq3DBGbKMWlUI
         KlXQ==
X-Gm-Message-State: AOAM5312rzcateHsJ5jsTqqsw7+WMO2sIENMMzX8ZxXgbvekFLUhE03k
        v6hDOSrp6qc1SoU7OJu+jFc=
X-Google-Smtp-Source: ABdhPJxMgirEbtFDox1KUgKm57ifjzhdaCsEy+l8O9xsQdpnivG0DaeuLQC1cXFfupaJolWd50lvnw==
X-Received: by 2002:a9d:78a:: with SMTP id 10mr2394002oto.102.1601655348555;
        Fri, 02 Oct 2020 09:15:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s5sm449868otr.42.2020.10.02.09.15.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:15:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 2 Oct 2020 09:15:47 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: bt1-pvt: Cache current update timeout
Message-ID: <20201002161547.GA44614@roeck-us.net>
References: <20200920110924.19741-1-Sergey.Semin@baikalelectronics.ru>
 <20200920110924.19741-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920110924.19741-3-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 02:09:22PM +0300, Serge Semin wrote:
> Instead of converting the update timeout data to the milliseconds each
> time on the read procedure let's preserve the currently set timeout in the
> dedicated driver private data cache. The cached value will be then used in
> the timeout read method and in the alarm-less data conversion to prevent
> the caller task hanging up in case if the PVT sensor is suddenly powered
> down.
> 
> Fixes: 87976ce2825d ("hwmon: Add Baikal-T1 PVT sensor driver")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/bt1-pvt.c | 85 ++++++++++++++++++++++-------------------
>  drivers/hwmon/bt1-pvt.h |  3 ++
>  2 files changed, 49 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/hwmon/bt1-pvt.c b/drivers/hwmon/bt1-pvt.c
> index f4b7353c078a..2600426a3b21 100644
> --- a/drivers/hwmon/bt1-pvt.c
> +++ b/drivers/hwmon/bt1-pvt.c
> @@ -655,44 +655,16 @@ static int pvt_write_trim(struct pvt_hwmon *pvt, long val)
>  
>  static int pvt_read_timeout(struct pvt_hwmon *pvt, long *val)
>  {
> -	unsigned long rate;
> -	ktime_t kt;
> -	u32 data;
> -
> -	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
> -	if (!rate)
> -		return -ENODEV;
> -
> -	/*
> -	 * Don't bother with mutex here, since we just read data from MMIO.
> -	 * We also have to scale the ticks timeout up to compensate the
> -	 * ms-ns-data translations.
> -	 */
> -	data = readl(pvt->regs + PVT_TTIMEOUT) + 1;
> +	int ret;
>  
> -	/*
> -	 * Calculate ref-clock based delay (Ttotal) between two consecutive
> -	 * data samples of the same sensor. So we first must calculate the
> -	 * delay introduced by the internal ref-clock timer (Tref * Fclk).
> -	 * Then add the constant timeout cuased by each conversion latency
> -	 * (Tmin). The basic formulae for each conversion is following:
> -	 *   Ttotal = Tref * Fclk + Tmin
> -	 * Note if alarms are enabled the sensors are polled one after
> -	 * another, so in order to have the delay being applicable for each
> -	 * sensor the requested value must be equally redistirbuted.
> -	 */
> -#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
> -	kt = ktime_set(PVT_SENSORS_NUM * (u64)data, 0);
> -	kt = ktime_divns(kt, rate);
> -	kt = ktime_add_ns(kt, PVT_SENSORS_NUM * PVT_TOUT_MIN);
> -#else
> -	kt = ktime_set(data, 0);
> -	kt = ktime_divns(kt, rate);
> -	kt = ktime_add_ns(kt, PVT_TOUT_MIN);
> -#endif
> +	ret = mutex_lock_interruptible(&pvt->iface_mtx);
> +	if (ret)
> +		return ret;
>  
>  	/* Return the result in msec as hwmon sysfs interface requires. */
> -	*val = ktime_to_ms(kt);
> +	*val = ktime_to_ms(pvt->timeout);
> +
> +	mutex_unlock(&pvt->iface_mtx);
>  
>  	return 0;
>  }
> @@ -700,7 +672,7 @@ static int pvt_read_timeout(struct pvt_hwmon *pvt, long *val)
>  static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
>  {
>  	unsigned long rate;
> -	ktime_t kt;
> +	ktime_t kt, cache;
>  	u32 data;
>  	int ret;
>  
> @@ -713,7 +685,7 @@ static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
>  	 * between all available sensors to have the requested delay
>  	 * applicable to each individual sensor.
>  	 */
> -	kt = ms_to_ktime(val);
> +	cache = kt = ms_to_ktime(val);
>  #if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
>  	kt = ktime_divns(kt, PVT_SENSORS_NUM);
>  #endif
> @@ -742,6 +714,7 @@ static int pvt_write_timeout(struct pvt_hwmon *pvt, long val)
>  		return ret;
>  
>  	pvt_set_tout(pvt, data);
> +	pvt->timeout = cache;
>  
>  	mutex_unlock(&pvt->iface_mtx);
>  
> @@ -1018,10 +991,17 @@ static int pvt_check_pwr(struct pvt_hwmon *pvt)
>  	return ret;
>  }
>  
> -static void pvt_init_iface(struct pvt_hwmon *pvt)
> +static int pvt_init_iface(struct pvt_hwmon *pvt)
>  {
> +	unsigned long rate;
>  	u32 trim, temp;
>  
> +	rate = clk_get_rate(pvt->clks[PVT_CLOCK_REF].clk);
> +	if (!rate) {
> +		dev_err(pvt->dev, "Invalid reference clock rate\n");
> +		return -ENODEV;
> +	}
> +
>  	/*
>  	 * Make sure all interrupts and controller are disabled so not to
>  	 * accidentally have ISR executed before the driver data is fully
> @@ -1036,12 +1016,37 @@ static void pvt_init_iface(struct pvt_hwmon *pvt)
>  	pvt_set_mode(pvt, pvt_info[pvt->sensor].mode);
>  	pvt_set_tout(pvt, PVT_TOUT_DEF);
>  
> +	/*
> +	 * Preserve the current ref-clock based delay (Ttotal) between the
> +	 * sensors data samples in the driver data so not to recalculate it
> +	 * each time on the data requests and timeout reads. It consists of the
> +	 * delay introduced by the internal ref-clock timer (N / Fclk) and the
> +	 * constant timeout caused by each conversion latency (Tmin):
> +	 *   Ttotal = N / Fclk + Tmin
> +	 * If alarms are enabled the sensors are polled one after another and
> +	 * in order to get the next measurement of a particular sensor the
> +	 * caller will have to wait for at most until all the others are
> +	 * polled. In that case the formulae will look a bit different:
> +	 *   Ttotal = 5 * (N / Fclk + Tmin)
> +	 */
> +#if defined(CONFIG_SENSORS_BT1_PVT_ALARMS)
> +	pvt->timeout = ktime_set(PVT_SENSORS_NUM * PVT_TOUT_DEF, 0);
> +	pvt->timeout = ktime_divns(pvt->timeout, rate);
> +	pvt->timeout = ktime_add_ns(pvt->timeout, PVT_SENSORS_NUM * PVT_TOUT_MIN);
> +#else
> +	pvt->timeout = ktime_set(PVT_TOUT_DEF, 0);
> +	pvt->timeout = ktime_divns(pvt->timeout, rate);
> +	pvt->timeout = ktime_add_ns(pvt->timeout, PVT_TOUT_MIN);
> +#endif
> +
>  	trim = PVT_TRIM_DEF;
>  	if (!of_property_read_u32(pvt->dev->of_node,
>  	     "baikal,pvt-temp-offset-millicelsius", &temp))
>  		trim = pvt_calc_trim(temp);
>  
>  	pvt_set_trim(pvt, trim);
> +
> +	return 0;
>  }
>  
>  static int pvt_request_irq(struct pvt_hwmon *pvt)
> @@ -1149,7 +1154,9 @@ static int pvt_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	pvt_init_iface(pvt);
> +	ret = pvt_init_iface(pvt);
> +	if (ret)
> +		return ret;
>  
>  	ret = pvt_request_irq(pvt);
>  	if (ret)
> diff --git a/drivers/hwmon/bt1-pvt.h b/drivers/hwmon/bt1-pvt.h
> index 5eac73e94885..93b8dd5e7c94 100644
> --- a/drivers/hwmon/bt1-pvt.h
> +++ b/drivers/hwmon/bt1-pvt.h
> @@ -10,6 +10,7 @@
>  #include <linux/completion.h>
>  #include <linux/hwmon.h>
>  #include <linux/kernel.h>
> +#include <linux/ktime.h>
>  #include <linux/mutex.h>
>  #include <linux/seqlock.h>
>  
> @@ -201,6 +202,7 @@ struct pvt_cache {
>   *	       if alarms are disabled).
>   * @sensor: current PVT sensor the data conversion is being performed for.
>   * @cache: data cache descriptor.
> + * @timeout: conversion timeout cache.
>   */
>  struct pvt_hwmon {
>  	struct device *dev;
> @@ -214,6 +216,7 @@ struct pvt_hwmon {
>  	struct mutex iface_mtx;
>  	enum pvt_sensor_type sensor;
>  	struct pvt_cache cache[PVT_SENSORS_NUM];
> +	ktime_t timeout;
>  };
>  
>  /*
