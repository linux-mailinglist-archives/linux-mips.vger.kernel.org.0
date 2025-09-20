Return-Path: <linux-mips+bounces-11531-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E2B8BF94
	for <lists+linux-mips@lfdr.de>; Sat, 20 Sep 2025 07:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0CE358719D
	for <lists+linux-mips@lfdr.de>; Sat, 20 Sep 2025 05:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73621223DE9;
	Sat, 20 Sep 2025 05:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNMeoQTQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD013AD1C;
	Sat, 20 Sep 2025 05:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758345300; cv=none; b=mLr39aKDS6osWA8kP+Qg2r6kGqtqsrxAIlQ5sx0BqVHixU9IDAsO/syIahwGoNGLBAU86e3lj0mYnZ4Zltd57dn4pXLaDmNalr5IyKDChKRc+WsY/O9SgggaZo6Fm3cLbPVS3+g0GUf6OR+RDc7l2KAbx+huUIqQ8fO/ZEmhlrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758345300; c=relaxed/simple;
	bh=EBTsphOtW3UKK7rvQLr2Pnn8/K5m8GSOqjnbjpzjHec=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=I/ClagX4RLnnGQ77TtDPIIQ31uQN2IwKoQP+HyVhIzTmsS0jT1NLst4QlDJo8MOV+Bp9G1ku6ZESCA193DiXCsaZ4MRb1ZWPiBuGExSzAQMLnUNvuCDxoMHX2jljErKa8k0/YBt1rrFGP1n7czs9XaYPi2ooOnlnjReInVs9QEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNMeoQTQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92693C4CEEB;
	Sat, 20 Sep 2025 05:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758345299;
	bh=EBTsphOtW3UKK7rvQLr2Pnn8/K5m8GSOqjnbjpzjHec=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mNMeoQTQOAdcXQ9oGqsMZIsx5+0Ddmmwsn1x4SmVo8bU6SlT8u1Myt0hWBPWYJZtO
	 jplSWtQK3zwqYpGCn+hdtpRTcV+57DAtZbbpRQCCkIfNSYHEwg/HTU7nj5qCMwf8SU
	 UuqarsDVoLmBNa7QRdw3Qt1/sk3TRnb6XAQ/wGgBFblWl/f69F3/IfJrKtuJov4ahM
	 jPxQQdVchz3eYRKaQzOyaQacLmyWcY0rG68ib3Y7bCHFOIRMhqCAUxT5OL9hMk3jJl
	 m+8DhBxM244rBG/BrJVSHy9fS2qym6VmXYUkYNU9EGESD/sYBJvzAnft7UTH2mOU7L
	 NzNFIgPmmnb0g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-7-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com> <20250903-clk-eyeq7-v1-7-3f5024b5d6e2@bootlin.com>
Subject: Re: [PATCH 07/19] clk: fixed-factor: add clk_hw_register_fixed_factor_with_accuracy
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Sari Khoury <sari.khoury@mobileye.com>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Fri, 19 Sep 2025 22:14:58 -0700
Message-ID: <175834529869.4354.196538790945051595@lazor>
User-Agent: alot/0.11

Quoting Beno=C3=AEt Monin (2025-09-03 05:47:14)
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-facto=
r.c
> index e62ae8794d445f685156276d5135448f340fca3f..7c76658a725f9b268da248576=
9979e5ba213d25b 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -217,6 +217,18 @@ struct clk_hw *clk_hw_register_fixed_factor(struct d=
evice *dev,
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
> =20
> +struct clk_hw *clk_hw_register_fixed_factor_with_accuracy(struct device =
*dev,
> +               const char *name, const char *parent_name, unsigned long =
flags,
> +               unsigned int mult, unsigned int div, unsigned long acc)
> +{
> +       const struct clk_parent_data pdata =3D { .index =3D -1 };

This is wrong. We're passing parent data and also setting the parent
name with a string the original way. Do you have a parent?

> +
> +       return __clk_hw_register_fixed_factor(dev, NULL, name, parent_nam=
e, NULL,
> +                                             &pdata, flags, mult, div, a=
cc,
> +                                             CLK_FIXED_FACTOR_FIXED_ACCU=
RACY, false);
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_with_accuracy);

There are a handful of these wrappers now. Can we have one function that
takes all possibilities and then static inline functions that call one
exported function?  We can pass some structs to that function to keep
the argument count "low", so those structs live on the stack for a short
time.

> +
>  struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
>                 struct device_node *np, const char *name, const char *fw_=
name,
>                 unsigned long flags, unsigned int mult, unsigned int div)

