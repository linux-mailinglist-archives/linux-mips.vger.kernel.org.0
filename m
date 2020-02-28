Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9F891739F8
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgB1Og3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 09:36:29 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:38486 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgB1Og2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 09:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582900587; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rog/tSTAvNcd3kQJ+OVeh4UTSpCdgj4vmk6kCxigbqA=;
        b=cxNF3kUw6YGZ1KT+uO/2j5e+rd3DK0gTwhU2XDST7hc1FAM30TRyvQ50kvvVtXOZTW8MSx
        FzuYBSqXJU/LAlxUZh0VyuN/ky8rYfrR59sHoKJ+3uNEswzrlmqa8xUL/vl+7DJJL23Muv
        rMWXCNqkU1U4Zx/f0as8f5NvIJpp+rg=
Date:   Fri, 28 Feb 2020 11:36:08 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 5/6] MIPS: DTS: CI20: multiple DTS improvements
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1582900568.3.2@crapouillou.net>
In-Reply-To: <01795b270ad025ffffbf80e115b3b2d138a20ffe.1581884459.git.hns@goldelico.com>
References: <cover.1581884459.git.hns@goldelico.com>
        <01795b270ad025ffffbf80e115b3b2d138a20ffe.1581884459.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le dim., f=E9vr. 16, 2020 at 21:20, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> a) add DT node for SW1 as Enter button
>=20
> The SW1 button can be used as a simple one-button keyboard
> and is connected to PD17.
>=20
> Note: SW1 has a second meaning to change the boot sequence
> when pressed while powering on.
>=20
> b) give eth0_power a defined voltage.
>=20
> This is a 3.3V power switch (DVNET3.3V ).
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index 1ab55be707af..4bacefa2cfce 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -4,6 +4,7 @@
>  #include "jz4780.dtsi"
>  #include <dt-bindings/clock/ingenic,tcu.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>=20
>  / {
>  	compatible =3D "img,ci20", "ingenic,jz4780";
> @@ -25,6 +26,17 @@
>  		       0x30000000 0x30000000>;
>  	};
>=20
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		sw1 {
> +			label =3D "ci20:sw1";
> +			linux,code =3D <KEY_ENTER>;

Why KEY_ENTER? It would make it impossible for applications to know=20
that it's actually the switch that has been pressed an not the keyboard.

> +			gpios =3D <&gpd 17 GPIO_ACTIVE_HIGH>;
> +			wakeup-source;
> +		};
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
>=20
> @@ -56,6 +68,8 @@
>  	eth0_power: fixedregulator@0 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "eth0_power";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
>  		gpio =3D <&gpb 25 GPIO_ACTIVE_LOW>;
>  		enable-active-high;
>  	};
> --
> 2.23.0
>=20

=

