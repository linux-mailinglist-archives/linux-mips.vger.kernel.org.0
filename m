Return-Path: <linux-mips+bounces-7556-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7AA1739C
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 21:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 537F13A4034
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 20:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7263E1EE7AD;
	Mon, 20 Jan 2025 20:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="dDtws+AF"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4B1EE7A5
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737405178; cv=none; b=W0pFcL6mfVyfQ/xfLxI84h0TeRGOGKmv2ddICAEwctuI64RJHuXGQnUcuJdwBfpReW8A1cti6g7eyx6pcysVJkVNaVpMKGLdqwkfi8niVELYRMuqfVigWJ/GSeo9U4H/17+xJSqu7gmlpozW7NBEXnPgBsOFwoQgs67RxUHUajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737405178; c=relaxed/simple;
	bh=Zpj2CdyVyqMf1gVb7P5vBImdXKV7/Ew2GDFQVG9P2lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xkvr+erUYlT6wxl0y8GQgLktPZ9280P2+bCL+y41BOPZkf0uyDfT1HKCv0Elaohl/c1aUnoOW4La3Keb0GP/L63GpFniuJc/+ErpAeJayzMr0vWtpUm2B4Qc1hvDExJseqsH2UN0zmkbhPWLn3mK+js4AdLR1avTGj0kL5h48fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=dDtws+AF; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C32322C07F0;
	Tue, 21 Jan 2025 09:32:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737405172;
	bh=6zSTHSq/ip2zqYKCXvQnCas8dazsMfptN5G2+a+INsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dDtws+AFtqvdTcdQnygCn5NfoHe4/hmkYyeoHII1hwe0ucVJlOwX8oroD8BVWbFIU
	 G3PbH1JHwaRHkaYeygRnbcdG4XDgXwjkghRV/R5o+ttDxYuIKDM6GBlFQMvdlKBE2f
	 YCkC2orEzkQp+WJvWQjhg9MrGiYoM7hbtW1LOM981qlUvWRLS+FqMmePrdBEajUSWl
	 AXdJXO/cJBM9ZzE0mMAYw2Zh5fnv249Gtw1t2ukV3TyfpWDLodIRj/l8Ayo+gQctS9
	 HFdHskH3ir8jZ0G2ri2aYBQ+KMzUpumhmonBQeyV/Yi6AUGmvqyynNw2jRjDwPy4mD
	 65Bg+XBXF0eNQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678eb2f40000>; Tue, 21 Jan 2025 09:32:52 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 9C03313ED2A;
	Tue, 21 Jan 2025 09:32:52 +1300 (NZDT)
Message-ID: <63d6cf16-9581-4736-8592-bc5836fa51af@alliedtelesis.co.nz>
Date: Tue, 21 Jan 2025 09:32:52 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 4/4] net: mdio: Add RTL9300 MDIO driver
To: Sander Vanheule <sander@svanheule.net>, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, tsbogend@alpha.franken.de, hkallweit1@gmail.com,
 linux@armlinux.org.uk, markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-5-chris.packham@alliedtelesis.co.nz>
 <d4194a1560ff297e5ab3e6eae6d51b7c9d469381.camel@svanheule.net>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <d4194a1560ff297e5ab3e6eae6d51b7c9d469381.camel@svanheule.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678eb2f4 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=xIr6icN_5bCk336sUXQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Sander,

On 20/01/2025 23:28, Sander Vanheule wrote:
> Hi Chris,
>
> On Mon, 2025-01-20 at 17:02 +1300, Chris Packham wrote:
>> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
>> switches with integrated SoC. There are 4 physical SMI interfaces on t=
he
>> RTL9300 however access is done using the switch ports. The driver take=
s
>> the MDIO bus hierarchy from the DTS and uses this to configure the
>> switch ports so they are associated with the correct PHY. This mapping
>> is also used when dealing with software requests from phylib.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
> [...]
>
>
>> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdi=
o/mdio-realtek-rtl9300.c
>> new file mode 100644
>> index 000000000000..a9b894eff407
>> --- /dev/null
>> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
>> @@ -0,0 +1,417 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * MDIO controller for RTL9300 switches with integrated SoC.
>> + *
>> + * The MDIO communication is abstracted by the switch. At the softwar=
e level
>> + * communication uses the switch port to address the PHY with the act=
ual MDIO
>> + * bus and address having been setup via the realtek,smi-address prop=
erty.
> realtek,smi-address is a leftover from a previous spin?
Oops, will fix
>
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/mdio.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_mdio.h>
>> +#include <linux/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/regmap.h>
>> +
>> +#define SMI_GLB_CTRL			0xca00
>> +#define=C2=A0=C2=A0 GLB_CTRL_INTF_SEL(intf)	BIT(16 + (intf))
>> +#define SMI_PORT0_15_POLLING_SEL	0xca08
>> +#define SMI_ACCESS_PHY_CTRL_0		0xcb70
>> +#define SMI_ACCESS_PHY_CTRL_1		0xcb74
>> +#define=C2=A0=C2=A0 PHY_CTRL_RWOP			BIT(2)
> With
>
> #define PHY_CTRL_WRITE		BIT(2)
> #define PHY_CTRL_READ		0
>
> you could use both macros in the write/read functions. Now I have to go=
 and parse the write/read
