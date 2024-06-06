Return-Path: <linux-mips+bounces-3502-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D432B8FE4B6
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 12:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE9CB1C263A6
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 10:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DCA194C96;
	Thu,  6 Jun 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKnpftcq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20312E639;
	Thu,  6 Jun 2024 10:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671228; cv=none; b=NslVh2vc8Zio6axRiXceXuepSRdqe4Kqcvl0/jvpg9bDZ/xnODy7nHaQOtikxs58UxWYF4D40+Rm2GeFChXv1469sfNJj8tBWlwVdSNj/cL5RQoJDCcWm21xV3go6/AMKeHKPSrd2IjDhB9Nw4Yi/eSsOxQiKnNYRK/dbh5rh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671228; c=relaxed/simple;
	bh=IwvdKHEGFEfuaUJOTiyFszzjDelzpkHXySk7OYxTe2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4BQ2qRC+YI4L3qBFElfSnwRHLEhF5Rs2y2+rF+Qpyuwn1OHpclhbrtTniI2Ct+pCEj4Uk37vNJ3TXwjK4RS9wXsKszrn6uPqd8Uw6Zg/ya1YqCdBvcyAajjJ78ZTnmq/PAsiQFmSG3dnC9RUVbfNSspnkxcfB0bvdNyYyehnfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKnpftcq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so1084316a12.3;
        Thu, 06 Jun 2024 03:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717671225; x=1718276025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=935StyJmCjoE4Ghn59CDu5In+96Jm1afri4FQ4OW13w=;
        b=RKnpftcqRgiNirkGErcvS5e6Bpr24PpWVDboT+hVlx0Jf1OiKHVv02/LnmphsyTSoz
         oxEQnn2UW5gRB2O9zMEvJCD5RNS1pMI2F3NWToGsQhGtatF+UORQjmMrB2vZmjglFGkD
         qWYgutzUFSEDv53vmrisPkn4Oq74udG1JTaXZbz0oCbp/JzZXd77O3Z9Rxg+9evpr1w8
         /7/jT5ET4JQeO/QV/nmx8glGKbzOAt1qchyCEJpmfGpFN9iq6gW2YCeU8vRjt5Hgipj/
         Oc2rjFvcRlthCkSpuiTDFBJKeVoQgUejIq9PbQpA2YzWvJDi5xCFIIPMo0+m5AhtjaGQ
         WF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671225; x=1718276025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=935StyJmCjoE4Ghn59CDu5In+96Jm1afri4FQ4OW13w=;
        b=R10fpSJr2tXWvgnvFxN2vmu358/Q0YlWA4H/d+Aa2LfF8vJXfIs/zX+KG2zsmib6JE
         3G5yL2czj4kAyRV7KNDYaiXkYC8IBHwch92R9y2wqTSMkSkWSNUowgRCKRDm0LsqGqRb
         nttlr+IcoaCJl0m5ETwxLXjrcqTIScRkuSPzz0Pzs4ASrYjjDAbd/fXFZtTPScKJ2DaU
         LKc6NefBNdi1d940uWIucPY+lYT8Vant/VGawyXyxDsgPLcNlptGSSD7mq3glHFAIn/v
         n2ZfcFrILFkJF3Q2/0zeXpUaok+QS/NikyxzGg31KWCwpMxUy/GNa4oUYsKqx0FnzuJh
         Q+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4lHZC5n93FRnJRotGe9mmbVwhcoG8Q4wF2mshSLbcKI5Kio4NA6oiddc2SE2FDpn+S95De3yKDmrg4rZahlrzuTnGIHx6jfMPulqtQqHEQybAMuByDlLbJ0eUtAb5uQoxrdxjwVqsmqW+YzfQfIew0ZDgifSC/ECd279eRb2hCs+DBdo=
X-Gm-Message-State: AOJu0YxhsRrAvvPFN+kjknH0lQFxW6tmWUCC4MIntmXBfLCgmsUoPsjR
	lGd04qkifgyYVes8MF3FVGI0vMZjyH/scQETJcVjWcM+hnF7Q/FjiZz46uN9GOlnm5TZXcFNCkZ
	nTw+aC1Wa4JHmDY1EkegySK9pdao=
X-Google-Smtp-Source: AGHT+IE0J+VGwd0Ea7QUc/PFc4yHChLtDGJkWcYqgbuGIHKRsfdwqpE5pP07w0oAGDb9xZmHKtpmnWMeMuH42TH1CSc=
X-Received: by 2002:a50:8d54:0:b0:579:c3f8:5923 with SMTP id
 4fb4d7f45d1cf-57a8b6a8778mr4076479a12.13.1717671224760; Thu, 06 Jun 2024
 03:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
 <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com> <20240506091444.59228fa9@xps-13>
 <CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com> <20240518124732.584f441d@xps-13>
