Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF15285C3A
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 12:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgJGKCR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 06:02:17 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51530 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgJGKCQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Oct 2020 06:02:16 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A47C41C0B7A; Wed,  7 Oct 2020 12:02:13 +0200 (CEST)
Date:   Wed, 7 Oct 2020 12:02:13 +0200
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v7 02/12] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201007100213.GA12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-3-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-3-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-10-05 22:34:41, Alexander Dahl wrote:
> The example was adapted in the following ways:
>=20
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - align node names to new dt schema rules and dt recommendations
>=20
> License was not explicitly set before.  The license set now is
> recommended by DT project.
>=20
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>=20
> Notes:
>     NOTE: Due to license set/change this needs Acked-by or Signed-off-by =
=66rom:
>       * Peter Ujfalusi
>       * Russell King

Russell King authored two lines of the documentation. He can state
objections now, but I'll not wait for his Acked-by.

>     That was discussed already with Peter (original author), still waiting
>     for Acked-by though =E2=80=A6

If Peter was okay with license change, I guess we can continue here.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32SJQAKCRAw5/Bqldv6
8ih1AKC89CUSap/s2xV4Q89wc/i22r49KACcDa86v1lffE+ltjBCel8iiRX1DGs=
=H5CR
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
