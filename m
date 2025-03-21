Return-Path: <linux-mips+bounces-8303-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88856A6C667
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 00:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33971672CF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 23:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E24F20C019;
	Fri, 21 Mar 2025 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="KWrCeNVY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3C1D54D8;
	Fri, 21 Mar 2025 23:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742599275; cv=none; b=otgLSr+qK7I+oft8XybX1QdbKJFH4HZFgua0vQ+THCdF6krdNTy8U6miaNHDDWtlWy9fQGJxsoVNr87OWTAUpEUB0tNtxSqumFuWb4QUnGfUKa8q9jEBemmZ3uQDLZuiJkRzrqpFWBlIJUnQM1mQdfzbDKbJdfL0YwFDLCngElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742599275; c=relaxed/simple;
	bh=En7UCMOZ/Us8TjDqlFU22i6jKe9CIGnV39ahNfBbLc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhxUiKMtvBXGR0qDggdcXwr7CXT5vwLTxkc9J6xiCxEQgPMd/7IJp14mlJGvfJet2/NGcUWwhY7FEkzSF6mM/vmFWXAefIa5WRFnHs7aWrkCsO+Hzw2KFFpDrWli+H8J3of49wHLdoMKMclhiLsJZ1QzteQ23u2KW3uys9UQBoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=KWrCeNVY; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CC16297BD3;
	Sat, 22 Mar 2025 00:21:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742599268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=T7qf5nCrt4nQBcV2jofoiUmHFXdin3E7pHJVSgDL2NA=;
	b=KWrCeNVYFLT1VAUwHgj5Tm7pEKIUbYrrIuNl46wUDy1IxYQfL7cDJBSyTMBlw0mFijms+e
	d0jq4ilMNYEMYjhnQJLDtl/plb07xLmVT4qFOctMMa6PcNKUy7VTNAQHHJZtd5U5VtZpLQ
	wZy7DWlMNRA+JG11knIrBjXysU+q8vuJymox+swaYYRCJtDaUGTf4U0gb5axowEs9aaYHs
	AjioF4khd8tQKS/IRXr/1VpRtHBgCiFN41bQCcZlxpUTH7EP7GKhCGv6rqUYY3d8d6BBFh
	la7dJzfzc5D94h/AeebMmveABSE6vdlU07TnVOc2hXljLa1dSTJ6LE4XiUcaRA==
Message-ID: <8f095a56-a188-45e9-945a-1d77ef175dc8@cjdns.fr>
Date: Sat, 22 Mar 2025 00:21:05 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v1 4/8] dt-bindings: timer: Add EcoNet HPT CPU Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-5-cjd@cjdns.fr>
 <c1791b2e-bdf6-448c-88d3-c97511af3357@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <c1791b2e-bdf6-448c-88d3-c97511af3357@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Thank you for the review.

On 21/03/2025 21:56, Krzysztof Kozlowski wrote:
> On 21/03/2025 14:46, Caleb James DeLisle wrote:
>> Add device tree binding documentation for the high-precision timer (HPT)
>> in the EcoNet EN751221 SoC.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Previous patch was not tested, so was this one tested?

Yes, all of this has been tested on multiple devices, I believe I was
unclear in the question I added in patch 3.

>
>> ---
>>   .../bindings/timer/econet,timer-hpt.yaml      | 58 +++++++++++++++++++
>>   1 file changed, 58 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
>> new file mode 100644
>> index 000000000000..8b7ff9bce947
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/econet,timer-hpt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: EcoNet High Precision Timer (HPT)
>> +
>> +maintainers:
>> +  - Calev James DeLisle <cjd@cjdns.fr>
>> +
>> +description: |
> Do not need '|' unless you need to preserve formatting.
Ok
>
>> +  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
>> +  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
>> +  count/compare registers and a per-CPU control register, with a single interrupt
>> +  line using a percpu-devid interrupt mechanism.
>> +
>> +properties:
>> +  compatible:
>> +    const: econet,timer-hpt
> Soc components must have soc-based compatible and then filename matching
> whatever you use as fallback.

I have so far been unable to find good documentation on writing DT bindings
specifically for SoC devices. If you have anything to point me to, I will read it.
If not, even a good example of someone else doing it right is helpful.

Currently, I see qcom,pdc.yaml appears to do what you say, so I in absence
of any other advice, I can try to do what they do.

>
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
> No, list items instead.
I see qcom,pdc.yaml using items: with per-item description so can follow that.
>
>> +    description: |
>> +      Physical base address and size of the timer's register space. On 34Kc
>> +      processors, a single region is used. On 1004Kc processors, two regions are
>> +      used, one for each core.
> So different hardware, different compatible. That's why you need
> soc-based compatibles. Follow standard SoC upstreaming rules and examples.
I presume this should ideally be with If: statements to further validate the DT (?)
>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: |
> Do not need '|' unless you need to preserve formatting.
Ok
>
>> +      The interrupt number for the timer.
> Drop, redundant.
Ok
>
>
>> This is a percpu-devid interrupt shared
>> +      across CPUs.
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: |
>> +      A clock to get the frequency of the timer.
> Drop description, redundant
Ok
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    timer_hpt@1fbf0400 {
> No underscores
I knew that, my mistake.
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
Thank you, this is useful.
>
> Look how other SoCs are calling this.
As said, any documentation link or example of someone who does this right
is much appreciated. In any case, thank you very much for your time and I
will address these points in v2.

Thanks,
Caleb

>
>> +        compatible = "econet,timer-hpt";
>> +        reg = <0x1fbf0400 0x100>;
>> +        interrupt-parent = <&intc>;
>> +        interrupts = <30>;
>> +        clocks = <&hpt_clock>;
>> +    };
>> +...
>
> Best regards,
> Krzysztof

