Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48DC8169076
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 17:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgBVQrA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 11:47:00 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:52428 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgBVQrA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Feb 2020 11:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hRPFx+PZRKzFa546U2qlzpkcDSCf1FnKKySJh6PyUnk=; b=oC+1V8NGKKnq7OtxR/z/2+PlL
        osEQgR5r2xXL+cgeZLa/H+O9n5VzM6dFMo/Svr3XEQG+6JGrzTl7Wf4jQAtSeLDWhFANu5yCnUawY
        fumyiXfOa4IN56RipwHlDQckMhRJKg4Q/cBn8o9uLoXW//NQycb0Zp31azMifaIEY8DLg=;
Received: from p5dc58966.dip0.t-ipconnect.de ([93.197.137.102] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1j5XvF-0004EA-Um; Sat, 22 Feb 2020 17:46:34 +0100
Received: from localhost ([127.0.0.1])
        by localhost with esmtp (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1j5XvF-0002YK-B5; Sat, 22 Feb 2020 17:46:33 +0100
Date:   Sat, 22 Feb 2020 17:46:08 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: Re: [PATCH v5 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Message-ID: <20200222174408.10588e32@kemnade.info>
In-Reply-To: <D59DC84C-837E-4856-8FED-580381F748FF@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
        <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com>
        <20200222165738.61cde2a0@kemnade.info>
        <D59DC84C-837E-4856-8FED-580381F748FF@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TgvauzzV4EyUJ_hH4abMMTu"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/TgvauzzV4EyUJ_hH4abMMTu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2020 17:34:06 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > Am 22.02.2020 um 16:57 schrieb Andreas Kemnade <andreas@kemnade.info>:
> >=20
> > On Sat, 22 Feb 2020 11:25:37 +0100
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> >  =20
> >> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> >>=20
> >> This patch brings support for the JZ4780 efuse. Currently it only expo=
ses
> >> a read only access to the entire 8K bits efuse memory.
> >>=20
> >> Tested-by: Mathieu Malaterre <malat@debian.org>
> >> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> >> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> >> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> >> [converted to yaml]
> >> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> >> ---
> >> .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 50 +++++++++++++++++++
> >> 1 file changed, 50 insertions(+)
> >> create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4=
780-efuse.yaml
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-ef=
use.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> >> new file mode 100644
> >> index 000000000000..09a8ef937750
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> >> @@ -0,0 +1,50 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Ingenic JZ EFUSE driver bindings
> >> +
> >> +maintainers:
> >> +  - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> >> +
> >> +allOf:
> >> +  - $ref: "nvmem.yaml#"
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - ingenic,jz4780-efuse
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    # Handle for the ahb for the efuse.
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +   items:
> >> +     - const:  ahb2 =20
> > as Rob said: probably not needed, since it is a single
> > clock, and the driver uses devm_clk_get(dev, NULL), so it should be pre=
pared
> > for that without any extra work. =20
>=20
> The question is if a specific driver implementation should determine
> what the DT requires or the other way round. I don't know...
>=20
> I did interpret Rob's comment differently: there was
>=20
> > - "clock-names"		Must be "bus_clk" =20
>=20
> and he did say:=20
>=20
> 	'clk' is redundant. How about 'ahb'?
>=20
> So I thought he refers to the _clk suffix?
>=20

and he said to my first try:
---
> +  clock-names:
> +   items:
> +     - const:  bus_clk =20

My prior comment still applies.

Also, for a single clock, you don't really need a name.
---

Regards,
Andreas

--Sig_/TgvauzzV4EyUJ_hH4abMMTu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl5RWtAACgkQl4jFM1s/
ye9VGhAAjRo5srdoJRml/7fEUEz7mS3nNuWp3JYCd8woqNanA6WUNL+vOHuys9d3
ZOrX4MQ83qwlD+clQIvrN7qNNeXtZr6btgH+JynIWOePOlKtWK/crwh+UkANROyM
jHxOIqJiIJ33EOVDTXP9+FIm4W48m/sGQQxvq1jjJ8ASw7gvZ/M3MDeMQJPZuhvn
PAjIV9Lqs4X0TSZTvTQ+ThYXFllCyxwKojcyODrJAWKx9VMqCc9fz2SYMgYSrAwX
2Sdv7aU5h1eD/1KUhchDRsAsIgzNjmalPkhL+SXj2flmaLSYKXIUQgpWwiKn4i96
oLSh+vsQcrhMvN/L+F+iqSTVdDcAkxhfOB4jb1ReGbYasyJwNm/8ROiXMS5+zv/x
dBWeGRR4DS+A6Z3ccPxJNdug1TtBQNJHvhal/TePTtxBuG0IL4Sq7SY5BPnjQi7w
JoYxL3xuGZ2ee7Qb1U+gvWqgL38lB0kumxSnDneHBZT9dqOvcsD5OhgRfVAScGvM
tWpwsXhuGq3tLr0/GCCj8Fik5WGMoambyt/rRFF7IKaOLraiJlqAdGEg5tiY8R8p
wWuwF2YW29NX4sziZsVVTSnf5Y51HDn20/IVAHFU8fpZPjnFn30lyydddhKAeIzf
jBy+63J7qYP0+Vqk/8w5g3SVnqiZXc+ZB+rpdA3lPKsBe/XRKO0=
=7A1/
-----END PGP SIGNATURE-----

--Sig_/TgvauzzV4EyUJ_hH4abMMTu--
