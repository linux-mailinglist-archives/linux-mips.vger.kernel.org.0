Return-Path: <linux-mips+bounces-6609-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE19B8C52
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 08:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34255285A16
	for <lists+linux-mips@lfdr.de>; Fri,  1 Nov 2024 07:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD98155CBA;
	Fri,  1 Nov 2024 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YudTDlOz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D04154BFC;
	Fri,  1 Nov 2024 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447312; cv=none; b=ldSsTrJezFhiwW1pqYIverJ8BGEzY5AopPnTqd1Fb6YmwzXgRciIVUKwtVCm1QZYdD+WOsQwyE5x9Nk5IxOVlHyZSXPpGcDIDJa0J6FDfpayznw0q8KkEb9RXDCLU9bysQ6QCVHDaLRA1rmgwbhZC2s/okJUqGurlfGRRTJFEiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447312; c=relaxed/simple;
	bh=5jNVtG3JW/KSaOAqjuS3XSz5N1+uStY9EFxXMYELOys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QK2ACqabXSpzBPUg6aGMMn/tEm8ehnHsOCIXbnnRHVe22FulalUM1Ifl0sr1y5Wlxy4otKjVWLj4cLDdso7ZQCPIyBsanytXrJxan9/lDk9aAyaMyZBRm9Jmrd5u0SrafhrYy9QvZIkEu0I591rndADIcx++LY3hHx5wDr7rGwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YudTDlOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C952C4CECD;
	Fri,  1 Nov 2024 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730447312;
	bh=5jNVtG3JW/KSaOAqjuS3XSz5N1+uStY9EFxXMYELOys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YudTDlOz/BMDnK0H+xF/qFDf4Lms5PF9isCm4p009P/ZcmPxz75fV2zn5G9IYdYfZ
	 I7vQghRNUN2aQjqVs9cKhGeCH0zt0JU40wXzvlfM4gW2vpfhXG0q7Ep6/Rnwenhuwi
	 lBjBRDK7pchpmasj3PexSs1+6mHt/ut1Hioy8vPJaadubQp6v/d8jV2BfUnDx0hBZH
	 kL71C/Kz2pmrl49ursph/OoegtUvnLFVBywhOtuw6vGFgT82I/cytlOXtXUgEx5Xoc
	 krMLFh/I86q+X91+KA5aYo34+iyUFMtGwfuVmoodrCsbAzB3gU/VrWFjLP0uut9VDA
	 F+uQmYcgLamow==
Date: Fri, 1 Nov 2024 08:48:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	=?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 04/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H
 central clocks
Message-ID: <7ebcdarioght4u2bai4l42pckitcw5iz4rky4ncgp7aqmtrlen@zl7k7pgijloq>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
 <20241031-mbly-clk-v1-4-89d8b28e3006@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241031-mbly-clk-v1-4-89d8b28e3006@bootlin.com>

On Thu, Oct 31, 2024 at 04:52:54PM +0100, Th=C3=A9o Lebrun wrote:
> Add clock indexes for EyeQ6H central OLB.
>=20
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> ---
>  include/dt-bindings/clock/mobileye,eyeq5-clk.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-=
bindings/clock/mobileye,eyeq5-clk.h
> index 7d9e700b5e59573c45919865d9c68a9e8cf6a9eb..2356bc52646df9cfeb93df812=
0eb8f0bf80d97e9 100644
> --- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
> +++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
> @@ -34,6 +34,9 @@
>  #define EQ6LC_PLL_PER		2
>  #define EQ6LC_PLL_VDI		3
> =20
> +#define EQ6HC_CENTRAL_PLL_CPU	0
> +#define EQ6HC_CENTRAL_CPU_OCC	1
> +

Don't add define after define in separate patches. Logical change is to
add all defines at once, so multiple patches here should be squashed.

Best regards,
Krzysztof


