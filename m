Return-Path: <linux-mips+bounces-7698-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0987A276B5
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 17:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67946164176
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 16:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBC2215170;
	Tue,  4 Feb 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPEZWnKw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D287AD2D;
	Tue,  4 Feb 2025 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684935; cv=none; b=PEVRtIIgbD0Gk+kBe+XmxNJzd6KHlXxCx5VugkVRkSA4IZ3DqWe7Hu/IQLU6OLcdHwWrBibeP9fVa/CgECRNzDkOrRlO/B7WFowd4bqW7sbZCQfVSUZor6TnVbbFZ57FkxhXItYFFBz9cahQ5Arvx+eqvKdS9v1ULNXeGLVZJZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684935; c=relaxed/simple;
	bh=tBFoh4bKuNPwzCz/k+QiDR73rgFsF8KTCFH49JQoGQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edDrvzocp4fg6GRTr2FrgDPfjRIYN/UTwaHHAhJax98f5sk+r6orAkk5SC9IDr/pxfLUQCSwcR3QbnC+pHT8SiCYp/OAw+di3K6hGyDVAQvcBAsvIZCEFeOCGQp7BEpDbW9MHPT5I60ES/S7M1C+nVb16DTJZYKakP/phPDGJYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPEZWnKw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4BCC4CEDF;
	Tue,  4 Feb 2025 16:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738684934;
	bh=tBFoh4bKuNPwzCz/k+QiDR73rgFsF8KTCFH49JQoGQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPEZWnKwGtyQB4uGrgs23wzo/FUCs58JGxbrtKTfFWS7D3reqAq68Tag6S2/WGlce
	 5c8nUcafvJjxBKHIT2dQBIgO2LP8EMHvPdXcw5Z+KQ9F+Qk9jP2M21Flyr+mkaMkW0
	 yZjb8I0Q9HUKvkGUcUo/CK2lLgDIRehUYOPT+d1AE5jILIGGKVuMt+fCOnSYbM4m1l
	 T4U1lT0VjstNZDrWjajLwrJLqsV3pmtm8tk4fVlGcxpbN3vVO7K0PRxIglrvw/uQ2q
	 L8M+5ctckpTfxtGYYZyeVrV5MIUQQPPtVobCUL+KBASvgIpv3afcNXNw6KTt2l4ygi
	 CEahpNzrrNbZg==
Date: Tue, 4 Feb 2025 10:02:13 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
	hkallweit1@gmail.com, linux@armlinux.org.uk, sander@svanheule.net,
	daniel@makrotopia.org, markus.stockhausen@gmx.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-next v6 1/6] dt-bindings: mfd: Add switch to RTL9300
Message-ID: <20250204160213.GA2811393-robh@kernel.org>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
 <20250204030249.1965444-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204030249.1965444-2-chris.packham@alliedtelesis.co.nz>

On Tue, Feb 04, 2025 at 04:02:44PM +1300, Chris Packham wrote:
> Add bindings for the ethernet-switch portion of the RTL9300.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v6:
>     - New
>     - I'd like to enforce the property being "ethernet-ports" but I see the
>       generic binding allows "ports" as well. Can I just add ethernet-ports:
>       type: object here

Yes. And keep 'additionalProperties'.

>  or does by driver need to handle both "ports" and
>       "ethernet-ports" (I see some do and some don't).

No, it doesn't.

> 
>  .../bindings/mfd/realtek,rtl9301-switch.yaml     | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> index f053303ab1e6..cb54abda5e6a 100644
> --- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> @@ -14,6 +14,8 @@ description:
>    number of different peripherals are accessed through a common register block,
>    represented here as a syscon node.
>  
> +$ref: /schemas/net/ethernet-switch.yaml#

If you don't have any device specific per port properties, then this 
needs to be: ethernet-switch.yaml#/$defs/ethernet-ports

> +
>  properties:
>    compatible:
>      items:
> @@ -45,7 +47,7 @@ required:
>    - compatible
>    - reg
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -110,5 +112,17 @@ examples:
>            };
>          };
>        };
> +
> +      ethernet-ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +        };
> +        port@1 {
> +          reg = <1>;
> +        };
> +      };
>      };
>  
> -- 
> 2.48.1
> 

