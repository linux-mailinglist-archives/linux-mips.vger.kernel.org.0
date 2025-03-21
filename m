Return-Path: <linux-mips+bounces-8300-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F61A6C4F4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 22:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 956117A48CA
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D37E230BDC;
	Fri, 21 Mar 2025 21:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ld9kuUmE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E52B1E9B34;
	Fri, 21 Mar 2025 21:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591874; cv=none; b=GRQmH7C9cojzNHRQnoVKOH/paK4nRB8TMmp8e8nDdgqAw7Dn1yu+JIGQJcX8eT5aAydnnqYUYgQzlN1PFw4RMJHLVSvllWK4l6P5H1SUWZioqdEPT+wkwB8RK/fSutw/0hrzc3Ae4FYZWLsYvndMAIZNuKELQJTd+o0EE71RRv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591874; c=relaxed/simple;
	bh=C/slDLsVZA+POkdjKaneh/Mopf/nDPmAiSvf3BmG6sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5mEW7mefIJ7SL5mUHUxjLhsQtZx30g4vTzUn3JJ2iGlhLki7CK/tu9JEolLTIxvbDxszNn2u5RPeKr2vDUvCtVJu9aJpQlOJZmHi77DOLPIbvc9nAEj9pxMjtVY5Nkz+WWM9LJkwdB+O6p7QYiZuMkl0AOIPbADvvTK9aasjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ld9kuUmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E90EC4CEE3;
	Fri, 21 Mar 2025 21:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742591873;
	bh=C/slDLsVZA+POkdjKaneh/Mopf/nDPmAiSvf3BmG6sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ld9kuUmEMekkdJkzdMZxLynD8HBO9DYdN31pAuQY06F6OX5p6mzCFXDZt+euc7o75
	 4XkxhZjQnS3jRlNe6IBw9qY/A2lGPWde2Lhx8/iJS4u1miQmo2jYz5qzhkYtHO6Nm6
	 rVmpkhL8iubQLeB0U2nEyJB5hxTDQL/OZqy1VRkTTkeoimYxDUbcpCKv4INnZT28C4
	 R4hzoQ4SZkhCXcA7sXvF+eg/2egpbYUJOgRAMt5ytKlW6yImyvzSELKe9VBt7aRHpB
	 fa71A22OvvXm2Mmge/BKvdQNYmyvuGiSdpEiG4dyEYOPOAPb5my4N2vGOirsBgBDxO
	 wxLlpTWKbgnKA==
Date: Fri, 21 Mar 2025 16:17:52 -0500
From: Rob Herring <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu
Subject: Re: [PATCH v1 2/8] dt-bindings: interrupt-controller: Add EcoNet
 EN751221 INTC
Message-ID: <20250321211752.GA3970526-robh@kernel.org>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-3-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321134633.2155141-3-cjd@cjdns.fr>

On Fri, Mar 21, 2025 at 01:46:27PM +0000, Caleb James DeLisle wrote:
> Document the device tree binding for the interrupt controller in the
> EcoNet EN751221 MIPS SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> If anyone is aware of a standard name for this "shadow interrupt" pattern,
> please let me know and I will re-send with updated naming.
> ---
>  .../econet,en751221-intc.yaml                 | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
> new file mode 100644
> index 000000000000..1b0f262c9630
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/econet,en751221-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet EN751221 Interrupt Controller
> +
> +maintainers:
> +  - Caleb James DeLisle <cjd@cjdns.fr>
> +
> +description: |

Don't need '|' if no formatting.

> +  The EcoNet EN751221 Interrupt Controller is a simple interrupt controller
> +  designed for the MIPS 34Kc MT SMP processor with 2 VPEs. Each interrupt can
> +  be routed to either VPE but not both, so to support per-CPU interrupts, a
> +  secondary IRQ number is allocated to control masking/unmasking on VPE#1. For
> +  lack of a better term we call these "shadow interrupts". The assignment of
> +  shadow interrupts is defined by the SoC integrator when wiring the interrupt
> +  lines, so they are configurable in the device tree.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: econet,en751221-intc
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Interrupt line connecting this controller to its parent.
> +
> +  econet,shadow-interrupts:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Looks like uint32-matrix to me as it pairs of u32's.

> +    description: |
> +      An array of interrupt number pairs where each pair represents a shadow
> +      interrupt relationship. The first number in each pair is the primary IRQ,
> +      and the second is its shadow IRQ used for VPE#1 control. For example,
> +      <8 3> means IRQ 8 is shadowed by IRQ 3, so IRQ 3 cannot be mapped, but
> +      when VPE#1 requests IRQ 8, it will use manipulate the IRQ 3 mask bit.
> +    maxItems: 40
> +    items:
> +      minimum: 0
> +      maximum: 40

Then this would be:

minItems: 1
maxItems: 40
items:
  items:
    - description: primary IRQ
    - description: shadow IRQ

(Feel free to expand the descriptions)

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - interrupt-parent

Generally, interrupt-parent is never required. It can be in a parent 
node for example.

> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    intc: interrupt-controller@1fb40000 {

Drop unused labels (intc).

> +        compatible = "econet,en751221-intc";
> +        reg = <0x1fb40000 0x100>;
> +
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +
> +        interrupt-parent = <&cpuintc>;
> +        interrupts = <2>;
> +
> +        econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
> +    };
> +...
> -- 
> 2.30.2
> 

