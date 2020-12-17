Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F8C2DCE1B
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 10:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgLQJKk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 04:10:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:35618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgLQJKj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Dec 2020 04:10:39 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608196197;
        bh=04o6MC4zN3S+jcEYitTHbUSVn63jLEupGs6xAUSYMpc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PUBqR5xGHV4FxFbsvznFNKITqh0kEnzMjYopJRdOiqSZ85D4HHohOaCRBGggzS39d
         EwMnOXxLJzbn5eKmARXHGZsNn7FY/cCZotQNGPAutIUinSSRjknHTQxbvJnmJhCyPl
         z4XYMqxsijSZN8/3lkZ9e05LoQgDyCOktp2yMbKxjgYDFc3ZSnAM6oWqrtCK+1Arcr
         W/S6ZWQpIbl6LcXXpKShVsdwBf7XPMldusDkliBEf2uJ7SXpbfNS5zA4/Pj3wwiYB8
         46oKnmQyDgTAl8hxLuIiurO0hO7kFxDI/OkksrQ+ogFIQ00yGqeuBZS77CYHhTkpne
         KOB9+VRbRh6Rw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201122095556.21597-4-sergio.paracuellos@gmail.com>
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com> <20201122095556.21597-4-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v4 3/6] clk: ralink: add clock driver for mt7621 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, linux-clk@vger.kernel.org,
        evicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        neil@brown.name
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        mturquette@baylibre.com
Date:   Thu, 17 Dec 2020 01:09:55 -0800
Message-ID: <160819619591.1580929.9915856168932644762@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2020-11-22 01:55:53)
> The documentation for this SOC only talks about two
> registers regarding to the clocks:
> * SYSC_REG_CPLL_CLKCFG0 - provides some information about
> boostrapped refclock. PLL and dividers used for CPU and some
> sort of BUS.
> * SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable
> clocks for all or some ip cores.
>=20
> Looking into driver code, and some openWRT patched there are
> another frequences which are used in some drivers (uart, sd...).

s/frequences/frequencies/

> According to all of this information the clock plan for this
> SoC is set as follows:
> - Main top clock "xtal" from where all the rest of the world is
> derived.
> - CPU clock "cpu" derived from "xtal" frequencies and a bunch of
> register reads and predividers.
> - BUS clock "bus" derived from "cpu" and with (cpu / 4) MHz.
> - Fixed clocks from "xtal":
>     * "50m": 50 MHz.
>     * "125m": 125 MHz.
>     * "150m": 150 MHz.
>     * "250m": 250 MHz.
>     * "270m": 270 MHz.
>=20
> We also have a buch of gate clocks with their parents:
>   * "hsdma": "150m"
>   * "fe": "250m"
>   * "sp_divtx": "270m"
>   * "timer": "50m"
>   * "pcm": "270m"
>   * "pio": "50m"
>   * "gdma": "bus"
>   * "nand": "125m"
>   * "i2c": "50m"
>   * "i2s": "270m"
>   * "spi": "bus"
>   * "uart1": "50m"
>   * "uart2": "50m"
>   * "uart3": "50m"
>   * "eth": "50m"
>   * "pcie0": "125m"
>   * "pcie1": "125m"
>   * "pcie2": "125m"
>   * "crypto": "250m"
>   * "shxc": "50m"
>=20
> With this information the clk driver will provide clock and gates
> functionality from a a set of hardcoded clocks allowing to define
> a nice device tree without fixed clocks.
>=20
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  drivers/clk/Kconfig             |   1 +
>  drivers/clk/Makefile            |   1 +
>  drivers/clk/ralink/Kconfig      |  14 +
>  drivers/clk/ralink/Makefile     |   2 +
>  drivers/clk/ralink/clk-mt7621.c | 435 ++++++++++++++++++++++++++++++++
>  5 files changed, 453 insertions(+)
>  create mode 100644 drivers/clk/ralink/Kconfig
>  create mode 100644 drivers/clk/ralink/Makefile
>  create mode 100644 drivers/clk/ralink/clk-mt7621.c
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c715d4681a0b..5f94c4329033 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -372,6 +372,7 @@ source "drivers/clk/mediatek/Kconfig"
>  source "drivers/clk/meson/Kconfig"
>  source "drivers/clk/mvebu/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
> +source "drivers/clk/ralink/Kconfig"
>  source "drivers/clk/renesas/Kconfig"
>  source "drivers/clk/rockchip/Kconfig"
>  source "drivers/clk/samsung/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index da8fcf147eb1..6578e167b047 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -100,6 +100,7 @@ obj-$(CONFIG_COMMON_CLK_NXP)                +=3D nxp/
>  obj-$(CONFIG_MACH_PISTACHIO)           +=3D pistachio/
>  obj-$(CONFIG_COMMON_CLK_PXA)           +=3D pxa/
>  obj-$(CONFIG_COMMON_CLK_QCOM)          +=3D qcom/
> +obj-y                                  +=3D ralink/
>  obj-y                                  +=3D renesas/
>  obj-$(CONFIG_ARCH_ROCKCHIP)            +=3D rockchip/
>  obj-$(CONFIG_COMMON_CLK_SAMSUNG)       +=3D samsung/

