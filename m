Return-Path: <linux-mips+bounces-7022-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD929F1714
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 21:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6981881E09
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 20:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD045190054;
	Fri, 13 Dec 2024 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amplVAJi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9A18FC65;
	Fri, 13 Dec 2024 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734119957; cv=none; b=mVklPVAsg4V0vv5yQDeAaHeVIkJROMywK+2tfBJtqdzKL3W4+xggLKX3JT1SbBhxNuJ3noBY16zEcCAz7QqGbxlkIt9ctrXypA1Ajqzxqha+xvAtRMYkmWXKXI9jacAXTFeDDhvv6H0EADIzeRZHZXYZRh8/+rU7P6JV3xJ8Scs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734119957; c=relaxed/simple;
	bh=VIi/j6GUtGfCv8VCvRaxNh+DXnQvQw/j1YDTFZRluuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNuDndxbBp8n+V3FEAYE0rFsdZ6pY1AZJBIFlzvg1qjE5ArHOIq60GUXpaG35CNIKd7CwaEgRaVjbWSAFcrGW8nYRdnJCnYr66GuNNeiczd2L2OmAjbUSeaNLsmUOYXOuz1CkfI4UsdFC2KwElOcwdvwfVUEPyfE1fo2lJ2elCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amplVAJi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18D4C4CED4;
	Fri, 13 Dec 2024 19:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734119957;
	bh=VIi/j6GUtGfCv8VCvRaxNh+DXnQvQw/j1YDTFZRluuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amplVAJidGsl6ZQn8iikswx5HJHFLjw9zu2Kt49AU/IVO9rFj2y6atykobSmRx0Xu
	 8cIy1bmiftOigTonulLTKByCfvOKlpXIyZr/Mnqszc7UqT2k9VneP6pnjbobGjafll
	 gd4Cj1WWR+JUqaBiOZGuvC89/D7psJCN5H9fpkNv4ZqsfqBEoxAkZDfzV/s7BAIIdU
	 x6Ea6lUM56XxQhbPn1ndEPdfRPYBPqqbgnQiJzpb0VmgPZEwcfNV47B9KYrWhwFRMz
	 jBrBoqcKJ1NH5+3F+pIghjEvBMmV/EITZ4vmKu304X0OCFuUy+dmPAdVFchvQGUtqV
	 QMMbOoW5GTzYA==
Date: Fri, 13 Dec 2024 19:59:11 +0000
From: Simon Horman <horms@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <20241213195911.GF561418@kernel.org>
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

On Thu, Dec 12, 2024 at 12:53:42PM +1300, Chris Packham wrote:
> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> switches with integrated SoC. There are 4 physical SMI interfaces on the
> RTL9300 but access is done using the switch ports so a single MDIO bus
> is presented to the rest of the system.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

...

> diff --git a/drivers/net/mdio/mdio-realtek-rtl.c b/drivers/net/mdio/mdio-realtek-rtl.c

...

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

Hi Chris,

The maximum index of port_addr accessed above is
(MAX_PORTS - 1) / 6 = (32 - 1) / 6 = 5.
But port_addr only has five elements (maximum index of 4).
So this will overflow.

Flagged by Smatch.

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
> +
> +		err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
> +		if (err) {
> +			smi_addr[0] = 0;
> +			smi_addr[1] = pn;
> +		}
> +
> +		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
> +			priv->smi_bus_isc45[smi_addr[0]] = true;
> +
> +		priv->smi_bus[pn] = smi_addr[0];
> +		priv->smi_addr[pn] = smi_addr[1];

The condition about 15 lines above ensures that the maximum value of pn
is MAX_PORTS. But if this is the case then the above will overflow
both smi_bus and smi_addr as they each have MAX_PORTS elements
(maximum index of MAX_PORTS - 1).

I suspect the condition above should be updated to:

	if (pn >= MAX_PORTS)
		return ...

Also flagged by Smatch.

> +	}
> +
> +	err = realtek_mdiobus_init(priv);
> +	if (err)
> +		return dev_err_probe(dev, err, "failed to initialise MDIO bus controller\n");
> +
> +	err = devm_of_mdiobus_register(dev, bus, dev->of_node);
> +	if (err)
> +		return dev_err_probe(dev, err, "cannot register MDIO bus\n");
> +
> +	return 0;
> +}

...

