Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597EF3B0480
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 14:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhFVMdf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 08:33:35 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:62861 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbhFVMdV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 08:33:21 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0355C4000B;
        Tue, 22 Jun 2021 12:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1624365064;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jqSPayU8MKdpXHZoyiiS+x0iriaty0Qlv5oe7MOCNEY=;
        b=lwMKaDXM7F4wcLCenXHjjeKY4aMpTXby3yR+LLOPswSGfyj9YoyA3af7pJBi8Qtf2ATjic
        QxKYhHFp96kZDiF2cmtOF0Zlb5HrQ2i6AYQ09XxFknK2irwfXe1fePWaUpcvTK2qil7v6i
        k8XW9p3hVkwXXTkDmRPYH3tt7+8UuDpG28UwnZ59zBnekvv+G/K8mFp+nROFnI+dLFDQ18
        1fX2UWpz8Ttn57syPNNTpypKpPnqlJPwC1saJQYLpSudNJTNwhe6n5IQ7cEiqRhmnyVsws
        ej/StcDLtwlFQONOe6QyE4ZVwJ+DFQR4bhIvkRnI0GgE2+DaV3HsSJGZF/xxqQ==
Date:   Tue, 22 Jun 2021 13:30:53 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH 1/4] MIPS: X1830: Respect cell count of common properties.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <H3S3VQ.BEEIRETNG80B@opendingux.net>
In-Reply-To: <1624347445-88070-2-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624347445-88070-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mar., juin 22 2021 at 15:37:22 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> If N fields of X cells should be provided, then that's what the
> devicetree should represent, instead of having one single field of
> (N * X) cells.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

-Paul

> ---
>  arch/mips/boot/dts/ingenic/x1830.dtsi | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1830.dtsi
> index b21c930..59ca3a8 100644
> --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
> @@ -97,9 +97,9 @@
>=20
>  		#clock-cells =3D <1>;
>=20
> -		clocks =3D <&cgu X1830_CLK_RTCLK
> -			  &cgu X1830_CLK_EXCLK
> -			  &cgu X1830_CLK_PCLK>;
> +		clocks =3D <&cgu X1830_CLK_RTCLK>,
> +			 <&cgu X1830_CLK_EXCLK>,
> +			 <&cgu X1830_CLK_PCLK>;
>  		clock-names =3D "rtc", "ext", "pclk";
>=20
>  		interrupt-controller;
> @@ -274,8 +274,7 @@
>=20
>  	pdma: dma-controller@13420000 {
>  		compatible =3D "ingenic,x1830-dma";
> -		reg =3D <0x13420000 0x400
> -			   0x13421000 0x40>;
> +		reg =3D <0x13420000 0x400>, <0x13421000 0x40>;
>  		#dma-cells =3D <2>;
>=20
>  		interrupt-parent =3D <&intc>;
> --
> 2.7.4
>=20


