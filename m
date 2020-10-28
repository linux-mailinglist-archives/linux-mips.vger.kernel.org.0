Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C62C29D326
	for <lists+linux-mips@lfdr.de>; Wed, 28 Oct 2020 22:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbgJ1VlW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 17:41:22 -0400
Received: from mail.thorsis.com ([92.198.35.195]:57588 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgJ1VlT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Oct 2020 17:41:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id E87BE1DAB;
        Wed, 28 Oct 2020 08:34:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GP4IZOfp6VRq; Wed, 28 Oct 2020 08:34:49 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id C2C943F0C; Wed, 28 Oct 2020 08:34:48 +0100 (CET)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema warnings for pwm-leds
Date:   Wed, 28 Oct 2020 08:34:38 +0100
Message-ID: <5231529.NqohY00Rok@ada>
In-Reply-To: <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
References: <20201005203451.9985-1-post@lespocky.de> <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de> <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Ahmad,

Am Dienstag, 27. Oktober 2020, 11:58:10 CET schrieb Ahmad Fatoum:
> Hello,
>=20
> On 10/27/20 11:05 AM, Alexander Dahl wrote:
> > Hello Ahmad,
> >=20
> > thanks for your feedback, comments below.
> >=20
> >>> -	led-rgb {
> >>> +	led-controller-2 {
> >>=20
> >> Is a single RGB LED really a controller?
> >=20
> > I just followed the recommendations by Rob here.
>=20
> Do you happen to know if the new multicolor LED support could be used her=
e?

AFAIK not yet. The multicolor class should be ready and it is used by some=
=20
drivers for I=B2C connected LED controllers, but if I understood Pavel=20
correctly, additional work has to be done for a gpio and/or pwm multicolor=
=20
driver. See this thread from August for example:

https://lore.kernel.org/linux-leds/2530787.iFCFyWWcSu@g550jk/

>=20
> I find it unfortunate that the device tree loses information relevant to
> humans to adhere to a fixed nomenclature. Apparently led-controller isn't
> even codified in the YAML binding (It's just in the examples). If you
> respin, please add a comment that this is a single RGB led. I'd prefer to
> keep the information in the DTB as well though.

The "new" attributes 'function' and 'color' attributes should cover this=20
information. IIRC those were introduced sometime before v5.4 and documentat=
ion=20
is in the leds/common.yaml binding. I don't see it in the scope of this pat=
ch=20
series, but if we would merge this warning fix first, the information is lo=
st,=20
so maybe those attributes should be added before?=20

My heuristics on that would be looking at the label and if there's a distin=
ct=20
color in it, add the color property. I could do that for all pwm LEDs known=
 to=20
the tree currently. That would be a bigger task for GPIO leds though. ;-)

>=20
> >>>  		compatible =3D "pwm-leds";
> >>>=20
> >>> -		led-red {
> >>> +		led-2 {
> >>=20
> >> Shouldn't this have been led-1 as well or is the numbering "global" ?
> >=20
> > Also good question. This numbering is for dts only, it usually does
> > not correspond with LEDs on the board, so it could be numbered per
> > led-controller as well?
>=20
> I'd prefer that it starts by 1. That way it's aligned with PWM channel
> ID.

Ack.

>=20
> Thanks for fixing the dtschema warnings by the way!

Well, I "introduced" them by converting the leds-pwm binding to yaml (not=20
merged yet), so I could as well fix the warnings then? ;-)

Greets
Alex

>=20
> Cheers,
> Ahmad
>=20
> > Greets
> > Alex
> >=20
> >>>  			label =3D "mc1:red:rgb";
> >>>  			pwms =3D <&leds_pwm 1 1000000 0>;
> >>>  			max-brightness =3D <255>;
> >>>  			active-low;
> >>>  	=09
> >>>  		};
> >>>=20
> >>> -		led-green {
> >>> +		led-3 {
> >>>=20
> >>>  			label =3D "mc1:green:rgb";
> >>>  			pwms =3D <&leds_pwm 2 1000000 0>;
> >>>  			max-brightness =3D <255>;
> >>>  			active-low;
> >>>  	=09
> >>>  		};
> >>>=20
> >>> -		led-blue {
> >>> +		led-4 {
> >>>=20
> >>>  			label =3D "mc1:blue:rgb";
> >>>  			pwms =3D <&leds_pwm 3 1000000 0>;
> >>>  			max-brightness =3D <255>;


=2D-=20



