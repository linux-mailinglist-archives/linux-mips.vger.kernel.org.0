Return-Path: <linux-mips+bounces-8323-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12380A6D4C4
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 08:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C80A188A729
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 07:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1C3250BFA;
	Mon, 24 Mar 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSPkz4+r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B482500C9;
	Mon, 24 Mar 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742800429; cv=none; b=Rlm9vjcpEp7wrhxOyRkE64oUi/aiEWu4aVAkCplkHD7ZHZYOy0lytQhuQm80CGoP6hVVSbOMMcNdmdb6moc8N8nHK7XY66btp3bTYFFU5qD8VHbfJFsdegfMvCXQQ+dC5WwPv7BdhvG99qtdpXIRrxVydjFnYiqLsUahA9W5udg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742800429; c=relaxed/simple;
	bh=cJusTp+OERRyKA7Mn/qYePshCTVvne34QzPhXoqFQNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPZipL2LriZZhc2t3GO1h2EtScd/HzKOnlMSBnJ2QsP3oQ/2gfOgNUNushFOgdcaExqJ3RDc/J0wHDh1VUwrSwOp7xHSnDw5qhAMiAxJaJyDz6M/2BMZqRbMyWk4QSPx5O2d7T3JopneYkYjdjskqJqw/hp3cWOGQ/Q64ebVD9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iSPkz4+r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2093C4CEDD;
	Mon, 24 Mar 2025 07:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742800429;
	bh=cJusTp+OERRyKA7Mn/qYePshCTVvne34QzPhXoqFQNk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iSPkz4+rGnlbaffWBQ8Xk3ya1dka2J2PoYwu73f/xoKUo4GIommHTm7l4VFXX5aLt
	 ywfKps1sfFvVhbhozDkEXk0i+VgHOq1AaF9I4Nb+8d0yUXRqQ90rZYVn7VUweeLRve
	 fqwMZkKpP7dmQtUBhZ/FwiGoRmK9felmYyk1E2zkDPfCf890qTQULixMqpPmE1YCEp
	 CJ3F/POAaLTtkRAmntcsNu6zJn34L+La0KfNsWWp68u6T8g0MVYXNj6ItJlWRQHwh/
	 WFhWCbnQ/s2Ftd2eqdA0t/uIqP5W0S+3dRCpo05R5cSdbQuUzk0kRmitYQMxtnX0Td
	 mP/T/1yUtwxBg==
Message-ID: <b3fea7b9-b7ea-4987-9fe7-b0adb9346f07@kernel.org>
Date: Mon, 24 Mar 2025 08:13:41 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] dt-bindings: timer: Add EcoNet HPT CPU Timer
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
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
 <d419bcd2-fa78-4390-88b0-64ed54b87081@cjdns.fr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d419bcd2-fa78-4390-88b0-64ed54b87081@cjdns.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2025 00:53, Caleb James DeLisle wrote:
>>>>> +  compatible:
>>>>> +    const: econet,timer-hpt
>>>> Soc components must have soc-based compatible and then filename matching
>>>> whatever you use as fallback.
>>> I have so far been unable to find good documentation on writing DT bindings
>>> specifically for SoC devices. If you have anything to point me to, I will read it.
>>> If not, even a good example of someone else doing it right is helpful.
>>>
>>> Currently, I see qcom,pdc.yaml appears to do what you say, so I in absence
>>> of any other advice, I can try to do what they do.
>> Just don't use generic fallback.
> 
> 
> Ok I watched your "Accepted in Less Than 10 Iterations" lecture (I'm doing my
> homework). If I understand this correctly, you prefer that I use something specific
> like econet,en751221-timer as the fallback case, so for example on EN751627,
> it would be:
> 
> compatible = "econet,en751627-timer", "econet,en751221-timer";

Yes

> 
> The reason why I didn't do this is because this timer seems to show up in a lot of
> places. Vendor code says that it's older than EN751221, and (if my reading is

Just like every other SoC component for every other SoC.

> correct) it has found it's way into chips branded TrendChip, MediaTek and Ralink
> as well as EcoNet.
> 
> Now that I'll be adding strict checks on the number of register blocks, this way
> also has the advantage of allowing a case for users of the timer in SoCs we don't
> know about:
> 
> // Only valid with 2 register blocks
> compatible = "econet,en751627-timer", "econet,timer-hpt";
> 
> // Only valid with 1 register block
> compatible = "econet,en751612-timer", "econet,timer-hpt";

Above do not differ...

> 
> // No restriction because we don't know how many timers the SoC has
> compatible = "econet,timer-hpt";

How can you not know? This is strictly defined on given hardware.

> 
> 
> That said, I'm fine to do it however you want as long as I'm clear on what you're
> asking for and you have all of the context behind my original decision.

Generic compatible as fallback is accepted if you have evidence that it
is the same IP, with same programming interface, across all these SoCs.
Or if its version is discoverable. If you do not know about other SoC
implementations it is rather a proof that above statement cannot be
fulfilled - you just don't know how it is implemented.


Best regards,
Krzysztof

