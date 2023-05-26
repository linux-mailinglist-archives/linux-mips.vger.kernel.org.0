Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF19711CC7
	for <lists+linux-mips@lfdr.de>; Fri, 26 May 2023 03:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjEZBhR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 May 2023 21:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjEZBhQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 May 2023 21:37:16 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36448E2;
        Thu, 25 May 2023 18:37:15 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bacf7060678so621811276.0;
        Thu, 25 May 2023 18:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685065034; x=1687657034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbE/5+8uZmjZcqHEzUiRIHHFUgDq75qRlEVbM3X+PbU=;
        b=OMPhxRT7v+M/V3KF/2BCyscCvSI4n0n21xH7ySQPiGUecMGuaYm9j57OrUd9D2gr53
         ohx+8wQXsRw4txaIhHFa2EkAX4oGi9B+xM6oKSWsbHBcrKwcYAADmFvxCq1Ttb6w6gyx
         5f/DFe7aNPc6bnmtSkRnoun4d71yG08JlNY/QV5HoXBLtHZtitkYFZrgqrUGyKUaH+Q+
         jS26TEk7rcnX0hOAB6QikJRghbKDS3nuw1wjc57mz+PUDMi57La2L2qAV6NPg2v3Yry7
         jEM21YBoCGiQ/0e1707PmH7DYIv7zN6atkT2KMnQEWaS+2BW+ZCNSbl6eQ7wIshzelgN
         8M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685065034; x=1687657034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbE/5+8uZmjZcqHEzUiRIHHFUgDq75qRlEVbM3X+PbU=;
        b=WgF9CO2pSMzVIjG/vhZxVuwuFNtGd254qhkL/0hwQUUe68+rycgdpfUFhG76FqwtEh
         xbLhEza4DBmlw1cF8UCmnAq9U3Ki52bL9lyOycOYK6pqxmWEkALDirsSGzDOO/lAdnPA
         ih2rlLL+kcIv/gBW3uQLBASWd59KN/uOB5625l3D0qCdkEkx+oZsUIwPfEIy5c+etUer
         Dm5lOPqqN17C66cP33/bSUxDWDK8Hr4vHdQNjW7hv/dv9IONTN39dun57TlmmtGHZJcS
         sPzYymLGGr7ZgS+ZpDgxGWqd3H8P9M5u+hXxkROqlU+FdUMus/ng6MkS0LIU+DKfAr0U
         7pLg==
X-Gm-Message-State: AC+VfDzEe6RTxSHmEhg2zkWCN5aFRKHiEy+1mvH1jCcacyG8iNwc4VtQ
        5uCr8cXrbmDN4saPMS7YqmEgBqAPtY07404gJ9I=
X-Google-Smtp-Source: ACHHUZ4GaSi0jiXxwYm5nsZ10Yb5XxkqmCcja7+35DyFqffiFSKnDGHSokuaD3vnoB0VdbIGs09thaXewJANtC6/Wig=
X-Received: by 2002:a25:aaae:0:b0:ba7:8562:33b8 with SMTP id
 t43-20020a25aaae000000b00ba7856233b8mr184224ybi.15.1685065034263; Thu, 25 May
 2023 18:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
 <20230525-custody-oversleep-f778eddf981c@spud>
In-Reply-To: <20230525-custody-oversleep-f778eddf981c@spud>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Fri, 26 May 2023 09:37:02 +0800
Message-ID: <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the trivial RTCs
To:     Conor Dooley <conor@kernel.org>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
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

On Fri, May 26, 2023 at 1:05=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> Hey Binbin,
>
> On Thu, May 25, 2023 at 08:55:23PM +0800, Binbin Zhou wrote:
> > Move Loongson RTC bindings from trivial-rtc.yaml into loongson,rtc.yaml=
.
> >
> > Also, we will discard the use of wildcards in compatible (ls2x-rtc),
> > soc-based compatible is more accurate for hardware differences between
> > chips.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/rtc/loongson,rtc.yaml | 47 +++++++++++++++++++
> >  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
> >  2 files changed, 47 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.=
yaml
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/=
Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > new file mode 100644
> > index 000000000000..68e56829e390
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/loongson,rtc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Loongson Real-Time Clock
> > +
> > +maintainers:
> > +  - Binbin Zhou <zhoubinbin@loongson.cn>
> > +
> > +allOf:
> > +  - $ref: rtc.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - loongson,ls1b-rtc
> > +      - loongson,ls1c-rtc
> > +      - loongson,ls7a-rtc
> > +      - loongson,ls2k0500-rtc
> > +      - loongson,ls2k1000-rtc
> > +      - loongson,ls2k2000-rtc
>
> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_confi=
g },
> |+       { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_confi=
g },
> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_co=
nfig },
> |+       { .compatible =3D "loongson,ls2k0500-rtc", .data =3D &generic_rt=
c_config },
> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_r=
tc_config },
> |+       { .compatible =3D "loongson,ls2k2000-rtc", .data =3D &generic_rt=
c_config },
> |+       { /* sentinel */ }
> |+};
>
> This is a sign to me that your compatibles here are could do with some
> fallbacks. Both of the ls1 ones are compatible with each other & there
> are three that are generic.
>
> I would allow the following:
> "loongson,ls1b-rtc"
> "loongson,ls1c-rtc", "loongson,ls1b-rtc"
> "loongson,ls7a-rtc"
> "loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
> "loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
> "loongson,ls2k1000-rtc"
>
> And then the driver only needs:
> |+static const struct of_device_id loongson_rtc_of_match[] =3D {
> |+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_confi=
g },
> |+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_co=
nfig },
> |+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_r=
tc_config },
> |+       { /* sentinel */ }
> |+};
>
> And ~if~when you add support for more devices in the future that are
> compatible with the existing ones no code changes are required.

Hi Conor:

Thanks for your reply.

Yes, this is looking much cleaner. But it can't show every chip that
supports that driver.

As we know, Loongson is a family of chips:
ls1b/ls1c represent the Loongson-1 family of CPU chips;
ls7a represents the Loongson LS7A bridge chip;
ls2k0500/ls2k1000/ls2k2000 represent the Loongson-2 family of CPU chips.

Based on my previous conversations with Krzysztof, it seems that
soc-based to order compatible is more popular, so I have listed all
the chips that support that RTC driver.

>
> To maintain compatibility with the existing devicetrees, should the old
> "loongson,ls2x-rtc" be kept in the driver?

No, It seems that wildcards in compatible are not allowed."
loongson,ls2x-rtc" itself was part of this patch series at one time,
but apparently it is not the right way to describe these chips.

Here is Krzysztof's previous reply:
https://lore.kernel.org/linux-rtc/05ebf834-2220-d1e6-e07a-529b8f9cb100@lina=
ro.org/

Thanks.
Binbin

>
> Thanks,
> Conor.
>
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
> > +    rtc_dev: rtc@1fe27800 {
> > +      compatible =3D "loongson,ls2k0500-rtc";
> > +      reg =3D <0x1fe27800 0x100>;
> > +
> > +      interrupt-parent =3D <&liointc1>;
> > +      interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
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
