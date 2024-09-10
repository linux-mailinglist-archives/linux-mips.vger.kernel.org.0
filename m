Return-Path: <linux-mips+bounces-5487-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE0972A9C
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 09:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6741C23D16
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 07:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D82C17C232;
	Tue, 10 Sep 2024 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL1ObNIm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF5D335A7;
	Tue, 10 Sep 2024 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953200; cv=none; b=pD5BenN4KrzJYEjE+1zWeZSSk4KWO8hDIv3C2WKRPPCPFeZH9VLnHfU7ynE8PgUKDg4pzP0NKJYEBlfF22TlZsnIks/dlrKDMiDSrm+0Z2b805kssBukwEZSs7mTSYWP15BYCcINpleVB5N2AA/0fEajY50gr0e8ZjuKp0jGNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953200; c=relaxed/simple;
	bh=c7SEPg78L7aXvA8zp/wEXCqRIxwD84K8s9j7Fcayr90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POZLaN2IR0hEwz9IrX2mEYi8RuOifq5OQzB0X5wDFFvcEbNqJg+0Od5YU7ugQ0q7WgW6P88ZvIvOphrXx+bAbajsuWcKLPouN7x8Kz7lZioMOEtnjeV12e6pdT6Mq9sPuZyS/rW9aZm6JlTI1dM4uXGPS37ob7JFkdNVgdU5Ipg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL1ObNIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B72BC4CEC3;
	Tue, 10 Sep 2024 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725953199;
	bh=c7SEPg78L7aXvA8zp/wEXCqRIxwD84K8s9j7Fcayr90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WL1ObNImc6XB/G6SMInxizHHTBX09O1Ae6dE1z6rvaxGYqTdK//1PyRDBj8gbumJd
	 7s9wh7O8HU8YLfviOdpznKSj2RFypGRyI7WhLvvwfMzYAyh270bj7xKlOD9oDcYeQ1
	 rzcf0fJM/450VcicxYPzp8ODdQio6Z8MO+JQfRODaHgzA11kLULEbsrAwZtW5Zf+Ss
	 TW7HhnB2m4a/G7tFUmEjASLeNQI83rY7bhq7zuSY1aLrrwOP5bSSum3DoAK8z9gJTd
	 oP9ifSN2tIVrV+A2eKRsy3KMosu4Qldf4DM16PZZH9YJu0wVfnugzmhi7JjcTkA7ds
	 BxZO0xdUwOq9g==
Message-ID: <469efcd0-148c-4a71-b315-043ac59df838@kernel.org>
Date: Tue, 10 Sep 2024 09:26:33 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add Realtek switch
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20240909014707.2003091-1-chris.packham@alliedtelesis.co.nz>
 <20240909014707.2003091-2-chris.packham@alliedtelesis.co.nz>
 <63sbuzij27crjxv6d6qjblv55al5zk4ivsah4ji2kvddhbua57@xo4vt2tqs5cn>
 <01656780-0a90-4c7b-bedf-2e45992cd16c@alliedtelesis.co.nz>
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
In-Reply-To: <01656780-0a90-4c7b-bedf-2e45992cd16c@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2024 22:36, Chris Packham wrote:
> Hi Krzysztof,
> 
> On 9/09/24 18:38, Krzysztof Kozlowski wrote:
>> On Mon, Sep 09, 2024 at 01:47:06PM +1200, Chris Packham wrote:
>>> Add device tree schema for the Realtek switch. Currently the only
>>> supported feature is the syscon-reboot which is needed to be able to
>>> reboot the board.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>   .../bindings/mfd/realtek,switch.yaml          | 50 +++++++++++++++++++
>>>   1 file changed, 50 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>> Use compatible as filename.
> 
> My hope was eventually that this would support multiple Realtek 
> switches. But sure for now at least I can name it after the one in front 
> of me.

This might never happen, so unless you document more models now, I
strongly suggest using compatible as filename.

> 
>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/realtek,switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>>> new file mode 100644
>>> index 000000000000..84b57f87bd3a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>>> @@ -0,0 +1,50 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://scanmail.trustwave.com/?c=20988&d=55fe5gyquxahZ_dJqiHMxmkDG8M1MWjoNtZN70yrng&u=http%3a%2f%2fdevicetree%2eorg%2fschemas%2fmfd%2frealtek%2cswitch%2eyaml%23
>>> +$schema: http://scanmail.trustwave.com/?c=20988&d=55fe5gyquxahZ_dJqiHMxmkDG8M1MWjoNoNFvkz8nA&u=http%3a%2f%2fdevicetree%2eorg%2fmeta-schemas%2fcore%2eyaml%23
>>> +
>>> +title: Realtek Switch with Internal CPU
>> What sort of Switch? Like network switch? Then this should be placed in
>> respective net (or deeper, e.g. net/dsa/) directory.
> Yes network switch. But this is one of those all in one chips that has a 
> CPU, network switch and various peripherals. MFD seemed appropriate.

There is no such device as MFD. MFD is a Linux framework.

>>
>> Maintainers go here. See example-schema.
> 
> Ack.
> 
>>> +
>>> +description:
>>> +  The RTL9302 ethernet switch has an internal CPU. The switch is a multi-port
>>> +  networking switch that supports many interfaces. Additionally, the device can
>>> +  support MDIO, SPI and I2C busses.
>> I don't get why syscon node is called switch. This looks incomplete or
>> you used description from some other device.
> 
> Yes I did take a lot of inspiration from the mscc,ocelot. I am working 
> on more support for the switch and some of the other peripherals so I 
> figured I'd word it towards that end goal. If you prefer I could word 
> this more towards the one function (reboot) that is supported right now.

Your commit msg is not explaining here much. And "Currently the only
supported" feels like a driver description. We expect bindings to be
complete. It's fine to bring partial description of hardware, but this
should be explained in the commit msg and entire binding should be still
created to accommodate that full description.

However such complex devices like Ocelot should be described fully so we
can easily see how you organize entire binding.

> 
>> But if this is DSA, then you miss dsa ref and dsa-related properties.
> 
> So far I'm resisting DSA. The usage of the RTL9300 as a SoC+Switch 
> doesn't really lend itself to the DSA architecture (there is a external 
> CPU mode that would). I think eventually we'd end up with something like 
> the mscc,oscelot where both switchdev and DSA usage is supported. There 
> would be some properties (e.g. port/phy arrangement) that apply to both 
> uses.

This feels ok, although you really should create complete binding here.

> 
> I have got a (kind of) working proof of concept switchdev driver which 
> has some of the support you've mentioned. It's not really ready so I 
> didn't include the dt-binding for that stuff in this patch.


Best regards,
Krzysztof


