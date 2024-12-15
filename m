Return-Path: <linux-mips+bounces-7024-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D489B9F25ED
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2024 20:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3193718854E8
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2024 19:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7981BD00C;
	Sun, 15 Dec 2024 19:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="IFRIP+tS"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284831925BF
	for <linux-mips@vger.kernel.org>; Sun, 15 Dec 2024 19:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734292338; cv=none; b=EzDlC8gnh/Jcy4Fzu0ixAXJMrqyJrkhi2eWbAnxH64v2JZy8AzARsXqB9IZlku/Iq18lIs1ETUeQ8i2KI7LBFMjDwc+7OYrdKY/e5RrK+a2LYTAfYlTiedk9vz6YSVYST/Uyd4fb6RY+TM8sBJtWMitUzwqBSA0+tKW52ELU2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734292338; c=relaxed/simple;
	bh=Doa3ZHZS5hYsKSUXxNuZpbWGFL6CdvgPH+9XS87d3f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLnEVZMQRCx++ZGZsia3qRAEXanwwIOLFNqfa9WDFu9ijFDI4e0cS5h0twUO0AmET2tO2eBwa8dsdUS3p5dASLwoZZfOmM+PAvVMmwDPVnM7MKFUdCN5xdC/ttHtZeAaNe7N+NbuKRW0OJrrzhscb7fkEsIzMGjY+0Ci+qYa3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=IFRIP+tS; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0CB282C03C9;
	Mon, 16 Dec 2024 08:52:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734292328;
	bh=nTCYtZ13P9ljwBtY9eDXNqiMqpRZWqdl0hM7/GJtovE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IFRIP+tSWm8TTsQTe/ni6RAngMAzk7emag+QwixjBulV9AfAGAHO9Cz68pV8dKQSp
	 JhtZ6L1oihzycfP/PbMbiFI8FIW5qFSN2Rr15tNQCn+mnB0K72pa951EP5k7S8+hn2
	 +pCvHHJH0pdr4jUz7H7xHeoYtuIJjmxDTE9Mj93FRFZn96nAIBZ5RJ38IHrnEBhy5e
	 4UU6pypOW7hFsdcATBC5jid6oxxn0lW5Rf/J0N+ieNRuWi1yxKBSeDyOf+cIHc/AY8
	 +TjQSrQurjw3o6CD1eiedOlkPH6CRUhu26KWqui7NICg0kJbWhukRJLjCFVyc1NUC3
	 Au+4vKPPtKENA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675f33670000>; Mon, 16 Dec 2024 08:52:07 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id CC88713ED7B;
	Mon, 16 Dec 2024 08:52:07 +1300 (NZDT)
Message-ID: <bd481a13-73a3-4325-8e16-ea2b2c6b0f6e@alliedtelesis.co.nz>
Date: Mon, 16 Dec 2024 08:52:07 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 1/4] dt-bindings: net: Add Realtek MDIO controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
 <20241211235342.1573926-2-chris.packham@alliedtelesis.co.nz>
 <77817fd0-cf79-4c4f-b09f-8ee9b3b136f9@lunn.ch>
 <4e59d81c-4af1-407b-a9c5-4b36eee35f96@alliedtelesis.co.nz>
 <b1117d56-87d9-46b2-b6aa-e6ca20bac322@lunn.ch>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <b1117d56-87d9-46b2-b6aa-e6ca20bac322@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675f3367 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=cu2bxl0toQUhZbLstz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Andrew,

On 14/12/2024 00:58, Andrew Lunn wrote:
> On Fri, Dec 13, 2024 at 01:56:52PM +1300, Chris Packham wrote:
>> Hi Andrew,
>>
>> On 13/12/2024 06:13, Andrew Lunn wrote:
>>>> +      realtek,smi-address:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +        description: SMI interface and address for the connected PHY
>>>> +        items:
>>>> +          - description: SMI interface number associated with the port.
>>>> +          - description: SMI address of the PHY for the port.
>>> Is the hardware really random here with its mapping of PHYs?
>>> Generally, hardware is pretty predictable, logical. I'm just wondering
>>> if this property is really required, or if it can be replaced with
>>> some logic, avoiding typ0s.
>> The hardware is pretty flexible in this respect. You can pretty arbitrarily
>> arrange your PHYs. Not all ports support the same kind of SERDES interface
>> but as far as the MDIO interface goes you can arrange things however you
>> like.
> Is there a reason to not just statically define it, maybe with a table
> in the driver? Does a DT developer actually need this flexibility?

It's a part of the board design so I think it's something that should go 
into the device tree. For example I've got 3 different boards right now 
that use different arrangements of MDIO connections to the PHYs mostly 
for ease of board layout (and one because it has different PHYs).



