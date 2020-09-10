Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B3B264370
	for <lists+linux-mips@lfdr.de>; Thu, 10 Sep 2020 12:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgIJKNy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Sep 2020 06:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730556AbgIJKNu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Sep 2020 06:13:50 -0400
X-Greylist: delayed 375 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Sep 2020 03:13:49 PDT
Received: from pax.zz.de (pax.zz.de [IPv6:2a01:4f8:201:92f3::f10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92D3C061573
        for <linux-mips@vger.kernel.org>; Thu, 10 Sep 2020 03:13:49 -0700 (PDT)
Received: by pax.zz.de (Postfix, from userid 1181)
        id 571F010012D; Thu, 10 Sep 2020 12:07:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=zz.de; s=mail;
        t=1599732451; bh=W0mFI0Yj41ANC2MtFVkUZcMVw5ndhVnMhcrndSD696Y=;
        h=Date:From:To:Subject:From;
        b=jV5xbZ7p1BozhMf/L8W6Yikk1MeEnxL2EpYlVR6membODY0q6O8JhMTBqCKoUKuYd
         M3ei8LLtyt344sLn671VhLXoRiCRxTB/UDJlX0920clr4zZO9HAaj3C9vT8fPFjCgd
         YrJhBN2f99h2OAge4s21dyCy9rq16Uf5QnVIAMwRvuDzariXYRHyv8vSqpiPO4VBIl
         Hv8IVvQszMHoz66UxYSkDC47R8G7vwkD2ASyDNSPQ9aDQBJjJLRD/I/Im/NkC01q0J
         AGx3PRhjVHyn+VtsR3Cw++DUkLwj/Ui9MjVYERUjSvE74KYfP+9PcrLF1gc4rmA3EM
         DUW91TMfXNQ8g==
Date:   Thu, 10 Sep 2020 12:07:31 +0200
From:   Florian Lohoff <f@zz.de>
To:     linux-mips@vger.kernel.org
Subject: Undust unknown hardware / Algo P-6064
Message-ID: <20200910100729.c6qn22j6pfqxxu5z@pax.zz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yvsmazlv4tpgtqm7"
Content-Disposition: inline
Organization: rfc822 - pure communication
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--yvsmazlv4tpgtqm7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

After i undusted a box which i moved around for years, which i
thought to be a Swarm, i found it to be an Algorithmics P-6064.=20

After some maintenance it turns on and ends up in PMON.

=46rom what Google told me there was once upon a time a linux kernel
sourcetree within Algorithmics supporting that board. It seems this
never made it upstream.

Are there any resources still available? Documentation? The old
kernel source trees? Anything?

Flo
--=20
Florian Lohoff                                                 f@zz.de
        UTF-8 Test: The =F0=9F=90=88 ran after a =F0=9F=90=81, but the =F0=
=9F=90=81 ran away

--yvsmazlv4tpgtqm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdb9o7oebX2papQ/KkN1BIMsJ8i8FAl9Z+uEACgkQkN1BIMsJ
8i9uyhAAifG3d6AeCJRdpYuesB/RDvE86WpY8BCh8PLMcdDRj9H1DhyNTiuktmwf
/5auXgHjZbDBi2Jq63pTCxRrVIvy306SMK47fudsZ2UBXLjX9TBh6eIJSamSqKHq
A0eomtOKaQYGzOM7KytNxDfxHEUOE3B5hGDKbqSNxa0zuNuH6VqY1aOC+NO0BtwY
FLYMnQ8DTOxFYQs0JWo8JxzlBBB4eIfL3E3+IKomq/fUWDFMZxoAAQH/sRlZlR32
c3dWsZQX4ZGl9vOGaI6i9G7X2FGsrGgH3yKVw8jS+rMfMt03yV7ZmonQbL0ScfiC
Z2rrahlR3zuJd9fcQQ2j+caPDTzOvgowJoeGhMrrJxWwD7YX8AZcQSv5pzU+ty+8
eeD69EY+Cq4uXEaDBoIrHM9bgsq4ChhilMnLGdCO9/Ha+7BxzTmsNHuLw+GyCOGJ
/Xz2mlenYhKcv4kahjfvS+5RkPhbAIoCffJgc480/2ZvenC2+3dQdTn/DnqsjWhG
pExB2mlvGUZT/QpEmDBmzat8jeXO6Np3nAHXAkhauaaDa9vL4SSGifbLA+j1Gyg+
t02mXa32LWwZnv2DvYV/q8l7eoNYLax2NUF7RIzhvvydeWKMbfCnzDfVoS/NK5Xg
+b1VJjVF4RYeBP8mB4t5nuT1oRI2dvy5wA/vj/fnrC3zAq7z0Vw=
=SykY
-----END PGP SIGNATURE-----

--yvsmazlv4tpgtqm7--
