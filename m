Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580CA44028E
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhJ2SzR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhJ2SzP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:55:15 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1675FC061570;
        Fri, 29 Oct 2021 11:52:47 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id y128so14664202oie.8;
        Fri, 29 Oct 2021 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ldSSeVAlvOj4l8QLMah9LAJhWoH7wMHLjFmgtahfoQ0=;
        b=KoXyKwkCjQp9WMUR5gh503BBhGxyWKs0Gg4Wgi+EkPP3TcpjRH1EAzJ3glxkaOIsp1
         ZB2bQii6UKEccvcgY/nFkiu2iHTnzhrrCWbqTNjsWoTjj6y2Vd20ycyuXp80CKWGWgTy
         DVYNCHEWb2YSZxwvIBW/hTNVHtqVUy7UCbT3/SxPwlHx2cG36TxAZJ7HTWeGGYMx96cM
         8KgRjX9fv8oEcPiplRu/SsoQd1dyRkJxwdDDrZRzIGYGxj0nMWTyS41yUG4EDwStF+oS
         zI7230e0M/lZWyO1n4PsTdtAJAucu63vs7ye3o3RfvbaywofjCN/FLGixQG2sJXYOKO0
         HAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ldSSeVAlvOj4l8QLMah9LAJhWoH7wMHLjFmgtahfoQ0=;
        b=CND9qkrFNDMKAhmaXI8JPFhfY9Hn89Yc9644loz63/Aauw6hm7BDBD5n+PrlkJrtMf
         aQhIeZrQwAYlezTuvJGg7sAatfuYXpbDckZZL5GidihY0gJnhPH7wlhiPw29W+2UgJa+
         b/eK/JDBOHS/JveURsWIbr5nc0rb+gQskcw2Qxfr/CO6axr5UGqBpKC8unNPpca+jfQI
         pB2GwQ7j0O4SdFqBHORrcHn93plh5e1V/sjeLyKYwjCJ4SBH9f9XJiycJdzZZJVN9LLV
         JYrE1S32J6xPwMwTtw/QLhsbxm6EfDyVAbfckSVHdP83qtlR8ltf8d8soHAbAWXb/16e
         yu1w==
X-Gm-Message-State: AOAM530YISFz8spGz900lsTHMdYxeYD0EpGOUhRNHM+GzgbTveqfspe8
        7KyU8Ew1t9Me9iWgGJEJucs=
X-Google-Smtp-Source: ABdhPJyjEjslkxWcZG5a7lHRh11XgnWlPh8v6MplDYzTY9R31CsIogZW4U690v8sDlzB0w21uomSlA==
X-Received: by 2002:aca:6703:: with SMTP id z3mr9530433oix.131.1635533566474;
        Fri, 29 Oct 2021 11:52:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p14sm1890114oov.0.2021.10.29.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:52:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 29 Oct 2021 11:52:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, rafal@milecki.pl,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "maintainer:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Justin Chen <justinpopo6@gmail.com>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "moderated list:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 6/7] MIPS: BCM63XX: Provide platform data to watchdog
 device
Message-ID: <20211029185243.GA1722149@roeck-us.net>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
 <20211029183430.4086765-7-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029183430.4086765-7-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 29, 2021 at 11:34:29AM -0700, Florian Fainelli wrote:
> In order to utilize the bcm7038_wdt.c driver which needs to know the
> clock name to obtain, pass it via platform data using the
> bcm7038_wdt_platform_data structure.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

We'll need an Ack from a MIPS maintainer for this patch to
be able to apply it through the watchdog tree.

Guenter

> ---
>  arch/mips/bcm63xx/dev-wdt.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/mips/bcm63xx/dev-wdt.c b/arch/mips/bcm63xx/dev-wdt.c
> index 2a2346a99bcb..42130914a3c2 100644
> --- a/arch/mips/bcm63xx/dev-wdt.c
> +++ b/arch/mips/bcm63xx/dev-wdt.c
> @@ -9,6 +9,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_data/bcm7038_wdt.h>
>  #include <bcm63xx_cpu.h>
>  
>  static struct resource wdt_resources[] = {
> @@ -19,11 +20,18 @@ static struct resource wdt_resources[] = {
>  	},
>  };
>  
> +static struct bcm7038_wdt_platform_data bcm63xx_wdt_pdata = {
> +	.clk_name	= "periph",
> +};
> +
>  static struct platform_device bcm63xx_wdt_device = {
>  	.name		= "bcm63xx-wdt",
>  	.id		= -1,
>  	.num_resources	= ARRAY_SIZE(wdt_resources),
>  	.resource	= wdt_resources,
> +	.dev		= {
> +		.platform_data = &bcm63xx_wdt_pdata,
> +	},
>  };
>  
>  int __init bcm63xx_wdt_register(void)
> -- 
> 2.25.1
> 
