Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D665378102B
	for <lists+linux-mips@lfdr.de>; Fri, 18 Aug 2023 18:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378446AbjHRQTs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Aug 2023 12:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378572AbjHRQTl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Aug 2023 12:19:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D16A30F1;
        Fri, 18 Aug 2023 09:19:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso1632277e87.1;
        Fri, 18 Aug 2023 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692375577; x=1692980377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AzVUrKiX86pxuo0e8b6iQfkElIiRNho6c4ah9Di8lF0=;
        b=n+gBmPgElK6K2v8m/Vnfo5IBeClZZFEELdUtjazst9daIy9Pnt9Fa/TjLgRAypO90x
         Nda2fg2BwTdHefx4Z2+C7jQKArcmwWYkdOQsjm86BE9hFrygc4F0Weu4Rfg2UfmoOKhh
         QkZ0biZ1yanCIn3+7oOArFY5oPKffw3YYeUqmyu/+++N8H9IMQymI4qrfbSn4MWrh17k
         g9NzXIxmLXbFvkdK0rqrPJh3Yngq8Ga4urrGJybLkcuJ5Kb2G6fizQ4eyiFp9K0JqQH4
         aLYxGlu4/V8z0OKYtTEv54jeCUHG5Exi7y29lFCgY/0jbtIRVZ2C8z+7rVaI8HtygTcS
         65Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692375577; x=1692980377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzVUrKiX86pxuo0e8b6iQfkElIiRNho6c4ah9Di8lF0=;
        b=ZQBA5DQ8sNlvvmYcgFHNXPcXFopBWHnqxz+B0OQe+1KZCUPAZedyml35l9TRj4tpMT
         HS75zwmfC6ZpTbdW83Q9fsCEllz6DsKO7lYElDftrF55JVFkMmwVB8Yubr0MhuPkH1aF
         XSRY54geAr8rjpLl6PlBr4Mvktlvh2KUjF6aae72FOaIMeLkzfAZoj39YyzeJI3QPzvI
         nFpuCb63mzaRkafIJ6/hTQQmklFkNZwT2dlyUyksHBB8s1baTTK5cM7b19f25uclB7Z8
         1K5RG8OeGMQTQsLoh0j3JV4B6Fxh3QEhd878TufkZZb5fFuC56mNCrQyDdFUs3LQhj/T
         jE1g==
X-Gm-Message-State: AOJu0YwaW6XFPZZ7IXq+j+CCUslNDgnfbfVGGUBdcMgRmUfPESS4XWb7
        4RuOJcwML8EjygeewbbR6zf+BAZXTfp3Ig==
X-Google-Smtp-Source: AGHT+IFDnNyuWQJpMntmfPCGlOUzt3Psqa7e0+oBL1FAxpb4TrPyiHbRScAL3ekkV+nMv0isrWFMOQ==
X-Received: by 2002:a05:6512:23a5:b0:4f8:70b8:12b1 with SMTP id c37-20020a05651223a500b004f870b812b1mr2789401lfv.4.1692375576308;
        Fri, 18 Aug 2023 09:19:36 -0700 (PDT)
Received: from mobilestation ([93.157.254.210])
        by smtp.gmail.com with ESMTPSA id u18-20020ac248b2000000b004fdd6c37e9asm406167lfg.112.2023.08.18.09.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 09:19:35 -0700 (PDT)
Date:   Fri, 18 Aug 2023 19:19:33 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 4/5] net: stmmac: Add glue layer for Loongson-1 SoC
Message-ID: <l6dr3cvnldmljhafmu5wdal7yr4mkr4mmplt3nivjhejohmlro@blfa2ntsq6uv>
References: <20230812151135.1028780-1-keguang.zhang@gmail.com>
 <20230812151135.1028780-5-keguang.zhang@gmail.com>
 <spt2blizwad4tdp4cjf7bzffd3mr6456nlz4c4vgjrblx34gqj@bkwhyeqph4do>
 <CAJhJPsXHuMBAHqsg5rSVf5Ow_Rsgy2Zp-PNrLXWTeVSY3N08Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsXHuMBAHqsg5rSVf5Ow_Rsgy2Zp-PNrLXWTeVSY3N08Aw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 18, 2023 at 08:37:27PM +0800, Keguang Zhang wrote:
