Return-Path: <linux-mips+bounces-7547-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFFA16AB8
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 11:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E4493A387A
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52341B413E;
	Mon, 20 Jan 2025 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Y1ci6FWv"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811E91B414F
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368952; cv=none; b=d31I41SuShNQLGZs3XJAov3eEPHBw4LUTt1NhbxBWS3DqeGijm1tc2hkqncnJMaJFc2B2pLPj+AtYxb41djOdvVhfwNs2fbkk7zqqn5WOi+pNHkTnnzvb6iMMzrUgvUQ6lFkh0jGsMDQ2FjVKUY5wE54beTClQDkTi7yQZ689rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368952; c=relaxed/simple;
	bh=pzXPx9tFLkGyZxuUHk3rwrFmRMCwAhLKeu65smPL7rc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ppi+Ir0C4HU/jwWK2DXo5Gu8tQLytAalrzv8I0njk+2xyk8BNbSNd2HyNrAXGvbvANv0B5yIQKXd6bMWwcZfHKg+zDkHqOydKwGUG7eOcEFhBp+TTnaxS7kBN/prPItjvf7gx1l6Ni1nNGhPH5qa6aFSgsNfqo150ILajhHUEWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Y1ci6FWv; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [192.168.90.237] (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 9C71C5A8555;
	Mon, 20 Jan 2025 11:29:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1737368947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IYvDYWDDz8bQtTYvekPdCA3x3++SHn4tXjMEWG1df0=;
	b=Y1ci6FWvrrOPzkfGjIJEoeUQ+7wsfRr1Zlylddl1RwzPujxT8it1Db9jgp19LR2RcDOksr
	6HXa8npzc+dVgF9fZclK1PI6gOhpJvsfMtXo/c5pST4+nd9e+5sFDtm9xJktrp74Pt09Bh
	6l9PBiRqlYs/yfVtNmmZGOc1pKJA+n8+gLIez0pc1EPhb9Xlz7KerQR3G+gxL/SiIkAr5e
	qPzfg9VjGM3J3ljYirr2IIx0wuf6gbKegg94kCjtm2CbFWQDfvWjxXNR7UsKkeiyY2uYWQ
	LiKCqNzY1wkDx1ceFFmBGo59LOpSESwYTis/jRXqX48ja/joEZ1c/oWM5XkrhA==
Message-ID: <d4194a1560ff297e5ab3e6eae6d51b7c9d469381.camel@svanheule.net>
Subject: Re: [PATCH v4 4/4] net: mdio: Add RTL9300 MDIO driver
From: Sander Vanheule <sander@svanheule.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, lee@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, 	davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, 	tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, 	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Date: Mon, 20 Jan 2025 11:28:44 +0100
In-Reply-To: <20250120040214.2538839-5-chris.packham@alliedtelesis.co.nz>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
	 <20250120040214.2538839-5-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Chris,

On Mon, 2025-01-20 at 17:02 +1300, Chris Packham wrote:
> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> switches with integrated SoC. There are 4 physical SMI interfaces on the
> RTL9300 however access is done using the switch ports. The driver takes
> the MDIO bus hierarchy from the DTS and uses this to configure the
> switch ports so they are associated with the correct PHY. This mapping
> is also used when dealing with software requests from phylib.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---

[...]


> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> new file mode 100644
> index 000000000000..a9b894eff407
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
> @@ -0,0 +1,417 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MDIO controller for RTL9300 switches with integrated SoC.
> + *
> + * The MDIO communication is abstracted by the switch. At the software l=
evel
> + * communication uses the switch port to address the PHY with the actual=
 MDIO
> + * bus and address having been setup via the realtek,smi-address propert=
y.

realtek,smi-address is a leftover from a previous spin?

> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/mdio.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/of_mdio.h>
> +#include <linux/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define SMI_GLB_CTRL			0xca00
> +#define=C2=A0=C2=A0 GLB_CTRL_INTF_SEL(intf)	BIT(16 + (intf))
> +#define SMI_PORT0_15_POLLING_SEL	0xca08
> +#define SMI_ACCESS_PHY_CTRL_0		0xcb70
> +#define SMI_ACCESS_PHY_CTRL_1		0xcb74
> +#define=C2=A0=C2=A0 PHY_CTRL_RWOP			BIT(2)

With

#define PHY_CTRL_WRITE		BIT(2)
#define PHY_CTRL_READ		0

you could use both macros in the write/read functions. Now I have to go and=
 parse the write/read
functions to see what it means when this bit is set.

> +#define=C2=A0=C2=A0 PHY_CTRL_TYPE			BIT(1)

Similar here:
#define	PHY_CTRL_TYPE_C22	0
#define PHY_CTRL_TYPE_C45	BIT(1)

> +#define=C2=A0=C2=A0 PHY_CTRL_CMD			BIT(0)
> +#define=C2=A0=C2=A0 PHY_CTRL_FAIL			BIT(25)
> +#define SMI_ACCESS_PHY_CTRL_2		0xcb78
> +#define SMI_ACCESS_PHY_CTRL_3		0xcb7c
> +#define SMI_PORT0_5_ADDR_CTRL		0xcb80
> +
> +#define MAX_PORTS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28
> +#define MAX_SMI_BUSSES=C2=A0 4
> +#define MAX_SMI_ADDR	0x1f
> +
> +struct rtl9300_mdio_priv;
> +
> +struct rtl9300_mdio_chan {
> +	struct rtl9300_mdio_priv *priv;
> +	u8 smi_bus;
> +};
> +
> +struct rtl9300_mdio_priv {
> +	struct regmap *regmap;
> +	struct mutex lock; /* protect HW access */
> +	u8 smi_bus[MAX_PORTS];
> +	u8 smi_addr[MAX_PORTS];
> +	bool smi_bus_isc45[MAX_SMI_BUSSES];
Nit: add an underscore: smi_bus_is_c45

> +	struct mii_bus *bus[MAX_SMI_BUSSES];
> +};
> +
> +static int rtl9300_mdio_phy_to_port(struct mii_bus *bus, int phy_id)
> +{
> +	struct rtl9300_mdio_chan *chan =3D bus->priv;
> +	struct rtl9300_mdio_priv *priv =3D chan->priv;
> +	int i;
> +
> +	for (i =3D 0; i < MAX_PORTS; i++)
> +		if (priv->smi_bus[i] =3D=3D chan->smi_bus &&
> +		=C2=A0=C2=A0=C2=A0 priv->smi_addr[i] =3D=3D phy_id)
> +			return i;

This may break if some lower port numbers are not configured by the user, e=
.g. phy 0-7 on bus 0 are
mapped to ports 8-15 and ports 0-7 are unused.
When looking up the port number of phy 0 on bus 0, you would get a match on=
 an unconfigured port
(port 0) since smi_bus/smi_addr are zero-initialized. This could be fixed b=
y adding a bitmap
indicating which ports are actually configured.

> +
> +	return -ENOENT;
> +}

[...]

> +static int rtl9300_mdio_read_c22(struct mii_bus *bus, int phy_id, int re=
gnum)
> +{

[...]

> +	err =3D regmap_write(regmap, SMI_ACCESS_PHY_CTRL_1,
> +			=C2=A0=C2=A0 regnum << 20 |=C2=A0 0x1f << 15 | 0xfff << 3 | PHY_CTRL_=
CMD);

You could use FIELD_PREP() to pack the bitfields.

> +	if (err)
> +		return err;
> +
> +	err =3D rtl9300_mdio_wait_ready(priv);
> +	if (err)
> +		return err;
> +
> +	err =3D regmap_read(regmap, SMI_ACCESS_PHY_CTRL_2, &val);
> +	if (err)
> +		return err;
> +
> +	return val & 0xffff;

... and FIELD_GET() to unpack.

> +}
> +

[...]

> +
> +static int rtl9300_mdiobus_init(struct rtl9300_mdio_priv *priv)
> +{
> +	u32 glb_ctrl_mask =3D 0, glb_ctrl_val =3D 0;
> +	struct regmap *regmap =3D priv->regmap;
> +	u32 port_addr[5] =3D { 0 };
> +	u32 poll_sel[2] =3D { 0 };
> +	int i, err;
> +
> +	/* Associate the port with the SMI interface and PHY */
> +	for (i =3D 0; i < MAX_PORTS; i++) {
> +		int pos;
> +
> +		if (priv->smi_bus[i] > 3)
> +			continue;
> +
> +		pos =3D (i % 6) * 5;
> +		port_addr[i / 6] |=3D priv->smi_addr[i] << pos;
> +
> +		pos =3D (i % 16) * 2;
> +		poll_sel[i / 16] |=3D priv->smi_bus[i] << pos;

I've read the discussion on v1-v3 and had a quick look at the available doc=
umentation. Thinking out
loud here, so you can correct me if I'm making any false assumptions.

As I understand, the SoC has four physical MDIO/MDC pin pairs. Using the DT=
 description, phy-s are
matched with to specific MDIO bus. PORT_ADDR tells the switch which phy add=
ress a port maps to.
POLL_SEL then tells the MDIO controller which bus this port (phy) is assign=
ed to. I have the
impression this [port] <-> [bus, phy] mapping is completely arbitrary. If c=
onfigured correctly, it
can probably serve as a convenience to match a front panel port number to a=
 specific phy.

If the port numbers are in fact arbitrary, I think they could be hidden fro=
m the user, removing the
need for a custom DT property. You could probably populate the port numbers=
 one by one as phy-s are
enumerated, as you are already storing the assigned port number in the MDIO=
 controller's private
data.

One complication this might have, is that I suspect these port numbers are =
not used exclusively by
the MDIO controller, but also by the switch itself. So then there may have =
to be a way to resolve
(auto-assigned) port numbers outside of this driver too.

> +	}
> +
> +	/* Put the interfaces into C45 mode if required */
> +	for (i =3D 0; i < MAX_SMI_BUSSES; i++) {
> +		if (priv->smi_bus_isc45[i]) {
> +			glb_ctrl_mask |=3D GLB_CTRL_INTF_SEL(i);

Can't glb_ctrl_mask be fixed to GENMASK(19, 16)?

> +			glb_ctrl_val |=3D GLB_CTRL_INTF_SEL(i);
> +		}
> +	}

[...]

> +static int rtl9300_mdiobus_probe_one(struct device *dev, struct rtl9300_=
mdio_priv *priv,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct fwnode_handle *node)
> +{
> +	struct rtl9300_mdio_chan *chan;
> +	struct fwnode_handle *child;
> +	struct mii_bus *bus;
> +	u32 smi_bus;
> +	int err;
> +
> +	err =3D fwnode_property_read_u32(node, "reg", &smi_bus);
> +	if (err)
> +		return err;
> +
> +	if (smi_bus >=3D MAX_SMI_BUSSES)
> +		return dev_err_probe(dev, -EINVAL, "illegal smi bus number %d\n", smi_=
bus);
> +
> +	fwnode_for_each_child_node(node, child) {
> +		u32 smi_addr;
> +		u32 pn;
> +
> +		err =3D fwnode_property_read_u32(child, "reg", &smi_addr);
> +		if (err)
> +			return err;

[...]

> +
> +		priv->smi_bus[pn] =3D smi_bus;
> +		priv->smi_addr[pn] =3D smi_addr;

Nitpicking a bit here, but perhaps the code might be a tad bit easier to re=
ad for the non-Realtek
initiated by renaming:
  - smi_bus -> mdio_bus or just bus_id (matching the mii_bus *bus member)
  - smi_addr -> phy_addr

> +	}

[...]

> +static int rtl9300_mdiobus_probe(struct platform_device *pdev)
> +{

[...]

> +
> +	if (device_get_child_node_count(dev) >=3D MAX_SMI_BUSSES)
> +		return dev_err_probe(dev, -EINVAL, "Too many SMI busses\n");

This seems redundant with the MAX_SMI_BUSSES comparison in probe_one().

Best,
Sander

