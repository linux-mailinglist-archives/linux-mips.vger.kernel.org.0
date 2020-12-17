Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58322DCEE6
	for <lists+linux-mips@lfdr.de>; Thu, 17 Dec 2020 10:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgLQJzL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Dec 2020 04:55:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgLQJzL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Dec 2020 04:55:11 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03743C061794;
        Thu, 17 Dec 2020 01:54:31 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id x13so26721380oto.8;
        Thu, 17 Dec 2020 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nIfEISs4JZvfPiOuPuH9ldWyP43TIKymrEVLeDlLwe4=;
        b=PHie66iaPmouRle+pUQCiEaPhBpQAzF8+fk3nvsKTBGkElww/qyB/hTZoWSd1UR6ie
         0Z5F2YHJghbkcNCl7ncxxYji3nTRrQtvmIRPqkMHLxJ/+Soihl39fyZLyRtlV/E94hE1
         F/w13iE0Qr9RZsEiiNLj2UipDwMIB7UFQqCJSJCz5KfONybL6NcPe/gA7VyQuzn5mBkh
         VxuPy5NGBw5JDvTAwq5tgNtnauI2qzmtlOxESPPCvRGkcPfjv7+HKEl0dWs+1FHN76ty
         BZGwKgNrmtJ/ZI2oTpOX42SdnDN+kvL4lgDXFOARElWBp/FGBTstdKP8PsrM5DC/2Jjz
         lRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nIfEISs4JZvfPiOuPuH9ldWyP43TIKymrEVLeDlLwe4=;
        b=FGweWeLZhaXsBxc2O2qlrUzz5q7ap5jJQgftnwDfeH2rwi3b45+o3sOaWs5j4bR/qN
         P/BgE+JOpGyirPRMQ6HWECbQ+EYuVs/ZVaGpbHtxO/AlBscutqZhOo5D8LhOt0tfVIX1
         zIKgQQ6c5zfyO5spM4Xg9HKPI0nsL1wybW3M14WDGp9JdCvORsAJuH7dY7DFrz6Y0Z9O
         Fsdw0jXOKJephiZEJ05ujK75sjS4Pb3+AdQDjGgyDU31cvGsQUkSzkK4NllqR2DjC5X3
         7U8g3wBGfsTMQnkF0+bR1Emlbb0+MUSTe35lFpp+SkH1UNopN3EVxPnmWHpT5rqnatzc
         K+jQ==
X-Gm-Message-State: AOAM532sbOAIBIt1ihgQci2UY3J3w1tGe/BXRCB7BcJFcA/0IvJInCJ8
        p/8ZINEst75PqwUQcDWI4y8dQ3zYTHSKQ//+wSA=
X-Google-Smtp-Source: ABdhPJw1QYfsz1chvW9EqHIgywbFOg/iUjOZPGFXggqXu4u1npPdY1U4ENjPXO1R83IV0aLEAvce2adKxRRiNRDed5M=
X-Received: by 2002:a05:6830:2144:: with SMTP id r4mr3179253otd.72.1608198870273;
 Thu, 17 Dec 2020 01:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
 <20201122095556.21597-4-sergio.paracuellos@gmail.com> <160819619591.1580929.9915856168932644762@swboyd.mtv.corp.google.com>
In-Reply-To: <160819619591.1580929.9915856168932644762@swboyd.mtv.corp.google.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 17 Dec 2020 10:54:18 +0100
Message-ID: <CAMhs-H_6x7rTLPd8sABvzBqNJE2WeRJUGxG5VoqW4EvGy1hhPA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] clk: ralink: add clock driver for mt7621 SoC
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        evicetree@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stephen,

Thanks for the review.

On Thu, Dec 17, 2020 at 10:09 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2020-11-22 01:55:53)
> > The documentation for this SOC only talks about two
> > registers regarding to the clocks:
> > * SYSC_REG_CPLL_CLKCFG0 - provides some information about
> > boostrapped refclock. PLL and dividers used for CPU and some
> > sort of BUS.
> > * SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable
> > clocks for all or some ip cores.
> >
> > Looking into driver code, and some openWRT patched there are
> > another frequences which are used in some drivers (uart, sd...).
>
> s/frequences/frequencies/

Ok!

