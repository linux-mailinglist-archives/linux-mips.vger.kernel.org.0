Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5EFB17C567
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 19:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCFS0o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 13:26:44 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:39500 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFS0n (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 13:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583519195; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w0Sw5r13qZtFbM6wbZ7n32ZvjgsB3yBveQBetF3qtgo=;
        b=f7Sn8oQmJxS+G3Tn7MO8G0eO/9F+d61byqMREI145B6C9t4+9rTRlfqnwHZXHTPWqZ5JCT
        P7fAYNt4UgWkR4llf3xoTkoadzCG2r/mjBj4dCPTVxTLAEYP26wqzssEytctC2jEagVGhJ
        7K7S/JSi25L63Y+kbmv1+q4MyJOiREo=
Date:   Fri, 06 Mar 2020 19:26:27 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 1/3] MIPS: DTS: CI20: add DT node for IR sensor
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Alex Smith <alex.smith@imgtec.com>
Message-Id: <1583519187.3.0@crapouillou.net>
In-Reply-To: <0cc9510007f85a8d38d176d835d82c9baef132e4.1583515771.git.hns@goldelico.com>
References: <cover.1583515771.git.hns@goldelico.com>
        <0cc9510007f85a8d38d176d835d82c9baef132e4.1583515771.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le ven., mars 6, 2020 at 18:29, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Alex Smith <alex.smith@imgtec.com>
>=20
> The infrared sensor on the CI20 board is connected to a GPIO and can
> be operated by using the gpio-ir-recv driver. Add a DT node for the
> sensor to allow that driver to be used.
>=20
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index c340f947baa0..e6ae08c979ea 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -62,6 +62,11 @@
>  		enable-active-high;
>  	};
>=20
> +	ir: ir-receiver {

According to Documentation/devicetree/bindings/media/rc.yaml, the node=20
should be named just "ir".

Cheers,
-Paul

> +		compatible =3D "gpio-ir-receiver";
> +		gpios =3D <&gpe 3 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	wlan0_power: fixedregulator@1 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "wlan0_power";
> --
> 2.23.0
>=20

=

