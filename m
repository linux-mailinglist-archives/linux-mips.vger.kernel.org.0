Return-Path: <linux-mips+bounces-12466-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A906CBEAA2
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 16:31:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4812530319A0
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 15:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72A130F522;
	Mon, 15 Dec 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f79Rtfn/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CC730B529
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811504; cv=none; b=fKcp40hyKl60m0QDfSd9MF8lYH0EEbu0hnwCxJroBKNgvzQjFevnP5nc4XdtHriA9sgUpt70OWzTct+ID0aSAaLDZBPEXHBlIjSB8CwDfWztTh6RdngskjMTpEG2DdXW4auqoz/DSUb2sm8L/41oxTu6JwvCqnxng/pb9XrM6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811504; c=relaxed/simple;
	bh=NJDTIjgSIb46AD80G66Rq7snta70bRZpujQz6aEelrs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=JLh2LMQC47ZTLXm2N8rLN9ruZhuRMXYZ1mW3O74ndug48GW8muFg398l1zcfmyAVggSRbhcIU4joXxmBPMoDUAEb271b6bgZAfvYSmk4Gqm9kn0pYu7VvIxmSh2ZH88jZFcT0tS0ejprTLq95HnzKIlYvPSmWg6WHHQjYXMGQVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f79Rtfn/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 71AB91A21D8;
	Mon, 15 Dec 2025 15:11:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34A7960664;
	Mon, 15 Dec 2025 15:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BADAC119420AE;
	Mon, 15 Dec 2025 16:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765811493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UigH7Brdj6mKHtKnaVKW6yF38VBtFCwdx2VwsEz/1I8=;
	b=f79Rtfn/VOQoug0jhl4OF2P0snVwNSQJqiTXsTuWuzZnxqxK3Kb217phvhw5dcdhjThh6Y
	kkzqQRvbvyGUTnbb/4ujdkjQsMaJD58R4JKGxyVdUId0KwA66b0ZUBWPSQA7Ay2vXhwOxw
	hjV6gYMjcqYVUDQ6Cd09tCHkCqXxIzZ5gfnKPfdvAY7BX2DZhrnnooufvTB/nW6ZCzUSje
	MZyQHNZiQzTeEzhU5fkyBRvwEpL/a6l3n/5BSUQ/5cLEUgQC7y2Sew2IjDY6He/VifUeXQ
	U+xTbaa4CLSzhCDYt3P/cAINa0z8yRrLkTkbD1VqYT6QDxxbWLUHWDY9Q9VLIw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 16:11:29 +0100
Message-Id: <DEYVXJI90AA7.KPDEQCNZOOXI@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
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
X-Mailer: aerc 0.20.1
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-2-955c625a81a7@bootlin.com>
 <DEUNYYW0Y23E.2SA0SOCS99NA0@bootlin.com>
 <DEYVVCWBOZSH.2ZY41YCHLS8FU@bootlin.com>
