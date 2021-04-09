Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0000A35A579
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 20:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbhDISOj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 14:14:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:34332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234636AbhDISOi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Apr 2021 14:14:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB2E36100B;
        Fri,  9 Apr 2021 18:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617992064;
        bh=/StonYyFH+0Wf3OD6V9kpLSebPvB+2P38pwrMNhSoXo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ce7zdQVhNP+brkVNk/xYMYBgp1QunfNVFx9mGH5yBtXOG1KUe71r3IF7X8ufuO2FT
         dl1fI/saHP4ie8wnp//Udkk3KdCBKJM8uES9wrepdYLZ2tEULajm8sLuXHOLNBwJTR
         g7N0ZU59DiUuuiHEGmPWWTveCFIdqj9AKobh2h2+ldOyYD6j8e7A0zmBAYeCjOQGDi
         8NtKg8kJWiKX37J/wQv+2l7pjfkIPmUqTLmoruDg0uTSuN5JEkdl0maYPLsyhNCilY
         rnw9zp3AgMS7Ex5OmoHJuQeBTmGQm8cEFnBF4w9vwSKdF44wQEqaRgUFcW4EtQ6mxs
         2PiSmQilwD79Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210309052226.29531-4-sergio.paracuellos@gmail.com>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com> <20210309052226.29531-4-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v11 3/6] clk: ralink: add clock driver for mt7621 SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 09 Apr 2021 11:14:23 -0700
Message-ID: <161799206350.3790633.14908755786674195715@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Quoting Sergio Paracuellos (2021-03-08 21:22:23)
> diff --git a/drivers/clk/ralink/Kconfig b/drivers/clk/ralink/Kconfig
> new file mode 100644
> index 000000000000..3e3f5cb9ad88
> --- /dev/null
> +++ b/drivers/clk/ralink/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# MediaTek Mt7621 Clock Driver
> +#
> +menu "Clock driver for Mediatek mt7621 SoC"
> +       depends on SOC_MT7621 || COMPILE_TEST

Do we need a menu and a config that says the same thing? Maybe the menu
can be dropped?

