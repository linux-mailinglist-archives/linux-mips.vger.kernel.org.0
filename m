Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2C02D306F
	for <lists+linux-mips@lfdr.de>; Tue,  8 Dec 2020 18:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730398AbgLHRBV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Dec 2020 12:01:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:57395 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729679AbgLHRBV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Dec 2020 12:01:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kmgLm-0006Gx-00; Tue, 08 Dec 2020 18:00:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 909BFC0331; Tue,  8 Dec 2020 18:00:21 +0100 (CET)
Date:   Tue, 8 Dec 2020 18:00:21 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, krzk@kernel.org, mripard@kernel.org,
        benh@kernel.crashing.org, emil.l.velikov@gmail.com,
        alexandre.belloni@bootlin.com, mpe@ellerman.id.au,
        linux-parisc@vger.kernel.org, paulus@samba.org,
        nicolas.ferre@microchip.com, tony@atomide.com, sam@ravnborg.org,
        linux@armlinux.org.uk, ludovic.desroches@microchip.com,
        soc@kernel.org, James.Bottomley@HansenPartnership.com,
        will@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        daniel.thompson@linaro.org, jernej.skrabec@siol.net,
        linux-arm-kernel@lists.infradead.org, deller@gmx.de,
        catalin.marinas@arm.com, wens@csie.org, linux-mips@vger.kernel.org,
        lee.jones@linaro.org,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201208170021.GA6168@alpha.franken.de>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
 <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 08, 2020 at 05:34:46PM +0100, Arnd Bergmann wrote:
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

this one is already in mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
