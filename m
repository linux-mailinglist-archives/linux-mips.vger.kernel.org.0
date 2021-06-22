Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD9D3B051B
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 14:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhFVMt2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 08:49:28 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:50251 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhFVMt1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 08:49:27 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 53E4224000E;
        Tue, 22 Jun 2021 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1624366031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Fg52cHZ8AYWCOlvnT9/rzD91lLNJNWlx68bSKeiMiQ=;
        b=CzO5LgUTT3jZVexcv7oHANYinHOBaFGY8FAEpT0fq4AyGXACfhv3ThZ8vl0xvzOvMoP/lK
        LGvzDiOWpEUgKHJ6ieyMFwxFEfCdArgb3/l9jffzd5dxOj8Vkr2sddRCCmuE13TiMyZXt+
        GU9zMibjQuVrQQ+7oVgU8P3hNILL21gMAtD+m4oZ8XqeAguZxuR/wF4r4Js5NXS025noeW
        xN9GyHcz8HyCsm6nkR5Iy2vHjqMWGSWNc3rOUzq9aTF6xc7ZjJnqkrHxrrgUnB7V5hSooA
        fHj82lVSLEmjdcDRlGSgDmPvhj67/oTjC+tsOqGpZh+rXnOjNkt9DouEwGUKlg==
Date:   Tue, 22 Jun 2021 13:46:57 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH 3/4] MIPS: GCW0: Adjust pinctrl related code in device
 tree.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <9US3VQ.SK89X0OFZC2Z2@opendingux.net>
In-Reply-To: <1624347445-88070-4-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624347445-88070-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mar., juin 22 2021 at 15:37:24 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Change the "lcd-24bit" in the pinctrl groups to "lcd-8bit",
> "lcd-16bit", "lcd-18bit", "lcd-24bit", since the pinctrl
> driver has done the necessary splitting of the lcd group,
> and it is convenient to further streamline the lcd-24bit
> group in the subsequent pinctrl driver.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>  arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts=20
> b/arch/mips/boot/dts/ingenic/gcw0.dts
> index f4c04f2..dec3ba6f 100644
> --- a/arch/mips/boot/dts/ingenic/gcw0.dts
> +++ b/arch/mips/boot/dts/ingenic/gcw0.dts
> @@ -393,7 +393,7 @@
>  &pinctrl {
>  	pins_lcd: lcd {
>  		function =3D "lcd";
> -		groups =3D "lcd-24bit";
> +		groups =3D "lcd-8bit", "lcd-16bit", "lcd-18bit", "lcd-24bit";

No, I'm pretty sure this won't work, since "lcd-24bit" contains pins=20
that are also contained by the other groups.

-Paul

>  	};
>=20
>  	pins_uart2: uart2 {
> --
> 2.7.4
>=20