In-Reply-To: <DEYVVCWBOZSH.2ZY41YCHLS8FU@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 15, 2025 at 4:08 PM CET, Th=C3=A9o Lebrun wrote:
> Hello Luca,
>
> On Wed Dec 10, 2025 at 5:06 PM CET, Luca Ceresoli wrote:
>> On Mon Nov 24, 2025 at 3:41 PM CET, Th=C3=A9o Lebrun wrote:
>>> EyeQ5 embeds a system-controller called OLB. It features many unrelated
>>> registers, and some of those are registers used to configure the
>>> integration of the RGMII/SGMII Cadence PHY used by MACB/GEM instances.
>>>
>>> Wrap in a neat generic PHY provider, exposing two PHYs with standard
>>> phy_init() / phy_set_mode() / phy_power_on() operations.
>>>
>>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>>
>> [...]
>>
>>> --- /dev/null
>>> +++ b/drivers/phy/phy-eyeq5-eth.c
>>> @@ -0,0 +1,254 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +#include <linux/array_size.h>
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bits.h>
>>> +#include <linux/bug.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/init.h>
>>> +#include <linux/io.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/lockdep.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <linux/phy.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/types.h>
>>
>> Are all these include files really needed? At a quick glance bitfield.h,
>> cleanup.h and lockdep.h look unused in this file.
>
> Yes good catch, after having checked all symbols used, updates are:
> - Add delay.h for udelay(), gfp_types.h for GFP_* alloc flags,
>   module.h for MODULE_* macros.
> - Drop array_size.h, bug.h, cleanup.h, container_of.h, lockdep.h,
>   mutex.h.
>
> We do need bitfield.h for FIELD_PREP().
>
>>
>>> +#define EQ5_PHY_COUNT	2
>>
>> [...]
>>
>>> +static const struct phy_ops eq5_phy_ops =3D {
>>> +	.init		=3D eq5_phy_init,
>>> +	.exit		=3D eq5_phy_exit,
>>> +	.set_mode	=3D eq5_phy_set_mode,
>>> +	.power_on	=3D eq5_phy_power_on,
>>> +	.power_off	=3D eq5_phy_power_off,
>>> +};
>>> +
>>> +static struct phy *eq5_phy_xlate(struct device *dev,
>>> +				 const struct of_phandle_args *args)
>>> +{
>>> +	struct eq5_phy_private *priv =3D dev_get_drvdata(dev);
>>> +
>>> +	if (args->args_count !=3D 1 || args->args[0] > 1)
>>
>> Maybe, for better clarity:
>>
>> 	if (args->args_count !=3D 1 || args->args[0] >=3D EQ5_PHY_COUNT)
>
> Done, indeed the old magic value was not a good idea.
>
>>
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	return priv->phys[args->args[0]].phy;
>>> +}
>>> +
>>> +static int eq5_phy_probe_phy(struct eq5_phy_private *priv, unsigned in=
t index,
>>> +			     void __iomem *base, unsigned int gp,
>>> +			     unsigned int sgmii)
>>> +{
>>> +	struct eq5_phy_inst *inst =3D &priv->phys[index];
>>> +	struct device *dev =3D priv->dev;
>>> +	struct phy *phy;
>>> +
>>> +	phy =3D devm_phy_create(dev, dev->of_node, &eq5_phy_ops);
>>> +	if (IS_ERR(phy)) {
>>> +		dev_err(dev, "failed to create PHY %u\n", index);
>>> +		return PTR_ERR(phy);
>>> +	}
>>
>> Why not dev_err_probe()? It would make code more concise too:
>>
>> 	phy =3D devm_phy_create(dev, dev->of_node, &eq5_phy_ops);
>> 	if (IS_ERR(phy))
>> 		return dev_err_probe(dev, PTR_ERR(phy), "failed to create PHY %u\n", i=
ndex);
>
> Because I had forgotten. :-) Thanks!
>
>>
>>> +
>>> +	inst->priv =3D priv;
>>> +	inst->phy =3D phy;
>>> +	inst->gp =3D base + gp;
>>> +	inst->sgmii =3D base + sgmii;
>>> +	inst->phy_interface =3D PHY_INTERFACE_MODE_NA;
>>> +	phy_set_drvdata(phy, inst);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int eq5_phy_probe(struct auxiliary_device *adev,
>>> +			 const struct auxiliary_device_id *id)
>>> +{
>>> +	struct device *dev =3D &adev->dev;
>>> +	struct phy_provider *provider;
>>> +	struct eq5_phy_private *priv;
>>> +	void __iomem *base;
>>> +	int ret;
>>> +
>>> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->dev =3D dev;
>>> +	dev_set_drvdata(dev, priv);
>>> +
>>> +	base =3D (void __iomem *)dev_get_platdata(dev);
>>> +
>>> +	ret =3D eq5_phy_probe_phy(priv, 0, base, EQ5_PHY0_GP, EQ5_PHY0_SGMII)=
;
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret =3D eq5_phy_probe_phy(priv, 1, base, EQ5_PHY1_GP, EQ5_PHY1_SGMII)=
;
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	provider =3D devm_of_phy_provider_register(dev, eq5_phy_xlate);
>>> +	if (IS_ERR(provider)) {
>>> +		dev_err(dev, "registering provider failed\n");
>>> +		return PTR_ERR(provider);
>>> +	}
>>
>> As above, why not dev_err_probe()?
>
> Good idea once again.
>
>> Other than the above minor issues, LGTM. This driver looks cleanly
>> implemented.
>
> Thanks for the review. Does that imply I can append your Rb trailer?

If you apply all the changes I have mention, yes, but in doubt you can
avoid it and I'll review your next version. Re-reviewing is much faster
than reviewing the first time (last famous words).

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

