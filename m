Return-Path: <linux-mips+bounces-3948-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D6691795F
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 09:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E146728404F
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 07:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7B5158A02;
	Wed, 26 Jun 2024 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+NN+MUi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B7155316;
	Wed, 26 Jun 2024 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719385930; cv=none; b=ODgmO8UlsY4iZbT39PuiE9YNzVCEXoUgytesljNrwEGGFYpp3YwEfGICe1BbOt8nii7BAN/FXL8fYmuTBFXYKdk7aOFj8lhM1HrkQoQIRUPzPw0lknbCtwhG0w0D4oFFSsCw/Gq1G3Bzgvtpi7C7GBgg6jUrgT1m0XLwJokLZHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719385930; c=relaxed/simple;
	bh=6XsOg7UqkhRAwrD+4PQezyUZ3ZQ094gHiGcfRbRA4YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFah348jdAQtiEw5ZPVkyw2leq2HUJXlxVVcSv4n3Pe2y2YxbCmY67p+W997EapLGni59aiAhdInGnRBQ8YPd3BMBKZlDjlsA1PmeOZx10O4lcL6n/2YVtyaR3jrO/TjjgLMlLClzdAlApjf6hpRZWJ0W4WB6kKh/5gq/paefQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+NN+MUi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60524C2BD10;
	Wed, 26 Jun 2024 07:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719385930;
	bh=6XsOg7UqkhRAwrD+4PQezyUZ3ZQ094gHiGcfRbRA4YY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u+NN+MUizcD6EkdtEmqivwIhvCocNpwVCnkLtJho0CPujAKYISR+Tk2AK3HAAnuHj
	 HJWAjRByRFJ40WttQb9sg/rX4wuT5zUYP8Q0wVJSd/6xSuhqF9wP8Oo+oZS2CCrYQF
	 ZJrqKiqkwNeJ3O4JJmISv+u2DAKgPsjGy8IuLjNl/UqzVUlk4A12Jjxe1xKPAuLp5e
	 vlpSUcLlsu6gD72yjdAq2cDIxLzTbXpv5pWbMNsitLApo8R0tgZeshzVPxEt3eS/W4
	 llAAkI3tq6ER9oFchO03uEhFQYawPSgM7Cc3mXZUfApjKZ1Ze/t1OTpamYNL8zct/E
	 HeaBvAk3fr+/A==
Message-ID: <365fcddb-095d-4907-97bf-0810818c8265@kernel.org>
Date: Wed, 26 Jun 2024 09:12:01 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2b33e7d2-24e5-48c3-a2e3-f128f5d7e39b@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2024 07:00, Chris Packham wrote:
> Hi Krzysztof,
> 
> On 24/06/24 16:48, Krzysztof Kozlowski wrote:
>> On 24/06/2024 03:22, Chris Packham wrote:
>>> Add the rtl930x-soc and RTL9302C board to the list of Realtek compatible
>> 930x or 9302?
> 
> Oops. Will fix.
> 
>>> strings.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> Notes:
>>>      Changes in v2:
>>>      - Use specific compatible for rtl9302-soc
>>>      - Fix to allow correct board, soc compatible
>>>
>>>   Documentation/devicetree/bindings/mips/realtek-rtl.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
>>> index f8ac309d2994..05daa53417e5 100644
>>> --- a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
>>> +++ b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
>>> @@ -20,5 +20,9 @@ properties:
>>>             - enum:
>>>                 - cisco,sg220-26
>>>             - const: realtek,rtl8382-soc
>>> +      - items:
>>> +          - enum:
>>> +              - realtek,rtl9302c
>> Why board has the name of SoC?
> 
> What I have is actually a reference board with the name 
> RTL9302C_2xRTL8224_2XGE. If found that a bit incomprehensible so I 
> (over) shortened it. Technically it would be something like 
> cameo,rtl9302c-2x-rtl8224-2xge which I can include in the next round.

Looks fine to me.

> 
>>> +          - const: realtek,rtl9302-soc
>> Drop the -soc suffix. The rtl9302 is the soc.
> 
> On that. I hope to eventually add "realtek,rtl9302-switch" for the DSA 
> switch block in the same chip. So keeping the -soc suffix was 
> intentional to try to disambiguate things. I can drop the -soc if the 
> consensus is that there is no need to disambiguate the two.

Thanks for explanation, kind of depends on what exactly is this. Most of
SoCs comprise of several items. The entire chip is the soc, e.g.
"qcom,foo1234". It might have MAC/Ethernet/whatever inside, controllable
by the SoC (Linux, bootloader, TF, hypervisor, other VM guest) and that
part is "qcom,foo1234-ethernet". Regardless whether Linux OS actually
controls it or not.

The question is whether DSA switch is part of the SoC or not.

Best regards,
Krzysztof


