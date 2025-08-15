Return-Path: <linux-mips+bounces-10339-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB18AB2843B
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 18:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40643B80CF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 16:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155E731812D;
	Fri, 15 Aug 2025 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="V/LjISEJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFF2311C2B
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755276392; cv=none; b=p0MAmOaU+SGDN74D787IUs5vzBq3JKefAYuAHTErFQy5ZHx8Qcx868R6SJ0d8QYHIqUMIfd2cVSmXp/88NXSoau1EiMFHk9L3H0974fSrdgLA7AA4AQKfYb2OSyH3NIKu1mis/3L94CN2tTYCvWEJ0zSdaM/7Dyq5c0BR+9VKhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755276392; c=relaxed/simple;
	bh=ZMQUUtKKZEy02I2U8rpU5vitLMDGs+V7Tu1psSRxLLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIAK3LcJ/VId649Pj7xK0swpqS91U8MgJDHDakMjTYzngl+gNX4ATlziEkiIgRYlMm6+BYH7nHbBOSiuonct5VlzHCiFakoUhUZvzBOYCc3oEvoYoaJpu/kptwDo53krqVFNnZTSATyD+g/Zq+n6IueXp8msxluADuKjcyd+EzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=V/LjISEJ; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 28198 invoked from network); 15 Aug 2025 18:46:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755276382; bh=0bTMlDK1C37UrfQ+FZ8NX/ltUHQInw8/KsmJgKUePj0=;
          h=Subject:To:Cc:From;
          b=V/LjISEJhMEwrPHVEVP9jW4FldaHBdnvj0fV9ymFiWLTKqpGnxOgy2mbq7E/79uDa
           8IG8yDrKPZ9BmBO08cU/IbHv3mCMxyAmsGYdULdv4zagwj2E+ppZuIUxQvlBMSSvbc
           w0OcauHBWgPW+DSKdvS6uOk4XLfDUs3HC8n8gseBfYjgsK67sXMaBkTVBR8Gyp9fFt
           jjkImjIv/u6rGGnT4gLheOuGszFzHcBkjhSibEOESwWitlo/XUDH72XIaMrlFtaMBU
           RXhwZgSQELMT674IR82iaJzFun3zg2Mnyry5dyFZ96y+h523dmuRoyqPZ/RmYh6RIj
           z3OcKhDOIIpQw==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO [192.168.3.229]) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <conor@kernel.org>; 15 Aug 2025 18:46:21 +0200
Message-ID: <ce607448-0936-4791-976e-8e57dbd2706f@wp.pl>
Date: Fri, 15 Aug 2025 18:46:21 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mips: lantiq: Document lantiq dcdc
 binding
To: Conor Dooley <conor@kernel.org>
Cc: y@spud.smtp.subspace.kernel.org, tsbogend@alpha.franken.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250814082705.3183231-1-olek2@wp.pl>
 <20250814-vocation-viscous-b54bc343e8c6@spud>
 <e327b6ce-11ad-4909-9c6f-cd833b44e15f@wp.pl>
 <20250815-kangaroo-isolating-7e1a366be8d4@spud>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20250815-kangaroo-isolating-7e1a366be8d4@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: b9591ced6d11044ccf86ea215e850a9e
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000002 [gRGR]                               


On 8/15/25 17:48, Conor Dooley wrote:
> On Fri, Aug 15, 2025 at 12:13:41PM +0200, Aleksander Jan Bajkowski wrote:
>> Hi Conor,
>>
>> On 8/14/25 22:48, Conor Dooley wrote:
>>> On Thu, Aug 14, 2025 at 10:26:56AM +0200, Aleksander Jan Bajkowski wrote:
>>>> Lantiq DCDC is a voltage converter with a voltage sensor.
>>>>
>>>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>>>> ---
>>>>    .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 32 +++++++++++++++++++
>>>>    1 file changed, 32 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
>>>> new file mode 100644
>>>> index 000000000000..5648b9676b3c
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
>>>> @@ -0,0 +1,32 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dcdc-xrx200.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Lantiq DCDC (DC-DC converter with voltage sensor)
>>>> +
>>>> +maintainers:
>>>> +  - Aleksander Jan Bajkowski <olek2@wp.pl>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - enum:
>>>> +          - lantiq,dcdc-xrx200
>>> What is "xrx2000" in this context?
>>
>> “xrx200” is one of the generations of Lantiq SoCs. It includes four part
>> numbers
>> with the same memory map. The other generations are amazon-se, danube,
>> ARX100,
>> GRX100, xRX200, xRX300, xRX330. These correspond to the internal code names:
>> ase,
>> danube, ar9, gr9, vr9, ar10, grx390.
> And the dc-dc converter is part of the SoC?
> Either way, you've got this file in the wrong location probably, dc-dc
> converters are usually under the regulator directory.


The converter is inside the SoC. This driver only reads the voltage and
prints it at startup. The voltage supplied by this converter powers one
of the power domains. It powers the CPU core and probably other
peripherals as well. The voltage is programmed by the bootloader and
Linux never touches it.


