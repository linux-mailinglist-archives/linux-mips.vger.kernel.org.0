Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457E329A52A
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 08:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507078AbgJ0HDs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Oct 2020 03:03:48 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41429 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2507074AbgJ0HDs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Oct 2020 03:03:48 -0400
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kXJ1C-00019L-Kr; Tue, 27 Oct 2020 08:03:42 +0100
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
To:     Alexander Dahl <post@lespocky.de>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-leds@vger.kernel.org
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-11-post@lespocky.de>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <b387bda8-3643-1d27-4996-2aa4dc94d69f@pengutronix.de>
Date:   Tue, 27 Oct 2020 08:03:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201005203451.9985-11-post@lespocky.de>
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

Hello Alexander,

On 10/5/20 10:34 PM, Alexander Dahl wrote:
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

Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

But got two questions below:

> ---
> 
> Notes:
>     v6 -> v7:
>       * split up patch (one per sub arch)
>       * added actual warnings to commit message
> 
>  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 5700e6b700d3..25d548cb975b 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -36,34 +36,34 @@
>  		stdout-path = &uart4;
>  	};
>  
> -	led-act {
> +	led-controller-1 {
>  		compatible = "gpio-leds";
>  
> -		led-green {
> +		led-1 {
>  			label = "mc1:green:act";
>  			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  	};
>  
> -	led-rgb {
> +	led-controller-2 {

Is a single RGB LED really a controller?

>  		compatible = "pwm-leds";
>  
> -		led-red {
> +		led-2 {

Shouldn't this have been led-1 as well or is the numbering "global" ?

>  			label = "mc1:red:rgb";
>  			pwms = <&leds_pwm 1 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-green {
> +		led-3 {
>  			label = "mc1:green:rgb";
>  			pwms = <&leds_pwm 2 1000000 0>;
>  			max-brightness = <255>;
>  			active-low;
>  		};
>  
> -		led-blue {
> +		led-4 {
>  			label = "mc1:blue:rgb";
>  			pwms = <&leds_pwm 3 1000000 0>;
>  			max-brightness = <255>;
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