>
> > According to all of this information the clock plan for this
> > SoC is set as follows:
> > - Main top clock "xtal" from where all the rest of the world is
> > derived.
> > - CPU clock "cpu" derived from "xtal" frequencies and a bunch of
> > register reads and predividers.
> > - BUS clock "bus" derived from "cpu" and with (cpu / 4) MHz.
> > - Fixed clocks from "xtal":
> >     * "50m": 50 MHz.
> >     * "125m": 125 MHz.
> >     * "150m": 150 MHz.
> >     * "250m": 250 MHz.
> >     * "270m": 270 MHz.
> >
> > We also have a buch of gate clocks with their parents:
> >   * "hsdma": "150m"
> >   * "fe": "250m"
> >   * "sp_divtx": "270m"
> >   * "timer": "50m"
> >   * "pcm": "270m"
> >   * "pio": "50m"
> >   * "gdma": "bus"
> >   * "nand": "125m"
> >   * "i2c": "50m"
> >   * "i2s": "270m"
> >   * "spi": "bus"
> >   * "uart1": "50m"
> >   * "uart2": "50m"
> >   * "uart3": "50m"
> >   * "eth": "50m"
> >   * "pcie0": "125m"
> >   * "pcie1": "125m"
> >   * "pcie2": "125m"
> >   * "crypto": "250m"
> >   * "shxc": "50m"
> >
> > With this information the clk driver will provide clock and gates
> > functionality from a a set of hardcoded clocks allowing to define
> > a nice device tree without fixed clocks.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/clk/Kconfig             |   1 +
> >  drivers/clk/Makefile            |   1 +
> >  drivers/clk/ralink/Kconfig      |  14 +
> >  drivers/clk/ralink/Makefile     |   2 +
> >  drivers/clk/ralink/clk-mt7621.c | 435 ++++++++++++++++++++++++++++++++
> >  5 files changed, 453 insertions(+)
> >  create mode 100644 drivers/clk/ralink/Kconfig
> >  create mode 100644 drivers/clk/ralink/Makefile
> >  create mode 100644 drivers/clk/ralink/clk-mt7621.c
> >
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index c715d4681a0b..5f94c4329033 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -372,6 +372,7 @@ source "drivers/clk/mediatek/Kconfig"
> >  source "drivers/clk/meson/Kconfig"
> >  source "drivers/clk/mvebu/Kconfig"
> >  source "drivers/clk/qcom/Kconfig"
> > +source "drivers/clk/ralink/Kconfig"
> >  source "drivers/clk/renesas/Kconfig"
> >  source "drivers/clk/rockchip/Kconfig"
> >  source "drivers/clk/samsung/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index da8fcf147eb1..6578e167b047 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -100,6 +100,7 @@ obj-$(CONFIG_COMMON_CLK_NXP)                += nxp/
> >  obj-$(CONFIG_MACH_PISTACHIO)           += pistachio/
> >  obj-$(CONFIG_COMMON_CLK_PXA)           += pxa/
> >  obj-$(CONFIG_COMMON_CLK_QCOM)          += qcom/
> > +obj-y                                  += ralink/
> >  obj-y                                  += renesas/
> >  obj-$(CONFIG_ARCH_ROCKCHIP)            += rockchip/
> >  obj-$(CONFIG_COMMON_CLK_SAMSUNG)       += samsung/
>
> Thanks for keeping it sorted!

It was so clean sorted so I just followed the style there.

>
> > diff --git a/drivers/clk/ralink/Kconfig b/drivers/clk/ralink/Kconfig
> > new file mode 100644
> > index 000000000000..7e8697327e0c
> > --- /dev/null
> > +++ b/drivers/clk/ralink/Kconfig
> > @@ -0,0 +1,14 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# MediaTek Mt7621 Clock Driver
> > +#
> > +menu "Clock driver for mediatek mt7621 SoC"
>
> Capitalize MediaTek?

Will do.

>
> > +       depends on SOC_MT7621 || COMPILE_TEST
> > +
> > +config CLK_MT7621
> > +       bool "Clock driver for MediaTek MT7621"
>
> Like it is done here.

Yes, both should be properly capitalized.

