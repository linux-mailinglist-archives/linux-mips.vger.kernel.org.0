Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4366C43E837
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 20:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhJ1SWY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 14:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhJ1SWY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 14:22:24 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE39DC061570;
        Thu, 28 Oct 2021 11:19:56 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o83so9527530oif.4;
        Thu, 28 Oct 2021 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cctVerstAbYzmPMmeH5Ni1L7sHzGomlK5QaPzMpPM7A=;
        b=aco53RqCY/Rl3krsp8/4eT2srAlCvHrEHOPmFfuppY7mqnDZF1PSNIKDzaT927t2Rk
         G9Z1PiASxmZ5IvjtzRFx+yN5qAAcdHntsqEFYzbCi7+o1dw7kfDtvUCUTSGwng7Q7/DV
         tDckln7Mru/FhbMRt/JUymaHeh1O9BJC8Z4FzofXj+M4weoZoM9AKndzmWKTJGfKG/9V
         1X1M4UmC2rYB6KZzqovRt5kul4XmFpRJWjzIzK7oWx5AzflhO9Vh5WOAf/n42taGVmDV
         m1r2cig5VaNt7oeBxskehfhuwb6ihfUbl4DEt8No2+15i+yYZTWrygJeR9ZkbXq0cmQU
         cRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=cctVerstAbYzmPMmeH5Ni1L7sHzGomlK5QaPzMpPM7A=;
        b=YIKEh/6+bcrTqUj3OB67B3HBqdq3xWtlySTFxH3Vk/cK3HpVkO6iQ/e5oTCo5Gwt3n
         QUDl0rywogtfgoffW15L/9PKGOIKB1ghGCywdHyxrLwpRG/KW2J8i+V7JJ1Kb4VS9Y5G
         U9Z2QIfOnTjSXDV9tazPweZJcUMVUpeWzgJXKtDTc99nkACuQEfALxtBea4E2L59XihM
         MOX2Q3xPjxeOK7b7sBH5nQZF5sn9HB2VTKn30B953her8xN5cPV7pb04TRhTBIifeJ/z
         PalZIhqjKUlY+gZYKnbxYV+SJpCCCahBkVeasLUFPTKAeivbWCAB56qHHjAhr64D2I2z
         5QSw==
X-Gm-Message-State: AOAM530lGE0HDiJFfZkC70QpHd2X8mBYS8Oo/RczQWZFuU3BCmY0M9kd
        VNhwaHv3MfLb0reF3brc6mav3di+bmc=
X-Google-Smtp-Source: ABdhPJxIDo2z3l5Kh24x5vwIfCQYyETZGg9JEIZRgjNtpjmkl5I34kfvCcvX1GBOE42949Wq55Vjjw==
X-Received: by 2002:aca:5c5:: with SMTP id 188mr4205914oif.154.1635445196231;
        Thu, 28 Oct 2021 11:19:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6sm1135784oot.18.2021.10.28.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:19:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 28 Oct 2021 11:19:54 -0700
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
Subject: Re: [PATCH 6/7] MIPS: BCM63XX: Provide platform data to watchdog
 device
Message-ID: <20211028181954.GD705675@roeck-us.net>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
 <20211028172322.4021440-7-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028172322.4021440-7-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 28, 2021 at 10:23:21AM -0700, Florian Fainelli wrote:
> In order to utilize the bcm7038_wdt.c driver which needs to know the
> clock name to obtain, pass it via platform data using the
> bcm7038_wdt_platform_data structure.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

We'd need an Ack from a mips maintainer to apply this patch through
the watchdog tree.

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
