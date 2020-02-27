Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F04D1721B4
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 15:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbgB0O6S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 09:58:18 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:43690 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730000AbgB0O6R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 09:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582815495; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pGG3QA/MuTy/BE1KaedN0lIF6lHb9h2nDV465fY0RG8=;
        b=md6NOEcH7wtfylojV61kM1Up4IZ1tc8mCF17PXGNsMNFm4cc/2TFk2TYRpWiqLey9bsH2K
        LeqVHH9fdOIs6zI40UTIJAf+MvBQm4IEIGfn4wD/n3InleORa0ptOVWvJ/ZHAl2Yw+ZTei
        CEzWkuRP23LE5odTDjn2JKspv+3W1hU=
Date:   Thu, 27 Feb 2020 11:57:52 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 5/6] MIPS: DTS: JZ4780: define node for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
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
Message-Id: <1582815472.3.4@crapouillou.net>
In-Reply-To: <c6177ff663b6f8e16dc41169a76ba5dac091e7bd.1582715761.git.hns@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com>
        <c6177ff663b6f8e16dc41169a76ba5dac091e7bd.1582715761.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le mer., f=E9vr. 26, 2020 at 12:16, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>=20
> This patch brings support for the JZ4780 efuse. Currently it only=20
> exposes
> a read only access to the entire 8K bits efuse memory and the
> ethernet mac address for the davicom dm9000 chip on the CI20 board.
>=20
> It also changes the nemc reg range to avoid overlap.
>=20
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index f928329b034b..1e266be28096 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -358,7 +358,7 @@
>=20
>  	nemc: nemc@13410000 {
>  		compatible =3D "ingenic,jz4780-nemc";
> -		reg =3D <0x13410000 0x10000>;
> +		reg =3D <0x13410000 0x4c>;

This is wrong, the real size of the register area is 1x15c.

>  		#address-cells =3D <2>;
>  		#size-cells =3D <1>;
>  		ranges =3D <1 0 0x1b000000 0x1000000
> @@ -373,6 +373,21 @@
>  		status =3D "disabled";
>  	};
>=20
> +	efuse: efuse@134100d0 {
> +		compatible =3D "ingenic,jz4780-efuse";
> +		reg =3D <0x134100d0 0x2c>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_AHB2>;
> +		clock-names =3D "ahb2";

As explained in my response to the other patch, 'clock-names' can go=20
away.

Cheers,
-Paul

> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +
> +		eth0_addr: eth-mac-addr@0x22 {
> +			reg =3D <0x22 0x6>;
> +		};
> +	};
> +
>  	dma: dma@13420000 {
>  		compatible =3D "ingenic,jz4780-dma";
>  		reg =3D <0x13420000 0x400
> --
> 2.23.0
>=20

=

