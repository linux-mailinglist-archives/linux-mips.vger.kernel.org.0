Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDF5387B39
	for <lists+linux-mips@lfdr.de>; Tue, 18 May 2021 16:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233250AbhEROgr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 May 2021 10:36:47 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:39794 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbhEROgp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 May 2021 10:36:45 -0400
Received: by mail-ua1-f47.google.com with SMTP id a12so3301727uak.6;
        Tue, 18 May 2021 07:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zebz9Gz8Zw8lQG2LiaFvqSG6xwA9z2xU/a+9st7RAd4=;
        b=QX5XhXPgXZXKx+b6wLRpuQjUKP5WvNh3V6YWnWL432vHixlzaOrnACFcVgMg2PaoHS
         KIafGF2j35uUqwjL/7/ypWz30iikkN8M8d0yqiLEmW4BKa9l0qSytViZRYRNeP29MSCu
         R5pSaTs6+m18MioQwsUE69u/Os6MNuJ+EAww/mVLpsIHSAalJuMjh5EAlJXonA+x+AGS
         LpZSbH2Mmx/pE3XkGqpPDvU0d9aCGJZOhln5TJaBIaEUZqirpG53bN0KwDSEA6NERwrg
         e/20rDjxFe+fRXOOUyZB4m2tsxsP9iBI4aTbcO3W+f/1nfnF6Fp4NeFT1Kounffe2bgT
         1YPg==
X-Gm-Message-State: AOAM530dorFPjcpfccUm4a/PE0DIiCd/HDKI29Z9x/6rL6rr25VGWOZ5
        FTJUexx7EJVmMg2ZyfXRH/d6DKG4yRSMZLCIksPxh0QmvEg=
X-Google-Smtp-Source: ABdhPJzasGlFQRXLxNTx9IOFZHu2tN4P8gFB4eopIGDQ9iVTdObR7fr+c/2eBhcaOmDqqiI3Ejua84TD9jYUXq1w3e0=
X-Received: by 2002:ab0:7705:: with SMTP id z5mr6782625uaq.2.1621348527338;
 Tue, 18 May 2021 07:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-3-geert@linux-m68k.org> <fb42abb0e79a57e2aab123468d95ff7e@protonic.nl>
In-Reply-To: <fb42abb0e79a57e2aab123468d95ff7e@protonic.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 May 2021 16:35:16 +0200
Message-ID: <CAMuHMdXN9bPnEjXJUWszS5iwuVLBHJV7c+jhBU1t1EXnAnFYig@mail.gmail.com>
Subject: Re: [PATCH 02/17] dt-bindings: auxdisplay: ht16k33: Document Adafruit
 segment displays
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hoi Robin,

On Tue, Mar 23, 2021 at 10:12 AM robin <robin@protonic.nl> wrote:
> On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> > The Holtek HT16K33 LED controller is not only used for driving
> > dot-matrix displays, but also for driving segment displays.
> >
> > Document compatible values for the Adafruit 7-segment[1] and
> > 14-segment[2] FeatherWing expansion boards with red displays.
> > According
> > to the schematics, all other Adafruit 7-segment and 14-segment display
> > backpack and FeatherWing expansion boards (including bare boards and
> > boards fitted with displays) are compatible with these two boards.
> > Add a "color" property to support the different color variants.
> >
> > [1] https://www.adafruit.com/product/3108
> > [2] https://www.adafruit.com/product/3130
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> > +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> > @@ -14,14 +14,23 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: holtek,ht16k33
> > +    oneOf:
> > +      - items:
> > +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment
> > FeatherWing Display (Red)
> > +          - const: holtek,ht16k33
> > +
> > +      - items:
> > +          - const: adafruit,3130  # 0.54" Quad Alphanumeric
> > FeatherWing Display (Red)
> > +          - const: holtek,ht16k33
> > +
> > +      - const: holtek,ht16k33     # Generic 16*8 LED controller with
> > dot-matrix display
> >
> >    reg:
> >      maxItems: 1
> >
> >    refresh-rate-hz:
> >      maxItems: 1
> > -    description: Display update interval in Hertz
> > +    description: Display update interval in Hertz for dot-matrix
> > displays
>
> The above should be included in patch 16

I disagree: bindings are independent from the driver implementation.

> >    interrupts:
> >      maxItems: 1
> > @@ -41,10 +50,17 @@ properties:
> >      default: 16
> >      description: Initial brightness level
> >
> > +  color: true
> > +    description:
> > +      Color of the display.  Use one of the LED_COLOR_ID_* prefixed
> > definitions
> > +      from the header include/dt-bindings/leds/common.h.  The default
> > is red.
> > +    minimum: 0
> > +    maximum: 9
> > +    default: 1
> > +
>
> The above should be included in patch 17

Same here.

> >  required:
> >    - compatible
> >    - reg
> > -  - refresh-rate-hz
>
> 'refresh-rate-hz' is still a required property for the dot-matrix /
> fbdev setup.

True.

> If it can no longer be listed here than maybe its nice to mention that
> it's required
> somewhere else (in it's description?).

    if:
      properties:
        compatible:
          const: holtek,ht16k33
    then:
      required:
        - refresh-rate-hz

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