> On Wed, Aug 16, 2023 at 9:30 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> >
> > On Sat, Aug 12, 2023 at 11:11:34PM +0800, Keguang Zhang wrote:
> > > This glue driver is created based on the arch-code
> > > implemented earlier with the platform-specific settings.
> > >
> > > Use syscon for SYSCON register access.
> > >
> > > Partialy based on the previous work by Serge Semin.
> > >
> > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
> > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> > >  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 257 ++++++++++++++++++
> > >  3 files changed, 269 insertions(+)
> > >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > index 06c6871f8788..a2b9e289aa36 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > @@ -239,6 +239,17 @@ config DWMAC_INTEL_PLAT
> > >         the stmmac device driver. This driver is used for the Intel Keem Bay
> > >         SoC.
> > >
> > > +config DWMAC_LOONGSON1
> > > +     tristate "Loongson1 GMAC support"
> > > +     default MACH_LOONGSON32
> > > +     depends on OF && (MACH_LOONGSON32 || COMPILE_TEST)
> > > +     help
> > > +       Support for ethernet controller on Loongson1 SoC.
> > > +
> > > +       This selects Loongson1 SoC glue layer support for the stmmac
> > > +       device driver. This driver is used for Loongson1-based boards
> > > +       like Loongson LS1B/LS1C.
> > > +
> > >  config DWMAC_TEGRA
> > >       tristate "NVIDIA Tegra MGBE support"
> > >       depends on ARCH_TEGRA || COMPILE_TEST
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > index 5b57aee19267..80e598bd4255 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > @@ -29,6 +29,7 @@ obj-$(CONFIG_DWMAC_SUNXI)   += dwmac-sunxi.o
> > >  obj-$(CONFIG_DWMAC_SUN8I)    += dwmac-sun8i.o
> > >  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)      += dwmac-dwc-qos-eth.o
> > >  obj-$(CONFIG_DWMAC_INTEL_PLAT)       += dwmac-intel-plat.o
> > > +obj-$(CONFIG_DWMAC_LOONGSON1)        += dwmac-loongson1.o
> > >  obj-$(CONFIG_DWMAC_GENERIC)  += dwmac-generic.o
> > >  obj-$(CONFIG_DWMAC_IMX8)     += dwmac-imx.o
> > >  obj-$(CONFIG_DWMAC_TEGRA)    += dwmac-tegra.o
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> > > new file mode 100644
> > > index 000000000000..368d6cd2cb78
> > > --- /dev/null
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> > > @@ -0,0 +1,257 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Loongson-1 DWMAC glue layer
> > > + *
> > > + * Copyright (C) 2011-2023 Keguang Zhang <keguang.zhang@gmail.com>
> > > + */
> > > +
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/phy.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include "stmmac.h"
> > > +#include "stmmac_platform.h"
> > > +
> > > +/* Loongson-1 SYSCON Registers */
> > > +#define LS1X_SYSCON0         (0x0)
> > > +#define LS1X_SYSCON1         (0x4)
> > > +
> > > +struct ls1x_dwmac_syscon {
> > > +     const struct reg_field *reg_fields;
> > > +     unsigned int nr_reg_fields;
> > > +     int (*syscon_init)(struct plat_stmmacenet_data *plat);
> > > +};
> > > +
> > > +struct ls1x_dwmac {
> > > +     struct device *dev;
> > > +     struct plat_stmmacenet_data *plat_dat;
> > > +     const struct ls1x_dwmac_syscon *syscon;
> > > +     struct regmap *regmap;
> > > +     struct regmap_field *regmap_fields[];
> > > +};
> > > +
> > > +enum ls1b_dwmac_syscon_regfield {
> > > +     GMAC1_USE_UART1,
> > > +     GMAC1_USE_UART0,
> > > +     GMAC1_SHUT,
> > > +     GMAC0_SHUT,
> > > +     GMAC1_USE_TXCLK,
> > > +     GMAC0_USE_TXCLK,
> > > +     GMAC1_USE_PWM23,
> > > +     GMAC0_USE_PWM01,
> > > +};
> > > +
> > > +enum ls1c_dwmac_syscon_regfield {
> > > +     GMAC_SHUT,
> > > +     PHY_INTF_SELI,
> > > +};
> > > +
> > > +const struct reg_field ls1b_dwmac_syscon_regfields[] = {
> > > +     [GMAC1_USE_UART1]       = REG_FIELD(LS1X_SYSCON0, 4, 4),
> > > +     [GMAC1_USE_UART0]       = REG_FIELD(LS1X_SYSCON0, 3, 3),
> > > +     [GMAC1_SHUT]            = REG_FIELD(LS1X_SYSCON1, 13, 13),
> > > +     [GMAC0_SHUT]            = REG_FIELD(LS1X_SYSCON1, 12, 12),
> > > +     [GMAC1_USE_TXCLK]       = REG_FIELD(LS1X_SYSCON1, 3, 3),
> > > +     [GMAC0_USE_TXCLK]       = REG_FIELD(LS1X_SYSCON1, 2, 2),
> > > +     [GMAC1_USE_PWM23]       = REG_FIELD(LS1X_SYSCON1, 1, 1),
> > > +     [GMAC0_USE_PWM01]       = REG_FIELD(LS1X_SYSCON1, 0, 0)
> > > +};
> > > +
> > > +const struct reg_field ls1c_dwmac_syscon_regfields[] = {
> > > +     [GMAC_SHUT]             = REG_FIELD(LS1X_SYSCON0, 6, 6),
> > > +     [PHY_INTF_SELI]         = REG_FIELD(LS1X_SYSCON1, 28, 30)
> > > +};
> >
> > Emm, using regmap fields looks so over-complicated in this case seeing
> > you only need to set/clear several bits in the syscon. What about
> > defining macros with the particular flag as it's already done in the
> > "asm/mach-loongson32/regs-mux.h" file and using regmap_update_bits()?
> >

