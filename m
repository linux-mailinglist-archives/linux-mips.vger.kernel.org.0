Return-Path: <linux-mips+bounces-1106-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F139E83A746
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 11:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DCBD1C21608
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 10:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AAF199D9;
	Wed, 24 Jan 2024 10:54:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAD19478
	for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706093670; cv=none; b=IiKNJ+ebcB3LehtqtfYFXqDrRSBJ5gogVPVVkRy7BcRAOeeOw1JJXYrsx+oVi9F2Tb98lXfmAU7x1bkId1r7szP3oC2A2INlBFs9up47IRBzRTtRTy2GVd4U2pBKIJpfBQh2tAv2SYuhOJkaEZsGgHp6KY/fv8lPh8Q/pdMQGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706093670; c=relaxed/simple;
	bh=lKdiVruIzPpYmtbsDhdv0Tfge2qMRNvAnOAyUZusIqI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fkEMAydrN7FoBaH9pPMGVN0DYX2uERVuQiFL9uJVcY3t0Xho4ZFTpPH3lbwAPnILDfuUhdITcOUq0cBQZrCc/miXi5M02i2rUnyd8C6J9vicegeXb/1RYn2E5rKK3nXqKdyUMe3H2i34HjLFYiwIbUjIrdyz0cDVYCk7CGxXGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSatc-00013p-UF; Wed, 24 Jan 2024 11:54:16 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSatb-0022P4-5Z; Wed, 24 Jan 2024 11:54:15 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSatb-00086H-0J;
	Wed, 24 Jan 2024 11:54:15 +0100
Message-ID: <82bde47d48ec2962d69d9e4edde6d6d96fcbbd65.camel@pengutronix.de>
Subject: Re: [PATCH v3 09/17] reset: eyeq5: add platform driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>, Gregory
 CLEMENT <gregory.clement@bootlin.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Walleij
 <linus.walleij@linaro.org>,  =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
  linux-gpio@vger.kernel.org
Date: Wed, 24 Jan 2024 11:54:14 +0100
In-Reply-To: <20240123-mbly-clk-v3-9-392b010b8281@bootlin.com>
References: <20240123-mbly-clk-v3-0-392b010b8281@bootlin.com>
	 <20240123-mbly-clk-v3-9-392b010b8281@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org

On Di, 2024-01-23 at 19:46 +0100, Th=C3=A9o Lebrun wrote:
[...]
> diff --git a/drivers/reset/reset-eyeq5.c b/drivers/reset/reset-eyeq5.c
> new file mode 100644
> index 000000000000..2217e42e140b
> --- /dev/null
> +++ b/drivers/reset/reset-eyeq5.c
> @@ -0,0 +1,383 @@
[...]

> +static int eq5r_assert(struct reset_controller_dev *rcdev, unsigned long=
 id)
> +{
> +	struct eq5r_private *priv =3D dev_get_drvdata(rcdev->dev);

rcdev is contained in priv, you can just use container_of instead of
chasing pointers around.

> +	u32 offset =3D id & GENMASK(7, 0);
> +	u32 domain =3D id >> 8;
> +	int ret;
> +
> +	if (WARN_ON(domain >=3D EQ5R_DOMAIN_COUNT))
> +		return -EINVAL;

Reset controls with domain >=3D EQ5R_DOMAIN_COUNT are already weeded out
during request by of_xlate, so this check is not necessary.

> +	dev_dbg(rcdev->dev, "%u-%u: assert request\n", domain, offset);
> +
> +	mutex_lock(&priv->mutexes[domain]);
> +	_eq5r_assert(priv, domain, offset);
> +	ret =3D _eq5r_busy_wait(priv, rcdev->dev, domain, offset, true);
> +	mutex_unlock(&priv->mutexes[domain]);
> +
> +	return ret;

Consider using guard(mutex)(&priv->mutexes[domain]) from
linux/cleanup.h to automatically unlock on return.

[...]
> +static int eq5r_reset(struct reset_controller_dev *rcdev, unsigned long =
id)

Is this used by anything? If unused, I'd prefer this not to be
implemented. If it is used, is no delay required between assert and
deassert by any consumer?

> +{
> +	struct device *dev =3D rcdev->dev;
> +	struct eq5r_private *priv =3D dev_get_drvdata(dev);
> +	u32 offset =3D id & GENMASK(7, 0);
> +	u32 domain =3D id >> 8;
> +	int ret;
> +
> +	if (WARN_ON(domain >=3D EQ5R_DOMAIN_COUNT))
> +		return -EINVAL;
> +
> +	dev_dbg(dev, "%u-%u: reset request\n", domain, offset);
> +
> +	mutex_lock(&priv->mutexes[domain]);
> +
> +	_eq5r_assert(priv, domain, offset);
> +	ret =3D _eq5r_busy_wait(priv, dev, domain, offset, true);
> +	if (ret) /* don't let an error disappear silently */
> +		dev_warn(dev, "%u-%u: reset assert failed: %d\n",
> +			 domain, offset, ret);

Why not return the error though?

> +	_eq5r_deassert(priv, domain, offset);
> +	ret =3D _eq5r_busy_wait(priv, dev, domain, offset, false);
> +
> +	mutex_unlock(&priv->mutexes[domain]);
> +
> +	return ret;
> +}
[...]
> +static int eq5r_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *parent_np =3D of_get_parent(np);
> +	struct eq5r_private *priv;
> +	int ret, i;
> +
> +	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);

Using devm_kzalloc() avoids leaking this on error return or driver
unbind.

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	priv->olb =3D ERR_PTR(-ENODEV);
> +	if (parent_np) {
> +		priv->olb =3D syscon_node_to_regmap(parent_np);
> +		of_node_put(parent_np);
> +	}
> +	if (IS_ERR(priv->olb))
> +		return PTR_ERR(priv->olb);
> +
> +	for (i =3D 0; i < EQ5R_DOMAIN_COUNT; i++)
> +		mutex_init(&priv->mutexes[i]);
> +
> +	priv->rcdev.ops =3D &eq5r_ops;
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.dev =3D dev;
> +	priv->rcdev.of_node =3D np;
> +	priv->rcdev.of_reset_n_cells =3D 2;
> +	priv->rcdev.of_xlate =3D eq5r_of_xlate;
> +
> +	priv->rcdev.nr_resets =3D 0;
> +	for (i =3D 0; i < EQ5R_DOMAIN_COUNT; i++)
> +		priv->rcdev.nr_resets +=3D __builtin_popcount(eq5r_valid_masks[i]);
> +
> +	ret =3D reset_controller_register(&priv->rcdev);

Similarly, use devm_reset_controller_register() or disable driver
unbind with suppress_bind_attrs.

regards
Philipp