>
> > +       depends on SOC_MT7621 || COMPILE_TEST
> > +       default SOC_MT7621
> > +       help
> > +         This driver supports MediaTek MT7621 basic clocks.
> > +endmenu
> > diff --git a/drivers/clk/ralink/Makefile b/drivers/clk/ralink/Makefile
> > new file mode 100644
> > index 000000000000..cf6f9216379d
> > --- /dev/null
> > +++ b/drivers/clk/ralink/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_CLK_MT7621) += clk-mt7621.o
> > diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
> > new file mode 100644
> > index 000000000000..4e929f13fe7c
> > --- /dev/null
> > +++ b/drivers/clk/ralink/clk-mt7621.c
> > @@ -0,0 +1,435 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Mediatek MT7621 Clock Driver
> > + * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/regmap.h>
> > +#include <asm/mach-ralink/ralink_regs.h>
>
> Is it possible to drop this include? Doing so would make this portable
> and compilable on more architectures so us cross compilers can check
> build stuff and make changes easily.

No, this is not possible. This old arch makes some global functions
there to properly access different registers in the palmbus. It is not
also well documented so it is really difficult to make something
better with this.
This is needed to use 'rt_memc_r32'
(arch/mips/include/asm/mach-ralink/ralink_regs.h) for reading
MEMC_REG_CPU_PLL.

This is a not documented register and is not in the syscon related
part and we need it to derive the clock frequency for the XTAL clock.

>
> > +#include <dt-bindings/clock/mt7621-clk.h>
> > +
> > +/* Configuration registers */
> > +#define SYSC_REG_SYSTEM_CONFIG0         0x10
> > +#define SYSC_REG_SYSTEM_CONFIG1         0x14
> > +#define SYSC_REG_CLKCFG0               0x2c
> > +#define SYSC_REG_CLKCFG1               0x30
> > +#define SYSC_REG_CUR_CLK_STS           0x44
> > +
> > +#define MEMC_REG_CPU_PLL               0x648
> > +#define XTAL_MODE_SEL_MASK             0x7
> > +#define XTAL_MODE_SEL_SHIFT            6
> > +
> > +#define CPU_CLK_SEL_MASK               0x3
> > +#define CPU_CLK_SEL_SHIFT              30
> > +
> > +#define CUR_CPU_FDIV_MASK              0x1f
> > +#define CUR_CPU_FDIV_SHIFT             8
> > +#define CUR_CPU_FFRAC_MASK             0x1f
> > +#define CUR_CPU_FFRAC_SHIFT            0
> > +
> > +#define CPU_PLL_PREDIV_MASK            0x3
> > +#define CPU_PLL_PREDIV_SHIFT           12
> > +#define CPU_PLL_FBDIV_MASK             0x7f
> > +#define CPU_PLL_FBDIV_SHIFT            4
> > +
> > +#define MHZ(x) ((x) * 1000 * 1000)
>
> I'd rather we just wrote it out in Hz and dropped this macro.

Ok, will do.

