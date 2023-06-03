Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2D5720D0D
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jun 2023 03:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236941AbjFCBvE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 21:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjFCBvC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 21:51:02 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1197E45;
        Fri,  2 Jun 2023 18:51:01 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ba81ded8d3eso2985873276.3;
        Fri, 02 Jun 2023 18:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685757061; x=1688349061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+haGyXm6YykBz/oKJVR4lxh8FAPCM1LLYnf/lq4Msmk=;
        b=MSSxpfa62CFzGS4/7t8aT0vkJZmT+tJBYJ2WrSXbcNviPLWhOsDwW8U9GsB/8Td/2X
         3qJ8HIXnFiQRPsIzTsqNddnkXGTe2S4xwp27l4WuziLN6EvWLCZeuU32yyzrB9/xLbfD
         4E7D73MLrry2XQUVpV2nckK+GPrK3pNqsBn/YGZIXOcXOogGWQh7QITHN7sBvykT26LN
         F0nRaotcvYBvY7hmR8a5EdeTlvVUF2mPYE3oiOSKxKv0dvhNW65oEZmJRu6lzTmbxBkf
         CuThhABcVn3a+ha6vDEHVbQE8V5rd9Kad5QymdXMklRuSD4A+/GvNQrwziEVDeg6P/HC
         BRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685757061; x=1688349061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+haGyXm6YykBz/oKJVR4lxh8FAPCM1LLYnf/lq4Msmk=;
        b=WHn7k1Ova6iXS8IYkK61aFlNyb4RGdsobpVlbYvjeymQW01xcrlOLpm0da++MSUmk6
         mZz6039yFyt8lC3hbbPGY8KZQ/3qzSwM8lI40682G8QaFydtKA3YodOHgKnHgrSKuOU0
         hQXPgSvDr7wAc8hV/lqEXdWBljvS3KOAdgsmbgsuiY2k4FUHBsJAA6cQ/XUTKbM2DT0N
         IEe9hDlOa49Wljp1KAJiluFup4GFD5l0Goe6Gbclyh+/z+7ULaB7D32jClvQlFhzx3Gs
         YxKHsS3svOxda/tRVuguNONUsEgG+f6/EnAsMLrNSJBnpPr04f8nVVBv7WQreNPCqPio
         bJEw==
X-Gm-Message-State: AC+VfDxSf2k9OEIpk7ohEFriRpXfZuXsMybPFbt866tEYilNABQRXn31
        HNQGAGXdOsLBvFKAX2MUMbzQ6Q0M6IhNdcv4/48=
X-Google-Smtp-Source: ACHHUZ4xw9XIJvykaamYDvL4pOW/ZVbr8wwnsqQIsGZqCdOahv5nd8ae9U47d9dfDfU1dhEsi4WKs3nJCIkt98QACNs=
X-Received: by 2002:a81:4745:0:b0:54f:adff:bd7a with SMTP id
 u66-20020a814745000000b0054fadffbd7amr2005581ywa.8.1685757060985; Fri, 02 Jun
 2023 18:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685693501.git.zhoubinbin@loongson.cn> <1b0bb443bd74647c17b7902f3d719700f81a1dba.1685693501.git.zhoubinbin@loongson.cn>
 <20230602-giveaway-tipping-4c420a13f2f1@spud>
In-Reply-To: <20230602-giveaway-tipping-4c420a13f2f1@spud>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Sat, 3 Jun 2023 09:50:49 +0800
Message-ID: <CAMpQs4LMw8srAXq_3Q1wt3g3KWY5JY=n_=r_GJNy7ic8T9gskg@mail.gmail.com>
Subject: Re: [PATCH V5 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Conor Dooley <conor@kernel.org>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>, Yang Ling <gnaygnil@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 3, 2023 at 2:05=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Fri, Jun 02, 2023 at 05:50:20PM +0800, Binbin Zhou wrote:
> > Move Loongson RTC bindings from trivial-rtc.yaml into loongson,rtc.yaml=
.
>
> $subject: dt-bindings: rtc: Remove the LS2X from the trivial RTCs
>
> If you end up resubmitting, could you use a subject like that better
> describes the changes?
> Say "dt-bindings: rtc: Split loongson,ls2x-rtc into SoC-based compatibles=
"?

OK, I got it.

Thanks.
Binbin

> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
> >
> > The architectures associated with this driver use the built-in DTB, so
> > we can just drop the compatible(rtc-ls2x) with wildcards.
> > Also, soc-based compatible is more accurate for hardware differences
> > between chips.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/rtc/loongson,rtc.yaml | 57 +++++++++++++++++++
> >  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
> >  2 files changed, 57 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/=
Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > new file mode 100644
> > index 000000000000..f89c1f660aee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/loongson,rtc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson Real-Time Clock
> > +
> > +description:
> > +  The Loongson family chips use an on-chip counter 0 (Time Of Year
> > +  counter) as the RTC.
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - loongson,ls1b-rtc
> > +          - loongson,ls1c-rtc
> > +          - loongson,ls7a-rtc
> > +          - loongson,ls2k1000-rtc
> > +      - items:
> > +          - enum:
> > +              - loongson,ls2k2000-rtc
> > +              - loongson,ls2k0500-rtc
> > +          - const: loongson,ls7a-rtc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    rtc@1fe27800 {
> > +        compatible =3D "loongson,ls2k1000-rtc";
> > +        reg =3D <0x1fe27800 0x100>;
> > +
> > +        interrupt-parent =3D <&liointc1>;
> > +        interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
> > +    };
> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/D=
ocumentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > index a3603e638c37..9af77f21bb7f 100644
> > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > @@ -47,8 +47,6 @@ properties:
> >        - isil,isl1218
> >        # Intersil ISL12022 Real-time Clock
> >        - isil,isl12022
> > -      # Loongson-2K Socs/LS7A bridge Real-time Clock
> > -      - loongson,ls2x-rtc
> >        # Real Time Clock Module with I2C-Bus
> >        - microcrystal,rv3029
> >        # Real Time Clock
> > --
> > 2.39.1
> >
