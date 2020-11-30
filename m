Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B81FA2C8FD2
	for <lists+linux-mips@lfdr.de>; Mon, 30 Nov 2020 22:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387645AbgK3VQy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Nov 2020 16:16:54 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:48092 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgK3VQx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Nov 2020 16:16:53 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9E5652001F;
        Mon, 30 Nov 2020 22:16:01 +0100 (CET)
Date:   Mon, 30 Nov 2020 22:16:00 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        linux@armlinux.org.uk, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        tony@atomide.com, mripard@kernel.org, wens@csie.org,
        jernej.skrabec@siol.net, thierry.reding@gmail.com,
        jonathanh@nvidia.com, catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, lee.jones@linaro.org, emil.l.velikov@gmail.com,
        daniel.thompson@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/5] drop unused BACKLIGHT_GENERIC option
Message-ID: <20201130211600.GA1779005@ravnborg.org>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130191133.GA1565464@ravnborg.org>
 <20201130202501.GA32878@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130202501.GA32878@kozik-lap>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=Yxuugev4iBag0mAJ72kA:9 a=CjuIK1q_8ugA:10
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Krzysztof,
On Mon, Nov 30, 2020 at 10:25:01PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Nov 30, 2020 at 08:11:33PM +0100, Sam Ravnborg wrote:
> > On Mon, Nov 30, 2020 at 03:21:32PM +0000, Andrey Zhizhikin wrote:
> > > Since the removal of generic_bl driver from the source tree in commit
> > > 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> > > unused") BACKLIGHT_GENERIC config option became obsolete as well and
> > > therefore subject to clean-up from all configuration files.
> > > 
> > > This series introduces patches to address this removal, separated by
> > > architectures in the kernel tree.
> > > 
> > > Andrey Zhizhikin (5):
> > >   ARM: configs: drop unused BACKLIGHT_GENERIC option
> > >   arm64: defconfig: drop unused BACKLIGHT_GENERIC option
> > >   MIPS: configs: drop unused BACKLIGHT_GENERIC option
> > >   parisc: configs: drop unused BACKLIGHT_GENERIC option
> > >   powerpc/configs: drop unused BACKLIGHT_GENERIC option
> > 
> > For defconfigs I expect arch maintainers to do a make xxxdefconfig / make
> > savedefconfig / cp defconfig ... run now and then - this will remove
> > all such symbols.
> 
> savedefconfig can be tricky because of risk of loosing options:
> 1. it will remove options which became the default or became selected,
> 2. later when the default is changed or selecting option is removed, the
>    first option from #1 will not be brought back.
> 
> This was already for example with DEBUG_FS and the conclusion that time
> was - do not run savedefconfig automatically.
> 
> Therefore if some symbol(s) can be safely removed, patch is welcomed.

Thanks for letting me know, I have missed that discussion and
was obviously not aware.
I already acked'ed the patches and hope the soc people will pick them
up.

	Sam
