Return-Path: <linux-mips+bounces-7699-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF2A276BC
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 17:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DED83A5386
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 16:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A13215182;
	Tue,  4 Feb 2025 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aX4YN+Vl"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7852139D8;
	Tue,  4 Feb 2025 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685032; cv=none; b=RTZunOqPHQnbsu6NvflCgj+OqBK2Mp/HbzfcBqpvsi43tEV8JjyD/3hH/CANH5FuZS/oRRR2Jk59NvdnoxxNMhNV2kS0CsY1k4mOSS/SZbRdHGNtD2s+s027Caqu66/Kk6tj5tyhT80xbDK8x0tzdqPaEeBO+wRYRXfSoeZSjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685032; c=relaxed/simple;
	bh=2LOVhSPouXm27QUnmCvrnatlAab8qMXu8O47AZsRIAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8Fgkse1rWglys21naKNFdVdeAPx9fkIQ2lb6Bcxl+1i62TdRWFC+PdCUPg07c4Wl51pL/2wtQbFxaDujy1a/zn6pnHPY8ef6alZ8BCOSrbW16qAfDffHRaczuWVbqnY1nKul3tn0o0TeD8c1WVgQ5DK1TG+nh3vR8P5ZpYXK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aX4YN+Vl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16EFC4CEDF;
	Tue,  4 Feb 2025 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738685032;
	bh=2LOVhSPouXm27QUnmCvrnatlAab8qMXu8O47AZsRIAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aX4YN+Vlr2UVaRoE17hIxFXWJDtVjPudSAMymgQyQeUZoDA+jTiW2MOi6M5U519Cv
	 GvjQBNz2/ZiGwdzfbrreccR5WlDwj2Kak2aXLpHtHZzhbzdK73wKek/Aym19JmU4JL
	 vqaMTlPfR1e5nEuMUi4Yzx16o/CrtSZd14GCyixKUo5bdXUlBc1+w9PJ1/NibF7Ksb
	 2XupNgcVJuW4esZbOeZKdipRmwuBpMrpb1nkXJcrHLDHmtE/IFJHt9kU857oBvrWGD
	 m9gxp6nmAQANCZYzmaTqk7crK9LVG9coEZeMdoJ5WapzPe2Kv4qJ2LxTItinXkOcbl
	 ZJI7ix+RrcrQw==
Date: Tue, 4 Feb 2025 10:03:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: netdev@vger.kernel.org, linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org, hkallweit1@gmail.com, kuba@kernel.org,
	conor+dt@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, pabeni@redhat.com, tsbogend@alpha.franken.de,
	linux@armlinux.org.uk, sander@svanheule.net, krzk+dt@kernel.org,
	markus.stockhausen@gmx.de, daniel@makrotopia.org,
	linux-kernel@vger.kernel.org, edumazet@google.com
Subject: Re: [PATCH net-next v6 2/6] dt-bindings: net: Add Realtek MDIO
 controller
Message-ID: <173868503036.2827831.5451264142133943992.robh@kernel.org>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
 <20250204030249.1965444-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204030249.1965444-3-chris.packham@alliedtelesis.co.nz>


On Tue, 04 Feb 2025 16:02:45 +1300, Chris Packham wrote:
> Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
> controller is slightly unusual in that direct MDIO communication is not
> possible. We model the MDIO controller with the MDIO buses as child
> nodes and the PHYs as children of the buses. The mapping of switch port
> number to MDIO bus/addr requires the ethernet-ports sibling to provide
> the mapping via the phy-handle property.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v6:
>     - Remove realtek,port property. The driver will parse the ethernet-ports
>       sibling node to figure out the mapping (do I need to mention that
>       somewhere in this binding?).
>     - Correct number of mdio buses. 4 possible buses numbered 0-3.
>     Changes in v5:
>     - Add back reg property to mdio-controller node
>     - Make unit address in the node name required
>     - Andrew suggested perhaps doing away with the realtek,port property and
>       providing the overall mapping via an array of phandles. I've explored
>       this a little, it is doable but I'm not sure it actually makes things
>       any clearer when the portmap has gaps so I haven't made this change.
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
>  .../bindings/net/realtek,rtl9301-mdio.yaml    | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


