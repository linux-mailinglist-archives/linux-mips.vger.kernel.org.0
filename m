Return-Path: <linux-mips+bounces-12576-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36898CD9DE2
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 16:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59C6300796F
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 15:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D772512DE;
	Tue, 23 Dec 2025 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ML9nBi3A"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B101DA62E;
	Tue, 23 Dec 2025 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766505239; cv=none; b=FJ4Ab1+iJ29i0E+xseRRspbhWAOecXEX3/u8muLJaD7ucSDfbVEOdjdn/CzYFhLNGfR9/Lp0KmlOk+4mXnLRO8sV69BIrLt2wlX1hDBT8FvG9quDEZyAyXGolQrEW0AvZVTVYRRq50WvpYLbRDQcyUZodTPQFLdBtPVjCbvMsmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766505239; c=relaxed/simple;
	bh=CZrJo1LdW7bruNZUu+2L6WzM2CBpusjxOX4oWgrjvAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu+vsHFpeO4MEgYc8R7mt5tumgqWkZSi97f0B+6uNvI8BqZpIDapaiRvZ42XmfDDMvvYNvJ01OFr2MtqPdKT/iFg2i7f+gTpPoTR8qA8s7PimwVwEtuskwmQW55x1K4MR783dH1t5XfrLQPMY9UhTJ0ewcXikoIMea2w5O0XKoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ML9nBi3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2644DC116C6;
	Tue, 23 Dec 2025 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766505238;
	bh=CZrJo1LdW7bruNZUu+2L6WzM2CBpusjxOX4oWgrjvAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ML9nBi3A2UxEqoBQvpJw2FYCOwagkl8EmF2lJKZv9Tf3x0t0MNrXw6kXbWS/7OV5C
	 NrWKOpuV6HgLsf3UgsmQxITSXQMBv05/cmh9m5DAMTPnLz1ouHyKDKe2Wrtai7MmrO
	 CCDhEltgaIINL00jfFxonf3Pi9bXQi/qkIX7l1g+gLeI2YXHpMAOG5BiPCmeqm+Qz9
	 GuH3rWjCWp2lhyORyacmg9DJefht43b9N8eqdf/kHAul2ZVdlixE6PWzYfqw9c8zVd
	 NhANqpA1pmGmX4CXVImx74zY/V0hyl5DmFeZPhZ/pSxc0uyQmlxNVhtDvfw4oxYhGQ
	 A37UT8IbO3a1A==
Date: Tue, 23 Dec 2025 21:23:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v5 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <aUq7E4yh0OgTfdxF@vaman>
References: <20251215-macb-phy-v5-0-a9dfea39da34@bootlin.com>
 <20251215-macb-phy-v5-2-a9dfea39da34@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215-macb-phy-v5-2-a9dfea39da34@bootlin.com>

On 15-12-25, 17:26, Théo Lebrun wrote:
> EyeQ5 embeds a system-controller called OLB. It features many unrelated
> registers, and some of those are registers used to configure the
> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
> 
> Wrap in a neat generic PHY provider, exposing two PHYs with standard
> phy_init() / phy_set_mode() / phy_power_on() operations.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/phy/Kconfig         |  13 +++
>  drivers/phy/Makefile        |   1 +
>  drivers/phy/phy-eyeq5-eth.c | 249 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 264 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..2f67ec9fad57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17605,6 +17605,7 @@ F:	arch/mips/boot/dts/mobileye/
>  F:	arch/mips/configs/eyeq5_defconfig
>  F:	arch/mips/mobileye/board-epm5.its.S
>  F:	drivers/clk/clk-eyeq.c
> +F:	drivers/phy/phy-eyeq5-eth.c
>  F:	drivers/pinctrl/pinctrl-eyeq5.c
>  F:	drivers/reset/reset-eyeq.c
>  F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 678dd0452f0a..1aa6eff12dbc 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -101,6 +101,19 @@ config PHY_NXP_PTN3222
>  	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
>  	  Speed and High Speed.
>  
> +config PHY_EYEQ5_ETH

sorted please

