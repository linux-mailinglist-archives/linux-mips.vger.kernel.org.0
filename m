Return-Path: <linux-mips+bounces-5521-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D36E974449
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 22:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB4428309D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 20:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0E01A706B;
	Tue, 10 Sep 2024 20:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="xlVM01KE"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC201A4E93
	for <linux-mips@vger.kernel.org>; Tue, 10 Sep 2024 20:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726001329; cv=none; b=CHkrPnwfLAZpBZvYI5wp3FOd1NZK3IM+YeR0YioEkyk87uc9izBLW2Bhuymf3asUeRBQpKmuM0LZIfMbdYOfv4bHROvMmDzF1iPMwACmfuolC+VkJbylhHoUokgAJcH34zeN5PJ+qvWhtARHRXjZCevxjpoLBz5FZoCCF0F/fCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726001329; c=relaxed/simple;
	bh=YURRXtuiegh8uv6meZyub27sJV4yJDfMCrsCkDc3eR4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CU/9lANbdPbHbf6H2x6ZEG/5cqXU9H/euwyZbYwo7KZkFIsNzg1gAMG7w7dGhlTPsQGMzkm/38TqpPiqrlveOyoNJs+a4rDP5nxLBu4+yGJQCMmqvSASR6lYQ4zH3LwAM8JmSCWsQK44vWGccW+hiz4jqn/nTiHFl8MNdFZmebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=xlVM01KE; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DB9BD2C02D1;
	Wed, 11 Sep 2024 08:48:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726001324;
	bh=EMKKZV86j5ufyd38DQrH2gKBadCOZTutNczIGvDuUkA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=xlVM01KEPB0XdpbElf6QWER/k9GiGY7pNC2r/6ZSDFwULjKYFBV8ZEl8vRqZuzg8l
	 qT2BXJVzvtEDAmjZl5gVis8kXS6yihn9pyfhcC/te8l6di5u3J66hJRDH2f8WBsBSq
	 3HcKSL0d9xhO80LOqnidL79SfJtGVR9Zeu0RLFRpONaAqBX2LwZ+qPM5GKm0DAFA1W
	 HYkW2QMnV4rmKMte4wXuH3l3t0FxxN3+VNIOylnTDVu8VG0n0DL/ZZ13vtytyMkdlY
	 HYdG5DeN7usB9yNTDzoylxZF87G3Qig+kauMPvnc5Unis4qkV63IP69O5615v0WLyf
	 msUrCquodpJDg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66e0b0ac0000>; Wed, 11 Sep 2024 08:48:44 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id C4B2F13ED8D;
	Wed, 11 Sep 2024 08:48:44 +1200 (NZST)
Message-ID: <c7d4f87b-f3d4-4853-9960-e7faa560ce34@alliedtelesis.co.nz>
Date: Wed, 11 Sep 2024 08:48:44 +1200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add Realtek switch
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20240909014707.2003091-1-chris.packham@alliedtelesis.co.nz>
 <20240909014707.2003091-2-chris.packham@alliedtelesis.co.nz>
 <63sbuzij27crjxv6d6qjblv55al5zk4ivsah4ji2kvddhbua57@xo4vt2tqs5cn>
 <01656780-0a90-4c7b-bedf-2e45992cd16c@alliedtelesis.co.nz>
 <469efcd0-148c-4a71-b315-043ac59df838@kernel.org>
Content-Language: en-US
In-Reply-To: <469efcd0-148c-4a71-b315-043ac59df838@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=KIj5D0Fo c=1 sm=1 tr=0 ts=66e0b0ac a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=62ntRvTiAAAA:8 a=gEfo2CItAAAA:8 a=ZXfZcMmdroSEQ_jOwVoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Krzysztof,

(sorry, re-sending as plain text)