> To use regmap_update_bits(), I have to store and pass reg_offset and
> mask, which is similar to the definition of regmap fields.

Em, not really. And what offset are you talking about? Anyway you
don't need one. Moreover you'll be able to reduce the number of IOs:

+#define GMAC1_USE_UART1                 BIT(4)
+#define GMAC1_USE_UART0                 BIT(3)
...
+#define GMAC1_SHUT                      BIT(13)
...
+#define GMAC1_USE_TXCLK                 BIT(3)
+#define GMAC1_USE_PWM23                 BIT(1)

+static int ls1b_dwmac_syscon_init(struct plat_stmmacenet_data *plat)
+{
+	struct ls1x_dwmac *dwmac = plat->bsp_priv;
+	struct regmap *syscon = dwmac->regmap;
+
+	if (plat->bus_id) {
+		regmap_update_bits(syscon, LS1X_SYSCON0,
+				   GMAC1_USE_UART1 | GMAC1_USE_UART0,
+				   GMAC1_USE_UART1 | GMAC1_USE_UART0);
+
+		switch (plat->phy_interface) {
+		case PHY_INTERFACE_MODE_RGMII:
+			regmap_update_bits(syscon, LS1X_SYSCON1,
+					   GMAC1_USE_TXCLK | GMAC1_USE_TXCLK, 0);
+			break;
+		case PHY_INTERFACE_MODE_MII:
+			regmap_update_bits(syscon, LS1X_SYSCON1,
+					   GMAC1_USE_TXCLK | GMAC1_USE_TXCLK
+					   GMAC1_USE_TXCLK | GMAC1_USE_TXCLK);
+			break;
+		default:
+			dev_err(dwmac->dev, "Unsupported PHY mode %u\n",
+				plat->phy_interface);
+			return -EOPNOTSUPP;
+		}
+
+		regmap_field_write(syscon, LS1X_SYSCON1, GMAC1_SHUT, 0);
+	} //...
+
+	return 0;
+}

This doesn't look in anyway less readable then your implementation
but in fact simpler.

> In addition, the regmap fields are very clear and leave the trouble to
> the internal implementation.

In this case it brings much more troubles and no clarity. You need to create
an additional mainly redundant abstraction, waste memory for it,
define additional const arrays. Using it won't improve the code
readability seeing you need to set/clear a few flags only. So all of
the troubles for nothing. See the code above. It's simple and clear.
Just several regmap_update_bits().

