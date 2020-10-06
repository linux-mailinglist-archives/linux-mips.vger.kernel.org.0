Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C7B28461C
	for <lists+linux-mips@lfdr.de>; Tue,  6 Oct 2020 08:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgJFGef (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Oct 2020 02:34:35 -0400
Received: from mail.thorsis.com ([92.198.35.195]:37764 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbgJFGef (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Oct 2020 02:34:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 500A72A4B;
        Tue,  6 Oct 2020 08:34:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DJmoHkL2M4S2; Tue,  6 Oct 2020 08:34:33 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 2A9803D26; Tue,  6 Oct 2020 08:34:33 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Alexander Dahl <post@lespocky.de>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date:   Tue, 06 Oct 2020 08:34:23 +0200
Message-ID: <3367098.sbkyfNuaKI@ada>
In-Reply-To: <20201006021729.GA4822@labundy.com>
References: <20201005203451.9985-1-post@lespocky.de> <20201005203451.9985-4-post@lespocky.de> <20201006021729.GA4822@labundy.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Jeff,

Am Dienstag, 6. Oktober 2020, 04:17:29 CEST schrieb Jeff LaBundy:
> Hi Alexander,
>=20
> On Mon, Oct 05, 2020 at 10:34:42PM +0200, Alexander Dahl wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> >=20
> >   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> >=20
> > /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.exa=
mpl
> > e.dt.yaml: pwmleds: 'panel' does not match any of the regexes:
> > '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'>=20
> >         From schema:
> >         /home/alex/src/linux/leds/Documentation/devicetree/bindings/led=
s/
> >         leds-pwm.yaml>=20
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
> > ---
> >=20
> > Notes:
> >     v6 -> v7:
> >       * added warning message to commit message (Krzysztof Kozlowski)
> >    =20
> >     v6:
> >       * added this patch to series
> > =20
> >  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > b/Documentation/devicetree/bindings/mfd/iqs62x.yaml index
> > 541b06d80e73..92dc48a8dfa7 100644
> > --- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
> >=20
> > @@ -90,10 +90,11 @@ examples:
> >              };
> >     =20
> >      };
> >=20
> > -    pwmleds {
> > +    led-controller {
> >=20
> >              compatible =3D "pwm-leds";
> >=20
> > -            panel {
> > +            led-1 {
> > +                    label =3D "panel";
> >=20
> >                      pwms =3D <&iqs620a_pwm 0 1000000>;
> >                      max-brightness =3D <255>;
> >             =20
> >              };
>=20
> I like the consistency this brings. My only feedback is that in the other
> examples I found (common.yaml and leds-gpio.yaml), the children count off
> from 0 (e.g. led-0) instead of 1 as your series appears to.

You're right.  And that's also the same in leds-lp50xx.yaml and =E2=80=A6 w=
ell I did=20
not look close enough, maybe the numbering scheme on the PCB on my desk=20
confused me.

Okay, we are already talking about starting index.  What about the parent=20
node's "led-controller" then in case there are more than one?  IIRC Rob=20
acknowledged starting from 1 like "led-controller-1", "led-controller-2" an=
d=20
so on.

> That's not a huge deal; it simply seems more consistent to count from the
> first index allowed by the regex (0). The patch is still fine, and so:
>=20
> Acked-by: Jeff LaBundy <jeff@labundy.com>

Thanks.

I'm not sure how many more iterations of this series we will need, at least=
=20
one for the binding license acks I guess, so I could also adapt the child n=
ode=20
indexes in schema and actual dts files in v8 or so.

Greets
Alex



