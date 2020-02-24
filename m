Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45AE169F65
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 08:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgBXHiO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Feb 2020 02:38:14 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:49762 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727183AbgBXHiN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Feb 2020 02:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=451vApj/9D7x1KWh4ddIWyxRkUvpD9CgPV5nIaS4pg8=; b=KtY/YwwrUmK+tuG8zoyRvRTIJ
        pq2X+lzhaJ1cHUq/lJhqBVnIzeaAxq+CaQU7AnlTTjWrQ7+89qicwrmxEDbh9YIu6rmNDHyCdy1v0
        EWPbjWxdd53ySVmT1PJ+NCG7WHA3Ght0BVs1kdgbT7Ffmdakqn25D1iGxFOqsbY1QizTo=;
Received: from p578b2b7d.dip0.t-ipconnect.de ([87.139.43.125] helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1j68JF-00021S-3e; Mon, 24 Feb 2020 08:37:45 +0100
Received: from localhost ([::1])
        by localhost with esmtp (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1j68GR-0007vf-WD; Mon, 24 Feb 2020 08:34:52 +0100
Date:   Mon, 24 Feb 2020 08:33:35 +0100
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
Message-ID: <20200224083335.06a352f8@kemnade.info>
In-Reply-To: <D59DC84C-837E-4856-8FED-580381F748FF@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
        <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com>
        <20200222165738.61cde2a0@kemnade.info>
        <D59DC84C-837E-4856-8FED-580381F748FF@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jAuKxTh/ki.VbCviTA9NKWw"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/jAuKxTh/ki.VbCviTA9NKWw
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
> >  =20
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clock-names =20
> > so it is not required here (but "- clocks" (not "- clock") as said in e=
arlier
> > mail). =20
>=20
> Well, this is another example where I do not yet see any improvement by y=
aml.
> It is the same amount of guessing what should be written where. Is this to
> be added or not? When is it and why, when not and why?
>=20
well, this is the list of required properties which have to be an any
devicetree using that device, the conversion of the comments for the proper=
ties
in the .txt-file.
So, if you do not declare a property before, you cannot specify that it is
required. So if we drop the definition of clock-names we cannot declare it
as required.=20

Regards,
Andreas

--Sig_/jAuKxTh/ki.VbCviTA9NKWw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl5TfE8ACgkQl4jFM1s/
ye+aFQ//eslMTAbmAQ0DqEVfmmyBhqkH057WoRaE73bxRve/4YpLAdx9IFVnaznl
vdFg1N8Z2FAnktyM5rZJ0BUFt4U5U61DcCYrFUSg7MRWu74DxMQIhx/e0s9IMJM2
CldWXozOxoT1sYQ/eb4e6Gu9P9F2yu1qgsSDxRn+4hriUkXLI1x8BJz0myZyp32m
I1MTHTP9n5aVWKj1xo/FwrF2FNWRgLFAFsPwV0/Q7UWld/175hbYKnH5kcyho7sA
sNu0RnnG3Oh1gAiHbUlWLAZIT/3hwmR8yZ6EVYTmFEwxnb3nOQrI91NomP5wHBYf
tp+f2EDYJMZCC0Sopnzm/Vw8etxSSxMtViyVltSr7D798O9nMBhpSrqvttCNPC9o
0v2lJcTGxsilklPXZ7cJJyoiyKTMacv6JOZk7skDtpaojCdb/tDdutsN8i1CMcYC
yorhcdlDAHdB/JaSw0qXocir4UAwlmJHA4chSuPmhbBCpXl29QW3tMi4IGbYerCk
iMZWJV0prIsXQRUoxsV65rnuAIhtaPNadjJvSdd4tC5YZ1KwaCg5nr1Oh+Ja8Sen
Tx/QYAeLT5bdQYpgENgunibR7m8c+WUUhLs7sdEU6pfDGzQS2YFlR6pXAdH2bPzn
2S8jAKo8sxOGVzAcDfBALaendEYoVDv9ElnffqemmRDhumzlnAI=
=QwX9
-----END PGP SIGNATURE-----

--Sig_/jAuKxTh/ki.VbCviTA9NKWw--
