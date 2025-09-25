Return-Path: <linux-mips+bounces-11558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F2B9EFC7
	for <lists+linux-mips@lfdr.de>; Thu, 25 Sep 2025 13:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80C5A16CAD1
	for <lists+linux-mips@lfdr.de>; Thu, 25 Sep 2025 11:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4EE2FC036;
	Thu, 25 Sep 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OX2pW4vW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811742D1916;
	Thu, 25 Sep 2025 11:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758800844; cv=none; b=ZhMRQUvdg5E2z6CNNr5S1Jqtc2NF0/TSKP3eRhp/2ngPs8o5w5iQIwG5i3z6hqkihAgs6uxiu1E3jIWfEKQ58RhJi2CTUJdebFhzXyvUB3WCpRHeVq+/fh304urdJHEjmqC648O8uwmAKp7rwbTpnnKMycT5RjKQ/K6yTfWEF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758800844; c=relaxed/simple;
	bh=kHTxh2WU6921Uh2YXkHHNpj7VzrTnKw9xzIeepCiwI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XxullEQ9LKerJbpuHjE4RJs5TQLcHC/646SNHQWjFNyKgn/JzAb6dadFx8OTJ9RuCyBYgeBHyg33g5GePTkr2dRcpxBoiRtJbndC8tDMuhG3mEIQOHCE6LEtGm2ak733PBXXBxyLLHWBeviAY9Ue/gBpKkh5L1nGvZ5NJtUalCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OX2pW4vW; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0A65B1A0FBE;
	Thu, 25 Sep 2025 11:47:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CACB36062C;
	Thu, 25 Sep 2025 11:47:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E312F102F187B;
	Thu, 25 Sep 2025 13:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758800831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hcCNFuswUcPxDzDlpAhXTCjwv5Pzj0m5SwtwYvLJQs0=;
	b=OX2pW4vW6sl5eO1JY6Nnhs5oD5Wls658C1lKO7MESNCG+7UqW5WBVsXYa6S7t3BYTS6gEP
	cVnFLR27zs5Juw+xX2YhbZXjjo4DNupbaPWRLOIX7/A/ilVbEAAc0Od6pTbOijPz62gCgZ
	tfY/MPvrQPybDoGC1ewDo/mSZYpubN9yBMfI8vUrAbB47O+H2ljme48GxBtK9QFuA2hvZu
	ADjcE/8OvQCbvdYzuUqVX2m2VMUFCmmz8X2lMwB+h3qlc9p+0ThoVFiWj7Ls6ZGilET+XV
	ptR2rAI4+wBe0FSbyjWSUZhhmedo8zCfS4IDkOg7KvH7L8GGdL7AK0uSGlEzvQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Sari Khoury <sari.khoury@mobileye.com>
Subject:
 Re: [PATCH 07/19] clk: fixed-factor: add
 clk_hw_register_fixed_factor_with_accuracy
Date: Thu, 25 Sep 2025 13:47:03 +0200
Message-ID: <10352124.tdPhlSkOF2@benoit.monin>
In-Reply-To: <175834529869.4354.196538790945051595@lazor>
References:
 <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-7-3f5024b5d6e2@bootlin.com>
 <175834529869.4354.196538790945051595@lazor>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Saturday, 20 September 2025 at 07:14:58 CEST, Stephen Boyd wrote:
> Quoting Beno=C3=AEt Monin (2025-09-03 05:47:14)
> > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-fac=
tor.c
> > index e62ae8794d445f685156276d5135448f340fca3f..7c76658a725f9b268da2485=
769979e5ba213d25b 100644
> > --- a/drivers/clk/clk-fixed-factor.c
> > +++ b/drivers/clk/clk-fixed-factor.c
> > @@ -217,6 +217,18 @@ struct clk_hw *clk_hw_register_fixed_factor(struct=
 device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
> > =20
> > +struct clk_hw *clk_hw_register_fixed_factor_with_accuracy(struct devic=
e *dev,
> > +               const char *name, const char *parent_name, unsigned lon=
g flags,
> > +               unsigned int mult, unsigned int div, unsigned long acc)
> > +{
> > +       const struct clk_parent_data pdata =3D { .index =3D -1 };
>=20
> This is wrong. We're passing parent data and also setting the parent
> name with a string the original way. Do you have a parent?
>=20
This is caused by the handling of the init struct in
__clk_hw_register_fixed_factor(). In particular num_parents
is always set to 1:
	...
	if (parent_name)
		init.parent_names =3D &parent_name;
	else if (parent_hw)
		init.parent_hws =3D &parent_hw;
	else
		init.parent_data =3D pdata;
	init.num_parents =3D 1;

We could adopt the same approach as in __clk_hw_register_divider() to set
num_parents only when one is passed-in, so the invalid pdata could be
dropped:
	...
	init.parent_names =3D parent_name ? &parent_name : NULL;
	init.parent_hws =3D parent_hw ? &parent_hw : NULL;
	init.parent_data =3D parent_data;
	if (parent_name || parent_hw || parent_data)
		init.num_parents =3D 1;
	else
		init.num_parents =3D 0;

But doing so would change what happens when a fixed factor is registered
with an invalid parent, for example calling clk_hw_register_fixed_factor()
with a NULL parent_name. Currently we get an orphaned clock (seen in
clk_orphan_summary) since it is created with an invalid parent. With the
change it would register without zero parent but not be considered orphaned
(a "root" clock).

Do you think it is okay to make this change?

> > +
> > +       return __clk_hw_register_fixed_factor(dev, NULL, name, parent_n=
ame, NULL,
> > +                                             &pdata, flags, mult, div,=
 acc,
> > +                                             CLK_FIXED_FACTOR_FIXED_AC=
CURACY, false);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_with_accuracy);
>=20
> There are a handful of these wrappers now. Can we have one function that
> takes all possibilities and then static inline functions that call one
> exported function?  We can pass some structs to that function to keep
> the argument count "low", so those structs live on the stack for a short
> time.
>=20
Yes, we could use the same approach as clk-divider, clk-gate and others.
Export the __clk_hw_register_fixed_factor() symbol in the header and have
macros / inline functions.

> > +
> >  struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
> >                 struct device_node *np, const char *name, const char *f=
w_name,
> >                 unsigned long flags, unsigned int mult, unsigned int di=
v)
>=20


Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




