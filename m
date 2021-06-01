Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC1C3972F0
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 14:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbhFAMEf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 08:04:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233779AbhFAMEd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 08:04:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37F9660200;
        Tue,  1 Jun 2021 12:02:48 +0000 (UTC)
Subject: Re: [PATCH 0/7] clk: clean up legacy clock interfaces
To:     Arnd Bergmann <arnd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
References: <20210531184749.2475868-1-arnd@kernel.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <cb71ceb3-02a2-ee26-fc9b-e7ebe826efb4@linux-m68k.org>
Date:   Tue, 1 Jun 2021 22:02:46 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531184749.2475868-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Arnd,

On 1/6/21 4:47 am, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent discussion about legacy clk interface users revealed
> that there are only two platforms remaining that provide their own
> clk_get()/clk_put() implementations, MIPS ar7 and and m68k coldfire.
> 
> I managed to rework both of these to just use the normal clkdev code,
> and fold CONFIG_CLKDEV_LOOKUP into CONFIG_HAVE_CLK as it is now shared
> among all users.
> 
> As I noticed that the ar7 clock implementation and the ralink version
> are rather trivial, I ended up converting those to use the common-clk
> interfaces as well, though this is unrelated to the other changes.
> 
>       Arnd
> 
> Link: https://lore.kernel.org/lkml/CAK8P3a2XsrfUJQQAfnGknh8HiA-D9L_wmEoAgXU89KqagE31NQ@mail.gmail.com/
> 
> Arnd Bergmann (7):
>    mips: ar7: convert to clkdev_lookup
>    mips: ar7: convert to CONFIG_COMMON_CLK
>    mips: ralink: convert to CONFIG_COMMON_CLK
>    m68k: coldfire: use clkdev_lookup on most coldfire
>    m68k: coldfire: remove private clk_get/clk_put
>    clkdev: remove CONFIG_CLKDEV_LOOKUP
>    clkdev: remove unused clkdev_alloc() interfaces
> 
>   arch/arm/Kconfig                     |   2 -
>   arch/m68k/coldfire/clk.c             |  21 -----
>   arch/m68k/coldfire/m5206.c           |  25 +++---
>   arch/m68k/coldfire/m520x.c           |  51 +++++------
>   arch/m68k/coldfire/m523x.c           |  42 ++++-----
>   arch/m68k/coldfire/m5249.c           |  33 +++----
>   arch/m68k/coldfire/m525x.c           |  33 +++----
>   arch/m68k/coldfire/m5272.c           |  35 +++-----
>   arch/m68k/coldfire/m527x.c           |  46 ++++------
>   arch/m68k/coldfire/m528x.c           |  42 ++++-----
>   arch/m68k/coldfire/m5307.c           |  27 +++---
>   arch/m68k/coldfire/m53xx.c           |  80 ++++++++---------
>   arch/m68k/coldfire/m5407.c           |  25 +++---
>   arch/m68k/coldfire/m5441x.c          | 126 +++++++++++++--------------
>   arch/m68k/coldfire/m54xx.c           |  33 +++----
>   arch/m68k/include/asm/mcfclk.h       |   5 --
>   arch/mips/Kconfig                    |   6 +-
>   arch/mips/ar7/clock.c                | 113 ++++++------------------
>   arch/mips/include/asm/mach-ar7/ar7.h |   4 -
>   arch/mips/pic32/Kconfig              |   1 -
>   arch/mips/ralink/Kconfig             |   5 --
>   arch/mips/ralink/clk.c               |  64 +-------------
>   arch/sh/Kconfig                      |   1 -
>   drivers/clk/Kconfig                  |   6 +-
>   drivers/clk/Makefile                 |   3 +-
>   drivers/clk/clkdev.c                 |  28 ------
>   drivers/clocksource/Kconfig          |   6 +-
>   drivers/mmc/host/Kconfig             |   4 +-
>   drivers/staging/board/Kconfig        |   2 +-
>   include/linux/clkdev.h               |   5 --
>   sound/soc/dwc/Kconfig                |   2 +-
>   sound/soc/rockchip/Kconfig           |  14 +--
>   32 files changed, 320 insertions(+), 570 deletions(-)

Looks really good, thanks for doing this.

I have test compiled and run some of the ColdFire targets with these changes.
Everything checked out good. So for the m68k/Coldfire parts (with the one
munged writew() change fixed):

Acked-by: Greg Ungerer <gerg@linux-m68k.org>
Tested-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg

