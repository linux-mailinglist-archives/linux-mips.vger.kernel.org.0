Return-Path: <linux-mips+bounces-7083-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDB9F73C7
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 05:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42E41167FB5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 04:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176D3130E27;
	Thu, 19 Dec 2024 04:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdb7rnlI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F4033EA;
	Thu, 19 Dec 2024 04:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734583618; cv=none; b=thH2Zze4bjnJQ/rGKvBx88XCl6BI8Fia/oeLgRcj1dex1f/Doj+YPoZtSRjnUa7ynSTyChX7mhg7eNx5uFBzdUzCuCM8hUqAyJrH1G701ChBkiUulMFihIEUS4VkItgM8gWab0EUIdmO6bcg2o4oSp/9z87fuMmsrzScxqdHWe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734583618; c=relaxed/simple;
	bh=G5AlNQ0h/E+WomnfIEtRFBHVZmDPnnLhqMqabnVxpjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNi7dXXIigvpQqEFjfrrad2eg6vmFrM94oyQcWVIM1fyvCsMe53hFkuKQvfQJSn/0Uavs5CNLF6cX110OfuUcPk4gUwnVP3DsVPReK2WJZE/SZWowxwMeYOT2T3/pqvaULVoYGBv+eLW/YmAUhLNFbaXMkYc7tDsEKqp9D8CezA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdb7rnlI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e3a90336eso349438e87.3;
        Wed, 18 Dec 2024 20:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734583614; x=1735188414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=etSrtAc0WIJRuJfEqsZg50IUc+HmOCHr9CUfEcD59Jw=;
        b=gdb7rnlI51MVPI6zspZq83DkLlSVOaptqJjx736nC5y1nxJuCK0B2mLH05wV8O2ynr
         f+KXmC4sX6YG8u2thAfjz6W3Zlzv91iuRFh+ZYgqLW2/dP/QFKExRvOfJ4HaLjs79nZk
         C4YjXk8FhIKmM7y9pMpnfytuk3S1gdRLPmlge7FDQV0c0FsJtJHeOZIqmNE9xUkAQ3St
         I90wrRQkj/kLIB+Qo4QENCAxDu7qG+YmAjcYLEaC6/lHTjlmZRwP9OX1EJk9EqTpRUhy
         B4BHmYfSSOxCyOgkBkb9cUk41drMwbVO9C4M0ZjXWMK/WUG8+HaQCdQg9bzpMn+gWvwE
         2X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734583614; x=1735188414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etSrtAc0WIJRuJfEqsZg50IUc+HmOCHr9CUfEcD59Jw=;
        b=ggxcT2fjWCZz6JlvWlnsgN16TdcbiZ3cY/OVAROnjgQ72539e+Mf06izWNH9Zu9CWM
         PP1uMgHwjolGdeZIwm6eHqeTtOB77U3uqjbhh1+FGu3J3Uv6vFoVGhEZO4tnzHZ4KBE5
         gdMftFF0+JHUnH0i+n5Q4aHO19idJD42BuMr+1qbBSrSIAehARzofO2RHNuKz0II5A0I
         aY4hm3bb9UeHxhcq/13LfAxsTpfX5WbgH3znd9RMumxGu+Mt4Geh9sq1tmb6Optj19u3
         wdDX+9yNx3jsVo8R73tFCNhMeD39x64bDmSGdBYTYgxmEKn/jdg1/lGoXHEcuVgF/6Vd
         iPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi/1y2ijQeXuPiaNvVRRTW8q1XUKqDNQij1lUMuU3kYJt2lvOCoT6UT4BoAU07LnkotyhYIlmAGDwcmQ==@vger.kernel.org, AJvYcCUkc+XbaGUI1AErAoYhJ5M4qEj1T1V3smRONMF+1IaLXme/UJmMmifhgS0ONEAkELQYecHv1stQJwBV@vger.kernel.org, AJvYcCWybGNkJb9TNFHDcywC/128wwvAdF1poNGFNmSucq2rp0cn7HtSZBW8jz8BpzRAokM0z51VrR3g@vger.kernel.org, AJvYcCXdVupmVjpCOAashibj0T5c7Z0hnpEnjmoRr/MH99VftyUgN8JMJe5DjsmLMBZCeZK+l0YigcA4Qhy/JAl8@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8sWwfveZsgzggWlDYfLBwEbmLt5QLiW/xeJQcbkDOKD8MJoE
	+dknhwUDVBhgznTXGm6bp4Sboxjb9r0PP5TIIYoDs55+LzaeItyak2lhpwhtW4J/u9GNXN0CH4U
	HEvLWYdolTAbIRhh62Gp/oOh3904=
X-Gm-Gg: ASbGncvNBaDDrEdB47v5SiYSqO354Pj3N34Qx2fCWrAWT6wSFCFVMUTZtQ+qBe6OC/n
	sH1UdwKKQbBqFQ62S8GNPOf3e6Enf0Z+HPX8nUKV1jb4DwxC/WHCVB1CVaLjJwD7Ue3E5tGI=
X-Google-Smtp-Source: AGHT+IH663yuEsfwmCuR7y6IfDbYYYRwI+rR2AqVj1XKFhGMv/1AFvKsVuIsojGYtMiBs7Ym0nJLC1YZ42ni/8mm2o8=
X-Received: by 2002:a05:6512:10d4:b0:540:353a:df8f with SMTP id
 2adb3069b0e04-541f46c4422mr1496469e87.44.1734583613513; Wed, 18 Dec 2024
 20:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz> <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 19 Dec 2024 01:46:41 -0300
Message-ID: <CAJq09z49uBPPZqDyc3O+4nVppKoKdrJunQnQKBUfQmwzdV+ZFQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Chris,

> +++ b/drivers/net/mdio/mdio-realtek-rtl.c

I wonder if the name might be dubious in the future with other realtek
products with MDIO. Realtek is quite a large company with many
products. Would a version/model/family/usage in that name help a far
future reader to identify what this file is about?

How would this realtek MDIO driver interact with the
drivers/net/dsa/realtek drivers? I guess it might not be too much as
this is the SoC MDIO bus and not the user MDIO bus (also something
called "realtek MDIO driver"). Also, the code logic there just rhymes
with some register access implemented there.

> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MDIO controller for RTL9300 switches with integrated SoC.
> + *
> + * The MDIO communication is abstracted by the switch. At the software level
> + * communication uses the switch port to address the PHY with the actual MDIO
> + * bus and address having been setup via the realtek,smi-address property.
> + */
> +
> +#include <linux/mdio.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of_mdio.h>
> +#include <linux/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define SMI_GLB_CTRL                   0x000
> +#define   GLB_CTRL_INTF_SEL(intf)      BIT(16 + (intf))
> +#define SMI_PORT0_15_POLLING_SEL       0x008
> +#define SMI_ACCESS_PHY_CTRL_0          0x170
> +#define SMI_ACCESS_PHY_CTRL_1          0x174
> +#define   PHY_CTRL_RWOP                        BIT(2)
> +#define   PHY_CTRL_TYPE                        BIT(1)
> +#define   PHY_CTRL_CMD                 BIT(0)
> +#define   PHY_CTRL_FAIL                        BIT(25)
> +#define SMI_ACCESS_PHY_CTRL_2          0x178
> +#define SMI_ACCESS_PHY_CTRL_3          0x17c
> +#define SMI_PORT0_5_ADDR_CTRL          0x180
> +
> +#define MAX_PORTS       28
> +#define MAX_SMI_BUSSES  4
> +#define MAX_SMI_ADDR   0x1f
> +
> +struct realtek_mdio_priv {
> +       struct regmap *regmap;
> +       u8 smi_bus[MAX_PORTS];
> +       u8 smi_addr[MAX_PORTS];
> +       bool smi_bus_isc45[MAX_SMI_BUSSES];
> +       u32 reg_base;
> +};
> +
> +static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)

All those realtek_mdio_* prefix might collide with realtek_mdio_* from
drivers/net/dsa/realtek/realtek-mdio.c. This realtek_mdio_* is about a
Realtek SoC MDIO interface with the switch. The other realtek_mdio_*
is about the interface (MDIO or SMI) between (the other vendor) SoC
and the switch. I don't know if the maintainers are OK with it but
listing those symbols in alphabetic order from both sources might be
confusing.