> +
> +config CLK_MT7621
> +       bool "Clock driver for MediaTek MT7621"
> +       depends on SOC_MT7621 || COMPILE_TEST
> +       default SOC_MT7621
> +       select MFD_SYSCON
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
> index 000000000000..6aea5accd51c
> --- /dev/null
> +++ b/drivers/clk/ralink/clk-mt7621.c
> @@ -0,0 +1,528 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek MT7621 Clock Driver
> + * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <dt-bindings/clock/mt7621-clk.h>
> +
> +/* Configuration registers */
> +#define SYSC_REG_SYSTEM_CONFIG0         0x10
> +#define SYSC_REG_SYSTEM_CONFIG1         0x14
> +#define SYSC_REG_CLKCFG0               0x2c
> +#define SYSC_REG_CLKCFG1               0x30
> +#define SYSC_REG_CUR_CLK_STS           0x44
> +#define MEMC_REG_CPU_PLL               0x648
> +
> +#define XTAL_MODE_SEL_MASK             GENMASK(8, 6)
> +#define CPU_CLK_SEL_MASK               GENMASK(31, 30)
> +#define CUR_CPU_FDIV_MASK              GENMASK(12, 8)
> +#define CUR_CPU_FFRAC_MASK             GENMASK(4, 0)
> +#define CPU_PLL_PREDIV_MASK            GENMASK(13, 12)
> +#define CPU_PLL_FBDIV_MASK             GENMASK(10, 4)
> +
> +struct mt7621_clk_priv {
> +       struct regmap *sysc;
> +       struct regmap *memc;
> +};
> +
> +struct mt7621_clk {
> +       struct clk_hw hw;
> +       struct mt7621_clk_priv *priv;
> +};
> +
> +struct mt7621_fixed_clk {
> +       u8 idx;
> +       const char *name;
> +       const char *parent_name;
> +       unsigned long rate;
> +       struct clk_hw *hw;
> +};
> +
> +struct mt7621_gate {
> +       u8 idx;
> +       const char *name;
> +       const char *parent_name;
> +       struct mt7621_clk_priv *priv;
> +       u32 bit_idx;
> +       struct clk_hw hw;
> +};
> +
> +#define GATE(_id, _name, _pname, _shift)       \
> +       {                                       \
> +               .idx            =3D _id,          \
> +               .name           =3D _name,        \
> +               .parent_name    =3D _pname,       \
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
> +       struct regmap *sysc =3D clk_gate->priv->sysc;
> +
> +       return regmap_update_bits(sysc, SYSC_REG_CLKCFG1,
> +                                 clk_gate->bit_idx, clk_gate->bit_idx);
> +}
> +
> +static void mt7621_gate_disable(struct clk_hw *hw)
> +{
> +       struct mt7621_gate *clk_gate =3D to_mt7621_gate(hw);
> +       struct regmap *sysc =3D clk_gate->priv->sysc;
> +
> +       regmap_update_bits(sysc, SYSC_REG_CLKCFG1, clk_gate->bit_idx, 0);
> +}
> +
> +static int mt7621_gate_is_enabled(struct clk_hw *hw)
> +{
> +       struct mt7621_gate *clk_gate =3D to_mt7621_gate(hw);
> +       struct regmap *sysc =3D clk_gate->priv->sysc;
> +       u32 val;
> +
> +       if (regmap_read(sysc, SYSC_REG_CLKCFG1, &val))
> +               return 0;
> +
> +       return val & BIT(clk_gate->bit_idx);
> +}
> +
> +static const struct clk_ops mt7621_gate_ops =3D {
> +       .enable =3D mt7621_gate_enable,
> +       .disable =3D mt7621_gate_disable,
> +       .is_enabled =3D mt7621_gate_is_enabled,
> +};
> +
> +static int mt7621_gate_ops_init(struct device *dev,
> +                               struct mt7621_gate *sclk)
> +{
> +       struct clk_init_data init =3D {
> +               .flags =3D CLK_SET_RATE_PARENT,
> +               .num_parents =3D 1,
> +               .parent_names =3D &sclk->parent_name,
> +               .ops =3D &mt7621_gate_ops,
> +               .name =3D sclk->name,
> +       };
> +
> +       sclk->hw.init =3D &init;
> +       return devm_clk_hw_register(dev, &sclk->hw);
> +}
> +
> +static int mt7621_register_gates(struct device *dev,
> +                                struct clk_hw_onecell_data *clk_data,
> +                                struct mt7621_clk_priv *priv)
> +{
> +       struct clk_hw **hws =3D clk_data->hws;
> +       int ret, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_gates); i++) {
> +               struct mt7621_gate *sclk =3D &mt7621_gates[i];
> +
> +               sclk->priv =3D priv;
> +               ret =3D mt7621_gate_ops_init(dev, sclk);
> +               if (ret) {
> +                       dev_err(dev, "Couldn't register clock %s\n", sclk=
->name);
> +                       goto err_clk_unreg;
> +               }
> +
> +               hws[sclk->idx] =3D &sclk->hw;
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
> +#define FIXED(_id, _name, _rate)               \
> +       {                                       \
> +               .idx            =3D _id,          \
> +               .name           =3D _name,        \
> +               .parent_name    =3D "xtal",       \
> +               .rate           =3D _rate         \
> +       }
> +
> +static struct mt7621_fixed_clk mt7621_fixed_clks[] =3D {
> +       FIXED(MT7621_CLK_50M, "50m", 50000000),
> +       FIXED(MT7621_CLK_125M, "125m", 125000000),
> +       FIXED(MT7621_CLK_150M, "150m", 150000000),
> +       FIXED(MT7621_CLK_250M, "250m", 250000000),
> +       FIXED(MT7621_CLK_270M, "270m", 270000000),
> +};
> +
> +static int mt7621_register_fixed_clocks(struct device *dev,
> +                                       struct clk_hw_onecell_data *clk_d=
ata)
> +{
> +       struct clk_hw **hws =3D clk_data->hws;
> +       int ret, i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
> +               struct mt7621_fixed_clk *sclk =3D &mt7621_fixed_clks[i];
> +
> +               sclk->hw =3D clk_hw_register_fixed_rate(dev, sclk->name,
> +                                                     sclk->parent_name, =
0,
> +                                                     sclk->rate);
> +               if (IS_ERR(sclk->hw)) {
> +                       dev_err(dev, "Couldn't register clock %s\n", sclk=
->name);
> +                       ret =3D PTR_ERR(sclk->hw);
> +                       goto err_clk_unreg;
> +               }
> +
> +               hws[sclk->idx] =3D sclk->hw;
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
> +       struct regmap *sysc =3D clk->priv->sysc;
> +       u32 val;
> +
> +       regmap_read(sysc, SYSC_REG_SYSTEM_CONFIG0, &val);
> +       val =3D FIELD_GET(XTAL_MODE_SEL_MASK, val);
> +
> +       if (val <=3D 2)
> +               return 20000000;
> +       if (val <=3D 5)
> +               return 40000000;
> +
> +       return 25000000;
> +}
> +
> +static unsigned long mt7621_cpu_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long xtal_clk)
> +{
> +       static const u32 prediv_tbl[] =3D { 0, 1, 2, 2 };
> +       struct mt7621_clk *clk =3D to_mt7621_clk(hw);
> +       struct regmap *sysc =3D clk->priv->sysc;
> +       struct regmap *memc =3D clk->priv->memc;
> +       u32 clkcfg, clk_sel, curclk, ffiv, ffrac;
> +       u32 pll, prediv, fbdiv;
> +       unsigned long cpu_clk;
> +
> +       regmap_read(sysc, SYSC_REG_CLKCFG0, &clkcfg);
> +       clk_sel =3D FIELD_GET(CPU_CLK_SEL_MASK, clkcfg);
> +
> +       regmap_read(sysc, SYSC_REG_CUR_CLK_STS, &curclk);
> +       ffiv =3D FIELD_GET(CUR_CPU_FDIV_MASK, curclk);
> +       ffrac =3D FIELD_GET(CUR_CPU_FFRAC_MASK, curclk);
> +
> +       switch (clk_sel) {
> +       case 0:
> +               cpu_clk =3D 500000000;
> +               break;
> +       case 1:
> +               regmap_read(memc, MEMC_REG_CPU_PLL, &pll);
> +               fbdiv =3D FIELD_GET(CPU_PLL_FBDIV_MASK, pll);
> +               prediv =3D FIELD_GET(CPU_PLL_PREDIV_MASK, pll);
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
> +               .parent_data =3D &(const struct clk_parent_data) {       =
 \
> +                       .name =3D _parent,                               =
 \
> +                       .fw_name =3D _parent                             =
 \
> +               },                                                      \
> +               .num_parents =3D _parent ? 1 : 0                         =
 \
> +       },                                                              \
> +}
> +
> +static struct mt7621_clk mt7621_clks_base[] =3D {
> +       { CLK_BASE("xtal", NULL, mt7621_xtal_recalc_rate) },
> +       { CLK_BASE("cpu", "xtal", mt7621_cpu_recalc_rate) },
> +       { CLK_BASE("bus", "cpu", mt7621_bus_recalc_rate) },
> +};
> +
> +static struct clk_hw *mt7621_clk_early[MT7621_CLK_MAX];
> +
> +static int mt7621_register_early_clocks(struct device_node *np,
> +                                       struct clk_hw_onecell_data *clk_d=
ata,
> +                                       struct mt7621_clk_priv *priv)
> +{
> +       struct clk_hw **hws =3D clk_data->hws;
> +       int ret, i, j;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
> +               struct mt7621_clk *sclk =3D &mt7621_clks_base[i];
> +
> +               sclk->priv =3D priv;
> +               ret =3D of_clk_hw_register(np, &sclk->hw);
> +               if (ret) {
> +                       pr_err("Couldn't register top clock %i\n", i);
> +                       goto err_clk_unreg;
> +               }
> +
> +               hws[i] =3D &sclk->hw;
> +               mt7621_clk_early[i] =3D &sclk->hw;
> +       }
> +
> +       for (j =3D i; j < MT7621_CLK_MAX; j++)
> +               mt7621_clk_early[j] =3D ERR_PTR(-EPROBE_DEFER);
> +
> +       return 0;
> +
> +err_clk_unreg:
> +       while (--i >=3D 0) {
> +               struct mt7621_clk *sclk =3D &mt7621_clks_base[i];

Please move sclk to the toplevel of this function instead of having it
twice.

> +
> +               clk_hw_unregister(&sclk->hw);
> +       }
> +       return ret;
> +}
> +
> +static int mt7621_prepare_enable_clocks(struct clk_hw_onecell_data *clk_=
data)
> +{
> +       int ret, i;
> +
> +       for (i =3D 0; i < MT7621_CLK_MAX; i++) {
> +               ret =3D clk_prepare_enable(clk_data->hws[i]->clk);

Are these critical clks? Why not use the CLK_IS_CRITICAL flag?

> +               if (ret) {
> +                       pr_err("failed to enable clk: %d\n", ret);
> +                       goto err_clk_disable;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_clk_disable:
> +       while (--i >=3D 0)
> +               clk_disable_unprepare(clk_data->hws[i]->clk);
> +       return ret;
> +}
> +
> +static void __init mt7621_clk_init(struct device_node *node)
> +{
> +       struct mt7621_clk_priv *priv;
> +       struct clk_hw_onecell_data *clk_data;
> +       int ret, i, count;
> +
> +       priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return;
> +
> +       priv->sysc =3D syscon_node_to_regmap(node);
> +       if (IS_ERR(priv->sysc)) {
> +               pr_err("Could not get sysc syscon regmap\n");
> +               goto free_clk_priv;
> +       }
> +
> +       priv->memc =3D syscon_regmap_lookup_by_phandle(node, "ralink,memc=
tl");
> +       if (IS_ERR(priv->memc)) {
> +               pr_err("Could not get memc syscon regmap\n");
> +               goto free_clk_priv;
> +       }
> +
> +       count =3D ARRAY_SIZE(mt7621_clks_base) +
> +               ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
> +       clk_data =3D kzalloc(struct_size(clk_data, hws, count), GFP_KERNE=
L);
> +       if (!clk_data)
> +               goto free_clk_priv;
> +
> +       ret =3D mt7621_register_early_clocks(node, clk_data, priv);
> +       if (ret) {
> +               pr_err("Couldn't register top clocks\n");
> +               goto free_clk_data;
> +       }
> +
> +       clk_data->num =3D count;
> +
> +       ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_d=
ata);
> +       if (ret) {
> +               pr_err("Couldn't add clk hw provider\n");
> +               goto unreg_clk_top;
> +       }
> +
> +       return;
> +
> +unreg_clk_top:
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
> +               struct mt7621_clk *sclk =3D &mt7621_clks_base[i];
> +
> +               clk_hw_unregister(&sclk->hw);
> +       }
> +
> +free_clk_data:
> +       kfree(clk_data);
> +
> +free_clk_priv:
> +       kfree(priv);
> +}
> +CLK_OF_DECLARE_DRIVER(mt7621_clk, "mediatek,mt7621-sysc", mt7621_clk_ini=
t);
> +
> +static int mt7621_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np =3D pdev->dev.of_node;
> +       struct clk_hw_onecell_data *clk_data;
> +       struct device *dev =3D &pdev->dev;
> +       struct mt7621_clk_priv *priv;
> +       int ret, i, count;
> +
> +       priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);

