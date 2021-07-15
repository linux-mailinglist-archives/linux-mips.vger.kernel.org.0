Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D627D3CA124
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 17:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237401AbhGOPJP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 11:09:15 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:45660 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbhGOPJP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 11:09:15 -0400
Received: by mail-vs1-f49.google.com with SMTP id h5so3135091vsg.12;
        Thu, 15 Jul 2021 08:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=spa2fSuHOZDVb4Y0JrFsA4UPYD9gWGf/Hi9IWPMD4tk=;
        b=hBcQsUpqwfYeocR43lIxMlJRgjv6lwn7Iv8hna3S+Ht4sR+800y2QqG36zMI1LxuGP
         QslVsVxixu1RAi4NgoFFUyIemfsGYKhCEI18Ky6SUVWtdLy7VNnMJ087gi+l7Z8c20tK
         iAqqVFrDCpt3W712wMgJaNz1k5C7ErELBVHfaZwAQkYmbJVf3gOvySym1/f7EorWLFt6
         6x4f0LwuYTUqZj0J0DmFMyt5i9uW4DRdiVhkd3gSFsDN6lZQIYZDU+ylMJPnYbYFvLQx
         xRy/SRqw5IyVJTLa0an0Bdwb8r+TgbelfERIu1mpVqOk5/WQ3cjpxUgx5szpgB/svWt7
         wXZQ==
X-Gm-Message-State: AOAM531NrCTC5kxhod0uevch2UnryzF//VmdVlOHbheMGUivGs+UWg+5
        6ZNKOSzCaTqyFCvjhod8AQegbmb3zYUK4gV1waI=
X-Google-Smtp-Source: ABdhPJwze3CW9x6omBam+iWIlxtLg4VtbCu7QGTvnSyaZy1RtqC8SgJGYFhjgfWFrRzVi3MyWPub2E2al6aDXxxLQmw=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr7082017vsd.42.1626361581240;
 Thu, 15 Jul 2021 08:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125902.1162428-1-geert@linux-m68k.org>
 <20210625125902.1162428-3-geert@linux-m68k.org> <20210714203624.GA3466861@robh.at.kernel.org>
 <CAMuHMdVso6wpX-u6oG+i1B3=4NFO4tyZgQmQW-nG5MQH27t9BA@mail.gmail.com> <CAL_JsqLbxkbyK0c0mUadxu0OQtQxezY4DNSLkBZWpETwuG_70w@mail.gmail.com>
In-Reply-To: <CAL_JsqLbxkbyK0c0mUadxu0OQtQxezY4DNSLkBZWpETwuG_70w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Jul 2021 17:06:10 +0200
Message-ID: <CAMuHMdWSLWspT==+f4Sm085u+3whuhq5_9jnLjG9kb0+pSWaZw@mail.gmail.com>
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

On Thu, Jul 15, 2021 at 4:32 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Jul 15, 2021 at 1:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Jul 14, 2021 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> > > On Fri, Jun 25, 2021 at 02:58:46PM +0200, Geert Uytterhoeven wrote:
> > > > The Holtek HT16K33 LED controller is not only used for driving
> > > > dot-matrix displays, but also for driving segment displays.
> > > >
> > > > Document compatible values for the Adafruit 7-segment[1] and
> > > > 14-segment[2] FeatherWing expansion boards with red displays.  According
> > > > to the schematics, all other Adafruit 7-segment and 14-segment display
> > > > backpack and FeatherWing expansion boards (including bare boards and
> > > > boards fitted with displays) are compatible with these two boards.
> > > > Add a "color" property to support the different color variants.
> > > >
> > > > [1] https://www.adafruit.com/product/3108
> > > > [2] https://www.adafruit.com/product/3130
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > > > --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> > > > +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> > > > @@ -14,14 +14,23 @@ allOf:
> > > >
> > > >  properties:
> > > >    compatible:
> > > > -    const: holtek,ht16k33
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
> > > > +          - const: holtek,ht16k33
> > > > +
> > > > +      - items:
> > > > +          - const: adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing Display (Red)
> > > > +          - const: holtek,ht16k33
> > >
> > > These 2 entries can be combined.
> >
> > Right.  This split dates back from when I considered adding all
> > possible compatible values.  It can indeed be simplified to:
> >
> >           - enum:
> >               - adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing
> > Display (Red)
> >               - adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing
> > Display (Red)
> >           - const: holtek,ht16k33
> >
> > > Or make the comment a 'description'.
> >
> > What do you mean?
>
> Adding this:
>
> description: '0.54" Quad Alphanumeric FeatherWing Display (Red)'

Sorry, I still don't get it.
Note that there are two different adafruit,NNNN compatible values.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
