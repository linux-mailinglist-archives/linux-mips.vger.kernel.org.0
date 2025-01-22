Return-Path: <linux-mips+bounces-7569-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EB1A18D75
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 09:14:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20D28161E8D
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2025 08:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511D91C3C01;
	Wed, 22 Jan 2025 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddgU4ZR7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200FE196;
	Wed, 22 Jan 2025 08:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737533666; cv=none; b=KyWBcu5GgUmza7tOatPryH5zIUjpGV4/y/V5dj71rWSNZxjIrDVfrDK92plrfo2z3RNg1/m8/a9IgEIHz7/KjZreOtcjvav7kRxZcNkwsXuqS1pecB+597+bcI71TM3biTvLGuYT9CmybIzHhQfDbC7UmprGsYTxUldqDF2Gbv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737533666; c=relaxed/simple;
	bh=uqq4XjpWOJLJlKj11MwPE8w4neu4toSKao0wV6l7vlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9nrU7fWg/Wdk39ptNRnaqr6BRDMKWxp7ggARuFwQdVPft3MsOgSrOQV80z2vwevskD6z0PtZRhO9NB9WPFvMLe/faXbgyoCGIolk66Sfm4jKR8LyPjK/m+MgoUPSolLXnfYCd8xQKzTyjRp1EilAuy7CZ3xvVL1MkJxpZLCM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddgU4ZR7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C5BC4CED6;
	Wed, 22 Jan 2025 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737533665;
	bh=uqq4XjpWOJLJlKj11MwPE8w4neu4toSKao0wV6l7vlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddgU4ZR7ztPgvA7UkozItyZ95c1ocP9C/FHhbW+fiSPlp0G6ywQOXjw/XmFLv2a+N
	 wJdVahvIWYH+78nU2bD0dsrpSObLI46yVWhb36F6sAsqVp84SnteFJvA5zUNl2KxIY
	 unjPB9dSSG+ZW/xcyz4rNnKzIhhzYJVb9mHU8J9f+n3MoVe2hcPknD613jGwdeQ8vz
	 1C8y8ncn/viJLp3hfVRsFMncMJoTFnH3+yXzXNXjADNBTexEF8/AbB+1zCyu2kXeMg
	 06o4atmE2HLNxdgR74cEglgWzNXF6CQBUk9gooJ+eKdqnxId7/pOdO/fJ7RpBHWxQg
	 +dV1KXsOl0UmA==
Date: Wed, 22 Jan 2025 09:14:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, sander@svanheule.net, 
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
Message-ID: <20250122-macho-flat-sawfly-7ca93d@krzk-bin>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
 <20250120040214.2538839-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120040214.2538839-3-chris.packham@alliedtelesis.co.nz>

On Mon, Jan 20, 2025 at 05:02:12PM +1300, Chris Packham wrote:
> The MDIO controller is part of the switch on the RTL9300 family of
> devices. Add a $ref to the mfd binding for these devices.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 

You need to explain merging dependencies. Nothing in cover letter,
nothing here, but this *CANNOT* be merged independently.

> Notes:
>     Changes in v4:
>     - There is a single MDIO controller that has MDIO buses as children
>     Changes in v3:
>     - None
>     Changes in v2:
>     - None
> 
>  .../bindings/mfd/realtek,rtl9301-switch.yaml  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
> index f053303ab1e6..c19d2c209434 100644
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
> @@ -110,5 +113,26 @@ examples:
>            };
>          };
>        };
> +
> +      mdio-controller {

No, no resources here, no unit address. Look at other nodes - they have
the resource, the address. Mixing such nodes is clear indication this is
not correct hardware description and you do this only for Linux.

Fold child device into parent.

Best regards,
Krzysztof