On 10/09/24 19:26, Krzysztof Kozlowski wrote:
> On 09/09/2024 22:36, Chris Packham wrote:
>> Hi Krzysztof,
>>
>> On 9/09/24 18:38, Krzysztof Kozlowski wrote:
>>> On Mon, Sep 09, 2024 at 01:47:06PM +1200, Chris Packham wrote:
>>>> Add device tree schema for the Realtek switch. Currently the only
>>>> supported feature is the syscon-reboot which is needed to be able to
>>>> reboot the board.
>>>>
>>>> Signed-off-by: Chris Packham<chris.packham@alliedtelesis.co.nz>
>>>> ---
>>>>    .../bindings/mfd/realtek,switch.yaml          | 50 +++++++++++++++++++
>>>>    1 file changed, 50 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>>> Use compatible as filename.
>> My hope was eventually that this would support multiple Realtek
>> switches. But sure for now at least I can name it after the one in front
>> of me.
> This might never happen, so unless you document more models now, I
> strongly suggest using compatible as filename.
Agreed.
>>>> diff --git a/Documentation/devicetree/bindings/mfd/realtek,switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>>>> new file mode 100644
>>>> index 000000000000..84b57f87bd3a
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>>>> @@ -0,0 +1,50 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:http://scanmail.trustwave.com/?c=20988&d=s_Tf5n4B2HBkm1hFlKUTA3UKwK2Jg2EPHeQMRCQHXQ&u=http%3a%2f%2fdevicetree%2eorg%2fschemas%2fmfd%2frealtek%2cswitch%2eyaml%23
>>>> +$schema:http://scanmail.trustwave.com/?c=20988&d=s_Tf5n4B2HBkm1hFlKUTA3UKwK2Jg2EPHbEEFSRQXw&u=http%3a%2f%2fdevicetree%2eorg%2fmeta-schemas%2fcore%2eyaml%23
>>>> +
>>>> +title: Realtek Switch with Internal CPU
>>> What sort of Switch? Like network switch? Then this should be placed in
>>> respective net (or deeper, e.g. net/dsa/) directory.
>> Yes network switch. But this is one of those all in one chips that has a
>> CPU, network switch and various peripherals. MFD seemed appropriate.
> There is no such device as MFD. MFD is a Linux framework.

What I meant was the RTL9302 is a similar class of device to the 
mscc,ocelot which has a binding in 
Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml. If it's a case 
of that being historical baggage then 
Documentation/devicetree/bindings/mips/ might be appropriate for the SoC 
type properties and Documentation/devicetree/bindings/net/ for the 
switch portion.

>>> Maintainers go here. See example-schema.
>> Ack.
>>
>>>> +
>>>> +description:
>>>> +  The RTL9302 ethernet switch has an internal CPU. The switch is a multi-port
>>>> +  networking switch that supports many interfaces. Additionally, the device can
>>>> +  support MDIO, SPI and I2C busses.
>>> I don't get why syscon node is called switch. This looks incomplete or
>>> you used description from some other device.
>> Yes I did take a lot of inspiration from the mscc,ocelot. I am working
>> on more support for the switch and some of the other peripherals so I
>> figured I'd word it towards that end goal. If you prefer I could word
>> this more towards the one function (reboot) that is supported right now.
> Your commit msg is not explaining here much. And "Currently the only
> supported" feels like a driver description. We expect bindings to be
> complete. It's fine to bring partial description of hardware, but this
> should be explained in the commit msg and entire binding should be still
> created to accommodate that full description.
>
> However such complex devices like Ocelot should be described fully so we
> can easily see how you organize entire binding.

I can definitely do a better job of explaining myself in the commit 
message. Right now I just want to have a working reboot.

I'm not really using the "realtek,rtl9302c-switch" compatible for 
anything but I gather using a "syscon" node without a more specific 
compatible is frowned upon (please tell me if I'm wrong). In terms of 
the binding should I just make the description something terse like "The 
RTL9302 ethernet switch has an internal CPU. Some peripherals are 
accessed via a common register block".

>>> But if this is DSA, then you miss dsa ref and dsa-related properties.
>> So far I'm resisting DSA. The usage of the RTL9300 as a SoC+Switch
>> doesn't really lend itself to the DSA architecture (there is a external
>> CPU mode that would). I think eventually we'd end up with something like
>> the mscc,oscelot where both switchdev and DSA usage is supported. There
>> would be some properties (e.g. port/phy arrangement) that apply to both
>> uses.
> This feels ok, although you really should create complete binding here.

This is a bit of a chicken and egg thing. I don't want to commit to a 
binding until I have more code to back it up, but of course I don't want 
to spend a bunch of time writing code for a binding that then needs to 
change when that binding is reviewed.

>> I have got a (kind of) working proof of concept switchdev driver which
>> has some of the support you've mentioned. It's not really ready so I
>> didn't include the dt-binding for that stuff in this patch.
> Best regards,
> Krzysztof
>

