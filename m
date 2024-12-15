Return-Path: <linux-mips+bounces-7025-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB79F2606
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2024 21:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83227188590A
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2024 20:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86CB1B4125;
	Sun, 15 Dec 2024 20:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="eFJRBTBP"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10901189905
	for <linux-mips@vger.kernel.org>; Sun, 15 Dec 2024 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734294444; cv=none; b=fniiiamKw3tzlr+EAw6wAlHcaovye2k+7G++lfy2pTgAcESK2w5P1V35eW1aHpgRinfzL7N3pE2Dplyj35e7458VZ2JyO4ydEnVA2s7Cd+BUea2MOrK5cGT3bF7qbVQ3dfwjGO+yS6IY7GPheGXO/kiIT/0YWbiiACEEfRCXkw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734294444; c=relaxed/simple;
	bh=f5DAW3+f795DgZCt4sr1NZnCVK/tOzCH9ov3xlcpkHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3JCvmX3wqpOm0ZJehmknrpG/u9Zm/rS1HQCWXNDkTCf12vThoz8vnb9yD0MzTQBGY8K13Ed9N94f5msWChcXGAy3XM9bZPOMgeW129FDQr+DAkJQOR7idHpbP1nkIdI2nmm51GUouMQkGaQifhXqT+6VOkiwDwjjvfVtOP5kr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=eFJRBTBP; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DC84D2C03C9;
	Mon, 16 Dec 2024 09:27:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734294439;
	bh=qsUFAijF4WKH/nYMIkBPJ6k6amC+zkvwUC6O275o3eA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eFJRBTBPqjDi4JqhovGZymRivBhebvDTwg7PPN6TJMIGxWN3GOhKECM4O7ofb14yO
	 gQtXj9Jl9NJmAv4ia+3uaRuOafOuWKK6jM0ylmnFYzjcd3KJIpE74NCvnXvEydslcY
	 r8JbUBSrWynLLyylRN9ffrIh9ngzrO3la6BvbyPLGt5faAX13e9jK/S18cgPL+Yvfh
	 tu+dqGvGJxbDueXOSe+6JyiKNLSail+pzgxtnXrW8XFUnonWipaBaYWdsqHH2ebCgb
	 YMjLDu3i05leQH30FCdP/BGRQbd+2EeieJTZGiEMTY84VlplpGGtqIoj+F9TkYx0m9
	 +KbPgvQMZF7wg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675f3ba70000>; Mon, 16 Dec 2024 09:27:19 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id BF17213ED7B;
	Mon, 16 Dec 2024 09:27:19 +1300 (NZDT)
Message-ID: <44978be8-2494-4d4c-b718-668f8205176a@alliedtelesis.co.nz>
Date: Mon, 16 Dec 2024 09:27:19 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 4/4] net: mdio: Add RTL9300 MDIO driver
To: Simon Horman <horms@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-5-chris.packham@alliedtelesis.co.nz>
 <20241213195911.GF561418@kernel.org>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20241213195911.GF561418@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675f3ba7 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=oIK0dgETfHc4Cs-NtC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 14/12/2024 08:59, Simon Horman wrote:
