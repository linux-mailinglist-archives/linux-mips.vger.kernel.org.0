Return-Path: <linux-mips+bounces-12732-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07903CF00C2
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 15:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77684300E8E8
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 14:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5978E30C625;
	Sat,  3 Jan 2026 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G10aLiLk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223972DC34E;
	Sat,  3 Jan 2026 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767449500; cv=none; b=hSDnvvxd3tjdpgN7dOhI3rJNE5aTIPNYHvi9LZvzSyyVw5I/LSGfa6n3AyHpeXUbB7O1soe7rlSti4TA/1D40Kwo9Ua8xFMsNyksnIWDvPKsrzCFh+yvBMRGMrfFsLS8F0B8MiSzOAZGLygMhaJ+lGzT9LR1GtzTFHlBWN0eQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767449500; c=relaxed/simple;
	bh=mwX86YyiwWbrjWAZfajgtdKslPeAHqJC9wmqoN1Xwtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEGcm+5+w6U5p+xFOzR4tDYD8hmZs8RkzDAfS7iG7AR0K00S3zgo6x9rKq8aYFlwHYFOCSC+7/ur3WEyL7j9kuX5ljtcSh+8Qt+18JgeT7Jrhs4cUqqLf/xCfYtff5XN647GdpIiSb4cjzn6ncWL1Yq+V1dOOi8Cyg8PgRAWRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G10aLiLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3434C113D0;
	Sat,  3 Jan 2026 14:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767449499;
	bh=mwX86YyiwWbrjWAZfajgtdKslPeAHqJC9wmqoN1Xwtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G10aLiLkZdu4eabbRJ039jDAhGApii8n98XPG+kba+Ri1G3TPWScGatZFNto7waaa
	 D/oYTL5boTKgoU4wv8uE8hFXpf3TjaKH/+Hbl4mauDtBTo+P8uwZVL1KmGZCJ+x8Je
	 9+daN0Caux4KU1UEjZTmlh8LrGdAjrvYaOSVezQN22sP394uvXAkyPZEYel/iotKT+
	 IdESCSD2VlWotCiRr3p59FQPDSqwGm7BCo8cgpkixrac0/V4r/PgtOR6x0P9rzC9Mr
	 d9HW/aPXgvjtkwpCnnrFVpcE5TTu4D8Lzv5VVLLmeUcNIFIDa74uQr3BQnXsL2xyJC
	 dylCSN9UGv/ew==
Date: Sat, 3 Jan 2026 15:11:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: benjamin.larsson@genexis.eu, chester.a.unal@arinc9.com, 
	davem@davemloft.net, angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	conor+dt@kernel.org, herbert@gondor.apana.org.au, krzk+dt@kernel.org, 
	matthias.bgg@gmail.com, robh@kernel.org, sergio.paracuellos@gmail.com, 
	tsbogend@alpha.franken.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: crypto: eip93: add clock gate and
 reset line
Message-ID: <20260103-sweet-micro-manul-12eaee@quoll>
References: <20260102155341.3682013-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102155341.3682013-1-olek2@wp.pl>

On Fri, Jan 02, 2026 at 04:47:33PM +0100, Aleksander Jan Bajkowski wrote:
> Add the clock gate and reset line, both of which are available
> on the Airoha AN7581.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> v3:
> - introduce patch
> ---
>  .../crypto/inside-secure,safexcel-eip93.yaml       | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> index 997bf9717f9e..c6c99c08dc68 100644
> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
> @@ -48,20 +48,34 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> +  - clocks
> +  - resets

That's ABI break without explanation in the commit msg.

Best regards,
Krzysztof


