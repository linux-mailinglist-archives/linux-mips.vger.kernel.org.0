Return-Path: <linux-mips+bounces-12439-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9ECCB36C7
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 17:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 892F43025FB2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 16:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BF72F5A34;
	Wed, 10 Dec 2025 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1mXvKYJc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C6327CCEE
	for <linux-mips@vger.kernel.org>; Wed, 10 Dec 2025 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765382804; cv=none; b=B1qeszqGwSP6LgbK3D/Qht882Psb21AjSYUtFbF6FXvsCJZ2RgaPSTDphjjErvfiSeiYwj62GQ/k8KvK5/ul5YC6EeYGm5Oq4kkTVdhmzBrraT2sUyyADC8VqguXm3MFxkmhnN8F0GhuvtobHzja2TUcvW9LHWi25quSGq5UczU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765382804; c=relaxed/simple;
	bh=YqTDeP7D5I5r5oKnPjxrY9VbX1CbJOiMv8dKn9JZXnc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=i6lgwnZtRpcwt6tFOVwccflVpfkSqysGnIhEKhXgzcs3NiXaGNEqSg2TsPmQbqIz7OmhQaaIVz9/1tvGxhelwgoBAuuY8q/evFmsWnM7lfMvxeejc5fpMiirzruwllKLN9lwxmYNAEqEX3rv7ThcAB50rBivUK1bRSSRyWvk7dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1mXvKYJc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 42D64C180F6;
	Wed, 10 Dec 2025 16:06:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EF1560714;
	Wed, 10 Dec 2025 16:06:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AD4B11931A8C;
	Wed, 10 Dec 2025 17:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765382798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Z3jV2Yj9IT8vHbljyxoGx7tPeCujNrjG+4aQRJ7ptM=;
	b=1mXvKYJcP7otAFdBA1ryX/2go8lT8U3Bbf7K0BRl+qYoESbyXVnXH9EWzPhR3dDBvfsMUp
	eeq31lSCd2ocZgDscsfYsx0pCPppC/3aUYgtxifWBEfwkanF7pYtvMBrPs1CBv6SNTrGW1
	XrtszL9Wwxzb86DdqKVxpp7t5PDVitjZaWGhxiia7lnBezmnFjMFuDy4uVOXh/nMrOSMSU
	ejDtV3rD2+syhtpbbM+9BwGuo8nbPmclpZzg02kBJi0NSbJt/sRgdxPhZqHgKz0i4lFiWn
	LiaOxN7GlQpclyfGbef9spIKmqxgMExAkrBu+Qcf3Olo4zmvB1Tl9t12B5S3Wg==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 17:06:32 +0100
Message-Id: <DEUNYYW0Y23E.2SA0SOCS99NA0@bootlin.com>
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
X-Mailer: aerc 0.20.1
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-2-955c625a81a7@bootlin.com>
In-Reply-To: <20251124-macb-phy-v4-2-955c625a81a7@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Nov 24, 2025 at 3:41 PM CET, Th=C3=A9o Lebrun wrote:
> EyeQ5 embeds a system-controller called OLB. It features many unrelated
> registers, and some of those are registers used to configure the
> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
>
> Wrap in a neat generic PHY provider, exposing two PHYs with standard
> phy_init() / phy_set_mode() / phy_power_on() operations.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

[...]

> --- /dev/null
> +++ b/drivers/phy/phy-eyeq5-eth.c
> @@ -0,0 +1,254 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/bug.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/lockdep.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

Are all these include files really needed? At a quick glance bitfield.h,
cleanup.h and lockdep.h look unused in this file.

> +#define EQ5_PHY_COUNT	2

[...]

> +static const struct phy_ops eq5_phy_ops =3D {
> +	.init		=3D eq5_phy_init,
> +	.exit		=3D eq5_phy_exit,
> +	.set_mode	=3D eq5_phy_set_mode,
> +	.power_on	=3D eq5_phy_power_on,
> +	.power_off	=3D eq5_phy_power_off,
> +};
> +
> +static struct phy *eq5_phy_xlate(struct device *dev,
> +				 const struct of_phandle_args *args)
> +{
> +	struct eq5_phy_private *priv =3D dev_get_drvdata(dev);
> +
> +	if (args->args_count !=3D 1 || args->args[0] > 1)

Maybe, for better clarity:

	if (args->args_count !=3D 1 || args->args[0] >=3D EQ5_PHY_COUNT)

> +		return ERR_PTR(-EINVAL);
> +
> +	return priv->phys[args->args[0]].phy;
> +}
> +
> +static int eq5_phy_probe_phy(struct eq5_phy_private *priv, unsigned int =
index,
> +			     void __iomem *base, unsigned int gp,
> +			     unsigned int sgmii)
> +{
> +	struct eq5_phy_inst *inst =3D &priv->phys[index];
> +	struct device *dev =3D priv->dev;
> +	struct phy *phy;
> +
> +	phy =3D devm_phy_create(dev, dev->of_node, &eq5_phy_ops);
> +	if (IS_ERR(phy)) {
> +		dev_err(dev, "failed to create PHY %u\n", index);
> +		return PTR_ERR(phy);
> +	}

Why not dev_err_probe()? It would make code more concise too:

	phy =3D devm_phy_create(dev, dev->of_node, &eq5_phy_ops);
	if (IS_ERR(phy))
		return dev_err_probe(dev, PTR_ERR(phy), "failed to create PHY %u\n", inde=
x);

> +
> +	inst->priv =3D priv;
> +	inst->phy =3D phy;
> +	inst->gp =3D base + gp;
> +	inst->sgmii =3D base + sgmii;
> +	inst->phy_interface =3D PHY_INTERFACE_MODE_NA;
> +	phy_set_drvdata(phy, inst);
> +
> +	return 0;
> +}
> +
> +static int eq5_phy_probe(struct auxiliary_device *adev,
> +			 const struct auxiliary_device_id *id)
> +{
> +	struct device *dev =3D &adev->dev;
> +	struct phy_provider *provider;
> +	struct eq5_phy_private *priv;
> +	void __iomem *base;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	dev_set_drvdata(dev, priv);
> +
> +	base =3D (void __iomem *)dev_get_platdata(dev);
> +
> +	ret =3D eq5_phy_probe_phy(priv, 0, base, EQ5_PHY0_GP, EQ5_PHY0_SGMII);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eq5_phy_probe_phy(priv, 1, base, EQ5_PHY1_GP, EQ5_PHY1_SGMII);
> +	if (ret)
> +		return ret;
> +
> +	provider =3D devm_of_phy_provider_register(dev, eq5_phy_xlate);
> +	if (IS_ERR(provider)) {
> +		dev_err(dev, "registering provider failed\n");
> +		return PTR_ERR(provider);
> +	}

As above, why not dev_err_probe()?

Other than the above minor issues, LGTM. This driver looks cleanly
implemented.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

