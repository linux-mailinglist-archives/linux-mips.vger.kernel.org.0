Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD743285C4D
	for <lists+linux-mips@lfdr.de>; Wed,  7 Oct 2020 12:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgJGKDU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Oct 2020 06:03:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:51694 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbgJGKDU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Oct 2020 06:03:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E31CE1C0BAA; Wed,  7 Oct 2020 12:03:17 +0200 (CEST)
Date:   Wed, 7 Oct 2020 12:03:17 +0200
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
        Denis Osterland-Heim <denis.osterland@diehl.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: Re: [PATCH v7 01/12] leds: pwm: Remove platform_data support
Message-ID: <20201007100317.GB12224@duo.ucw.cz>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-2-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-2-post@lespocky.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-10-05 22:34:40, Alexander Dahl wrote:
> Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
> interface is not usable from outside and there seems to be no in tree
> user anymore.  All in-tree users of the leds-pwm driver seem to use DT
> currently.  Getting rid of the old platform interface allows the
> leds-pwm driver to switch over from 'devm_led_classdev_register()' to
> 'devm_led_classdev_register_ext()'.
>=20
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Denis Osterland-Heim <denis.osterland@diehl.com>
> Reviewed-by: Marek Beh=FAn <marek.behun@nic.cz>

Thanks, applied.

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX32SZQAKCRAw5/Bqldv6
8mQ3AJ46WIxuzaEV6SZFdJADbrrWIacz1ACgqTcjyUBA1BTFDmThLaIOxfLcv8Q=
=UNVv
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
