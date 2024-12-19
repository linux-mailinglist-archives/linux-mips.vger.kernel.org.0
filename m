Return-Path: <linux-mips+bounces-7101-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A929F8634
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 21:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38A22189685E
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2024 20:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899551C5CA8;
	Thu, 19 Dec 2024 20:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ImpEk5r2"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF51C07ED
	for <linux-mips@vger.kernel.org>; Thu, 19 Dec 2024 20:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641099; cv=none; b=k90i25u3FNP5BpAHW9pp1MxRBe+8ZVFfr63tRIwNQYM75Qy9gxLYbfOH4TMYiUd/iKVG+5yUKUm0hl7Pyq2EGsIGeN1C2TOsVvMxcV9RHQTzyhl2qH82AKx14omjsuEc4YdwD9fmGynru11MzqlViPhcpAsrEFyLwXR52uZ4kVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641099; c=relaxed/simple;
	bh=lOfvwaDXHXdZkwBWWRcg2+gc19VBbA2gCnpppXh7JNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWVslOO9WPbuYdhEIaTqngLwdgWFE1zJmclENaGsRFwFjEz+ADBd70SvGsOuYOb5jFLMU7nQnsQqx4NRBYGpCvakyuGOr3MT+GMg0M1FAlBcEpbGYwWXjyBWSY52UI2JPVNR/x4yDunfBaJFnu1Bqv86OXlPRNmZPdArkwbdo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ImpEk5r2; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CE8892C097F;
	Fri, 20 Dec 2024 09:44:54 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734641094;
	bh=9yUa7sU9WrJZHOBp/UGd59vGI5LquA62HK55GYbP1Bw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ImpEk5r22AfC+OgRZN52LxkKHZkIzV96ad892/RF/L4OEeELntRaAXRYNE+EyY1hw
	 PYRdRK8D3gla3YygneRnKkGSsWhUAIncPGObnnmKgRlXvhOAfiF9Co9sLUFnxKyKBF
	 utoefQIZq7tLCZb1tqFMo+fG0DphmPrzsCUAsyoUh6HmG5V4VMMi6Bdw39DmP5zQTU
	 NQ2AqtOKwWpGtHFyi9XjqRnDdUBTW6ki96KiRx2YjCmDIzwNuGbTi0XnlI3w/YXc9h
	 cJvT94J8ArAZLcrR6oj4J13HFwf5eB5S+gI/uNmvPkLjZM5VjTo4+MjQ7gwD49FZWh
	 Z1HYYvRsD88Lg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B676485c60000>; Fri, 20 Dec 2024 09:44:54 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id B46F313EE00;
	Fri, 20 Dec 2024 09:44:54 +1300 (NZDT)
Message-ID: <0e3cfeb1-e012-4361-86ca-3114217a9c5e@alliedtelesis.co.nz>
Date: Fri, 20 Dec 2024 09:44:54 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 1/3] dt-bindings: net: Add Realtek MDIO controller
To: Daniel Golle <daniel@makrotopia.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241217224501.398039-1-chris.packham@alliedtelesis.co.nz>
 <20241217224501.398039-2-chris.packham@alliedtelesis.co.nz>
 <Z2IPOkMsI4ufGQpQ@makrotopia.org>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <Z2IPOkMsI4ufGQpQ@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=676485c6 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=BC-rU-QvIgVIMzC2bkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Daniel,

On 18/12/2024 12:54, Daniel Golle wrote:
> On Wed, Dec 18, 2024 at 11:44:59AM +1300, Chris Packham wrote:
>> [...]
>> +patternProperties:
>> +  '^ethernet-phy(@[a-f0-9]+)?':
>> +    type: object
>> +    $ref: ethernet-phy.yaml#
>> +
>> +    properties:
>> +      reg:
>> +        description:
>> +          The MDIO communication on the RTL9300 is abstracted by the switch. At
>> +          the software level communication uses the switch port to address the
>> +          PHY with the actual MDIO bus and address having been setup via the
>> +          realtek,smi-address property.
>> +
>> +      realtek,smi-address:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description: SMI interface and address for the connected PHY
>> +        items:
>> +          - description: SMI interface number associated with the port.
>> +          - description: SMI address of the PHY for the port.
> What speaks against describing the actual MDIO busses and addresses (ie.
> the hardware) in Device Tree and setting up the hardware mapping between
> ports and SMI bus and address by parsing the DSA switch port description
> in the MDIO driver?
>
> In that way you would not need the additional vendor-specific property
> and on switches with high port density also avoid having to deal with
> bogus "MDIO addresses" greater than 31.

I kind of expected this discussion.

The main problem is I couldn't figure out how to make that work. 
Ultimately I still need to write the MDIO bus arrangement to hardware 
and map back to a port number when doing MDIO accesses. Whether the 
device-tree uses port number as the reg property and a vendor property 
for the SMI address or does it the other way round I'd still need a 
vendor property. There's also a complication that I've got one MDIO 
controller that looks after more than one MDIO interface at the same 
time. I'll have a bit of a think about it over the holidays and see if I 
can come up with anything cleaner.


