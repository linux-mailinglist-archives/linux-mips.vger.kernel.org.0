Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F28285C57
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 12:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgJGKEG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 06:04:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51836 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgJGKEE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Oct 2020 06:04:04 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2F2FE1C0B7A; Wed,  7 Oct 2020 12:04:00 +0200 (CEST)
Date:   Wed, 7 Oct 2020 12:03:59 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201007100359.GC12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-4-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
>=20
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.examp=
le.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9=
a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/b=
indings/leds/leds-pwm.yaml
>=20
> Signed-off-by: Alexander Dahl <post@lespocky.de>

Okay, so I need Rob's ack here, I guess... and rest of the series is
not really for my tree.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32SjwAKCRAw5/Bqldv6
8j2vAKCrp2lJsTwvDpUEUfMmPs/16q8FEwCeMqObBKksCi7uVCLOO12E0DIPrBo=
=7lMU
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
