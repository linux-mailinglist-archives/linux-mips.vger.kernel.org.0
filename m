Return-Path: <linux-mips+bounces-3949-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4DC917969
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 09:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53C022866FC
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 07:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DE8158A02;
	Wed, 26 Jun 2024 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bM4jU0Od"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1835B13541B;
	Wed, 26 Jun 2024 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719386039; cv=none; b=Su2pQaeMXRyhxd6+u332q3agOuJM5i74DptA62ZUQg9U1HM/moTAO4ZTBSL7QzTQL1688C6IY0uNXMpJJEf71laB2Md8jqqp6LKJKMJVyuaQKzaRqK9LqZhf7Nuw+bedUND1Kc0FX9yhdvpfzTi+FBMmUBeq7Iex3sRkplx5bJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719386039; c=relaxed/simple;
	bh=99uL6JL2d+Ir+A1G5QShZvBz4fTOsERCAQ80mQw689w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcjnAPemRDXU4BtyrXAVXnItdB+UcvZlSGkcvOfuna8lTW/UqTYHenPh+7yWU8GY9EtnycRq6JnKQAB4eYifc3J2UuN9lfU4WqLtIzc6hXdMeUJYcPQUnB6HVXkyEr9Cxkqj6QEUOLWewvmeSVM1uHbLIbKYmIihAuF3uuK6iwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bM4jU0Od; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948E6C2BD10;
	Wed, 26 Jun 2024 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719386038;
	bh=99uL6JL2d+Ir+A1G5QShZvBz4fTOsERCAQ80mQw689w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bM4jU0OdvlwV33nbrkoAdhc3d6g9/FDODXYWSP/KnY6l5NtT7u4AZq1GjD72sQeQN
	 xI9lP2PhZsS/3L/vFmPwIW7h5XY3OL98aHWFdPr4Ren97Yjvu3SuyDHdb0vv7Bq0uo
	 E6YMjMWEqTkk2pGPLfBLtdEttdXl5Gn5V3AF35e0ezjUNp2B/2iwuiPJtX+2YfGuxM
	 2ilb93OgjMZokoeNrVlo7nkNMHKBY7yCrG2CRyZhHY1RY40jZ1eRpBgPi9wnmiPjOh
	 mPpLV1tJ9sOOd4TMHauwaA8sTEkrbmhBmlKYts63Eucz+EUxK51qwpvPqGMcBgQtmm
	 N8p807VlCMTgA==
Message-ID: <8676afd3-8a95-4517-ae38-0f8539e81f19@kernel.org>
Date: Wed, 26 Jun 2024 09:13:50 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: timer: Add schema for
 realtek,otto-timer
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mail@birger-koblitz.de" <mail@birger-koblitz.de>,
 "bert@biot.com" <bert@biot.com>, "john@phrozen.org" <john@phrozen.org>,
 "sander@svanheule.net" <sander@svanheule.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "kabel@kernel.org" <kabel@kernel.org>,
 "ericwouds@gmail.com" <ericwouds@gmail.com>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
 <20240624012300.1713290-5-chris.packham@alliedtelesis.co.nz>
 <d65648d6-4e2b-4009-b0e0-7d1f9a926eb7@kernel.org>
 <052a4bdb-88fe-4891-a69c-0d90c610d816@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <052a4bdb-88fe-4891-a69c-0d90c610d816@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/06/2024 07:21, Chris Packham wrote:
> 
> On 24/06/24 16:49, Krzysztof Kozlowski wrote:
>> On 24/06/2024 03:22, Chris Packham wrote:
>>> Add the devicetree schema for the realtek,otto-timer present on a number
>>> of Realtek SoCs.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> Notes:
>>>      Changes in v2:
>>>      - Use specific compatible
>> Where? I do not see changes.
> 
> In v1 it was rtl930x-timer, I've updated it to rtl9302-timer

Ah, I thought you wanted to switch from generic fallback to specific
compatible... fine.

> 
>>>      - Remove unnecessary label
>>>      - Remove unused irq flags (interrupt controller is one-cell)
>>>      - Set minItems for reg and interrupts based on compatible
>>>
>>>   .../bindings/timer/realtek,otto-timer.yaml    | 66 +++++++++++++++++++
>>>   1 file changed, 66 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
>>> new file mode 100644
>>> index 000000000000..13ea7aa946fe
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
>>> @@ -0,0 +1,66 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/timer/realtek,otto-timer.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Realtek Otto SoCs Timer/Counter
>>> +
>>> +description:
>>> +  Realtek SoCs support a number of timers/counters. These are used
>>> +  as a per CPU clock event generator and an overall CPU clocksource.
>>> +
>>> +maintainers:
>>> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^timer@[0-9a-f]+$"
>>> +
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - realtek,rtl9302-timer
>>> +      - const: realtek,otto-timer
>>> +
>>> +  reg:
>>> +    maxItems: 5
>> Nothing improved.
>>
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 5
>> Nothing improved.
>>
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: realtek,rtl9302-timer
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          minItems: 2
>>> +        interrupts:
>>> +          minItems: 2
>> No, that's just incorrect. You do not have more than one variant, so it
>> is just 2 items. Or 5 items, not 2-5.
> 
> I've been told in the past that the device-tree should describe the 
> hardware. Which in this case has 5 timers. But I'm also told to give 
> them names which I struggle to do because some of them aren't used.

Used as in Linux driver? Does not matter.

> 
> So do you want something like this:
> 
> clocks:
>      items:
>          - description: CPU0 event clock
>          - description: system clock source
>          - description: unused
>          - description: unused
>          - description: unused

No, if your datasheet or any other source of information (e.g.
downstream sources) mention 5 items, then name properly 5 items.
Otherwise how do you know that there are 5, not 2, clocks/interrupts/reg?

Best regards,
Krzysztof


