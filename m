Return-Path: <linux-mips+bounces-4183-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C5F9299C8
	for <lists+linux-mips@lfdr.de>; Sun,  7 Jul 2024 23:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7083BB20DE1
	for <lists+linux-mips@lfdr.de>; Sun,  7 Jul 2024 21:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5A455C29;
	Sun,  7 Jul 2024 21:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Wpl8uqJ5"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F92261D
	for <linux-mips@vger.kernel.org>; Sun,  7 Jul 2024 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720386447; cv=none; b=DyfoTq6n4TVExfSTrXy/ZVFqfdEhPrf1clEjywXXtQRzcSjk4yNuqZ3cYvEcRNg/PkOP8leKTULepPITQGLQTFGDOvfqhQL88/O28xCF+KSkbiXA3CcdaF4RUQYHUX2RHrmOosNDqb2r0qEaHcqqEPyzKtGt9gujwLeCmIUkVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720386447; c=relaxed/simple;
	bh=walQa2R85VMvc4NFSgmQOcWKxvQtPEQVo4IKi5jaybg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRyoqNQy1o16piwIfnnt2z28ignwt4V0tSu5srbcbkE9nZUezRnXW9B8J7d9LST6D5C0/o7n7OOzugOzpUbR+V1tTdxQesNrqxX76/DAhRR7DHyDmLfhw2x3zCk3TLTsqtRAD0aaQ2e+kDo7WrHI6bKAKrhRV1yjYqQsOnGYdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Wpl8uqJ5; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 94A862C0433;
	Mon,  8 Jul 2024 09:07:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720386442;
	bh=54SDzGFQuYb/0Zm0Z7SWruoRaqUAw+7EMRRGzcTqq3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wpl8uqJ5sR6Yn9U6BlaXHitYau3iSs3LBW7UoX8aWnIMjZlQJGsnhm1di1z/MIRtL
	 0zIa116h2I8Lu7UEjzLgMRaD60wj3UN58uDgLrZkY7tjCO16bZFowdDtO+4FrrOWmi
	 JWEb4sDEr2TyDrLY6wgiOnZ8WEEQhTfaTZWRNXGUEsSb49ZOkcYoRbcKQVGLCMrsbm
	 gvokqfFqc8f9T6sQO5HM5HyHvpIOiviQmg/LNRzi7fHZIwdPyT9ER6XDxbpUBzEoMV
	 RQc0A+1He6E3SCPl5UzY7VDBbraUudccEAw1ol1Sng1acjuI3j/kBhoytC1b075jZE
	 QHSCVYT0ftn0A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668b038a0000>; Mon, 08 Jul 2024 09:07:22 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7C86113EE2B;
	Mon,  8 Jul 2024 09:07:22 +1200 (NZST)
Message-ID: <0def3e72-4caa-41cb-81d2-fb1fb36ceb70@alliedtelesis.co.nz>
Date: Mon, 8 Jul 2024 09:07:22 +1200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 6/9] dt-bindings: interrupt-controller:
 realtek,rtl-intc: Add rtl9300-intc
To: Krzysztof Kozlowski <krzk@kernel.org>, tglx@linutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, daniel.lezcano@linaro.org, paulburton@kernel.org,
 peterz@infradead.org, mail@birger-koblitz.de, bert@biot.com,
 john@phrozen.org, sander@svanheule.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
 <20240705021520.2737568-7-chris.packham@alliedtelesis.co.nz>
 <10a1cf5c-8e35-487c-b236-48cedbfefa8f@kernel.org>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <10a1cf5c-8e35-487c-b236-48cedbfefa8f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668b038a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=A3nYB5zHmJDec0h_2B0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 5/07/24 18:41, Krzysztof Kozlowski wrote:
> On 05/07/2024 04:15, Chris Packham wrote:
>> Add a compatible string for the interrupt controller found on the
>> rtl930x SoCs. The interrupt controller has registers for VPE1 so these
>> are added as a second reg cell.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>
>> Notes:
>>      Changes in v3:
>>      - Add reg::minItems where required
>>      Changes in v3:
>>      - Use items to describe the regs property
>>      Changes in v2:
>>      - Set reg:maxItems to 2 to allow for VPE1 registers on the rtl9300. Add
>>        a condition to enforce the old limit on other SoCs.
>>      - Connor and Krzysztof offered acks on v1 but I think the changes here
>>        are big enough to void those.
>>
>>   .../realtek,rtl-intc.yaml                     | 20 ++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
>> index fb5593724059..f36aaab73c01 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
>> @@ -25,6 +25,7 @@ properties:
>>         - items:
>>             - enum:
>>                 - realtek,rtl8380-intc
>> +              - realtek,rtl9300-intc
>>             - const: realtek,rtl-intc
>>         - const: realtek,rtl-intc
>>           deprecated: true
>> @@ -35,7 +36,10 @@ properties:
>>       const: 1
>>   
>>     reg:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: vpe0 registers
>> +      - description: vpe1 registers
>>   
>>     interrupts:
>>       minItems: 1
>> @@ -71,6 +75,20 @@ allOf:
>>       else:
>>         required:
>>           - interrupts
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: realtek,rtl9300-intc
>> +    then:
>> +      properties:
>> +        reg:
>> +          minItems: 1
> Hm? Why?
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
>
> Thank you.
> </form letter>

I think I probably just fluffed a copy and paste when adding minItems: 1 
to the base, sorry about that.

I've set minItems: 2 for that condition locally so it's ready for v5.

>> +          maxItems: 2
> Best regards,
> Krzysztof
>

