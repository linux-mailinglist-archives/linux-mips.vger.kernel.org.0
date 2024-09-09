Return-Path: <linux-mips+bounces-5479-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD19723C5
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 22:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6090DB222A3
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 20:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA8418A6DF;
	Mon,  9 Sep 2024 20:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="e9GOhW4a"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F8175D20
	for <linux-mips@vger.kernel.org>; Mon,  9 Sep 2024 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725914209; cv=none; b=sjlb9Wzh5DZMrkws5mze9HMNfbEPKbCsixCB/atlh2QkO5TXNhLUt6/2wknxOftR4WzNdkv3dEzo4ZAB0eoNeLmwA4ptUt9HFxTC4SGX6JXNb7Gq1PHcqXDIdYYbL4RNpc6VUqRQk5EZS/ARI6N1pXzy/fKcvjiJH+757FeCeQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725914209; c=relaxed/simple;
	bh=Yzro7utLjjy/Ud6rybm9pgqAO/Hl6TVb21JgRDGRqXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdaDx8dYodeEjjBqGOpOOxbSmukvzfqxG6nWQhHiQzuigoONGz9WhMmz0n6M3neFdRR9uhUUOM0wuF9SZeB7Zj1kH6Q2CA2TcUChBqkILBAei8UKlTEhrFR0egonoNx4w0BP1sjisAFQoR/F3xClV+RHNe8vODXUK+P2bE1k0BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=e9GOhW4a; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 784192C03C3;
	Tue, 10 Sep 2024 08:36:43 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1725914203;
	bh=m+bTG75BqMIu+iCEQFO/NuATjbLFaetK4sxOKKWiy4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e9GOhW4aspaZIsw96UgiIxE3F3ZRAaP4YqVvl4GiEd60cQPpW9fuD7PjFVFO3r5Tn
	 TTMU/L6rp7fZuH8OkeAPTKkKzwHWci4QWJtawuJ71dWo5ZtjIYJwt6X0DNoGr+KrCc
	 OxVJ+nz7wriXWQKg0Xlue6kRn4B5xF0n+LrHHdyE7qSGXVogUw5xPJGInGwV/GDvVX
	 FQ44HUi2B8Xp9mOZ6+UhFE7Vc/cdNp5fk6DgLY2q3Ue+CcuCYB5gn7wOI6WqTBVmVh
	 ZDNglrj+omoVptWebVPULqtCVXQdC7xR8LZ36IPH7utQjZZWuoHar1myOIqdZ6BFhZ
	 To85DdkyPGWsA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66df5c5b0000>; Tue, 10 Sep 2024 08:36:43 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 5CDFD13ED56;
	Tue, 10 Sep 2024 08:36:43 +1200 (NZST)
Message-ID: <01656780-0a90-4c7b-bedf-2e45992cd16c@alliedtelesis.co.nz>
Date: Tue, 10 Sep 2024 08:36:43 +1200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add Realtek switch
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20240909014707.2003091-1-chris.packham@alliedtelesis.co.nz>
 <20240909014707.2003091-2-chris.packham@alliedtelesis.co.nz>
 <63sbuzij27crjxv6d6qjblv55al5zk4ivsah4ji2kvddhbua57@xo4vt2tqs5cn>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <63sbuzij27crjxv6d6qjblv55al5zk4ivsah4ji2kvddhbua57@xo4vt2tqs5cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=KIj5D0Fo c=1 sm=1 tr=0 ts=66df5c5b a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=62ntRvTiAAAA:8 a=gEfo2CItAAAA:8 a=6q6VGa3TjoECEa-skyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Krzysztof,

On 9/09/24 18:38, Krzysztof Kozlowski wrote:
> On Mon, Sep 09, 2024 at 01:47:06PM +1200, Chris Packham wrote:
>> Add device tree schema for the Realtek switch. Currently the only
>> supported feature is the syscon-reboot which is needed to be able to
>> reboot the board.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>   .../bindings/mfd/realtek,switch.yaml          | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/realtek,switch.yaml
> Use compatible as filename.

My hope was eventually that this would support multiple Realtek 
switches. But sure for now at least I can name it after the one in front 
of me.

>
>> diff --git a/Documentation/devicetree/bindings/mfd/realtek,switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>> new file mode 100644
>> index 000000000000..84b57f87bd3a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://scanmail.trustwave.com/?c=20988&d=55fe5gyquxahZ_dJqiHMxmkDG8M1MWjoNtZN70yrng&u=http%3a%2f%2fdevicetree%2eorg%2fschemas%2fmfd%2frealtek%2cswitch%2eyaml%23
>> +$schema: http://scanmail.trustwave.com/?c=20988&d=55fe5gyquxahZ_dJqiHMxmkDG8M1MWjoNoNFvkz8nA&u=http%3a%2f%2fdevicetree%2eorg%2fmeta-schemas%2fcore%2eyaml%23
>> +
>> +title: Realtek Switch with Internal CPU
> What sort of Switch? Like network switch? Then this should be placed in
> respective net (or deeper, e.g. net/dsa/) directory.
Yes network switch. But this is one of those all in one chips that has a 
CPU, network switch and various peripherals. MFD seemed appropriate.
>
> Maintainers go here. See example-schema.

Ack.

>> +
>> +description:
>> +  The RTL9302 ethernet switch has an internal CPU. The switch is a multi-port
>> +  networking switch that supports many interfaces. Additionally, the device can
>> +  support MDIO, SPI and I2C busses.
> I don't get why syscon node is called switch. This looks incomplete or
> you used description from some other device.

Yes I did take a lot of inspiration from the mscc,ocelot. I am working 
on more support for the switch and some of the other peripherals so I 
figured I'd word it towards that end goal. If you prefer I could word 
this more towards the one function (reboot) that is supported right now.

> But if this is DSA, then you miss dsa ref and dsa-related properties.

So far I'm resisting DSA. The usage of the RTL9300 as a SoC+Switch 
doesn't really lend itself to the DSA architecture (there is a external 
CPU mode that would). I think eventually we'd end up with something like 
the mscc,oscelot where both switchdev and DSA usage is supported. There 
would be some properties (e.g. port/phy arrangement) that apply to both 
uses.

I have got a (kind of) working proof of concept switchdev driver which 
has some of the support you've mentioned. It's not really ready so I 
didn't include the dt-binding for that stuff in this patch.

>> +
>> +maintainers:
>> +  - Chris Packham <chris.packham@alliedtelesis.co.nz>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - realtek,rtl9302c-switch
>> +      - const: syscon
>> +      - const: simple-mfd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reboot:
>> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reboot
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    switch0: ethernet-switch@1b000000 {
> Drop unused label.
Ack.
>
> Best regards,
> Krzysztof
>

