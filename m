Return-Path: <linux-mips+bounces-7055-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C54D59F3A5C
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 20:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12BB71660D2
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 19:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947CC20CCE4;
	Mon, 16 Dec 2024 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="cUD11b9N"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E803C206F13
	for <linux-mips@vger.kernel.org>; Mon, 16 Dec 2024 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734379059; cv=none; b=fadyZhJGxAhqpY0i15/LZN0+cCohv0aQb4gPCHLf8p+3TaPra5HEq6eZQwGDYX/bJRKWdieINzFFSsebe8OYyldNSpKwco4PMCiotgrGVkUjzPztixjrPg5CHb1dVjCvKwRYqnme46WOQNdkqF0XvHh5WDoWGKk0Lxn3gYhROtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734379059; c=relaxed/simple;
	bh=3EUxTz6N2CO54MtyJBQDvZ+FZVSDjNgSHibKEihsynI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nbl3LRpQWZfvpYYBxdok/6FgQCQ1wBorcm+EMr9BV/7Bb7LQ2ZtA1ANmffrskbe0jbQlNyE6ITQtw8wV12bNzTJKz7aEE4DN8+l4SwRwUHAx0D90KVq8/VC2Ay/aCnnFwJugpXqNVhFPBMzlJBaEoSG4/KNRgWXkzZrYLtrJMC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=cUD11b9N; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2D34F2C07FD;
	Tue, 17 Dec 2024 08:57:29 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734379049;
	bh=p1T4X+B77uk/xLqLY88anJOJiIa7QMOSTIyM0a4pqko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cUD11b9NIu/vdxuzVNr2m8txlDwfGoQ5XL7e3YYtLfMTqJmmj7swhWleXYh9bjKIz
	 gfidl6XoVUQEw+q1pqcjEojG65sQzOynOjwGhjb32Cgy3JehlWTYoSsIZ6YKvAFCHF
	 miR+aukZdYJXUkgVeryR73SLimnknPT9tDOoxAb7i0tjy0PiPaO1NY3iOY2kyvMlDA
	 3Ul13RTvGI8YDkxF23ag2VUVLrVF8Di+8LIRsPAjlyUFSQUOcfPUT9cbYTRfesiLhL
	 6dZcdWPQfxcD+FfvF00wP0VZj946lHB1HXrPzUtFGaIVH11P2eA2Wb3fCfppEYNVHa
	 +Dw+Z/y8QfufQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B676086290000>; Tue, 17 Dec 2024 08:57:29 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 046D413ED95;
	Tue, 17 Dec 2024 08:57:29 +1300 (NZDT)
Message-ID: <f916444e-3f79-4b08-8830-846aaba06d18@alliedtelesis.co.nz>
Date: Tue, 17 Dec 2024 08:57:28 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add Realtek MDIO controller
To: Conor Dooley <conor@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-2-chris.packham@alliedtelesis.co.nz>
 <20241216-native-velvet-1d2b765c8b48@spud>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20241216-native-velvet-1d2b765c8b48@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=67608629 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=XYAwZIGsAAAA:8 a=aDH4CMtCcT_BCErJpHcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 17/12/2024 07:52, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 04:13:43PM +1300, Chris Packham wrote:
>> Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
>> controller is slightly unusual in that direct MDIO communication is not
>> possible. Instead, the SMI bus and PHY address are associated with a
>> switch port and the port number is used when talking to the PHY.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> +      realtek,smi-address:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description: SMI interface and address for the connected PHY
>> +        items:
>> +          - description: SMI interface number associated with the port.
>> +          - description: SMI address of the PHY for the port.
>
> I don't really understand this property, but I also don't understand the
> MDIO bus, so with that caveat
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I'll try to clarify here as it may be of relevance to other reviewers, 
if any of this should go in the commit message or the binding let me know.

The MDIO bus is used to manage one or more network PHYs. Sometimes there 
is an MDIO interface as part of a NIC controller but it's become 
increasingly common to have a the MDIO controller separated from the 
Ethernet controller, particularly when there are multiple Ethernet 
controllers in a SoC. In the device trees there is a usually a node for 
the MDIO controller and the attached PHYs are child nodes. The Ethernet 
interface has phandle property which references the attached PHY.

The RTL9300 (and similar Realtek Ethernet switches) don't directly 
expose the MDIO interface to us. There seems to be an internal PHY 
polling mechanism and the user access to the PHYs works in conjunction 
with that. So rather than being able to reference PHYs and MDIO 
interfaces directly we need to work with switch port numbers instead. 
The actual hardware MDIO bus and PHY address is captured in the 
"realtek,smi-address" property.


