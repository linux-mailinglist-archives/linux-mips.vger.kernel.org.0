Return-Path: <linux-mips+bounces-6960-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F89EE064
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 08:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C287C188640C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 07:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F98204F96;
	Thu, 12 Dec 2024 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yLdzr3Vn"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660025949C;
	Thu, 12 Dec 2024 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989327; cv=none; b=qhhlX1TcyMLZM/UMWSKfFjxTGdbkyIHLEOgrR8p0JNbPeALJnzOUb+LvDn3HnKUR7NNbNKkTWKqjZ0WCNkiHEOAQaX9BGOfwd8iB2LUGQTtU8RjpaXgnBNmwjV7KuG+/2ZVL9IBUwXaBazwYj5JZ1DfnqrNV8Bp5Fk0tOz+VwVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989327; c=relaxed/simple;
	bh=22g68YoUG7ggvCcHl2heS5NuYgSrkP+Tus51SlR8lr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ij2KSIupGcyKzgrLz+UMi6vpqBLKkLNuM6UtY+9/eqUz6tzoRHvQKA34AAgM7D3ZlCLIl5xqbgvcDgZb2nPPOQn6JNB9SyJHrUpMwZHg/ylWNtwFLpLnr1M4QsR1eSHeoErz6ld2p8VP2mEmV8Ttfd9fW8AzO/OK4JVoLinbPH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yLdzr3Vn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+T1OM/4I/e4utRodgxqpykIDeKJt0bCoOkqM8Dxbxek=; b=yLdzr3Vn6s+jjfyD9VxGX5qMAF
	EqPr5/+u6TVImRbAQqE0AsZDajl40IPeoUslp5rjTS1pJ9WoOddyn6bkUMMUUvczg/lPqHdOjeY7o
	W54413RVE5O39+1yGDVa8nVehT0/7UHinzjzQjYUucPTHmC2TAQTK6HDHvkBz3fsgcJk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tLdpD-000Arz-6f; Thu, 12 Dec 2024 08:41:31 +0100
Date: Thu, 12 Dec 2024 08:41:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <2424683a-4620-43e6-9693-2cf959eacb7c@lunn.ch>
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

> +	/* get_phy_c45_ids() will stop the mdio bus scan if we return an error
> +	 * here. So even though the SMI controller indicates an error for an
> +	 * absent device don't proagate it here.
> +	 */
> +	//if (val & BIT(25)) {
> +	//	err = -ENODEV;
> +	//	return err;
> +	//}

Please don't leave committed out code. It should either be needed, and
uncommented, or deleted.

> +static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
> +{
> +	u32 port_addr[5] = { };
> +	u32 poll_sel[2] = { 0, 0 };
> +	u32 glb_ctrl_mask = 0, glb_ctrl_val = 0;
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

Please could you add some comments because i don't understand this at
all.

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
> +
> +		err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
> +		if (err) {
> +			smi_addr[0] = 0;
> +			smi_addr[1] = pn;
> +		}

Would returning -EINVAL be better here, since it indicates a bug in
the device tree?

> +
> +		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
> +			priv->smi_bus_isc45[smi_addr[0]] = true;

If it is not C45 then what? I don't see any support for C22.

	Andrew