> +	tristate "Ethernet PHY Driver on EyeQ5"
> +	depends on OF
> +	depends on MACH_EYEQ5 || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select GENERIC_PHY
> +	default MACH_EYEQ5

hmmm why should it be default? Maybe add this is respective defconfig for
platform instead..?

> +	help
> +	  Enable this to support the Ethernet PHY integrated on EyeQ5.
> +	  It supports both RGMII and SGMII. Registers are located in a
> +	  shared register region called OLB. If M is selected, the
> +	  module will be called phy-eyeq5-eth.
> +
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index bfb27fb5a494..8289497ece55 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
>  obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>  obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
> +obj-$(CONFIG_PHY_EYEQ5_ETH)		+= phy-eyeq5-eth.o

sorted please

>  obj-y					+= allwinner/	\
>  					   amlogic/	\
>  					   broadcom/	\
> diff --git a/drivers/phy/phy-eyeq5-eth.c b/drivers/phy/phy-eyeq5-eth.c
> new file mode 100644
> index 000000000000..6e28f7e24835
> --- /dev/null
> +++ b/drivers/phy/phy-eyeq5-eth.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/gfp_types.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +#define EQ5_PHY_COUNT	2
> +
> +#define EQ5_PHY0_GP	0x128
> +#define EQ5_PHY1_GP	0x12c
> +#define EQ5_PHY0_SGMII	0x134
> +#define EQ5_PHY1_SGMII	0x138
> +
> +#define EQ5_GP_TX_SWRST_DIS	BIT(0)		// Tx SW reset
> +#define EQ5_GP_TX_M_CLKE	BIT(1)		// Tx M clock enable
> +#define EQ5_GP_SYS_SWRST_DIS	BIT(2)		// Sys SW reset
> +#define EQ5_GP_SYS_M_CLKE	BIT(3)		// Sys clock enable
> +#define EQ5_GP_SGMII_MODE	BIT(4)		// SGMII mode
> +#define EQ5_GP_RGMII_DRV	GENMASK(8, 5)	// RGMII drive strength
> +
> +#define EQ5_SGMII_PWR_EN	BIT(0)
> +#define EQ5_SGMII_RST_DIS	BIT(1)
> +#define EQ5_SGMII_PLL_EN	BIT(2)
> +#define EQ5_SGMII_SIG_DET_SW	BIT(3)
> +#define EQ5_SGMII_PWR_STATE	BIT(4)
> +#define EQ5_SGMII_PLL_ACK	BIT(18)
> +#define EQ5_SGMII_PWR_STATE_ACK	GENMASK(24, 20)
> +
> +struct eq5_phy_inst {
> +	struct eq5_phy_private	*priv;
> +	struct phy		*phy;
> +	void __iomem		*gp, *sgmii;
> +	phy_interface_t		phy_interface;
> +};
> +
> +struct eq5_phy_private {
> +	struct device		*dev;
> +	struct eq5_phy_inst	phys[EQ5_PHY_COUNT];
> +};
> +
> +static int eq5_phy_init(struct phy *phy)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +	u32 reg;
> +
> +	dev_dbg(dev, "phy_init(inst=%td)\n", inst - priv->phys);
> +
> +	writel(0, inst->gp);
> +	writel(0, inst->sgmii);
> +
> +	udelay(5);
> +
> +	reg = readl(inst->gp) | EQ5_GP_TX_SWRST_DIS | EQ5_GP_TX_M_CLKE |
> +	      EQ5_GP_SYS_SWRST_DIS | EQ5_GP_SYS_M_CLKE |
> +	      FIELD_PREP(EQ5_GP_RGMII_DRV, 0x9);
> +	writel(reg, inst->gp);
> +
> +	return 0;
> +}
> +
> +static int eq5_phy_exit(struct phy *phy)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +
> +	dev_dbg(dev, "phy_exit(inst=%td)\n", inst - priv->phys);
> +
> +	writel(0, inst->gp);
> +	writel(0, inst->sgmii);
> +	udelay(5);

this is same patter in init as well...?

> +
> +	return 0;
> +}
> +
> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +
> +	dev_dbg(dev, "phy_set_mode(inst=%td, mode=%d, submode=%d)\n",
> +		inst - priv->phys, mode, submode);

