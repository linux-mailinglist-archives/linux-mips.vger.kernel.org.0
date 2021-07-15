Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3896A3CA0BC
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 16:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhGOOfP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 10:35:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:36360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229624AbhGOOfO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 15 Jul 2021 10:35:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B113613C0;
        Thu, 15 Jul 2021 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626359541;
        bh=R3efdEjsMpY5Hq5zkWmKeAeoEBEB0eDYeuw17Vmbi6A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nRAJjiNAqDP6ZRCTV5130jd4rL8aDAy1FqT5Jqc6Yj2vyAdUT/0fs+ox2prXjAFw5
         fWBioBpj83QgySIK985ErnLi0Rd8Hg333sm2V4SmWfqXG7rRqZed1XMTolKITkz4Lg
         86C+LMvv0VmzmLiWz2FE+35MLWvCStxYGs9sCyxZC+9bDpOcsR3kD8iO/Rbm2WtS3x
         f8Ai/DtdXH3EP1kewvb0DxxIHv2Zutfz3LGMuxCy5RNGcyCSX+zvlA1M+Hi1P04uoQ
         cYTOE1oCzmVVLS0/BcL8txSY+tg+POLuWgB9ZQusDYwb4xCkdvA5icIv3CveoGzh0n
         PiUoi9gEAi3mg==
Received: by mail-ej1-f48.google.com with SMTP id hd33so9630865ejc.9;
        Thu, 15 Jul 2021 07:32:21 -0700 (PDT)
X-Gm-Message-State: AOAM533SopwulzQNq/IL1PdHbZIfgL0DRvMk0F037C4g34byhissKx6b
        eZ1/eO5LjvuJ7E5rVDG0QMRyaurt7wszQ55XnA==
X-Google-Smtp-Source: ABdhPJx1t6Uzr2sHA0qgrW54gYSMtuVGSlS0OXbNMC3pr7PmGz1sE39QtW3v9yRJB0imLAfnPk5jZ74+lYR5gdzkTkc=
X-Received: by 2002:a17:906:5fc1:: with SMTP id k1mr5833452ejv.360.1626359540289;
 Thu, 15 Jul 2021 07:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125902.1162428-1-geert@linux-m68k.org>
 <20210625125902.1162428-3-geert@linux-m68k.org> <20210714203624.GA3466861@robh.at.kernel.org>
 <CAMuHMdVso6wpX-u6oG+i1B3=4NFO4tyZgQmQW-nG5MQH27t9BA@mail.gmail.com>
In-Reply-To: <CAMuHMdVso6wpX-u6oG+i1B3=4NFO4tyZgQmQW-nG5MQH27t9BA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 15 Jul 2021 08:32:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbxkbyK0c0mUadxu0OQtQxezY4DNSLkBZWpETwuG_70w@mail.gmail.com>
Message-ID: <CAL_JsqLbxkbyK0c0mUadxu0OQtQxezY4DNSLkBZWpETwuG_70w@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] dt-bindings: auxdisplay: ht16k33: Document
 Adafruit segment displays
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

On Thu, Jul 15, 2021 at 1:12 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> Note that you commented on v2, while I posted v3 yesterday.
>
> On Wed, Jul 14, 2021 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> > On Fri, Jun 25, 2021 at 02:58:46PM +0200, Geert Uytterhoeven wrote:
> > > The Holtek HT16K33 LED controller is not only used for driving
> > > dot-matrix displays, but also for driving segment displays.
> > >
> > > Document compatible values for the Adafruit 7-segment[1] and
> > > 14-segment[2] FeatherWing expansion boards with red displays.  According
> > > to the schematics, all other Adafruit 7-segment and 14-segment display
> > > backpack and FeatherWing expansion boards (including bare boards and
> > > boards fitted with displays) are compatible with these two boards.
> > > Add a "color" property to support the different color variants.
> > >
> > > [1] https://www.adafruit.com/product/3108
> > > [2] https://www.adafruit.com/product/3130
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> > > --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> > > +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> > > @@ -14,14 +14,23 @@ allOf:
> > >
> > >  properties:
> > >    compatible:
> > > -    const: holtek,ht16k33
> > > +    oneOf:
> > > +      - items:
> > > +          - const: adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
> > > +          - const: holtek,ht16k33
> > > +
> > > +      - items:
> > > +          - const: adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing Display (Red)
> > > +          - const: holtek,ht16k33
> >
> > These 2 entries can be combined.
>
> Right.  This split dates back from when I considered adding all
> possible compatible values.  It can indeed be simplified to:
>
>           - enum:
>               - adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing
> Display (Red)
>               - adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing
> Display (Red)
>           - const: holtek,ht16k33
>
> > Or make the comment a 'description'.
>
> What do you mean?

Adding this:

description: '0.54" Quad Alphanumeric FeatherWing Display (Red)'


> > > +
> > > +      - const: holtek,ht16k33     # Generic 16*8 LED controller with dot-matrix display
>
> > >  required:
> > >    - compatible
> > >    - reg
> > > -  - refresh-rate-hz
> > > +
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      const: holtek,ht16k33
> >
> > Isn't this always true?
>
> It is false if there is more than one compatible value.

Ah, yes.

Rob
