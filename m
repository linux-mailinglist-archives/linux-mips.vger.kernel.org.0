Return-Path: <linux-mips+bounces-7655-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED77A23A2C
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 08:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1757C168AE4
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 07:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACF614F117;
	Fri, 31 Jan 2025 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnh6Fw06"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E3B149E17;
	Fri, 31 Jan 2025 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738308811; cv=none; b=q4VbdASInt/i3k5u3yYP7jmAdU/VronisI988DbWGiC3VBgoV2dZ+u3lzhe2w6UaUm7OvAjJ/mVRfkEQwbm4VGoLOGK0RGwACulviXCf1POuA+I6U3amyEQYIN0wynIZvYTJhE/lWQ4lqjA7cuEkzh00sGNIwMp7LVDT94vUePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738308811; c=relaxed/simple;
	bh=RrcEqfM8xh3vtNFdU206o/TsdmNNzA0MjZxnlkbVUGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDNmWAeaUruZT6E0ozHNJ6NzAWgpLDiAmC2p93gxYiUoT20q/ihIM0JRaaVdIN5hYiU8k9EajkZ5rxu1IeupcLldvxgjoaKuKsd9gOLfWVLzONiCojwMGOpkq2YJc3r/vj5/5H3A4ZNUNMSAV04uniuW/HO9mR4vwawpE7uDJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnh6Fw06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B939AC4CED1;
	Fri, 31 Jan 2025 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738308810;
	bh=RrcEqfM8xh3vtNFdU206o/TsdmNNzA0MjZxnlkbVUGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnh6Fw06xdbvU9JBvK6ctaABa6Xotu0HNcayzftQpLLghct+vf8fgKOpYKC+7vawV
	 ZfhgZ+zxDEohWMdkV4C3KEp5L4NKUhmqbIfFoyRfMK/dSSBCorx2pxFo4aBG8YnHgQ
	 GRw1Zi0kGI8h9vXL/VedLuavLI+agpzWkoE3D6xXNoe6GnfL7Kd+u46LWzQJAlEKVk
	 +E/vUKN/vZshU/AIpPqP9xoJoP3gD7U+eXDBhShKNYNe5+h7anUUGw9QoSlJt/YvKR
	 s0kt/XyTCmF/o3KZvMkeBs0fuO8mqdFaezdFx/rzFi7BipDEXgG3oC17AQB0y8MFd0
	 A/KGVwSVfdJaw==
Date: Fri, 31 Jan 2025 08:33:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, sander@svanheule.net, 
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Message-ID: <20250131-kind-rapid-kagu-7fc4c5@krzk-bin>
References: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
 <20250131010151.2527688-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131010151.2527688-3-chris.packham@alliedtelesis.co.nz>

On Fri, Jan 31, 2025 at 02:01:49PM +1300, Chris Packham wrote:
>  .../bindings/mfd/realtek,rtl9301-switch.yaml  | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> index f053303ab1e6..89e10213a4ee 100644
> --- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> @@ -28,6 +28,9 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  mdio-controller:
> +    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
> +

So this mdio-controller looks duplicated now. Why is it needed?

>    '#address-cells':
>      const: 1
>  
> @@ -41,6 +44,10 @@ patternProperties:
>    'i2c@[0-9a-f]+$':
>      $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
>  
> +  'mdio-controller@[0-9a-f]+$':
> +    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
> +
> +

Just one blank line.


Best regards,
Krzysztof


