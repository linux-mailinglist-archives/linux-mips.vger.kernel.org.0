Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C866B3972D9
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 13:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhFAL4G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 07:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233768AbhFAL4F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 07:56:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FDAF613C8;
        Tue,  1 Jun 2021 11:54:20 +0000 (UTC)
Subject: Re: [PATCH 4/7] m68k: coldfire: use clkdev_lookup on most coldfire
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
 <20210531184749.2475868-5-arnd@kernel.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <a4547445-7892-d84a-95bd-b43a82103a12@linux-m68k.org>
Date:   Tue, 1 Jun 2021 21:54:17 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531184749.2475868-5-arnd@kernel.org>
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
> Coldfire is now the only target that implements the clk_get()/clk_put()
> helpers itself rather than using the common implementation.
> 
> Most coldfire variants only have two distinct clocks and use the clk
> code purely for lookup. Change those over to use clkdev_lookup instead
> but leave the custom clk interface for those two clocks.
> 
> Also leave the four SoCs that have gated clocks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/m68k/Kconfig.cpu      |  4 ++++
>   arch/m68k/coldfire/clk.c   | 16 ++++++-------
>   arch/m68k/coldfire/m5206.c | 25 +++++++++------------
>   arch/m68k/coldfire/m523x.c | 42 ++++++++++++++--------------------
>   arch/m68k/coldfire/m5249.c | 33 ++++++++++++---------------
>   arch/m68k/coldfire/m525x.c | 33 ++++++++++++---------------
>   arch/m68k/coldfire/m5272.c | 35 ++++++++++++-----------------
>   arch/m68k/coldfire/m527x.c | 46 +++++++++++++++-----------------------
>   arch/m68k/coldfire/m528x.c | 42 ++++++++++++++--------------------
>   arch/m68k/coldfire/m5307.c | 27 ++++++++++------------
>   arch/m68k/coldfire/m5407.c | 25 +++++++++------------
>   arch/m68k/coldfire/m54xx.c | 33 ++++++++++++---------------
>   12 files changed, 154 insertions(+), 207 deletions(-)
> 

snip
   
> diff --git a/arch/m68k/coldfire/m527x.c b/arch/m68k/coldfire/m527x.c
> index cad462df6861..ff29c7a947e2 100644
> --- a/arch/m68k/coldfire/m527x.c
> +++ b/arch/m68k/coldfire/m527x.c
> @@ -13,6 +13,7 @@
>   
>   /***************************************************************************/
>   
> +#include <linux/clkdev.h>
>   #include <linux/kernel.h>
>   #include <linux/param.h>
>   #include <linux/init.h>
> @@ -27,33 +28,21 @@
>   
>   DEFINE_CLK(pll, "pll.0", MCF_CLK);
>   DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
> -DEFINE_CLK(mcfpit0, "mcfpit.0", MCF_CLK);
> -DEFINE_CLK(mcfpit1, "mcfpit.1", MCF_CLK);
> -DEFINE_CLK(mcfpit2, "mcfpit.2", MCF_CLK);
> -DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
> -DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
> -DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
> -DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
> -DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
> -DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
> -DEFINE_CLK(fec1, "fec.1", MCF_BUSCLK);
> -DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
> -
> -struct clk *mcf_clks[] = {
> -	&clk_pll,
> -	&clk_sys,
> -	&clk_mcfpit0,
> -	&clk_mcfpit1,
> -	&clk_mcfpit2,
> -	&clk_mcfpit3,
> -	&clk_mcfuart0,
> -	&clk_mcfuart1,
> -	&clk_mcfuart2,
> -	&clk_mcfqspi0,
> -	&clk_fec0,
> -	&clk_fec1,
> -	&clk_mcfi2c0,
> -	NULL
> +
> +static struct clk_lookup m527x_clk_lookup[] = {
> +	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
> +	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
> +	CLKDEV_INIT("mcfpit.0", NULL, &clk_pll),
> +	CLKDEV_INIT("mcfpit.1", NULL, &clk_pll),
> +	CLKDEV_INIT("mcfpit.2", NULL, &clk_pll),
> +	CLKDEV_INIT("mcfpit.3", NULL, &clk_pll),
> +	CLKDEV_INIT("mcfuart.0", NULL, &clk_sys),
> +	CLKDEV_INIT("mcfuart.1", NULL, &clk_sys),
> +	CLKDEV_INIT("mcfuart.2", NULL, &clk_sys),
> +	CLKDEV_INIT("mcfqspi.0", NULL, &clk_sys),
> +	CLKDEV_INIT("fec.0", NULL, &clk_sys),
> +	CLKDEV_INIT("fec.1", NULL, &clk_sys),
> +	CLKDEV_INIT("imx1-i2c.0", NULL, &clk_sys),
>   };
>   
>   /***************************************************************************/
> @@ -97,7 +86,7 @@ static void __init m527x_i2c_init(void)
>   	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
>   	par = readw(MCFGPIO_PAR_FECI2C);
>   	par |= 0x0f;
> -	writew(par, MCFGPIO_PAR_FECI2C);
> +	wm527x_clk_lookupritew(par, MCFGPIO_PAR_FECI2C);

Strange slip of the keyboard there.

Regards
Greg
