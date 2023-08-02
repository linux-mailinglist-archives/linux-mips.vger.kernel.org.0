Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C6076CBCA
	for <lists+linux-mips@lfdr.de>; Wed,  2 Aug 2023 13:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjHBLbV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Aug 2023 07:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjHBLbT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Aug 2023 07:31:19 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF72C211E;
        Wed,  2 Aug 2023 04:31:17 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so11199893e87.0;
        Wed, 02 Aug 2023 04:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690975876; x=1691580676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjAosaNxAoi2BWTYkDtymKlr5h9XTvGfmHv3GlC/6i0=;
        b=hfm8YK6JR2hNijQyEEkA99WB9yYHPJgqpVsbI9C/WM14PxBeB4R+QnPaQYPxVYm8nR
         J3Qw+ZvSeeAsUgs7GGs/24vCciz5Yl74mFV7JAT4e/KWrxTGom1xG7pdUFK+/D563if5
         aAkwFVpNVs+r+irwLPjPQPGvIDrj/gjZB8Nip9xmOoM983f345i6XtketbIQjW2jS4Jl
         eacfHcWhKdDTyCZp4DklhalslHVJJVzQEPmGQ1Zf1VVQIgrtbWEnA/A9ZWHw8Cri6NbZ
         5sa/hGzRccS7fKOxlFvntIIApaQW8ICTWXpsrIa4NK09mnti/avvUtleGKxj/nOj0rHX
         yzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690975876; x=1691580676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjAosaNxAoi2BWTYkDtymKlr5h9XTvGfmHv3GlC/6i0=;
        b=WdGYxPbo/vNi5jyXglEAeyN5cZOoH8uu6tUzLfnQe/NtBHjUyxuQI48/8/CS/0U8+m
         1i0uO3ElIHHeJAFOEdlJj0oa0nLFXGjn5p5L3g4offcVFyxBEM+8f9ELWUGbTWzmpIyI
         JUUTUGe039PdkeAefThqMDM3qhMdaGOOm89Yn5XjrmQWEsv5E/l6oaUW2S+CZhhmlu6C
         3HBJ8lJ3mRBQXbybKUK0TsQiLg8o2fxREqkHbwZyqaYWO+71bybzyhuDFWYm1gYhSwqr
         iQVxk/VEjpdboshAU4ekOBx/BGzDHbsQMgS90vasJXstUuBiA2EYNJFiGmQ/cdlcJVen
         zzIQ==
X-Gm-Message-State: ABy/qLbn/+LizbjYlWxIV+oU1s8xIhtB1b3A6edxlTTyPbYAyhpFDTY3
        Z3LMmxcuvGnXQG2uEy8cY3DPkEtCyP+1N8Mma7g=
X-Google-Smtp-Source: APBJJlHoe9Tvo8oe+ytXHVsZIr8zXSQ+BLbhyvQG26Poi2319pJ97wo81XynGNh6KJ18wDUKTZXZgCM/zjcXI0xyBqs=
X-Received: by 2002:ac2:4da1:0:b0:4fe:8c4:44f4 with SMTP id
 h1-20020ac24da1000000b004fe08c444f4mr4442153lfe.62.1690975875725; Wed, 02 Aug
 2023 04:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230729134318.1694467-1-keguang.zhang@gmail.com>
 <20230729134318.1694467-9-keguang.zhang@gmail.com> <4qk22kycanwwbx6e7w4uuf7y5re7y4voi5vdurq3usa27py2zk@zms25h4hg2da>
 <CAJhJPsV9E5=GtsjiP8c3A6=4=Vh7cB1g=TaaJnVOjCf=VFiLUA@mail.gmail.com> <ZMowbm9n1PuQhPLt@rc20>
In-Reply-To: <ZMowbm9n1PuQhPLt@rc20>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Wed, 2 Aug 2023 19:30:59 +0800
Message-ID: <CAJhJPsVL8M0nO0rxQF+Jzf5Nt6q6wED9jEfws07wYs94WLS9bw@mail.gmail.com>
Subject: Re: [PATCH 08/17] MIPS: loongson32: Convert Ethernet platform device
 to DT
