Return-Path: <linux-mips+bounces-5640-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A169853B8
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 09:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56A4FB23B08
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 07:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AF3158538;
	Wed, 25 Sep 2024 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pR/c9L9H"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72693157466;
	Wed, 25 Sep 2024 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248832; cv=none; b=PKb8lMaj6K4awco3x9nTfdaV1aFL1mG6rp4Rf65gDhLuzdC5wojtMwqcy2Pwhjt2I26Ty+hWGtTTMb4KjcXrujpR6G3xwsvFb815u/6E9Gf/QQHCE1ydBcxJyZ+byUjmDPhviZeKpm0vNfEUn4yQpnh/v7W+BRnoZ4T8tiWFAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248832; c=relaxed/simple;
	bh=ihfm19gdQct+dOCnbbGQGXW0Vuu7HUy2XR6uso/97fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlN0rbrlVXEZxMhdX3AGPMIipqN8/ZjOTfYunGr14Vt/ozezR5+KrobITyWavIxocqc91pDQXf4pdZ/qCWQc/VfxVBrDRj48OsY8gtFY8tEBRs+3C7oz0EIgFB0H4+MtTeqGrIUmh/vQGPmtzNRY5owWoQWVzZgnFBshz3ZrjlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pR/c9L9H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952B0C4CEC3;
	Wed, 25 Sep 2024 07:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727248830;
	bh=ihfm19gdQct+dOCnbbGQGXW0Vuu7HUy2XR6uso/97fU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pR/c9L9HBYWXkAeYFUhFCGfXDkutUwFicV3AGy5DB9bHAO17CJUUVozFiOXYvN2fQ
	 ESTqxxUcyoyQ7T9/U1huwzjuR2WpKm0J5DCAvXb+rXEJHZHGekVbILgjA24MgbLa1T
	 4x4NSaFBo1AE8vTQpL12dhrzNLZKclU1gr4IdRqrWQ6vPWMUO5xbwGCzU4fsyJy3Lk
	 QjR89sXK5gawsYORKuV3HYp+WziXTrPzyHA0ICN7H8wRH+3aNd6Z0Hped6lD++bE/D
	 VIijVabKZ7scozMlzvGl+YMS+PCkkbDsJfGbS1AsKTr4+cVmoODcEX8I0vRPw+GpiQ
	 MWe7g8FxZ8HVw==
Message-ID: <29f8c438-6e4a-4c1f-b68b-5f7d1bd0235e@kernel.org>
Date: Wed, 25 Sep 2024 09:20:25 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] dt-bindings: mfd: Add more RTL9300 variants
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "lee@kernel.org" <lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
 <20240923225719.2999821-4-chris.packham@alliedtelesis.co.nz>
 <zir7rpbrq3c6kyn2guanmfnkbw6e36qb5r4onzwv7qgytt64if@jurnymcbgx2k>
 <0886f3fb-4e05-4787-aecc-5a5b8a3b8d73@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0886f3fb-4e05-4787-aecc-5a5b8a3b8d73@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2024 22:59, Chris Packham wrote:
> 
> On 24/09/24 20:40, Krzysztof Kozlowski wrote:
>> On Tue, Sep 24, 2024 at 10:57:19AM +1200, Chris Packham wrote:
>>> Add the RTL9301, RTL9300B and RTL9303. These have the same SoC as the
>>> RTL9302C but differ in the Ethernet switch/SERDES arrangement.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> Notes:
>>>      Changes in v4:
>>>      - New
>>>
>>>   .../devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml       | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
>>> index 2d20dd07a7e9..a3ba6d9bacaa 100644
>>> --- a/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
>>> @@ -18,7 +18,10 @@ properties:
>>>     compatible:
>>>       items:
>>>         - enum:
>>> +          - realtek,rtl9301-switch
>>> +          - realtek,rtl9302b-switch
>>>             - realtek,rtl9302c-switch
>>> +          - realtek,rtl9303-switch
>> This should be squashed. One logical change is to add a new binding for
>> entire family, not device-by-device.
> Yes I did consider that. The main thing that gave me pause for thought 
> was the file naming thing. If I squash this should I switch back to the 
> realtek,rtl9300-switch filename? I'll probably add the 
> realtek,rtl9300-switch fallback as well (and add the chip specific 
> compatibles for the i2c).

Splitting this per patch did not solve it - following your logic, file
should be renamed.

Choose name matching one compatible, e.g. the fallback. Aren't all these
devices compatible?

Best regards,
Krzysztof


