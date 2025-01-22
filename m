Return-Path: <linux-mips+bounces-7568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C063A18D6D
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 09:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC87F188B4ED
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 08:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1CB1C3BF8;
	Wed, 22 Jan 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJY8JU6a"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5D928EC;
	Wed, 22 Jan 2025 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737533534; cv=none; b=ixAGDenIxk7sKCmp8jLLEif5ms2OXfDwemyFOAJFmS5hu/EltKfqzeNq9aCC+MzfWKXajvlZ+QtUGyJH8ZgUQ8PlOFuWrEPOA6URgz+RdNLjunU+XFyPwP2eSb3fuyiIhOgc/TlBoorVXWAtBo6Y+EUBY+D20S8FZTZwVIeIm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737533534; c=relaxed/simple;
	bh=8dfD8T9slxyqvjv+a/7JdKQSjrUalt7kDJ67Az7uV18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mep428ynX4de+u5a8S21rTekgyyjn61oWfNY83g9FdWVCCpYyfbshM4sVaZcuqsWRGilHlmBcUUOItUIi+dA8p9f0L+2/gaioauelz4iCBXAFzI17F3+CL0px1FA7qya9oVKphngD5iIsXT2unQNoV8sWLnykpZ5LsYxtoAvDpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJY8JU6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB91C4CED6;
	Wed, 22 Jan 2025 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737533533;
	bh=8dfD8T9slxyqvjv+a/7JdKQSjrUalt7kDJ67Az7uV18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJY8JU6a0JA5UOk3aomt0QBobiFv5vYkrzk2JxihHbJEmMLqiASGXxbyBu8XgUsYf
	 auRHk5iWR8E8FQN0jh5+NLrT5V/qrYjfcZXl5qlwaPMZONE0YjFdCYuLuJWKVJMZy0
	 r9xBOOCbuc1WNnYBxBOtlLIiSo+LTuw9xq1MvXVR0C2ATDYMwAqlMWOxd6P+32Gm6k
	 avMQkwDC+cvIRN/IBbnLerEzvLIJxuH6i1PSaNEvSR4J1LgyO8ZSNZ4/h5MTyljQ/0
	 YP7wRHmqi0L/l/woZ84nWDyNxXXYPBHOYYFwG7+1Zu6qOjQUbSzsdMSSEsVGDjpQOF
	 tPbHlX0SUYTrw==
Date: Wed, 22 Jan 2025 09:12:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, sander@svanheule.net, 
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: net: Add Realtek MDIO controller
Message-ID: <20250122-obedient-owl-from-ganymede-4a8343@krzk-bin>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120040214.2538839-2-chris.packham@alliedtelesis.co.nz>

On Mon, Jan 20, 2025 at 05:02:11PM +1300, Chris Packham wrote:
> Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
> controller is slightly unusual in that direct MDIO communication is not
> possible. We model the MDIO controller with the MDIO buses as child
> nodes and the PHYs as children of the buses. Because we do need the
> switch port number to actually communicate over the MDIO bus this needs
> to be supplied via the "realtek,port" property.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v4:
>     - Model the MDIO controller with the buses as child nodes. We still need
>       to deal with the switch port number so this is represented with the
>       "realtek,port" property which needs to be added to the MDIO bus
>       children (i.e. the PHYs)
>     - Because the above is quite a departure from earlier I've dropped the
>       r-by
>     Changes in v3:
>     - Add r-by from Connor
>     Changes in v2:
>     - None
> 
>  .../bindings/net/realtek,rtl9301-mdio.yaml    | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> new file mode 100644
> index 000000000000..e3ecb1b4afd3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/realtek,rtl9301-mdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTL9300 MDIO Controller
> +
> +maintainers:
> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - realtek,rtl9302b-mdio
> +              - realtek,rtl9302c-mdio
> +              - realtek,rtl9303-mdio
> +          - const: realtek,rtl9301-mdio
> +      - const: realtek,rtl9301-mdio
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^mdio-bus@[0-4]$':
> +    $ref: mdio.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +    patternProperties:
> +      '^ethernet-phy(@[a-f0-9]+)?':

Why is the unit address optional?

> +        type: object
> +        $ref: ethernet-phy.yaml#
> +
> +        properties:
> +          realtek,port:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              The MDIO communication on the RTL9300 is abstracted by the switch. At
> +              the software level communication uses the switch port to address the
> +              PHY with the actual MDIO bus and address having been setup via the
> +              parent mdio-bus and reg property.

I don't quite get why this cannot be the 'reg' property. I understood that
'reg' of this node is not really used? Or you meant here this 'reg', not
parent's 'reg'?

Best regards,
Krzysztof


