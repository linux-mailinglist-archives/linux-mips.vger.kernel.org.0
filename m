Return-Path: <linux-mips+bounces-9468-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EB1AE60D5
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 928095A0F6E
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 09:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C3C27AC32;
	Tue, 24 Jun 2025 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koBYPI89"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2E271440;
	Tue, 24 Jun 2025 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757103; cv=none; b=D/E61nYr/PXOX2iuU7D2blPYemmRlojl7dwLuQEfqZcc1AQeVftYT1HXPr3mEI+dyXBz390kFznR4BnF5YMaM/bl4ajD5TXYfeD5FEfhKsBHpDbgX6O+0YJEU3uT8QdDck8R0DVwzx7xsro7cP/kyoTooggy+gyH7eRu1ym7ig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757103; c=relaxed/simple;
	bh=lmXM2gCXYi+IXAnVDxZJhL+sNHWSZZhtlWs3lQCWgMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYzY0Ol0NCc0uEAEe8Kp5HzCpZmVj9kyO1BzpzznJVso4gME8O0qTfi1j1ulmpKUgOB0+vabvgfpko27Z07gc8WSeQQbj2nVIej/n6rQ5DFAxZZ1MMOOjvmGYuRqtfEWODaxrHdrmdDTbZHnLk8lFx+or/Qn0L3TmqrkvQ/94qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koBYPI89; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A34C4CEEF;
	Tue, 24 Jun 2025 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750757103;
	bh=lmXM2gCXYi+IXAnVDxZJhL+sNHWSZZhtlWs3lQCWgMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=koBYPI89UpiGfdHbkFQQliby0HBlaicpX+v8EmMhmQR1wjoQ3s0I79/M+bDxHzdq0
	 qZ3S+yJUV1sDOGZuHrnfU51ZCXi/aiHFLj08HTiVapD7QDbw79FzHoelzZ1+1emb4V
	 Etp57KzPMFnjrIaVnlMkp11RfNKRuimEfiMhjDp52vwpj+N3qAcPDxjMphBIiU58ZP
	 iE+O3exN7gMy1lHVg2Eu/CmE9YwcjxSub6Bmi9rKjOAW0QVoInTX8+wfqjP6br4Yg4
	 AO0A27YhCs+y2OjaITlObWZxIvXelqd/Kr2mR2BjfarEPgmvqnmjotOHYCh/0HEYhR
	 9oQzenifuBziQ==
Message-ID: <ae6a6465-e42f-4058-847b-3ccb5cf577f8@kernel.org>
Date: Tue, 24 Jun 2025 11:24:58 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: mediatek,mtmips-sysc: Adapt
 compatible for MT7688 boards
To: Ezra Buehler <ezra@easyb.ch>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Reto Schneider <reto.schneider@husqvarnagroup.com>,
 Rob Herring <robh@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, Stefan Roese
 <sr@denx.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>
References: <20250619203502.1293695-1-ezra@easyb.ch>
 <20250619203502.1293695-2-ezra@easyb.ch>
 <20250620-unnatural-bloodhound-of-tenacity-4133bd@kuoka>
 <C75A767D-BD81-48CB-8D39-9FD19BA67E78@easyb.ch>
 <db2575e9-b7b2-4a44-8ef7-0979b3f1f60d@kernel.org>
 <FFA8EEE4-65EF-420C-B041-76394BD8FF9E@easyb.ch>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <FFA8EEE4-65EF-420C-B041-76394BD8FF9E@easyb.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2025 11:21, Ezra Buehler wrote:
>> On 24 Jun 2025, at 11:12, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 24/06/2025 11:08, Ezra Buehler wrote:
>>>> On 20 Jun 2025, at 09:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On Thu, Jun 19, 2025 at 10:34:59PM GMT, Ezra Buehler wrote:
>>>>> From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>>>>>
>>>>> As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
>>>>> used for both SoCs. To prevent "Kernel panic - not syncing: unable to
>>>>> get CPU clock, err=-2" and allow an MT7688-based board to boot, the
>>>>> following must be allowed:
>>>>>
>>>>>   compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
>>>>>
>>>>> Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
>>>>> ---
>>>>> .../bindings/clock/mediatek,mtmips-sysc.yaml  | 27 ++++++++++---------
>>>>> 1 file changed, 15 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>>> index 83c1803ffd16..3fabaa8acc10 100644
>>>>> --- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
>>>>> @@ -26,18 +26,21 @@ description: |
>>>>>
>>>>> properties:
>>>>>  compatible:
>>>>> -    items:
>>>>> -      - enum:
>>>>> -          - ralink,mt7620-sysc
>>>>> -          - ralink,mt7628-sysc
>>>>> -          - ralink,mt7688-sysc
>>>>
>>>> I do not understand why this is removed and commit msg explains nothing
>>>> about it. Re-add it back.
>>>
>>> OK, so you suggest we allow
>>>
>>> compatible = "ralink,mt7628-sysc", "ralink,mt7688-sysc", "syscon";
>>>
>>> and
>>>
>>> compatible = "ralink,mt7688-sysc", "syscon";
>>>
>>> I'll adapt my patch accordingly.
>>>
>>> Still, as AFAIK the MT7628 and MT7688 are identical in this regard,
>>
>> Standard rules apply expressed in writing bindings, some talks/guides
>> and all modern SoCs...
>>
>>
>>>
>>> compatible = "ralink,mt7688-sysc", "ralink,mt7628-sysc", "syscon";
>>>
>>> would technically be valid too. Could you elaborate why that is not a
>>> good idea? The MT7688 is basically a subset of the MT7628.
>>
>> You did not send such patch.
> 
> No, I did not. I am just trying to understand the topic better. Anyway,
> never mind, I will just do it as you suggested.


I cannot give you answer on hypothetical patch without seeing that
patch. Maybe you change or break the ABI? Maybe you affect users? Dunno.
I prefer to discuss the code, not scenarios.


Best regards,
Krzysztof

