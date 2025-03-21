Return-Path: <linux-mips+bounces-8292-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB1A6C4AC
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 514EE7A2D4A
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EC7230BD1;
	Fri, 21 Mar 2025 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSxvE5IF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8313C695;
	Fri, 21 Mar 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742590595; cv=none; b=V13B6OtIXBdOqQ2m1msCeNr146atS5zuYuWg9SYgbuNJ04uHBS56AkktPYMOW3EBj458CEPG44bcvRrUyfm/EyrcDFFgfcbwyn7JVy7LcqM42inziHQcC5aPpKEmg2LpIx5eYQ/YlEn6jIpr5R8t/GiwMpY3S1uf7i4PpFkLtGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742590595; c=relaxed/simple;
	bh=ec3+o488fphAO1T0qvJyJYNbwPmkpTwgA5JJPdJ8RSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfTIV1bia3y/dBWV1pfdSZMpzLKK+DpQuO/6vTKpC5yXK2f5ftvb3VC5tI6N0KJBnnzYGXeYebns+sZNVjiSAZu6TfWCHLrwmpffhpz8TZ1OIvGiehNX9jZ41kC4pY7O+9hirQ/8qVb23skPMB2lmpgz72HLyjvyMyr+bwpklb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSxvE5IF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722F1C4CEE3;
	Fri, 21 Mar 2025 20:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742590593;
	bh=ec3+o488fphAO1T0qvJyJYNbwPmkpTwgA5JJPdJ8RSk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hSxvE5IFT7zH25ei6WnDtLU0sFcu9ydwmTx/UyDdgcSMVfBswrk1afZzc5DpFLFbt
	 eE9E7i3FLDdIrIxRLT4B38SdoF+tqiHl1atfY8ac3VsWy7ITeheVHQQd07IXoMNo5f
	 uDa/93Yu1+6egWKBC3unIsrulPiRd4UGCuaeeFFGvwzJHvg8DiYXKd3Zg331+IQMJs
	 KlMp3z+6U/N1l/PM1onnLacgYR6L+HRCvDTOpiZtON4BGVzfFkRmkrYUPxo2a78EXL
	 RThnvi5Kt6pr45BYn48+O+ibCWAup/EV3VZgPLwS+uv1qlpfQFR5jQMhSv/RanKkQW
	 QeiJNQTCutkOA==
Message-ID: <c1791b2e-bdf6-448c-88d3-c97511af3357@kernel.org>
Date: Fri, 21 Mar 2025 21:56:27 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] dt-bindings: timer: Add EcoNet HPT CPU Timer
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-5-cjd@cjdns.fr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250321134633.2155141-5-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2025 14:46, Caleb James DeLisle wrote:
> Add device tree binding documentation for the high-precision timer (HPT)
> in the EcoNet EN751221 SoC.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Previous patch was not tested, so was this one tested?

> ---
>  .../bindings/timer/econet,timer-hpt.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
> new file mode 100644
> index 000000000000..8b7ff9bce947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/econet,timer-hpt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet High Precision Timer (HPT)
> +
> +maintainers:
> +  - Calev James DeLisle <cjd@cjdns.fr>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
> +  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
> +  count/compare registers and a per-CPU control register, with a single interrupt
> +  line using a percpu-devid interrupt mechanism.
> +
> +properties:
> +  compatible:
> +    const: econet,timer-hpt

Soc components must have soc-based compatible and then filename matching
whatever you use as fallback.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2

No, list items instead.

> +    description: |
> +      Physical base address and size of the timer's register space. On 34Kc
> +      processors, a single region is used. On 1004Kc processors, two regions are
> +      used, one for each core.

So different hardware, different compatible. That's why you need
soc-based compatibles. Follow standard SoC upstreaming rules and examples.

> +
> +  interrupts:
> +    maxItems: 1
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      The interrupt number for the timer.

Drop, redundant.


> This is a percpu-devid interrupt shared
> +      across CPUs.
> +
> +  clocks:
> +    maxItems: 1
> +    description: |
> +      A clock to get the frequency of the timer.

Drop description, redundant

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    timer_hpt@1fbf0400 {

No underscores

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Look how other SoCs are calling this.

> +        compatible = "econet,timer-hpt";
> +        reg = <0x1fbf0400 0x100>;
> +        interrupt-parent = <&intc>;
> +        interrupts = <30>;
> +        clocks = <&hpt_clock>;
> +    };
> +...


Best regards,
Krzysztof

