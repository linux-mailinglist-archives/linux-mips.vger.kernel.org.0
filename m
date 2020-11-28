Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CA82C71AC
	for <lists+linux-mips@lfdr.de>; Sat, 28 Nov 2020 23:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387707AbgK1WBE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Nov 2020 17:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391325AbgK1WA4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Nov 2020 17:00:56 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA47C0613D2
        for <linux-mips@vger.kernel.org>; Sat, 28 Nov 2020 14:00:16 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kj8GF-0005eW-NB; Sat, 28 Nov 2020 23:00:07 +0100
Subject: Re: [Linux-stm32] [PATCH v8 3/5] ARM: dts: stm32: Fix schema warnings
 for pwm-leds
To:     Alexander Dahl <post@lespocky.de>, Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-leds@vger.kernel.org
References: <20201128215353.3991-1-post@lespocky.de>
 <20201128215353.3991-4-post@lespocky.de>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <044d49be-2016-818e-b1b0-ee50c3b744e7@pengutronix.de>
Date:   Sat, 28 Nov 2020 23:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201128215353.3991-4-post@lespocky.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 28.11.20 22:53, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
>   CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v7 -> v8:
>       * rebased on v5.10-rc1
>       * updated indexes and added comment (Ahmad Fatoum)

Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks,

>     
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
> 
>  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 1e5333fd437f..5ed58110d963 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -36,34 +36,35 @@
>  		stdout-path = &uart4;
>  	};
>  
> -	led-act {
> +	led-controller-0 {
>  		compatible = "gpio-leds";
>  
> -		led-green {
> +		led-0 {
>  			label = "mc1:green:act";
>  			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  	};
>  
> -	led-rgb {
> +	led-controller-1 {
>  		compatible = "pwm-leds";
>  
> -		led-red {
> +		/* led-1 to led-3 are part of a single RGB led */
> +		led-1 {
>  			label = "mc1:red:rgb";
>  			pwms = <&leds_pwm 1 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-green {
> +		led-2 {
>  			label = "mc1:green:rgb";
>  			pwms = <&leds_pwm 2 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-blue {
> +		led-3 {
>  			label = "mc1:blue:rgb";
>  			pwms = <&leds_pwm 3 1000000 0>;
>  			max-brightness = <255>;
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
