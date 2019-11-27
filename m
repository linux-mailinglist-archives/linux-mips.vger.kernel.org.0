Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2E510B3D3
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 17:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfK0Qsf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 11:48:35 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:59360 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK0Qsf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 11:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1574873308; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WPAubu++VR8O6106th8bWP/AWSwIAFfPhimbYu2lKj8=;
        b=ofwlf+CJ1IlMQ0kLgrEb5zIN+k5LEWMMXVW7CDDK6/UvlhOVDn4vIPaa4OEEJBgUcrPRQt
        tfPMnf6Rc6uZDoyPBxSBGcFypUH++SNy+OnqywHzxcIps/ayXd47v/9h546A1tYFwExVH7
        V/wRePs5XvizjR21CFR2uDLmz4jvEiQ=
Date:   Wed, 27 Nov 2019 17:48:18 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 5/6] MIPS: X1000: Add pdma controller DT node.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Message-Id: <1574873298.3.0@crapouillou.net>
In-Reply-To: <1574787974-58040-6-git-send-email-zhouyanjie@zoho.com>
References: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
        <1574787974-58040-6-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,


Le mer., nov. 27, 2019 at 01:06, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add the appropriate DT node to probe the pdma controller driver
> using the devicetree.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>=20
> Notes:
>     v4:
>     New patch.
>=20
>  arch/mips/boot/dts/ingenic/x1000.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index 9e55edd..edfa70d 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/clock/x1000-cgu.h>
> +#include <dt-bindings/dma/x1000-dma.h>

You're not using any macro from that include file, so there's no need=20
to have it here.

Cheers,
-Paul


>=20
>  / {
>  	#address-cells =3D <1>;
> @@ -173,4 +174,16 @@
>=20
>  		status =3D "disabled";
>  	};
> +
> +	pdma: dma-controller@13420000 {
> +		compatible =3D "ingenic,x1000-dma";
> +		reg =3D <0x13420000 0x400
> +			   0x13421000 0x40>;
> +		#dma-cells =3D <2>;
> +
> +		interrupt-parent =3D <&intc>;
> +		interrupts =3D <10>;
> +
> +		clocks =3D <&cgu X1000_CLK_PDMA>;
> +	};
>  };
> --
> 2.7.4
>=20
>=20

=

