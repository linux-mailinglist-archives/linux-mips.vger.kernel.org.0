Return-Path: <linux-mips+bounces-11560-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B4B9F080
	for <lists+linux-mips@lfdr.de>; Thu, 25 Sep 2025 13:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68C777B5EF2
	for <lists+linux-mips@lfdr.de>; Thu, 25 Sep 2025 11:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00F42FC00F;
	Thu, 25 Sep 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T0dHWffl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B781D63D3;
	Thu, 25 Sep 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801333; cv=none; b=bEXXWK71guiFgVAl78jjYqsI68ACLSvD8Plmk+RPAzDE32ekDfhT5MiDs8v4JqN3+H2ILMnMfQ60R4o6rhsrZ+wOPWFvbJVBSQabHYPMcamhM1lhBSCBFLkMs1Ak+TZ0lhOZNPLcw20wYBcpe5sbhU1zJtkr0lnC3nlN048fCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801333; c=relaxed/simple;
	bh=MRlI9180Q/DFwlnMHdN/JarBcXXlx5O04GKYHq2QuUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwdqYc70q8IaANKmzzvPkhGtmZvTUHbM9cjqPXZJI6QzdRZb6T6BFmhCOthzC9TxYTslzU5kEY5CYiYoUWLJEsTv3p7PiOYhWZDQUhJMUGP4NB28vTucwPg9LXyc2u2hhvu6sdFXUe3wmMKBNd2j03PHaR2gwdVakr7sR3qhS8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T0dHWffl; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9C99DC011DF;
	Thu, 25 Sep 2025 11:55:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4CD06062C;
	Thu, 25 Sep 2025 11:55:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EAFD102F17C2;
	Thu, 25 Sep 2025 13:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758801328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ymukxC68LYyLPsr3gKo3J1ZahiLqCMUdHsArUXmUEgE=;
	b=T0dHWfflT/WIbK9+bsc28aoVoXXza3ZCVsS+Rm7SkCEdLQlQ0Zv0X+x1Vcpxw5jKmzuqET
	dFEpoLNgrcEKVgfmTLIWzJuMGeW9jhaiI96hw669kVwXgEeA2F/S41FBpGiSXDzm8spzj+
	pG/cZj2DQ0Z6MCK3/8uu2xEoH0wQOy7n4a3m9YBRgLZkJ1HlBL5Ajjf/Cs7pb0V+lF39HT
	xM95VDJ2HNa1CDvINVAR9lF048DkLPxiXqrPFAlsS/4b6pqcDmlzAmKbI4v19MmnBbY++o
	ds3nNxCTTMagiwIkU9yne1SSf2FIfRekFYA5AdkMd7onJWQTE7mi+X3KMLtAlw==
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
 Re: [PATCH 09/19] clk: divider: check validity of flags when a table is
 provided
Date: Thu, 25 Sep 2025 13:55:24 +0200
Message-ID: <2449016.cojqenx9y0@benoit.monin>
In-Reply-To: <175834587624.4354.6026619740146574818@lazor>
References:
 <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
 <20250903-clk-eyeq7-v1-9-3f5024b5d6e2@bootlin.com>
 <175834587624.4354.6026619740146574818@lazor>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Saturday, 20 September 2025 at 07:24:36 CEST, Stephen Boyd wrote:
> Quoting Beno=C3=AEt Monin (2025-09-03 05:47:16)
> > If any of the flag CLK_DIVIDER_ONE_BASED, CLK_DIVIDER_POWER_OF_TWO,
> > CLK_DIVIDER_MAX_AT_ZERO or CLK_DIVIDER_EVEN_INTEGERS is set, the divider
> > table will be ignored in _get_div and _get_val. This can lead to subtle
> > bug when a clock is registered with some flags and an optional table,
> > with the clock rate and register value being computed with the wrong
> > type of conversion.
> >=20
> > Prevent this by refusing to register a divider with both the flag and
> > the table set.
> >=20
> > Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> > ---
> >  drivers/clk/clk-divider.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> > index 8e8f87024e76625f348f1d66c15a7a938fa0c4db..b4861d519bac2121dd015d0=
94c94a5fee2480148 100644
> > --- a/drivers/clk/clk-divider.c
> > +++ b/drivers/clk/clk-divider.c
> > @@ -561,6 +561,13 @@ struct clk_hw *__clk_hw_register_divider(struct de=
vice *dev,
> >                         return ERR_PTR(-EINVAL);
> >                 }
> >         }
>=20
> Nitpick: Prefer a newline here.
>=20
> > +       if (table && (clk_divider_flags & (CLK_DIVIDER_ONE_BASED |
> > +                                          CLK_DIVIDER_POWER_OF_TWO |
> > +                                          CLK_DIVIDER_MAX_AT_ZERO |
> > +                                          CLK_DIVIDER_EVEN_INTEGERS)))=
 {
> > +               pr_warn("divider table and flags incompatible\n");
>=20
> This pr_warn() (and the one above this one) are not very helpful because
> we don't know which clk is the problem. We also don't know if this is
> going to cause boot failures for devices out there that have this flag
> set and a table. Were all drivers audited?
>=20
> I wonder if we can check this condition at compile time with some sort
> of test on the clk_divider_flags expression to see if it is a compile
> time constant along with the table pointer being a compile time constant
> as well that isn't NULL?
>=20
I did check all the in-kernel callers and none got this wrong, passing
either the flag or the table, as I ended up doing in clk-eyeq. I'll see if
I can come up with a compile time check otherwise maybe just a note in
clk-provider.h where struct clk_divider is documented could be enough.

> > +               return ERR_PTR(-EINVAL);
> > +       }
>=20


Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