Thanks for keeping it sorted!

> diff --git a/drivers/clk/ralink/Kconfig b/drivers/clk/ralink/Kconfig
> new file mode 100644
> index 000000000000..7e8697327e0c
> --- /dev/null
> +++ b/drivers/clk/ralink/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# MediaTek Mt7621 Clock Driver
> +#
> +menu "Clock driver for mediatek mt7621 SoC"

Capitalize MediaTek?

> +       depends on SOC_MT7621 || COMPILE_TEST
> +
> +config CLK_MT7621
> +       bool "Clock driver for MediaTek MT7621"

Like it is done here.

> +       depends on SOC_MT7621 || COMPILE_TEST
> +       default SOC_MT7621
> +       help
> +         This driver supports MediaTek MT7621 basic clocks.
> +endmenu
> diff --git a/drivers/clk/ralink/Makefile b/drivers/clk/ralink/Makefile
> new file mode 100644
> index 000000000000..cf6f9216379d
> --- /dev/null
> +++ b/drivers/clk/ralink/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_CLK_MT7621) +=3D clk-mt7621.o
> diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7=
621.c
> new file mode 100644
> index 000000000000..4e929f13fe7c
> --- /dev/null
> +++ b/drivers/clk/ralink/clk-mt7621.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek MT7621 Clock Driver
> + * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/regmap.h>
> +#include <asm/mach-ralink/ralink_regs.h>

Is it possible to drop this include? Doing so would make this portable
and compilable on more architectures so us cross compilers can check
build stuff and make changes easily.

> +#include <dt-bindings/clock/mt7621-clk.h>
> +
> +/* Configuration registers */
> +#define SYSC_REG_SYSTEM_CONFIG0         0x10
> +#define SYSC_REG_SYSTEM_CONFIG1         0x14
> +#define SYSC_REG_CLKCFG0               0x2c
> +#define SYSC_REG_CLKCFG1               0x30
> +#define SYSC_REG_CUR_CLK_STS           0x44
> +
> +#define MEMC_REG_CPU_PLL               0x648
> +#define XTAL_MODE_SEL_MASK             0x7
> +#define XTAL_MODE_SEL_SHIFT            6
> +
> +#define CPU_CLK_SEL_MASK               0x3
> +#define CPU_CLK_SEL_SHIFT              30
> +
> +#define CUR_CPU_FDIV_MASK              0x1f
> +#define CUR_CPU_FDIV_SHIFT             8
> +#define CUR_CPU_FFRAC_MASK             0x1f
> +#define CUR_CPU_FFRAC_SHIFT            0
> +
> +#define CPU_PLL_PREDIV_MASK            0x3
> +#define CPU_PLL_PREDIV_SHIFT           12
> +#define CPU_PLL_FBDIV_MASK             0x7f
> +#define CPU_PLL_FBDIV_SHIFT            4
> +
> +#define MHZ(x) ((x) * 1000 * 1000)

I'd rather we just wrote it out in Hz and dropped this macro.

