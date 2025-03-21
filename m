Return-Path: <linux-mips+bounces-8267-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3A2A6C121
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 18:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3FBC189B762
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 17:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317051EA7DC;
	Fri, 21 Mar 2025 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="NQBI8X13"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE81D95A9;
	Fri, 21 Mar 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577560; cv=none; b=Mj4A+hRPlW8Qgdp2zb6onLeJpXfP/3U287RmKNdVAjRUfWWdwY8HviMOAOCgI/DTRkMu6/pOtlKeVhQG7+4ejUjP5nAmT0oMZ6t8dQmUDTXA7bAmUjOW3KlFanbHW7fG0z6y7YHgG9mQetUUDaMkuAajd86xw7AGvTa21o6NOjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577560; c=relaxed/simple;
	bh=iUjrZZviz0HratLYPa9I0r6ES1UGZaKfPifNHoR5kXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9wG7sr9E2xcilV1OYAuE391VAls6DM3iaSG3HE271GR9FNeQi/yvRKrFo/Pla2nvdZh14Sj+PskSQ+jhCuUVjAJ9rGR7Gppk6mGRRoHErf6Fx55CsvzZ3KXA+s3KRyPhN/q9+7ryAffd3FU7bHYjDvBPXwginH0kTqtOneckE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=NQBI8X13; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06661291C36;
	Fri, 21 Mar 2025 18:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742577555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zzPyt7C28wJDA71/0ZNWzwkpyL1VjuZamOj0CGGN+uk=;
	b=NQBI8X13zFj3alYAZHLjU3eOj2iMZP+Tzsw8RR2S2EettgrRTWQQDc8Ui4OnqsY6KqYGXS
	glNiGXPJp+7qHHvo48N3sCOi7pMv5vquUJ8ohHjROnNGYD7YI1AB/0aHJI9n0VUs7Iffg9
	jIQXaoEphNstLU1lJnSFhRncfFOXIG9I9BRsaA7tzi+vNfKu/OaefYvDRi2aNuueBDP8Cf
	kqvkf4tJRWo7mTwwbGYlCqIVLL4kQ2pMB5T/FxPZIerGfWYbQkwsvKl6yMBbmK96WTtvDq
	tKD3Mv3IlSoS+oeU7rhl5cO2qvPT3KVIX0okWw9HkipnVW1XtewtqRZwV+XtKg==
Message-ID: <4479c4cc-404b-48b9-9e0f-b6b371c8c159@cjdns.fr>
Date: Fri, 21 Mar 2025 18:19:10 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v1 2/8] dt-bindings: interrupt-controller: Add EcoNet
 EN751221 INTC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-3-cjd@cjdns.fr>
 <174257232355.3436156.11164230137695407225.robh@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <174257232355.3436156.11164230137695407225.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 21/03/2025 16:52, Rob Herring (Arm) wrote:
> On Fri, 21 Mar 2025 13:46:27 +0000, Caleb James DeLisle wrote:
>> Document the device tree binding for the interrupt controller in the
>> EcoNet EN751221 MIPS SoC.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>> If anyone is aware of a standard name for this "shadow interrupt" pattern,
>> please let me know and I will re-send with updated naming.
>> ---
>>   .../econet,en751221-intc.yaml                 | 77 +++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.example.dtb: interrupt-controller@1fb40000: 'interrupt-parent' is a required property
> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/econet,en751221-intc.yaml#
>

Reproduced and fixed, thank you.

In the interest of limiting mailing list noise, I plan to send a v2 sometime
around Monday, ideally to aggregate a few more reviews in the process.


Thanks,

Caleb


