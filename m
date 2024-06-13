Return-Path: <linux-mips+bounces-3668-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 993A9907C00
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 21:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23BA11F241DD
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 19:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B2214C58A;
	Thu, 13 Jun 2024 19:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVhws3Xc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6560814A619;
	Thu, 13 Jun 2024 19:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718305471; cv=none; b=mKOenqpnMacr5bdMAgpz2RlccRABQeAaBrkm1qNKzikcWu7sAybQFjwRoVLPUKbO7MRyDw0ep0rsDs/xW5UD10vpE4M66deyrJejStZUBlS4wBBNbKNfZIBBgW5PZlfQwO5H2CgT/4vyt7Bno8tFzPjVr3uX62UVh+5iOlgiLPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718305471; c=relaxed/simple;
	bh=eFJCCOMe/8pQg9xKxt92o9frt/uAPWdpBDFiT+/xC94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/AizxbKZt9d6tgHjMAKN+/vQksbDN4jhfgoEWmzIZQKHRB23roHsiol6Y1jZmKEHQJDu2rIkPIqHEk8F8kzdpDSb8RJDa9BRb1Hgb8Nm1W1T1pmTTz2On4BYCgTLe1xPnWYx9FLctnShn1d36mbKf4f18jb+Sbkc0ZFRfpFML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVhws3Xc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF4DC2BBFC;
	Thu, 13 Jun 2024 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718305470;
	bh=eFJCCOMe/8pQg9xKxt92o9frt/uAPWdpBDFiT+/xC94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVhws3Xc93z4zA+lTYfwS0aTB7Go05UfFXNViphTA463DglTcwGARKyhux9wVDK88
	 QGux/ZeZkiiWhU6QiPdmD/phuirgIuW2Mcn+oW1Jb55DD59d1CUeWjIWm1tjsIFd7/
	 /fmKJ9Fk6BcEJZA1qnabsV7LNnwBSk0FJNfW+JGLuD+BxPq2n+Kut+fZbmE3jpTaLG
	 uA5GFvVbR7bZznG9vPVOeky4Kav+c1uDfn2/aybN1CVtcm5hXORMEbvPoKMmo3/UnC
	 4YxEA+67CJyUPXwtIzXM3MUv//QyyGqAz7u4hu07rla+IXuIfuVX5n+ZkR8+8pNspo
	 Mk8J/iSBZwrKg==
Date: Thu, 13 Jun 2024 13:04:29 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 6/8] dt-bindings: mfd: Add img,boston-platform-regs
Message-ID: <20240613190429.GA2309072-robh@kernel.org>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-6-9f8e1a07fa63@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-boston-syscon-v2-6-9f8e1a07fa63@flygoat.com>

On Wed, Jun 12, 2024 at 12:56:25PM +0100, Jiaxun Yang wrote:
> This compatible has been used in arch/mips/boot/dts/img/boston.dts
> for a while but never documented properly.
> 
> Write a new binding for this device.
> This also covers old img,boston-clock binding so remove that binding.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../devicetree/bindings/clock/img,boston-clock.txt | 31 ---------
>  .../bindings/mfd/img,boston-platform-regs.yaml     | 74 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> deleted file mode 100644
> index 7bc5e9ffb624..000000000000
> --- a/Documentation/devicetree/bindings/clock/img,boston-clock.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Binding for Imagination Technologies MIPS Boston clock sources.
> -
> -This binding uses the common clock binding[1].
> -
> -[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> -
> -The device node must be a child node of the syscon node corresponding to the
> -Boston system's platform registers.
> -
> -Required properties:
> -- compatible : Should be "img,boston-clock".
> -- #clock-cells : Should be set to 1.
> -  Values available for clock consumers can be found in the header file:
> -    <dt-bindings/clock/boston-clock.h>
> -
> -Example:
> -
> -	system-controller@17ffd000 {
> -		compatible = "img,boston-platform-regs", "syscon";
> -		reg = <0x17ffd000 0x1000>;
> -
> -		clk_boston: clock {
> -			compatible = "img,boston-clock";
> -			#clock-cells = <1>;
> -		};
> -	};
> -
> -	uart0: uart@17ffe000 {
> -		/* ... */
> -		clocks = <&clk_boston BOSTON_CLK_SYS>;
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
> new file mode 100644
> index 000000000000..bf94de38a89f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/img,boston-platform-regs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Imagination Technologies Boston Platform Registers
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: img,boston-platform-regs
> +      - const: syscon
> +      - const: simple-mfd

Why did you add 'simple-mfd'? That's not what is in use.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clock:

Really should be 'clock-controller', but if you don't plan to update the 
DTS, then it is fine as-is.

> +    type: object
> +
> +    description: Boston Clock Controller Device Node
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell.
> +      See include/dt-bindings/clock/boston-clock.h for the full list of boston
> +      clock IDs.
> +
> +    properties:
> +      "#clock-cells":
> +        const: 1
> +
> +      compatible:
> +        const: img,boston-clock
> +
> +    required:
> +      - "#clock-cells"
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  syscon-reboot:

Just 'reboot'

> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - clock
> +  - syscon-reboot
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/boston-clock.h>
> +
> +    plat_regs: system-controller@17ffd000 {
> +      compatible = "img,boston-platform-regs", "syscon", "simple-mfd";
> +      reg = <0x17ffd000 0x1000>;
> +
> +      clk_boston: clock {
> +        compatible = "img,boston-clock";
> +        #clock-cells = <1>;
> +      };
> +
> +      reboot: syscon-reboot {
> +        compatible = "syscon-reboot";
> +        regmap = <&plat_regs>;
> +        offset = <0x10>;
> +        mask = <0x10>;
> +      };
> +    };
> 
> -- 
> 2.43.0
> 

