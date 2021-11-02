Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21403442B95
	for <lists+linux-mips@lfdr.de>; Tue,  2 Nov 2021 11:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhKBK0U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Nov 2021 06:26:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:55791 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhKBK0R (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Nov 2021 06:26:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mhqx9-0003gx-00; Tue, 02 Nov 2021 11:23:39 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C3EB6C2836; Tue,  2 Nov 2021 11:19:38 +0100 (CET)
Date:   Tue, 2 Nov 2021 11:19:38 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, rafal@milecki.pl,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <20211102101938.GA7475@alpha.franken.de>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
 <20211028172322.4021440-7-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028172322.4021440-7-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 28, 2021 at 10:23:21AM -0700, Florian Fainelli wrote:
> In order to utilize the bcm7038_wdt.c driver which needs to know the
> clock name to obtain, pass it via platform data using the
> bcm7038_wdt_platform_data structure.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
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

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
