Return-Path: <linux-mips+bounces-3149-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BD8BEB78
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 20:23:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 510EDB290FF
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 18:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FC516D30C;
	Tue,  7 May 2024 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="HvQYFbPx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ff3XKmpn"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6716D30F;
	Tue,  7 May 2024 18:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715105814; cv=none; b=alVyYEiBfV5302Ydv8pYSN5Ptp8A7WnTQ/Dg+SbYMfRXnZsG6McrkPmRGjdO1IOvdQRmazEw2/uQoFsuHWuwkXkl9cyKGal8kwJlycBht6DxG9XY4vJrIiceZgJtyFfwPnwhqzkNH5ENg4Bez4n3eXKKfk1T8QwoCmgSFusUFC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715105814; c=relaxed/simple;
	bh=tkkLup4fz7SXQkE6wLRmN85VKtFi0Vkf6N3FNeMPO4M=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Me1iubFhZA6NVS4tycyGXTJfb55AoyRmF+d1gw2K7SzC0lJFCrGWJNsWYsVKcEDyXi0IU9D2sCci+762gEiae+VCOrK89i4isv0Gq0S0ZYxD0ah16HUJ7egxThId+/kNCmHSHDbO70h+vYn9cKVNnHjeRMo1Zaz5ut07cVCAUv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=HvQYFbPx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ff3XKmpn; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 638291800101;
	Tue,  7 May 2024 14:16:51 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 07 May 2024 14:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715105811;
	 x=1715192211; bh=xkZUyYvJJx8Ghug4jhe04XLSU69l2vONZ4Ow52k89Ng=; b=
	HvQYFbPxc8YlfjpFXvw1MuSgSeGVfGjSsiV0vrW/5xGQMOoCpDmh5gyMAYAOl8Ym
	NhEmh1T3kBzfPC4hT5VG+MLJllU0q6ABk3NtyEWCORXf3kli1ZgLtrKHnM7XUQf3
	l4dW1/1flG6SOWec+rojzHejjnieogmsEGZ1AyWoBTRh8B78it2+JHD4mWjlVQIn
	jqPjaCARHkKzQXRgKhEKBnDxvTQJWw51L85xmBNitw5WN8D/SkMG62vjDpOGgtL3
	pIL/Cck6RWp60byfRHKp4cuPfnRxFORJV0iOpTFcjwxIahdmHTLkF1Ca/1J0Dwar
	wFzzVz8OnP4BDAk1SXPW+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715105811; x=
	1715192211; bh=xkZUyYvJJx8Ghug4jhe04XLSU69l2vONZ4Ow52k89Ng=; b=f
	f3XKmpnrjqrj2Fofs2mBN4Pp58nD2YBGhsz7HVta5gtiVF0jwSkrFnKtwDHwnrbn
	bNJWaaAAl1ctIjycb7GbAj6lKL2NJP+4GSUAzjzHdnfMqwhS1OcOBrqQ+/HZHlBg
	A40qVCEtSmHNzGpHOlXj19pS3BRPXC9VC2QVEuMETjDInkmBQtmShpbQFnImgzjo
	fMhrEkWmFrwrhjCi9YoU64eUNbzou74/VWMFZOmhGKFGyqJtsS7uEJ+j4+9f7Wbb
	zWI/CGiyp15yEVMKtDQ6txbSveOOngph5MhTh+/c2DN1u7vvIbmvq0D0Gen2w9tE
	FjF+8dgZVeqOOIUUVq7Yw==
