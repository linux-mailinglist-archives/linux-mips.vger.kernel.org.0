Return-Path: <linux-mips+bounces-3292-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E658C8FF3
	for <lists+linux-mips@lfdr.de>; Sat, 18 May 2024 10:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79B02282C6E
	for <lists+linux-mips@lfdr.de>; Sat, 18 May 2024 08:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513B6C2C6;
	Sat, 18 May 2024 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lea7RDgo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128AB4A29;
	Sat, 18 May 2024 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716019302; cv=none; b=OUDUhJ+yE3B8k+tkBclZ0jcZmpTwVSzk519czmmOj9/nSHPgGiaEHMs6LA+1tlY0f1dWRhSo2Kb7Xv6m1pjL0GJSxeMoqe1ixv2Q7kkH2SdBUhyV4Ix2VrtUsj009DrZe0Ui+q3SxFs1G9lB4BBv24QCM2s4eKtJ+zMC/Y6+Qhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716019302; c=relaxed/simple;
	bh=mjeHR5Roo0IlU1RPiAKg2mRj8Xi3Ay+IxDGYeC81bCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maPy1pxrgRJVgMuQBRmFmxK6eWJp5iNPfBRly0pPusotqWi0PKNq8Q16a6LAlUgwPSunpQRUZLQnjmn/gBnkfPiNstc9RpBSpk0MVotfQDpZ4PgLNjEuqgVodHEiYGljlKqyimmN9Xp5+Mc0X0V27AlhsAhZmK035fvJsPy8zkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lea7RDgo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572af0b12b8so5529297a12.2;
        Sat, 18 May 2024 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716019298; x=1716624098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5PBYmiAOhnAHeUKcKjWhYrDASdZVdAh3fVeiRlLusQ=;
        b=Lea7RDgoLSwsnxgp7/M9e9YboZph2sYXOfDYH5ZgIBAZcqNlPqSPjzQ2gQ9a2nUAHI
         H9lxi782I9TornmpA4Qj/jM6zdeSFL9jA1sHRFX1GnJjlz8eoQSfKSgrDJKDwgT3PCNS
         2fq44PO/kKwvvB4PGSj/AmXN6qJFU0WXLD+38Sd79jPIzs5pWhnkY0yLb4Iqr/k73GCF
         SiXfzBFNVLp3xX+0EPcsyobLMV6mgLrs4VMFAL0RrGoICpmoDy2KXqCmGDQ6H5eQMN+y
         PiKGsduRYW1tu48oeIsr3/xQDoLsv6y3Z5PgRHgNcRYxef6e17lpE6MGFt69q6UP4Dgt
         bqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716019298; x=1716624098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5PBYmiAOhnAHeUKcKjWhYrDASdZVdAh3fVeiRlLusQ=;
        b=hiXv/MOJ/m6X8ywCeaQ7BUZucMR9jI5ueFrHgCC7VAlhJG/ZXjeUS/WnSsaaLO1t+3
         n40IdisXv2S/6CUsJgpnEWqywuvlwaQPdaF5qi57J1z0s3R9L+bUFDoL59JZaIdnpsVV
         gHQNix4AkeJmPDNY5a/xc7kRQGxcGDfZTyhsp8fscb/yQEUt8tEACdYv7kwcdLQh30et
         iEDDNtfCckNhkTvwWqkXNENN31fF6pkrHQe7ZOq837HNg3DZ065JPjlh2IzR6CQIFuil
         mah8sQ5MxuiJHN/ErXgZxCX6YlXIVxxsYd4dxeBdKsoz/VlAEPfP4oMwpofG2x662MPu
         QtHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFfqTLdexi4VxPsfZFKV43oR6rKGwOeHMmF7DsGQGzLoIndTBjcKfz5cbEJQMnNN+/+JInqre7enefh2Rc1cwfYlthoNldwtokQUbhqRKU8oxl1+c8xfUDq8tD1Ks/bhqZiHaLZlDBYHEPzGqbA0AmdSDal045VHz1sCWepUXW2ccubxw=
