Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781B92C3ECA
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 12:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgKYLJE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 06:09:04 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:38010 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgKYLJE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Nov 2020 06:09:04 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DE8411C0B81; Wed, 25 Nov 2020 12:08:58 +0100 (CET)
Date:   Wed, 25 Nov 2020 12:08:57 +0100
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
Message-ID: <20201125110857.GB29328@amd>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-3-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-3-post@lespocky.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
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

Thanks, applied.

--=20
http://www.livejournal.com/~pavelmachek

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++O0kACgkQMOfwapXb+vLvYQCfSrT2zUj7/3jKJFtBZiq7y/0y
Y9sAoIwWjoquHqI4g3lZi2UtfAqMF2A3
=YG1i
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
