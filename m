Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC3E1BDB31
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 13:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgD2L4g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 07:56:36 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:40835 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726426AbgD2L4g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 07:56:36 -0400
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Apr 2020 07:56:36 EDT
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id DF3D5734;
        Wed, 29 Apr 2020 07:50:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 29 Apr 2020 07:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=MZELg45ZQRts6Cx5sUhyiaLHCD8
        lRyjQOu7wzrAbEX8=; b=AdwKmZuBTWOncc4vQFaslDngWdipB7Wqv3I7TYGxi8M
        gPRbPacdPE2U0iNsmPnuHLlhAuUIgo6nEwFlp1DGKIW7NOb+Qhcme6/Twmc7wlL5
        4pZOEdkEuDZCeqY0LSHmNZyT1KNta/K74rKhebaIbkfHtrcVc771P0xA7ahH8wzg
        1GA0ibYCEAn4ZO0fYFvtPyCnvFv3dG2hZ9LGVztMVHSu8zo5RxnECqbv3JPGZfWo
        ef50Ciky/KMuzxE7PWcd9SEVc0Rrvjpxg2tgX+HRhQW1At0R+jkpxqCPVtUU+Nav
        GzjE+a+/X8H5WsczHIOxvYLKZTVmcSwVMeo+FFtKOuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MZELg4
        5ZQRts6Cx5sUhyiaLHCD8lRyjQOu7wzrAbEX8=; b=MG42hl0NaysBYPaqZodAAc
        8CULeoLq6hP+Evn53cgbUf138qUNy3Br4rVF5qXFuHiP+lmST6UyASqoxnoLdLA4
        MGDM74Cx04fOiptzHNnyfUegnA0MsswcVwiHqJEqzVyKMOMGOYBFGPe5WN8qi/7V
        urtTqzcbxu5M5FEfGyg2DfDl33Iqd6Voh5KkPGVbIvVSdxTG8BOmQCzdLVdVzCiE
        2APiiZ4sdN+nEcM0rj492E70qFDTmGhUyoN5VSSNjkbUAnGVQkraEpTHm7wmn3Kp
        cAC80tqeu9hXzGWiSKU4QfN1YFULJjXi2rLNEqGvrMuWOzayTb5lo4YJTXEZxyGQ
        ==
X-ME-Sender: <xms:8mmpXqlGaXjIB2AkWGkbyZSvzxcCYjWGfmFrsp-nsbnz3jNtI0RHRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    epuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvse
    gtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8mmpXukVgCosWgr-zmsPAEDwC7UJvcsqqluQmHAJr2oHydlhDldBEQ>
    <xmx:8mmpXoN0JjU9yFBj4GFCjcgg6gfVWqEfzoFJP5jdLByiV51NWWC-KA>
    <xmx:8mmpXnOoNQR4Ckq-KHGp8Nsvq94N2RXH8BFC3474gbm0LDXUfoLwrQ>
    <xmx:9GmpXj6QDi0cK_8E3K5TcQZpcO3Qk37EfNurxpLAsBn0v9YDJmG45uNWzrQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DAA333280060;
        Wed, 29 Apr 2020 07:50:09 -0400 (EDT)
Date:   Wed, 29 Apr 2020 13:50:08 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: Add YAML for Nand Flash
 Controller support
Message-ID: <20200429115008.d5jmsc4ws2o3cm5w@gilmour.lan>
References: <20200423162113.38055-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200423162113.38055-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vrgo34uqoxmbwyae"
Content-Disposition: inline
In-Reply-To: <20200423162113.38055-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--vrgo34uqoxmbwyae
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 24, 2020 at 12:21:12AM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel=
=2Ecom>
>=20
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
>=20
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@li=
nux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 61 ++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/=
Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> new file mode 100644
> index 000000000000..6dd899d367b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel LGM SoC NAND Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.=
com>
> +
> +properties:
> +  compatible:
> +    const: intel,lgm-nand-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    enum:
> +      - rx
> +      - tx

This looks wrong?

If you have two dmas channels, I assume you'll want to have both rx and tx,
right? If so, then you need an items, not an enum.

> +  pinctrl-names: true
> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true

both pinctrl-names and that pattern are added automatically by the tooling,=
 you
should leave them out.

> +  "^nand@[a-f0-9]+$":
> +    type: object
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +
> +      nand-ecc-mode: true
> +
> +      nand-ecc-algo:
> +        const: hw
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dmas
> +
> +additionalProperties: false
> +
> +...

Can you provide an example too?

Thanks!
Maxime

--vrgo34uqoxmbwyae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqlp8AAKCRDj7w1vZxhR
xaI7AP9HY2RRA2nv/CwHEUJZv3C50OrtP7Ir+YFN6Hd4bYtCcgEArOCPK1GJeB2l
VoqKcGXOMea5Mx1PBMZF1eirh59GXgM=
=tGn6
-----END PGP SIGNATURE-----

--vrgo34uqoxmbwyae--
