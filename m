Return-Path: <linux-mips+bounces-7554-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C17A16EE8
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 16:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 811623A4AB7
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 15:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732501E0DD9;
	Mon, 20 Jan 2025 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fFPQW4CA"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670031B982E;
	Mon, 20 Jan 2025 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385303; cv=none; b=Bc4NFATKtzZga5QJvXbXQxJ85rldef2/WC1HU7IEy4hK6GfBn31JyRRN6mx+54cO1vOEZuFymcSiXQMXknZoMH6pJ6+s6VhSbL+QdfW5cGqa+VjoRZDa/WqUd4MBh5JX3FR8eiqvBps/Ux9kWDk9GKZ1JK/q3/1gIgyZw0vFyTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385303; c=relaxed/simple;
	bh=fUZy/f3iv+e7r7B0v5YQupln/qBLiJ/ZjUYAwryee1k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cz3ZQNKMV4zGOpcwsp71NcxI+/H6/nQ69sUvSbhjBo2TScjV+L2Iu7nHM3nJGkswfTkzNiOwL2UT5X39VHpnDigW/ymF8bM/V3HXBOc8hS6p2uwxjTJQq6nz+6X9PpJQG9Gy4Oyty8WG9hYbvW2MRSYFkRAUsZJM+NjsDxK19+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fFPQW4CA; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD968E0002;
	Mon, 20 Jan 2025 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737385293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zKhxk7+Fda/Wv8tla9DbvJyAAOL1sQ8gUN049EB9HcU=;
	b=fFPQW4CAdVMpPhOmELtha/GLUMMpELhtFBz3W6kgFPsdNPErYrRy8lXjhvla2cFsK2+2vw
	1mw5YMqbwMkZGxJUVMvD06qJEhc0BH3wyAm8JTnUfpvKwhLcM58TLUpNrG6Fkk1bs2QfH+
	yHwA5XeDhK1ccSdTqrdEAd5ibP1kyBE812kA/iK2WkjQm2AjQp//Sc0UIHCkbHSOu7k8Vf
	UXGz9u/jaERH9sIk7NK4MaV7jlKbSe+foBTkoSQR/iS4Xo7gGMV06E3+F8S4Xe352TxqgX
	sMKCv85FgjJI5FVNqzXEhbXFemrYH2GTsYmyMbV7a9OpgAbKUgBQ6Tq8muohLg==
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
Subject: Re: [PATCH v2 1/5] dt-bindings: mips: Document mti,mips-cm
In-Reply-To: <20250116153110.GA2495012-robh@kernel.org>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-1-fc52cfb7a19e@bootlin.com>
 <20250116153110.GA2495012-robh@kernel.org>
Date: Mon, 20 Jan 2025 16:01:32 +0100
Message-ID: <87r04xv8ab.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi Rob,

> On Thu, Jan 16, 2025 at 11:59:19AM +0100, Gregory CLEMENT wrote:
>> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>=20
>> Add devicetree binding documentation for MIPS Coherence Manager.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 +++++++++++++++=
+++++++
>>  1 file changed, 38 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/D=
ocumentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..9f500804737d23e19f50a932=
6168686c05d3a54e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> @@ -0,0 +1,38 @@
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
> Don't need '|'.

OK

>
>> +  Defines a location of the MIPS Coherence Manager registers.
>
> Say what the h/w block does.

Managing coherency ? :)

However, more seriously, I can provide additional details based on what
I have written in my previous emails.

>
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: mti,mips-cm
>
> Convince me a genericish compatible is okay here.

well this componenant is really named Coherence Manager in the MIPS
related document. For example in p4 of
https://training.mips.com/cps_mips/PDF/CPS_Introduction.pdf and also
https://training.mips.com/cps_mips/PDF/Coherency_Manager.pdf.


>
>> +
>> +  reg:
>> +    description:
>> +      Base address and size of an unoccupied region in system's MMIO ad=
dress
>> +      space, which will be used to map the MIPS CM global control regis=
ters
>> +      block. It is conventionally decided by the system integrator.
>
> What is decided? The address? That's not relevant.

Since reusing the description from Jiaxun, I'm unable to speak on his
behalf. From my perspective, it simply implies that the value to be
written should originate from the datasheet of the System-on-Chip (SoC),
as the address is is specific to the integration into a given
SoC.

Gregory

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

