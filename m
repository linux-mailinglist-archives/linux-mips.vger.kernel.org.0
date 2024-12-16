Return-Path: <linux-mips+bounces-7050-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C879A9F36AD
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 17:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95B381888A0F
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 16:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEA620B7F1;
	Mon, 16 Dec 2024 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbD9eVXJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971A2063D7;
	Mon, 16 Dec 2024 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734367701; cv=none; b=oUFDPXfMecEt1P28KHYMn34YtsnUpwuomF1s7TV0CUY5tlT/pO+wY+pr57yQygtUujdF8MYjY/mjpT2qfDUaCAOX2ksXn1rJD875U2OPJza1WBLQaQLW7BxD4OqA00QK1mRaLT7WlpvQdxTXOfcTI2fYc+vifyKB7UrYBgYKe20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734367701; c=relaxed/simple;
	bh=OdhncL6PuYJrF3V6NaNai3NQcwLE2g+qf2jb4TEKVqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8MbnuIKL0a9oI1P3s6eOTXjGyZXvbuazY9J9Y97NcP6o1j8B81eBmuIq1SvtjmafvwAlNUlYAg4iTUr0MVSGczroQ/rhatHnTabmSSbOiXWDkchb0lpGuUYiY2IFE3+9pYjn3ezaRbC4Mt5+GFO9eN3A2vSrB2DFbqRlAfutog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbD9eVXJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2128CC4CED0;
	Mon, 16 Dec 2024 16:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734367701;
	bh=OdhncL6PuYJrF3V6NaNai3NQcwLE2g+qf2jb4TEKVqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbD9eVXJ+w4Oxe0Ltt/14FzDaq8ZAVhhTUd2qjD8ThpkRerC1T9s98lIbExFySZs2
	 /jKqQxhz4U2vV3fDiyMq/cpNC0GtXOeu9zXac009QRFlsBz3PQuE9z+FhfXRZv0x9o
	 3BCYRS3vzF3piaUGqN91oyO8CEtbk5GUvba/uXcC+9W3EDctMUSOWwZHdaefOPeFul
	 YdYBddBzWrndG7bS+popwCO3s+c0GfmK3fQLGzc97phjNRWuIfSLqMlEQonn7zqWBs
	 c3hDpz2iSxrXdbhUKVtgUfs60T1wSAAatKOlGJyf47jIv4eZgW8Pj1djMp5dYSB5Fb
	 xekx59oR7azdw==
Date: Mon, 16 Dec 2024 16:48:14 +0000
From: Simon Horman <horms@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
Message-ID: <20241216164814.GH780307@kernel.org>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>

On Mon, Dec 16, 2024 at 04:13:46PM +1300, Chris Packham wrote:
> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> switches with integrated SoC. There are 4 physical SMI interfaces on the
> RTL9300 but access is done using the switch ports so a single MDIO bus
> is presented to the rest of the system.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

...

> diff --git a/drivers/net/mdio/mdio-realtek-rtl.c b/drivers/net/mdio/mdio-realtek-rtl.c

...

> +#define MAX_SMI_BUSSES  4
> +#define MAX_SMI_ADDR	0x1f
> +
> +struct realtek_mdio_priv {
> +	struct regmap *regmap;
> +	u8 smi_bus[MAX_PORTS];
> +	u8 smi_addr[MAX_PORTS];
> +	bool smi_bus_isc45[MAX_SMI_BUSSES];
> +	u32 reg_base;
> +};

...

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
> +	bus->read = realtek_mdio_read_c22;
> +	bus->write = realtek_mdio_write_c22;
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
> +		if (pn >= MAX_PORTS)
> +			return dev_err_probe(dev, -EINVAL, "illegal port number %d\n", pn);
> +
> +		err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
> +		if (err) {
> +			smi_addr[0] = 0;
> +			smi_addr[1] = pn;
> +		}
> +
> +		if (smi_addr[0] > MAX_SMI_BUSSES)

Hi Chris,

Should this condition be

		if (smi_addr[0] >= MAX_SMI_BUSSES)


> +			return dev_err_probe(dev, -EINVAL, "illegal smi bus number %d\n",
> +					     smi_addr[0]);
> +
> +		if (smi_addr[1] > MAX_SMI_ADDR)
> +			return dev_err_probe(dev, -EINVAL, "illegal smi addr %d\n", smi_addr[1]);
> +
> +		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
> +			priv->smi_bus_isc45[smi_addr[0]] = true;

Otherwise it seems that smi_bus_isc45 may overflow here.

Flagged by Smatch.

> +
> +		priv->smi_bus[pn] = smi_addr[0];
> +		priv->smi_addr[pn] = smi_addr[1];
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

-- 
pw-bot: changes-requested

