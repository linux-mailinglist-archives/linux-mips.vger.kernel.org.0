Return-Path: <linux-mips+bounces-11533-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A1B8BFB4
	for <lists+linux-mips@lfdr.de>; Sat, 20 Sep 2025 07:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D3D21BC6FAD
	for <lists+linux-mips@lfdr.de>; Sat, 20 Sep 2025 05:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E968F224B1F;
	Sat, 20 Sep 2025 05:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwV/KZHk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF74FFBF6;
	Sat, 20 Sep 2025 05:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758345877; cv=none; b=R4uxwTapqE4jvHQcbh+JYZfhsasZaIuLxwUYxgiRtK6M9XIMggZvSiJ7PSMiMT8vTK2P3KTvcN94AuTStHcZi4KRxy9Kjb1K6ilQunVtYOwoZ0YStpaJVqGybT6d8WZ8xQwYbPHqlq/Puju5R1UjrOjx86H5aMdmlSboJ2NNoag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758345877; c=relaxed/simple;
	bh=ArbrsnGKoxvN0kutLPi6f5zCqz6SQWd3RVzb+lWRIlA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iijuMFX71+8pasX/DemCpkazuxjlitW2H9+10ZPoz9DCm/tuIYPRw+hfLQkaRpwhZc7MDv4eSKwzsJ7cJBkiDbScs7/DVc1O2aeyDOPlEw85rmSSfdiK5Mv05e+v122D/kfQkij7WhPmp3rKVm+J2qbqPDf3zfbgrBitaiTVRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwV/KZHk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BDFC4CEEB;
	Sat, 20 Sep 2025 05:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758345877;
	bh=ArbrsnGKoxvN0kutLPi6f5zCqz6SQWd3RVzb+lWRIlA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CwV/KZHkSldV4EkhZFZ1DqKMzwoMYxh6ywQPyKPMnb4RDeu8eS9MTRYMN9rdc0frt
	 kGAQUAn9Qf4PpMsHCyKvnUql8Q5CZ7lG/jsUpFTGyWqVihgoo0PahG2ntcoeKQwIdX
	 wAj5+TBAknXu1ONNro/qZM2R+fmfA9prfgXsIq1hmRKFxXtCnd7EawHp+REgRrWE61
	 6FPemb9QC4YgchUjpSQZSp06EDUstVZ7AUmEm5tn1FUVFOhAaM/co7YWQGLNTG2qit
	 I95JTNpOnVE7Hy4TlJpHdUXWYUDoK7y5yjTiD1XQJGiyzadcaV1a68hyHyvMNu/7K0
	 v3NxkS6hnM72A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250903-clk-eyeq7-v1-9-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com> <20250903-clk-eyeq7-v1-9-3f5024b5d6e2@bootlin.com>
Subject: Re: [PATCH 09/19] clk: divider: check validity of flags when a table is provided
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Sari Khoury <sari.khoury@mobileye.com>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Fri, 19 Sep 2025 22:24:36 -0700
Message-ID: <175834587624.4354.6026619740146574818@lazor>
User-Agent: alot/0.11

Quoting Beno=C3=AEt Monin (2025-09-03 05:47:16)
> If any of the flag CLK_DIVIDER_ONE_BASED, CLK_DIVIDER_POWER_OF_TWO,
> CLK_DIVIDER_MAX_AT_ZERO or CLK_DIVIDER_EVEN_INTEGERS is set, the divider
> table will be ignored in _get_div and _get_val. This can lead to subtle
> bug when a clock is registered with some flags and an optional table,
> with the clock rate and register value being computed with the wrong
> type of conversion.
>=20
> Prevent this by refusing to register a divider with both the flag and
> the table set.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-divider.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 8e8f87024e76625f348f1d66c15a7a938fa0c4db..b4861d519bac2121dd015d094=
c94a5fee2480148 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -561,6 +561,13 @@ struct clk_hw *__clk_hw_register_divider(struct devi=
ce *dev,
>                         return ERR_PTR(-EINVAL);
>                 }
>         }

Nitpick: Prefer a newline here.

> +       if (table && (clk_divider_flags & (CLK_DIVIDER_ONE_BASED |
> +                                          CLK_DIVIDER_POWER_OF_TWO |
> +                                          CLK_DIVIDER_MAX_AT_ZERO |
> +                                          CLK_DIVIDER_EVEN_INTEGERS))) {
> +               pr_warn("divider table and flags incompatible\n");

This pr_warn() (and the one above this one) are not very helpful because
we don't know which clk is the problem. We also don't know if this is
going to cause boot failures for devices out there that have this flag
set and a table. Were all drivers audited?

I wonder if we can check this condition at compile time with some sort
of test on the clk_divider_flags expression to see if it is a compile
time constant along with the table pointer being a compile time constant
as well that isn't NULL?

> +               return ERR_PTR(-EINVAL);
> +       }

