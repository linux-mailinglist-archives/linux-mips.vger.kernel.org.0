Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9535E3EA687
	for <lists+linux-mips@lfdr.de>; Thu, 12 Aug 2021 16:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234110AbhHLO0O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Aug 2021 10:26:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:57499 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233282AbhHLO0O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Aug 2021 10:26:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mEBeQ-0002iE-00; Thu, 12 Aug 2021 16:25:42 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DCCD2C07DD; Thu, 12 Aug 2021 16:09:34 +0200 (CEST)
Date:   Thu, 12 Aug 2021 16:09:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/9] MIPS: Migrate pistachio to generic kernel
Message-ID: <20210812140934.GA9924@alpha.franken.de>
References: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723022543.4095-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 23, 2021 at 10:25:34AM +0800, Jiaxun Yang wrote:
> I'm lucky enough to get a Creator CI40 board from dusts.
> This patchset move it to gerneic kernel to reduce maintenance burden.
> It have been tested with SD Card boot.
> 
> --
> v2: Minor fixes
> v3: Typo fixes and 0day testbot warning fix (Thanks to Sergei!)
> v4: 01.org warning fix
> 
> Jiaxun Yang (9):
>   MIPS: generic: Allow generating FIT image for Marduk board
>   MIPS: DTS: Pistachio add missing cpc and cdmm
>   clk: pistachio: Make it selectable for generic MIPS kernel
>   clocksource/drivers/pistachio: Make it selectable for MIPS
>   phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
>   pinctrl: pistachio: Make it as an option
>   MIPS: config: generic: Add config for Marduk board
>   MIPS: Retire MACH_PISTACHIO
>   MIPS: Make a alias for pistachio_defconfig
> 
>  arch/mips/Kbuild.platforms                    |   1 -
>  arch/mips/Kconfig                             |  30 --
>  arch/mips/Makefile                            |   3 +
>  arch/mips/boot/dts/Makefile                   |   2 +-
>  arch/mips/boot/dts/img/Makefile               |   3 +-
>  arch/mips/boot/dts/img/pistachio.dtsi         |  10 +
>  arch/mips/configs/generic/board-marduk.config |  53 +++
>  arch/mips/configs/pistachio_defconfig         | 316 ------------------
>  arch/mips/generic/Kconfig                     |   6 +
>  arch/mips/generic/Platform                    |   1 +
>  arch/mips/generic/board-marduk.its.S          |  22 ++
>  arch/mips/pistachio/Kconfig                   |  14 -
>  arch/mips/pistachio/Makefile                  |   2 -
>  arch/mips/pistachio/Platform                  |   6 -
>  arch/mips/pistachio/init.c                    | 125 -------
>  arch/mips/pistachio/irq.c                     |  24 --
>  arch/mips/pistachio/time.c                    |  55 ---
>  drivers/clk/Kconfig                           |   1 +
>  drivers/clk/Makefile                          |   2 +-
>  drivers/clk/pistachio/Kconfig                 |   8 +
>  drivers/clocksource/Kconfig                   |   3 +-
>  drivers/phy/Kconfig                           |   2 +-
>  drivers/pinctrl/Kconfig                       |   5 +-
>  23 files changed, 114 insertions(+), 580 deletions(-)
>  create mode 100644 arch/mips/configs/generic/board-marduk.config
>  delete mode 100644 arch/mips/configs/pistachio_defconfig
>  create mode 100644 arch/mips/generic/board-marduk.its.S
>  delete mode 100644 arch/mips/pistachio/Kconfig
>  delete mode 100644 arch/mips/pistachio/Makefile
>  delete mode 100644 arch/mips/pistachio/Platform
>  delete mode 100644 arch/mips/pistachio/init.c
>  delete mode 100644 arch/mips/pistachio/irq.c
>  delete mode 100644 arch/mips/pistachio/time.c
>  create mode 100644 drivers/clk/pistachio/Kconfig

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
