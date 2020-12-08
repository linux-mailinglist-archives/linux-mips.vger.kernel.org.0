Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD562D3047
	for <lists+linux-mips@lfdr.de>; Tue,  8 Dec 2020 17:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbgLHQzk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Dec 2020 11:55:40 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44221 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729374AbgLHQzk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Dec 2020 11:55:40 -0500
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D70561BF20A;
        Tue,  8 Dec 2020 16:54:48 +0000 (UTC)
Date:   Tue, 8 Dec 2020 17:54:48 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, krzk@kernel.org, mripard@kernel.org,
        benh@kernel.crashing.org, emil.l.velikov@gmail.com,
        mpe@ellerman.id.au, linux-parisc@vger.kernel.org, paulus@samba.org,
        nicolas.ferre@microchip.com, tony@atomide.com, sam@ravnborg.org,
        linux@armlinux.org.uk, ludovic.desroches@microchip.com,
        soc@kernel.org, James.Bottomley@hansenpartnership.com,
        will@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        daniel.thompson@linaro.org, jernej.skrabec@siol.net,
        linux-arm-kernel@lists.infradead.org, deller@gmx.de,
        tsbogend@alpha.franken.de, catalin.marinas@arm.com, wens@csie.org,
        linux-mips@vger.kernel.org, lee.jones@linaro.org,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201208165448.GN431442@piout.net>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 08/12/2020 17:34:46+0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Tue, 1 Dec 2020 22:29:17 +0000, Andrey Zhizhikin wrote:
> > Since the removal of generic_bl driver from the source tree in commit
> > 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > unused") BACKLIGHT_GENERIC config option became obsolete as well and
> > therefore subject to clean-up from all configuration files.
> > 
> > This series introduces patches to address this removal, separated by
> > architectures in the kernel tree.
> > 
> > [...]
> 
> While my plan was to only take the arm specific patches, it seems
> nobody else has applied the other architecture specific ones,
> but there have been a lot of Acks. Also, b4 makes it easy to
> merge the entire branch, so I'll just take all of these.
> 
> Applied to arm/defconfig, thanks!
> 
> [1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
>       commit: 0437141b4e2233ae0109a9584e7a003cd05b0a20
> [2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
>       commit: 717c4c8336486781630893508b3347ae18953fae
> [3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
>       commit: 2257682282531de45929c6006152f6e2ee881b42

Thomas did applied this one:
https://lore.kernel.org/linux-arm-kernel/20201204120632.GA10011@alpha.franken.de/

> [4/5] parisc: configs: drop unused BACKLIGHT_GENERIC option
>       commit: 4e9c44b128d3eb5da129e53c7312240f838c2dbf
> [5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
>       commit: 4985c506303fb6a41a885d503a6e1f3d3126431d
> 
>        Arnd

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
