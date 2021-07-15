Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147323C996E
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 09:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240253AbhGOHPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 03:15:46 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:46043 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239259AbhGOHPq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 03:15:46 -0400
Received: by mail-vs1-f41.google.com with SMTP id h5so2435161vsg.12;
        Thu, 15 Jul 2021 00:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r7Wm2VmRQG0S2YATdr39DjvrwdEWRiViM0Z14vn9XxA=;
        b=gDYtdN3TQRLThXUNHY7HhW3Fa0z/0/ZWoZ3tu6a2kr01vFYKXrgDOfQ9DtT+SPevUW
         +U3UiiDAG0Jd9fKtgzLKeiqJXaVjYbWTFvhhvLZKBqiwccnGFDq8pAmcIqdNB3lRFFsD
         p/uVRmqvxz44AiPIUCiVLKE0mYSYM639Jij2Xi8MI4oXW43/Cu9zjYIGQYL8rWUTWqLq
         ELeWQTQ0iUhEyjItmtVsn4PSKt3KHKpA5/VkmD/oo1LBmNOwh224eBOeaS3Z3DIj/e1i
         ElkGGuEoiVDvct36c5VXsB/+aFtl/SzFil2EOM+yNNNVfzS8Fz2emhAUsjKYHCaXtRdX
         5Wjg==
X-Gm-Message-State: AOAM532evuS8QLPMAdcJK+EfFDRC2o+SBjjMW3InScct2QLW4/44FVOk
        YnQqzSDz+diGQjAunHqYrTr4KocoNF0m3GAHnDMbbH+qLai55w==
X-Google-Smtp-Source: ABdhPJzRni57+mECuuBP2Gv0ZHJyw60s3RqhaO1HEhS2XaiHmrzkqi/2inwoECg+MGxuieUBIAKWhF0tZ5lF8m5w2FI=
X-Received: by 2002:a67:1542:: with SMTP id 63mr4611663vsv.40.1626333171886;
 Thu, 15 Jul 2021 00:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125902.1162428-1-geert@linux-m68k.org>
 <20210625125902.1162428-3-geert@linux-m68k.org> <20210714203624.GA3466861@robh.at.kernel.org>
In-Reply-To: <20210714203624.GA3466861@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Jul 2021 09:12:40 +0200
Message-ID: <CAMuHMdVso6wpX-u6oG+i1B3=4NFO4tyZgQmQW-nG5MQH27t9BA@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] dt-bindings: auxdisplay: ht16k33: Document
 Adafruit segment displays
To:     Rob Herring <robh@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

Note that you commented on v2, while I posted v3 yesterday.

On Wed, Jul 14, 2021 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Jun 25, 2021 at 02:58:46PM +0200, Geert Uytterhoeven wrote:
> > The Holtek HT16K33 LED controller is not only used for driving
> > dot-matrix displays, but also for driving segment displays.
> >
> > Document compatible values for the Adafruit 7-segment[1] and
> > 14-segment[2] FeatherWing expansion boards with red displays.  According
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
> > +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
> > +          - const: holtek,ht16k33
> > +
> > +      - items:
> > +          - const: adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing Display (Red)
> > +          - const: holtek,ht16k33
>
> These 2 entries can be combined.

Right.  This split dates back from when I considered adding all
possible compatible values.  It can indeed be simplified to:

          - enum:
              - adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing
Display (Red)
              - adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing
Display (Red)
          - const: holtek,ht16k33

> Or make the comment a 'description'.

What do you mean?

>
> > +
> > +      - const: holtek,ht16k33     # Generic 16*8 LED controller with dot-matrix display

> >  required:
> >    - compatible
> >    - reg
> > -  - refresh-rate-hz
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      const: holtek,ht16k33
>
> Isn't this always true?

It is false if there is more than one compatible value.

>
> > +then:
> > +  required:
> > +    - refresh-rate-hz
> >
> >  additionalProperties: false

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
