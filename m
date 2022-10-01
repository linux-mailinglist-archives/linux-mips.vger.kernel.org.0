Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1527E5F19AA
	for <lists+linux-mips@lfdr.de>; Sat,  1 Oct 2022 05:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiJADoZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Sep 2022 23:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiJADoX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Sep 2022 23:44:23 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C731A3A5;
        Fri, 30 Sep 2022 20:44:23 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id o64so6565359oib.12;
        Fri, 30 Sep 2022 20:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=m+xZOjHRUmYEjXKSqmnf18Z+L+P0ySkF4L3vH9vcPYU=;
        b=jk3+9SAqoRFVqoo2dEmhEv1a2hj2nJaR8hRj7hp9qcVSJ7mQ5Yx9fQkGRHw3o3KLMM
         iWi58+7FX6G4uux5YOKD0uWIHeF84kB+mfEUyu/Lar0aQtHDwGo9wAnDbcW+Kbz2BYCg
         ygp8lyqvrlHDQ+kBG3xeP39gMyLszN1pke4Rd0AwGlHkFS4ZO9LGzmokAz8Pl7kdwkWR
         vQP9DOJeVAUSZkmbhfnwrAmMVe4+HqfgHS/Vvigwovrb6Ai8yM1MveYEfC9ebjVHoCi3
         kAC7RCx2RnrSvZ3yLQIdj73tfALyJTyukyul5QZ0NVcaq+REaYUXH0riU9yVDSqxKMIL
         kCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=m+xZOjHRUmYEjXKSqmnf18Z+L+P0ySkF4L3vH9vcPYU=;
        b=8C46uoe4X0K7Ww0+cwtrt2q2ggdduCpAGmpS4VUPK9bEpB3X4c0tTfPei1O6Go3u6f
         UcceEs3apNYr29Mjcqt9ZY/tzGbE6P/wf8XSZj9DlW1NKWPz5tKfi0DfekV96/x1/stx
         QqbQJR5wr2T4u7QI5Rnek/rNMpz6NRj0rzoSqmBE66Jndz5JWhdsjN5XVi1T13OaPurO
         gw5aHjw+1fRRxIavTBIJYcBBYryZ35kHdNQwQpIwD1ZNxf4wEIek5eD/U7rtJ6ZwJg50
         8b7N3ORA8DUCtZQI5rbkx960kipC6LjG7WVlAKg0hLXZnW8bJ9ywhFZICp1zbyG+NA7l
         NEBg==
X-Gm-Message-State: ACrzQf3Dk6ONtpWH2D/Bat7JrMGQlAqP18+ajeefNBWcBkpcPpPJs+rz
        8IV796AVUdYSJS2peJEkgp3etINdK+zkftgtUHI=
X-Google-Smtp-Source: AMsMyM5ZAu0X5NO5IYG5iKKKhcRHxZG9q45G1CimN5may5hidrk8EljMLFzPTP/0aREju3rVxawWUb30ZaLPeDeKSvM=
X-Received: by 2002:a05:6808:23ca:b0:350:92c4:3422 with SMTP id
 bq10-20020a05680823ca00b0035092c43422mr461010oib.144.1664595862400; Fri, 30
 Sep 2022 20:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220929072004.874795-1-sergio.paracuellos@gmail.com>
 <20220929072004.874795-4-sergio.paracuellos@gmail.com> <20220930174340.GA536589-robh@kernel.org>
In-Reply-To: <20220930174340.GA536589-robh@kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 1 Oct 2022 05:44:11 +0200
Message-ID: <CAMhs-H-3PnAWM_+x1Z0DYjA59aSOVxdHcXrj39BjeoxDmaN5RA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mips: brcm: convert CPU bindings for
 BMIPS architecture
To:     Rob Herring <robh@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
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

Hi Rob,

On Fri, Sep 30, 2022 at 7:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 09:20:04AM +0200, Sergio Paracuellos wrote:
> > Convert the yaml binding for available CPUs in BMIPS architecture.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/mips/brcm/brcm,bmips-cpus.yaml   | 102 ++++++++++++++++++
> >  .../bindings/mips/brcm/brcm,bmips.txt         |   8 --
>
> Ah, here it is.

Yes, this has to be removed :)

>
> >  2 files changed, 102 insertions(+), 8 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bm=
ips-cpus.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mips/brcm/brcm,bm=
ips.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpu=
s.yaml b/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
> > new file mode 100644
> > index 000000000000..60aa7df9a543
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mips/brcm/brcm,bmips-cpus.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mips/brcm/brcm,bmips-cpus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MIPS CPUs bindings
> > +
> > +maintainers:
> > +  - Hauke Mehrtens <hauke@hauke-m.de>
> > +  - Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > +
> > +description: |
>
> Don't need '|' if no formatting to preserve.

Understood.

>
> > +  The device tree allows to describe the layout of BMIPS CPUs.
> > +
> > +patternProperties:
> > +  "^/":
> > +    type: object
> > +    $ref: "/schemas/mips/brcm/soc.yaml#"
>
> This is doesn't do anything.
>
> Your schema is never applied either as 'select' defaults to false if
> there's not 'compaatible' or '$nodename' in the schema.

I see, I thought referring to this was enough since 'compatible' and
$nodename are defined in soc.yaml schema.

>
> > +
> > +properties:
> > +  cpus:
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +      mips-hpt-frequency:
> > +        description: This is common to all CPUs in the system so it li=
ves
> > +          under the "cpus" node.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +    patternProperties:
> > +      "^cpu@[0-9]$":
> > +        type: object
> > +        $ref: "/schemas/mips/cpus.yaml#"
> > +
> > +    required:
> > +      - '#address-cells'
> > +      - '#size-cells'
> > +
> > +    allOf:
> > +      - if:
> > +          properties:
> > +            compatible:
> > +              contains:
> > +                enum:
> > +                  - "brcm,bcm3368"
> > +                  - "brcm,bcm3384"
> > +                  - "brcm,bcm33843"
> > +                  - "brcm,bcm3384-viper"
> > +                  - "brcm,bcm33843-viper"
> > +                  - "brcm,bcm6328"
> > +                  - "brcm,bcm6358"
> > +                  - "brcm,bcm6362"
> > +                  - "brcm,bcm6368"
> > +                  - "brcm,bcm63168"
> > +                  - "brcm,bcm63268"
> > +                  - "brcm,bcm7125"
> > +                  - "brcm,bcm7346"
> > +                  - "brcm,bcm7358"
> > +                  - "brcm,bcm7360"
> > +                  - "brcm,bcm7362"
> > +                  - "brcm,bcm7420"
> > +                  - "brcm,bcm7425"
> > +        then:
> > +          required:
> > +            - mips-hpt-frequency
>
> Other than this property, the cpus.yaml schema in dtschema covers all
> this.
>
> You allow mips-hpt-frequency on any platform including non-MIPS if this
> schema actually got applied. Is this intended for all MIPS platforms or
> just for Broadcom platforms? The former is hard to support as how do we
> express which platforms are MIPS in schemas. In the latter case,
> brcm/soc.yaml could have something like this:
>
> properties:
>   cpus:
>     $ref: /schemas/cpus.yaml#
>     unevaluatedProperties: false
>
>     properties:
>       mips-hpt-frequency:
>         ...
>
>     required:
>       - mips-hpt-frequency

Ok, since this is only for Broadcom platforms, I will move this
information to the soc.yaml schema and completely drop this patch in
v4.

Thanks for reviewing, Rob.

Best regards,
    Sergio Paracuellos

>
> Rob
