Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3882070C01
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbfGVVu4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:50:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727243AbfGVVu4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:50:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B35FA21951;
        Mon, 22 Jul 2019 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563832254;
        bh=SLa3607t61ofYoKGilKahes40T5ZTD5NhrB1m8QE//8=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=oDeRKWVjoAJxHmyHIpND24rqgVpc4cArfVC2jYqkn8TGSJGfRpaGff9A72U+Zcyhm
         vesOX66cWisLki+xqwp+6nah0fsNx24EjWOFpZxZ95aLXGsFGuRtdfWU4MotnEMx0i
         8DgQF71Cs00RndZ8+ENjpMjA7BDDy0Jt/fQM51n4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190709182018.23193-3-gch981213@gmail.com>
References: <20190709182018.23193-1-gch981213@gmail.com> <20190709182018.23193-3-gch981213@gmail.com>
Subject: Re: [PATCH 2/5] MIPS: ralink: fix cpu clock of mt7621 and add dt clk devices
To:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>,
        Chuanhong Guo <gch981213@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 22 Jul 2019 14:50:53 -0700
Message-Id: <20190722215054.B35FA21951@mail.kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Chuanhong Guo (2019-07-09 11:20:15)
> For a long time the mt7621 uses a fixed cpu clock which causes a problem
> if the cpu frequency is not 880MHz.
>=20
> This patch fixes the cpu clock calculation and adds the cpu/bus clkdev
> which will be used in dts.
>=20
> Ported from OpenWrt:
> c7ca224299 ramips: fix cpu clock of mt7621 and add dt clk devices
>=20
> Signed-off-by: Weijie Gao <hackpascal@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
[...]
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index 9415be0d57b8..31158b88bcb6 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -7,22 +7,22 @@
> =20
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <dt-bindings/clock/mt7621-clk.h>
> =20
>  #include <asm/mipsregs.h>
>  #include <asm/smp-ops.h>
>  #include <asm/mips-cps.h>
>  #include <asm/mach-ralink/ralink_regs.h>
>  #include <asm/mach-ralink/mt7621.h>
> +#include <asm/time.h>
> =20
>  #include <pinmux.h>
> =20
>  #include "common.h"
> =20
> -#define SYSC_REG_SYSCFG                0x10
> -#define SYSC_REG_CPLL_CLKCFG0  0x2c
> -#define SYSC_REG_CUR_CLK_STS   0x44
> -#define CPU_CLK_SEL            (BIT(30) | BIT(31))
> -
>  #define MT7621_GPIO_MODE_UART1         1
>  #define MT7621_GPIO_MODE_I2C           2
>  #define MT7621_GPIO_MODE_UART3_MASK    0x3
> @@ -108,49 +108,89 @@ static struct rt2880_pmx_group mt7621_pinmux_data[]=
 =3D {
>         { 0 }
>  };
> =20
> +static struct clk *clks[MT7621_CLK_MAX];
> +static struct clk_onecell_data clk_data =3D {
> +       .clks =3D clks,
> +       .clk_num =3D ARRAY_SIZE(clks),
> +};
> +
>  phys_addr_t mips_cpc_default_phys_base(void)
>  {
>         panic("Cannot detect cpc address");
>  }
> =20
> +static struct clk *__init mt7621_add_sys_clkdev(
> +       const char *id, unsigned long rate)
> +{
> +       struct clk *clk;
> +       int err;
> +
> +       clk =3D clk_register_fixed_rate(NULL, id, NULL, 0, rate);
> +       if (IS_ERR(clk))
> +               panic("failed to allocate %s clock structure", id);
> +
> +       err =3D clk_register_clkdev(clk, id, NULL);

What's the need to use clkdev? i.e. why can't we just use clk_get() with
proper DT definitions and by passing in the right device pointer?

> +       if (err)
> +               panic("unable to register %s clock device", id);
> +
> +       return clk;
> +}
> +
>  void __init ralink_clk_init(void)
>  {
> -       int cpu_fdiv =3D 0;
> -       int cpu_ffrac =3D 0;
> -       int fbdiv =3D 0;
> -       u32 clk_sts, syscfg;
> -       u8 clk_sel =3D 0, xtal_mode;
> -       u32 cpu_clk;
> +       const static u32 prediv_tbl[] =3D {0, 1, 2, 2};
> +       u32 syscfg, xtal_sel, clkcfg, clk_sel, curclk, ffiv, ffrac;
> +       u32 pll, prediv, fbdiv;
> +       u32 xtal_clk, cpu_clk, bus_clk;
> +
> +       syscfg =3D rt_sysc_r32(SYSC_REG_SYSTEM_CONFIG0);
> +       xtal_sel =3D (syscfg >> XTAL_MODE_SEL_SHIFT) & XTAL_MODE_SEL_MASK;
> =20
> -       if ((rt_sysc_r32(SYSC_REG_CPLL_CLKCFG0) & CPU_CLK_SEL) !=3D 0)
> -               clk_sel =3D 1;
> +       clkcfg =3D rt_sysc_r32(SYSC_REG_CLKCFG0);
> +       clk_sel =3D (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
> +
> +       curclk =3D rt_sysc_r32(SYSC_REG_CUR_CLK_STS);
> +       ffiv =3D (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
> +       ffrac =3D (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
> +
> +       if (xtal_sel <=3D 2)
> +               xtal_clk =3D 20 * 1000 * 1000;
> +       else if (xtal_sel <=3D 5)
> +               xtal_clk =3D 40 * 1000 * 1000;
> +       else
> +               xtal_clk =3D 25 * 1000 * 1000;
> =20
>         switch (clk_sel) {
>         case 0:
> -               clk_sts =3D rt_sysc_r32(SYSC_REG_CUR_CLK_STS);
> -               cpu_fdiv =3D ((clk_sts >> 8) & 0x1F);
> -               cpu_ffrac =3D (clk_sts & 0x1F);
> -               cpu_clk =3D (500 * cpu_ffrac / cpu_fdiv) * 1000 * 1000;
> +               cpu_clk =3D 500 * 1000 * 1000;
>                 break;
> -
>         case 1:
> -               fbdiv =3D ((rt_sysc_r32(0x648) >> 4) & 0x7F) + 1;
> -               syscfg =3D rt_sysc_r32(SYSC_REG_SYSCFG);
> -               xtal_mode =3D (syscfg >> 6) & 0x7;
> -               if (xtal_mode >=3D 6) {
> -                       /* 25Mhz Xtal */
> -                       cpu_clk =3D 25 * fbdiv * 1000 * 1000;
> -               } else if (xtal_mode >=3D 3) {
> -                       /* 40Mhz Xtal */
> -                       cpu_clk =3D 40 * fbdiv * 1000 * 1000;
> -               } else {
> -                       /* 20Mhz Xtal */
> -                       cpu_clk =3D 20 * fbdiv * 1000 * 1000;
> -               }
> +               pll =3D rt_memc_r32(MEMC_REG_CPU_PLL);
> +               fbdiv =3D (pll >> CPU_PLL_FBDIV_SHIFT) & CPU_PLL_FBDIV_MA=
SK;
> +               prediv =3D (pll >> CPU_PLL_PREDIV_SHIFT) & CPU_PLL_PREDIV=
_MASK;
> +               cpu_clk =3D ((fbdiv + 1) * xtal_clk) >> prediv_tbl[prediv=
];
>                 break;
> +       default:
> +               cpu_clk =3D xtal_clk;
>         }
> +
> +       cpu_clk =3D cpu_clk / ffiv * ffrac;
> +       bus_clk =3D cpu_clk / 4;
> +
> +       clks[MT7621_CLK_CPU] =3D mt7621_add_sys_clkdev("cpu", cpu_clk);
> +       clks[MT7621_CLK_BUS] =3D mt7621_add_sys_clkdev("bus", bus_clk);
> +
> +       pr_info("CPU Clock: %dMHz\n", cpu_clk / 1000000);
> +       mips_hpt_frequency =3D cpu_clk / 2;

There are a few changes here. Probably the patch should be split up a
bit more to only do one thing at a time, instead of assign
mips_hpt_frequency, change the calculation code, and change the way clks
are provided on this platform.

>  }
> =20
> +static void __init mt7621_clocks_init_dt(struct device_node *np)
> +{
> +       of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +}
> +
> +CLK_OF_DECLARE(mt7621_clk, "mediatek,mt7621-pll", mt7621_clocks_init_dt);
> +
>  void __init ralink_of_remap(void)
>  {
>         rt_sysc_membase =3D plat_of_remap_node("mtk,mt7621-sysc");
> diff --git a/arch/mips/ralink/timer-gic.c b/arch/mips/ralink/timer-gic.c
> index 944fbe0fc741..9bbaa37a0da1 100644
> --- a/arch/mips/ralink/timer-gic.c
> +++ b/arch/mips/ralink/timer-gic.c
> @@ -9,14 +9,14 @@
> =20
>  #include <linux/of.h>
>  #include <linux/clk-provider.h>
> -#include <linux/clocksource.h>
> +#include <asm/time.h>
> =20
>  #include "common.h"
> =20
>  void __init plat_time_init(void)
>  {
>         ralink_of_remap();
> -
> +       ralink_clk_init();

Why can't everything flow from CLK_OF_DECLARE() for a particular node?
Even better would be to make a device driver instead of using
CLK_OF_DECLARE(), but either way this doesn't look necessary to make a
direct function call here.

>         of_clk_init(NULL);
>         timer_probe();
>  }
