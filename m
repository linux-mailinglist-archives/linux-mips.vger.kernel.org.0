Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB8B5F3C6E
	for <lists+linux-mips@lfdr.de>; Tue,  4 Oct 2022 07:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiJDFV3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Oct 2022 01:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiJDFVV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Oct 2022 01:21:21 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424BD481C4;
        Mon,  3 Oct 2022 22:20:59 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-127dca21a7dso15318523fac.12;
        Mon, 03 Oct 2022 22:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=4ueOIemU16WvWJaf1k77jb77VHWMtKyocYO+6KRwnAg=;
        b=FSsPFnYBJfduZAzJaOrmxtB23tvkp25TlPv0lK1obRGIPeTLRDozm4RPogS5hy2MGi
         9ogz9Duvapj5+Rpgogt2E/57Rxd7V0bu1pIq3fv3JsZsCB5u73hyTtf7FSCpuW2Bz+0r
         X3mL6R6TZ1CgCSjnLjZNq0spZPcsN+8kUB0/3asi14ViLWpHMa30w3CODH2IWgeJ4ksB
         zkY9MXvbf8AyeNAhYObyDv51nFdsrOXfGZFHxxzkfVpMRTlmMY/kEhrknWNA2wqs2a+1
         4Dy+Jy1Pvl3R8tM4I5s25EiuNDny4N1pwvmfqfUBuNjYvEMn4r5i8xEHPvQ7+hGVqCKg
         qXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4ueOIemU16WvWJaf1k77jb77VHWMtKyocYO+6KRwnAg=;
        b=IJ1eFk90NeIIClSayJO+G0FbDz917MRXvuXN9it40b60W6t6r8/j+o9TeO9qV3qAVX
         /9uAfXtTzrtVKZy4nq20YQdM+mRrNriCZcmkUkG2x1S7kZT40W9U3Tz3YiUwSNG5XJ1G
         ZgEBY39IHaIcaaVCKxbj18MMLgI3xB5PVN8/q4lfTOF4275Tp0H1H+DPQQElaae43qiv
         aBdrUbp3agfozmVs6p1lRLi/wEI/RxVCECxURqNJ8D0kPVnGomCxioT5OK0Xn2eP7cy5
         v8N0dJU6h6Y1XA60ysTtrntgk0I9WjsLpjH/Ep5lD2bGKbibotoExLDlJV1eGMhNukI2
         LepA==
X-Gm-Message-State: ACrzQf2fQjPw3YXmy+uxFA9w0ezphxk9RBgd7JpPWjVjZ1+AnvyTBXXw
        DbpsNZ0rmFpocHK3xGT1orpK6Wb0sHZn0YxZuLh1e6e4pFuX1g==
X-Google-Smtp-Source: AMsMyM6ZVi11EWM/U8VZRoPFX34mTlyBEf68gE79N9kBhC6PtRJQ6sg9kjzBsj6mUVNgZWJJrlLcODRpkyg85wKARdo=
X-Received: by 2002:a05:6871:89:b0:131:6362:e26f with SMTP id
 u9-20020a056871008900b001316362e26fmr6888037oaa.144.1664860858609; Mon, 03
 Oct 2022 22:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221004050924.986211-1-sergio.paracuellos@gmail.com>
 <20221004050924.986211-3-sergio.paracuellos@gmail.com> <d73089a7-f7ad-2f45-8307-3c4ec20cbb79@gmail.com>
