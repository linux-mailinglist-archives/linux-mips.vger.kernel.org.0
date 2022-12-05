Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9723764282E
	for <lists+linux-mips@lfdr.de>; Mon,  5 Dec 2022 13:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbiLEMOK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Dec 2022 07:14:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbiLEMOJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Dec 2022 07:14:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40582AA;
        Mon,  5 Dec 2022 04:14:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D26BB61032;
        Mon,  5 Dec 2022 12:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D70EC433D7;
        Mon,  5 Dec 2022 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670242448;
        bh=aU0EeKX8NEFmCRSppqGIfcV+YjV+Rndty44Slx3vuG4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ow+BKXiEznsV2GNM7RNddJDg1iYqbvFIysjh1RjLt5Y7o/4papI+mp9pY87zIp2zD
         EHTAFUr1NRlcSjDwetW0xHhvM+XigQvVqyid2Q2iqHpOiC316bSUvqF28ovhHjM1PA
         ml32vQOJ1PGVzXOcfaSOKVts5vzArUCWdQtOwC7vlaswtZ/F+NwnWKWpBRjHJXJn0g
         W7BLqW0iF3JBThtHy7BV40OuKE6dNoxPf1Nx8nyAMsdu6EtveOJsKfOByepu6e/YIf
         sykM9QOGErQyAUCoezpBd7TXBibgoklVvKIEFWTB/GfiLpkPH/e7IznYwMurt0J/Xb
         jnLt307EXsOUQ==
Date:   Mon, 5 Dec 2022 12:14:02 +0000
From:   Mark Brown <broonie@kernel.org>
To:     kernelci@groups.io, sfr@canb.auug.org.au,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     info@kernelci.org, linux-next@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: next/pending-fixes build: 205 builds: 2 failed, 203 passed, 6
 errors, 40 warnings (v6.1-rc7-310-gb04468dba0c6)
Message-ID: <Y43gij0rJWFWFeSz@sirena.org.uk>
References: <638d2def.170a0220.a77ce.05fa@mx.google.com>
 <20221205105718.38e244a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="icqlFEUnd7CJ/mq/"
Content-Disposition: inline
In-Reply-To: <20221205105718.38e244a0@canb.auug.org.au>
X-Cookie: If it ain't broke, don't fix it.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--icqlFEUnd7CJ/mq/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 10:57:18AM +1100, Stephen Rothwell wrote:
> On Sun, 04 Dec 2022 15:31:59 -0800 (PST) "kernelci.org bot" <bot@kernelci=
=2Eorg> wrote:

> > mips:
> >     fuloong2e_defconfig (gcc-10): 1 error
> >     lemote2f_defconfig (gcc-10): 1 error
> >     loongson2k_defconfig (gcc-10): 1 error
> >     loongson3_defconfig (gcc-10): 1 error

> > Errors summary:
> >=20
> >     4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with=
 =E2=80=98-mhard-float=E2=80=99
> >     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr =
r7,=3D0x'
> >     1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr =
r3,=3D0x'

> These have been around for a very long time, now.  Is there some way we
> can get them fixed?

Presumably, I've added Thomas as he's the MIPS maintainer.

--icqlFEUnd7CJ/mq/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmON4IoACgkQJNaLcl1U
h9ArZQf/cOw6/R+ibZ4f2pZ8XY6whmqqxL0ui+/zK59xlDz97QR5hIQAkFwyUIX0
E2TCfj8cpfo3E1JrbGAMnV3mJhcNdUv8njL4HzoegSOL1oeGOWxLSCudtt+Dtbp9
NZ7gtaynOUG3gcqthLfi7FGhUZ3Rna3s8NlD7Cy2uMspzh/waHAyH7/cOBEDruoa
V1OFkQCe/AOzscHO1XpVWJYtBXiOdekl7V6LPcKL5cMhrQg0wpeCl8SR1HVKvXSu
SuwU3nYLrfG376x8JaKZZmxejt28+8NA5B5u/pZeB5aGQifXKffwknF6IAHEfesk
UpAgRP0hehqs0mNMSH8lBJJBFq0CEg==
=RTck
-----END PGP SIGNATURE-----

--icqlFEUnd7CJ/mq/--
