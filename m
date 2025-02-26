Return-Path: <linux-mips+bounces-7976-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48115A456E6
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 08:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FFCC7A1442
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 07:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEF819DFB4;
	Wed, 26 Feb 2025 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XqHts+Ih"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B37010F2;
	Wed, 26 Feb 2025 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740555920; cv=none; b=pB4zQ/qxQjTXjCajWcY24znewexiqVtAv6x9NWGQDHi1JYieqWCEYcP2BmZAEKfG9dnoovviCD44DNUbujiEC6XyTWq4ulRy2wdMIVfMtwh7CliDTqnIQPwCOOX5ovK2f4Rb6oy0POo5L7lkNr/Y1A9qlqtqZN0i5XHTepHJsic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740555920; c=relaxed/simple;
	bh=qJo8bS6v5njlNYa287rrU5UuOR3DQntakEIPTxQkkZo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOyqfLM8yB3LjaTIDIhV2AlBYaZdfZYo2bz5jUV8xVokl5NcVMLReVy4ct/i71F71KBq2RoE2EUlB0IHpQDM4Aj/CzpW9oCsJYJSsYXfpr9doCNtXzJy92rHBz/Rlvl5sEkCf4VdrbhOLpx97ETdkMjK1Mn7afXEJnl1m/fd0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XqHts+Ih; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E98ED44456;
	Wed, 26 Feb 2025 07:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740555914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98ELs4LVDVfL3lojYIF8k1ySA2op88p9fn2jtseES3s=;
	b=XqHts+IhvFDpKEVckWHhvx+ayph+tjescazLblNnref2wlqU0AnQj/Msoo1Wc4BWxqUFs6
	6J+WnZjXEzitA+UD5mSRVrk7P9kVnR90Oeg14d53qlV3ig8GdTcCPTySP6lNIdlV3OIBOg
	fC0Byf2QfF9hm6cfLeGGvNPD6KRhLx+DTE+XGwbpVm0P2v4SfoEuNs9UIoy5LQZQa90rXU
	15FL4X41Smh0NmCDx+oqu/o/QqRh1e2ftL1+7TDiG1XZwZPgOSb2kCH9OWmx7rvdvTvTmV
	4kefzW75jChg8iP6pmZxqOx5xyEMR3Eax/SLkBE0CaGIeeRDexPqYd/eQ5mx6g==
Date: Wed, 26 Feb 2025 08:45:11 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, sander@svanheule.net,
 markus.stockhausen@gmx.de, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v7 1/2] net: mdio: Add RTL9300 MDIO driver
Message-ID: <20250226084511.5f8f4c62@fedora.home>
In-Reply-To: <20250226000748.3979148-2-chris.packham@alliedtelesis.co.nz>
References: <20250226000748.3979148-1-chris.packham@alliedtelesis.co.nz>
	<20250226000748.3979148-2-chris.packham@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopegthhhrihhsrdhprggtkhhhrghmsegrlhhlihgvughtvghlvghsihhsrdgtohdrnhiipdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhk
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Chris,

On Wed, 26 Feb 2025 13:07:47 +1300
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> Add a driver for the MDIO controller on the RTL9300 family of Ethernet
> switches with integrated SoC. There are 4 physical SMI interfaces on the
> RTL9300 however access is done using the switch ports. The driver takes
> the MDIO bus hierarchy from the DTS and uses this to configure the
> switch ports so they are associated with the correct PHY. This mapping
> is also used when dealing with software requests from phylib.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

It all mostly looks good to me, there's one typo though and as it may
be user visible, I think it's worth fixing...

[...]

> +static int rtl9300_mdiobus_probe_one(struct device *dev, struct rtl9300_mdio_priv *priv,
> +				     struct fwnode_handle *node)
> +{
> +	struct rtl9300_mdio_chan *chan;
> +	struct fwnode_handle *child;
> +	struct mii_bus *bus;
> +	u32 mdio_bus;
> +	int err;
> +
> +	err = fwnode_property_read_u32(node, "reg", &mdio_bus);
> +	if (err)
> +		return err;
> +
> +	fwnode_for_each_child_node(node, child)
> +		if (fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45"))
> +			priv->smi_bus_is_c45[mdio_bus] = true;
> +
> +	bus = devm_mdiobus_alloc_size(dev, sizeof(*chan));
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->name = "Reaktek Switch MDIO Bus";

You probably mean Realtek ? :)

Thanks,

Maxime

