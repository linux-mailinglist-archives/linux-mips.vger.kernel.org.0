Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB011D14C5
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 15:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgEMN1D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 09:27:03 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:52071 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgEMN1D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 09:27:03 -0400
X-Originating-IP: 90.65.91.255
Received: from localhost (lfbn-lyo-1-1912-bdcst.w90-65.abo.wanadoo.fr [90.65.91.255])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C7572240003;
        Wed, 13 May 2020 13:27:00 +0000 (UTC)
Date:   Wed, 13 May 2020 15:27:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: dts: mscc: Updated changed name for miim pinctrl
 function
Message-ID: <20200513132700.GI34497@piout.net>
References: <20200513132347.24975-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513132347.24975-1-lars.povlsen@microchip.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/05/2020 15:23:47+0200, Lars Povlsen wrote:
> This is an add-on patch to the main SoC Sparx5 series
> (Message-ID: <20200513125532.24585-1-lars.povlsen@microchip.com>).
> 
> This changes the miim pinctrl function name from "miim1" to "miim" due
> to refactoring in the driver, obsoleting the instance number.
> 
> The change in the driver was to better fit new platforms, as the
> instance number is redundant information. Specifically, support for
> the Microchip Sparx5 SoC is being submitted, where this change became
> necessary.
> 
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
> index 797d336db54d3..f94e8a02ed06b 100644
> --- a/arch/mips/boot/dts/mscc/ocelot.dtsi
> +++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
> @@ -214,7 +214,7 @@ uart2_pins: uart2-pins {
> 
>  			miim1: miim1 {
>  				pins = "GPIO_14", "GPIO_15";
> -				function = "miim1";
> +				function = "miim";
>  			};
> 
>  		};
> --
> 2.26.2

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