> functions to see what it means when this bit is set.
Ack.
>> +#define=C2=A0=C2=A0 PHY_CTRL_TYPE			BIT(1)
> Similar here:
> #define	PHY_CTRL_TYPE_C22	0
> #define PHY_CTRL_TYPE_C45	BIT(1)

Ack

>> +#define=C2=A0=C2=A0 PHY_CTRL_CMD			BIT(0)
>> +#define=C2=A0=C2=A0 PHY_CTRL_FAIL			BIT(25)
>> +#define SMI_ACCESS_PHY_CTRL_2		0xcb78
>> +#define SMI_ACCESS_PHY_CTRL_3		0xcb7c
>> +#define SMI_PORT0_5_ADDR_CTRL		0xcb80
>> +
>> +#define MAX_PORTS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28
>> +#define MAX_SMI_BUSSES=C2=A0 4
>> +#define MAX_SMI_ADDR	0x1f
>> +
>> +struct rtl9300_mdio_priv;
>> +
>> +struct rtl9300_mdio_chan {
>> +	struct rtl9300_mdio_priv *priv;
>> +	u8 smi_bus;
>> +};
>> +
>> +struct rtl9300_mdio_priv {
>> +	struct regmap *regmap;
>> +	struct mutex lock; /* protect HW access */
>> +	u8 smi_bus[MAX_PORTS];
>> +	u8 smi_addr[MAX_PORTS];
>> +	bool smi_bus_isc45[MAX_SMI_BUSSES];
> Nit: add an underscore: smi_bus_is_c45

Ack

>
>> +	struct mii_bus *bus[MAX_SMI_BUSSES];
>> +};
>> +
>> +static int rtl9300_mdio_phy_to_port(struct mii_bus *bus, int phy_id)
>> +{
>> +	struct rtl9300_mdio_chan *chan =3D bus->priv;
>> +	struct rtl9300_mdio_priv *priv =3D chan->priv;
>> +	int i;
>> +
>> +	for (i =3D 0; i < MAX_PORTS; i++)
>> +		if (priv->smi_bus[i] =3D=3D chan->smi_bus &&
>> +		=C2=A0=C2=A0=C2=A0 priv->smi_addr[i] =3D=3D phy_id)
>> +			return i;
> This may break if some lower port numbers are not configured by the use=
r, e.g. phy 0-7 on bus 0 are
> mapped to ports 8-15 and ports 0-7 are unused.
> When looking up the port number of phy 0 on bus 0, you would get a matc=
h on an unconfigured port
> (port 0) since smi_bus/smi_addr are zero-initialized. This could be fix=
ed by adding a bitmap
> indicating which ports are actually configured.
Yes that makes sense.
>
>> +
>> +	return -ENOENT;
>> +}
> [...]
>
>> +static int rtl9300_mdio_read_c22(struct mii_bus *bus, int phy_id, int=
 regnum)
