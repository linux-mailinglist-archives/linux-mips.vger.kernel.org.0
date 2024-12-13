Return-Path: <linux-mips+bounces-6991-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD99F0153
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 01:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACB88188D45C
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 00:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B478F5E;
	Fri, 13 Dec 2024 00:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="BDvim4X5"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7E6FC3
	for <linux-mips@vger.kernel.org>; Fri, 13 Dec 2024 00:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051416; cv=none; b=oJnu7nyKohhfeoPHCR5ecArNiK5f6yWjxysIE6hHKb+dWX9TKUoJQMV1srBbwRbEGJIy6dEsiYpDxzayyu2kFd6cab3/0m2whvImvefCcUZWqhKnac7gfMbWjlhk+SzJDOCb/Yieu5eyhcyC0bIMhz+Ii0oa0a0M1nZYpm6ApvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051416; c=relaxed/simple;
	bh=lE4OkwBelurMptvmcY/6y2DdUWbd7pBfGA3VIY5PWrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IL9zBbzgwQduu7j4ZJrxWbgjLq2ohg8K3dxUAoI6TRxz9jQTJVp3tnt2MV2PZ3lLKMQuf21wEKIpZP8yd+/bMFrVoOeiUSwLGtIVYP4j7oEC8RA5b9dqPm9CeDjn8Ljjnu4AbCjlJUYk7bF6anGOIxGJADmZkkePIWdOsu17QlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=BDvim4X5; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C47F12C02A5;
	Fri, 13 Dec 2024 13:56:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734051412;
	bh=/odJjcyJL2DstNY5HSpLOdOybgMbljeuHxfxmzmyRpc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BDvim4X5U/yVvPZkC0RMjqjLF54XjeZHHdvRZHXIHWFAsjHJYdeZ6aCKLR4odI1s2
	 akPT+oCmOjjuxfSxqoXNZ5h3pZY5aX6Bn3XC6X3OOBOmcO9Bf8AEoBcn9U2pGmqooT
	 iipNaMQ4XWWuqmdfXK+3D22cDyVFzlzE+YwBYSFuquThDN/tTujIRrDujtansddwxN
	 qbg4kloD4HJ+3/F87GWaf8A4xqbhg0W0oxQxZmtQ+9hpyr8tu00n3uUpPxFMkXLyZv
	 XUyG1Z3UnYDukYgCtTx6PnJF6hXASAbkUC91vOa7AGuGYIatvC3tE8OuaS1LNgnUT7
	 MK2kPNRAn0hog==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675b86540000>; Fri, 13 Dec 2024 13:56:52 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 90A1913EE00;
	Fri, 13 Dec 2024 13:56:52 +1300 (NZDT)
Message-ID: <4e59d81c-4af1-407b-a9c5-4b36eee35f96@alliedtelesis.co.nz>
Date: Fri, 13 Dec 2024 13:56:52 +1300
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
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <77817fd0-cf79-4c4f-b09f-8ee9b3b136f9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675b8654 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=wf7Vyfd0vKoYPf0-8k8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Andrew,

On 13/12/2024 06:13, Andrew Lunn wrote:
>> +      realtek,smi-address:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description: SMI interface and address for the connected PHY
>> +        items:
>> +          - description: SMI interface number associated with the port.
>> +          - description: SMI address of the PHY for the port.
> Is the hardware really random here with its mapping of PHYs?
> Generally, hardware is pretty predictable, logical. I'm just wondering
> if this property is really required, or if it can be replaced with
> some logic, avoiding typ0s.

The hardware is pretty flexible in this respect. You can pretty 
arbitrarily arrange your PHYs. Not all ports support the same kind of 
SERDES interface but as far as the MDIO interface goes you can arrange 
things however you like.