these are good for debug but not for upstream, please drop

> +
> +	if (mode != PHY_MODE_ETHERNET)
> +		return -EOPNOTSUPP;
> +
> +	if (!phy_interface_mode_is_rgmii(submode) &&
> +	    submode != PHY_INTERFACE_MODE_SGMII)
> +		return -EOPNOTSUPP;
> +
> +	inst->phy_interface = submode;
> +	return 0;
> +}
> +
> +static int eq5_phy_power_on(struct phy *phy)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +	u32 reg;
> +
> +	dev_dbg(dev, "phy_power_on(inst=%td)\n", inst - priv->phys);
> +
> +	if (inst->phy_interface == PHY_INTERFACE_MODE_SGMII) {
> +		writel(readl(inst->gp) | EQ5_GP_SGMII_MODE, inst->gp);
> +
> +		reg = EQ5_SGMII_PWR_EN | EQ5_SGMII_RST_DIS | EQ5_SGMII_PLL_EN;
> +		writel(reg, inst->sgmii);
> +
> +		if (readl_poll_timeout(inst->sgmii, reg,
> +				       reg & EQ5_SGMII_PLL_ACK, 1, 100)) {
> +			dev_err(dev, "PLL timeout\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		reg = readl(inst->sgmii);
> +		reg |= EQ5_SGMII_PWR_STATE | EQ5_SGMII_SIG_DET_SW;
> +		writel(reg, inst->sgmii);
> +	} else {
> +		writel(readl(inst->gp) & ~EQ5_GP_SGMII_MODE, inst->gp);
> +		writel(0, inst->sgmii);
> +	}
> +
> +	return 0;
> +}
> +
> +static int eq5_phy_power_off(struct phy *phy)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +	struct eq5_phy_private *priv = inst->priv;
> +	struct device *dev = priv->dev;
> +
> +	dev_dbg(dev, "phy_power_off(inst=%td)\n", inst - priv->phys);
> +
> +	writel(readl(inst->gp) & ~EQ5_GP_SGMII_MODE, inst->gp);
> +	writel(0, inst->sgmii);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops eq5_phy_ops = {
> +	.init		= eq5_phy_init,
> +	.exit		= eq5_phy_exit,
> +	.set_mode	= eq5_phy_set_mode,
> +	.power_on	= eq5_phy_power_on,
> +	.power_off	= eq5_phy_power_off,
> +};
> +
> +static struct phy *eq5_phy_xlate(struct device *dev,
> +				 const struct of_phandle_args *args)
> +{
> +	struct eq5_phy_private *priv = dev_get_drvdata(dev);
> +
> +	if (args->args_count != 1 || args->args[0] >= EQ5_PHY_COUNT)
> +		return ERR_PTR(-EINVAL);
> +
> +	return priv->phys[args->args[0]].phy;
> +}
> +
> +static int eq5_phy_probe_phy(struct eq5_phy_private *priv, unsigned int index,
> +			     void __iomem *base, unsigned int gp,
> +			     unsigned int sgmii)
> +{
> +	struct eq5_phy_inst *inst = &priv->phys[index];
> +	struct device *dev = priv->dev;
> +	struct phy *phy;
> +
> +	phy = devm_phy_create(dev, dev->of_node, &eq5_phy_ops);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy),
> +				     "failed to create PHY %u\n", index);
> +
> +	inst->priv = priv;
> +	inst->phy = phy;
> +	inst->gp = base + gp;
> +	inst->sgmii = base + sgmii;
> +	inst->phy_interface = PHY_INTERFACE_MODE_NA;
> +	phy_set_drvdata(phy, inst);
> +
> +	return 0;
> +}
> +
> +static int eq5_phy_probe(struct auxiliary_device *adev,
> +			 const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct phy_provider *provider;
> +	struct eq5_phy_private *priv;
> +	void __iomem *base;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	dev_set_drvdata(dev, priv);
> +
> +	base = (void __iomem *)dev_get_platdata(dev);

no need to cast for void *
-- 
~Vinod

