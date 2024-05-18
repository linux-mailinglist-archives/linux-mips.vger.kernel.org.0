Return-Path: <linux-mips+bounces-3293-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6D58C906C
	for <lists+linux-mips@lfdr.de>; Sat, 18 May 2024 12:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25AE2281645
	for <lists+linux-mips@lfdr.de>; Sat, 18 May 2024 10:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0687282FE;
	Sat, 18 May 2024 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l2Q4mDmQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E919E182A0;
	Sat, 18 May 2024 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716029268; cv=none; b=VLEki3tiGs1zq4oq1+KpbAxk9nzmNCMyPZISbX9i6ZQAXaVveKeV1ZiemC3Zu3iZc0OYIbgreUmNKsh49yerwNZ9+NYuhmu3VnjDJJoP5YqmIwCWmnqxgvep6hrmQfIj8Y8Q5Xasv0YjsZczUXNnuOUVcmj8kEKEk7ucqzc+S8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716029268; c=relaxed/simple;
	bh=6eHlFRd9tr4rTm77nLhKuxTBrmZDOkFWfvmLXRsfjSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sV0CNZkRPXPT2wLvlykqo2onWL/sOJDNpLN6Tpw8gFI2XjKyBGx61DqTH0gbFf2kfHQOzhOMgO6pXGX19+MBSH8tGKH+A7w+NzYwrDXUKij+OUyGcLv9YZyRW5uHwSHzH5/gXUMCJlnR2ijAur13wNaV9BMTiFyPx3q9Ub0YD38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l2Q4mDmQ; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4223F60002;
	Sat, 18 May 2024 10:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716029258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TuCcsSCKpvdBPd6CWGZI1LuxhUxx9GmmpFZhV35pMxE=;
	b=l2Q4mDmQpZqrBvG3HUBz0N5xc0aisgJVMLaH5CgskUBZ1mAD65yssP8akQ2va6JG+wk/kw
	+plzEgnWbp+Wj2Ns30Oz54XaJrNNQqbw2GYVueCGZMAuua00bB+6nAAg519/bNwQBKpho9
	yntKyXHVUw+Lbo+aaKEocM363GGO0UVX3bQ723e/3moq+/1iWvYsF3f6YTwiTmgoJpwj9y
	y/bpVgvo7Sx3l3sOKsy15Ql0DRNxKxncLm38gGxOF4vCZ4rRGP61meYIKG9kXCqmE/A6yz
	H4wmy6a8vRJ8ky3IFtLTTMfsnJpbnOAceYBk0qHnnh3N4YROelURTfpp/DwRBQ==
Date: Sat, 18 May 2024 12:47:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240518124732.584f441d@xps-13>
In-Reply-To: <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
	<20240506091444.59228fa9@xps-13>
	<CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi,

keguang.zhang@gmail.com wrote on Sat, 18 May 2024 16:01:01 +0800:

> On Mon, May 6, 2024 at 3:14=E2=80=AFPM Miquel Raynal <miquel.raynal@bootl=
in.com> wrote:
> >
> > Hello,
> >
> > devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
> > 19:11:10 +0800:
> > =20
> > > From: Keguang Zhang <keguang.zhang@gmail.com>
> > >
> > > Add devicetree binding document for Loongson-1 NAND Controller.
> > >
> > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > > ---
> > > Changes in v7:
> > > - rename the file to loongson,ls1b-nfc.yaml
> > >
> > > Changes in v6:
> > > - A newly added patch
> > > ---
> > >  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 66 ++++++++++++=
++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.=
yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > > new file mode 100644
> > > index 000000000000..a69f22b9fd9e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > > @@ -0,0 +1,66 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Loongson-1 NAND Controller
> > > +
> > > +maintainers:
> > > +  - Keguang Zhang <keguang.zhang@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: nand-controller.yaml
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: loongson,ls1b-nfc =20
> >
> > What is the rationale behind this choice? Seems like the b variant has
> > two possible implementations and should always be preceded by a more
> > specific compatible.
> >
> > As there is currently no description of this controller upstream, I
> > would not care too much about any out-of-tree description and directly
> > go for a clean description.
> > =20
> Excuse me, should I add a description for this property?

No, description is not needed. But you are allowing the
"loongson,ls1b-nfc" compatible alone, which I think is not relevant,
unless you convince me it is :-)

> > > +      - items:
> > > +          - enum:
> > > +              - loongson,ls1a-nfc
> > > +              - loongson,ls1c-nfc
> > > +          - const: loongson,ls1b-nfc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  dmas:
> > > +    maxItems: 1
> > > +
> > > +  dma-names:
> > > +    const: rxtx
> > > +
> > > +patternProperties:
> > > +  "^nand@[0-3]$":
> > > +    type: object
> > > +    $ref: raw-nand-chip.yaml
> > > +
> > > +    unevaluatedProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - dmas
> > > +  - dma-names =20
> >
> > Should DMA props be required?
> > =20
> Yes. This NAND controller only works with DMA, which means the DMA is nec=
essary.

Ok

>=20
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    nand-controller@1fe78000 {
> > > +        compatible =3D "loongson,ls1b-nfc";
> > > +        reg =3D <0x1fe78000 0x40>;
> > > +
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        dmas =3D <&dma 0>;
> > > +        dma-names =3D "rxtx"; =20
> >
> > There is a preferred spacing for DT nodes, see:
> > https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> > =20
> Sorry. I don't get the meaning of preferred spacing.
> https://docs.kernel.org/devicetree/bindings/writing-schema.html says
> "For DTS examples in the schema, preferred is four-space indentation."
> Then I used four-space indentation.

I'm talking about the new lines (\n) between the properties.
=20
>=20
> > > +
> > > +        nand@0 {
> > > +            reg =3D <0>;
> > > +            nand-use-soft-ecc-engine;
> > > +            nand-ecc-algo =3D "hamming"; =20
> >
> > These two properties are not needed. Unless there is no hardware ECC
> > capability on this controller and in this case you need to ensure the
> > properties are present in the schema. =20
>=20
> Exactly. This NAND controller doesn't support hardware ECC.
> 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' are present in nand-chip.y=
aml.
> Is there anything else I should do?

Thry are in nand-chip.yaml, which means they are allowed, but I want
them mandatory:

required:
  - foo
  - bar

Thanks,
Miqu=C3=A8l