In-Reply-To: <d73089a7-f7ad-2f45-8307-3c4ec20cbb79@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Tue, 4 Oct 2022 07:20:47 +0200
Message-ID: <CAMhs-H8531j+1b_rjZnbymfkhUjGUwg94QFFsHkcPAo8pzmkeQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: mips: brcm: add Broadcom SoCs bindings
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 4, 2022 at 7:14 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> w=
rote:
>
> On 4.10.2022 07:09, Sergio Paracuellos wrote:
> > Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.
> >
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >   .../devicetree/bindings/mips/brcm/soc.yaml    | 98 ++++++++++++++++++=
+
> >   1 file changed, 98 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Doc=
umentation/devicetree/bindings/mips/brcm/soc.yaml
> > new file mode 100644
> > index 000000000000..39b4609cd1cc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom cable/DSL/settop platforms
> > +
> > +maintainers:
> > +  - Hauke Mehrtens <hauke@hauke-m.de>
> > +  - Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > +  - Florian Fainelli <f.fainelli@gmail.com>
>
> The only MIPS SoCs I really worked on were BCM47xx. I didn't do any real
> work on cable/DSL/STB.
>
> I don't really feel up to like maintaining those SoCs.

I can remove you from maintainers in this new file. I added you
because of this entry in MAINTAINERS file:

BROADCOM BCM47XX MIPS ARCHITECTURE
M:  Hauke Mehrtens <hauke@hauke-m.de>
M:  Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
L:  linux-mips@vger.kernel.org
S:  Maintained
F:  Documentation/devicetree/bindings/mips/brcm/
F:  arch/mips/bcm47xx/*
F:  arch/mips/include/asm/mach-bcm47xx/*

Since 'Documentation/devicetree/bindings/mips/brcm/' is supposed to be
maintained also by you I thought it makes sense to list you also here.

I don't know, maybe you should remove yourself also from the
MAINTAINERS file for BROADCOM BCM47XX MIPS ARCHITECTURE???

Let me know what you want me to do.

Thanks,
    Sergio Paracuellos
>
>
> > +
> > +description: |
> > +    Boards Broadcom cable/DSL/settop SoC shall have the following prop=
erties.
> > +    The experimental -viper variants are for running Linux on the 3384=
's
> > +    BMIPS4355 cable modem CPU instead of the BMIPS5000 application pro=
cessor.
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +
> > +  compatible:
> > +    enum:
> > +      - brcm,bcm3368
> > +      - brcm,bcm3384
> > +      - brcm,bcm33843
> > +      - brcm,bcm3384-viper
> > +      - brcm,bcm33843-viper
> > +      - brcm,bcm6328
> > +      - brcm,bcm6358
> > +      - brcm,bcm6362
> > +      - brcm,bcm6368
> > +      - brcm,bcm63168
> > +      - brcm,bcm63268
> > +      - brcm,bcm7125
> > +      - brcm,bcm7346
> > +      - brcm,bcm7358
> > +      - brcm,bcm7360
> > +      - brcm,bcm7362
> > +      - brcm,bcm7420
> > +      - brcm,bcm7425
> > +
> > +  cpus:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      mips-hpt-frequency:
> > +        description: MIPS counter high precision timer frequency.
> > +         This is common to all CPUs in the system so it lives
> > +         under the "cpus" node.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +    patternProperties:
> > +      "^cpu@[0-9]$":
> > +        type: object
> > +        $ref: /schemas/mips/cpus.yaml#
> > +        unevaluatedProperties: false
> > +
> > +    required:
> > +      - mips-hpt-frequency
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +     / {
> > +         compatible =3D "brcm,bcm3368";
> > +         #address-cells =3D <1>;
> > +         #size-cells =3D <1>;
> > +         model =3D "Broadcom 3368";
> > +
> > +         cpus {
> > +           #address-cells =3D <1>;
> > +           #size-cells =3D <0>;
> > +
> > +           mips-hpt-frequency =3D <150000000>;
> > +
> > +           cpu@0 {
> > +             compatible =3D "brcm,bmips4350";
> > +             device_type =3D "cpu";
> > +             reg =3D <0>;
> > +           };
> > +
> > +           cpu@1 {
> > +             compatible =3D "brcm,bmips4350";
> > +             device_type =3D "cpu";
> > +             reg =3D <1>;
> > +           };
> > +         };
> > +       };
> > +...
>
