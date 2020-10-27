Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC81529A904
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 11:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897319AbgJ0KGV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Oct 2020 06:06:21 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:49419 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897315AbgJ0KGV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Oct 2020 06:06:21 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.33.129]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAwPZ-1ki3E72ZmD-00BOoU; Tue, 27 Oct 2020 11:05:50 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1kXLrL-0000bl-4B; Tue, 27 Oct 2020 11:05:45 +0100
Date:   Tue, 27 Oct 2020 11:05:38 +0100
From:   Alexander Dahl <post@lespocky.de>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Alexander Dahl <post@lespocky.de>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
Message-ID: <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
Mail-Followup-To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-leds@vger.kernel.org
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-11-post@lespocky.de>
 <b387bda8-3643-1d27-4996-2aa4dc94d69f@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2ljgzjfbsktyrri5"
Content-Disposition: inline
In-Reply-To: <b387bda8-3643-1d27-4996-2aa4dc94d69f@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: 1f50ff0161e86bf11bda3e1dba359304
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:Vw9aMrR0R/XXJTGOFUzp7IBcBAkiGMqAM1t7QjnnPJIB4tAv3Tf
 biGI/Y9Kx4IzMWVs8CTnpIVo6Rx8pNhfQMBsFdqSdhRF3/ZkK4UIpr2Ngy1dTMTNx3cIW49
 FPtefmmaTSx7dv/2+ImPa+ZELp4S8PH7JuTvgQeGjXJtT3vYwvawOACjeVAiyGTIDHvYR80
 Iy9TSDhI+aVB4SK0TjAoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HqZLSuoekkY=:SvZzN96a5ayfkn3Sd0dhcn
 94L8r93QyLGiiU1GbFug9GWtryfQG4Q5JFULv8JY+KQRvrAO6pMaFuLes5ey2thR/0ibB9pCk
 MmOeFekZdHfjuQfFYnY+jtfEnE6qPQLzb+H9MHX62FYxDngNh4Na1R8nT3G6ZHbsr8ABNrpl6
 SP42oLbI2A0bQbWEhKgk2/MjAp85oA9yra4rK5i+VAv49w74vyEjdUHqLPmGHmawvRBT6/3nl
 qPRHT8Lr/BpYRQfu9WUEwf5v/Em76yuBL3JXS3MwcIahHa/2oYNYIGHt1qdyPrPIvr58+UimT
 IgPycdIeZabfgzg191w7d6yiM7Us3efJ6YzVAKl06d302L6jA2QoNLVEF5sCi6p9w/ITOosGD
 T77Ve7HB8kwsxhliXDSAUJRW/PpFGrR7mtQsWRg1T5TvKPgtvYU6iv44MgZ+3
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--2ljgzjfbsktyrri5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ahmad,

thanks for your feedback, comments below.

On Tue, Oct 27, 2020 at 08:03:40AM +0100, Ahmad Fatoum wrote:
> Hello Alexander,
>=20
> On 10/5/20 10:34 PM, Alexander Dahl wrote:
> > The node names for devices using the pwm-leds driver follow a certain
> > naming scheme (now).  Parent node name is not enforced, but recommended
> > by DT project.
> >=20
> >   DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> >   CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> > /home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: l=
ed-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes:=
 '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
> >         From schema: /home/alex/src/linux/leds/Documentation/devicetree=
/bindings/leds/leds-pwm.yaml
> >=20
> > Signed-off-by: Alexander Dahl <post@lespocky.de>
>=20
> Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>=20
> But got two questions below:
>=20
> > ---
> >=20
> > Notes:
> >     v6 -> v7:
> >       * split up patch (one per sub arch)
> >       * added actual warnings to commit message
> >=20
> >  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/=
dts/stm32mp157c-lxa-mc1.dts
> > index 5700e6b700d3..25d548cb975b 100644
> > --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> > +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> > @@ -36,34 +36,34 @@
> >  		stdout-path =3D &uart4;
> >  	};
> > =20
> > -	led-act {
> > +	led-controller-1 {
> >  		compatible =3D "gpio-leds";
> > =20
> > -		led-green {
> > +		led-1 {
> >  			label =3D "mc1:green:act";
> >  			gpios =3D <&gpioa 13 GPIO_ACTIVE_LOW>;
> >  			linux,default-trigger =3D "heartbeat";
> >  		};
> >  	};
> > =20
> > -	led-rgb {
> > +	led-controller-2 {
>=20
> Is a single RGB LED really a controller?

I just followed the recommendations by Rob here.=20

> >  		compatible =3D "pwm-leds";
> > =20
> > -		led-red {
> > +		led-2 {
>=20
> Shouldn't this have been led-1 as well or is the numbering "global" ?

Also good question. This numbering is for dts only, it usually does
not correspond with LEDs on the board, so it could be numbered per
led-controller as well?

Greets
Alex

>=20
> >  			label =3D "mc1:red:rgb";
> >  			pwms =3D <&leds_pwm 1 1000000 0>;
> >  			max-brightness =3D <255>;
> >  			active-low;
> >  		};
> > =20
> > -		led-green {
> > +		led-3 {
> >  			label =3D "mc1:green:rgb";
> >  			pwms =3D <&leds_pwm 2 1000000 0>;
> >  			max-brightness =3D <255>;
> >  			active-low;
> >  		};
> > =20
> > -		led-blue {
> > +		led-4 {
> >  			label =3D "mc1:blue:rgb";
> >  			pwms =3D <&leds_pwm 3 1000000 0>;
> >  			max-brightness =3D <255>;
> >=20
>=20
> --=20
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--=20
/"\ ASCII RIBBON | =BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--2ljgzjfbsktyrri5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAl+X8OwACgkQNK3NAHIh
XMZUCBAAppmo4xZ1dQjN/xRLRcEKPicklMKgdZM2Y7qXbj8/g/pLNccy0Bm8Te42
+YhzNYJYedg+l+0zp9woMXHJXDHQhPR50Jb7e2guhZ8vw1kTGw4CUy7vbYDB4PN/
dy4779zWgpc5623/kuRWUdMg/xY5vKbFXjlYbGxeg9WvjIkSgs4k99tofZS/S279
0ehKX0l0T4RRge+RZBjj1wgrBFdSJEfgMqygeHNWIWgXBbZdlRe9Vp05wkKlfmZd
llZiDT0CedpeUffQz3Bm4nSYS6awb874rAOukG3sdfIBs8BI7r42c3A2uUsNgtCT
SFdaBoNc1XlUJgNfj6oH/KR0CUnJ65B0D+B64ZFU4WwhVXdcdjNOCgAUwOaGaWCA
VFeoHJns9um5ObsiFS6BfW6lZxidSecOzI4NIMLuAnxD91PqwrQ3cmZYFrU2Cl41
2kkqyV4OqbVmsYzNnASqeITTgJZ/v3QzYrNcpw1ORjR+gjkWS9qs7+97QYDEzgBD
EpyXEAQIf3OMCaw3tLZX4hnYrZmlVEKxiqWoGcMN9QNg/ykB3CDMDi5CCwWN94xl
sEi7LxQ6Boxl5p0xxkdhgbyzbDFp7ya+x3fbFnmQ09vGAfniT9/9QoMOl5aFJi79
Tg6ONSx9fTN9zgbeXibeyB/+6e6Sqpu5vLMTnn+4KJ2ypZ8vQUs=
=tczc
-----END PGP SIGNATURE-----

--2ljgzjfbsktyrri5--
