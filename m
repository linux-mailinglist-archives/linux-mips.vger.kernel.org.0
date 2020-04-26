Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EE01B9029
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 14:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgDZMuy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 08:50:54 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41514 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgDZMuy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 08:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587905451; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RSLBf9Fagf4q+HhwxFOFootc8dZMFZo1PVNBvnmStFM=;
        b=EE3tEVxRcTYljO+UifVqubFUQrC6iAs/RgFg4h5hzwmgAYOrQ//6ynWjCqU3jLthKM680I
        w4zrgopXWxMruQHZLwU9wrdD4t2QmfxnpJ9QHuBFsFR9VT00zMgd+L6pZkn0GZNklEZs4M
        RG+3Oi3W8AcC1Pwg4rvYx8qpse7EG9k=
Date:   Sun, 26 Apr 2020 14:50:37 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 06/12] ARM: DTS: omap4: add sgx gpu child node
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
Message-Id: <DOBE9Q.00IRKFIW0JMG@crapouillou.net>
In-Reply-To: <5f493a50fedef45c3cacd91cbf999092d9c05164.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
        <5f493a50fedef45c3cacd91cbf999092d9c05164.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Add SGX GPU node with interrupt. Tested on PandaBoard ES.
>=20
> Since omap4420/30/60 and omap4470 come with different SGX variants
> we need to introduce a new omap4470.dtsi. If an omap4470 board
> does not want to use SGX it is no problem to still include
> omap4460.dtsi.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/omap4.dtsi   | 11 ++++++-----
>  arch/arm/boot/dts/omap4470.dts | 15 +++++++++++++++
>  2 files changed, 21 insertions(+), 5 deletions(-)
>  create mode 100644 arch/arm/boot/dts/omap4470.dts
>=20
> diff --git a/arch/arm/boot/dts/omap4.dtsi=20
> b/arch/arm/boot/dts/omap4.dtsi
> index 763bdea8c829..15ff3d7146af 100644
> --- a/arch/arm/boot/dts/omap4.dtsi
> +++ b/arch/arm/boot/dts/omap4.dtsi
> @@ -389,7 +389,7 @@ abb_iva: regulator-abb-iva {
>  			status =3D "disabled";
>  		};
>=20
> -		target-module@56000000 {
> +		sgx_module: target-module@56000000 {
>  			compatible =3D "ti,sysc-omap4", "ti,sysc";
>  			reg =3D <0x5600fe00 0x4>,
>  			      <0x5600fe10 0x4>;
> @@ -408,10 +408,11 @@ target-module@56000000 {
>  			#size-cells =3D <1>;
>  			ranges =3D <0 0x56000000 0x2000000>;
>=20
> -			/*
> -			 * Closed source PowerVR driver, no child device
> -			 * binding or driver in mainline
> -			 */
> +			gpu: gpu@0 {
> +				compatible =3D "ti,omap4-sgx540-120", "img,sgx540-120",=20
> "img,sgx540";
> +				reg =3D <0x0 0x2000000>;	/* 32MB */
> +				interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +			};
>  		};
>=20
>  		/*
> diff --git a/arch/arm/boot/dts/omap4470.dts=20
> b/arch/arm/boot/dts/omap4470.dts
> new file mode 100644
> index 000000000000..f29c581300bf
> --- /dev/null
> +++ b/arch/arm/boot/dts/omap4470.dts
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Device Tree Source for OMAP4470 SoC
> + *
> + * Copyright (C) 2012 Texas Instruments Incorporated -=20
> http://www.ti.com/
> + *
> + * This file is licensed under the terms of the GNU General Public=20
> License
> + * version 2.  This program is licensed "as is" without any warranty=20
> of any
> + * kind, whether express or implied.
> + */
> +#include "omap4460.dtsi"
> +
> +&sgx {

Does this even compile?

The node's handle is named sgx_module, not sgx.

-Paul

> +	compatible =3D "ti,omap4470-sgx544-112", "img,sgx544-112",=20
> "img,sgx544";
> +};
> --
> 2.25.1
>=20


