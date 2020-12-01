Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 965792CA751
	for <lists+linux-mips@lfdr.de>; Tue,  1 Dec 2020 16:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388270AbgLAPma (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Dec 2020 10:42:30 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41637 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390017AbgLAPma (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Dec 2020 10:42:30 -0500
X-Greylist: delayed 86638 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Dec 2020 10:42:28 EST
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 533AA240006;
        Tue,  1 Dec 2020 15:41:39 +0000 (UTC)
Date:   Tue, 1 Dec 2020 16:41:39 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "tony@atomide.com" <tony@atomide.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "will@kernel.org" <will@kernel.org>,
        "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "James.Bottomley@HansenPartnership.com" 
        <James.Bottomley@hansenpartnership.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        "paulus@samba.org" <paulus@samba.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "sam@ravnborg.org" <sam@ravnborg.org>,
        "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201201154139.GF2401593@piout.net>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
 <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201144052.GE31404@gaia>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 01/12/2020 14:40:53+0000, Catalin Marinas wrote:
> On Mon, Nov 30, 2020 at 07:50:25PM +0000, ZHIZHIKIN Andrey wrote:
> > From Krzysztof Kozlowski <krzk@kernel.org>:
> > > On Mon, Nov 30, 2020 at 03:21:33PM +0000, Andrey Zhizhikin wrote:
> > > > Commit 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > > > unused") removed geenric_bl driver from the tree, together with
> > > > corresponding config option.
> > > >
> > > > Remove BACKLIGHT_GENERIC config item from all ARM configurations.
> > > >
> > > > Fixes: 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it
> > > > is unused")
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Signed-off-by: Andrey Zhizhikin
> > > > <andrey.zhizhikin@leica-geosystems.com>
> > > > ---
> > > >  arch/arm/configs/at91_dt_defconfig        | 1 -
> > > >  arch/arm/configs/cm_x300_defconfig        | 1 -
> > > >  arch/arm/configs/colibri_pxa300_defconfig | 1 -
> > > >  arch/arm/configs/jornada720_defconfig     | 1 -
> > > >  arch/arm/configs/magician_defconfig       | 1 -
> > > >  arch/arm/configs/mini2440_defconfig       | 1 -
> > > >  arch/arm/configs/omap2plus_defconfig      | 1 -
> > > >  arch/arm/configs/pxa3xx_defconfig         | 1 -
> > > >  arch/arm/configs/qcom_defconfig           | 1 -
> > > >  arch/arm/configs/sama5_defconfig          | 1 -
> > > >  arch/arm/configs/sunxi_defconfig          | 1 -
> > > >  arch/arm/configs/tegra_defconfig          | 1 -
> > > >  arch/arm/configs/u8500_defconfig          | 1 -
> > > >  13 files changed, 13 deletions(-)
> > > 
> > > You need to send it to arm-soc maintainers, otherwise no one might feel
> > > responsible enough to pick it up.
> > 
> > Good point, thanks a lot!
> > 
> > I was not aware of the fact that there is a separate ML that should
> > receive patches targeted ARM SOCs. Can you (or anyone else) please
> > share it, so I can re-send it there as well?
> 
> It's not a mailing list as such (with archives etc.), just an alias to
> the arm-soc maintainers: arm@kernel.org.
> 
> > > Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > 
> > > +CC Arnd and Olof,
> > > 
> > > Dear Arnd and Olof,
> > > 
> > > Maybe it is worth to add arm-soc entry to the MAINTAINERS file?
> > > Otherwise how one could get your email address? Not mentioning the
> > > secret-soc address. :)
> 
> I tried to convince them before, it didn't work. I guess they don't like
> to be spammed ;).

The first rule of arm-soc is: you do not talk about arm@ and soc@

> Or rather, SoC-specific patches, even to defconfig,
> should go through the specific SoC maintainers. However, there are
> occasional defconfig patches which are more generic or affecting
> multiple SoCs. I just ignore them as the arm64 defconfig is usually
> handled by the arm-soc folk (when I need a defconfig change, I go for
> arch/arm64/Kconfig directly ;)).
> 

IIRC, the plan was indeed to get defconfig changes through the platform
sub-trees. It is also supposed to be how multi_v5 and multi_v7 are
handled and they will take care of the merge.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
