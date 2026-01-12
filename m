Return-Path: <linux-mips+bounces-12849-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F35D10E6A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 08:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 592BA3004F74
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 07:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95DE331A4B;
	Mon, 12 Jan 2026 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYTEdSE5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481C330B0E;
	Mon, 12 Jan 2026 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768203184; cv=none; b=E7aT6cMxjgyISOJ1aZgIbT3vozN2nvBeYs6Y6arS8vqhHUk9u9diYUoC1uwuNzTP/zGCGoAsO4Da4ru3IBF/R8Au72bK/FHE6SK7Vcafhcy3DXpM9JP5iCU85oBz19f5XgKw/S8TKaY2kvPL71BYEw7k7ehEg57rBB75TM/HcYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768203184; c=relaxed/simple;
	bh=KdRXhfGl56K1YQnkAzeYiX2UFWqFdyLMMf/xAfsazgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOfbOiOW4S8JH0Q93ClCgw3ujtpUjptiG9G1BWJSKo4UtnzcB/IWFv3jwk9DDtfv/9gMY3ZgQ3ARtgtMqi6MAuuwBazKxjSSFn0gRK+mVMY2q8rgmwO0mHY+vqGV/uZqUwbjKZ5hnJgZKtZpTHhOKh6lHlklDpn3OdCB80X5WME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYTEdSE5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488DBC116D0;
	Mon, 12 Jan 2026 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768203184;
	bh=KdRXhfGl56K1YQnkAzeYiX2UFWqFdyLMMf/xAfsazgs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TYTEdSE5ONs10N1xaPrLoOvFhlajmZC79SjRE83TF7XfFJULFahdt0TuhRjcfaXO+
	 HpZHPUNqMueI5PPPYmTBezPxDhEKBC+5QpOqWz1GndAFtPwUG61jMWHR568SNtPn3I
	 TPuMcCVFlklcHwxykFQsAYaBil2g5ivBrZcQGD34OPCS/m8NrBFnXDm3SpSjKZAcWW
	 dCZxagfOgWdeOoP0mUfbuiyBROVs2ixnjVYecK/7lSZWNBnI/nGrv1M7KDnczx0dF1
	 20IpcW4Nf/lDZvoVkRh57gHFU3C+i7j4Ti6lpL/57yB1ml9uz6/lyf497/pkYvuTjW
	 xCfBPr4Tg3N4w==
Message-ID: <e5d1d9ce-0268-4b1b-9ce9-2b871926acbf@kernel.org>
Date: Mon, 12 Jan 2026 08:32:58 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: crypto: eip93: add clock gate and
 reset line
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: benjamin.larsson@genexis.eu, chester.a.unal@arinc9.com,
 davem@davemloft.net, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, conor+dt@kernel.org, herbert@gondor.apana.org.au,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, robh@kernel.org,
 sergio.paracuellos@gmail.com, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
References: <20260102155341.3682013-1-olek2@wp.pl>
 <20260103-sweet-micro-manul-12eaee@quoll>
 <d7ab5be3-8502-407c-baf6-714ac3a89cb7@wp.pl>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <d7ab5be3-8502-407c-baf6-714ac3a89cb7@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2026 14:36, Aleksander Jan Bajkowski wrote:
> Hi Krzysztof,
> 
> On 1/3/26 15:11, Krzysztof Kozlowski wrote:
>> On Fri, Jan 02, 2026 at 04:47:33PM +0100, Aleksander Jan Bajkowski wrote:
>>> Add the clock gate and reset line, both of which are available
>>> on the Airoha AN7581.
>>>
>>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>>> ---
>>> v3:
>>> - introduce patch
>>> ---
>>>   .../crypto/inside-secure,safexcel-eip93.yaml       | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>>> index 997bf9717f9e..c6c99c08dc68 100644
>>> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>>> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>>> @@ -48,20 +48,34 @@ properties:
>>>     interrupts:
>>>       maxItems: 1
>>>   
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>>   required:
>>>     - compatible
>>>     - reg
>>>     - interrupts
>>> +  - clocks
>>> +  - resets
>> That's ABI break without explanation in the commit msg.
>>
> I think that the reset line and clock gate are available on all SoCs
> with this IP Core. Should the reset line and clock gate only be

Not related. I did not say that hardware has or has not. I speak about
ABI, so the interface.

> required for newly added SoCs, and remain optional for existing ones?

Best regards,
Krzysztof

