Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0017111A4
	for <lists+linux-mips@lfdr.de>; Thu, 25 May 2023 19:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbjEYRFg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 May 2023 13:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbjEYRFf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 May 2023 13:05:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0989194;
        Thu, 25 May 2023 10:05:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E30B647B7;
        Thu, 25 May 2023 17:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D10BC433D2;
        Thu, 25 May 2023 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685034331;
        bh=yIjNxDD74CzuvoVXeFhsdRIPEKXPng6z65P4bdifQFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f/jid+QsaCGwZa4IVRrVtbahris94j5A8Zi7KToWru2/XGQA2MeMzDXIDuCBG3d11
         4dAkNMmlGw7CysZ+Bv3P31HSyXDV35IaNO/Z1DG/VNQDk/7wRNpsKs4lT+22exEUlr
         EgGaJcH/gc2g/PxZ/PJgE++yQtgf7293g1OaLEJavjc6kGi+gRwqLf04PDdRBk7t4x
         XBRRc5t+y3aOhuiBhW6EuzA/4bjXh+cYBxBRisrQ3/F8BrM3nr3Oxv7lu5u5QhC3Gs
         6HKjJgMq+fGF+U8evE21qMPHv6gj2x8IFxMqEdzBzTkII1YefzMU6v5nt6GI9BG+fb
         cNUT6aDevoBeA==
Date:   Thu, 25 May 2023 18:05:25 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH V4 1/5] dt-bindings: rtc: Remove the LS2X from the
 trivial RTCs
Message-ID: <20230525-custody-oversleep-f778eddf981c@spud>
References: <cover.1684983279.git.zhoubinbin@loongson.cn>
 <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LCh+4220dViEtGIh"
Content-Disposition: inline
In-Reply-To: <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--LCh+4220dViEtGIh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Binbin,

On Thu, May 25, 2023 at 08:55:23PM +0800, Binbin Zhou wrote:
> Move Loongson RTC bindings from trivial-rtc.yaml into loongson,rtc.yaml.
>=20
> Also, we will discard the use of wildcards in compatible (ls2x-rtc),
> soc-based compatible is more accurate for hardware differences between
> chips.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/rtc/loongson,rtc.yaml | 47 +++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
>  2 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/loongson,rtc.yaml
> new file mode 100644
> index 000000000000..68e56829e390
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/loongson,rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson Real-Time Clock
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,ls1b-rtc
> +      - loongson,ls1c-rtc
> +      - loongson,ls7a-rtc
> +      - loongson,ls2k0500-rtc
> +      - loongson,ls2k1000-rtc
> +      - loongson,ls2k2000-rtc

|+static const struct of_device_id loongson_rtc_of_match[] =3D {
|+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_config =
},
|+       { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1x_rtc_config =
},
|+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_conf=
ig },
|+       { .compatible =3D "loongson,ls2k0500-rtc", .data =3D &generic_rtc_=
config },
|+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rtc=
_config },
|+       { .compatible =3D "loongson,ls2k2000-rtc", .data =3D &generic_rtc_=
config },
|+       { /* sentinel */ }
|+};

This is a sign to me that your compatibles here are could do with some
fallbacks. Both of the ls1 ones are compatible with each other & there
are three that are generic.

I would allow the following:
"loongson,ls1b-rtc"
"loongson,ls1c-rtc", "loongson,ls1b-rtc"
"loongson,ls7a-rtc"
"loongson,ls2k0500-rtc", "loongson,ls7a-rtc"
"loongson,ls2k2000-rtc", "loongson,ls7a-rtc"
"loongson,ls2k1000-rtc"

And then the driver only needs:
|+static const struct of_device_id loongson_rtc_of_match[] =3D {
|+       { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1x_rtc_config =
},
|+       { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_conf=
ig },
|+       { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rtc=
_config },
|+       { /* sentinel */ }
|+};

And ~if~when you add support for more devices in the future that are
compatible with the existing ones no code changes are required.

To maintain compatibility with the existing devicetrees, should the old
"loongson,ls2x-rtc" be kept in the driver?

Thanks,
Conor.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc_dev: rtc@1fe27800 {
> +      compatible =3D "loongson,ls2k0500-rtc";
> +      reg =3D <0x1fe27800 0x100>;
> +
> +      interrupt-parent =3D <&liointc1>;
> +      interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Doc=
umentation/devicetree/bindings/rtc/trivial-rtc.yaml
> index a3603e638c37..9af77f21bb7f 100644
> --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> @@ -47,8 +47,6 @@ properties:
>        - isil,isl1218
>        # Intersil ISL12022 Real-time Clock
>        - isil,isl12022
> -      # Loongson-2K Socs/LS7A bridge Real-time Clock
> -      - loongson,ls2x-rtc
>        # Real Time Clock Module with I2C-Bus
>        - microcrystal,rv3029
>        # Real Time Clock
> --=20
> 2.39.1
>=20

--LCh+4220dViEtGIh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG+VVQAKCRB4tDGHoIJi
0hS5AP9eJ/cAM7cJFUO6MGAFwhGdgh9DuZeCmW2nKKm448BbgAD/V/jZQkjUX1PU
fPaToEbOGD7NZIMxz9dYRjrrLufxYAc=
=sUvs
-----END PGP SIGNATURE-----

--LCh+4220dViEtGIh--
