Return-Path: <linux-mips+bounces-7629-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A462FA20E6D
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 17:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1DE73A49FF
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 16:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79071D63D6;
	Tue, 28 Jan 2025 16:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OSv+uuah"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C02A1AA1FE;
	Tue, 28 Jan 2025 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738081412; cv=none; b=nEJbGjgBZ3u6QQGIG6vvI62UrCIhu3VGJvGHJbKVUhrq3EIks/RodP43kJ9UrF0rds0x/s/2lIfKw4aLuCYhkfB/hBCIgXjSRGZ8TTM814yIiOtmQSFV6alcPC/5ypyjW6dmeuImRM7at4m7wlaEO7XS2/mFopfWsAEZMy6gthQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738081412; c=relaxed/simple;
	bh=08Gs03T39FQeLfYc4DMLMcovI+nRd3HZQ+wnQ3AVNSc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WwkxV6x3BH4ybW4L7+8nCvkbyw3pp5TvGghdH4b9pM/UsSMNZBM9VHOwOdIp6nDQGEPCYFTdmj+5Rwdlziq1H3UUTcvAz4aVs/Uzy/lGEnsilACbI3g8RNEkT/aCuLxd1EQvoPY7UL+ctk+yK6EBvLzmB+3u5mqfui6I62/6hg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OSv+uuah; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DCF7FF802;
	Tue, 28 Jan 2025 16:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738081408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UISrEYUv5egLukU1TttywZkjVzOvJAxp/VRzu80B0B0=;
	b=OSv+uuahAzEa1ARoziqtWPzIrM/mDRHukpcKZdaEaFQEBNtI840FpNF2IRIMqr3Zg6Qn74
	i4hwXVPesslIrd/eYmIxv0tfLATja8RAqrj9f0X7YvVlErR9VWbhHGKaXOTD3/ir6uVo1q
	LTvJaOrfc12o2Y2o8oXhBJ0jqWt8uJ1OkGHHNifgKCye8PhHGPPUDlf+yWZjEXCPYPhbKp
	7GsZ4jjgziLfNhwj2JmaUk25SFxCbdIv/FkDHVdamGaqCFUsrk9T9MoruVK5T7AThNEz7t
	92IiDVlMICKuTsrTO0ALtcjWOXkb5PZjSHOMyVP9rfU+yPUz79/AjXjwQHZ3Xg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
In-Reply-To: <bf08785b-9963-4539-92ef-b73c3abe8c19@app.fastmail.com>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
 <afa2e874-c078-4c3e-b485-d948a0bb6a6f@app.fastmail.com>
 <CAL_JsqKXYruNn+MtxbvCCWU2OmqeV-uAyyzN+F-ppSJVscr91w@mail.gmail.com>
 <bf08785b-9963-4539-92ef-b73c3abe8c19@app.fastmail.com>
Date: Tue, 28 Jan 2025 17:23:26 +0100
Message-ID: <87tt9iucu9.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

> =E5=9C=A82025=E5=B9=B41=E6=9C=8827=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=
=E5=8D=8810:07=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
>> On Mon, Jan 27, 2025 at 3:43=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat=
.com> wrote:
>>>
>>>
>>>
>>> =E5=9C=A82025=E5=B9=B41=E6=9C=8823=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=
=E5=8D=8811:01=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>> > The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
>>> > complete, but in reality it's not the case. It also incorrectly
>>> > indicates that Hardware Cache Initialization is supported. This new
>>> > compatible string allows warning about this broken feature that cannot
>>> > be detected at runtime.
>>> >
>>> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>>> > ---
>>> >  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 +++++++=
++++-
>>> >  1 file changed, 11 insertions(+), 1 deletion(-)
>>> >
>>> > diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>>> > b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>>> > index
>>> > 4324b2306535f1bf66c44b1f96be9094ee282041..d129d6382847768dc026336d8d2=
c7328b6b81f9b
>>> > 100644
>>> > --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>>> > +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>>> > @@ -19,7 +19,12 @@ maintainers:
>>> >
>>> >  properties:
>>> >    compatible:
>>> > -    const: mti,mips-cm
>>> > +    oneOf:
>>> > +      - const: mti,mips-cm
>>> > +      - const: mobileye,eyeq6-cm
>>> > +        description:
>>> > +          On EyeQ6 the HCI (Hardware Cache Initialization) informati=
on for
>>> > +          the L2 cache in multi-cluster configuration is broken.
>>> >
>>> >    reg:
>>> >      description:
>>> > @@ -44,4 +49,9 @@ examples:
>>> >        compatible =3D "mti,mips-cm";
>>> >        reg =3D <0x1bde8000 0x8000>;
>>> >      };
>>> > +
>>> > +  - |
>>> > +    coherency-manager {
>>> > +      compatible =3D "mobileye,eyeq6-cm";
>>>
>>> I think =E2=80=9Cmobileye,eyeq6-cm=E2=80=9D, =E2=80=9Cmti,mips-cm=E2=80=
=9D would describe the hardware better as eyeq6=E2=80=99s CM is just a spec=
ial variant of mips-cm.
>>
>> Is s/w that only understands =E2=80=9Cmti,mips-cm=E2=80=9D useful on eye=
q6 chip? If
>> so, I agree. If not, then a fallback compatible is not useful.
>
> Yes, mobileye,eyeq6-cm only enable an additional bug workaround in softwa=
re.
>

Having "mti,mips-cm" is not useful for the EyeQ6 chip. On the EyeQ6, we
obtain all relevant information related to CM dynamically without
needing this compatible string.

> The programming interfaces and so on remains unchanged.

Even without a compatible string, we are able to utilize the CM. At
present, there is no node in the device tree, and apart from the
hardware being faulty, we do not need it.

>
> Also other firmware components like U-Boot doesn=E2=80=99t need to be awa=
re of
> eyeq6 variant.

It's the same for the firmware; they don't need to have "mti, mips-cm"
information, as they can retrieve all they need dynamically.

Gregory

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