X-Gm-Message-State: AOJu0YwlnSLOq1bjo60FqKfHLXnB9Z5OiY8iSzpgDzRqe1kkiGljpkeV
	qpd/MQLFC090e0GPOZsroMaSFWlZC/HL1E+ITYw8HbigIk1+fwtItVqHmISmdidy1whNmJqaq4D
	4C0RfXJdcL1BjGnIYDoIBu/DpCRc=
X-Google-Smtp-Source: AGHT+IFRurVLH0wLwb3bHvY0pj+mDe+IQvHfHOR+KR2jbk6X+fEXiwm/QrNqX6PbS5ITDgN3Dj/Bj35XZRBxiB42JAg=
X-Received: by 2002:a50:8adb:0:b0:574:ec96:69d8 with SMTP id
 4fb4d7f45d1cf-574ec9671femr8429714a12.33.1716019298230; Sat, 18 May 2024
 01:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com> <20240506091444.59228fa9@xps-13>
In-Reply-To: <20240506091444.59228fa9@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Sat, 18 May 2024 16:01:01 +0800
Message-ID: <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 3:14=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hello,
>
> devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
> 19:11:10 +0800:
>
> > From: Keguang Zhang <keguang.zhang@gmail.com>
> >
> > Add devicetree binding document for Loongson-1 NAND Controller.
> >
> > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > ---
> > Changes in v7:
> > - rename the file to loongson,ls1b-nfc.yaml
> >
> > Changes in v6:
> > - A newly added patch
> > ---
> >  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 66 ++++++++++++++=
++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.ya=
ml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > new file mode 100644
> > index 000000000000..a69f22b9fd9e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson-1 NAND Controller
> > +
> > +maintainers:
> > +  - Keguang Zhang <keguang.zhang@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nand-controller.yaml
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: loongson,ls1b-nfc
>
> What is the rationale behind this choice? Seems like the b variant has
> two possible implementations and should always be preceded by a more
> specific compatible.
>
> As there is currently no description of this controller upstream, I
> would not care too much about any out-of-tree description and directly
> go for a clean description.
>
Excuse me, should I add a description for this property?

> > +      - items:
> > +          - enum:
> > +              - loongson,ls1a-nfc
> > +              - loongson,ls1c-nfc
> > +          - const: loongson,ls1b-nfc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  dmas:
> > +    maxItems: 1
> > +
> > +  dma-names:
> > +    const: rxtx
> > +
> > +patternProperties:
> > +  "^nand@[0-3]$":
> > +    type: object
> > +    $ref: raw-nand-chip.yaml
> > +
> > +    unevaluatedProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - dmas
> > +  - dma-names
>
> Should DMA props be required?
>
Yes. This NAND controller only works with DMA, which means the DMA is neces=
sary.

> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    nand-controller@1fe78000 {
> > +        compatible =3D "loongson,ls1b-nfc";
> > +        reg =3D <0x1fe78000 0x40>;
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        dmas =3D <&dma 0>;
> > +        dma-names =3D "rxtx";
>
> There is a preferred spacing for DT nodes, see:
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
Sorry. I don't get the meaning of preferred spacing.
https://docs.kernel.org/devicetree/bindings/writing-schema.html says
"For DTS examples in the schema, preferred is four-space indentation."
Then I used four-space indentation.

> > +
> > +        nand@0 {
> > +            reg =3D <0>;
> > +            nand-use-soft-ecc-engine;
> > +            nand-ecc-algo =3D "hamming";
>
> These two properties are not needed. Unless there is no hardware ECC
> capability on this controller and in this case you need to ensure the
> properties are present in the schema.

Exactly. This NAND controller doesn't support hardware ECC.
'nand-use-soft-ecc-engine' and 'nand-ecc-algo' are present in nand-chip.yam=
l.
Is there anything else I should do?

Thanks for your view!
>
> > +        };
> > +    };
> >
>
>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