In-Reply-To: <20240518124732.584f441d@xps-13>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 6 Jun 2024 18:53:08 +0800
Message-ID: <CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miquel,
Sorry for the late reply.

On Sat, May 18, 2024 at 6:47=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi,
>
> keguang.zhang@gmail.com wrote on Sat, 18 May 2024 16:01:01 +0800:
>
> > On Mon, May 6, 2024 at 3:14=E2=80=AFPM Miquel Raynal <miquel.raynal@boo=
tlin.com> wrote:
> > >
> > > Hello,
> > >
> > > devnull+keguang.zhang.gmail.com@kernel.org wrote on Tue, 30 Apr 2024
> > > 19:11:10 +0800:
> > >
> > > > From: Keguang Zhang <keguang.zhang@gmail.com>
> > > >
> > > > Add devicetree binding document for Loongson-1 NAND Controller.
> > > >
> > > > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > > > ---
> > > > Changes in v7:
> > > > - rename the file to loongson,ls1b-nfc.yaml
> > > >
> > > > Changes in v6:
> > > > - A newly added patch
> > > > ---
> > > >  .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 66 ++++++++++=
++++++++++++
> > > >  1 file changed, 66 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nf=
c.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > > > new file mode 100644
> > > > index 000000000000..a69f22b9fd9e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
> > > > @@ -0,0 +1,66 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Loongson-1 NAND Controller
> > > > +
> > > > +maintainers:
> > > > +  - Keguang Zhang <keguang.zhang@gmail.com>
> > > > +
> > > > +allOf:
> > > > +  - $ref: nand-controller.yaml
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: loongson,ls1b-nfc
> > >
> > > What is the rationale behind this choice? Seems like the b variant ha=
s
> > > two possible implementations and should always be preceded by a more
> > > specific compatible.
> > >
> > > As there is currently no description of this controller upstream, I
> > > would not care too much about any out-of-tree description and directl=
y
> > > go for a clean description.
> > >
> > Excuse me, should I add a description for this property?
>
> No, description is not needed. But you are allowing the
> "loongson,ls1b-nfc" compatible alone, which I think is not relevant,
> unless you convince me it is :-)
>
"loongson,ls1b-nfc" itself is a specific implementation.
I was suggested to set up a fallback before.
https://lore.kernel.org/all/20231007-untapped-masses-01f80b7c13c7@spud/
Then "loongson,ls1b-nfc" became the fallback.

> > > > +      - items:
> > > > +          - enum:
> > > > +              - loongson,ls1a-nfc
> > > > +              - loongson,ls1c-nfc
> > > > +          - const: loongson,ls1b-nfc
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  dmas:
> > > > +    maxItems: 1
> > > > +
> > > > +  dma-names:
> > > > +    const: rxtx
> > > > +
> > > > +patternProperties:
> > > > +  "^nand@[0-3]$":
> > > > +    type: object
> > > > +    $ref: raw-nand-chip.yaml
> > > > +
> > > > +    unevaluatedProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - dmas
> > > > +  - dma-names
> > >
> > > Should DMA props be required?
> > >
> > Yes. This NAND controller only works with DMA, which means the DMA is n=
ecessary.
>
> Ok
>
> >
> > > > +
> > > > +unevaluatedProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    nand-controller@1fe78000 {
> > > > +        compatible =3D "loongson,ls1b-nfc";
> > > > +        reg =3D <0x1fe78000 0x40>;
> > > > +
> > > > +        #address-cells =3D <1>;
> > > > +        #size-cells =3D <0>;
> > > > +
> > > > +        dmas =3D <&dma 0>;
> > > > +        dma-names =3D "rxtx";
> > >
> > > There is a preferred spacing for DT nodes, see:
> > > https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> > >
> > Sorry. I don't get the meaning of preferred spacing.
> > https://docs.kernel.org/devicetree/bindings/writing-schema.html says
> > "For DTS examples in the schema, preferred is four-space indentation."
> > Then I used four-space indentation.
>
> I'm talking about the new lines (\n) between the properties.
>
Will remove the superfluous new lines.
> >
> > > > +
> > > > +        nand@0 {
> > > > +            reg =3D <0>;
> > > > +            nand-use-soft-ecc-engine;
> > > > +            nand-ecc-algo =3D "hamming";
> > >
> > > These two properties are not needed. Unless there is no hardware ECC
> > > capability on this controller and in this case you need to ensure the
> > > properties are present in the schema.
> >
> > Exactly. This NAND controller doesn't support hardware ECC.
> > 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' are present in nand-chip=
.yaml.
> > Is there anything else I should do?
>
> Thry are in nand-chip.yaml, which means they are allowed, but I want
> them mandatory:
>
Will do.

> required:
>   - foo
>   - bar
>
> Thanks,
> Miqu=C3=A8l



--=20
Best regards,

Keguang Zhang

