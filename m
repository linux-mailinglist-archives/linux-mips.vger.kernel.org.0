Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D698534B9CC
	for <lists+linux-mips@lfdr.de>; Sat, 27 Mar 2021 23:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhC0WTg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Mar 2021 18:19:36 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52908 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbhC0WT3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Mar 2021 18:19:29 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 625DE1C0B78; Sat, 27 Mar 2021 23:19:25 +0100 (CET)
Date:   Sat, 27 Mar 2021 23:19:25 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 17/17] auxdisplay: ht16k33: Add segment display LED
 support
Message-ID: <20210327221925.GA2875@duo.ucw.cz>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-18-geert@linux-m68k.org>
 <543ec200931af3192541fef51bc8e96a@protonic.nl>
 <CAMuHMdXMQYoGbyLsbiZSEWKK0+iPZe7WELmtDUTjqK-VKMZURg@mail.gmail.com>
 <20210323204038.GA10002@duo.ucw.cz>
 <CAMuHMdVF30BCA-7vCiwmKO6KVFhtNLbL+VEW59oxcAfwJ+jXyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVF30BCA-7vCiwmKO6KVFhtNLbL+VEW59oxcAfwJ+jXyg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > > -     err =3D ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> > > > > +     of_property_read_u32(node, "color", &color);
> > > > > +     seg->led.name =3D devm_kasprintf(dev, GFP_KERNEL,
> > > > > +                     DRIVER_NAME ":%s:" LED_FUNCTION_BACKLIGHT,
> > > > > +                     color < LED_COLOR_ID_MAX ? led_colors[color=
] : "");
> >
> > And would prefer not to see driver_name as part of LED name.
>=20
> OK. So what should I use instead? Or just leave the part before the
> first colon empty?

I'd suggest auxdisplay:...:backlight.

And we should start documenting this somewhere.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYF+vbQAKCRAw5/Bqldv6
8vIVAJ4qlSRzvhciUBHaas551C0aXPZaagCdHZUf4XdLOddTipE09Am0CLnpWDE=
=QSsl
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
