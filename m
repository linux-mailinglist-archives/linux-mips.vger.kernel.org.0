Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6858729E162
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 03:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgJ2CAp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Oct 2020 22:00:45 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:48369 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgJ1Vvf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Oct 2020 17:51:35 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.45.118]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MT7ip-1kxPjS40Ip-00UcI8; Wed, 28 Oct 2020 21:40:02 +0100
Received: from falbala.internal.home.lespocky.de ([192.168.243.94])
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <post@lespocky.de>)
        id 1kXsEd-0002jR-O2; Wed, 28 Oct 2020 21:39:57 +0100
Date:   Wed, 28 Oct 2020 21:39:54 +0100
From:   Alexander Dahl <post@lespocky.de>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 02/12] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201028203953.eafmzeqba76qjlf2@falbala.internal.home.lespocky.de>
Mail-Followup-To: Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <linux@armlinux.org.uk>,
        Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-3-post@lespocky.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nwkumzirho5iba4d"
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-3-post@lespocky.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scan-Signature: e8e5211badca7b3e4c3721992337a85e
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:dFwaWUg7Hs1+6BjOpddvhs45I+5MLeawNEbLKR27jHnbgCj5ifc
 gYT8HigTxAZrbMDX6/JPdfbDaFolzE8kEuGksu+jJMbNPJOki4vC4J8UisS9GY0wG28NRRz
 NcInnsvPQVTBr/DWp2r63TtWmZWlMAONcdpEQLgqv5Ki0n2Oa80UXdCA4ZDNLFt5URfJug4
 cxtSV54v9p6WgHStsK5mQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gzz3n95gjfs=:hHvez/4McHVrzL3OX0D32f
 /mYm8rTxXToff+h1rKtHcZmgoklySxxk+XBCOUTtiY6mf9KZs6CPkdPtjCzBTHXEACewZfU8t
 ZX92A/cg34hfSH/qLP6uHmyl3sm8rZgjhfmODNhtVRqSL1yBUt7VoFp4O+xMEAK5mz+yCu2Rm
 iGklg0sn8jVVieyJf4ohBj0jpC00XckF2oSRO4FK0fFLDDT6iG356sR5IHySLVV8isMSMswNs
 7/QhXZyqSx8aKiVqtFSET6XbhPL/qNwVQ4M6SnKNnCOYcjQwin2ARag9znS70Gxf1KUX8wCoT
 3D22ySm/UzuqNW93z4dQGoKUTbs56eQ0t6QwGbzfLbL34QjGeMWvlLDxO4CsLndZij4zIiENB
 BfPV7R5t+K4iT+G1wnWExjfTh3WI8pemTfpcwHbrxpE71hZybyIbsYFhIysPL
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--nwkumzirho5iba4d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Peter, Russel, could you please give your Acked-by or Signed-off-by on
this patch?  Your ack is needed, because the license is now explicitly
set (it was not explicit before), and you were the contributors to
this binding before the conversion to yaml.

Thanks and Greets
Alex

On Mon, Oct 05, 2020 at 10:34:41PM +0200, Alexander Dahl wrote:
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
>    =20
>     That was discussed already with Peter (original author), still waiting
>     for Acked-by though =E2=80=A6
>    =20
>     Changelog
>     ---------
>     v6 -> v7:
>       * added Reviewed-by (Krzysztof Kozlowski)
>       * reworded commit message (suggested by Krzysztof)
>       * added Reviewed-by (Rob Herring)
>    =20
>     v5 -> v6:
>       * removed pwm nodes from example (Rob)
>       * renamed led-controller node in example (Rob)
>    =20
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
>    =20
>     v3 -> v4:
>       * added Cc to original author of the binding
>    =20
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
>    =20
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
>=20
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Docume=
ntation/devicetree/bindings/leds/leds-pwm.txt
> deleted file mode 100644
> index 6c6583c35f2f..000000000000
> --- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -LED connected to PWM
> -
> -Required properties:
> -- compatible : should be "pwm-leds".
> -
> -Each LED is represented as a sub-node of the pwm-leds device.  Each
> -node's name represents the name of the corresponding LED.
> -
> -LED sub-node properties:
> -- pwms : PWM property to point to the PWM device (phandle)/port (id) and=
 to