X-ME-Sender: <xms:EnA6ZjhgEbhjhOaTsBpa1trjh01D9uujWdp9FOWqtPQyg_kO7eZCMQ>
    <xme:EnA6ZgBkbofPe7FeGJ76JCvwB8c0Ebzyu1zOwWUXbO8sGJ8BHpP7K4vMMDvo6RM_O
    rDkBFSq7Vekkwt21Lc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvkedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepjedutdeuhfdvjeevgfehudeitdehiefgveelheff
    uddulefhkeeihfehudehgfevnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgr
    gihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:EnA6ZjHsOP8reLn_5GRUUjNM8x-hVbOFx5O2GRPkZ3ZPn5DM2UYyPw>
    <xmx:EnA6ZgQDgE_x1e2R-JJBWr2mTSYYemsGE8dIt6QiijgZ8FpNXKTcpg>
    <xmx:EnA6ZgylKlh2ajJTVijgDmL5GbzRkohoN0YtOGQtqv86sjACZebceg>
    <xmx:EnA6Zm6qZ-pcWPEiKrbH5tAGAeXLXtkcjLjlgoHq5rdC-gJcUII8eg>
    <xmx:EnA6ZvlCL922gQQb2JU6kYwWLtk3jL6IoXeCnneu4bzu6-fUMZ-VKmLM>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3ECE536A0074; Tue,  7 May 2024 14:16:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <fbb4b8e2-edf4-4b4e-8b71-154a09f24ccd@app.fastmail.com>
In-Reply-To: <20240507-jokester-antelope-808b21b957e6@spud>
References: <20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.com>
 <20240507-cm_probe-v1-4-11dbfd598f3c@flygoat.com>
 <20240507-jokester-antelope-808b21b957e6@spud>
Date: Tue, 07 May 2024 19:16:25 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: mips: Document mti,mips-cm
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=887=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=885:50=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, May 07, 2024 at 10:01:52AM +0100, Jiaxun Yang wrote:
>> Add devicetree binding documentation for MIPS Coherence Manager.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  .../devicetree/bindings/mips/mips-cm.yaml          | 37 ++++++++++++=
++++++++++
>>  1 file changed, 37 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mips/mips-cm.yaml b/Do=
cumentation/devicetree/bindings/mips/mips-cm.yaml
>> new file mode 100644
>> index 000000000000..b92b008d7758
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/mips-cm.yaml
Hi Cornor,

Thanks for your comments.

>
> Filename matching the compatible please.
Ok.

>
>> @@ -0,0 +1,37 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/mips-cm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MIPS Coherence Manager
>> +
>> +description: |
>> +  Defines a location of the MIPS Coherence Manager registers.
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: mti,mips-cm
>
> Is it actually only available on mips? Google seems to report there
> being Coherence Managers on their RISC-V offerings too.

I think for MIPS's RISC-V system, it is only used by SBI and transparent
to kernel, so it won't present in DT.=20

Register fields for RISC-V system is totally different with MIPS one, and
there is no driver to be reused. In MIPS system CM code is highly coupled
with arch code, so for RISC-V if we want to expose it to kernel we'll ne=
ed
a new set of driver and a new binding.

>
>> +  reg:
>> +    description: |
>
> The | isn't needed, there's no formatting to preserve.
Ok.

>
>> +      Base address and size of an unoccupied memory region, which wi=
ll be
>> +      used to map the MIPS CM registers block.
>
> This sounds like it should actually be a memory-region that references
> some reserved memory, not a reg, given the description. I think the
> commit message here is lacking any information about what the intentio=
ns
> are for this binding.
So it's actually a register block that can be remapped to anywhere in
MMIO address space. DeviceTree usually passes firmware's mapping location
to kernel.

There are some other similar bindings like mti,mips-cdmm and mti,mips-cp=
c,
I just copied phraseology from them, should I try to explain it more her=
e?

>
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    cm@1fbf8000 {
>
> And a generic node name here please. I actually don't quite know what =
to
> suggest though, but "coherency-manager" would likely be better than
> "cm".
Ok

Thanks!
- Jiaxun
>
> Thanks,
> Conor.
>
>> +      compatible =3D "mti,mips-cm";
>> +      reg =3D <0x1bde8000 0x8000>;
>> +    };
>> +...
>>=20
>> --=20
>> 2.34.1
>>=20
>
> =E9=99=84=E4=BB=B6:
> * signature.asc

--=20
- Jiaxun

