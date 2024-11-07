Return-Path: <linux-mips+bounces-6713-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA29C0366
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 12:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2DA1C21980
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 11:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72B91F4710;
	Thu,  7 Nov 2024 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEkUUHT2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEF1EE00C;
	Thu,  7 Nov 2024 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977672; cv=none; b=nU3cR8jegmqwk+yfCpCN2JPW71t+sbikhucBDooV13GCQ/dmSvTe5bmiOnzJm6ApCCMJ1eRTUdjugvd/V2oEUjldzbj6aQIzMCTeldXfvLRZNEBl7tIacHwtwuaB9y+Sl4/VfuSTZ7YbYaZBd3s3M+xgF8b1lgEqBc7eP2FT2DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977672; c=relaxed/simple;
	bh=3RDsctzj+jKcHyPmCDmgDEvkYRZVjj3F2h2JnfN6XYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHIHZxw15k0ZPhyGLU0PXLj4l6IffXXj9KuUDOJ4AZkzHldpX1iYzNJDfVFCwe1QCTYB68ygq2BgOLVcpSJGOhFm7+XJ3tjiQYMcgUwmDVIbtKq5ldVJywkmldxp2aXlAAz/khSE2n+K5tXUi7jR5jQjUYZ9iqDPRZUWuEIh8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEkUUHT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504A7C4CECC;
	Thu,  7 Nov 2024 11:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977672;
	bh=3RDsctzj+jKcHyPmCDmgDEvkYRZVjj3F2h2JnfN6XYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEkUUHT2AyhLlnl5b5Kr1aHQP+HLUSQogHUG19q1+lqDySaWJ0NwDuaoCr01ID9vp
	 ErMXgC7nML7+V9kF1Mp0H2Dz1RPL/xYpcwwUr1eyHZWAw+R8FB8t7L2730xLblaMnp
	 W4H5RJYM2bn2TSm1bIAOHaonkfGI/TxTIj6+fxZZ69fnVmt5EFUWD0jBE1DVkzottY
	 LW91NKPMxk3T3e2WcVXGU0x7L64WnT80R2SpOoNMeAgUln7KQEKgcDTpKOOBRkHtxa
	 xaOyhJt+VrQA7oR8749NarQRcwH42e7ilCnd6UWg8cdc2/eWVMHqtvQvuMsaqadkam
	 dECzA0PDtrbSg==
Date: Thu, 7 Nov 2024 12:07:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] Documentation: dt-bindings: Remove trailing
 whitespace
Message-ID: <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-3-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-3-xandfury@gmail.com>

On Wed, Nov 06, 2024 at 11:11:24PM -0700, Abhinav Saxena wrote:
> Remove trailing whitespace from devicetree binding documentation files:
> - regulator/regulator-max77620.txt
> - interrupt-controller/nvidia,tegra20-ictlr.txt
> - interrupt-controller/msi.txt
> 
> No functional changes. Issues detected using checkpatch.pl script.

Instead I would prefer these files to be converted to DT schema which
would result in their full removal.

Best regards,
Krzysztof