> +
> +struct mt7621_clk_provider {
> +       struct device_node *node;
> +       struct regmap *syscon_regmap;
> +       struct clk_hw_onecell_data *clk_data;
> +};
> +
> +struct mt7621_clk {
> +       struct mt7621_clk_provider *clk_prov;
> +       struct clk_hw hw;
> +};
> +
> +struct mt7621_fixed_clk {
> +       u8 idx;
> +       const char *name;
> +       const char *parent_name;
> +       struct mt7621_clk_provider *clk_prov;
> +       unsigned long rate;
> +       struct clk_hw *hw;
> +};
> +
> +struct mt7621_gate {
> +       u8 idx;
> +       const char *name;
> +       const char *parent_name;
> +       struct mt7621_clk_provider *clk_prov;
> +       u32 bit_idx;
> +       struct clk_hw hw;
> +};
> +
> +#define GATE(_id, _name, _pname, _shift)       \
> +       {                                       \
> +               .idx            =3D _id,          \
> +               .name           =3D _name,        \
> +               .parent_name    =3D _pname,       \
> +               .clk_prov       =3D NULL,         \
> +               .bit_idx        =3D _shift        \
> +       }
> +
> +static struct mt7621_gate mt7621_gates[] =3D {
> +       GATE(MT7621_CLK_HSDMA, "hsdma", "150m", BIT(5)),
> +       GATE(MT7621_CLK_FE, "fe", "250m", BIT(6)),
> +       GATE(MT7621_CLK_SP_DIVTX, "sp_divtx", "270m", BIT(7)),
> +       GATE(MT7621_CLK_TIMER, "timer", "50m", BIT(8)),
> +       GATE(MT7621_CLK_PCM, "pcm", "270m", BIT(11)),
> +       GATE(MT7621_CLK_PIO, "pio", "50m", BIT(13)),
> +       GATE(MT7621_CLK_GDMA, "gdma", "bus", BIT(14)),
> +       GATE(MT7621_CLK_NAND, "nand", "125m", BIT(15)),
> +       GATE(MT7621_CLK_I2C, "i2c", "50m", BIT(16)),
> +       GATE(MT7621_CLK_I2S, "i2s", "270m", BIT(17)),
> +       GATE(MT7621_CLK_SPI, "spi", "bus", BIT(18)),
> +       GATE(MT7621_CLK_UART1, "uart1", "50m", BIT(19)),
> +       GATE(MT7621_CLK_UART2, "uart2", "50m", BIT(20)),
> +       GATE(MT7621_CLK_UART3, "uart3", "50m", BIT(21)),
> +       GATE(MT7621_CLK_ETH, "eth", "50m", BIT(23)),
> +       GATE(MT7621_CLK_PCIE0, "pcie0", "125m", BIT(24)),
> +       GATE(MT7621_CLK_PCIE1, "pcie1", "125m", BIT(25)),
> +       GATE(MT7621_CLK_PCIE2, "pcie2", "125m", BIT(26)),
> +       GATE(MT7621_CLK_CRYPTO, "crypto", "250m", BIT(29)),
> +       GATE(MT7621_CLK_SHXC, "shxc", "50m", BIT(30))
> +};
> +
> +static inline struct mt7621_gate *to_mt7621_gate(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct mt7621_gate, hw);
> +}
> +
> +static int mt7621_gate_enable(struct clk_hw *hw)
> +{
> +       struct mt7621_gate *clk_gate =3D to_mt7621_gate(hw);
> +       struct regmap *scon =3D clk_gate->clk_prov->syscon_regmap;
> +
> +       return regmap_update_bits(scon, SYSC_REG_CLKCFG1,
> +                                 clk_gate->bit_idx, clk_gate->bit_idx);
> +}
> +
> +static void mt7621_gate_disable(struct clk_hw *hw)
> +{
> +       struct mt7621_gate *clk_gate =3D to_mt7621_gate(hw);
> +       struct regmap *scon =3D clk_gate->clk_prov->syscon_regmap;
> +
> +       regmap_update_bits(scon, SYSC_REG_CLKCFG1, clk_gate->bit_idx, 0);
> +}
> +
> +static int mt7621_gate_is_enabled(struct clk_hw *hw)
> +{
> +       struct mt7621_gate *clk_gate =3D to_mt7621_gate(hw);
> +       struct regmap *scon =3D clk_gate->clk_prov->syscon_regmap;
> +       unsigned int val;
> +
> +       if (regmap_read(scon, SYSC_REG_CLKCFG1, &val))
> +               return 0;
> +
> +       return val & clk_gate->bit_idx;
> +}
> +
> +static const struct clk_ops mt7621_gate_ops =3D {
> +       .enable =3D mt7621_gate_enable,
> +       .disable =3D mt7621_gate_disable,
> +       .is_enabled =3D mt7621_gate_is_enabled,
> +};
> +
> +static int mt7621_gate_ops_init(struct device_node *np,
> +                                struct mt7621_gate *sclk)
> +{
> +       struct clk_init_data init =3D {
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,

Why ignore unused? Are they CLK_IS_CRITICAL? Can they be enabled at
driver probe instead of here? Or left out of the kernel entirely if they
shouldn't be turned off?

> +               .num_parents =3D 1,
> +               .parent_names =3D &sclk->parent_name,
> +               .ops =3D &mt7621_gate_ops,
> +               .name =3D sclk->name,
> +       };
> +
> +       sclk->hw.init =3D &init;
> +       return of_clk_hw_register(np, &sclk->hw);
> +}
> +
> +static int mt7621_register_gates(struct mt7621_clk_provider *clk_prov)
> +{
> +       struct clk_hw_onecell_data **clk_data =3D &clk_prov->clk_data;

Why do we take a pointer of a pointer.

> +       struct clk_hw **hws =3D (*clk_data)->hws;

And then deref that pointer?

> +       int ret, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_gates); i++) {
> +               struct mt7621_gate *sclk =3D &mt7621_gates[i];
> +
> +               sclk->clk_prov =3D clk_prov;
> +               ret =3D mt7621_gate_ops_init(clk_prov->node, sclk);
> +               if (ret) {
> +                       pr_err("Couldn't register clock %s\n", sclk->name=
);
> +                       goto err_clk_unreg;
> +               }
> +
> +               hws[sclk->idx] =3D &sclk->hw;
> +               (*clk_data)->num++;

Just use the pointer?

> +       }
> +
> +       return 0;
> +
> +err_clk_unreg:
> +       while (--i >=3D 0) {
> +               struct mt7621_gate *sclk =3D &mt7621_gates[i];
> +
> +               clk_hw_unregister(&sclk->hw);
> +       }
> +       return ret;
> +}
> +
> +#define FIXED(_id, _name, _pname, _rate)        \
> +       {                                       \
> +               .idx            =3D _id,          \
> +               .name           =3D _name,        \
> +               .parent_name    =3D _pname,       \
> +               .clk_prov       =3D NULL,         \

This can be dropped as NULL is the default.

> +               .rate           =3D _rate         \
> +       }
> +
> +static struct mt7621_fixed_clk mt7621_fixed_clks[] =3D {
> +       FIXED(MT7621_CLK_50M, "50m", "xtal", MHZ(50)),
> +       FIXED(MT7621_CLK_125M, "125m", "xtal", MHZ(125)),
> +       FIXED(MT7621_CLK_150M, "150m", "xtal", MHZ(150)),
> +       FIXED(MT7621_CLK_250M, "250m", "xtal", MHZ(250)),
> +       FIXED(MT7621_CLK_270M, "270m", "xtal", MHZ(270)),

parent is always "xtal" so maybe just hardcode that?

> +};
> +
> +static int mt7621_register_fixed_clocks(struct mt7621_clk_provider *clk_=
prov)
> +{
> +       struct clk_hw_onecell_data **clk_data =3D &clk_prov->clk_data;
> +       struct clk_hw **hws =3D (*clk_data)->hws;
> +       int ret, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
> +               struct mt7621_fixed_clk *sclk =3D &mt7621_fixed_clks[i];
> +
> +               sclk->clk_prov =3D clk_prov;
> +               sclk->hw =3D clk_hw_register_fixed_rate(NULL, sclk->name,
> +                                                     sclk->parent_name, =
0,
> +                                                     sclk->rate);
> +               if (IS_ERR(sclk->hw)) {
> +                       pr_err("Couldn't register clock %s\n", sclk->name=
);
> +                       ret =3D PTR_ERR(sclk->hw);
> +                       goto err_clk_unreg;
> +               }
> +
> +               hws[sclk->idx] =3D sclk->hw;
> +               (*clk_data)->num++;
> +       }
> +
> +       return 0;
> +
> +err_clk_unreg:
> +       while (--i >=3D 0) {
> +               struct mt7621_fixed_clk *sclk =3D &mt7621_fixed_clks[i];
> +
> +               clk_hw_unregister_fixed_rate(sclk->hw);
> +       }
> +       return ret;
> +}
> +
> +static inline struct mt7621_clk *to_mt7621_clk(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct mt7621_clk, hw);
> +}
> +
> +static unsigned long mt7621_xtal_recalc_rate(struct clk_hw *hw,
> +                                            unsigned long parent_rate)
> +{
> +       struct mt7621_clk *clk =3D to_mt7621_clk(hw);
> +       struct regmap *scon =3D clk->clk_prov->syscon_regmap;
> +       u32 val;
> +
> +       regmap_read(scon, SYSC_REG_SYSTEM_CONFIG0, &val);
> +       val =3D (val >> XTAL_MODE_SEL_SHIFT) & XTAL_MODE_SEL_MASK;
> +
> +       if (val <=3D 2)
> +               return MHZ(20);
> +       else if (val <=3D 5)

Replace with 'if' because it returns above.

> +               return MHZ(40);
> +
> +       return MHZ(25);
> +}
> +
> +static unsigned long mt7621_cpu_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long xtal_clk)
> +{
> +       static const u32 prediv_tbl[] =3D { 0, 1, 2, 2 };
> +       struct mt7621_clk *clk =3D to_mt7621_clk(hw);
> +       struct regmap *scon =3D clk->clk_prov->syscon_regmap;
> +       u32 clkcfg, clk_sel, curclk, ffiv, ffrac;
> +       u32 pll, prediv, fbdiv;
> +       unsigned long cpu_clk;
> +
> +       regmap_read(scon, SYSC_REG_CLKCFG0, &clkcfg);
> +       clk_sel =3D (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
> +
> +       regmap_read(scon, SYSC_REG_CUR_CLK_STS, &curclk);
> +       ffiv =3D (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
> +       ffrac =3D (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
> +
> +       switch (clk_sel) {
> +       case 0:
> +               cpu_clk =3D MHZ(500);
> +               break;
> +       case 1:
> +               pll =3D rt_memc_r32(MEMC_REG_CPU_PLL);
> +               fbdiv =3D (pll >> CPU_PLL_FBDIV_SHIFT) & CPU_PLL_FBDIV_MA=
SK;
> +               prediv =3D (pll >> CPU_PLL_PREDIV_SHIFT) & CPU_PLL_PREDIV=
_MASK;
> +               cpu_clk =3D ((fbdiv + 1) * xtal_clk) >> prediv_tbl[prediv=
];
> +               break;
> +       default:
> +               cpu_clk =3D xtal_clk;
> +       }
> +
> +       return cpu_clk / ffiv * ffrac;
> +}
> +
> +static unsigned long mt7621_bus_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long parent_rate)
> +{
> +       return parent_rate / 4;
> +}
> +
> +#define CLK_BASE(_name, _parent, _recalc) {                            \
> +       .init =3D &(struct clk_init_data) {                              =
 \
> +               .name =3D _name,                                         =
 \
> +               .ops =3D &(const struct clk_ops) {                       =
 \
> +                       .recalc_rate =3D _recalc,                        =
 \
> +               },                                                      \
> +               .parent_names =3D (const char *const[]) { _parent },     =
 \

Please use clk_parent_data instead

> +               .num_parents =3D _parent ? 1 : 0                         =
 \
> +       },                                                              \
> +}
> +
> +static struct mt7621_clk mt7621_clks_base[] =3D {
> +       { NULL, CLK_BASE("xtal", NULL, mt7621_xtal_recalc_rate) },
> +       { NULL, CLK_BASE("cpu", "xtal", mt7621_cpu_recalc_rate) },
> +       { NULL, CLK_BASE("bus", "cpu", mt7621_bus_recalc_rate) },
> +};
> +
> +static int mt7621_register_top_clocks(struct mt7621_clk_provider *clk_pr=
ov)
> +{
> +       struct clk_hw_onecell_data **clk_data =3D &clk_prov->clk_data;
> +       struct clk_hw **hws =3D (*clk_data)->hws;
> +       int ret, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
> +               struct mt7621_clk *sclk =3D &mt7621_clks_base[i];
> +
> +               sclk->clk_prov =3D clk_prov;
> +               ret =3D of_clk_hw_register(clk_prov->node, &sclk->hw);
> +               if (ret) {
> +                       pr_err("Couldn't register top clock %i\n", i);
> +                       goto err_clk_unreg;
> +               }
> +
> +               hws[i] =3D &sclk->hw;
> +               (*clk_data)->num++;
> +       }
> +
> +       return 0;
> +
> +err_clk_unreg:
> +       while (--i >=3D 0) {
> +               struct mt7621_clk *sclk =3D &mt7621_clks_base[i];
> +
> +               clk_hw_unregister(&sclk->hw);
> +       }
> +       return ret;
> +}
> +
> +static void __init mt7621_clk_init(struct device_node *node)
> +{
> +       struct mt7621_clk_provider *clk_prov;
> +       struct clk_hw_onecell_data **clk_data;
> +       int i, ret, count;
> +
> +       clk_prov =3D kzalloc(sizeof(*clk_prov), GFP_KERNEL);
> +       if (!clk_prov)
> +               return;
> +
> +       clk_prov->syscon_regmap =3D syscon_node_to_regmap(node->parent);
> +       if (IS_ERR(clk_prov->syscon_regmap)) {
> +               pr_err("Could not get syscon regmap\n");
> +               goto free_clk_prov;
> +       }
> +
> +       clk_prov->node =3D node;
> +
> +       clk_data =3D &clk_prov->clk_data;
> +       count =3D ARRAY_SIZE(mt7621_clks_base) +
> +               ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
> +       *clk_data =3D kzalloc(struct_size(*clk_data, hws, count), GFP_KER=
NEL);
> +       if (!*clk_data)
> +               goto free_clk_prov;
> +
> +       ret =3D mt7621_register_top_clocks(clk_prov);
> +       if (ret) {
> +               pr_err("Couldn't register top clocks\n");
> +               goto free_clk_data;
> +       }
> +
> +       ret =3D mt7621_register_fixed_clocks(clk_prov);
> +       if (ret) {
> +               pr_err("Couldn't register fixed clocks\n");
> +               goto unreg_clk_top;
> +       }
> +
> +       ret =3D mt7621_register_gates(clk_prov);
> +       if (ret) {
> +               pr_err("Couldn't register fixed clock gates\n");
> +               goto unreg_clk_fixed;
> +       }
> +
> +       ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> +                                    clk_prov->clk_data);
> +       if (ret) {
> +               pr_err("Couldn't add clk hw provider\n");
> +               goto unreg_clk_gates;
> +       }
> +
> +       return;
> +
> +unreg_clk_gates:
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_gates); i++) {
> +               struct mt7621_gate *sclk =3D &mt7621_gates[i];
> +
> +               clk_hw_unregister(&sclk->hw);
> +       }
> +
> +unreg_clk_fixed:
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
> +               struct mt7621_fixed_clk *sclk =3D &mt7621_fixed_clks[i];
> +
> +               clk_hw_unregister_fixed_rate(sclk->hw);
> +       }
> +
> +unreg_clk_top:
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
> +               struct mt7621_clk *sclk =3D &mt7621_clks_base[i];
> +
> +               clk_hw_unregister(&sclk->hw);
> +       }
> +
> +free_clk_data:
> +       kfree(clk_prov->clk_data);
> +
> +free_clk_prov:
> +       kfree(clk_prov);
> +}
> +
> +CLK_OF_DECLARE(mt7621_clk, "mediatek,mt7621-clk", mt7621_clk_init);

Any reason to use this vs. a platform driver?

> +
> +MODULE_AUTHOR("Sergio Paracuellos <sergio.paracuellos@gmail.com>");
> +MODULE_DESCRIPTION("Mediatek Mt7621 clock driver");
> +MODULE_LICENSE("GPL v2");

It isn't a module, but it would be nice if it was one. If the Kconfig is
bool these shouldn't be here.