> On Thu, Dec 12, 2024 at 12:53:42PM +1300, Chris Packham wrote:
>> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
>> switches with integrated SoC. There are 4 physical SMI interfaces on the
>> RTL9300 but access is done using the switch ports so a single MDIO bus
>> is presented to the rest of the system.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ...
>
>> diff --git a/drivers/net/mdio/mdio-realtek-rtl.c b/drivers/net/mdio/mdio-realtek-rtl.c
> ...
>
>> +static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
>> +{
>> +	u32 port_addr[5] = { };
>> +	u32 poll_sel[2] = { 0, 0 };
>> +	u32 glb_ctrl_mask = 0, glb_ctrl_val = 0;
>> +	int i, err;
>> +
>> +	for (i = 0; i < MAX_PORTS; i++) {
>> +		int pos;
>> +
>> +		if (priv->smi_bus[i] > 3)
>> +			continue;
>> +
>> +		pos = (i % 6) * 5;
>> +		port_addr[i / 6] |=  priv->smi_addr[i] << pos;
> Hi Chris,
>
> The maximum index of port_addr accessed above is
> (MAX_PORTS - 1) / 6 = (32 - 1) / 6 = 5.
> But port_addr only has five elements (maximum index of 4).
> So this will overflow.
>
> Flagged by Smatch.

Drat. It's more complicated than that. The maximum number of _physical_ 
ports on the RTL9300 is 28 (i.e. 0-27). In some other places port 28 is 
used to mean the CPU port (i.e. the DMA interface) and in others it just 
uses 32 possible ports because that makes the tables entries align 
nicely. Since this is just the MDIO interface, setting MAX_PORTS to 28 
here seems like the sensible thing to do.

>> +
>> +		pos = (i % 16) * 2;
>> +		poll_sel[i / 16] |= priv->smi_bus[i] << pos;
>> +	}
>> +
>> +	for (i = 0; i < MAX_SMI_BUSSES; i++) {
>> +		if (priv->smi_bus_isc45[i]) {
>> +			glb_ctrl_mask |= GLB_CTRL_INTF_SEL(i);
>> +			glb_ctrl_val |= GLB_CTRL_INTF_SEL(i);
>> +		}
>> +	}
>> +
>> +	err = regmap_bulk_write(priv->regmap, priv->reg_base + SMI_PORT0_5_ADDR_CTRL,
>> +				port_addr, 5);
>> +	if (err)
>> +		return err;
>> +
>> +	err = regmap_bulk_write(priv->regmap, priv->reg_base + SMI_PORT0_15_POLLING_SEL,
>> +				poll_sel, 2);
>> +	if (err)
>> +		return err;
>> +
>> +	err = regmap_update_bits(priv->regmap, priv->reg_base + SMI_GLB_CTRL,
>> +				 glb_ctrl_mask, glb_ctrl_val);
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +static int realtek_mdiobus_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct realtek_mdio_priv *priv;
>> +	struct fwnode_handle *child;
>> +	struct mii_bus *bus;
>> +	int err;
>> +
>> +	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
>> +	if (!bus)
>> +		return -ENOMEM;
>> +
>> +	bus->name = "Reaktek Switch MDIO Bus";
>> +	bus->read_c45 = realtek_mdio_read_c45;
>> +	bus->write_c45 =  realtek_mdio_write_c45;
>> +	bus->parent = dev;
>> +	priv = bus->priv;
>> +
>> +	priv->regmap = syscon_node_to_regmap(dev->parent->of_node);
>> +	if (IS_ERR(priv->regmap))
>> +		return PTR_ERR(priv->regmap);
>> +
>> +	err = device_property_read_u32(dev, "reg", &priv->reg_base);
>> +	if (err)
>> +		return err;
>> +
>> +	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
>> +
>> +	device_for_each_child_node(dev, child) {
>> +		u32 pn, smi_addr[2];
>> +
>> +		err = fwnode_property_read_u32(child, "reg", &pn);
>> +		if (err)
>> +			return err;
>> +
>> +		if (pn > MAX_PORTS)
>> +			return dev_err_probe(dev, -EINVAL, "illegal port number %d\n", pn);
>> +
>> +		err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
>> +		if (err) {
>> +			smi_addr[0] = 0;
>> +			smi_addr[1] = pn;
>> +		}
>> +
>> +		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
>> +			priv->smi_bus_isc45[smi_addr[0]] = true;
>> +
>> +		priv->smi_bus[pn] = smi_addr[0];
>> +		priv->smi_addr[pn] = smi_addr[1];
> The condition about 15 lines above ensures that the maximum value of pn
> is MAX_PORTS. But if this is the case then the above will overflow
> both smi_bus and smi_addr as they each have MAX_PORTS elements
> (maximum index of MAX_PORTS - 1).
>
> I suspect the condition above should be updated to:
>
> 	if (pn >= MAX_PORTS)
> 		return ...
>
> Also flagged by Smatch.
Good catch thanks. Will fix in v2.
>> +	}
>> +
>> +	err = realtek_mdiobus_init(priv);
>> +	if (err)
>> +		return dev_err_probe(dev, err, "failed to initialise MDIO bus controller\n");
>> +
>> +	err = devm_of_mdiobus_register(dev, bus, dev->of_node);
>> +	if (err)
>> +		return dev_err_probe(dev, err, "cannot register MDIO bus\n");
>> +
>> +	return 0;
>> +}
> ...

