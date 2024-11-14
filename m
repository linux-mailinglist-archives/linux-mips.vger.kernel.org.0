Return-Path: <linux-mips+bounces-6751-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9349C95A6
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 00:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8115280C78
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A521B395C;
	Thu, 14 Nov 2024 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFODirNe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052E1B0F2C;
	Thu, 14 Nov 2024 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625228; cv=none; b=jLHMGDvvHPzMWRTCJ2r8CrVS9xn1pPbAxzuwgBX0HEbpekOdcTRjxlw1aQFhkKYgfOlsQa0B75MivsoF5vlL3V8nMbeLZUbs0QJarGHdUEA3Jo/gzvc/W5P4DTX8bzREm1TNVkSuDIcdTR8ZotmfMyvhw9Fon1hQWWiLzwkkijU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625228; c=relaxed/simple;
	bh=P3pGFrH3PlYITETbqoz7DkjsQU+gJZMsHg6JDBJfnDU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=NYapsEBNc5d+g8hGRwvenP9t8wM61caWeWVhDYS28Ta0jVOjcbSsc3FiQJMU388uVGz6JR67zjt5hnNow8SdTQSo6EVzqRwT0Dbbi0IBfkLUt5RgsoQqg8AfEEtiTr+lRPTDv0c3HNT7ZJpIy2Xl85aYrMkA4D0Z1KfB3ycyadU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFODirNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CECFC4CECD;
	Thu, 14 Nov 2024 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625228;
	bh=P3pGFrH3PlYITETbqoz7DkjsQU+gJZMsHg6JDBJfnDU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qFODirNe3t4HDmp8XzsdFIhCtRwAEieRllrPXhyZajN4KzIl+yztLpqbjPw/f/3w2
	 AcU8zsffEVHEZLFUow1CARcWYRz1uvrTwWh2L9LcyRnoGc5Tc9ehF+xeeOsr7j7DzZ
	 dYqUVOEE5xVnC6e0fHKQlfB+Jld2GsnOgL62T57/VaBQ8/fKfswPpev4kwtB6zfEKk
	 mw56X5uhoEl7kc9Y6AOk4CPphp1fFESO1+QMxwSNAkIuy+HpM3xSo5iFdUpVM6W973
	 ixkP16ffU9oOfdep5U4JdF1a93003u/M7Ot/1CNfhOrhYcVmcrx7NrFdwPBTwyeywF
	 Ybeoe5tLjchMw==
Message-ID: <2e82fec5209d888f934af796bb9a7ceb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-8-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-8-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 08/10] clk: eyeq: add EyeQ6H west fixed factor clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 15:00:26 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:59)
> Previous setup was:
>  - pll-west clock registered from driver at of_clk_init();
>  - Both OCC and UART clocks registered from DT using fixed-factor-clock
>    compatible.
>=20
> Now that drivers/clk/clk-eyeq.c supports registering fixed factors, use
> that capability to register west-per-occ and west-per-uart (giving them
> proper names at the same time).
>=20
> Also switch from hard-coded index 0 for pll-west to using the
> EQ6HC_WEST_PLL_PER constant by exposed dt-bindings headers.
>=20
> All get exposed at of_clk_init() because they get used by the AMBA PL011
> serial ports. Those are instantiated before platform bus infrastructure.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

