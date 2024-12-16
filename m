Return-Path: <linux-mips+bounces-7056-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C69F3D01
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 22:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDF4616C3BC
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 21:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CDF1D61A7;
	Mon, 16 Dec 2024 21:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="CSg7z1OI"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6421B87E0
	for <linux-mips@vger.kernel.org>; Mon, 16 Dec 2024 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734385636; cv=none; b=CZG1rVd3xDQg3HOfgB9+ExrhrGgs8UfQksNtG8rdtQ6ST2f1nVE8Gx/H+/TLbvAXcHnEEcBH9NaxfEO0z92oZVjZK5pre6AHg+GcIrZgb8x0QFf4LO68oyNPvqztf88mQetIufxB0gKO8KAOFA80JB8ABULgIdYpcjctX5sQHok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734385636; c=relaxed/simple;
	bh=GiyAav8BXYZqsXgqsh8Cs6jCSKLPXEo+MstoFe/VrbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YS4x7j+9/PYbUFqZg6o9KlZIofr3ld5Y7k+8F1apHsuLKMsiclTXNduifiyjsdc7TAIHoeYJdoXQeLgewoGtxa6By4QvHxyONORyTsoVq9Cn4dyt1lbHCUSZMgtWrwhjiC9zIzWtwljdk5f/Bj1JkYJSbSyXEdN7bS8ototAmHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=CSg7z1OI; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 364B82C097F;
	Tue, 17 Dec 2024 10:47:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734385630;
	bh=uEtrjirkbc1c4fmNTn0NYmmHEdfisUyR/ER4gLI/RxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CSg7z1OIjwq88geczSeena6WKBRg20FTTzI2SMWTMmyRdN94yEDMmmAKlWh3vE2tz
	 Qb80rM80KKlnFp5P/W4IZawAVtp9MB0sjqXwWxAjLZrQVQLX0E/30mLRdxTElenDBQ
	 /EhVYUuqqUz3ctynpprlRriQzTo0sdYChJFfeBY5SLDsb/cO9Tqk51c/ux5KUdyQOK
	 8Ns8KXPTJkyO+CWtd0PmPqNUryXJv25BFLSmN1xomxrRaZe8hE6sZgWqeqjjUEWPXa
	 dY2JsXE+RDj6lYh6WFjQqeVoG/A6AABYDJyFwzlNHcNc7NKgiHKaNitmQVPpqfcJ/f
	 gC2SPC8zQftUA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67609fde0000>; Tue, 17 Dec 2024 10:47:10 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0E73713ED95;
	Tue, 17 Dec 2024 10:47:10 +1300 (NZDT)
Message-ID: <cf77f08d-0516-4adf-a701-9589f0d99eb5@alliedtelesis.co.nz>
Date: Tue, 17 Dec 2024 10:47:10 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
To: Simon Horman <horms@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
 <20241216164814.GH780307@kernel.org>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20241216164814.GH780307@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=67609fde a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=KkFew8YCm9Hy8_kfsgoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 17/12/2024 05:48, Simon Horman wrote:
> On Mon, Dec 16, 2024 at 04:13:46PM +1300, Chris Packham wrote:
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
>> +#define MAX_SMI_BUSSES  4
>> +#define MAX_SMI_ADDR	0x1f
>> +
>> +struct realtek_mdio_priv {
>> +	struct regmap *regmap;
>> +	u8 smi_bus[MAX_PORTS];
>> +	u8 smi_addr[MAX_PORTS];
>> +	bool smi_bus_isc45[MAX_SMI_BUSSES];
>> +	u32 reg_base;
>> +};
> ...
>
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
>> +	bus->read = realtek_mdio_read_c22;
>> +	bus->write = realtek_mdio_write_c22;
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
>> +		if (pn >= MAX_PORTS)
>> +			return dev_err_probe(dev, -EINVAL, "illegal port number %d\n", pn);
>> +
>> +		err = fwnode_property_read_u32_array(child, "realtek,smi-address", smi_addr, 2);
>> +		if (err) {
>> +			smi_addr[0] = 0;
>> +			smi_addr[1] = pn;
>> +		}
>> +
>> +		if (smi_addr[0] > MAX_SMI_BUSSES)
> Hi Chris,
>
> Should this condition be
>
> 		if (smi_addr[0] >= MAX_SMI_BUSSES)
Yes. You are correct.
>> +			return dev_err_probe(dev, -EINVAL, "illegal smi bus number %d\n",
>> +					     smi_addr[0]);
>> +
>> +		if (smi_addr[1] > MAX_SMI_ADDR)
>> +			return dev_err_probe(dev, -EINVAL, "illegal smi addr %d\n", smi_addr[1]);
>> +
>> +		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
>> +			priv->smi_bus_isc45[smi_addr[0]] = true;
> Otherwise it seems that smi_bus_isc45 may overflow here.
>
> Flagged by Smatch.

Sounds like something I should start looking at for myself. Have you got 
a link to share?

>> +
>> +		priv->smi_bus[pn] = smi_addr[0];
>> +		priv->smi_addr[pn] = smi_addr[1];
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
>

