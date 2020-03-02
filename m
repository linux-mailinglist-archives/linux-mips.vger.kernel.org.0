Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE0F1763E2
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 20:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgCBT2B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Mar 2020 14:28:01 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:41992 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbgCBT2A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Mar 2020 14:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583177278; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K/w7xN8JJOoqBkwjRFtmhdPO4ps8i2CpUSpPDW0yr48=;
        b=ZMoaIqvQbluaDkRWIfTLHOhukc1YfE8Xoybz2XPE9LtkkQ0wOuUmtDUDeTBYUWqWh5eKBc
        C9gPkHzyq+tu3AbaCh+RzGvtvPK19aYl0giwSqiFgtLMsnSNbO06WhmYqQPnfoJFEnVVTN
        HIb/5holaayaF/L64+uCeT5qyw8gjuI=
Date:   Mon, 02 Mar 2020 16:27:33 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC v2 6/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver
 and LCD controller
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1583177253.3.5@crapouillou.net>
In-Reply-To: <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
        <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> A specialisation of the generic Synopsys HDMI driver is employed for=20
> JZ4780
> HDMI support. This requires a new driver, plus device tree and=20
> configuration
> modifications.
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 32=20
> ++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index f928329b034b..391d4e1efd35 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -433,4 +433,36 @@
>=20
>  		status =3D "disabled";
>  	};
> +
> +	hdmi: hdmi@10180000 {
> +		compatible =3D "ingenic,jz4780-dw-hdmi";
> +		reg =3D <0x10180000 0x8000>;
> +		reg-io-width =3D <4>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
> +		clock-names =3D "isfr" , "iahb";
> +
> +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
> +		assigned-clock-rates =3D <27000000>;

I *think* this should go to the board file.

> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <3>;
> +
> +		/* ddc-i2c-bus =3D <&i2c4>; */
> +
> +		status =3D "disabled";
> +	};
> +
> +	lcd: lcd@13050000 {

The node name should be 'lcd-controller'.

> +		compatible =3D "ingenic,jz4740-lcd";

The JZ4780's LCD controller is much newer than the JZ4740 one, so even=20
if it works with the "ingenic,jz4740-lcd" compatible string, you want=20
it as a fallback.
So this should be: compatible =3D "ingenic,jz4780-lcd",=20
"ingenic,jz4740-lcd".

That means the YAML should be updated too.

-Paul

> +		reg =3D <0x13050000 0x1800>;
> +
> +		clocks =3D <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
> +		clock-names =3D "lcd", "lcd_pclk";
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <31>;
> +
> +		status =3D "disabled";
> +	};
>  };
> --
> 2.23.0
>=20

=

