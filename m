Return-Path: <linux-mips+bounces-6780-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01C9D4076
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2024 17:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D1A1F25D74
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2024 16:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B5F15532A;
	Wed, 20 Nov 2024 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="coiI4wTF"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E4D155352;
	Wed, 20 Nov 2024 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121265; cv=none; b=OqvJiu+5O1A2aBIBZj2E0LyTye4Z2hwNeuYOGFIRgCSxl7/EKbgmh9Ls711TxAffCkxIyS4gqrt+6d+WXEQzhi+SoirvNscoNWwu9qFYFZMT0fbd9ToFG+MYV9g/Uy2ZVHF4G1lpSj/39RXy++RZXpSzu78ld2/0ssUT0FGZkdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121265; c=relaxed/simple;
	bh=VzrsLqfTJq3IerOTJJA3X2/TiBFBDmIb2r9INVhSBuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OFFE5Pcsqo0v0vM6PMOjDEolRPVc6m/D02ATCSdMPNT9v5Mck5kNsDA7SgFoo50xFh3YSbB5um/VuS73iaNqdy7mvG7H8CmTHpQLzp2HqKmFTQO4rI4mF0I3KaJDFlAdbeWJ31W93NpzfD3Q5eDnXyfDILLCLpgXQg3S5ez+2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=coiI4wTF; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2B3B240009;
	Wed, 20 Nov 2024 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732121253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQuc0XZDEZvQSdCtkd0+znXPYtzIoTwh5lH+ZNXrb/g=;
	b=coiI4wTFTOHBPLzF5zokOC0sqJE7pdfEYIx4/1fWJLDYV+xJa0plE3ptCGJ4tDK8QzPDvD
	K1buu6GKaSeLqzWRFJbONAfCOHLKiicNYqp6XHp/SvYEU/h1dNUWCsgO05tqxfCSKzKm2q
	G4OnFpxuj0MwkSm59+6fQEcVyVQZ6sFcfve52UJBojEQmtQl61lbxXFB6n4lTuqZ6HiH/Z
	hah8xfekeEvTjoPglWjoHHK79Jp+RSIHvFu+ulcuLoI4PgIPsM/uWO+I3PfTs735ZGgElL
	gsbmrRIcatOgaS27y2GvnvpXQD056nZFWUx5J3NTUMrSbVkbxaxlfW76rdmWTw==
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
Subject: Re: [PATCH 1/5] dt-bindings: mips: Document mti,mips-cm
In-Reply-To: <20241119162656.GA1764849-robh@kernel.org>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
 <20241115-cluster-hci-broken-v1-1-00636800611d@bootlin.com>
 <20241119162656.GA1764849-robh@kernel.org>
Date: Wed, 20 Nov 2024 17:47:32 +0100
Message-ID: <871pz5vom3.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Rob Herring <robh@kernel.org> writes:

> On Fri, Nov 15, 2024 at 04:29:54PM +0100, Gregory CLEMENT wrote:
>> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>=20
>> Add devicetree binding documentation for MIPS Coherence Manager.
>>=20
>> gc: reg is no more mandatory
>
> The h/w either has registers or it doesn't. Can't be both ways.

The register addresses are retrieved dynamically on most
hardware. However, for some of them, retrieval was broken, requiring it
to pass through the device tree. This was the initial purpose behind
introducing this binding. In the eyequ6 case, we have a hardware issue
in a different way; the address registers are correct, but the Hardware
Cache Instruction is broken. As such, we do not want to provide a
register address, instead, notifying about this issue through a property
or compatible string.

That's the reason why I want to make the register optional; however, if
I use a dedicated compatible string, then I can just remove the 'reg'
property for this binding.

Gregory

>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 37 +++++++++++++++=
+++++++
>>  1 file changed, 37 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/D=
ocumentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..03a5ba5624a429c428ee2afc=
a73b3e29127e02f9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/mti,mips-cm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MIPS Coherence Manager
>> +
>> +description: |
>
> Don't need '|' if no formatting to preserve.
>
>> +  Defines a location of the MIPS Coherence Manager registers.
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: mti,mips-cm
>> +
>> +  reg:
>> +    description:
>> +      Base address and size of an unoccupied region in system's MMIO ad=
dress
>> +      space, which will be used to map the MIPS CM global control regis=
ters
>> +      block. It is conventionally decided by the system integrator.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    coherency-manager@1fbf8000 {
>> +      compatible =3D "mti,mips-cm";
>> +      reg =3D <0x1bde8000 0x8000>;
>> +    };
>> +...
>>=20
>> --=20
>> 2.45.2
>>=20

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

