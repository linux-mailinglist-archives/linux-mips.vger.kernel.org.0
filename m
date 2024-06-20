Return-Path: <linux-mips+bounces-3746-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374F90FCD9
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 08:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67B87B214D7
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 06:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8993BBF1;
	Thu, 20 Jun 2024 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgsvW9D4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB522BCF7;
	Thu, 20 Jun 2024 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718865611; cv=none; b=Bm3cqlbWluVtSKUlfg3ySbpf/fdNCzx1L7zHrfKXN67rOy3qINvB9FEEQHy3sZhuw7I9pkyG1pX8OATX+2TwUsumPBqZvitGV5hgiNzX1zJzJiSnfUGh7NK+s3+t+7CCjDsSEREAe5ljzqPwu+ErYAIRvpbcHMahb1k7l3OXTiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718865611; c=relaxed/simple;
	bh=F9VZztG35SxUJvfy5B5ZE1Rpm3VmMCzAMyl2EasFXRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqcHGT1sm9Ai7jstHj75dndPENgOjUPbW4qntLQL9uj59bJMkcgKPfF9NRNE4j3s65LmSVejK/+S6zvZKZWOhWC/M/VygGW2lSis8mEIXspHcYDa5y9vBkEkKpGawfa/eEUYiluQJpK6JvlXXPr4ZmsS896bLAa4E4wbl7qMcl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgsvW9D4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3902C4AF07;
	Thu, 20 Jun 2024 06:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718865610;
	bh=F9VZztG35SxUJvfy5B5ZE1Rpm3VmMCzAMyl2EasFXRM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YgsvW9D4vtuXWGk22nza9zaOstRIZQO9+1mEIAz9sD6BnU3kpRYyzgnOmpdbcGunR
	 RPZ3IJvDumjAdjo4KQxLiNsWc+UaLYpEqimZoi1UwMhJe96ez2auSY24typWEBudfU
	 E0YBXl11K+D6WSf/WM8FEjUYVkrybuVbn0kzgSQt2UIhT/u15XVpNPUhDRrcEUCB91
	 mWoUNWKNjyDvu36jLfdACQrFRuA3LaRJjqgoWGauQ5+8phKfTFjg0JOy/SPteLaxb3
	 i+dDpR7Rdmfjsg/O9jezT667Op/KRNYrNf3vg8B5e6CGMfm9WvVycKoMxNrNQxjanT
	 Kuj/WBJFnZkyQ==
Message-ID: <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
Date: Thu, 20 Jun 2024 08:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] dt-bindings: mfd: Add img,boston-platform-regs
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
 <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
 <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
 <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2024 13:20, Jiaxun Yang wrote:
> 
> 
> 在2024年6月19日六月 上午10:28，Krzysztof Kozlowski写道：
>> On 18/06/2024 17:11, Jiaxun Yang wrote:
>>> This compatible has been used in arch/mips/boot/dts/img/boston.dts
>>> for a while but never documented properly.
>>>
>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
>>> new file mode 100644
>>> index 000000000000..79cae87c6758
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
>>> @@ -0,0 +1,74 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mfd/img,boston-platform-regs.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Imagination Technologies Boston Platform Registers
>>> +
>>> +maintainers:
>>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: img,boston-platform-regs
>>> +      - const: syscon
>>> +      - const: simple-mfd
>>
>>
>> Fix U-boot to populate devices instead of relying on simple-mfd.
> 
> Hi Krzysztof,
> 
> I believe U-Boot's implementation is correct. As per simple-mfd binding:
> 
> ```
> simple-mfd" - this signifies that the operating system should
>   consider all subnodes of the MFD device as separate devices akin to how
>   "simple-bus" indicates when to see subnodes as children for a simple
>   memory-mapped bus.
> ```
> 
> This reads to me as "if you want sub nodes to be populated as devices
> you need this."
> 
> In our case there are "clock" and "reset" node sub nodes which should be
> probed as regular device, so it's true for us.

No, you already got comment from Rob.

Your children depend on parent to provide IO address, so this is not
simple-mfd. Rule for simple-mfd is that children do not rely on parent
at all.

> 
> Linux managed to work without "simple-mfd" only because clock subsystem
> is bypassing regular OF population process. Semantically we need this.

Semantically? No, you need proper populate, not incorrect simple-mfd.

> 
> Besides Linux as upstream of devicetree source had accepted U-Boot
> only stuff here, such as "bootph-all" property.

Because bootph-all is valid and correct. Calling simple-mfd something
which is not entirely simple-mfd is not that valid.


Best regards,
Krzysztof


