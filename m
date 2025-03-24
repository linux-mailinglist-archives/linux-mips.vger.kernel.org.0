Return-Path: <linux-mips+bounces-8329-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0BA6DA0D
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 13:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F3E416E34A
	for <lists+linux-mips@lfdr.de>; Mon, 24 Mar 2025 12:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C911625E820;
	Mon, 24 Mar 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="VBhlyXIB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5625E81D;
	Mon, 24 Mar 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742819141; cv=none; b=FGEfYYh9RWfyzbyBXMCoF7RtA5xX4Fv8XjpvZULf2FoNL2VpxgOp/o+UYs+Yley7jgzIoerHnbq5SE7IANT3NS1Xx1L/XvAhpapgV4s/bmaIcux8fic3T8TDtbDwhk+i8Mvf3Iq6C7trH2RdinlPofCPRrcYoTHcQuLEDzlJUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742819141; c=relaxed/simple;
	bh=AMYE+1I/yOpxWnGJfI5UUdY1aUw0MEixbTcQYKG3ztc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSE4FYJK+NN2fd45B520wWcEboZFCNKmpzleMCmTldjZWoFtjljkCfhNKgZzS3K690b0oXw6Sg8y4kyP9rVjoY6CUGJRms3ad4KhbGHJsLhuV095dxgrMd+lrVtsFNXTcTDNLmlm3tRMxmKr4QxXjmxbyl63Cbw26TNWMKpG78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=VBhlyXIB; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A4522B2F11;
	Mon, 24 Mar 2025 13:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742819131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kA8B7ILRQjbrf7vZCpIq+EjV0GTPDQ45jh2Yc92ZEFQ=;
	b=VBhlyXIBFTdyC6vVDFd8THg2EDDIryPPVZQHDU6uDYMW86/kWbvAPg4tTYo2UnKgdQPf6C
	HnJEiqmujfJ5B4PDWSc1x5nwttMZqdi5o1fD/JgWgabi3y1NCv7SQ+dfLH2CVJ/7zH+BNb
	V/XSKQzb4qXI3fyj7GHQGMKy6PeV/9L7k4tLUkGcj1fZ8qblwZrhAmNrXFHOhC73Z71wKm
	a6sDm7zKEnyAiQePQF8FRwkTBXZpNrzqxjR+n3ASWR2P/E4Rqt1Zc/dUJLZBJf3gt4jSlM
	fbKa7jWPGhXvwoJkkdzi1I4KU0D2/GBqAj+w7o91WUriRBw9n6yAVj4lqEtDvg==
Message-ID: <f4bb786d-09b2-4237-84bd-cdfe297f8165@cjdns.fr>
Date: Mon, 24 Mar 2025 13:25:27 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v1 4/8] dt-bindings: timer: Add EcoNet HPT CPU Timer
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org
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
 <b3fea7b9-b7ea-4987-9fe7-b0adb9346f07@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <b3fea7b9-b7ea-4987-9fe7-b0adb9346f07@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 24/03/2025 08:13, Krzysztof Kozlowski wrote:
> On 24/03/2025 00:53, Caleb James DeLisle wrote:
>>>>>> +  compatible:
>>>>>> +    const: econet,timer-hpt
>>>>> Soc components must have soc-based compatible and then filename matching
>>>>> whatever you use as fallback.
>>>> I have so far been unable to find good documentation on writing DT bindings
>>>> specifically for SoC devices. If you have anything to point me to, I will read it.
>>>> If not, even a good example of someone else doing it right is helpful.
>>>>
>>>> Currently, I see qcom,pdc.yaml appears to do what you say, so I in absence
>>>> of any other advice, I can try to do what they do.
>>> Just don't use generic fallback.
>>
>> Ok I watched your "Accepted in Less Than 10 Iterations" lecture (I'm doing my
>> homework). If I understand this correctly, you prefer that I use something specific
>> like econet,en751221-timer as the fallback case, so for example on EN751627,
>> it would be:
>>
>> compatible = "econet,en751627-timer", "econet,en751221-timer";
> Yes
>
>> The reason why I didn't do this is because this timer seems to show up in a lot of
>> places. Vendor code says that it's older than EN751221, and (if my reading is
> Just like every other SoC component for every other SoC.
>
>> correct) it has found it's way into chips branded TrendChip, MediaTek and Ralink
>> as well as EcoNet.
>>
>> Now that I'll be adding strict checks on the number of register blocks, this way
>> also has the advantage of allowing a case for users of the timer in SoCs we don't
>> know about:
>>
>> // Only valid with 2 register blocks
>> compatible = "econet,en751627-timer", "econet,timer-hpt";
>>
>> // Only valid with 1 register block
>> compatible = "econet,en751612-timer", "econet,timer-hpt";
> Above do not differ...
>
>> // No restriction because we don't know how many timers the SoC has
>> compatible = "econet,timer-hpt";
> How can you not know? This is strictly defined on given hardware.
>
I mean I don't know, the person writing the DTS for that SoC needs to know.


Per your preference, I'll do the following:


// 2 blocks accepted

compatible = "econet,en751627-timer", "econet,en751221-timer";

// 1 block accepted

compatible = "econet,en751221-timer";


If someone has an SoC with more than 2 timers, it is not supported so they
should update the binding, or (in downstream) they might write an invalid
DTS. FWIW I have no evidence of any >2 core processor which uses this, so
2 timers is probably the maximum.


Lastly I'll change the driver name to timer-econet-en751221.c to avoid the
proliferation of different names.


Thanks,

Caleb