> +{
> +       struct regmap *regmap = priv->regmap;
> +       u32 reg_base = priv->reg_base;
> +       u32 val;
> +
> +       return regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,

All regmap funcs are adding reg_base to the register address. Isn't a
remap job to do that sum? It just looks odd but I never worked with
MFD. It looks like it is missing a subregmap-like variant.

> +                                       val, !(val & PHY_CTRL_CMD), 10, 500);
> +}
> +
> +static int realtek_mdio_read_c22(struct mii_bus *bus, int phy_id, int regnum)
> +{
> +       struct realtek_mdio_priv *priv = bus->priv;
> +       struct regmap *regmap = priv->regmap;
> +       u32 reg_base = priv->reg_base;
> +       u32 val;
> +       int err;
> +
> +       err = realtek_mdio_wait_ready(priv);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, phy_id << 16);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
> +                          regnum << 20 |  0x1f << 15 | 0xfff << 3 | PHY_CTRL_CMD);
> +       if (err)
> +               return err;
> +
> +       err = realtek_mdio_wait_ready(priv);
> +       if (err)
> +               return err;
> +
> +       err = regmap_read(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, &val);
> +       if (err)
> +               return err;
> +
> +       return val & 0xffff;
> +}
> +
> +static int realtek_mdio_write_c22(struct mii_bus *bus, int phy_id, int regnum, u16 value)
> +{
> +       struct realtek_mdio_priv *priv = bus->priv;
> +       struct regmap *regmap = priv->regmap;
> +       u32 reg_base = priv->reg_base;
> +       u32 val;
> +       int err;
> +
> +       err = realtek_mdio_wait_ready(priv);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_0, BIT(phy_id));
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, value << 16);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
> +                          regnum << 20 |  0x1f << 15 | 0xfff << 3 | PHY_CTRL_RWOP | PHY_CTRL_CMD);
> +       if (err)
> +               return err;
> +
> +       err = regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
> +                                      val, !(val & PHY_CTRL_CMD), 10, 100);
> +       if (err)
> +               return err;
> +
> +       if (val & PHY_CTRL_FAIL)
> +               return -ENXIO;
> +
> +       return 0;
> +}
> +
> +static int realtek_mdio_read_c45(struct mii_bus *bus, int phy_id, int dev_addr, int regnum)
> +{
> +       struct realtek_mdio_priv *priv = bus->priv;
> +       struct regmap *regmap = priv->regmap;
> +       u32 reg_base = priv->reg_base;
> +       u32 val;
> +       int err;
> +
> +       err = realtek_mdio_wait_ready(priv);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, phy_id << 16);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_3,
> +                          dev_addr << 16 | (regnum & 0xffff));
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
> +                          PHY_CTRL_TYPE | PHY_CTRL_CMD);
> +       if (err)
> +               return err;
> +
> +       err = realtek_mdio_wait_ready(priv);
> +       if (err)
> +               return err;
> +
> +       err = regmap_read(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, &val);
> +       if (err)
> +               return err;
> +
> +       return val & 0xffff;
> +}
> +
> +static int realtek_mdio_write_c45(struct mii_bus *bus, int phy_id, int dev_addr,
> +                                 int regnum, u16 value)
> +{
> +       struct realtek_mdio_priv *priv = bus->priv;
> +       struct regmap *regmap = priv->regmap;
> +       u32 reg_base = priv->reg_base;
> +       u32 val;
> +       int err;
> +
> +       err = realtek_mdio_wait_ready(priv);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_0, BIT(phy_id));
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_2, value << 16);
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_3,
> +                          dev_addr << 16 | (regnum & 0xffff));
> +       if (err)
> +               return err;
> +
> +       err = regmap_write(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
> +                          PHY_CTRL_RWOP | PHY_CTRL_TYPE | PHY_CTRL_CMD);
> +       if (err)
> +               return err;
> +
> +       err = regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
> +                                      val, !(val & PHY_CTRL_CMD), 10, 100);
> +       if (err)
> +               return err;
> +
> +       if (val & PHY_CTRL_FAIL)
> +               return -ENXIO;
> +
> +       return 0;
> +}
> +
> +static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
> +{
> +       u32 glb_ctrl_mask = 0, glb_ctrl_val = 0;
> +       struct regmap *regmap = priv->regmap;
> +       u32 reg_base = priv->reg_base;
> +       u32 port_addr[5] = { 0 };
> +       u32 poll_sel[2] = { 0 };
> +       int i, err;
> +
> +       /* Associate the port with the SMI interface and PHY */
> +       for (i = 0; i < MAX_PORTS; i++) {
> +               int pos;
> +
> +               if (priv->smi_bus[i] > 3)
> +                       continue;
> +
> +               pos = (i % 6) * 5;
> +               port_addr[i / 6] |= priv->smi_addr[i] << pos;
> +
> +               pos = (i % 16) * 2;
> +               poll_sel[i / 16] |= priv->smi_bus[i] << pos;
> +       }
> +
> +       /* Put the interfaces into C45 mode if required */
> +       for (i = 0; i < MAX_SMI_BUSSES; i++) {
> +               if (priv->smi_bus_isc45[i]) {
> +                       glb_ctrl_mask |= GLB_CTRL_INTF_SEL(i);
> +                       glb_ctrl_val |= GLB_CTRL_INTF_SEL(i);
> +               }
> +       }
> +
> +       err = regmap_bulk_write(regmap, reg_base + SMI_PORT0_5_ADDR_CTRL,
> +                               port_addr, 5);
> +       if (err)
> +               return err;
> +
> +       err = regmap_bulk_write(regmap, reg_base + SMI_PORT0_15_POLLING_SEL,
> +                               poll_sel, 2);
> +       if (err)
> +               return err;
> +
> +       err = regmap_update_bits(regmap, reg_base + SMI_GLB_CTRL,
> +                                glb_ctrl_mask, glb_ctrl_val);
> +       if (err)
> +               return err;
> +
> +       return 0;
> +}
> +
> +static int realtek_mdiobus_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct realtek_mdio_priv *priv;
> +       struct fwnode_handle *child;
> +       struct mii_bus *bus;
> +       int err;
> +
> +       bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
> +       if (!bus)
> +               return -ENOMEM;
> +
> +       bus->name = "Reaktek Switch MDIO Bus";
> +       bus->read = realtek_mdio_read_c22;
> +       bus->write = realtek_mdio_write_c22;
> +       bus->read_c45 = realtek_mdio_read_c45;
> +       bus->write_c45 =  realtek_mdio_write_c45;
> +       bus->parent = dev;
> +       priv = bus->priv;
> +
> +       priv->regmap = syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(priv->regmap))
> +               return PTR_ERR(priv->regmap);
> +
> +       err = device_property_read_u32(dev, "reg", &priv->reg_base);
> +       if (err)
> +               return err;
> +
> +       snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
> +
> +       device_for_each_child_node(dev, child) {
> +               u32 pn, smi_addr[2];
> +
> +               err = fwnode_property_read_u32(child, "reg", &pn);
> +               if (err)
> +                       return err;
> +
> +               if (pn >= MAX_PORTS)
> +                       return dev_err_probe(dev, -EINVAL, "illegal port number %d\n", pn);
> +
> +               err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
> +               if (err) {
> +                       smi_addr[0] = 0;
> +                       smi_addr[1] = pn;
> +               }
> +
> +               if (smi_addr[0] > MAX_SMI_BUSSES)
> +                       return dev_err_probe(dev, -EINVAL, "illegal smi bus number %d\n",
> +                                            smi_addr[0]);
> +
> +               if (smi_addr[1] > MAX_SMI_ADDR)
> +                       return dev_err_probe(dev, -EINVAL, "illegal smi addr %d\n", smi_addr[1]);
> +
> +               if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
> +                       priv->smi_bus_isc45[smi_addr[0]] = true;
> +
> +               priv->smi_bus[pn] = smi_addr[0];
> +               priv->smi_addr[pn] = smi_addr[1];
> +       }
> +
> +       err = realtek_mdiobus_init(priv);
> +       if (err)
> +               return dev_err_probe(dev, err, "failed to initialise MDIO bus controller\n");
> +
> +       err = devm_of_mdiobus_register(dev, bus, dev->of_node);
> +       if (err)
> +               return dev_err_probe(dev, err, "cannot register MDIO bus\n");
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id realtek_mdio_ids[] = {
> +       { .compatible = "realtek,rtl9301-mdio" },
> +       { .compatible = "realtek,rtl9302b-mdio" },
> +       { .compatible = "realtek,rtl9302c-mdio" },
> +       { .compatible = "realtek,rtl9303-mdio" },

Do these different compatible strings really matter? AFAIK, compatible
are not for listing all supported models/variants but to describe
devices that have a different behavior and indicating that (with
different strings) is needed to decide how the driver will work. If
the driver does not use which compatible was set, it might indicate
that we don't really need 4 compatible but 1.

> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, realtek_mdio_ids);
> +
> +static struct platform_driver rtl9300_mdio_driver = {
> +       .probe = realtek_mdiobus_probe,
> +       .driver = {
> +               .name = "mdio-rtl9300",
> +               .of_match_table = realtek_mdio_ids,
> +       },
> +};
> +
> +module_platform_driver(rtl9300_mdio_driver);
> +
> +MODULE_DESCRIPTION("RTL9300 MDIO driver");
> +MODULE_LICENSE("GPL");
> --
> 2.47.1
>
>

Regards,

Luiz

