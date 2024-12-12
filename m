Return-Path: <linux-mips+bounces-6963-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E49EE38E
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 11:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3288B2865F3
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 10:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAD421018D;
	Thu, 12 Dec 2024 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VdKfS77S"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60946210198;
	Thu, 12 Dec 2024 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997610; cv=none; b=P84PTuZ6nYOwETN/ZMbEV+DVSBEbjekIjUYbIF5QJoLN+g79Vw+DU/DPLeoy6XS9NGbbL4xQ0hym9F1fS22j1LfU7J+WyAPcUYFy+eXL9IrE3/HCu/gd5chmq22J02MZDpTOk+9zUBpcXymZoGGIGH27Y+ITgTkpRaB8fEnNzTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997610; c=relaxed/simple;
	bh=qDAv2Xv6N2kuxJQLsjfm1axhvIqwPsan4GylkV4QvzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0sfh8mVcSVFQtw7HPyI6pTih7ABhfzmpgb7h9cP8OhYaXWvf8amxXNV28x+n7WdLiP7pPxbaO7MFjLcrWgPGlLCnwBTt2naH5jkUaSzqRBfQpWV1Kc5smEe1CNWUVZh9P0yWe3Qk+m70o+MM+0UpPRTX5QP4IvhbCOqP1kyEEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=VdKfS77S; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wA41zs323CaxwCsbLDOAz6jafr2ZMVwJEresqJ562hE=; b=VdKfS77SJboOdDhtPNF3vqvb86
	UPC1q2HKZ90KAVOWlP7iooe6gv7dhK7+e0dKXQNRtNU0UEjRv4cTsIh9QYbDiXZ1h4jWgPCwdHZ0g
	NHYAxxMY67JEcM+LPoOtH694kdgAb9lPWqDXjk/HUCumQgB+XwoKFFvwAHE8VtNmHdo2E74rVLUn+
	mmDgYejw0tNQzdGErxsB0jWiR9kW7JpDhsAHn+KvBM232HWoEAF0jMejSGjSebb5HTZ1ffRTt8btF
	Vv5vIZILY/TKJT22kt9DMVyjBckS/8dlYIB1+KdG6lp50lUHPLUw41/J2o7jxMiQUnddP66KqAbQC
	Yt7MMrbQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45064)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tLfyz-00054Z-1C;
	Thu, 12 Dec 2024 09:59:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tLfys-0005FA-2P;
	Thu, 12 Dec 2024 09:59:38 +0000
Date: Thu, 12 Dec 2024 09:59:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <Z1q0CuDXe8VFuBfZ@shell.armlinux.org.uk>
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-5-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211235342.1573926-5-chris.packham@alliedtelesis.co.nz>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Dec 12, 2024 at 12:53:42PM +1300, Chris Packham wrote:
> +#define SMI_GLB_CTRL			0x000
> +#define   GLB_CTRL_INTF_SEL(intf)	BIT(16 + (intf))
> +#define SMI_PORT0_15_POLLING_SEL	0x008
> +#define SMI_ACCESS_PHY_CTRL_0		0x170
> +#define SMI_ACCESS_PHY_CTRL_1		0x174
> +#define   PHY_CTRL_RWOP			BIT(2)

Presumably, reading the code, this bit is set when writing?

> +#define   PHY_CTRL_TYPE			BIT(1)

Presumably, reading the code, this bit indicates we want to use clause
45?