>
> > +
> > +struct mt7621_clk_provider {
> > +       struct device_node *node;
> > +       struct regmap *syscon_regmap;
> > +       struct clk_hw_onecell_data *clk_data;
> > +};
> > +
> > +struct mt7621_clk {
> > +       struct mt7621_clk_provider *clk_prov;
> > +       struct clk_hw hw;
> > +};
> > +
> > +struct mt7621_fixed_clk {
> > +       u8 idx;
> > +       const char *name;
> > +       const char *parent_name;
> > +       struct mt7621_clk_provider *clk_prov;
> > +       unsigned long rate;
> > +       struct clk_hw *hw;
> > +};
> > +
> > +struct mt7621_gate {
> > +       u8 idx;
> > +       const char *name;
> > +       const char *parent_name;
> > +       struct mt7621_clk_provider *clk_prov;
> > +       u32 bit_idx;
> > +       struct clk_hw hw;
> > +};
> > +
> > +#define GATE(_id, _name, _pname, _shift)       \
> > +       {                                       \
> > +               .idx            = _id,          \
> > +               .name           = _name,        \
> > +               .parent_name    = _pname,       \
> > +               .clk_prov       = NULL,         \
> > +               .bit_idx        = _shift        \
> > +       }
> > +
> > +static struct mt7621_gate mt7621_gates[] = {
> > +       GATE(MT7621_CLK_HSDMA, "hsdma", "150m", BIT(5)),
> > +       GATE(MT7621_CLK_FE, "fe", "250m", BIT(6)),
> > +       GATE(MT7621_CLK_SP_DIVTX, "sp_divtx", "270m", BIT(7)),
> > +       GATE(MT7621_CLK_TIMER, "timer", "50m", BIT(8)),
> > +       GATE(MT7621_CLK_PCM, "pcm", "270m", BIT(11)),
> > +       GATE(MT7621_CLK_PIO, "pio", "50m", BIT(13)),
> > +       GATE(MT7621_CLK_GDMA, "gdma", "bus", BIT(14)),
> > +       GATE(MT7621_CLK_NAND, "nand", "125m", BIT(15)),
> > +       GATE(MT7621_CLK_I2C, "i2c", "50m", BIT(16)),
> > +       GATE(MT7621_CLK_I2S, "i2s", "270m", BIT(17)),
> > +       GATE(MT7621_CLK_SPI, "spi", "bus", BIT(18)),
> > +       GATE(MT7621_CLK_UART1, "uart1", "50m", BIT(19)),
> > +       GATE(MT7621_CLK_UART2, "uart2", "50m", BIT(20)),
> > +       GATE(MT7621_CLK_UART3, "uart3", "50m", BIT(21)),
> > +       GATE(MT7621_CLK_ETH, "eth", "50m", BIT(23)),
> > +       GATE(MT7621_CLK_PCIE0, "pcie0", "125m", BIT(24)),
> > +       GATE(MT7621_CLK_PCIE1, "pcie1", "125m", BIT(25)),
> > +       GATE(MT7621_CLK_PCIE2, "pcie2", "125m", BIT(26)),
> > +       GATE(MT7621_CLK_CRYPTO, "crypto", "250m", BIT(29)),
> > +       GATE(MT7621_CLK_SHXC, "shxc", "50m", BIT(30))
> > +};
> > +
> > +static inline struct mt7621_gate *to_mt7621_gate(struct clk_hw *hw)
> > +{
> > +       return container_of(hw, struct mt7621_gate, hw);
> > +}
> > +
> > +static int mt7621_gate_enable(struct clk_hw *hw)
> > +{
> > +       struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
> > +       struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
> > +
> > +       return regmap_update_bits(scon, SYSC_REG_CLKCFG1,
> > +                                 clk_gate->bit_idx, clk_gate->bit_idx);
> > +}
> > +
> > +static void mt7621_gate_disable(struct clk_hw *hw)
> > +{
> > +       struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
> > +       struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
> > +
> > +       regmap_update_bits(scon, SYSC_REG_CLKCFG1, clk_gate->bit_idx, 0);
> > +}
> > +
> > +static int mt7621_gate_is_enabled(struct clk_hw *hw)
> > +{
> > +       struct mt7621_gate *clk_gate = to_mt7621_gate(hw);
> > +       struct regmap *scon = clk_gate->clk_prov->syscon_regmap;
> > +       unsigned int val;
> > +
> > +       if (regmap_read(scon, SYSC_REG_CLKCFG1, &val))
> > +               return 0;
> > +
> > +       return val & clk_gate->bit_idx;
> > +}
> > +
> > +static const struct clk_ops mt7621_gate_ops = {
> > +       .enable = mt7621_gate_enable,
> > +       .disable = mt7621_gate_disable,
> > +       .is_enabled = mt7621_gate_is_enabled,
> > +};
> > +
> > +static int mt7621_gate_ops_init(struct device_node *np,
> > +                                struct mt7621_gate *sclk)
> > +{
> > +       struct clk_init_data init = {
> > +               .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>
> Why ignore unused? Are they CLK_IS_CRITICAL? Can they be enabled at
> driver probe instead of here? Or left out of the kernel entirely if they
> shouldn't be turned off?

Because all the platform drivers are not changed to use this gates yet
and all gates are enabled by default (related registers are set to all
ones),  kernel disables all the stuff because they are not being
referenced, but yes, you are right, I think I can call
clk_prepare_enable for all of them at init time and avoid this
'CLK_IGNORE_UNUSED' flag to don't break anything of the current other
upstream code.

>
> > +               .num_parents = 1,
> > +               .parent_names = &sclk->parent_name,
> > +               .ops = &mt7621_gate_ops,
> > +               .name = sclk->name,
> > +       };
> > +
> > +       sclk->hw.init = &init;
> > +       return of_clk_hw_register(np, &sclk->hw);
> > +}
> > +
> > +static int mt7621_register_gates(struct mt7621_clk_provider *clk_prov)
> > +{
> > +       struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
>
> Why do we take a pointer of a pointer.

Yep, totally true, this double pointer is not really needed here :).

