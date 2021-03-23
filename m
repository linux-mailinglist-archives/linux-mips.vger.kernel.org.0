Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60371346A59
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 21:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhCWUlM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 16:41:12 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53058 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbhCWUkm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 16:40:42 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 082FF1C0B81; Tue, 23 Mar 2021 21:40:39 +0100 (CET)
Date:   Tue, 23 Mar 2021 21:40:38 +0100
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
Message-ID: <20210323204038.GA10002@duo.ucw.cz>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-18-geert@linux-m68k.org>
 <543ec200931af3192541fef51bc8e96a@protonic.nl>
 <CAMuHMdXMQYoGbyLsbiZSEWKK0+iPZe7WELmtDUTjqK-VKMZURg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXMQYoGbyLsbiZSEWKK0+iPZe7WELmtDUTjqK-VKMZURg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> CC linux-leds (which I intended, but forgot to add)
>=20
> cover letter at
> https://lore.kernel.org/linux-devicetree/20210322144848.1065067-1-geert@l=
inux-m68k.org/

Still does not tell me... riscv on fpga with 4 character display. What
is this? :-).


> On Tue, Mar 23, 2021 at 11:08 AM Robin van der Gracht <robin@protonic.nl>=
 wrote:
> >
> > On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> > > Instantiate a single LED for a segment display.  This allows the user
> > > to
> > > control display brightness and blinking through the LED class API and
> > > triggers, and exposes the display color.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > For setting display brightness, this could use the existing backlight
> > > support for frame buffer devices instantiated for dot-matrix displays.
> > > However, using the leds subsystem instead has the advantage that the
> > > driver can make use of the HT16K33's hardware blinking support, and c=
an
> > > expose the display color.

We have multicolor support now...

> > > -     err =3D ht16k33_brightness_set(priv, MAX_BRIGHTNESS);
> > > +     of_property_read_u32(node, "color", &color);
> > > +     seg->led.name =3D devm_kasprintf(dev, GFP_KERNEL,
> > > +                     DRIVER_NAME ":%s:" LED_FUNCTION_BACKLIGHT,
> > > +                     color < LED_COLOR_ID_MAX ? led_colors[color] : =
"");

And would prefer not to see driver_name as part of LED name.

> > > +     err =3D ht16k33_brightness_set(priv, seg->led.brightness);
> > >       if (err)
> > >               return err;
> >
> > The LED class can pretty much do what the backlight class can and more.
> >
> > Maybe we can stop registering a backlight device in the fbdev case and
> > register a led device for both. This makes the code cleaner and drops
> > a dependency but will break backwards compatibility.
> >
> > I'd prefer a single solution that covers both use cases, but I'm not
> > sure about the 'breaking backwards compatibility' consequence...

For new drivers, breaking compatibility should not be a problem.

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYFpSRgAKCRAw5/Bqldv6
8gx1AJ9DrhY+6jZ2APCdwgx/TBVkD/BG/QCfZ9Mg2jmE6B1ZET6bJceiU04bD7g=
=7qmH
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
