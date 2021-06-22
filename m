Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45E43B0486
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 14:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhFVMeB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 08:34:01 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:36325 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbhFVMeB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 08:34:01 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E5FED20008;
        Tue, 22 Jun 2021 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1624365104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s/GMOf1oB8qT1ja252nzze92eIctPyBWlbSh/8bSPZk=;
        b=Ek7U8wI+r9OUh85pSCS8MlyLuZBUfm7L6tUIZbGZgzEsrVqlhKk7ZqQPVYHHmPQ6EG4AEz
        z62Sf3hQcfYlgrcdZ0IE9hddY88RLzSPuCYPD8XSIZp2/2pTNmLiN/azkNxCi4CqUrFHWx
        OSqjb9li6OawNaNhG10AqdAAM1BPYG+GAgHcW4oi/7E5lfHOxoPwStrZ792adHd+q5xik1
        9zaNboVVRXngs0EEwx4bZFgmp2nSobsJTrrkpjSy5caEqnL2DNgxQ89CgBosP51frvdmIr
        WbxPhObhZb8U4ut/Qy7hTlPoH+LguYMuQ2BP3kxL9PmJkWx2l2mXjrT1+3J/wA==
Date:   Tue, 22 Jun 2021 13:31:33 +0100
From:   Paul Cercueil <paul@opendingux.net>
Subject: Re: [PATCH 2/4] MIPS: Ingenic: Add MAC syscon nodes for Ingenic SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <L4S3VQ.7YL97HPASWY21@opendingux.net>
In-Reply-To: <1624347445-88070-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624347445-88070-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le mar., juin 22 2021 at 15:37:23 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou =
Yanjie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Add MAC syscon nodes for X1000 SoC and X1830 SoC from Ingenic.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  arch/mips/boot/dts/ingenic/x1000.dtsi | 7 +++++++
>  arch/mips/boot/dts/ingenic/x1830.dtsi | 7 +++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1000.dtsi
> index aac9ded..dec7909 100644
> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> @@ -80,6 +80,11 @@
>=20
>  			status =3D "disabled";
>  		};
> +
> +		mac_phy_ctrl: mac-phy-ctrl@e8 {
> +			compatible =3D "syscon";
> +			reg =3D <0xe8 0x4>;
> +		};
>  	};
>=20
>  	ost: timer@12000000 {
> @@ -347,6 +352,8 @@
>  		clocks =3D <&cgu X1000_CLK_MAC>;
>  		clock-names =3D "stmmaceth";
>=20
> +		mode-reg =3D <&mac_phy_ctrl>;
> +
>  		status =3D "disabled";
>=20
>  		mdio: mdio {
> diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi=20
> b/arch/mips/boot/dts/ingenic/x1830.dtsi
> index 59ca3a8..215257f 100644
> --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
> +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
> @@ -73,6 +73,11 @@
>=20
>  			status =3D "disabled";
>  		};
> +
> +		mac_phy_ctrl: mac-phy-ctrl@e8 {
> +			compatible =3D "syscon";
> +			reg =3D <0xe8 0x4>;
> +		};
>  	};
>=20
>  	ost: timer@12000000 {
> @@ -336,6 +341,8 @@
>  		clocks =3D <&cgu X1830_CLK_MAC>;
>  		clock-names =3D "stmmaceth";
>=20
> +		mode-reg =3D <&mac_phy_ctrl>;
> +
>  		status =3D "disabled";
>=20
>  		mdio: mdio {
> --
> 2.7.4
>=20