> -  specify the period time to be used: <&phandle id period_ns>;
> -- pwm-names : (optional) Name to be used by the PWM subsystem for the PW=
M device
> -  For the pwms and pwm-names property please refer to:
> -  Documentation/devicetree/bindings/pwm/pwm.txt
> -- max-brightness : Maximum brightness possible for the LED
> -- active-low : (optional) For PWMs where the LED is wired to supply
> -  rather than ground.
> -- label :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -- linux,default-trigger :  (optional)
> -  see Documentation/devicetree/bindings/leds/common.txt
> -
> -Example:
> -
> -twl_pwm: pwm {
> -	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
> -	compatible =3D "ti,twl6030-pwm";
> -	#pwm-cells =3D <2>;
> -};
> -
> -twl_pwmled: pwmled {
> -	/* provides one PWM (id 0 for Charing indicator LED) */
> -	compatible =3D "ti,twl6030-pwmled";
> -	#pwm-cells =3D <2>;
> -};
> -
> -pwmleds {
> -	compatible =3D "pwm-leds";
> -	kpad {
> -		label =3D "omap4::keypad";
> -		pwms =3D <&twl_pwm 0 7812500>;
> -		max-brightness =3D <127>;
> -	};
> -
> -	charging {
> -		label =3D "omap4:green:chrg";
> -		pwms =3D <&twl_pwmled 0 7812500>;
> -		max-brightness =3D <255>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Docum=
entation/devicetree/bindings/leds/leds-pwm.yaml
> new file mode 100644
> index 000000000000..fe4d5fd25913
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LEDs connected to PWM
> +
> +maintainers:
> +  - Pavel Machek <pavel@ucw.cz>
> +
> +description:
> +  Each LED is represented as a sub-node of the pwm-leds device.  Each
> +  node's name represents the name of the corresponding LED.
> +
> +properties:
> +  compatible:
> +    const: pwm-leds
> +
> +patternProperties:
> +  "^led(-[0-9a-f]+)?$":
> +    type: object
> +
> +    $ref: common.yaml#
> +
> +    properties:
> +      pwms:
> +        maxItems: 1
> +
> +      pwm-names: true
> +
> +      max-brightness:
> +        description:
> +          Maximum brightness possible for the LED
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +      active-low:
> +        description:
> +          For PWMs where the LED is wired to supply rather than ground.
> +        type: boolean
> +
> +    required:
> +      - pwms
> +      - max-brightness
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    #include <dt-bindings/leds/common.h>
> +
> +    led-controller {
> +        compatible =3D "pwm-leds";
> +
> +        led-1 {
> +            label =3D "omap4::keypad";
> +            pwms =3D <&twl_pwm 0 7812500>;
> +            max-brightness =3D <127>;
> +        };
> +
> +        led-2 {
> +            color =3D <LED_COLOR_ID_GREEN>;
> +            function =3D LED_FUNCTION_CHARGING;
> +            pwms =3D <&twl_pwmled 0 7812500>;
> +            max-brightness =3D <255>;
> +        };
> +    };
> +
> +...
> --=20
> 2.20.1

--=20
/"\ ASCII RIBBON | =C2=BBWith the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.=C2=AB
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)

--nwkumzirho5iba4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEwo7muQJjlc+Prwj6NK3NAHIhXMYFAl+Z1xYACgkQNK3NAHIh
XMa4dRAAwz5aGmTaCMVYq3Auo34qtLb+NsNbE0uPtTAJKafHT/YnSzgNgbf5urRz
zKAeeoaiKjVICVDWeDrLdN607wylNBGn024FRat0tjDkZIOu08iMuyBvR9dOA8zd
bp3xsK0f44DnZl+g0E/gIuuWe31PK/nY8h+etVAzcTqBsWVVDsT1zGBpXdYLpl6S
DDjTaO+zUyK7gRBQt/qDUbmQAO1IIttfSy6qHUxxPgZliWI+/DpQgsFRdoZPV+QH
bamaugY6vEaIkB5kr5O2QzHNmciUt/Jn7122YMMmVl7AE7ZPbGyVGtd/MXzQLXpQ
IHz0CJKdh0SraLoDeeIOgWRdDD4qUgy4WuaxxIQB2VjnICRE3FHHZHM6BIOrNUjF
sg+wsPXMnqRzAIa/ExjQCZBuhMrMLMNKRHLDwLTVgDz+qXb673vpHc0RyxrWC7YZ
hhQpQkgaeSmCs23IgsI2jm0cKXMMq9yoDLGfVX+naP413sx/RiQPyKZNQnkXHOV/
O48sd7eTz0BH6ZEBY6fSShd6SzQVUlYQGr2Ol4TXP1/Xa4LGlRzAvGvZOTiPukuX
2kxyUpBKNHjR7+z9jJ0kAO6mIPiLgI0Ac698iEDWsLkKekuFyd1pYwAZLeMoFR8l
J+PJ8ZiMqFxRQGr9QSHNwENi+KBFE4PweWPJ92XczoNxLhWyvBc=
=tXqH
-----END PGP SIGNATURE-----

--nwkumzirho5iba4d--
