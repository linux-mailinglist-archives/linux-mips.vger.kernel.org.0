Return-Path: <linux-mips+bounces-3976-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9E919FBF
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 08:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 825711C20805
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 06:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BAB4778B;
	Thu, 27 Jun 2024 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLWGVk+x"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7154653C;
	Thu, 27 Jun 2024 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471563; cv=none; b=uaM3+Tslu1NNPVAdlWQt3U+gVXkHM103qbz9b1Nv28chjlTFFuPidOmsls/1Q9rK4Gr9VyGQlP9+xg0CKy1V3j3jLCzXy4CM7rkdI9RGZehN7Es5eOIhR4LX7jQlau9VGwQSA0AaKqdeukRjMqbe6tQOEO6HNmQaH9GX33kMN2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471563; c=relaxed/simple;
	bh=PntdgHJA1BlWZil7N33io6kd7kWBqhKgzu1SbzOVzLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StJNoBty07Stc4DIqKB54kuJY/4nxVIQiw9QSp9RPr47xrh/FiIwdo3gIYKZqmFWG5EQ6HN/cZUwmZ+gSdKywxndGS2o0oVncVsyna4MLLVNTKDS5SMYcy7gnKLA8mWsBS94jVb7VrYzLvr/HxxuLWh4A8jkWvh/gyojUCeKzMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLWGVk+x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFAEC2BBFC;
	Thu, 27 Jun 2024 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719471563;
	bh=PntdgHJA1BlWZil7N33io6kd7kWBqhKgzu1SbzOVzLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tLWGVk+xNhapz0R51yQInJ9IjJ9WgDKDOlaQt/7PdlkGS+juwXJWEUOF/7thm99Wk
	 bzT9qN8c39Cjyv8K1MX/Z5mmFZCalIYrgU/9/f5QDIH9GV3IX4B1rzBKbOS8ddyOFf
	 ZCh54wuFCPyyYiW9AOQRYaVMRrtEoTTqfISw0Gg//Ot2COlVU0G7koP7/HgJh261Xx
	 sTnLv3EGQHNsnyftIOPTWTkxLLjIJqt+G1F69FTf7L3kyqlHzGXfUCazWE3iZWmaFB
	 fh94/VcrTbvX00w2bi1Mo8SyscHafMi2FhelfOK2kik3ER/oXQAEwsfBbUcJHd4QRv
	 xW4DLWSyz4HaA==
Message-ID: <905b483a-b011-44f9-bec9-c6b1c07f4fec@kernel.org>
Date: Thu, 27 Jun 2024 08:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: mips: realtek: Add rtl930x-soc
 compatible
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
 <20240624012300.1713290-4-chris.packham@alliedtelesis.co.nz>
 <e71780a1-8d53-44ae-ac0f-d406de7e26e8@kernel.org>
 <2b33e7d2-24e5-48c3-a2e3-f128f5d7e39b@alliedtelesis.co.nz>
 <365fcddb-095d-4907-97bf-0810818c8265@kernel.org>
 <5267bf22-0b95-48ab-b207-ead4a697c263@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5267bf22-0b95-48ab-b207-ead4a697c263@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 23:01, Chris Packham wrote:
>>>>> +              - realtek,rtl9302c
>>>> Why board has the name of SoC?
>>> What I have is actually a reference board with the name
>>> RTL9302C_2xRTL8224_2XGE. If found that a bit incomprehensible so I
>>> (over) shortened it. Technically it would be something like
>>> cameo,rtl9302c-2x-rtl8224-2xge which I can include in the next round.
>> Looks fine to me.
>>
>>>>> +          - const: realtek,rtl9302-soc
>>>> Drop the -soc suffix. The rtl9302 is the soc.
>>> On that. I hope to eventually add "realtek,rtl9302-switch" for the DSA
>>> switch block in the same chip. So keeping the -soc suffix was
>>> intentional to try to disambiguate things. I can drop the -soc if the
>>> consensus is that there is no need to disambiguate the two.
>> Thanks for explanation, kind of depends on what exactly is this. Most of
>> SoCs comprise of several items. The entire chip is the soc, e.g.
>> "qcom,foo1234". It might have MAC/Ethernet/whatever inside, controllable
>> by the SoC (Linux, bootloader, TF, hypervisor, other VM guest) and that
>> part is "qcom,foo1234-ethernet". Regardless whether Linux OS actually
>> controls it or not.
>>
>> The question is whether DSA switch is part of the SoC or not.
> 
> The RTL9302C is a single package but I'd assume internally it has 
> multiple dies.
> 
>  From the block diagram in the datasheet they do have a portion they 
> call the "SoC" which has the CPU and peripherals like UARTs, GPIOs, SPI 
> etc. That is separate from the switch block which has a bunch of MACs, 
> SERDES and various network switch tables. So based on that 
> "realtek,rtl9302-soc" and "realtek,rtl9302-switch" as two separate 
> things make sense to me.
> 

OK, -soc and -switch are fine with me.

> I'm still trying to figure out a bit more of the details. The block 
> diagram looks a lot like you'd expect to see with a traditional DSA 
> switch where you have a SoC Ethernet NIC/MAC connected to one port of a 
> switch. But getting into the datasheet it looks like what they call the 
> NIC is actually just the DMA portion of the switch as the registers are 
> all in that second block. As is the MDIO interface. I'm considering that 
> maybe the DSA model isn't right for this and I should be looking at 
> switchdev instead.



Best regards,
Krzysztof


