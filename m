Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93971B9031
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 14:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgDZMyO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 08:54:14 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42362 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgDZMyO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 08:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587905650; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QGs1VbCXpq3w2bD385Ag0nyW5WilZcot3VZIcHvBKBA=;
        b=WgSWzgZ1oOoj+AbGcqvEGtTfzTVBQzFedGQ2dDOe/N42jNpWaMGtbZ3E/vaikqD/2rDXMX
        hI+YRAoyaapaSEK8YkTDlcs5PrVwEmccrvT5wN9dnpAtejFz81BMJMROx42MAEjI5115H4
        Ljp1howOILhfEB60hF1DGes1umRV6U4=
Date:   Sun, 26 Apr 2020 14:53:55 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 09/12] ARM: dts: sun6i: a31: add sgx gpu child node
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Message-Id: <VTBE9Q.B8A32JWI2Q9V3@crapouillou.net>
In-Reply-To: <47740d708e00632735a8c1957109ca349029c716.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
        <47740d708e00632735a8c1957109ca349029c716.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Philipp Rossak <embed3d@gmail.com>
>=20
> We are adding the devicetree binding for the PVR-SGX-544-115 gpu.
>=20
> This driver is currently under development in the openpvrsgx-devgroup.
> Right now the full binding is not figured out, so we provide here a
> placeholder. It will be completed as soon as there is a demo=20
> available.
>=20
> The currently used binding that is used during development is more
> complete and was already verifyed by loading the kernelmodule=20
> successful.
>=20
> Signed-off-by: Philipp Rossak <embed3d@gmail.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi=20
> b/arch/arm/boot/dts/sun6i-a31.dtsi
> index f3425a66fc0a..933a825bf460 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -1417,5 +1417,16 @@ p2wi: i2c@1f03400 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <0>;
>  		};
> +
> +		gpu: gpu@1c400000 {
> +			compatible =3D "allwinner,sun8i-a31-sgx544-115",
> +				     "img,sgx544-115", "img,sgx544";
> +			reg =3D <0x01c40000 0x10000>;
> +			/*
> +			 * This node is currently a placeholder for the gpu.
> +			 * This will be completed when a full demonstration
> +			 * of the openpvrsgx driver is available for this board.
> +			 */

This node doesn't have clocks, so I don't see how it'd work.

Better delay the introduction of the GPU node for this board until you=20
know it works.

-Paul

> +		};
>  	};
>  };
> --
> 2.25.1
>=20


