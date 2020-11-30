Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2693F2C8DBB
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 20:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgK3TMd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 14:12:33 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:39988 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgK3TMd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 14:12:33 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id D0E7B2001F;
        Mon, 30 Nov 2020 20:11:34 +0100 (CET)
Date:   Mon, 30 Nov 2020 20:11:33 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        tony@atomide.com, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, lee.jones@linaro.org, emil.l.velikov@gmail.com,
        daniel.thompson@linaro.org, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130191133.GA1565464@ravnborg.org>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=RN8nFXG3PNPgSL11oioA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> Since the removal of generic_bl driver from the source tree in commit
> 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") BACKLIGHT_GENERIC config option became obsolete as well and
> therefore subject to clean-up from all configuration files.
> 
> This series introduces patches to address this removal, separated by
> architectures in the kernel tree.
> 
> Andrey Zhizhikin (5):
>   ARM: configs: drop unused BACKLIGHT_GENERIC option
>   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
>   MIPS: configs: drop unused BACKLIGHT_GENERIC option
>   parisc: configs: drop unused BACKLIGHT_GENERIC option
>   powerpc/configs: drop unused BACKLIGHT_GENERIC option

For defconfigs I expect arch maintainers to do a make xxxdefconfig / make
savedefconfig / cp defconfig ... run now and then - this will remove
all such symbols.

If the patches goes in like they are submitted then:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
>  arch/arm/configs/at91_dt_defconfig          | 1 -
>  arch/arm/configs/cm_x300_defconfig          | 1 -
>  arch/arm/configs/colibri_pxa300_defconfig   | 1 -
>  arch/arm/configs/jornada720_defconfig       | 1 -
>  arch/arm/configs/magician_defconfig         | 1 -
>  arch/arm/configs/mini2440_defconfig         | 1 -
>  arch/arm/configs/omap2plus_defconfig        | 1 -
>  arch/arm/configs/pxa3xx_defconfig           | 1 -
>  arch/arm/configs/qcom_defconfig             | 1 -
>  arch/arm/configs/sama5_defconfig            | 1 -
>  arch/arm/configs/sunxi_defconfig            | 1 -
>  arch/arm/configs/tegra_defconfig            | 1 -
>  arch/arm/configs/u8500_defconfig            | 1 -
>  arch/arm64/configs/defconfig                | 1 -
>  arch/mips/configs/gcw0_defconfig            | 1 -
>  arch/mips/configs/gpr_defconfig             | 1 -
>  arch/mips/configs/lemote2f_defconfig        | 1 -
>  arch/mips/configs/loongson3_defconfig       | 1 -
>  arch/mips/configs/mtx1_defconfig            | 1 -
>  arch/mips/configs/rs90_defconfig            | 1 -
>  arch/parisc/configs/generic-64bit_defconfig | 1 -
>  arch/powerpc/configs/powernv_defconfig      | 1 -
>  22 files changed, 22 deletions(-)
> 
> 
> base-commit: b65054597872ce3aefbc6a666385eabdf9e288da
> prerequisite-patch-id: bfd382cf1dc021d20204f10ea9403319c1c32b12
> prerequisite-patch-id: 5397c0c8648bb3e0b830207ea867138c11c6e644
> prerequisite-patch-id: a3c284dff5fe6d02828918a886db6a8ed3197e20
> -- 
> 2.17.1
