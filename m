Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CE42AD63D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 13:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgKJMbB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 07:31:01 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37083 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgKJMbB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 07:31:01 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 95A4560005;
        Tue, 10 Nov 2020 12:30:57 +0000 (UTC)
Date:   Tue, 10 Nov 2020 13:30:57 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen.Hegelund@microchip.com
Subject: Re: [PATCH v2 4/9] MIPS: mscc: Fix configuration name for ocelot
 legacy boards
Message-ID: <20201110123057.GG1769536@piout.net>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
 <20201110114508.1197652-5-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110114508.1197652-5-gregory.clement@bootlin.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/11/2020 12:45:03+0100, Gregory CLEMENT wrote:
> Ocelots is supported by the generic MIPS build so make it clears that
> LEGACY_BOARD_OCELOT is only needed for legacy boards which didn't have
> bootloader supporting device tree.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/mips/generic/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
> index 45431b88dded..eb2a3fa9fcd7 100644
> --- a/arch/mips/generic/Kconfig
> +++ b/arch/mips/generic/Kconfig
> @@ -31,7 +31,7 @@ comment "MSCC Ocelot doesn't work with SEAD3 enabled"
>  	depends on LEGACY_BOARD_SEAD3
>  
>  config LEGACY_BOARD_OCELOT
> -	bool "Support MSCC Ocelot boards"
> +	bool "Legacy support for Ocelot based boards"
>  	depends on LEGACY_BOARD_SEAD3=n
>  	select LEGACY_BOARDS
>  	select SOC_VCOREIII
> -- 
> 2.28.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
