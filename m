Return-Path: <linux-mips+bounces-8367-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1211A7127F
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 09:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144A41896594
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 08:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D729D1A23A9;
	Wed, 26 Mar 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="GKbVgywd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF721A238A;
	Wed, 26 Mar 2025 08:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742977159; cv=none; b=s1IgfyfzbukBQtBLDmYr58M3mZyXoExtKc8NBunBxDEaZ6GALuki4ATVzUQEmXpA/bbd/mgAC/S2/Lg1b9RQIafPPl9a5vIt0ZyFoBeXv+Hk0VyJo7G5QPX9M7DSCkT+4qAo5mOYHYXEiVOZVFdv6ysxa1cs/it7MZb+ZVoZGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742977159; c=relaxed/simple;
	bh=9boWrYTnkDHxjxIvatXQeQ7APvW2q/H1C05tml8kUfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cu0dHNSWxRltaECdnoSSB9c9o/m4g0ydscRGws+XAfYoAPuxT/+jl9DtfIOPh9+XjRFJeMwPWCmZMnUlBpf5+0cJW6dsOrWALI5Zk4KjsDNLcis2NGIS6J9gTF/hdJcuWgoT/nqpqXO3/vj92h7hxio/4n1xCbQJ00peNu+ynR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=GKbVgywd; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0CF52C1B4F;
	Wed, 26 Mar 2025 09:19:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742977154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1AgcysEH2rq3izDsjeZYo+7tUxUVzeU8PqQli3w/9CY=;
	b=GKbVgywdMGAonWZbkqzKiJcDrCw7gROBJ3VDW2dAV5CcGkAnD6v6Hf91U9R2d0qgpxJeqX
	8uHw1ucwIjgrBXiGSaCJ7isonEXmk4wSPXyE/9R0xUKpFChcG28KPuu8HGzeYClKkQreol
	dr+o9Aq3CuP7phH2TRvWB0G94rMt5jzp6uouDSb63ncvUflTgASo3B97sT05YTHvatNgbJ
	iBTsMLEIjdbkLPgy9kgkK50idVCwEzBCVNBTSpMKkU18X4KOeny5eKoBLCTFo2G1LCJiZi
	/0u/xe0DephN3JN/wx3K551Zm1BWSg4C5ZDACBv2E/m7yX/b14x49WSlBdETxw==
Message-ID: <890a302e-9105-446c-a2a9-110e94457dac@cjdns.fr>
Date: Wed, 26 Mar 2025 09:19:10 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 04/10] dt-bindings: timer: Add EcoNet EN751221 "HPT"
 CPU Timer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250325134349.2476458-1-cjd@cjdns.fr>
 <20250325134349.2476458-5-cjd@cjdns.fr>
 <20250326-gigantic-mauve-capuchin-e667ed@krzk-bin>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20250326-gigantic-mauve-capuchin-e667ed@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 26/03/2025 09:04, Krzysztof Kozlowski wrote:
> On Tue, Mar 25, 2025 at 01:43:43PM +0000, Caleb James DeLisle wrote:
>> +title: EcoNet EN751221 High Precision Timer (HPT)
>> +
>> +maintainers:
>> +  - Caleb James DeLisle <cjd@cjdns.fr>
>> +
>> +description:
>> +  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
>> +  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
>> +  count/compare registers and a per-CPU control register, with a single interrupt
>> +  line using a percpu-devid interrupt mechanism.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
> Drop items, that's const directly.
Got it.
>
>> +          - const: econet,en751221-timer
>> +      - items:
>> +          - const: econet,en751627-timer
>> +          - const: econet,en751221-timer
>> +
>> +  reg: true
> Widest constraints are always here.

(AFACT) there's no common constraint to both.

en751221 => minItems: 1, maxItems: 1

en751627 => minItems: 2, maxItems: 2

I spent some time playing with this, thinking I could override constraints
but everything I tried lead me to validation errors. Please let me know if
there's something I'm missing here...

>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: A percpu-devid timer interrupt shared across CPUs.
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +if:
> This goes under allOf:, to save re-indent later, and then after
> required: block (see example-schema).
Got it.
>
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: econet,en751627-timer
>> +then:
>> +  properties:
>> +    reg:
>> +      items:
>> +        - description: Base address for VPE timers 0 and 1
> s/Base address for//
> because it is redundant. Bus/parent addressing already defines this as
> base address, cannot be anything else.

Indeed, got it.


Thank you for the review.

Caleb


>
>> +        - description: Base address for VPE timers 2 and 3
>> +else:
>> +  properties:
>> +    reg:
>> +      items:
>> +        - description: Base address for VPE timers 0 and 1
> Best regards,
> Krzysztof
>

