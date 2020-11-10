Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B112AD648
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 13:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729555AbgKJMdJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 07:33:09 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:33197 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgKJMdJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 07:33:09 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 01657240005;
        Tue, 10 Nov 2020 12:33:06 +0000 (UTC)
Date:   Tue, 10 Nov 2020 13:33:06 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH v2 6/9] MIPS: mscc: Add luton PC0B91 device tree
Message-ID: <20201110123306.GJ1769536@piout.net>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
 <20201110114508.1197652-7-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110114508.1197652-7-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2020 12:45:05+0100, Gregory CLEMENT wrote:
> Add a device tree for the Microsemi Luton PCB091 evaluation board.
> 
> It is based on the work of Lars Povlsen <lars.povlsen@microchip.com>.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/boot/dts/mscc/Makefile         |  5 +++-
>  arch/mips/boot/dts/mscc/luton_pcb091.dts | 30 ++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/mscc/luton_pcb091.dts
> 
> diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
> index 5015ccbbfb23..40699b44ed50 100644
> --- a/arch/mips/boot/dts/mscc/Makefile
> +++ b/arch/mips/boot/dts/mscc/Makefile
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -dtb-$(CONFIG_SOC_VCOREIII)	+= ocelot_pcb123.dtb ocelot_pcb120.dtb
> +dtb-$(CONFIG_SOC_VCOREIII)	+= \
> +	luton_pcb091.dtb \
> +	ocelot_pcb120.dtb \
> +	ocelot_pcb123.dtb
>  
>  obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
> diff --git a/arch/mips/boot/dts/mscc/luton_pcb091.dts b/arch/mips/boot/dts/mscc/luton_pcb091.dts
> new file mode 100644
> index 000000000000..26ef6285d71d
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/luton_pcb091.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 Microsemi Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include "luton.dtsi"
> +
> +/ {
> +	model = "Luton10 PCB091 Reference Board";
> +	compatible = "mscc,luton-pcb091", "mscc,luton";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +	i2c-sda-hold-time-ns = <300>;
> +};
> -- 
> 2.28.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