> +#define   PHY_CTRL_CMD			BIT(0)
> +#define   PHY_CTRL_FAIL			BIT(25)
> +#define SMI_ACCESS_PHY_CTRL_2		0x178
> +#define SMI_ACCESS_PHY_CTRL_3		0x17c
> +#define SMI_PORT0_5_ADDR_CTRL		0x180
> +
> +#define MAX_PORTS       32
> +#define MAX_SMI_BUSSES  4
> +
> +struct realtek_mdio_priv {
> +	struct regmap *regmap;
> +	u8 smi_bus[MAX_PORTS];
> +	u8 smi_addr[MAX_PORTS];
> +	bool smi_bus_isc45[MAX_SMI_BUSSES];

Not sure about the support for !C45 - you appear to set this if you
find a PHY as a child of this device which has the PHY C45 compatible,
but as you don't populate the C22 MDIO bus operations, I'm not sure
how a C22 PHY can work.

> +	u32 reg_base;
> +};
> +
> +static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)
> +{
> +	u32 val;
> +
> +	return regmap_read_poll_timeout(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_1,
> +					val, !(val & PHY_CTRL_CMD), 10, 500);
> +}
> +
> +static int realtek_mdio_read_c45(struct mii_bus *bus, int phy_id, int dev_addr, int regnum)
> +{
> +	struct realtek_mdio_priv *priv = bus->priv;
> +	u32 val;
> +	int err;
> +
> +	err = realtek_mdio_wait_ready(priv);
> +	if (err)
> +		return err;
> +
> +	err = regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_2, phy_id << 16);
> +	if (err)
> +		return err;
> +
> +	err = regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_3,
> +			   dev_addr << 16 | (regnum & 0xffff));
> +	if (err)
> +		return err;
> +
> +	err = regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_1,
> +			   PHY_CTRL_TYPE | PHY_CTRL_CMD);
> +	if (err)
> +		return err;

Maybe consider using a local variable for "regmap" and "reg_base" to
reduce the line length/wrapping?

> +static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
> +{
> +	u32 port_addr[5] = { };
> +	u32 poll_sel[2] = { 0, 0 };
> +	u32 glb_ctrl_mask = 0, glb_ctrl_val = 0;

Please use reverse Christmas tree order.

> +	int i, err;
> +
> +	for (i = 0; i < MAX_PORTS; i++) {
> +		int pos;
> +
> +		if (priv->smi_bus[i] > 3)
> +			continue;
> +
> +		pos = (i % 6) * 5;
> +		port_addr[i / 6] |=  priv->smi_addr[i] << pos;

s/  / /

> +
> +		pos = (i % 16) * 2;
> +		poll_sel[i / 16] |= priv->smi_bus[i] << pos;
> +	}
> +
> +	for (i = 0; i < MAX_SMI_BUSSES; i++) {
> +		if (priv->smi_bus_isc45[i]) {
> +			glb_ctrl_mask |= GLB_CTRL_INTF_SEL(i);
> +			glb_ctrl_val |= GLB_CTRL_INTF_SEL(i);
> +		}
> +	}
> +
> +	err = regmap_bulk_write(priv->regmap, priv->reg_base + SMI_PORT0_5_ADDR_CTRL,
> +				port_addr, 5);
> +	if (err)
> +		return err;
> +
> +	err = regmap_bulk_write(priv->regmap, priv->reg_base + SMI_PORT0_15_POLLING_SEL,
> +				poll_sel, 2);
> +	if (err)
> +		return err;
> +
> +	err = regmap_update_bits(priv->regmap, priv->reg_base + SMI_GLB_CTRL,
> +				 glb_ctrl_mask, glb_ctrl_val);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int realtek_mdiobus_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct realtek_mdio_priv *priv;
> +	struct fwnode_handle *child;
> +	struct mii_bus *bus;
> +	int err;
> +
> +	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->name = "Reaktek Switch MDIO Bus";
> +	bus->read_c45 = realtek_mdio_read_c45;
> +	bus->write_c45 =  realtek_mdio_write_c45;
> +	bus->parent = dev;
> +	priv = bus->priv;
> +
> +	priv->regmap = syscon_node_to_regmap(dev->parent->of_node);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	err = device_property_read_u32(dev, "reg", &priv->reg_base);
> +	if (err)
> +		return err;
> +
> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
> +
> +	device_for_each_child_node(dev, child) {
> +		u32 pn, smi_addr[2];
> +
> +		err = fwnode_property_read_u32(child, "reg", &pn);
> +		if (err)
> +			return err;
> +
> +		if (pn > MAX_PORTS)
> +			return dev_err_probe(dev, -EINVAL, "illegal port number %d\n", pn);

You validate the port number.

> +
> +		err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
> +		if (err) {
> +			smi_addr[0] = 0;
> +			smi_addr[1] = pn;
> +		}

You don't validate the "smi_addr", so:

	realtek,smi-address = <4, ...>;

would silently overflow priv->smi_bus_isc45. However, I haven't checked
whether the binding would warn about this.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

