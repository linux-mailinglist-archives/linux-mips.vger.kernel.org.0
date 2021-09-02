Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9193FEBE6
	for <lists+linux-mips@lfdr.de>; Thu,  2 Sep 2021 12:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbhIBKPj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Sep 2021 06:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbhIBKPj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Sep 2021 06:15:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77564C061757
        for <linux-mips@vger.kernel.org>; Thu,  2 Sep 2021 03:14:40 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1mLjjv-0001on-58; Thu, 02 Sep 2021 12:14:35 +0200
Received: from pengutronix.de (2a03-f580-87bc-d400-c982-e75e-2949-3ac4.ip6.dokom21.de [IPv6:2a03:f580:87bc:d400:c982:e75e:2949:3ac4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id D9ACB6753B1;
        Thu,  2 Sep 2021 10:14:33 +0000 (UTC)
Date:   Thu, 2 Sep 2021 12:14:32 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1] MIPS: Malta: fix alignment of the devicetree buffer
Message-ID: <20210902101432.t3pmkb2od2j4kwth@pengutronix.de>
References: <20210902071951.28722-1-o.rempel@pengutronix.de>
 <20210902090324.GA6429@alpha.franken.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lf3qmsmn6tt4upjw"
Content-Disposition: inline
In-Reply-To: <20210902090324.GA6429@alpha.franken.de>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--lf3qmsmn6tt4upjw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02.09.2021 11:03:24, Thomas Bogendoerfer wrote:
> On Thu, Sep 02, 2021 at 09:19:51AM +0200, Oleksij Rempel wrote:
> > Starting with following patch MIPS Malta is not able to boot:
> > | commit 79edff12060fe7772af08607eff50c0e2486c5ba
> > | Author: Rob Herring <robh@kernel.org>
> > | scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9

If the above patch broke malts, IMHO the fixes tag should be:

Fixes: 79edff12060f ("scripts/dtc: Update to upstream version v1.6.0-51-g18=
3df9e9c2b9")

> > The reason is the alignment test added to the fdt_ro_probe_(). To fix
> > this issue, we need to make sure that fdt_buf is aligned.
> >=20
> > Since the dtc patch was designed to uncover potential issue, I handle
> > initial MIPS Malta patch as initial bug.
> >=20
> > Fixes: e81a8c7dabac ("MIPS: Malta: Setup RAM regions via DT")
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  arch/mips/mti-malta/malta-dtshim.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> applied to mips-next.

Please add stable on Cc, as Malta is broken since v5.12
(79edff12060f =3D=3D v5.12-rc1~104^2~10^2~3).

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--lf3qmsmn6tt4upjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmEwpAUACgkQqclaivrt
76mTHQf7BWkpW1LghtAlZL3lTaWMOdO+5j5+RHC0mRF+Z6fySEUvztZYWmkzxp5a
VgXDui8QA4injioyR+5PYVM8+ELVOi4FGcEpQcoAN48bhROu6iRxTFJvpTwfiRMh
DA3ykNwCF7CIaKsus/TZvSqAHwLrEkj117S2YCId5whvTygYPe/jr4b7wW3bX6lV
1Uqylkf0MA4BKXmJYldmuu5yAExOVWFw+nzbBcsekoVwTxLkQ+yaUVz62scG/UCS
+ZcTNuclOagUrYLKyieo8wp3YNqAU2avyPwsNq4T0dIBrR8I0Daa6oxVKw4Jrjjk
sXMsM7g9ROp9yyt1A1T85aXDGMqP7A==
=gyF1
-----END PGP SIGNATURE-----

--lf3qmsmn6tt4upjw--
