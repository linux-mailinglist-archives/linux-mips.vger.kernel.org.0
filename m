Return-Path: <linux-mips+bounces-7496-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A3A14C4C
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2025 10:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E326188AF02
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2025 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57771F91FB;
	Fri, 17 Jan 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bFAPJnyj"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF73A1F5616;
	Fri, 17 Jan 2025 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737107166; cv=none; b=dc6tU4uHspB4kVPJH5wG6ZusC2A6MvI0zcSW1AqR3o3N4SXKQq1cbY8fLMtw0xlQnxEklbJJeg5S1IPmLQ3yOr5CAcYJrJykwKkN+wrmxY0rshIpbeIFTEwh6QSeOghp+Tx1RrRg6BFwNrM/ET4tmovFyuggcArRjmLsXfLG43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737107166; c=relaxed/simple;
	bh=bAoIxUM0L0RDKibJAm9TGYfT+Las5cv+kN3FsOvGBDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hmqzUJ+3heguEy1VbtnyP9JOe6OX91u94Iekbbw0rWPhneXLx0M4hM9VOVGpjm52wFHL+uKhOV+hXRkFq137K360zUvszVM5HNOONhHeMgXE6Y95EjYNtEBmiPrR7BeM7O02y7fdwPdpKPantymLF+vB4fjuquyzqRPiIjfn1PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bFAPJnyj; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7398F20003;
	Fri, 17 Jan 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737107161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9Hngjv+3mSnco4Ydj/7waQFXt+nhZaE1ZO+t5GpHgQ=;
	b=bFAPJnyj6LbipV24+oprgOr1UHyDRUmOTj3eaFEgk4i20QMAhuzfH+p/+1UzD+uY5zigAu
	nNJsHvpL9fXfs51oaqm2jVi6ae5JVimk026R5eyzjGpLmyccoNPOZ63Hh3bogZr9AlAD4f
	YznAiPBOb7INxCvYvwvP+OlAU0TyQSSMFSAXsvr+vFDhLIXpScp5Mn/+tE7mPIegUJOU7W
	JeYOVp8iKKUiyc381oAUqcpknSuBeR9FDQC2B4foPeXkk/VGLfBmlLMmZ19bv6TcqpU9v5
	YLUEUhv1sCm195mLLDvZo4X5+NeK5ANX4SCnCHAfif+o85ROZeRm0Bg/VmrKWw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
In-Reply-To: <20250116153637.GA2567996-robh@kernel.org>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-2-fc52cfb7a19e@bootlin.com>
 <20250116153637.GA2567996-robh@kernel.org>
Date: Fri, 17 Jan 2025 10:46:00 +0100
Message-ID: <87a5bpwz6v.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Rob,

> On Thu, Jan 16, 2025 at 11:59:20AM +0100, Gregory CLEMENT wrote:
>> The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
>> complete, but in reality it's not the case. It also incorrectly
>> indicates that Hardware Cache Initialization is supported. This new
>> compatible string allows warning about this broken feature that cannot
>> be detected at runtime.
>>=20
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 24 +++++++++++++++=
+++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/D=
ocumentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> index 9f500804737d23e19f50a9326168686c05d3a54e..4713673f0cfc7785bb183917=
ee382a815ebfe9e1 100644
>> --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> @@ -14,7 +14,12 @@ maintainers:
>>=20=20
>>  properties:
>>    compatible:
>> -    const: mti,mips-cm
>> +    oneOf:
>> +      - const: mti,mips-cm
>> +      - const: mti,eyeq6-cm
>
> Being a mobileye device, the vendor prefix should be mobileye.

I chose mti because actually this block is part of the I6500 and
provided as is by MIPS.

>
>> +        description:
>> +          On EyeQ6 the HCI (Hardware Cache Initialization) information =
for
>> +          the L2 cache in multi-cluster configuration is broken.
>>=20=20
>>    reg:
>>      description:
>> @@ -25,14 +30,29 @@ properties:
>>=20=20
>>  required:
>>    - compatible
>> -  - reg
>>=20=20
>>  additionalProperties: false
>>=20=20
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: mti,eyeq6-cm
>> +then:
>> +  properties:
>> +    reg: false
>> +else:
>> +  required:
>> +    - reg
>
> How does one access this block with no registers? Is this some subset of=
=20
> a larger block? If so, need to define that block first.

CM stands for Coherence Manager. This component is mandatory when you
want to do SMP across MIPS core. This is part of the MIPS architecture,
and the address of the CM is provided by the Coprocessor 0.

"CP0 is incorporated on the CPU chip and supports the virtual memory
system and exception handling. CP0 is also referred to as the System
Control Coprocessor."

So to summarize, in a functional system, this information doesn't have
to be exposed through the device tree, as it is available at runtime
from any MIPS CPU.

>
> These 2 blocks don't look related and the only property shared is=20
> 'compatible'. This should be a separate doc.

As mentioned in the cover letter, I reused the work from Jiaxun, who
needed to deal with bogus CM but in a different way. In his use case,
the issue with the CM was that the address in CP0 was wrong. In my case,
this address is correct; it is only one piece of information reported by
the CM that is wrong. I don't mind creating a separate doc if you
still think it is the right thing to do.

Gregory

>
> Rob

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

