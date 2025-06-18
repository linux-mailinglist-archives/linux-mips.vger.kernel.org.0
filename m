Return-Path: <linux-mips+bounces-9377-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46169ADE388
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 08:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DB4218978CA
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 06:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E981E25F8;
	Wed, 18 Jun 2025 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuCAYfUr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684E51B0437;
	Wed, 18 Jun 2025 06:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227571; cv=none; b=cO5DTRojowkgbZYKRW3mw0RZsq+Az18nvUSr0XYxonRIGNk5xIjiABmPkDXeuryCyR3yYT9KYoWj8D8029KY0hGchtyNxgM8vfM7Q71zSB4AqFuIWFZsYLLlh0tbd0IwiyMKbChHPUdZ06l6yulCw3w8i4Yn/vbFjiJAI+ClAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227571; c=relaxed/simple;
	bh=032ckw2UZWrg7+vlZx89aJJ8YD2Pi2qcJAidK1LUh6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtQpWBElmzAQVRPSLReFxeZ/MSnC5j3OVqo8uVSDrgwOQ91H8DFs3TX6bBoP9wG8V3ft4q4NJ7Jlj6hHK1FNG5vXTcvpt+zW92E3UnN+X4KNb8xtrBeuptRr0u3GeTrXtjHxFQ8fHRu8nuDf9DzgKRklI1tBbSy0b9jpowTy4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuCAYfUr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51361C4CEE7;
	Wed, 18 Jun 2025 06:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750227571;
	bh=032ckw2UZWrg7+vlZx89aJJ8YD2Pi2qcJAidK1LUh6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fuCAYfUrUyVq6AHx2qwEqQ2fuNR0Eo0WaX55ck53RCRVm0YY4EktLc1o24uMJ/1tJ
	 1H3wgBXF7hQiU6OTyQoTjJnnpx8rQ50FmVxAnCdjx4WYDjwfEdEeHyMTtAwsj+6AIX
	 33k0ag/Fk3757J6jhbuShPngZkA1tpRy2z0zE0AaFNI3tfeGBf6dTecvdbJnndXbEl
	 u3VhFB8RD0TtKu5yj3c/s1MsZJrxF8GGwZdhKDhPnWCYTJQPWlwGucozDWSxCAq6rG
	 NtVvtDpy1g+3EgOa/Pc4oB/zD02amgFbHHcN0+rMTqr+L/Cac9bs6c7BjCotlNnvu+
	 P+2KcJOFBmBog==
Message-ID: <3041baa7-64d2-40ec-b3c6-168d0a57965f@kernel.org>
Date: Wed, 18 Jun 2025 08:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt
 compatible for MT7688 boards
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mips@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Rob Herring <robh@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, Stefan Roese
 <sr@denx.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, Ezra Buehler <ezra.buehler@husqvarnagroup.com>
References: <20250617103058.1125836-1-ezra@easyb.ch>
 <20250617103058.1125836-2-ezra@easyb.ch>
 <74402e94-6d1e-4a4c-9e50-d41fdf1080e0@kernel.org>
 <a999bc7d-a141-4ebe-9adc-0d64d3e67d5a@kernel.org>
 <CAM1KZSnFsc1r+DUCC81aKiP-Pomd7dUYASg5e9VYJLu+v64_QQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAM1KZSnFsc1r+DUCC81aKiP-Pomd7dUYASg5e9VYJLu+v64_QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2025 17:29, Ezra Buehler wrote:
> On Tue, Jun 17, 2025 at 2:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 17/06/2025 13:40, Krzysztof Kozlowski wrote:
>>> On 17/06/2025 12:30, Ezra Buehler wrote:
>>>> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>>>>
>>>> As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
>>>> used for both SoCs. To prevent "Kernel panic - not syncing: unable to
>>>> get CPU clock, err=-2" and allow an MT7688-based board to boot, the
>>>> following must be allowed:
>>>>
>>>>     compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
>>>>
>>>> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>>>> ---
>>>>  .../bindings/clock/mediatek,mtmips-sysc.yaml  | 29 +++++++++++--------
>>>>  1 file changed, 17 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>> index 83c1803ffd16..550807301fc5 100644
>>>> --- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>> @@ -26,18 +26,23 @@ description: |
>>>>
>>>>  properties:
>>>>    compatible:
>>>> -    items:
>>>> -      - enum:
>>>> -          - ralink,mt7620-sysc
>>>> -          - ralink,mt7628-sysc
>>>> -          - ralink,mt7688-sysc
>>>> -          - ralink,rt2880-sysc
>>>> -          - ralink,rt3050-sysc
>>>> -          - ralink,rt3052-sysc
>>>> -          - ralink,rt3352-sysc
>>>> -          - ralink,rt3883-sysc
>>>> -          - ralink,rt5350-sysc
>>>> -      - const: syscon
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - ralink,mt7620-sysc
>>>> +              - ralink,mt7628-sysc
>>>
>>> It's here already, so this must be dropped.
>>
>>
>> I meant mt7628 is here already and you are adding it again further, so
>> it is now in two places.
> 
> My idea was to support these variants, as they are all valid:
> 
> compatible = "ralink,mt7628-sysc", "syscon";
> compatible = "ralink,mt7688-sysc", "syscon";
> compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";

How is it valid? Provide arguments because this defies logic. Device is
and is not compatible with 7688? The same time? How, really how?


Best regards,
Krzysztof