Can we use devm_* APIs here?

> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->sysc =3D syscon_node_to_regmap(np);
> +       if (IS_ERR(priv->sysc)) {
> +               ret =3D PTR_ERR(priv->sysc);
> +               dev_err(dev, "Could not get sysc syscon regmap\n");
> +               goto free_clk_priv;
> +       }
> +
> +       priv->memc =3D syscon_regmap_lookup_by_phandle(np, "ralink,memctl=
");
> +       if (IS_ERR(priv->memc)) {
> +               ret =3D PTR_ERR(priv->memc);
> +               dev_err(dev, "Could not get memc syscon regmap\n");
> +               goto free_clk_priv;
> +       }
> +
> +       count =3D ARRAY_SIZE(mt7621_clks_base) +
> +               ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
> +       clk_data =3D kzalloc(struct_size(clk_data, hws, count), GFP_KERNE=
L);
> +       if (!clk_data) {
> +               ret =3D -ENOMEM;
> +               goto free_clk_priv;
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(mt7621_clks_base); i++)
> +               clk_data->hws[i] =3D mt7621_clk_early[i];
> +
> +       ret =3D mt7621_register_fixed_clocks(dev, clk_data);
> +       if (ret) {
> +               dev_err(dev, "Couldn't register fixed clocks\n");
> +               goto free_clk_data;
> +       }
> +
> +       ret =3D mt7621_register_gates(dev, clk_data, priv);
> +       if (ret) {
> +               dev_err(dev, "Couldn't register fixed clock gates\n");
> +               goto unreg_clk_fixed;
> +       }
> +
> +       clk_data->num =3D count;
> +
> +       ret =3D mt7621_prepare_enable_clocks(clk_data);
> +       if (ret) {
> +               dev_err(dev, "Couldn't register fixed clock gates\n");

This isn't registering fixed clock gates though?

> +               goto unreg_clk_gates;
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, c=
lk_data);
> +       if (ret) {
> +               dev_err(dev, "Couldn't add clk hw provider\n");
> +               goto disable_clks;
> +       }
> +
> +       return 0;
> +
> +disable_clks:
> +       for (i =3D 0; i < MT7621_CLK_MAX; i++)
> +               clk_disable_unprepare(clk_data->hws[i]->clk);
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
> +free_clk_data:
> +       kfree(clk_data);
> +
> +free_clk_priv:
> +       kfree(priv);
> +
> +       return ret;
> +}
> +
> +static const struct of_device_id mt7621_clk_of_match[] =3D {
> +       { .compatible =3D "mediatek,mt7621-sysc" },
> +       {},

Nitpick: Drop the comma on the sentinel so it's a compile error if
another element is added after.

> +};
> +
> +static struct platform_driver mt7621_clk_driver =3D {
> +       .probe =3D mt7621_clk_probe,
> +       .driver =3D {
> +               .name =3D "mt7621-clk",
> +               .of_match_table =3D mt7621_clk_of_match,
> +       },
> +};
> +builtin_platform_driver(mt7621_clk_driver);