>
> > +       struct clk_hw **hws = (*clk_data)->hws;
>
> And then deref that pointer?

Yes, I will change to use clk_data as a normal pointer and not a double one.

>
> > +       int ret, i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(mt7621_gates); i++) {
> > +               struct mt7621_gate *sclk = &mt7621_gates[i];
> > +
> > +               sclk->clk_prov = clk_prov;
> > +               ret = mt7621_gate_ops_init(clk_prov->node, sclk);
> > +               if (ret) {
> > +                       pr_err("Couldn't register clock %s\n", sclk->name);
> > +                       goto err_clk_unreg;
> > +               }
> > +
> > +               hws[sclk->idx] = &sclk->hw;
> > +               (*clk_data)->num++;
>
> Just use the pointer?

Will be changed.

>
> > +       }
> > +
> > +       return 0;
> > +
> > +err_clk_unreg:
> > +       while (--i >= 0) {
> > +               struct mt7621_gate *sclk = &mt7621_gates[i];
> > +
> > +               clk_hw_unregister(&sclk->hw);
> > +       }
> > +       return ret;
> > +}
> > +
> > +#define FIXED(_id, _name, _pname, _rate)        \
> > +       {                                       \
> > +               .idx            = _id,          \
> > +               .name           = _name,        \
> > +               .parent_name    = _pname,       \
> > +               .clk_prov       = NULL,         \
>
> This can be dropped as NULL is the default.
>
> > +               .rate           = _rate         \
> > +       }
> > +
> > +static struct mt7621_fixed_clk mt7621_fixed_clks[] = {
> > +       FIXED(MT7621_CLK_50M, "50m", "xtal", MHZ(50)),
> > +       FIXED(MT7621_CLK_125M, "125m", "xtal", MHZ(125)),
> > +       FIXED(MT7621_CLK_150M, "150m", "xtal", MHZ(150)),
> > +       FIXED(MT7621_CLK_250M, "250m", "xtal", MHZ(250)),
> > +       FIXED(MT7621_CLK_270M, "270m", "xtal", MHZ(270)),
>
> parent is always "xtal" so maybe just hardcode that?

True, will hardcode this in the macro then.

>
> > +};
> > +
> > +static int mt7621_register_fixed_clocks(struct mt7621_clk_provider *clk_prov)
> > +{
> > +       struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
> > +       struct clk_hw **hws = (*clk_data)->hws;
> > +       int ret, i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
> > +               struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
> > +
> > +               sclk->clk_prov = clk_prov;
> > +               sclk->hw = clk_hw_register_fixed_rate(NULL, sclk->name,
> > +                                                     sclk->parent_name, 0,
> > +                                                     sclk->rate);
> > +               if (IS_ERR(sclk->hw)) {
> > +                       pr_err("Couldn't register clock %s\n", sclk->name);
> > +                       ret = PTR_ERR(sclk->hw);
> > +                       goto err_clk_unreg;
> > +               }
> > +
> > +               hws[sclk->idx] = sclk->hw;
> > +               (*clk_data)->num++;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_clk_unreg:
> > +       while (--i >= 0) {
> > +               struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
> > +
> > +               clk_hw_unregister_fixed_rate(sclk->hw);
> > +       }
> > +       return ret;
> > +}
> > +
> > +static inline struct mt7621_clk *to_mt7621_clk(struct clk_hw *hw)
> > +{
> > +       return container_of(hw, struct mt7621_clk, hw);
> > +}
> > +
> > +static unsigned long mt7621_xtal_recalc_rate(struct clk_hw *hw,
> > +                                            unsigned long parent_rate)
> > +{
> > +       struct mt7621_clk *clk = to_mt7621_clk(hw);
> > +       struct regmap *scon = clk->clk_prov->syscon_regmap;
> > +       u32 val;
> > +
> > +       regmap_read(scon, SYSC_REG_SYSTEM_CONFIG0, &val);
> > +       val = (val >> XTAL_MODE_SEL_SHIFT) & XTAL_MODE_SEL_MASK;
> > +
> > +       if (val <= 2)
> > +               return MHZ(20);
> > +       else if (val <= 5)
>
> Replace with 'if' because it returns above.

True, good catch.

>
> > +               return MHZ(40);
> > +
> > +       return MHZ(25);
> > +}
> > +
> > +static unsigned long mt7621_cpu_recalc_rate(struct clk_hw *hw,
> > +                                           unsigned long xtal_clk)
> > +{
> > +       static const u32 prediv_tbl[] = { 0, 1, 2, 2 };
> > +       struct mt7621_clk *clk = to_mt7621_clk(hw);
> > +       struct regmap *scon = clk->clk_prov->syscon_regmap;
> > +       u32 clkcfg, clk_sel, curclk, ffiv, ffrac;
> > +       u32 pll, prediv, fbdiv;
> > +       unsigned long cpu_clk;
> > +
> > +       regmap_read(scon, SYSC_REG_CLKCFG0, &clkcfg);
> > +       clk_sel = (clkcfg >> CPU_CLK_SEL_SHIFT) & CPU_CLK_SEL_MASK;
> > +
> > +       regmap_read(scon, SYSC_REG_CUR_CLK_STS, &curclk);
> > +       ffiv = (curclk >> CUR_CPU_FDIV_SHIFT) & CUR_CPU_FDIV_MASK;
> > +       ffrac = (curclk >> CUR_CPU_FFRAC_SHIFT) & CUR_CPU_FFRAC_MASK;
> > +
> > +       switch (clk_sel) {
> > +       case 0:
> > +               cpu_clk = MHZ(500);
> > +               break;
> > +       case 1:
> > +               pll = rt_memc_r32(MEMC_REG_CPU_PLL);
> > +               fbdiv = (pll >> CPU_PLL_FBDIV_SHIFT) & CPU_PLL_FBDIV_MASK;
> > +               prediv = (pll >> CPU_PLL_PREDIV_SHIFT) & CPU_PLL_PREDIV_MASK;
> > +               cpu_clk = ((fbdiv + 1) * xtal_clk) >> prediv_tbl[prediv];
> > +               break;
> > +       default:
> > +               cpu_clk = xtal_clk;
> > +       }
> > +
> > +       return cpu_clk / ffiv * ffrac;
> > +}
> > +
> > +static unsigned long mt7621_bus_recalc_rate(struct clk_hw *hw,
> > +                                           unsigned long parent_rate)
> > +{
> > +       return parent_rate / 4;
> > +}
> > +
> > +#define CLK_BASE(_name, _parent, _recalc) {                            \
> > +       .init = &(struct clk_init_data) {                               \
> > +               .name = _name,                                          \
> > +               .ops = &(const struct clk_ops) {                        \
> > +                       .recalc_rate = _recalc,                         \
> > +               },                                                      \
> > +               .parent_names = (const char *const[]) { _parent },      \
>
> Please use clk_parent_data instead

parent can also be NULL here and num_parents zero, but I will search
what do you really mean with this 'clk_parent_data' :).

