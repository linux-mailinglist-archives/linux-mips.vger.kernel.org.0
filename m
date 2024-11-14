Return-Path: <linux-mips+bounces-6744-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B35579C957F
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 23:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 788602837A3
	for <lists+linux-mips@lfdr.de>; Thu, 14 Nov 2024 22:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C717A1B0F16;
	Thu, 14 Nov 2024 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBtw74mj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946C81CABA;
	Thu, 14 Nov 2024 22:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625121; cv=none; b=DhX2NzstR86kdOCMQhdAWM7BBU7Gp41rnTxEHGecbxxT0NXQYPHwWGz8iMormGRYipGGtELfSgYy2UZg84LnKyvjFLbd5W38Kokq4BpBcHxo/CIF6q0E3rbaIvpgo/Q5+GoYzsH2bht9j8I17fl5k2B60eyJRxgxM735+u2G/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625121; c=relaxed/simple;
	bh=MJ+1BvFKMFNSoWz2zyU2mFYG//9SlILo37w50AJhdIE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=aJIRD78lbHzc0GfGb8bMNmxj0zZQllYWdgiRPZIHsWTqEExtr442JrSfQNzLSgx32bJR0ziDNWhscVEK+1qVIOAQSeqA3uk0VGXyQmuBsZMZTIdYzYhsIt4QPmmL0WQzxcy5WhqHVNOXbEWTxr7aFnhT+fr/XJn88Ltkb+Dn/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBtw74mj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD58C4CECD;
	Thu, 14 Nov 2024 22:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731625121;
	bh=MJ+1BvFKMFNSoWz2zyU2mFYG//9SlILo37w50AJhdIE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rBtw74mj+P/1dYgj7a7BzJyKTks96lZQxkU5szH0vs2LVkXnnP1nyp0FsMksfZsy6
	 8mIWbHSs2XO0881txtao26ptMf6RQJbiJoTm+5Qj0PVn5brUfaB2SBmrpOkabgBhz9
	 63NojPpkyJPXd+fFav79C6vuABNXOz4lLFSULYWRjrEZzmLVH7JrKsUCY75Y0RmOO0
	 /hCrw+eFZeNvdzBi5EpWI/Y3S0vI2Zv2bsVlbIhc4N0lA4TG8oaQPfREw6Nb+Q2b0B
	 Z62KTTmbnQmjNWoRrNxu2neYRCTuBiE9aSbub/K4fe5xxk3CmRSIN5MxSZ/kEZPzLC
	 Zz5AgWqG2/w/A==
Message-ID: <8aad8ae601a7dc046b6db0eb08192278.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-mbly-clk-v2-1-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com> <20241106-mbly-clk-v2-1-84cfefb3f485@bootlin.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: mobileye: set `#clock-cells = <1>` for all compatibles
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, =?utf-8?q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Thu, 14 Nov 2024 14:58:38 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Th=C3=A9o Lebrun (2024-11-06 08:03:52)
> Some compatibles expose a single clock. For those, we used to let them
> using `#clock-cells =3D <0>` (ie <&olb> reference rather than <&olb 0>).
>=20
> Switch away from that: enforce a cell for all compatibles. This is more
> straight forward, and avoids devicetree changes whenever a compatible
> goes from exposing a single clock to multiple ones. Also, dt-bindings
> get simpler.
>=20
> *This is an ABI break*. Change it while EyeQ5 platform support is at its
> infancy, without any user. More clocks might hide in each OLB as some
> registers are still unknown.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---

Applied to clk-next

