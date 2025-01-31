Return-Path: <linux-mips+bounces-7652-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E6A239AD
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 08:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F26A83A4901
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 07:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D87D1494AD;
	Fri, 31 Jan 2025 07:00:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE08214885B;
	Fri, 31 Jan 2025 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738306814; cv=none; b=nEb2RU62+E+WocnWGDcYRwUyT5Z5PQ75aavdoj71Sji8BMpaJgii7A/uf3tXrY2rFvExwIX4kBxYsCDawepV+ey8qkBSS1mrtAN7cbrVswFT20JPft4ZZwwKB1zvvoWHmCbb6pKXhL+eb5r/Y8jWery7PA3AuLvyb653/hMDCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738306814; c=relaxed/simple;
	bh=UVM+F0b39UD/id5lC4ozCJ/wtWd6poX6H5neKCRmBjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QX3PKnK/bGaytWQFCPEWmE4E43jXEkKGvY1c9Tz7R4vw1jWv4wffOYmd/YOA8QBlRo96QzWxwiEWXQRPTRro/Kvixm4AGXBZeMI5PuFLt7Fj9CdNcG7/3rzDTDeoL5zW5AKhkCBw6R4n2Ax1pYU8UJxwYCEUa9lZ5FFjY1C1yI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tdkd8-000000002Cy-1baG;
	Fri, 31 Jan 2025 06:35:54 +0000
Date: Fri, 31 Jan 2025 06:35:50 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	tsbogend@alpha.franken.de, hkallweit1@gmail.com,
	linux@armlinux.org.uk, sander@svanheule.net,
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Message-ID: <Z5xvRlKQiQ5cm0gl@makrotopia.org>
References: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
 <20250131010151.2527688-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131010151.2527688-3-chris.packham@alliedtelesis.co.nz>

Hi Chris,

afaik net-next is still closed right now, but lets discuss the series as RFC
in the meantime maybe, right?

On Fri, Jan 31, 2025 at 02:01:49PM +1300, Chris Packham wrote:
> The MDIO controller is part of the switch on the RTL9300 family of
> devices. Add a $ref to the mfd binding for these devices.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     This patch is dependent on "dt-bindings: net: Add Realtek MDIO
>     controller" which adds the realtek,rtl9301-mdio.yaml binding.
>     
>     Changes in v5:
>     - Note dependency on realtek,rtl9301-mdio.yaml patch
>     - Add back reg property to the mdio-controller node.
>     Changes in v4:
>     - There is a single MDIO controller that has MDIO buses as children
>     Changes in v3:
>     - None
>     Changes in v2:
>     - None
> 
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
>  required:
>    - compatible
>    - reg
> @@ -110,5 +117,27 @@ examples:
>            };
>          };
>        };
> +
> +      mdio-controller@ca00 {
> +        compatible = "realtek,rtl9301-mdio";
> +        reg = <0xca00 0x200>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mdio-bus@0 {
> +          reg = <0>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          ethernet-phy@0 {
> +            reg = <0>;
> +            realtek,port = <1>;

Aren't all those PHYs referenced as phandles by DSA switch ports?

Imho it would be better to not introduce a new property but instead
let the driver of the mdio-controller parse the DSA switch description
and follow the existing 'phy-handle' properties in order to infer the
mapping of all ports to all PHYs, and by that then be able to also
know the reverse mapping.
You could reference the switch node in the mdio-controller node.

That would avoid redundant information in the device tree, as we
would then only have one mapping instead of having it two times
(once by the usual 'phy-handle' property of the DSA user port and
another time reverse using your newly introduce 'realtek,port'
property of each ethernet-phy).


> +          };
> +          ethernet-phy@1 {
> +            reg = <1>;
> +            realtek,port = <0>;
> +          };
> +        };
> +      };
>      };
>  
> -- 
> 2.48.1
> 
> 

