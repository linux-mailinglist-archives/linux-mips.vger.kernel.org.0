Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999ED169000
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 16:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgBVP6W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 10:58:22 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:48374 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727889AbgBVP6V (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Feb 2020 10:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=0zH0TR5LwHI1qhTlo0K1joM5+TKdcEFpbeFCLRnIHO4=; b=TNHp6PeLzkMiAVlbs0ANxpGi/
        oNwPuUaGo9gn2EwjjvKOMOqe1h1kWrMda2JdB82ITpenu0X2vG9/3y/Hyx8mH3n446unMdZ/oKwh0
        Qvi3LsfeMSIkbG2qCVSJPmoKtd8lUIBkbWepfwwMQVGZ7mz1eJO+RSAa88+No+Lw/5TTQ=;
Received: from p5dc58966.dip0.t-ipconnect.de ([93.197.137.102] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1j5XA5-0003YB-3v; Sat, 22 Feb 2020 16:57:52 +0100
Received: from localhost ([127.0.0.1])
        by localhost with esmtp (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1j5XA3-00024Q-So; Sat, 22 Feb 2020 16:57:47 +0100
Date:   Sat, 22 Feb 2020 16:57:38 +0100
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
Message-ID: <20200222165738.61cde2a0@kemnade.info>
In-Reply-To: <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
        <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lF+dXJ4by+XRGrsE.47B7Rf"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/lF+dXJ4by+XRGrsE.47B7Rf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2020 11:25:37 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>=20
> This patch brings support for the JZ4780 efuse. Currently it only exposes
> a read only access to the entire 8K bits efuse memory.
>=20
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> [converted to yaml]
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz478=
0-efuse.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse=
.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> new file mode 100644
> index 000000000000..09a8ef937750
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic JZ EFUSE driver bindings
> +
> +maintainers:
> +  - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ingenic,jz4780-efuse
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    # Handle for the ahb for the efuse.
> +    maxItems: 1
> +
> +  clock-names:
> +   items:
> +     - const:  ahb2
as Rob said: probably not needed, since it is a single
clock, and the driver uses devm_clk_get(dev, NULL), so it should be prepared
for that without any extra work.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-names
so it is not required here (but "- clocks" (not "- clock") as said in earli=
er
mail).

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4780-cgu.h>
> +
> +    efuse@134100d0 {
> +        compatible =3D "ingenic,jz4780-efuse";
> +        reg =3D <0x134100d0 0x2c>;
> +
> +        clocks =3D <&cgu JZ4780_CLK_AHB2>;
> +        clock-names =3D "ahb2";
and not required here.

Regards,
Andreas

--Sig_/lF+dXJ4by+XRGrsE.47B7Rf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl5RT3IACgkQl4jFM1s/
ye9QbxAAnlVq5pxsyY+n0Js+2tuzpvzcA7+RlCVCQUQn8vOYQPA5g4etz3TdKsl7
IdeqETOar9JcFOZULHLGt8aVkUTuvGxmNfcOXNXlY/GxBC48UpZlpElPHEQzvviU
5xKyyT+aVyZXSCOyKxE/AcMlDCItoSujZ10Rk9q//e3uZu/lZSZbMWilU+mwVxw5
sn2PIGktxxG+MXE3ABKXj/2qTus2a5s9lTfPiTkhnlqtFHttq7NOXvOn95DGTlcn
nWMJpbHwLRLuXfGCAVSCpdcOvTaWefnzHjcc7TouGtmAMex1YxWLAhFlaSI7YpoP
RnvZfb5ARxg5PwVCZSsvmVoV3eWn5Q2aLshibFuhxiXHf8lGckl7p0C87AuxwQDM
HC2pGPMG+BZhrQdYo5PUK99eOF7ZTQmHUmK7JzlVbquDgMQLTn9eninNl/CLPzoq
bqhqUFnE+8arOM61MRTuBzlZ96JbhoBrLgE9HbJGv2Pvlif2Zfm6Mu32W5pob677
1jAZ3E+nyqS4RxcSieF+T0g84Q5GbVZgcGYJHf3T/jcXCBhRx4UzSif0H5ErJ2ZJ
dqgNUimLyNxC/Lp8ykLlYcXk5J9MzVMs+GRBfEAarlcWf6XjBn/hxdbjFmBVZiQJ
3QeeI6nRM4wwUqjxVlu48sHZE9H9vXgjofC1RIik8ZzGwoBNfNc=
=ZOHy
-----END PGP SIGNATURE-----

--Sig_/lF+dXJ4by+XRGrsE.47B7Rf--
