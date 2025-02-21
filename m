Return-Path: <linux-mips+bounces-7887-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 314BDA3F0F2
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 10:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC8F91884C69
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 09:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C222045B0;
	Fri, 21 Feb 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oRbDChC6"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F03F201246;
	Fri, 21 Feb 2025 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131132; cv=none; b=IMFbciEe+BQcMHfyzr3gz8TF8Msypbxgnb1TyIBprvynNRMBKacQH5pcelO41rTu0FwNJ/B81aXk3PAOf3Qg3bcu24mxI26b1sLdKSn/4T3AakJUzpQfEqRZxh+QjvcDjTrL/qYBocnZ6qm6qE6WA1xbOqGRaRhuTA0Uh8RiZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131132; c=relaxed/simple;
	bh=/KcGc01eSsUrerPGVPWSAYZtIfEjNnei9zlH7mBhz24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hQ2Gdys1FbPvwh0LuNv5D/+fkwKFZfi8iukOZtkxVQfhyCTWhpeg17xc1DtZG+C5SWbsaXFLEbNHk4BXtr5Tu7WsvJjtFdhAk4wbMBqjSelPos9rPnvoauK6hcF+yiiF7bGjlFowJRnS0npdBHEB75LRxjQKi6Uwi/R8SjrXF8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oRbDChC6; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DBEB43299;
	Fri, 21 Feb 2025 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740131122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UpG//t1awC6TTYgGgCG1xSqQY/MSKf51OZV8VicRJJw=;
	b=oRbDChC6bFmowtU0JHKSoS4k/X7btTZpHcZ8WaDUz442bJdEC9M9nY5L1e0roqJh/FCl7q
	feEJmVov/RmYcssEDj9U0icJtAxEz8rlJHUF+9MeL5X5VErjTkJVh/e9LfqncMHDh08d3h
	dt2/pSgtDxz5LTHXOFl29bNKYPWhuHWUBbS0qDq1UdT+LK6A6zJUqE4gClKK639bpcA78M
	L5nsCrV3tZ3nvI1TljibJKR2Y8dVpozUtdQvDIjq6ry/3YRE8OL+Aa+J2vnEBl5HL2KcLN
	LUtyBX15132MvBzMSIHCVZ9MxNSTelYGtBsN4QNK0y2clxl8LP5FwfUCePo7GQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
In-Reply-To: <Z7hJVnJSg3C9lmLY@alpha.franken.de>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
 <afa2e874-c078-4c3e-b485-d948a0bb6a6f@app.fastmail.com>
 <CAL_JsqKXYruNn+MtxbvCCWU2OmqeV-uAyyzN+F-ppSJVscr91w@mail.gmail.com>
 <bf08785b-9963-4539-92ef-b73c3abe8c19@app.fastmail.com>
 <87tt9iucu9.fsf@BLaptop.bootlin.com> <Z7hJVnJSg3C9lmLY@alpha.franken.de>
Date: Fri, 21 Feb 2025 10:45:21 +0100
Message-ID: <877c5jskb2.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeileejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedukeeitgemfhgvsgefmegtfhegtdemsgdtrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmedukeeitgemfhgvsgefmegtfhegtdemsgdtrgejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehrohgsh
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrihhkrghlohesghhmrghilhdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomh
X-GND-Sasl: gregory.clement@bootlin.com

Hello Thomas,

> On Tue, Jan 28, 2025 at 05:23:26PM +0100, Gregory CLEMENT wrote:
>> > =E5=9C=A82025=E5=B9=B41=E6=9C=8827=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=
=8B=E5=8D=8810:07=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
>> >> On Mon, Jan 27, 2025 at 3:43=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flyg=
oat.com> wrote:
>> >>>
>> >>>
>> >>>
>> >>> =E5=9C=A82025=E5=B9=B41=E6=9C=8823=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=
=8A=E5=8D=8811:01=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> >>> > The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization=
 is
>> >>> > complete, but in reality it's not the case. It also incorrectly
>> >>> > indicates that Hardware Cache Initialization is supported. This new
>> >>> > compatible string allows warning about this broken feature that ca=
nnot
>> >>> > be detected at runtime.
>> >>> >
>> >>> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> >>> > ---
>> >>> >  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 ++++=
+++++++-
>> >>> >  1 file changed, 11 insertions(+), 1 deletion(-)
>> >>> >
>> >>> > diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.ya=
ml
>> >>> > b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> >>> > index
>> >>> > 4324b2306535f1bf66c44b1f96be9094ee282041..d129d6382847768dc026336d=
8d2c7328b6b81f9b
>> >>> > 100644
>> >>> > --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> >>> > +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> >>> > @@ -19,7 +19,12 @@ maintainers:
>> >>> >
>> >>> >  properties:
>> >>> >    compatible:
>> >>> > -    const: mti,mips-cm
>> >>> > +    oneOf:
>> >>> > +      - const: mti,mips-cm
>> >>> > +      - const: mobileye,eyeq6-cm
>> >>> > +        description:
>> >>> > +          On EyeQ6 the HCI (Hardware Cache Initialization) inform=
ation for
>> >>> > +          the L2 cache in multi-cluster configuration is broken.
>> >>> >
>> >>> >    reg:
>> >>> >      description:
>> >>> > @@ -44,4 +49,9 @@ examples:
>> >>> >        compatible =3D "mti,mips-cm";
>> >>> >        reg =3D <0x1bde8000 0x8000>;
>> >>> >      };
>> >>> > +
>> >>> > +  - |
>> >>> > +    coherency-manager {
>> >>> > +      compatible =3D "mobileye,eyeq6-cm";
>> >>>
>> >>> I think =E2=80=9Cmobileye,eyeq6-cm=E2=80=9D, =E2=80=9Cmti,mips-cm=E2=
=80=9D would describe the hardware better as eyeq6=E2=80=99s CM is just a s=
pecial variant of mips-cm.
>> >>
>> >> Is s/w that only understands =E2=80=9Cmti,mips-cm=E2=80=9D useful on =
eyeq6 chip? If
>> >> so, I agree. If not, then a fallback compatible is not useful.
>> >
>> > Yes, mobileye,eyeq6-cm only enable an additional bug workaround in sof=
tware.
>> >
>>=20
>> Having "mti,mips-cm" is not useful for the EyeQ6 chip. On the EyeQ6, we
>> obtain all relevant information related to CM dynamically without
>> needing this compatible string.
>>=20
>> > The programming interfaces and so on remains unchanged.
>>=20
>> Even without a compatible string, we are able to utilize the CM. At
>> present, there is no node in the device tree, and apart from the
>> hardware being faulty, we do not need it.
>>=20
>> >
>> > Also other firmware components like U-Boot doesn=E2=80=99t need to be =
aware of
>> > eyeq6 variant.
>>=20
>> It's the same for the firmware; they don't need to have "mti, mips-cm"
>> information, as they can retrieve all they need dynamically.
>
> so it the current patch version correct ? If yes and nothing else is
> outstanding, I'm going to apply the series.

Thank you for taking care of it. From my perspective, this patch is the
correct version, and you can apply this series.

Gregory

>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 ]

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

