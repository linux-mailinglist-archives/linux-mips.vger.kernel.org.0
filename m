Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C32388C45
	for <lists+linux-mips@lfdr.de>; Wed, 19 May 2021 13:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241613AbhESLDy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 May 2021 07:03:54 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:42572 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhESLDx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 May 2021 07:03:53 -0400
Received: by mail-ua1-f51.google.com with SMTP id 14so4285641uac.9;
        Wed, 19 May 2021 04:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iunas8Mi941MyoBN1CHeU8fBTsSG9zGyW/IfHp/dBKQ=;
        b=DVOXGA3du/p4pMPH+6Qp/NkX3KuwKUi6lLKdUO7z6oZbN0rS5biIFe62PFPjAo1CEg
         +t+u5XqYoEF7WevkOUi3OTC3lm0rXRQRhuXUGj2rGwL2zB2e2vAcIDzE6AK5tgS6LRcT
         UtlVI2MShgwFWu4ZKkiQwa76B4/AMw1AJV9VAlW/NESyOzaRx1CTi6EdHAmlqqESZLoq
         On3+OpvkTje5/+zf/iQ8IlKKvj5FxWtIn1WnsivzyGN+EfikB/pvk5YA5LpZnBVmlQqc
         pbhJmXJGTV9WL/NnHFhRVy6kDWAYoUdKVRq4+ckazV9SR5f89XdU2TspNKsTrkDa+aJH
         EhoQ==
X-Gm-Message-State: AOAM533c5BKFji9/XNx8ct5KuQLfpD69yd50Pmah6XnzZ+GO4Gsrkp+P
        XMGyrqZGVooVcEEwl98YqzCFLN3rwrVdm71a8vQ=
X-Google-Smtp-Source: ABdhPJzfzJnySIXsfB7dacrXLzr9y6pkADRFbV1uK4vf3UqKoV0QwMw635//fNsj2Q/inI5WPRKMkzJRADi+erKlXRo=
X-Received: by 2002:ab0:f5:: with SMTP id 108mr14708228uaj.106.1621422152113;
 Wed, 19 May 2021 04:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-3-geert@linux-m68k.org> <fb42abb0e79a57e2aab123468d95ff7e@protonic.nl>
 <CAMuHMdXN9bPnEjXJUWszS5iwuVLBHJV7c+jhBU1t1EXnAnFYig@mail.gmail.com> <a5cf3ba594ab7ba36c1f4d5760796625@protonic.nl>
In-Reply-To: <a5cf3ba594ab7ba36c1f4d5760796625@protonic.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 May 2021 13:02:20 +0200
Message-ID: <CAMuHMdVZMtJ8nRZXWnNz9U0_GKkUQn2+gkvx+Q=+c5tcfEVHUQ@mail.gmail.com>
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

On Wed, May 19, 2021 at 12:37 PM Robin van der Gracht <robin@protonic.nl> wrote:
> On 2021-05-18 16:35, Geert Uytterhoeven wrote:
> > On Tue, Mar 23, 2021 at 10:12 AM robin <robin@protonic.nl> wrote:
> >> On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> >> > The Holtek HT16K33 LED controller is not only used for driving
> >> > dot-matrix displays, but also for driving segment displays.
> >> >
> >> > Document compatible values for the Adafruit 7-segment[1] and
> >> > 14-segment[2] FeatherWing expansion boards with red displays.
> >> > According
> >> > to the schematics, all other Adafruit 7-segment and 14-segment display
> >> > backpack and FeatherWing expansion boards (including bare boards and
> >> > boards fitted with displays) are compatible with these two boards.
> >> > Add a "color" property to support the different color variants.
> >> >
> >> > [1] https://www.adafruit.com/product/3108
> >> > [2] https://www.adafruit.com/product/3130
> >> >
> >> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> >> > --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> >> > +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> >> > @@ -14,14 +14,23 @@ allOf:
> >> >
> >> >  properties:
> >> >    compatible:
> >> > -    const: holtek,ht16k33
> >> > +    oneOf:
> >> > +      - items:
> >> > +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment
> >> > FeatherWing Display (Red)
> >> > +          - const: holtek,ht16k33
> >> > +
> >> > +      - items:
> >> > +          - const: adafruit,3130  # 0.54" Quad Alphanumeric
> >> > FeatherWing Display (Red)
> >> > +          - const: holtek,ht16k33
> >> > +
> >> > +      - const: holtek,ht16k33     # Generic 16*8 LED controller with
> >> > dot-matrix display
> >> >
> >> >    reg:
> >> >      maxItems: 1
> >> >
> >> >    refresh-rate-hz:
> >> >      maxItems: 1
> >> > -    description: Display update interval in Hertz
> >> > +    description: Display update interval in Hertz for dot-matrix
> >> > displays
> >>
> >> The above should be included in patch 16
> >
> > I disagree: bindings are independent from the driver implementation.
> >
> >> >    interrupts:
> >> >      maxItems: 1
> >> > @@ -41,10 +50,17 @@ properties:
> >> >      default: 16
> >> >      description: Initial brightness level
> >> >
> >> > +  color: true
> >> > +    description:
> >> > +      Color of the display.  Use one of the LED_COLOR_ID_* prefixed
> >> > definitions
> >> > +      from the header include/dt-bindings/leds/common.h.  The default
> >> > is red.
> >> > +    minimum: 0
> >> > +    maximum: 9
> >> > +    default: 1
> >> > +
> >>
> >> The above should be included in patch 17
> >
> > Same here.
>
> My thought was that one without the other makes no sense. But if it's common
> practice to create a separate patch for device tree bindings (it's a
> patch-set
> after all) than that's fine with me.

scripts/checkpatch.pl even has a check for that:

    WARN("DT_SPLIT_BINDING_PATCH",
         "DT binding docs and includes should be a separate patch.
See: Documentation/devicetree/bindings/submitting-patches.rst\n");

See also rule #5 in the doc referred above:

  5) The Documentation/ portion of the patch should come in the series before
     the code implementing the binding.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
