Return-Path: <linux-mips+bounces-6745-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 428339C9584
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4A01B22DB9
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 22:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223C31B0F2C;
	Thu, 14 Nov 2024 22:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsWKbrVN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CDC1CABA;
	Thu, 14 Nov 2024 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625133; cv=none; b=WoiGQS3/IZw7TdgUj546oDIG56sJASvDytg+7JyQNfb3hQcJbYMojhF8PwRmaKTcnsreUUDHHPl4ZEP3uuRealR9+On1t7iNGvf/d43UphjTZ0VkL1eYuVULI0K4Ozi9fdFJwV7Svt0iWVfv2XCMwNV3KUQuM1tzP/GJBwJkbJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625133; c=relaxed/simple;
	bh=ISDr86meJarboHu50+4BxxKZrxRe6C2sAkfokPLkKJA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=RvlcE56M2xFrXoIbFN00gGnf7wP3RyBlH/ImDu8QTVb9lTDSx2gIucXbJLhCApANeOr7BwQB6mIXl5BEJvpF65wgiP4mD/AFtje5kTRB9YDhyc0YPHTMgyWbl5eOaJMuxYKzhpuxFH2lx6iZXUxryEGCtSjLNTTWjV9Ey8Q0hG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsWKbrVN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6461BC4CECD;
	Thu, 14 Nov 2024 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625132;
	bh=ISDr86meJarboHu50+4BxxKZrxRe6C2sAkfokPLkKJA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IsWKbrVN7ht1ImI8xK7sOUXz+aXrkpa0UomehPsSPrVppiVItEnx/q71UhAXQi7oH
	 EnjFVA+xFMTETFpXNGbg9SdQI0Yxeqsmayu5NKo/fLDtBeEI3pFLvANXGdFJlTXTT8
	 PYaYMqLP5nmXZvcjq/+9Vq1O4FCXqCTYUxgb35gOx6STaXMzARzEAic6/eqT/6o2LD
	 YB2z7hLRAHUeBgQ3OQr/Xc3Ep9L58YlFk18UYrYm30tDeh6msd9J+u4kCJTTUu8SNp
	 I6yIo5xQBnO5ADd7Am1TOmFBeFgzoRJcJRv0BUBODUO7f/2/VbgeyAIBXfX2lEVzhG
	 ijwv0GK5SCApA==
Message-ID: <2014bde38702498c5ab27ab4ad211016.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-2-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-2-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: clock: eyeq: add more Mobileye EyeQ5/EyeQ6H clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 14:58:50 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:53)
> Add #defines for Mobileye clock controller:
>=20
>  - EyeQ5 core 0 thru 3 clocks. Internally:
>=20
>       EQ5C_PLL_CPU:           already exposed
>       =E2=94=94=E2=94=80=E2=94=80 EQ5C_CPU_OCC:       unexposed, no reaso=
n to do so
>           =E2=94=9C=E2=94=80=E2=94=80 EQ5C_CPU_CORE0: new!
>           =E2=94=9C=E2=94=80=E2=94=80 EQ5C_CPU_CORE1: new!
>           =E2=94=9C=E2=94=80=E2=94=80 EQ5C_CPU_CORE2: new!
>           =E2=94=94=E2=94=80=E2=94=80 EQ5C_CPU_CORE3: new!
>=20
>  - EyeQ5 peripheral clocks. Internally:
>=20
>       EQ5C_PLL_PER:          already exposed
>       =E2=94=9C=E2=94=80=E2=94=80 EQ5C_PER_OCC:      new!
>       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 EQ5C_PER_SPI:  new!
>       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 EQ5C_PER_I2C:  new!
>       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 EQ5C_PER_GPIO: new!
>       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 EQ5C_PER_UART: new!
>       =E2=94=9C=E2=94=80=E2=94=80 EQ5C_PER_EMMC:     new!
>       =E2=94=94=E2=94=80=E2=94=80 EQ5C_PER_OCC_PCI:  new!
>=20
>  - EyeQ6H central OLB. Internally:
>=20
>       EQ6HC_CENTRAL_PLL_CPU:     new!
>       =E2=94=94=E2=94=80=E2=94=80 EQ6HC_CENTRAL_CPU_OCC: new!
>=20
>  - EyeQ6H west OLB. Internally:
>=20
>       EQ6HC_WEST_PLL_PER:          new!
>       =E2=94=94=E2=94=80=E2=94=80 EQ6HC_WEST_PER_OCC:      new!
>           =E2=94=94=E2=94=80=E2=94=80 EQ6HC_WEST_PER_UART: new!
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

