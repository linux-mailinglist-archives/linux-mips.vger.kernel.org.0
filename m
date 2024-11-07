Return-Path: <linux-mips+bounces-6715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECC9C0A6E
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 16:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44FF61F2338B
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2024 15:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95D32144C7;
	Thu,  7 Nov 2024 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cu9+qsIu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C7C2144A5;
	Thu,  7 Nov 2024 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730994721; cv=none; b=UGIPSem/Clrbe/lXf9EWuPE3HTZRHEflmUnMJwHp5yy7Cl5rnvQ/f0gI18l0KDtc2XwbWF7k5505hOLeRp9AlomYbwDKqnxVgqQxwpTkkUdGGpOmcHGzXdaBN0ZDtMxrb+VxN/GwgsofJ/hHiUsdsOYKazFyeG06d0Nj5rH3VT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730994721; c=relaxed/simple;
	bh=f+KXBENsmoNNMukSkOnmzKaUFO1dC8kFhS5KRSuuJHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qvqq8KPco4dv2HsYjvlkoZkMrNg6vdBsclshBuDZiB6TgCIfegGt9+EjO9Owmjk1AzFGkU1qEi8B1lpt+qdeKAb7+jxPip8DxHckoSeQ/lCTlvazSO0WMJKE2ZNFXNdIywH4SulLURYRkx+ozK5OERoUMneorrurKRgD3u9gLUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cu9+qsIu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD88C4CECC;
	Thu,  7 Nov 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730994721;
	bh=f+KXBENsmoNNMukSkOnmzKaUFO1dC8kFhS5KRSuuJHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cu9+qsIuGgslK6gaMJvw+dFv1QvgkBuNJ4Jr3P+99lqd6liN9qLEgm/tfg/C2rm42
	 icW5Ciw2mhgSJzfX5/dpieDZTsKuBEArYy89skFRpbo09M8i0OE4auiBr9GRLO+cV3
	 QBkhVmgdIZZwl91Sp2vbDGEAWaJT5yTMuKIdzA68Y0ljvQOFZlY/N39GOC/kKKy3gH
	 bdgpln+rWvgLKttCeGheEb8FBZAt0jdOGLIrSeA00GYWlKudCrwYZJ/qtXaygeVNn8
	 C+wDfnkeqaXOHfEZwn/xwdzEgQKVOvOwRFsXr27/0hCNiJ139lKDyKvp2sqxnw26q7
	 bXyMPEMGx56YQ==
Date: Thu, 7 Nov 2024 09:51:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: mobileye: set `#clock-cells =
 <1>` for all compatibles
Message-ID: <173099471894.2769888.8233833580662075395.robh@kernel.org>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
 <20241106-mbly-clk-v2-1-84cfefb3f485@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106-mbly-clk-v2-1-84cfefb3f485@bootlin.com>


On Wed, 06 Nov 2024 17:03:52 +0100, Théo Lebrun wrote:
> Some compatibles expose a single clock. For those, we used to let them
> using `#clock-cells = <0>` (ie <&olb> reference rather than <&olb 0>).
> 
> Switch away from that: enforce a cell for all compatibles. This is more
> straight forward, and avoids devicetree changes whenever a compatible
> goes from exposing a single clock to multiple ones. Also, dt-bindings
> get simpler.
> 
> *This is an ABI break*. Change it while EyeQ5 platform support is at its
> infancy, without any user. More clocks might hide in each OLB as some
> registers are still unknown.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 24 +---------------------
>  1 file changed, 1 insertion(+), 23 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


