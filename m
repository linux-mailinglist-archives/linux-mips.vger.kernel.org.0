Return-Path: <linux-mips+bounces-7678-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA27A26D04
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 09:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC3F18884D5
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 08:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55792063FE;
	Tue,  4 Feb 2025 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0uXKFq3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FF86358;
	Tue,  4 Feb 2025 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738656591; cv=none; b=Pdt+SeLg4FrdjMOu8Acs7rt6pd3fU5X3aLgGOOHBvIs2PPZYEH50Anp42E2oruTicAoNNg950cwXmOZZ1p9OxQ6w3/4O8nVaCKPT1C2V2dE/qkb9CoCFVnP6XGjVe/DXIrzmADIbMLA0+DhP9L0ns65ypyzjF1ET1bjtX1HQOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738656591; c=relaxed/simple;
	bh=bFm8xckl9GEGcjJ/G3JflsLV5lI4LkrRhOF3B9n4yCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZC6A0ZcnRPXCvb/s9+LGDBUdAUFUZQUdFQRVj7lEUSEgDm9Y9J4DgbGpsbnr7F3GQy98Jrw0NKzmA5ckvRhdP4lC/vONRdSUOUf64Hiibr76WEcM/+XNgePydbqeeaaAGBWhLOgOLLEp3w9J/WSP2k+RmqVam8H+N+Yjy+NkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0uXKFq3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E93C4CEDF;
	Tue,  4 Feb 2025 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738656591;
	bh=bFm8xckl9GEGcjJ/G3JflsLV5lI4LkrRhOF3B9n4yCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0uXKFq3SSSp8fS36uflCRro+a6/F9mmeGmlgEgAgX8GYXeD4vTIzRhFmEKVU66qo
	 w7CsvJbCHHYPSdkTrIYS8f0VYY2v+tUZnR7MRTTs/3x7QStdt8QcY+8QaPAjc2DD/H
	 5bGJQCr4jwE999d6F5vQgaPWwK44kODqbstNDvEokHmtbsfMSF9Im6JCV6mHtOKTMO
	 sdJQdciwj/AK/Rg4g4f+La3/K6L2qdZAGjCPmItShoIU9kX7t2d7Zcc7FnxYFjiG5o
	 tMGSShZXQCGesvB1aVbNYYXugR3b5lLPu2/0W1JPHk7p9JHtEwsuSc37P5+HUN++5A
	 bm6l9CG/JI9OQ==
Date: Tue, 4 Feb 2025 09:09:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, sander@svanheule.net, 
	daniel@makrotopia.org, markus.stockhausen@gmx.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-next v6 1/6] dt-bindings: mfd: Add switch to RTL9300
Message-ID: <20250204-eccentric-deer-of-felicity-02b7ee@krzk-bin>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
 <20250204030249.1965444-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
>       type: object here or does by driver need to handle both "ports" and
>       "ethernet-ports" (I see some do and some don't).
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
> +
>  properties:
>    compatible:
>      items:
> @@ -45,7 +47,7 @@ required:
>    - compatible
>    - reg
>  

I don't get why this device receives now children without addresses.
Either your children have 'reg' or they do not. Mixing is a sign of a
mess, like this was never actually simple-mfd.

You would get this comment if you posted complete schema the first time.

Best regards,
Krzysztof


