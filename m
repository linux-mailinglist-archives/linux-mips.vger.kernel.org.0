Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAEB27208CC
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 20:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237020AbjFBSGA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 14:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236351AbjFBSF7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 14:05:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F101A2;
        Fri,  2 Jun 2023 11:05:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EDF8764F54;
        Fri,  2 Jun 2023 18:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1789C433EF;
        Fri,  2 Jun 2023 18:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685729156;
        bh=ZmtyVX1rvrwo8dBJSs85rA89E8Un7RBuOwm/RAw17mM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bVPLdTBhdzfpWlspifVfXoWdaiiGjN8v6O4uLln4CK+nJtKma0woQLxRCI9gJgU4M
         8iPrD4vnSBowXmLVcBHMZvG4ljr0qtlGHii+qN5PZFCx4SfdeLZKEC/Ah14mpdjyku
         45szIHBeXAUNGqDsIyJIeljFFKAsvvna53X+ITox8mDOL0MPxTOJSoY1GWxLrGcj+S
         ZSluzLQ0sGg3m4eWXpVuZsjIdxukYzIlirNdoqUBFxPnI0sx5qqkHKy3L2YxQ+Znf2
         EEFZJc5tCKHRM8ePz+JD5UgqUvnZOm8gVujVChtWWIEqZI+BDnjk7C2x/7uD8b/k1w
         NyTDUqS3vAgew==
Date:   Fri, 2 Jun 2023 19:05:50 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>, Yang Ling <gnaygnil@gmail.com>
Subject: Re: [PATCH V5 1/5] dt-bindings: rtc: Remove the LS2X from the
 trivial RTCs
Message-ID: <20230602-giveaway-tipping-4c420a13f2f1@spud>
References: <cover.1685693501.git.zhoubinbin@loongson.cn>
 <1b0bb443bd74647c17b7902f3d719700f81a1dba.1685693501.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RKfPwvtmTLjD8Gp5"
Content-Disposition: inline
In-Reply-To: <1b0bb443bd74647c17b7902f3d719700f81a1dba.1685693501.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--RKfPwvtmTLjD8Gp5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 05:50:20PM +0800, Binbin Zhou wrote:
> Move Loongson RTC bindings from trivial-rtc.yaml into loongson,rtc.yaml.

$subject: dt-bindings: rtc: Remove the LS2X from the trivial RTCs

If you end up resubmitting, could you use a subject like that better
describes the changes?
Say "dt-bindings: rtc: Split loongson,ls2x-rtc into SoC-based compatibles"?
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
>=20
> The architectures associated with this driver use the built-in DTB, so
> we can just drop the compatible(rtc-ls2x) with wildcards.
> Also, soc-based compatible is more accurate for hardware differences
> between chips.
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../devicetree/bindings/rtc/loongson,rtc.yaml | 57 +++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
>  2 files changed, 57 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/loongson,rtc.yaml
> new file mode 100644
> index 000000000000..f89c1f660aee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/loongson,rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson Real-Time Clock
> +
> +description:
> +  The Loongson family chips use an on-chip counter 0 (Time Of Year
> +  counter) as the RTC.
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - loongson,ls1b-rtc
> +          - loongson,ls1c-rtc
> +          - loongson,ls7a-rtc
> +          - loongson,ls2k1000-rtc
> +      - items:
> +          - enum:
> +              - loongson,ls2k2000-rtc
> +              - loongson,ls2k0500-rtc
> +          - const: loongson,ls7a-rtc
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
> +    rtc@1fe27800 {
> +        compatible =3D "loongson,ls2k1000-rtc";
> +        reg =3D <0x1fe27800 0x100>;
> +
> +        interrupt-parent =3D <&liointc1>;
> +        interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
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

--RKfPwvtmTLjD8Gp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHovfgAKCRB4tDGHoIJi
0io4AP9OszbOoh51H3qHi/Cte3fW3fV7kObq3JzfUri47dWC9wEA+VMY5z2mV9Ui
Phg0Rra9Vn5oeISQKSPXEl/n/wcAjgw=
=kAmc
-----END PGP SIGNATURE-----

--RKfPwvtmTLjD8Gp5--