>> +{
> [...]
>
>> +	err =3D regmap_write(regmap, SMI_ACCESS_PHY_CTRL_1,
>> +			=C2=A0=C2=A0 regnum << 20 |=C2=A0 0x1f << 15 | 0xfff << 3 | PHY_CT=
RL_CMD);
> You could use FIELD_PREP() to pack the bitfields.
Ack.
>
>> +	if (err)
>> +		return err;
>> +
>> +	err =3D rtl9300_mdio_wait_ready(priv);
>> +	if (err)
>> +		return err;
>> +
>> +	err =3D regmap_read(regmap, SMI_ACCESS_PHY_CTRL_2, &val);
>> +	if (err)
>> +		return err;
>> +
>> +	return val & 0xffff;
> ... and FIELD_GET() to unpack.
Not sure it buys us much in this case since it's just the lower 16 bits=20
but for symmetry and a little extra type checking may as well.
>
>> +}
>> +
> [...]
>
>> +
>> +static int rtl9300_mdiobus_init(struct rtl9300_mdio_priv *priv)
>> +{
>> +	u32 glb_ctrl_mask =3D 0, glb_ctrl_val =3D 0;
>> +	struct regmap *regmap =3D priv->regmap;
>> +	u32 port_addr[5] =3D { 0 };
>> +	u32 poll_sel[2] =3D { 0 };
>> +	int i, err;
>> +
>> +	/* Associate the port with the SMI interface and PHY */
>> +	for (i =3D 0; i < MAX_PORTS; i++) {
>> +		int pos;
>> +
>> +		if (priv->smi_bus[i] > 3)
>> +			continue;
>> +
>> +		pos =3D (i % 6) * 5;
>> +		port_addr[i / 6] |=3D priv->smi_addr[i] << pos;
>> +
>> +		pos =3D (i % 16) * 2;
>> +		poll_sel[i / 16] |=3D priv->smi_bus[i] << pos;
> I've read the discussion on v1-v3 and had a quick look at the available=
 documentation. Thinking out
> loud here, so you can correct me if I'm making any false assumptions.
>
> As I understand, the SoC has four physical MDIO/MDC pin pairs. Using th=
e DT description, phy-s are
> matched with to specific MDIO bus. PORT_ADDR tells the switch which phy=
 address a port maps to.
> POLL_SEL then tells the MDIO controller which bus this port (phy) is as=
signed to. I have the
> impression this [port] <-> [bus, phy] mapping is completely arbitrary. =
If configured correctly, it
> can probably serve as a convenience to match a front panel port number =
to a specific phy.
>
> If the port numbers are in fact arbitrary, I think they could be hidden=
 from the user, removing the
> need for a custom DT property. You could probably populate the port num=
bers one by one as phy-s are
> enumerated, as you are already storing the assigned port number in the =
MDIO controller's private
> data.
>
> One complication this might have, is that I suspect these port numbers =
are not used exclusively by
> the MDIO controller, but also by the switch itself. So then there may h=
ave to be a way to resolve
> (auto-assigned) port numbers outside of this driver too.

I believe the POLL_SEL configuration actually affects an internal port=20
polling unit. From the datasheets I have it seems pretty configurable,=20
you can tell it which phy registers to poll and what values indicate=20
link up/down (the defaults are conveniently setup to match the Realtek=20
PHYs). So I don't think they are arbitrary and I don't think it would be=20
a good idea to change them on the fly. I did consider at one point=20
finding an unused port and re-mapping that to the desired bus/addr on=20
the fly but I'm not sure what that'd do to the PPU and there's no=20
guarantee that there will be a unused port.

>> +	}
>> +
>> +	/* Put the interfaces into C45 mode if required */
>> +	for (i =3D 0; i < MAX_SMI_BUSSES; i++) {
>> +		if (priv->smi_bus_isc45[i]) {
>> +			glb_ctrl_mask |=3D GLB_CTRL_INTF_SEL(i);
> Can't glb_ctrl_mask be fixed to GENMASK(19, 16)?
I guess it could be. Doing it this way avoids undoing things that may=20
have been set by an earlier boot stage but even as I type that I don't=20
find it a good argument against GENMASK(19, 16).
>
>> +			glb_ctrl_val |=3D GLB_CTRL_INTF_SEL(i);
>> +		}
>> +	}
> [...]
>
>> +static int rtl9300_mdiobus_probe_one(struct device *dev, struct rtl93=
00_mdio_priv *priv,
>> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct fwnode_handle *node)
>> +{
>> +	struct rtl9300_mdio_chan *chan;
>> +	struct fwnode_handle *child;
>> +	struct mii_bus *bus;
>> +	u32 smi_bus;
>> +	int err;
>> +
>> +	err =3D fwnode_property_read_u32(node, "reg", &smi_bus);
>> +	if (err)
>> +		return err;
>> +
>> +	if (smi_bus >=3D MAX_SMI_BUSSES)
>> +		return dev_err_probe(dev, -EINVAL, "illegal smi bus number %d\n", s=
mi_bus);
>> +
>> +	fwnode_for_each_child_node(node, child) {
>> +		u32 smi_addr;
>> +		u32 pn;
>> +
>> +		err =3D fwnode_property_read_u32(child, "reg", &smi_addr);
>> +		if (err)
>> +			return err;
> [...]
>
>> +
>> +		priv->smi_bus[pn] =3D smi_bus;
>> +		priv->smi_addr[pn] =3D smi_addr;
> Nitpicking a bit here, but perhaps the code might be a tad bit easier t=
o read for the non-Realtek
> initiated by renaming:
>    - smi_bus -> mdio_bus or just bus_id (matching the mii_bus *bus memb=
er)
>    - smi_addr -> phy_addr
I'll consider that. Certainly `u32 smi_bus` and `u32 smi_addr` can be=20
renamed to match their usage from the dts. Not so sure about=20
priv->smi_bus/priv->smi_addr as I am trying to match the usage in the=20
datasheet. I guess technically they should be smi_set and port_addr but=20
I find "port" here particularly confusing.
>> +	}
> [...]
>
>> +static int rtl9300_mdiobus_probe(struct platform_device *pdev)
>> +{
> [...]
>
>> +
>> +	if (device_get_child_node_count(dev) >=3D MAX_SMI_BUSSES)
>> +		return dev_err_probe(dev, -EINVAL, "Too many SMI busses\n");
> This seems redundant with the MAX_SMI_BUSSES comparison in probe_one().
The check in probe_one() checks that the mdio bus number is valid=20
whereas this checks that there are at most 4. So not totally redundant=20
but could probably be removed without doing any harm.
>
> Best,
> Sander

