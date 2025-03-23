Return-Path: <linux-mips+bounces-8320-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD65A6D27D
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 00:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C449F1893DCF
	for <lists+linux-mips@lfdr.de>; Sun, 23 Mar 2025 23:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9571C8605;
	Sun, 23 Mar 2025 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="vXNUa/E1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270E15539A;
	Sun, 23 Mar 2025 23:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742774006; cv=none; b=J5ocTIg9280c0AfQK+mfWmlOSgBtdgjUrUC8OhvoF5han8TWbityHmlUMmpS/mpSHMpXOOcCX2Tgc7fVYzXbxqoOVbEfIEGEBW2AG5ysCy1FMKsVr/16bZzRmHglaOMmwW34+79OoG75TQET3nrvT2t+/j584iJt3E6+N3vM9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742774006; c=relaxed/simple;
	bh=M6OGTvLw7CtrXFJe/5E6TOOm2mnJXkCUt54dENXIYBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1A56NWGPLS1esmKLYskn5zdsJ1tySxeOcKDpQkafgdkbbXc/zn8VVn4vddCnM9sKS9GHRAdp+TvNJCFiNXI9+c5OHJ3rodPPi1fBbvZzhzUYYVJO3Zbkkp0ZZTXlxDwAI1bsIZbdNcjyex0d0XcodcdD6lhN4Z+WP211PFp5Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=vXNUa/E1; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AE4E2B096F;
	Mon, 24 Mar 2025 00:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742774001; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=M45i0cNSjLCYGojqbS0h+f9E80WUbVF8rMlj+9W/SQY=;
	b=vXNUa/E1enNAw74HG10KVbTB688tQfMjeU81OfZWzxid00a7D/DEA+CcLi3DmnorwLbCWv
	qm5IZxZWFw0iN0pHQdSUlUHKjuCpgOhsGoE50iKtSI21o54vnI3zLeFhbcPGC6wV6FhBRQ
	2KFvfCFMV6ys9MM5QjkS4W5LgSWxXZMDzqN4/Nb8vVg0wC0lBE9EXKMgoRCAmvr/OeCB2z
	KKCtg1H/StfuIFIi9tc9bIcPCX4G6I8KRMCC2xQMCtjIl34OBGBO0/qBXUgFE8IISEoeKk
	8BuQ/BRMo12d/7/nx9Pg7TEkRsf9G/HjzAc22Q2AjN/ioWM4gAIuCOPwlu2S1g==
Message-ID: <d419bcd2-fa78-4390-88b0-64ed54b87081@cjdns.fr>
Date: Mon, 24 Mar 2025 00:53:17 +0100
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
 <8f095a56-a188-45e9-945a-1d77ef175dc8@cjdns.fr>
 <f2738225-564e-479b-a4f0-fac0ba6b6d53@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <f2738225-564e-479b-a4f0-fac0ba6b6d53@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 23/03/2025 13:39, Krzysztof Kozlowski wrote:
> On 22/03/2025 00:21, Caleb James DeLisle wrote:
>> Thank you for the review.
>>
>> On 21/03/2025 21:56, Krzysztof Kozlowski wrote:
>>> On 21/03/2025 14:46, Caleb James DeLisle wrote:
>>>> Add device tree binding documentation for the high-precision timer (HPT)
>>>> in the EcoNet EN751221 SoC.
>>>>
>>>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>>> Previous patch was not tested, so was this one tested?
>> Yes, all of this has been tested on multiple devices, I believe I was
>> unclear in the question I added in patch 3.
> Hm? How can you test a binding on a device? I meant here bindings - they
> were not tested.


I see. For bindings I ran `make dt_binding_check` and assumed it good because
it ran to completion. I now know that isn't reliable, but re-checked that it didn't
log any errors (warnings?) about econet,timer-hpt.yaml


>
>>>> ---
>>>>    .../bindings/timer/econet,timer-hpt.yaml      | 58 +++++++++++++++++++
>>>>    1 file changed, 58 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
>>>> new file mode 100644
>>>> index 000000000000..8b7ff9bce947
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
>>>> @@ -0,0 +1,58 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/timer/econet,timer-hpt.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: EcoNet High Precision Timer (HPT)
>>>> +
>>>> +maintainers:
>>>> +  - Calev James DeLisle <cjd@cjdns.fr>
>>>> +
>>>> +description: |
>>> Do not need '|' unless you need to preserve formatting.
>> Ok
>>>> +  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
>>>> +  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
>>>> +  count/compare registers and a per-CPU control register, with a single interrupt
>>>> +  line using a percpu-devid interrupt mechanism.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: econet,timer-hpt
>>> Soc components must have soc-based compatible and then filename matching
>>> whatever you use as fallback.
>> I have so far been unable to find good documentation on writing DT bindings
>> specifically for SoC devices. If you have anything to point me to, I will read it.
>> If not, even a good example of someone else doing it right is helpful.
>>
>> Currently, I see qcom,pdc.yaml appears to do what you say, so I in absence
>> of any other advice, I can try to do what they do.
> Just don't use generic fallback.


Ok I watched your "Accepted in Less Than 10 Iterations" lecture (I'm doing my
homework). If I understand this correctly, you prefer that I use something specific
like econet,en751221-timer as the fallback case, so for example on EN751627,
it would be:

compatible = "econet,en751627-timer", "econet,en751221-timer";

The reason why I didn't do this is because this timer seems to show up in a lot of
places. Vendor code says that it's older than EN751221, and (if my reading is
correct) it has found it's way into chips branded TrendChip, MediaTek and Ralink
as well as EcoNet.

Now that I'll be adding strict checks on the number of register blocks, this way
also has the advantage of allowing a case for users of the timer in SoCs we don't
know about:

// Only valid with 2 register blocks
compatible = "econet,en751627-timer", "econet,timer-hpt";

// Only valid with 1 register block
compatible = "econet,en751612-timer", "econet,timer-hpt";

// No restriction because we don't know how many timers the SoC has
compatible = "econet,timer-hpt";


That said, I'm fine to do it however you want as long as I'm clear on what you're
asking for and you have all of the context behind my original decision.


Thanks,

Caleb


>
>>>> +
>>>> +  reg:
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>> No, list items instead.
>> I see qcom,pdc.yaml using items: with per-item description so can follow that.
>>>> +    description: |
>>>> +      Physical base address and size of the timer's register space. On 34Kc
>>>> +      processors, a single region is used. On 1004Kc processors, two regions are
>>>> +      used, one for each core.
>>> So different hardware, different compatible. That's why you need
>>> soc-based compatibles. Follow standard SoC upstreaming rules and examples.
>> I presume this should ideally be with If: statements to further validate the DT (?)
> Yes
>
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +    description: |
>>> Do not need '|' unless you need to preserve formatting.
>> Ok
>>>> +      The interrupt number for the timer.
>>> Drop, redundant.
>> Ok
>>>
>>>> This is a percpu-devid interrupt shared
>>>> +      across CPUs.
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description: |
>>>> +      A clock to get the frequency of the timer.
>>> Drop description, redundant
>> Ok
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - clocks
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    timer_hpt@1fbf0400 {
>>> No underscores
>> I knew that, my mistake.
>>> Node names should be generic. See also an explanation and list of
>>> examples (not exhaustive) in DT specification:
>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>> Thank you, this is useful.
>>> Look how other SoCs are calling this.
>> As said, any documentation link or example of someone who does this right
>> is much appreciated. In any case, thank you very much for your time and I
>> will address these points in v2.
> I gave one link above. Other could be one of my talks... or maybe what
> elinux.org has, but I did not verify it.
>
> Best regards,
> Krzysztof