To:     Du Huanpeng <dhu@hodcarrier.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 2, 2023 at 6:31=E2=80=AFPM Du Huanpeng <dhu@hodcarrier.org> wro=
te:
>
> On Wed, Aug 02, 2023 at 11:10:10AM +0800, Keguang Zhang wrote:
> > On Wed, Aug 2, 2023 at 2:21=E2=80=AFAM Serge Semin <fancer.lancer@gmail=
.com> wrote:
> > >
> > > On Sat, Jul 29, 2023 at 09:43:09PM +0800, Keguang Zhang wrote:
> > > > Add Ethernet device nodes for Loongson-1 boards,
> > > > and drop the legacy platform devices and data accordingly.
> > >
> > > It seems to me that your conversion breaks the RGMII mode support.
> > > What you need to do is to make sure that the respective flags are set
> > > in the MUX space.
> > >
> > > Regarding the MUX-space. It looks as a pinctrl-setting space. If so
> > > adding the new pinctrl driver will be required. Otherwise it can be
> > > defined as a syscon-node and then utilized in the Loongson-1 GMAC
> > > low-level driver.
> > >
> > Thanks for your reminder.
> > I planned to add the pinctrl driver later.
> > Now I'm working on it.
> hi, I wrote a tool(work-in-progress) for generating pinctrl driver,
> do you want to try, and avoid duplicate work.

A tool for generating pinctrl driver?
Could you share it?
Perhaps you could submit your driver when it is done.
Thanks!

