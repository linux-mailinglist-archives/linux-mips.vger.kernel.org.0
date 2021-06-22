Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A36D3B0670
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 16:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhFVOHy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Jun 2021 10:07:54 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:59441 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhFVOHy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 10:07:54 -0400
Received: (Authenticated sender: paul@opendingux.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 666DD200014;
        Tue, 22 Jun 2021 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opendingux.net;
        s=gm1; t=1624370737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I2wA2alxKMX6rKejmxalDth4J3jLfgnXP/ip+6g6EO8=;
        b=dl7oZJRv4if/QBGoQuTlMlEqmeh1ZO2jHZDGVpLFDiR2+gly7UIokRSKTh7udiynJdonhK
        pmXmAWbAM0EPb1SKfBHUmQ2vc5CURtaQyYhRM6lLRwOdcwsDGEzKSjExLvjoU/cCaryZah
        OKZivsesfTGaFFbnIf8QEqj4fye4RTXm5jun3x83ZQvwnNJMcVMiQEg2oXSzrIcQccFYUk
        lXCk4HoWdkHJ4fH59NjaR9mk5xUDk3Y5bATcbKQmG+aBHitEIWEe1KDHgHHLYBwMUf/gDl
        xU2K9Kb9eMRvIrji0kgWYeN1YPpb0FcPpT2nd47VSkZllnB8YFhh2W/FLEReiQ==
Date:   Tue, 22 Jun 2021 15:05:25 +0100
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
Message-Id: <1HW3VQ.OQVPDYR5D5RR1@opendingux.net>
In-Reply-To: <20210622215119.18a49cf9@zhouyanjie-virtual-machine>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624347445-88070-4-git-send-email-zhouyanjie@wanyeetech.com>
        <9US3VQ.SK89X0OFZC2Z2@opendingux.net>
        <20210622215119.18a49cf9@zhouyanjie-virtual-machine>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mar., juin 22 2021 at 21:51:19 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Hi Paul,
>=20
> =E4=BA=8E Tue, 22 Jun 2021 13:46:57 +0100
> Paul Cercueil <paul@opendingux.net> =E5=86=99=E9=81=93:
>=20
>>  Hi Zhou,
>>=20
>>  Le mar., juin 22 2021 at 15:37:24 +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Z=
hou Yanjie)
>>  <zhouyanjie@wanyeetech.com> a =C3=A9crit :
>>  > Change the "lcd-24bit" in the pinctrl groups to "lcd-8bit",
>>  > "lcd-16bit", "lcd-18bit", "lcd-24bit", since the pinctrl
>>  > driver has done the necessary splitting of the lcd group,
>>  > and it is convenient to further streamline the lcd-24bit
>>  > group in the subsequent pinctrl driver.
>>  >
>>  > Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@=
wanyeetech.com>
>>  > ---
>>  >  arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
>>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>>  >
>>  > diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts
>>  > b/arch/mips/boot/dts/ingenic/gcw0.dts
>>  > index f4c04f2..dec3ba6f 100644
>>  > --- a/arch/mips/boot/dts/ingenic/gcw0.dts
>>  > +++ b/arch/mips/boot/dts/ingenic/gcw0.dts
>>  > @@ -393,7 +393,7 @@
>>  >  &pinctrl {
>>  >  	pins_lcd: lcd {
>>  >  		function =3D "lcd";
>>  > -		groups =3D "lcd-24bit";
>>  > +		groups =3D "lcd-8bit", "lcd-16bit", "lcd-18bit",
>>  > "lcd-24bit";
>>=20
>>  No, I'm pretty sure this won't work, since "lcd-24bit" contains pins
>>  that are also contained by the other groups.
>>=20
>=20
> Sure, it seems that we should modify the pinctrl first, then modify=20
> the
> dts, and then put them in the same series, so as to ensure that they=20
> do
> not cause damage.

No, the "lcd-24bit" group is ABI now. We can't change it...

-Paul

>=20
> Thanks and best regards!
>=20
>>  -Paul
>>=20
>>  >  	};
>>  >
>>  >  	pins_uart2: uart2 {
>>  > --
>>  > 2.7.4
>>  >
>>=20
>=20