BTW why have you chosen to define syscon instead of creating a pinctrl
driver? What if Loongson1 is embedded into a platform with, for
instance, UART0 and UART1 utilized instead of the GMAC1?

> 
> > > +
> >
> > > +static int ls1b_dwmac_syscon_init(struct plat_stmmacenet_data *plat)
> > > +{
> >
> > As I already told you this part is better to be called from the
> > plat_stmmacenet_data.fix_mac_speed() because PHY interface mode can
> > differ from one interface open cycle to another as per the phylink
> > design.
> >
> I have considered .fix_mac_speed(), which will be called every time
> the link is up, and passes the current speed.
> However, the PHY interface mode is determined by the hardware design -
> the schematic.
> In other words, once the schematic is done, the PHY interface mode is fixed.
> Therefore, PHY interface mode should be configured one time at the
> initialization.
> And the plat_stmmacenet_data.init() is the proper place to do this.

Ok. If no actual clock change is needed then indeed init() will be the
proper place.

> 
> > > +     struct ls1x_dwmac *dwmac = plat->bsp_priv;
> > > +     struct regmap_field **regmap_fields = dwmac->regmap_fields;
> > > +
> >
> > > +     if (plat->bus_id) {
> >
> > Using bus_id doesn't look correct to determine the CSRs responsible
> > for the interface mode selection because it's calculated based on the
> > DT ethernet-alias which doesn't guarantee to have a particular device
> > assigned with the alias. Alias node can be absent after all. What
> > could be better in this case is for instance to use the regs physical
> > address. Any better idea?
> >

> The purpose of alias is to bind the a particular device with a
> particular alias even some aliases are absent.
> Because of_alias_get_id() gets the alias id.
> For example, LS1B has two GMAC controllers, gmac0 and gmac1.
> I have tried the Ethernet with only one alias as follows.
>        aliases {
>                ethernet1 = &gmac1;
>        };
> In this case, plat->bus_id is still 1.
> And both gmac0 and gmac1 work.

If no alias specified? If both aliases a non zero? If the IDs are
confused? If any of these is true you are in trouble. Your code
shouldn't rely on the aliases in this case. You need to come up with a
way to certainly distinguish one MAC from another. A physical base
address is one possible option.

Note the /alias node is an informational node. It doesn't describe
devices. Just recent Krzysztof comment in a similar situation:
https://lore.kernel.org/netdev/20230814112539.70453-1-sriranjani.p@samsung.com/T/#m3972e40bd2fa323a3bdb2fbf07bde47ba6752439

Aliases are normally used by OS to for instance fix the device
enumeration (see SPI, I2C, I3C, MTD, MMC, RTC, TTY/Serial, Watchdog,
MDIO-GPIO, etc) - pre-define the device ID from the kernel or OS point
of view. In your case the IDs can't be changed. GMAC0 must be assigned
with ID0 and GMAC1 must be assigned with non-zero. Doing otherwise
will be break the interfaces functionality which isn't acceptable.

> 
> > > +             regmap_field_write(regmap_fields[GMAC1_USE_UART1], 1);
> > > +             regmap_field_write(regmap_fields[GMAC1_USE_UART0], 1);
> > > +
> > > +             switch (plat->phy_interface) {
> > > +             case PHY_INTERFACE_MODE_RGMII:
> > > +                     regmap_field_write(regmap_fields[GMAC1_USE_TXCLK], 0);
> > > +                     regmap_field_write(regmap_fields[GMAC1_USE_PWM23], 0);
> > > +                     break;
> > > +             case PHY_INTERFACE_MODE_MII:
> > > +                     regmap_field_write(regmap_fields[GMAC1_USE_TXCLK], 1);
> > > +                     regmap_field_write(regmap_fields[GMAC1_USE_PWM23], 1);
> > > +                     break;
> > > +             default:
> > > +                     dev_err(dwmac->dev, "Unsupported PHY mode %u\n",
> > > +                             plat->phy_interface);
> > > +                     return -EOPNOTSUPP;
> > > +             }
> > > +
> > > +             regmap_field_write(regmap_fields[GMAC1_SHUT], 0);
> > > +     } else {
> > > +             switch (plat->phy_interface) {
> > > +             case PHY_INTERFACE_MODE_RGMII:
> > > +                     regmap_field_write(regmap_fields[GMAC0_USE_TXCLK], 0);
> > > +                     regmap_field_write(regmap_fields[GMAC0_USE_PWM01], 0);
> > > +                     break;
> > > +             case PHY_INTERFACE_MODE_MII:
> > > +                     regmap_field_write(regmap_fields[GMAC0_USE_TXCLK], 1);
> > > +                     regmap_field_write(regmap_fields[GMAC0_USE_PWM01], 1);
> > > +                     break;
> > > +             default:
> > > +                     dev_err(dwmac->dev, "Unsupported PHY mode %u\n",
> > > +                             plat->phy_interface);
> > > +                     return -EOPNOTSUPP;
> > > +             }
> > > +
> > > +             regmap_field_write(regmap_fields[GMAC0_SHUT], 0);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int ls1c_dwmac_syscon_init(struct plat_stmmacenet_data *plat)
> > > +{
> > > +     struct ls1x_dwmac *dwmac = plat->bsp_priv;
> > > +     struct regmap_field **regmap_fields = dwmac->regmap_fields;
> > > +
> > > +     if (plat->phy_interface == PHY_INTERFACE_MODE_RMII) {
> > > +             regmap_field_write(regmap_fields[PHY_INTF_SELI], 0x4);
> > > +     } else {
> > > +             dev_err(dwmac->dev, "Unsupported PHY-mode %u\n",
> > > +                     plat->phy_interface);
> > > +             return -EOPNOTSUPP;
> > > +     }
> > > +
> > > +     regmap_field_write(regmap_fields[GMAC_SHUT], 0);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct ls1x_dwmac_syscon ls1b_dwmac_syscon = {
> > > +     .reg_fields = ls1b_dwmac_syscon_regfields,
> > > +     .nr_reg_fields = ARRAY_SIZE(ls1b_dwmac_syscon_regfields),
> > > +     .syscon_init = ls1b_dwmac_syscon_init,
> > > +};
> > > +
> > > +static const struct ls1x_dwmac_syscon ls1c_dwmac_syscon = {
> > > +     .reg_fields = ls1c_dwmac_syscon_regfields,
> > > +     .nr_reg_fields = ARRAY_SIZE(ls1c_dwmac_syscon_regfields),
> > > +     .syscon_init = ls1c_dwmac_syscon_init,
> > > +};
> > > +
> > > +static int ls1x_dwmac_init(struct platform_device *pdev, void *priv)
> > > +{
> > > +     struct ls1x_dwmac *dwmac = priv;
> > > +     int ret;
> > > +
> >
> > > +     ret = devm_regmap_field_bulk_alloc(dwmac->dev, dwmac->regmap,
> > > +                                        dwmac->regmap_fields,
> > > +                                        dwmac->syscon->reg_fields,
> > > +                                        dwmac->syscon->nr_reg_fields);
> >
> > Please see my first comment about this.
> >
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (dwmac->syscon->syscon_init) {
> > > +             ret = dwmac->syscon->syscon_init(dwmac->plat_dat);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static const struct of_device_id ls1x_dwmac_syscon_match[] = {
> > > +     { .compatible = "loongson,ls1b-syscon", .data = &ls1b_dwmac_syscon },
> > > +     { .compatible = "loongson,ls1c-syscon", .data = &ls1c_dwmac_syscon },
> > > +     { }
> > > +};
> > > +
> > > +static int ls1x_dwmac_probe(struct platform_device *pdev)
> > > +{
> > > +     struct plat_stmmacenet_data *plat_dat;
> > > +     struct stmmac_resources stmmac_res;
> > > +     struct device_node *syscon_np;
> > > +     const struct of_device_id *match;
> > > +     struct regmap *regmap;
> > > +     struct ls1x_dwmac *dwmac;
> > > +     const struct ls1x_dwmac_syscon *syscon;
> > > +     size_t size;
> > > +     int ret;
> > > +
> > > +     ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > > +     if (ret)
> > > +             return ret;
> > > +
> >
> > > +     /* Probe syscon */
> > > +     syscon_np = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
> >
> > it's vendor-specific property so it is supposed to have a
> > vendor-specific prefix and possibly ls1-specific name.
> >
> This has been fixed in v2.
> Could you please review v2?
> Thanks!
> 
> > > +     if (!syscon_np)
> > > +             return -ENODEV;
> > > +
> > > +     match = of_match_node(ls1x_dwmac_syscon_match, syscon_np);
> > > +     if (!match) {
> > > +             of_node_put(syscon_np);
> > > +             return -EINVAL;
> > > +     }
> > > +     syscon = (const struct ls1x_dwmac_syscon *)match->data;
> > > +
> > > +     regmap = syscon_node_to_regmap(syscon_np);
> > > +     of_node_put(syscon_np);
> > > +     if (IS_ERR(regmap)) {
> > > +             ret = PTR_ERR(regmap);
> > > +             dev_err(&pdev->dev, "Unable to map syscon: %d\n", ret);
> > > +             return ret;
> > > +     }
> >
> > or you can use syscon_regmap_lookup_by_phandle(). Using
> > of_match_node() doesn't seem necessary since it's unlikely to have
> > moee than one system controller available on the LS1b or LS1c chips.
> >

> I planned to use syscon_regmap_lookup_by_phandle().
> Thus the compatible
> "loongson,ls1b-dwmac-syscon"/"loongson,ls1c-dwmac-syscon" would become
> useless.
> I'm not sure about this.

The compatible strings should be left despite of the
syscon_regmap_lookup_by_phandle() usage. But again "dwmac" suffix is
redundant. Based on the CSRs definition in regs-mux.h, selecting
(G)MAC pins mode is only a small part of the Loongson1 SoC system
controllers functionality.
"loongson,ls1b-syscon"/"loongson,ls1c-syscon" looks more appropriate.

-Serge(y)

> 
> > > +
> > > +     size = syscon->nr_reg_fields * sizeof(struct regmap_field *);
> > > +     dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac) + size, GFP_KERNEL);
> > > +     if (!dwmac)
> > > +             return -ENOMEM;
> > > +
> > > +     plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > > +     if (IS_ERR(plat_dat)) {
> > > +             dev_err(&pdev->dev, "dt configuration failed\n");
> > > +             return PTR_ERR(plat_dat);
> > > +     }
> > > +
> > > +     plat_dat->bsp_priv = dwmac;
> > > +     plat_dat->init = ls1x_dwmac_init;
> > > +     dwmac->dev = &pdev->dev;
> > > +     dwmac->plat_dat = plat_dat;
> > > +     dwmac->syscon = syscon;
> > > +     dwmac->regmap = regmap;
> > > +
> > > +     ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> > > +     if (ret)
> > > +             goto err_remove_config_dt;
> > > +
> > > +     return 0;
> > > +
> > > +err_remove_config_dt:
> >
> > > +     if (pdev->dev.of_node)
> >
> > Is this conditional statement necessary here?
> >
> You're right.
> Will remove this condition in next version.
> Thanks!
> 
> > -Serge
> >
> > > +             stmmac_remove_config_dt(pdev, plat_dat);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static const struct of_device_id ls1x_dwmac_match[] = {
> > > +     { .compatible = "loongson,ls1b-dwmac" },
> > > +     { .compatible = "loongson,ls1c-dwmac" },
> > > +     { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, ls1x_dwmac_match);
> > > +
> > > +static struct platform_driver ls1x_dwmac_driver = {
> > > +     .probe = ls1x_dwmac_probe,
> > > +     .remove_new = stmmac_pltfr_remove,
> > > +     .driver = {
> > > +             .name = "loongson1-dwmac",
> > > +             .of_match_table = ls1x_dwmac_match,
> > > +     },
> > > +};
> > > +module_platform_driver(ls1x_dwmac_driver);
> > > +
> > > +MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
> > > +MODULE_DESCRIPTION("Loongson1 DWMAC glue layer");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.39.2
> > >
> 
> 
> 
> --
> Best regards,
> 
> Keguang Zhang
