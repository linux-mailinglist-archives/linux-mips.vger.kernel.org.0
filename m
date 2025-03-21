Return-Path: <linux-mips+bounces-8305-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9A4A6C689
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 00:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EA0E4821C7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 23:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF3720F07D;
	Fri, 21 Mar 2025 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="aq0vnjZ7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB212AD21;
	Fri, 21 Mar 2025 23:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742601335; cv=none; b=lzqm13+noST33Tp9TjUMnQ+/7kLNWgy/XyKGJ2wm2gYMUCvo8LbSjNdpv/IRkjaQtZuAnKqbMRRl2CwDGO2JKqUNQpn2fIfwGIQXUWwm4q9+hxWoC6EnXSth37QFjNemKEPQFm+u81A5qqIG9zIk/TT584DUipGb09fpNSH/8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742601335; c=relaxed/simple;
	bh=tM+Y7qY57N8Hwt2vqT/hZUX7pDEsPwiIi9Ee3mFu0Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUYJVQoTFsnYJJvqiky33lasjcH/uMNPDy3qA6Z3C2C/NFFCpZmdRn3IIiSknuF+kfG80HUAMFTaaP46RAF2TMOp2drIgM+W6BuJ6CL+E0Wi6wn4Bwj4v2JFwQjgDieebyyyK/UZI9y8TxptVOQAC2lg4UvT8qFuERyACJvtWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=aq0vnjZ7; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F05D299882;
	Sat, 22 Mar 2025 00:55:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742601330; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IUM1wVVjOwVSF2R3rZm8EaeiH5SmVgXAx/5TyFoGIRI=;
	b=aq0vnjZ73HxkTtspFmsz3STpQeKQ+IB+WRYQQmOeAlvgYzQIHtFv0u17QqTkBmj9JSBjKO
	fXdsl3g7JDwaJQlVFffdYnfQ2PW4w47kOwp916gW1nIphZJ4YZ5o17+5kVYXR9pvZf8BPa
	0ZHpa9W17HAEaL2/Zx+3Wa1bFQRwOorjHsF6KvLYOnHPuOJX/Ud2ou0+RFzVE7hKjRIUop
	gXTX43Gkz1Py+0iIlyckQQwTCknwcGt2X3pNbNYhxXl9UaHhsCE7EYlhIqBv/9pEuQhm92
	o1o1+0U1fg+P49Cqgb5xg0HjMJHAePchc+NLMb/+CUN0JHyGMmxVdvy8mwp1+g==
Message-ID: <6b07cb8c-6d79-43c7-a6e9-5aaa5600a702@cjdns.fr>
Date: Sat, 22 Mar 2025 00:55:28 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v1 2/8] dt-bindings: interrupt-controller: Add EcoNet
 EN751221 INTC
To: Rob Herring <robh@kernel.org>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-3-cjd@cjdns.fr>
 <20250321211752.GA3970526-robh@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20250321211752.GA3970526-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 21/03/2025 22:17, Rob Herring wrote:
> On Fri, Mar 21, 2025 at 01:46:27PM +0000, Caleb James DeLisle wrote:
>> Document the device tree binding for the interrupt controller in the
>> EcoNet EN751221 MIPS SoC.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>> If anyone is aware of a standard name for this "shadow interrupt" pattern,
>> please let me know and I will re-send with updated naming.
>> ---
>>   .../econet,en751221-intc.yaml                 | 77 +++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
>> new file mode 100644
>> index 000000000000..1b0f262c9630
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
>> @@ -0,0 +1,77 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interrupt-controller/econet,en751221-intc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: EcoNet EN751221 Interrupt Controller
>> +
>> +maintainers:
>> +  - Caleb James DeLisle <cjd@cjdns.fr>
>> +
>> +description: |
> Don't need '|' if no formatting.
Got it, thanks.
>
>> +  The EcoNet EN751221 Interrupt Controller is a simple interrupt controller
>> +  designed for the MIPS 34Kc MT SMP processor with 2 VPEs. Each interrupt can
>> +  be routed to either VPE but not both, so to support per-CPU interrupts, a
>> +  secondary IRQ number is allocated to control masking/unmasking on VPE#1. For
>> +  lack of a better term we call these "shadow interrupts". The assignment of
>> +  shadow interrupts is defined by the SoC integrator when wiring the interrupt
>> +  lines, so they are configurable in the device tree.
>> +
>> +allOf:
>> +  - $ref: /schemas/interrupt-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: econet,en751221-intc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#interrupt-cells":
>> +    const: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: Interrupt line connecting this controller to its parent.
>> +
>> +  econet,shadow-interrupts:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> Looks like uint32-matrix to me as it pairs of u32's.
Thanks for the pointer, will update.
>
>> +    description: |
>> +      An array of interrupt number pairs where each pair represents a shadow
>> +      interrupt relationship. The first number in each pair is the primary IRQ,
>> +      and the second is its shadow IRQ used for VPE#1 control. For example,
>> +      <8 3> means IRQ 8 is shadowed by IRQ 3, so IRQ 3 cannot be mapped, but
>> +      when VPE#1 requests IRQ 8, it will use manipulate the IRQ 3 mask bit.
>> +    maxItems: 40
>> +    items:
>> +      minimum: 0
>> +      maximum: 40
> Then this would be:
>
> minItems: 1
> maxItems: 40
> items:
>    items:
>      - description: primary IRQ
>      - description: shadow IRQ
>
> (Feel free to expand the descriptions)
Yes, much nicer.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupt-controller
>> +  - "#interrupt-cells"
>> +  - interrupt-parent
> Generally, interrupt-parent is never required. It can be in a parent
> node for example.
Removed, thanks.
>
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    intc: interrupt-controller@1fb40000 {
> Drop unused labels (intc).

Ok.


Thank you very much for your time, hope to see you soon in v2.

Thanks,

Caleb


>
>> +        compatible = "econet,en751221-intc";
>> +        reg = <0x1fb40000 0x100>;
>> +
>> +        interrupt-controller;
>> +        #interrupt-cells = <1>;
>> +
>> +        interrupt-parent = <&cpuintc>;
>> +        interrupts = <2>;
>> +
>> +        econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
>> +    };
>> +...
>> -- 
>> 2.30.2
>>

