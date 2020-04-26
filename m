Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E231B903E
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 14:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbgDZM5H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 08:57:07 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:43060 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgDZM5F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 08:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587905821; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VP/mAC4xwNDT9V91K8RLHYB6nE7AooWd1wTlk6uRfp4=;
        b=AbMvu2fRXjCFm6r4XAiK02os0W+/STwoQ44/jocLsIYNNVAtsKI7bA90aQ74cVvhs5lLan
        y4d+F5TbWTAuE/jofT7aZmiSn7uZjLRQedgWMMNrNJZDpCXraPxAcOa+Dvq1A+6VE+7OU/
        EEEX6kOGv5zhpzoTKdy5z9BpNqSjfRo=
Date:   Sun, 26 Apr 2020 14:56:47 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
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
Message-Id: <NYBE9Q.YH08US7A7DC3@crapouillou.net>
In-Reply-To: <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
        <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Jonathan Bakker <xc-racer2@live.ca>
>=20
> All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.
>=20
> There is no external regulator for it so it can be enabled by default.
>=20
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/s5pv210.dtsi=20
> b/arch/arm/boot/dts/s5pv210.dtsi
> index 2ad642f51fd9..abbdda205c1b 100644
> --- a/arch/arm/boot/dts/s5pv210.dtsi
> +++ b/arch/arm/boot/dts/s5pv210.dtsi
> @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
>  			#interrupt-cells =3D <1>;
>  		};
>=20
> +		gpu: gpu@f3000000 {
> +			compatible =3D "samsung,s5pv210-sgx540-120";
> +			reg =3D <0xf3000000 0x10000>;
> +			interrupt-parent =3D <&vic2>;
> +			interrupts =3D <10>;
> +			clock-names =3D "core";
> +			clocks =3D <&clocks CLK_G3D>;
> +
> +			assigned-clocks =3D <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
> +			assigned-clock-rates =3D <0>, <66700000>;
> +			assigned-clock-parents =3D <&clocks MOUT_MPLL>;

What are these clocks for, and why are they reparented / reclocked?

Shouldn't they be passed to 'clocks' as well?

-Paul

> +		};
> +
>  		fimd: fimd@f8000000 {
>  			compatible =3D "samsung,s5pv210-fimd";
>  			interrupt-parent =3D <&vic2>;
> --
> 2.25.1
>=20