> and could you merge my ls1c300 devicetree for u-boot, because
> u-boot wants to keep the devicetree sync with the linux kernel.
> some nodes needed and working are not exist in your devicetree.
>
> [1] https://github.com/hodcarrier/u-boot/blob/upstream/loongson-ls1c300b/=
v4/arch/mips/dts/loongson32-ls1c300b.dtsi
>
I 've noticed your eariier commit for U-Boot.
We can discuss it in more detail.
> ---
> Du Huanpeng
> >
> > > -Serge(y)
> > >
> > > >
> > > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > > > ---
> > > >  arch/mips/boot/dts/loongson/loongson1.dtsi    |  16 ++
> > > >  arch/mips/boot/dts/loongson/loongson1b.dtsi   |  53 +++++++
> > > >  arch/mips/boot/dts/loongson/loongson1c.dtsi   |  17 ++
> > > >  arch/mips/boot/dts/loongson/lsgz_1b_dev.dts   |   8 +
> > > >  arch/mips/boot/dts/loongson/smartloong_1c.dts |   4 +
> > > >  arch/mips/loongson32/common/platform.c        | 146 +-------------=
----
> > > >  arch/mips/loongson32/ls1b/board.c             |   2 -
> > > >  arch/mips/loongson32/ls1c/board.c             |   1 -
> > > >  8 files changed, 99 insertions(+), 148 deletions(-)
> > > >
> > > > diff --git a/arch/mips/boot/dts/loongson/loongson1.dtsi b/arch/mips=
/boot/dts/loongson/loongson1.dtsi
> > > > index c77aa2d0f66c..48bb786bbf10 100644
> > > > --- a/arch/mips/boot/dts/loongson/loongson1.dtsi
> > > > +++ b/arch/mips/boot/dts/loongson/loongson1.dtsi
> > > > @@ -71,6 +71,22 @@ intc3: interrupt-controller@1fd01088 {
> > > >                       interrupt-parent =3D <&cpu_intc>;
> > > >                       interrupts =3D <5>;
> > > >               };
> > > > +
> > > > +             gmac0: ethernet@1fe10000 {
> > > > +                     compatible =3D "snps,dwmac-3.70a";
> > > > +                     reg =3D <0x1fe10000 0x10000>;
> > > > +
> > > > +                     interrupt-parent =3D <&intc1>;
> > > > +                     interrupt-names =3D "macirq";
> > > > +
> > > > +                     clocks =3D <&clkc LS1X_CLKID_AHB>;
> > > > +                     clock-names =3D "stmmaceth";
> > > > +
> > > > +                     snps,pbl =3D <1>;
> > > > +
> > > > +                     status =3D "disabled";
> > > > +             };
> > > > +
> > > >       };
> > > >
> > > >       apb: bus@1fe40000 {
> > > > diff --git a/arch/mips/boot/dts/loongson/loongson1b.dtsi b/arch/mip=
s/boot/dts/loongson/loongson1b.dtsi
> > > > index 437a77cee163..42b96c557660 100644
> > > > --- a/arch/mips/boot/dts/loongson/loongson1b.dtsi
> > > > +++ b/arch/mips/boot/dts/loongson/loongson1b.dtsi
> > > > @@ -7,6 +7,11 @@
> > > >  #include "loongson1.dtsi"
> > > >
> > > >  / {
> > > > +     aliases {
> > > > +             ethernet0 =3D &gmac0;
> > > > +             ethernet1 =3D &gmac1;
> > > > +     };
> > > > +
> > > >       cpus {
> > > >               #address-cells =3D <1>;
> > > >               #size-cells =3D <0>;
> > > > @@ -74,6 +79,54 @@ clkc: clock-controller@1fe78030 {
> > > >       };
> > > >  };
> > > >
> > > > +&ahb {
> > > > +     gmac1: ethernet@1fe20000 {
> > > > +             compatible =3D "snps,dwmac-3.70a";
> > > > +             reg =3D <0x1fe20000 0x10000>;
> > > > +
> > > > +             interrupt-parent =3D <&intc1>;
> > > > +             interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> > > > +             interrupt-names =3D "macirq";
> > > > +
> > > > +             clocks =3D <&clkc LS1X_CLKID_AHB>;
> > > > +             clock-names =3D "stmmaceth";
> > > > +
> > > > +             phy-handle =3D <&phy1>;
> > > > +             phy-mode =3D "mii";
> > > > +
> > > > +             snps,pbl =3D <1>;
> > > > +
> > > > +             status =3D "disabled";
> > > > +
> > > > +             mdio1 {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +                     compatible =3D "snps,dwmac-mdio";
> > > > +
> > > > +                     phy1: ethernet-phy@0 {
> > > > +                             reg =3D <0x0>;
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > > +&gmac0 {
> > > > +     interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
> > > > +
> > > > +     phy-handle =3D <&phy0>;
> > > > +     phy-mode =3D "mii";
> > > > +
> > > > +     mdio0 {
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +             compatible =3D "snps,dwmac-mdio";
> > > > +
> > > > +             phy0: ethernet-phy@0 {
> > > > +                     reg =3D <0x0>;
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > >  &uart1 {
> > > >       interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> > > >  };
> > > > diff --git a/arch/mips/boot/dts/loongson/loongson1c.dtsi b/arch/mip=
s/boot/dts/loongson/loongson1c.dtsi
> > > > index 1dd575b7b2f9..5b3e0f9280f6 100644
> > > > --- a/arch/mips/boot/dts/loongson/loongson1c.dtsi
> > > > +++ b/arch/mips/boot/dts/loongson/loongson1c.dtsi
> > > > @@ -41,6 +41,23 @@ intc4: interrupt-controller@1fd010a0 {
> > > >       };
> > > >  };
> > > >
> > > > +&gmac0 {
> > > > +     interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
> > > > +
> > > > +     phy-handle =3D <&phy0>;
> > > > +     phy-mode =3D "rmii";
> > > > +
> > > > +     mdio0 {
> > > > +             #address-cells =3D <1>;
> > > > +             #size-cells =3D <0>;
> > > > +             compatible =3D "snps,dwmac-mdio";
> > > > +
> > > > +             phy0: ethernet-phy@13 {
> > > > +                     reg =3D <0x13>;
> > > > +             };
> > > > +     };
> > > > +};
> > > > +
> > > >  &uart1 {
> > > >       interrupts =3D <4 IRQ_TYPE_LEVEL_HIGH>;
> > > >  };
> > > > diff --git a/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts b/arch/mip=
s/boot/dts/loongson/lsgz_1b_dev.dts
> > > > index 89c3dfa574f7..a43df21f2904 100644
> > > > --- a/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts
> > > > +++ b/arch/mips/boot/dts/loongson/lsgz_1b_dev.dts
> > > > @@ -28,6 +28,14 @@ xtal: xtal {
> > > >       };
> > > >  };
> > > >
> > > > +&gmac0 {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&gmac1 {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > >  &uart0 {
> > > >       status =3D "okay";
> > > >  };
> > > > diff --git a/arch/mips/boot/dts/loongson/smartloong_1c.dts b/arch/m=
ips/boot/dts/loongson/smartloong_1c.dts
> > > > index 188aab9e3685..2d8f304aa2c4 100644
> > > > --- a/arch/mips/boot/dts/loongson/smartloong_1c.dts
> > > > +++ b/arch/mips/boot/dts/loongson/smartloong_1c.dts
> > > > @@ -28,6 +28,10 @@ xtal: xtal {
> > > >       };
> > > >  };
> > > >
> > > > +&gmac0 {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > >  &uart0 {
> > > >       status =3D "okay";
> > > >  };
> > > > diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loo=
ngson32/common/platform.c
> > > > index 8272b4133e25..817518531b9b 100644
> > > > --- a/arch/mips/loongson32/common/platform.c
> > > > +++ b/arch/mips/loongson32/common/platform.c
> > > > @@ -8,157 +8,13 @@
> > > >  #include <linux/err.h>
> > > >  #include <linux/mtd/partitions.h>
> > > >  #include <linux/sizes.h>
> > > > -#include <linux/phy.h>
> > > > -#include <linux/stmmac.h>
> > > >  #include <linux/usb/ehci_pdriver.h>
> > > >
> > > >  #include <platform.h>
> > > >  #include <loongson1.h>
> > > >  #include <dma.h>
> > > >  #include <nand.h>
> > > > -
> > > > -/* Synopsys Ethernet GMAC */
> > > > -static struct stmmac_mdio_bus_data ls1x_mdio_bus_data =3D {
> > > > -     .phy_mask       =3D 0,
> > > > -};
> > > > -
> > > > -static struct stmmac_dma_cfg ls1x_eth_dma_cfg =3D {
> > > > -     .pbl            =3D 1,
> > > > -};
> > > > -
> > > > -int ls1x_eth_mux_init(struct platform_device *pdev, void *priv)
> > > > -{
> > > > -     struct plat_stmmacenet_data *plat_dat =3D NULL;
> > > > -     u32 val;
> > > > -
> > > > -     val =3D __raw_readl(LS1X_MUX_CTRL1);
> > > > -
> > > > -#if defined(CONFIG_LOONGSON1_LS1B)
> > > > -     plat_dat =3D dev_get_platdata(&pdev->dev);
> > > > -     if (plat_dat->bus_id) {
> > > > -             __raw_writel(__raw_readl(LS1X_MUX_CTRL0) | GMAC1_USE_=
UART1 |
> > > > -                          GMAC1_USE_UART0, LS1X_MUX_CTRL0);
> > > > -             switch (plat_dat->phy_interface) {
> > > > -             case PHY_INTERFACE_MODE_RGMII:
> > > > -                     val &=3D ~(GMAC1_USE_TXCLK | GMAC1_USE_PWM23)=
;
> > > > -                     break;
> > > > -             case PHY_INTERFACE_MODE_MII:
> > > > -                     val |=3D (GMAC1_USE_TXCLK | GMAC1_USE_PWM23);
> > > > -                     break;
> > > > -             default:
> > > > -                     pr_err("unsupported mii mode %d\n",
> > > > -                            plat_dat->phy_interface);
> > > > -                     return -ENOTSUPP;
> > > > -             }
> > > > -             val &=3D ~GMAC1_SHUT;
> > > > -     } else {
> > > > -             switch (plat_dat->phy_interface) {
> > > > -             case PHY_INTERFACE_MODE_RGMII:
> > > > -                     val &=3D ~(GMAC0_USE_TXCLK | GMAC0_USE_PWM01)=
;
> > > > -                     break;
> > > > -             case PHY_INTERFACE_MODE_MII:
> > > > -                     val |=3D (GMAC0_USE_TXCLK | GMAC0_USE_PWM01);
> > > > -                     break;
> > > > -             default:
> > > > -                     pr_err("unsupported mii mode %d\n",
> > > > -                            plat_dat->phy_interface);
> > > > -                     return -ENOTSUPP;
> > > > -             }
> > > > -             val &=3D ~GMAC0_SHUT;
> > > > -     }
> > > > -     __raw_writel(val, LS1X_MUX_CTRL1);
> > > > -#elif defined(CONFIG_LOONGSON1_LS1C)
> > > > -     plat_dat =3D dev_get_platdata(&pdev->dev);
> > > > -
> > > > -     val &=3D ~PHY_INTF_SELI;
> > > > -     if (plat_dat->phy_interface =3D=3D PHY_INTERFACE_MODE_RMII)
> > > > -             val |=3D 0x4 << PHY_INTF_SELI_SHIFT;
> > > > -     __raw_writel(val, LS1X_MUX_CTRL1);
> > > > -
> > > > -     val =3D __raw_readl(LS1X_MUX_CTRL0);
> > > > -     __raw_writel(val & (~GMAC_SHUT), LS1X_MUX_CTRL0);
> > > > -#endif
> > > > -
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -static struct plat_stmmacenet_data ls1x_eth0_pdata =3D {
> > > > -     .bus_id                 =3D 0,
> > > > -     .phy_addr               =3D -1,
> > > > -#if defined(CONFIG_LOONGSON1_LS1B)
> > > > -     .phy_interface          =3D PHY_INTERFACE_MODE_MII,
> > > > -#elif defined(CONFIG_LOONGSON1_LS1C)
> > > > -     .phy_interface          =3D PHY_INTERFACE_MODE_RMII,
> > > > -#endif
> > > > -     .mdio_bus_data          =3D &ls1x_mdio_bus_data,
> > > > -     .dma_cfg                =3D &ls1x_eth_dma_cfg,
> > > > -     .has_gmac               =3D 1,
> > > > -     .tx_coe                 =3D 1,
> > > > -     .rx_queues_to_use       =3D 1,
> > > > -     .tx_queues_to_use       =3D 1,
> > > > -     .init                   =3D ls1x_eth_mux_init,
> > > > -};
> > > > -
> > > > -static struct resource ls1x_eth0_resources[] =3D {
> > > > -     [0] =3D {
> > > > -             .start  =3D LS1X_GMAC0_BASE,
> > > > -             .end    =3D LS1X_GMAC0_BASE + SZ_64K - 1,
> > > > -             .flags  =3D IORESOURCE_MEM,
> > > > -     },
> > > > -     [1] =3D {
> > > > -             .name   =3D "macirq",
> > > > -             .start  =3D LS1X_GMAC0_IRQ,
> > > > -             .flags  =3D IORESOURCE_IRQ,
> > > > -     },
> > > > -};
> > > > -
> > > > -struct platform_device ls1x_eth0_pdev =3D {
> > > > -     .name           =3D "stmmaceth",
> > > > -     .id             =3D 0,
> > > > -     .num_resources  =3D ARRAY_SIZE(ls1x_eth0_resources),
> > > > -     .resource       =3D ls1x_eth0_resources,
> > > > -     .dev            =3D {
> > > > -             .platform_data =3D &ls1x_eth0_pdata,
> > > > -     },
> > > > -};
> > > > -
> > > > -#ifdef CONFIG_LOONGSON1_LS1B
> > > > -static struct plat_stmmacenet_data ls1x_eth1_pdata =3D {
> > > > -     .bus_id                 =3D 1,
> > > > -     .phy_addr               =3D -1,
> > > > -     .phy_interface          =3D PHY_INTERFACE_MODE_MII,
> > > > -     .mdio_bus_data          =3D &ls1x_mdio_bus_data,
> > > > -     .dma_cfg                =3D &ls1x_eth_dma_cfg,
> > > > -     .has_gmac               =3D 1,
> > > > -     .tx_coe                 =3D 1,
> > > > -     .rx_queues_to_use       =3D 1,
> > > > -     .tx_queues_to_use       =3D 1,
> > > > -     .init                   =3D ls1x_eth_mux_init,
> > > > -};
> > > > -
> > > > -static struct resource ls1x_eth1_resources[] =3D {
> > > > -     [0] =3D {
> > > > -             .start  =3D LS1X_GMAC1_BASE,
> > > > -             .end    =3D LS1X_GMAC1_BASE + SZ_64K - 1,
> > > > -             .flags  =3D IORESOURCE_MEM,
> > > > -     },
> > > > -     [1] =3D {
> > > > -             .name   =3D "macirq",
> > > > -             .start  =3D LS1X_GMAC1_IRQ,
> > > > -             .flags  =3D IORESOURCE_IRQ,
> > > > -     },
> > > > -};
> > > > -
> > > > -struct platform_device ls1x_eth1_pdev =3D {
> > > > -     .name           =3D "stmmaceth",
> > > > -     .id             =3D 1,
> > > > -     .num_resources  =3D ARRAY_SIZE(ls1x_eth1_resources),
> > > > -     .resource       =3D ls1x_eth1_resources,
> > > > -     .dev            =3D {
> > > > -             .platform_data =3D &ls1x_eth1_pdata,
> > > > -     },
> > > > -};
> > > > -#endif       /* CONFIG_LOONGSON1_LS1B */
> > > > +#include <irq.h>
> > > >
> > > >  /* GPIO */
> > > >  static struct resource ls1x_gpio0_resources[] =3D {
> > > > diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson=
32/ls1b/board.c
> > > > index e8290f200096..f23e4e5c96ee 100644
> > > > --- a/arch/mips/loongson32/ls1b/board.c
> > > > +++ b/arch/mips/loongson32/ls1b/board.c
> > > > @@ -34,8 +34,6 @@ static const struct gpio_led_platform_data ls1x_l=
ed_pdata __initconst =3D {
> > > >  };
> > > >
> > > >  static struct platform_device *ls1b_platform_devices[] __initdata =
=3D {
> > > > -     &ls1x_eth0_pdev,
> > > > -     &ls1x_eth1_pdev,
> > > >       &ls1x_ehci_pdev,
> > > >       &ls1x_gpio0_pdev,
> > > >       &ls1x_gpio1_pdev,
> > > > diff --git a/arch/mips/loongson32/ls1c/board.c b/arch/mips/loongson=
32/ls1c/board.c
> > > > index a7096964fb30..29bc467fd149 100644
> > > > --- a/arch/mips/loongson32/ls1c/board.c
> > > > +++ b/arch/mips/loongson32/ls1c/board.c
> > > > @@ -6,7 +6,6 @@
> > > >  #include <platform.h>
> > > >
> > > >  static struct platform_device *ls1c_platform_devices[] __initdata =
=3D {
> > > > -     &ls1x_eth0_pdev,
> > > >       &ls1x_rtc_pdev,
> > > >       &ls1x_wdt_pdev,
> > > >  };
> > > > --
> > > > 2.39.2
> > > >
> >
> >
> >
> > --
> > Best regards,
> >
> > Keguang Zhang



--=20
Best regards,

Keguang Zhang
