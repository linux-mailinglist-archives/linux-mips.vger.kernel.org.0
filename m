Return-Path: <linux-mips+bounces-6990-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E945D9F0147
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 01:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F399A164A73
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 00:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982FC747F;
	Fri, 13 Dec 2024 00:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="DskBrXLi"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025AC4C7D
	for <linux-mips@vger.kernel.org>; Fri, 13 Dec 2024 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051118; cv=none; b=Ac36i2+ro6VPtC/0xtoCVpOTrhgyhGfUUAPAPXlTUeeNwan0f3Bo5fabMy9zy1SUDZtQAvBNwe3EV54cWuSGyam2c/JvBdTtJ4d2CPpE+fYOFx+RBTQ3ZT6H+V/jpk6PrkhtI11cfeepAzoJwnTIz1ARZEvNFISJfqE/GUhWbGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051118; c=relaxed/simple;
	bh=iFK9zQnpu6ftwjP/G/D6vMn2aMsIdos6kgQPzfkf7dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEV/4Me30ZR8/z9VCvfnKKlbb+yFuHWrL1R7ClDd0t+IGw5oBWQIsNa7uJE9ul0Hald5GqlbW0NCMRqVhqPnozDG1fz9hHzcTDciJj/JhBXUyiEM4TWBaI3Jf/0V6hYavqM2GlNrLTyI6L8OZbdRwvQyTOeyHf7wIrocH3xxtkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=DskBrXLi; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 01BD12C02A5;
	Fri, 13 Dec 2024 13:51:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734051108;
	bh=GxzUAEXAkhjtp42vA7TWZCbw4NxpvcuOU0R6+v4w44w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DskBrXLimYwcT0camdDAg/BJMuNSuZsRlPLh4+NlS52gpZgZXXx0uIreTe+fkbvGn
	 QnykWI4qGEiIdD4czWCAhisXluFIRvqmG+cvqm9Y7lK/P0cd36Z8Hl+isA9qKZeV/U
	 XcPzhaxF2T2YdZ4kiinfqZ+0taKjItlBJaMCpc++OS8VSZmvpFoLNu7b68UyJfkLND
	 WXlPQXcSwokp2nY2JoOB1KnunvN0MmtfLO3QayS5Nk7g8wilV6odvdzT3SLE/VIG2e
	 8XQbsxoNnTwOwMvwISV7LJPFotn3X9SgEgycy4cSyZHrG8mfoVplXJj5BsRQP6m4sZ
	 XJYON5ZnKfyWA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675b85230000>; Fri, 13 Dec 2024 13:51:47 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A4DAD13EE00;
	Fri, 13 Dec 2024 13:51:47 +1300 (NZDT)
Message-ID: <6124c7a2-e949-452e-a88d-2d747cc0f776@alliedtelesis.co.nz>
Date: Fri, 13 Dec 2024 13:51:47 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 4/4] net: mdio: Add RTL9300 MDIO driver
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, markus.stockhausen@gmx.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-5-chris.packham@alliedtelesis.co.nz>
 <Z1q0CuDXe8VFuBfZ@shell.armlinux.org.uk>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <Z1q0CuDXe8VFuBfZ@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675b8523 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=iDlK1bvE_E-H61UyTd4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Russell,

On 12/12/2024 22:59, Russell King (Oracle) wrote:
> On Thu, Dec 12, 2024 at 12:53:42PM +1300, Chris Packham wrote:
>> +#define SMI_GLB_CTRL			0x000
>> +#define   GLB_CTRL_INTF_SEL(intf)	BIT(16 + (intf))
>> +#define SMI_PORT0_15_POLLING_SEL	0x008
>> +#define SMI_ACCESS_PHY_CTRL_0		0x170
>> +#define SMI_ACCESS_PHY_CTRL_1		0x174
>> +#define   PHY_CTRL_RWOP			BIT(2)
> Presumably, reading the code, this bit is set when writing?
Correct. I've tried to use the bit field names from the datasheet. RWOP 
0=read, 1=write.
>> +#define   PHY_CTRL_TYPE			BIT(1)
> Presumably, reading the code, this bit indicates we want to use clause
> 45?

Yes. Technically the datasheet says 0=normal register, 1=MMD register.

>> +#define   PHY_CTRL_CMD			BIT(0)
>> +#define   PHY_CTRL_FAIL			BIT(25)
>> +#define SMI_ACCESS_PHY_CTRL_2		0x178
>> +#define SMI_ACCESS_PHY_CTRL_3		0x17c
>> +#define SMI_PORT0_5_ADDR_CTRL		0x180
>> +
>> +#define MAX_PORTS       32
>> +#define MAX_SMI_BUSSES  4
>> +
>> +struct realtek_mdio_priv {
>> +	struct regmap *regmap;
>> +	u8 smi_bus[MAX_PORTS];
>> +	u8 smi_addr[MAX_PORTS];
>> +	bool smi_bus_isc45[MAX_SMI_BUSSES];
> Not sure about the support for !C45 - you appear to set this if you
> find a PHY as a child of this device which has the PHY C45 compatible,
> but as you don't populate the C22 MDIO bus operations, I'm not sure
> how a C22 PHY can work.

Oops, yes I forgot to come back to C22. Most of the hardware I have 
access to uses C45 so that's been my main test setup. I'll include C22 
support in v2.

>> +	u32 reg_base;
>> +};
>> +
>> +static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)
>> +{
>> +	u32 val;
>> +
>> +	return regmap_read_poll_timeout(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_1,
>> +					val, !(val & PHY_CTRL_CMD), 10, 500);
>> +}
>> +
>> +static int realtek_mdio_read_c45(struct mii_bus *bus, int phy_id, int dev_addr, int regnum)
>> +{
>> +	struct realtek_mdio_priv *priv = bus->priv;
>> +	u32 val;
>> +	int err;
>> +
>> +	err = realtek_mdio_wait_ready(priv);
>> +	if (err)
>> +		return err;
>> +
>> +	err = regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_2, phy_id << 16);
>> +	if (err)
>> +		return err;
>> +
>> +	err = regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_3,
>> +			   dev_addr << 16 | (regnum & 0xffff));
>> +	if (err)
>> +		return err;
>> +
>> +	err = regmap_write(priv->regmap, priv->reg_base + SMI_ACCESS_PHY_CTRL_1,
>> +			   PHY_CTRL_TYPE | PHY_CTRL_CMD);
>> +	if (err)
>> +		return err;
> Maybe consider using a local variable for "regmap" and "reg_base" to
> reduce the line length/wrapping?
Ok
>> +static int realtek_mdiobus_init(struct realtek_mdio_priv *priv)
>> +{
>> +	u32 port_addr[5] = { };
>> +	u32 poll_sel[2] = { 0, 0 };
>> +	u32 glb_ctrl_mask = 0, glb_ctrl_val = 0;
> Please use reverse Christmas tree order.
Ok.
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
> s/  / /
Ok.
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
> You validate the port number.
>
>> +
>> +		err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
>> +		if (err) {
>> +			smi_addr[0] = 0;
>> +			smi_addr[1] = pn;
>> +		}
> You don't validate the "smi_addr", so:
>
> 	realtek,smi-address = <4, ...>;
>
> would silently overflow priv->smi_bus_isc45. However, I haven't checked
> whether the binding would warn about this.

I'll make sure the smi bus and phy address are within an appropriate range.



