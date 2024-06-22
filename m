Return-Path: <linux-mips+bounces-3855-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C443913593
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 20:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2AE028246D
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 18:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB28D29CFE;
	Sat, 22 Jun 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JImTM2rp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988C2225CF;
	Sat, 22 Jun 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719079944; cv=none; b=hTHNKCwiBxd+Is7XEmnedmywdt7Y/0k2XpCE9GvuJF6OpUS63XbtL0hTaa7j3PapVQkqo+m48Y/dT2ENjqBl/u7ILaC5zmqsFFnK6Et9wk4D4qImqLGuHKcnQy1JG6jo0kK9VzaB6Ub2FbAexPwCHC/YPIfRaPa7fAKSD/vz6Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719079944; c=relaxed/simple;
	bh=7K1cC3WKLb7G8lvv4xw3xZ6OA3k0OfGg8JeEG6bBLEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqp6SeHI1tUvGt/fGVvWe5WE/f+FsLrgDVTalrCt8bU4/SkiQZjuc9PPsTG+FUlUggDBuhA6CHVYQbcsXk8AlHAPKIAE8ZfMNuAhSPZBeM1iUPut+D0/mj/p6Vx1J9iOhO5iiYQTTWkWG2cBVbQHCnWVNk+eiXCOmGn4lfV8mPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JImTM2rp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6968BC3277B;
	Sat, 22 Jun 2024 18:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719079944;
	bh=7K1cC3WKLb7G8lvv4xw3xZ6OA3k0OfGg8JeEG6bBLEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JImTM2rpPT9Yl5DhsAbrWQOuLmwBGqR4QPy9+7oDH4XkS2FGOaXk8TUPQd0oDe+UU
	 xICYDbLZd2lsbbB8H5mThe0nS0/pqgcAvXPCeqGkJcyNLo83MUlwv4+f9hE8dXwyFg
	 oaqza+sSU7oub8Q8J6tLHQ4J9gA3W2gBrQ+8fcjh3xEMt8Wm1rQE/6/LWEXeS7O3JD
	 POzKMDnlXtQq0Kz+zwkrfV8+ybo211jtIFY3q+/x/M7X6AsVjWOSXEIyey7x+dS2P0
	 4TmI3bwe1DHt/CnYSLHbvIIEY/zB1x1+U7lnLoi4RdX9OLCObB+8q0FbH0kqxAtUuh
	 eRVYnDvAsvOzQ==
Message-ID: <6ca74ccf-b93e-4d77-8609-a12a96c15f38@kernel.org>
Date: Sat, 22 Jun 2024 20:12:17 +0200
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
 <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
 <856ff7b0-774d-4120-8bd8-01270f5c14b4@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <856ff7b0-774d-4120-8bd8-01270f5c14b4@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/06/2024 17:51, Jiaxun Yang wrote:
> 
> 
> 在2024年6月20日六月 上午7:40，Krzysztof Kozlowski写道：
> [...]
>>>
>>> Hi Krzysztof,
>>>
>>> I believe U-Boot's implementation is correct. As per simple-mfd binding:
>>>
>>> ```
>>> simple-mfd" - this signifies that the operating system should
>>>   consider all subnodes of the MFD device as separate devices akin to how
>>>   "simple-bus" indicates when to see subnodes as children for a simple
>>>   memory-mapped bus.
>>> ```
>>>
>>> This reads to me as "if you want sub nodes to be populated as devices
>>> you need this."
>>>
>>> In our case there are "clock" and "reset" node sub nodes which should be
>>> probed as regular device, so it's true for us.
>>
>> No, you already got comment from Rob.
>>
>> Your children depend on parent to provide IO address, so this is not
>> simple-mfd. Rule for simple-mfd is that children do not rely on parent
>> at all.
>>
> Hi Krzysztof,
> 
> Sorry but can I ask for clarification on "depend on parent to provide IO
> address", do you mind explaining it a little bit? Does it mean children
> should get regmap node from a phandle property, not the parent node? Or there
> should be a reg property for child node to tell register offset etc?
> 
> There are way too much usage that children "depends" on parents somehow
> in tree, so I want to confirm my understanding.


Your driver relies on parent IO address to be provided - what's more to
explain here? If parent does not provide syscon, does the child work?
No. Therefore it is not suited for simple-mfd.

> 
> For boston-platform-regs there are some other PHYs that I may add drivers
> for them in future, so I certainly want "simple-mfd" to be here 

Well, I want a new Ducati, but we don't always get what we want, right?

Best regards,
Krzysztof


