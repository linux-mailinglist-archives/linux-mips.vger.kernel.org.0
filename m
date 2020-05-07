Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E575D1C88BA
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 13:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgEGLpz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 07:45:55 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58981 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgEGLpz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 07:45:55 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C8CFFFF815;
        Thu,  7 May 2020 11:45:25 +0000 (UTC)
Date:   Thu, 7 May 2020 13:45:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] pinctrl: ocelot: Add platform dependency
Message-ID: <20200507114525.GE34497@piout.net>
References: <20200507114015.24461-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507114015.24461-1-geert+renesas@glider.be>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 07/05/2020 13:40:15+0200, Geert Uytterhoeven wrote:
> The Microsemi Ocelot pin controller is only present on Microsemi Ocelot
> and Jaguar2 SoCs.  Add a platform dependency to the PINCTRL_OCELOT
> config symbol, to avoid asking the user about it when configuring a
> kernel without Ocelot or Jaguar2 support.
> 

I have to NAK here because there are upcoming (hopefully this cycle)
SoCs using this driver.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index f0ce4ce3e0f52456..bed67c08a0892240 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -394,8 +394,8 @@ config PINCTRL_RK805
>  
>  config PINCTRL_OCELOT
>  	bool "Pinctrl driver for the Microsemi Ocelot and Jaguar2 SoCs"
> -	depends on OF
> -	depends on HAS_IOMEM
> +	depends on OF && HAS_IOMEM
> +	depends on MSCC_OCELOT || COMPILE_TEST
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
>  	select GENERIC_PINCONF
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
