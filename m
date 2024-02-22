Return-Path: <linux-mips+bounces-1668-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DC85F15F
	for <lists+linux-mips@lfdr.de>; Thu, 22 Feb 2024 07:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6887F1F233F3
	for <lists+linux-mips@lfdr.de>; Thu, 22 Feb 2024 06:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622EB1426A;
	Thu, 22 Feb 2024 06:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6NykOUw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7717C6E;
	Thu, 22 Feb 2024 06:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708582489; cv=none; b=uX/L7UXhAX83v5xJ4pVgvO2C810iihD3+56cyHDkAQXKIG3wlbYe6/tfhB8a0OMk/xbC7G3rqqeK14L29sacsH57VjpLsv3GTog1Szk13IohsVCVDiWY8eYYsgmfxNF/iyJUFBG1M72CVYjiBYhJ/BjwvCvptd2cKea9/yHsjNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708582489; c=relaxed/simple;
	bh=5dOdh89xbTpGiN1hZGzRTTkv0J+9WeqduNt0cub0PXo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=TY/j29rYOGtTDouUSlWpX4O6OhhbgiOZZzCsc86nM7tdzVXgute+FRWsEHBiCyRC4SFb+GYUkQb2SmEqMutF7t6h72DtUxIzaI+y3QuznLHL+PnN/lvyGWdroAd3sQrRiKHE3VTbLGPeMatca/Uv6lh2AtgzHAdpMm9Aa+EcsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6NykOUw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F95C433C7;
	Thu, 22 Feb 2024 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708582488;
	bh=5dOdh89xbTpGiN1hZGzRTTkv0J+9WeqduNt0cub0PXo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=T6NykOUwd7U0d6BQEUSKMhOihPLd7hQ4W/DTBS3U4uxl7gsfCop4U8lErSon2YKC8
	 XiAwFvDglFF4Fy1POnk8aEC+U/+CZ3Z1VXrgKSbqdbWextOVikp7oc0ATh7VQHzxt9
	 VpIMO02VX6GvM4wKc5dYWf2ydnQs/vOP221mT+qBNYrIeIOFsayCpYaXXUJ9r8/uAA
	 uQhbLv5rYQRYq1J6xiaTjpLL/YFZ/9fYQ7Xvd3/3O9JOBwIovvdJuCrkcbvipQjISP
	 5mHgnjGB5TQlH/cAsiltvmVcps8O+mYCdWJjphLzO22kFarilD6K1dLO8lBWidTtUq
	 6o1n4PjqJbMog==
Message-ID: <a392c79e10fc382e57bf4735005c7bf4.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240221-mbly-clk-v7-4-31d4ce3630c3@bootlin.com>
References: <20240221-mbly-clk-v7-0-31d4ce3630c3@bootlin.com> <20240221-mbly-clk-v7-4-31d4ce3630c3@bootlin.com>
Subject: Re: [PATCH v7 04/14] dt-bindings: reset: mobileye,eyeq5-reset: add bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Date: Wed, 21 Feb 2024 22:14:46 -0800
User-Agent: alot/0.10

Quoting Th=C3=A9o Lebrun (2024-02-21 10:22:12)
> Add DT-Schema bindings for the EyeQ5 reset controller.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

