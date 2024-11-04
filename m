Return-Path: <linux-mips+bounces-6652-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEF9BB919
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2024 16:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8CD81C21E38
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2024 15:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117471BF81B;
	Mon,  4 Nov 2024 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvpjwTGw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D713C827;
	Mon,  4 Nov 2024 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730734650; cv=none; b=c3dExMSlIfKso9VOwj4O17rwvdQkw0uY2YcePwEjWG+HPjSOFsU7Leks20esFA3kiL2eJpk75TQMTXYnJDvAx/KkETtUz2wZmJ+vq4Sa3+oQCOUhVuO9KLYV4IDcKog4vDtuZcYpybvMOF/OtEXe+I2Zsy3ZymLqBTDA4FhBZFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730734650; c=relaxed/simple;
	bh=YkxEabm7OdGb4+okNBootBI0IcP4SC2irg6j0pQZV/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9gHUbWgXR5UVGrPIiKgOZcGyXl5gj83wOy07bmxlaJR9i+pT+cIX/zWe2vtFE7C+fa7CTTUvHd1NrQ/0Ef2/KhzUUtc+/r1U8kLy66/rwNdblv2ahmTgYi4rh+zF/NdM72RMgZCkyXr2zbEBJuUaWGV767BbSGxHKpTggG8Eo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvpjwTGw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC00C4CECE;
	Mon,  4 Nov 2024 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730734649;
	bh=YkxEabm7OdGb4+okNBootBI0IcP4SC2irg6j0pQZV/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cvpjwTGwjDlYpjTj5Rh0Y/lITq3PRZ1aju2/5Tgzpyn/7xPw6J+o5Ym/LRnRUBI2l
	 UTQx90Kuhio9Gl+GQFBZly9IkuCcxXunb9r1xWbh9YCenAJhz34l9nnq0ffak4fmvY
	 KN5pLt8bIBHThwuW0HJ9sByvFOlVybYebuWPPFL/cCPHL9L8/SQh+4v1pKo8MdziXK
	 SrrFpB8a+FYFk5/mrr92BiOWQPxciNvGgUgTf6B9IPCgukjV91nU9+y6rg0jil5gKK
	 ERSxUvD+HYSgwZkaq6DDLdyZ4Nio3WxgsWYNshu+KCo/NLRDACgLfI0MjNYBmbnw03
	 ZC1MJwSILJCzQ==
Date: Mon, 4 Nov 2024 09:37:27 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH 01/13] dt-bindings: soc: mobileye: set `#clock-cells =
 <1>` for all compatibles
Message-ID: <20241104153727.GA192461-robh@kernel.org>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
 <20241031-mbly-clk-v1-1-89d8b28e3006@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031-mbly-clk-v1-1-89d8b28e3006@bootlin.com>

On Thu, Oct 31, 2024 at 04:52:51PM +0100, Théo Lebrun wrote:
> Some compatibles expose a single clock. For those, we used to let them
> using `#clock-cells = <0>` (ie <&olb> reference rather than <&olb 0>).
> 
> Switch away from that: enforce a cell for all compatibles. This is more
> straight forward, and avoids devicetree changes whenever a compatible
> goes from exposing a single clock to multiple ones.

Your reasoning is flawed. Changing #clock-cells is an ABI break. So you 
should only be changing this if it was just wrong. And if it's not wrong 
in some cases, you shouldn't be changing those. The h/w either has 1 
clock or multiple and #clocks-cells should match.

> 
> Side benefit: dt-bindings is simpler.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 24 +---------------------
>  1 file changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
> index f7e606d45ebcfc46ffe076e23a2ed514bfff9b8f..6d11472ba5a704d5d20f43776e5867f507a39242 100644
> --- a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
> +++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
> @@ -41,9 +41,7 @@ properties:
>      enum: [ 1, 2 ]
>  
>    '#clock-cells':
> -    description:
> -      Cell is clock index. Optional if compatible has a single clock.
> -    enum: [ 0, 1 ]
> +    const: 1
>  
>    clocks:
>      maxItems: 1
> @@ -312,26 +310,6 @@ allOf:
>        properties:
>          '#reset-cells': false
>  
> -    # Compatibles exposing a single clock.
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - mobileye,eyeq6h-central-olb
> -              - mobileye,eyeq6h-east-olb
> -              - mobileye,eyeq6h-west-olb
> -              - mobileye,eyeq6h-ddr0-olb
> -              - mobileye,eyeq6h-ddr1-olb
> -    then:
> -      properties:
> -        '#clock-cells':
> -          const: 0
> -    else:
> -      properties:
> -        '#clock-cells':
> -          const: 1
> -
>      # Only EyeQ5 has pinctrl in OLB.
>    - if:
>        not:
> 
> -- 
> 2.47.0
> 

