Return-Path: <linux-mips+bounces-8376-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D855A71C11
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 17:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47E197A8575
	for <lists+linux-mips@lfdr.de>; Wed, 26 Mar 2025 16:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627EC1F3BBC;
	Wed, 26 Mar 2025 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="I3VrO/ZK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DCF1547E7;
	Wed, 26 Mar 2025 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743007396; cv=none; b=Sugoi08k6zq7WKnvg2Ky3KXWaSqdAE5PWZ4Ab0QNHF0oGKNxy4InME3IqCBE6GaSICy1zLK9KDql/EefPwoEioiie2BeTcjMQmrIxfoNZtPLQuHhlShnh14Un1a1cY9OrsNvcKUicXXeSUc7gtENOOowY4DrAHWqrkFhyyiYPsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743007396; c=relaxed/simple;
	bh=+hdv/LjO9fA4Bcgn7xIAsdgMxjncq2nRwtddTAlYvZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eAi6H0QochLkSZFcVw+6ntJToo67lZ2SMsc6GkbpNOp8KIAxD7giAa4WNSj7jVqLjvY/M8xQ95rlB2fueBPPiYHlofpq1p7QI3EMnxv/FMFvvWUC6edKYVpjGCcRV23EAfIraCANe0Z/hBif+aAHcaTOP7DyXY5mu6hl1qV7YbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=I3VrO/ZK; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 408612CEB2B;
	Wed, 26 Mar 2025 17:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743007385; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=74qiUoWQtpmpyF0zd2or6v2KnYkCfwI6j7YpofjaEyg=;
	b=I3VrO/ZKv5FSf8Louq8+4t7aHIRH5vWsvvLRVL3+qYx2hqP4Gk/zTdxSIN78vIRIHfgyzk
	fMU5nSx+9rXnoUDf6iMZI2kkseZPBEKpaHG0aBdml52o9aLMNiqVXW1z9CF3sZ40styHiG
	9fOtNlvdhtK20Itrgufp6dqVUjntyU4W1fEc/1LgZiEjLu1ETepLl/+K1CpqcLRzsJIdoI
	Oz3kjkGsZBULfGsqRaIf5fvekwf59mnOlwvUN8BR6GQ2o4dReAkkyvB/flMVNab6Pya17l
	/O17kV6ObUP8WNPAubb3/YKoS4nXo5GwjsIxtfYPVSEQ5jZLrvl09kx3uFo5Ww==
Message-ID: <ed0e6342-8ae0-445e-8ccb-490a218e0758@cjdns.fr>
Date: Wed, 26 Mar 2025 17:43:01 +0100
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
 <890a302e-9105-446c-a2a9-110e94457dac@cjdns.fr>
 <79452943-bb0e-4c0c-a47d-f33a5bdeca21@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <79452943-bb0e-4c0c-a47d-f33a5bdeca21@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 26/03/2025 15:20, Krzysztof Kozlowski wrote:
> On 26/03/2025 09:19, Caleb James DeLisle wrote:
>>>> +          - const: econet,en751221-timer
>>>> +      - items:
>>>> +          - const: econet,en751627-timer
>>>> +          - const: econet,en751221-timer
>>>> +
>>>> +  reg: true
>>> Widest constraints are always here.
>> (AFACT) there's no common constraint to both.
> That's why I did not ask for common, but for the widest, just like the
> example I gave explicitly for that case in my talk.
>
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127

Got it, thank you for the clarification.

Caleb

>
> Best regards,
> Krzysztof

