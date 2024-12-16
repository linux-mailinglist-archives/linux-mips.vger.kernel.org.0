Return-Path: <linux-mips+bounces-7054-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7A9F39F4
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 20:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A991883272
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 19:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765B3208997;
	Mon, 16 Dec 2024 19:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="PWHDhwcC"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BAB208964
	for <linux-mips@vger.kernel.org>; Mon, 16 Dec 2024 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377792; cv=none; b=mZvZa3RnEAeJuY2HinAZ1uM8w8JstxaaDwnsIbul3+PFXGnFeDxNsScYxYTKM/BYJwDQ91QtHDmoH6TwM4NcvBEsk+5kiLpLj1KT1Jis59a8BwtFZ5uRYaOvGs3T5W80JfOOAg1aOqDDSeNb5Ci+RhiSqpYtzbAqQajHyAZmlBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377792; c=relaxed/simple;
	bh=YZLMeNgthh1VNnTReIeJy7kxf/ahYTPcT/OdYESyZqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmuGKQ0/Ypg4iuzrd3LCXL7vIdQrs1lkn/P4kvhH6G3nAW0yz3lRET9fVUDfNCxbT4hMY0Oy8h1T71WUgfyESacSc3z4HNmFx0x1TnzESoQKTli9MzeZ/fYqz7h9wf9kK8vFPj8n+utF1oWsfPdcRi2CIWTqYUBsnaYSqI0BPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=PWHDhwcC; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B09D02C04F5;
	Tue, 17 Dec 2024 08:36:26 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734377786;
	bh=oGHd2e5loy7aLsZGhGhSVFEKNjGf7W5e8Wj2P+Hklcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PWHDhwcC9JRgpFtMicBDx1w8jJ5ZOyXKvSUG0MuGEWbFe0EfiLPjNOiQ6hjUS58Yz
	 7ER4xNBfkBkHy5a0n43RBQ4sCsjP85ijGNHN/47EqC6xBpdi5kYOCsv/ApzI4dcJym
	 mOPBbu8w+aK693OK8aM6cDUtQy4M5L2UUPPSM9/0tpi1JMvBd4kt8PL3yrTlFgLo8+
	 4qBNoY+drkfTQsd/YQVJDkYp2i7ngNHdyQ2UkLAIWzJ9v2mmr7GUVw/px5KxGvWER/
	 gJa76ddOrt0TPbjV98U3QkNB08G1jIJ0hkdT7ImLaZo3TZYh1kE8aTXKF3VZ0G4JFA
	 ak216dxV1NaaQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6760813a0000>; Tue, 17 Dec 2024 08:36:26 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8F9FD13ED95;
	Tue, 17 Dec 2024 08:36:26 +1300 (NZDT)
Message-ID: <596c86d8-1cb3-434b-88d6-17ffe0fc9df2@alliedtelesis.co.nz>
Date: Tue, 17 Dec 2024 08:36:26 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: Add MDIO interface to
 rtl9301-switch
To: Conor Dooley <conor@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, tsbogend@alpha.franken.de,
 hkallweit1@gmail.com, linux@armlinux.org.uk, markus.stockhausen@gmx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mips@vger.kernel.org
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-3-chris.packham@alliedtelesis.co.nz>
 <20241216-neurosis-untagged-86622f8e2163@spud>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20241216-neurosis-untagged-86622f8e2163@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=6760813a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=XYAwZIGsAAAA:8 a=1OZ0I8y61a4uFxY9wqQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GbR9vSjRXMx6H1Y7X1w4:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 17/12/2024 07:53, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 04:13:44PM +1300, Chris Packham wrote:
>> The MDIO controller is part of the switch on the RTL9300 family of
>> devices. Add a $ref to the mfd binding for these devices.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>>
>> Notes:
>>      Changes in v2:
>>      - None
>>
>>   .../bindings/mfd/realtek,rtl9301-switch.yaml      | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
>> index f053303ab1e6..eeb08e7435fa 100644
>> --- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
>> @@ -41,6 +41,9 @@ patternProperties:
>>     'i2c@[0-9a-f]+$':
>>       $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
>>   
>> +  'mdio@[0-9a-f]+$':
>> +    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -110,5 +113,17 @@ examples:
>>             };
>>           };
>>         };
>> +
>> +      mdio0: mdio@ca00 {
> Label here is unused, but that alone isn't worth a respin.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I'll be re-spinning the series for other reasons so I'll fix this up and 
add your ack while I'm at it.

>
>> +        compatible = "realtek,rtl9301-mdio";
>> +        reg = <0xca00 0x200>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        ethernet-phy@0 {
>> +          reg = <0>;
>> +          realtek,smi-address = <0 1>;
>> +        };
>> +      };
>>       };
>>   
>> -- 
>> 2.47.1
>>

