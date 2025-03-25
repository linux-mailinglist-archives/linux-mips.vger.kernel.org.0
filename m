Return-Path: <linux-mips+bounces-8357-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26329A70342
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 15:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B151F162635
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD58259C8D;
	Tue, 25 Mar 2025 14:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="c/9vbWoL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A71DE3D9;
	Tue, 25 Mar 2025 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911943; cv=none; b=ZkkOmT3BqdPgc/ab45y16NVa/ljM45/lwycPbL8fcqhC4iuquYrZMBqS2UDyUCE0yoFfal17RXQm9ifwCdwnUFBIdEIG+paa5bTJvppmDEzQqmrjKanO8pJ4q1lmbEq/ZfYhfqXbECePFa6mjhJ008VydtEgEByvXpeABJnuOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911943; c=relaxed/simple;
	bh=rnM0JS3yDElFKgmO82fK5yJDI2KAPmKEs7TNRou0BvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkCAaJw/51GhXmkx6+qqMCdSTDMhh2nxqxOdU4V+OI/QL//+RfOzrJsgqxUMb9FPCqn8RcLgtCAqrveQAJ3WnwMcXds7B+YCZodJrh5Mo+bHEpX5ymG4jm3pTQlFoh3qFyFYlFxN4oZdt8P3cmIv53TdneWu64Axb+oz6nkB4Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=c/9vbWoL; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4AE42D0236;
	Tue, 25 Mar 2025 15:12:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742911939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WkxD9N8jHRKqeTzj9c51AizFCHQ0um23OQSpiYQuINo=;
	b=c/9vbWoLONSucxWVy43Ju1apATR5mU45g4s53dAmryzRvC3FQPM84XeKoYL6JreO8l2YXp
	GcvKMDQKW8ECAUndscXEoZUg/hvmo4ZVlaAhAD+5LaJ5U8Q24wbyP5yNXOd7AdEPBKDqty
	EV4+J/ew1A2bQVHXKIeRQQsYQI52P3OwSCchekAENAIV+DNafaKvt1LCRk+noyDgGk5wJK
	zm1Z3onjNkrdD4Pa1MzvNnFVrReCUkH5GIGGRp2ekmlNBVK115ZkeewDNGyReoasPPmhOY
	XghQjc6wNwHhjQ+FfV+lR/XJl2koyR7PwgNffuzXWF+RqGmb3IAk3rKRnoCexA==
Message-ID: <1810116f-60cd-46ba-ae0b-0e1684b34360@cjdns.fr>
Date: Tue, 25 Mar 2025 15:12:15 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 01/10] dt-bindings: vendor-prefixes: Add EcoNet
To: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250325134349.2476458-1-cjd@cjdns.fr>
 <20250325134349.2476458-2-cjd@cjdns.fr>
 <87933eef-e2b4-4f15-b6b6-1634a9ca17d1@omp.ru>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <87933eef-e2b4-4f15-b6b6-1634a9ca17d1@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 25/03/2025 15:09, Sergey Shtylyov wrote:
> On 3/25/25 4:43 PM, Caleb James DeLisle wrote:
>
>> Add the "econet" vendor prefix for SoC maker
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 5079ca6ce1d1..4cd050e50743 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -416,6 +416,8 @@ patternProperties:
>>       description: dServe Technology B.V.
>>     "^dynaimage,.*":
>>       description: Dyna-Image
>> +  "^econet,.*":
>> +    description: EcoNet (HK) Limited
>>     "^ea,.*":
>>       description: Embedded Artists AB
>>     "^ebang,.*":
>     "econet" goes after "ea" and "ebang" in my book. :-)


Thank you :facepalm: not sure how I missed that.


Thanks,

Caleb


>
> MBR, Sergey
>