>
> > +               .num_parents = _parent ? 1 : 0                          \
> > +       },                                                              \
> > +}
> > +
> > +static struct mt7621_clk mt7621_clks_base[] = {
> > +       { NULL, CLK_BASE("xtal", NULL, mt7621_xtal_recalc_rate) },
> > +       { NULL, CLK_BASE("cpu", "xtal", mt7621_cpu_recalc_rate) },
> > +       { NULL, CLK_BASE("bus", "cpu", mt7621_bus_recalc_rate) },
> > +};
> > +
> > +static int mt7621_register_top_clocks(struct mt7621_clk_provider *clk_prov)
> > +{
> > +       struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
> > +       struct clk_hw **hws = (*clk_data)->hws;
> > +       int ret, i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
> > +               struct mt7621_clk *sclk = &mt7621_clks_base[i];
> > +
> > +               sclk->clk_prov = clk_prov;
> > +               ret = of_clk_hw_register(clk_prov->node, &sclk->hw);
> > +               if (ret) {
> > +                       pr_err("Couldn't register top clock %i\n", i);
> > +                       goto err_clk_unreg;
> > +               }
> > +
> > +               hws[i] = &sclk->hw;
> > +               (*clk_data)->num++;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_clk_unreg:
> > +       while (--i >= 0) {
> > +               struct mt7621_clk *sclk = &mt7621_clks_base[i];
> > +
> > +               clk_hw_unregister(&sclk->hw);
> > +       }
> > +       return ret;
> > +}
> > +
> > +static void __init mt7621_clk_init(struct device_node *node)
> > +{
> > +       struct mt7621_clk_provider *clk_prov;
> > +       struct clk_hw_onecell_data **clk_data;
> > +       int i, ret, count;
> > +
> > +       clk_prov = kzalloc(sizeof(*clk_prov), GFP_KERNEL);
> > +       if (!clk_prov)
> > +               return;
> > +
> > +       clk_prov->syscon_regmap = syscon_node_to_regmap(node->parent);
> > +       if (IS_ERR(clk_prov->syscon_regmap)) {
> > +               pr_err("Could not get syscon regmap\n");
> > +               goto free_clk_prov;
> > +       }
> > +
> > +       clk_prov->node = node;
> > +
> > +       clk_data = &clk_prov->clk_data;
> > +       count = ARRAY_SIZE(mt7621_clks_base) +
> > +               ARRAY_SIZE(mt7621_fixed_clks) + ARRAY_SIZE(mt7621_gates);
> > +       *clk_data = kzalloc(struct_size(*clk_data, hws, count), GFP_KERNEL);
> > +       if (!*clk_data)
> > +               goto free_clk_prov;
> > +
> > +       ret = mt7621_register_top_clocks(clk_prov);
> > +       if (ret) {
> > +               pr_err("Couldn't register top clocks\n");
> > +               goto free_clk_data;
> > +       }
> > +
> > +       ret = mt7621_register_fixed_clocks(clk_prov);
> > +       if (ret) {
> > +               pr_err("Couldn't register fixed clocks\n");
> > +               goto unreg_clk_top;
> > +       }
> > +
> > +       ret = mt7621_register_gates(clk_prov);
> > +       if (ret) {
> > +               pr_err("Couldn't register fixed clock gates\n");
> > +               goto unreg_clk_fixed;
> > +       }
> > +
> > +       ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> > +                                    clk_prov->clk_data);
> > +       if (ret) {
> > +               pr_err("Couldn't add clk hw provider\n");
> > +               goto unreg_clk_gates;
> > +       }
> > +
> > +       return;
> > +
> > +unreg_clk_gates:
> > +       for (i = 0; i < ARRAY_SIZE(mt7621_gates); i++) {
> > +               struct mt7621_gate *sclk = &mt7621_gates[i];
> > +
> > +               clk_hw_unregister(&sclk->hw);
> > +       }
> > +
> > +unreg_clk_fixed:
> > +       for (i = 0; i < ARRAY_SIZE(mt7621_fixed_clks); i++) {
> > +               struct mt7621_fixed_clk *sclk = &mt7621_fixed_clks[i];
> > +
> > +               clk_hw_unregister_fixed_rate(sclk->hw);
> > +       }
> > +
> > +unreg_clk_top:
> > +       for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
> > +               struct mt7621_clk *sclk = &mt7621_clks_base[i];
> > +
> > +               clk_hw_unregister(&sclk->hw);
> > +       }
> > +
> > +free_clk_data:
> > +       kfree(clk_prov->clk_data);
> > +
> > +free_clk_prov:
> > +       kfree(clk_prov);
> > +}
> > +
> > +CLK_OF_DECLARE(mt7621_clk, "mediatek,mt7621-clk", mt7621_clk_init);
>
> Any reason to use this vs. a platform driver?

We need clocks available in 'plat_time_init' before setting up the
timer for the GIC, so to maintain all the clock driver in a simple
file and using only one device tree node and no separate the gates
into another platform driver, I think this is the only way to go, but
please correct me if I am wrong.

> > +
> > +MODULE_AUTHOR("Sergio Paracuellos <sergio.paracuellos@gmail.com>");
> > +MODULE_DESCRIPTION("Mediatek Mt7621 clock driver");
> > +MODULE_LICENSE("GPL v2");
>
> It isn't a module, but it would be nice if it was one. If the Kconfig is
> bool these shouldn't be here.

Ok, totally agree I will remove these.

Thanks again for your review. I will ger rid of all the stuff here and send v5.

Best regards,
    Sergio Paracuellos
