Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F41B2C9439
	for <lists+linux-mips@lfdr.de>; Tue,  1 Dec 2020 01:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388307AbgLAArx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 19:47:53 -0500
Received: from ozlabs.org ([203.11.71.1]:38913 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389163AbgLAArx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Nov 2020 19:47:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ClNj03z8kz9sT6;
        Tue,  1 Dec 2020 11:47:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1606783630;
        bh=e10QAc16NaqVN44J1Hr1vgfh7E2SKLFwF1tipzVH8TM=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=B7L/JpGsTjzwc1HcKznrIXmRcrxBRIrym7aN8qydKWJFeslXKQQ3S+88dDsBJ3atA
         ICgQ4xVzl8mS04fa+JitQnIARV+Ch/K5dsJLTcG7CVgL3Fkr+k207+1HkMCbQhJINU
         VBD4lUo+c3jz+s1yTU151EDkTrnyvsE1RFNs0t5ZmMG99AaYXTeI5CICrmcZ2H6dUl
         Vvg1ej1Q60nEv0wb6xXsNKSIOd5YbXq/ODo1l/1d14DNsnPPuO2V7pIAsWo4KrPhf6
         BFI8ddBD7AtJX9OL7JU1IR3erwJiDVWixj6BQJu5e1Q6dF+8vTlAYnp92VgcVQd9LV
         hM8pxbdtxcAfw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        tony@atomide.com, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org,
        lee.jones@linaro.org, sam@ravnborg.org, emil.l.velikov@gmail.com,
        daniel.thompson@linaro.org, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
In-Reply-To: <20201130152137.24909-6-andrey.zhizhikin@leica-geosystems.com>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com> <20201130152137.24909-6-andrey.zhizhikin@leica-geosystems.com>
Date:   Tue, 01 Dec 2020 11:46:55 +1100
Message-ID: <87tut6wdxc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com> writes:
> Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") removed geenric_bl driver from the tree, together with
> corresponding config option.
>
> Remove BACKLIGHT_GENERIC config item from generic-64bit_defconfig.
                                            ^
                                            powernv_defconfig

> Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is unused")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
> ---
>  arch/powerpc/configs/powernv_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
> index cf30fc24413b..60a30fffeda0 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -208,7 +208,6 @@ CONFIG_FB_MATROX_G=y
>  CONFIG_FB_RADEON=m
>  CONFIG_FB_IBM_GXT4500=m
>  CONFIG_LCD_PLATFORM=m
> -CONFIG_BACKLIGHT_GENERIC=m
>  # CONFIG_VGA_CONSOLE is not set
>  CONFIG_LOGO=y
>  CONFIG_HID_A4TECH=m
> -- 
> 2.17.1
