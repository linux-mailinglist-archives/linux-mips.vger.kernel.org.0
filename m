Return-Path: <linux-mips+bounces-7711-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB813A2DE42
	for <lists+linux-mips@lfdr.de>; Sun,  9 Feb 2025 15:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8E8D3A4939
	for <lists+linux-mips@lfdr.de>; Sun,  9 Feb 2025 14:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7711DE890;
	Sun,  9 Feb 2025 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="qtQ6s9bA"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B896FE56F
	for <linux-mips@vger.kernel.org>; Sun,  9 Feb 2025 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739111116; cv=none; b=cQD+NxPi/22wui6ic6wZ1wwTUrZYKzDDT4TnUmhD/iGJuVdj5irQjbjqUNQEse93VCwY1b7ocNybdxzFNbW+oDyn8w6i1+Sg+2posVMJvtFYxRWGllquuPTyqMv6xHKhCiOdLGKfUIArnLlkk/EHpPj4cl9iCAL4Sw6Kk3nDU1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739111116; c=relaxed/simple;
	bh=7VqmGkIwDbHsveUhocMMuXTLiwi8kQYecmBa/DPy3ks=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H1Zyphs3rQZmSY+tnimcsJe00kgH+Xg6Gqi6dXL31tYbKQw02KNLQVo5+F+8xKYapCGhGU1bvPG2LM6XYk7RC3jxT7ylNcO5Bv7eK7p0QtByFCTmwCYuSfHVL8w/5qrp/6AMaVF3t9JKmY0DQmchzoqZwQmt8/1XwakjP7M6zrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=qtQ6s9bA; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [192.168.90.187] (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 655E25B5D6D;
	Sun,  9 Feb 2025 15:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1739110771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boS7aXm7OXTOyVehmL65XtXcfRHHBL+5y6apx4GLa/k=;
	b=qtQ6s9bATK6eseX5rLiyRCQ591RZwYqjO+L0NepmFuMpgvjaqckod+ycVOr0UKvCSRqluD
	ln4j//tRVS+Y1Fq6GtATVTg2wb0R8ezDlrl8vst2wMzQEubgVh5nSRWrhnqOP0d3El6I8T
	I+mGbZVQ4kMqeaj/G0N5/rr7Y5XL4CeqpnhzMLK40in4PleCKay2JGNeSvdFpdAF+jEUyY
	M8c48NODxJe4FTUzyGwXuB5Vqjw6xWH41AxPeoIRNK7ksEkETgRKPEsD6BsAz+gGkMeqaj
	bPdKTrNAu4rdfBQCJYwPThlQsiDVJKnMWrP3mtsvuobHnx0avlcNpZnXgIghfQ==
Message-ID: <091a2e9cc6fedd99f35da124f67a54b69478648f.camel@svanheule.net>
Subject: Re: [PATCH net-next v6 4/6] net: mdio: Add RTL9300 MDIO driver
From: Sander Vanheule <sander@svanheule.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, lee@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, 	davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, 	tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, 	daniel@makrotopia.org,
 markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Date: Sun, 09 Feb 2025 15:19:29 +0100
In-Reply-To: <20250204030249.1965444-5-chris.packham@alliedtelesis.co.nz>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
	 <20250204030249.1965444-5-chris.packham@alliedtelesis.co.nz>
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

On Tue, 2025-02-04 at 16:02 +1300, Chris Packham wrote:
> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> switches with integrated SoC. There are 4 physical SMI interfaces on the
> RTL9300 however access is done using the switch ports. The driver takes
> the MDIO bus hierarchy from the DTS and uses this to configure the
> switch ports so they are associated with the correct PHY. This mapping
> is also used when dealing with software requests from phylib.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Changes in v6:
> =C2=A0=C2=A0=C2=A0 - Parse port->phy mapping from devicetree removing the=
 need for the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 realtek,port property

Good to see you found a way to do this!


> +/*
> + * MDIO controller for RTL9300 switches with integrated SoC.
> + *
> + * The MDIO communication is abstracted by the switch. At the software l=
evel
> + * communication uses the switch port to address the PHY. We work out th=
e
> + * mapping based on the MDIO bus described in device tree and the realte=
k,port
> + * property.
> + */

Needs an update again ;-)


> +static int rtl9300_mdio_phy_to_port(struct mii_bus *bus, int phy_id)
> +{
> +	struct rtl9300_mdio_chan *chan =3D bus->priv;
> +	struct rtl9300_mdio_priv *priv =3D chan->priv;
> +	int i;
> +
> +	for (i =3D find_first_bit(priv->valid_ports, MAX_PORTS);
> +	=C2=A0=C2=A0=C2=A0=C2=A0 i < MAX_PORTS;
> +	=C2=A0=C2=A0=C2=A0=C2=A0 i =3D find_next_bit(priv->valid_ports, MAX_POR=
TS, i + 1))

You could use the for_each_set_bit(i, priv->valid_ports, MAX_PORTS) loop ma=
cro.


> +static int rtl9300_mdio_read_c22(struct mii_bus *bus, int phy_id, int re=
gnum)
> +{
[...]
> +
> +	err =3D regmap_write(regmap, SMI_ACCESS_PHY_CTRL_2, port << 16);

Another candidate for FIELD_PREP()

> +	if (err)
> +		return err;
> +
> +	val =3D FIELD_PREP(GENMASK(24, 20), regnum) |
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_PREP(GENMASK(19, 15), 0x1f) |
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FIELD_PREP(GENMASK(14, 3), 0xfff) |

You could use #define-s for the GENMASK() field masks too, similar to PHY_C=
TRL_*. That
would make what you're setting a bit clearer, compared to these literal val=
ues.

Nit: You're also setting all-one values, so GENMASK(19, 15) and GENMASK(14,=
 3) by
themselves are sufficient. E.g. PHY_CTRL_NO_PAGE_PARK and PHY_CTRL_NO_PAGE_=
SELECT.



> +static int rtl9300_mdiobus_probe(struct platform_device *pdev)
> +{
[...]
> +
> +	device_for_each_child_node(dev, child) {
> +		err =3D rtl9300_mdiobus_probe_one(dev, priv, child);

In your next patch you use 'status =3D "disabled"' for the base dtsi. You m=
ay want to use
fwnode_for_each_available_child_node() in that case, so unused busses are n=
ot probed.


Best,
Sander

