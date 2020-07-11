Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E5821C61B
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jul 2020 22:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgGKUYz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Jul 2020 16:24:55 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:14555 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbgGKUYz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 11 Jul 2020 16:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594499090;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=18zzlBN37qwwt5tcPIAQJklJ+UKlT7xWUM+c7A9ByOY=;
        b=KccIQy+8CsDUwu+NY+muDePbJBzkox48sYRGDEAMSSVgzRWSrjJtPmJUgiCa9zTjH3
        B0uUmnOkTHKiJvwPIV7X9twZh9KKRlY/Yz7ujcr0bpKEnc4d65X71krh6OYqyn/xc31l
        jgY2yqqBzQ9J6uywZd8+dSCiuQf9mtotnd12P5OyiLAe/vjQZ/Xh4vKjoAG3Xzo2FoFi
        TLJVqhgeCA4F/j+WiTbQjcm7mhWjU7iq1khZb0Z5k9SSM8LYp8/JlAoXvQVniSSF6NDW
        FGp6VMbWBRN8gJbm4kRm9oAgk4fylqLCmb8Moua94JeU2htdOu4FP4jU+ZJELZKeQFRK
        36Zg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWcXAYPzw=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w6BKOhAv0
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 11 Jul 2020 22:24:43 +0200 (CEST)
Subject: Re: [PATCH] MIPS: CI20: DTS: Correcting IW8103 Wifi binding
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <f617580b-fad7-f4f2-e89d-402b53c21c47@deutnet.info>
Date:   Sat, 11 Jul 2020 22:24:47 +0200
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6AB9C165-7B42-44A6-BCA8-8879B7D70699@goldelico.com>
References: <20200705103215.96672-1-agriveaux@deutnet.info> <457C75ED-A033-4B46-A9D9-53B510C16F37@goldelico.com> <f617580b-fad7-f4f2-e89d-402b53c21c47@deutnet.info>
To:     Alexandre GRIVEAUX <agriveaux@deutnet.info>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexandre,

> Am 06.07.2020 um 22:22 schrieb Alexandre GRIVEAUX =
<agriveaux@deutnet.info>:
>=20
> Le 06/07/2020 =C3=A0 13:15, H. Nikolaus Schaller a =C3=A9crit :
>> Hi Alexandre,
>>=20
>>> Am 05.07.2020 um 12:32 schrieb agriveaux@deutnet.info:
>>>=20
>>> From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
>>>=20
>>> Use brcm,bcm4329-fmac instead of brcm,bcm4330-fmac.
>>>=20
>>> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
>>> ---
>>> arch/mips/boot/dts/ingenic/ci20.dts | 4 ++--
>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts =
b/arch/mips/boot/dts/ingenic/ci20.dts
>>> index 75f5bfbf2c37..82a1f126b778 100644
>>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>>> @@ -116,8 +116,8 @@
>>> 	pinctrl-0 =3D <&pins_mmc1>;
>>>=20
>>> 	brcmf: wifi@1 {
>>> -/*		reg =3D <4>;*/
>>> -		compatible =3D "brcm,bcm4330-fmac";
>>> +		reg =3D <1>;
>>> +		compatible =3D "brcm,bcm4329-fmac";
>>> 		vcc-supply =3D <&wlan0_power>;
>>> 		device-wakeup-gpios =3D <&gpd 9 GPIO_ACTIVE_HIGH>;
>>> 		shutdown-gpios =3D <&gpf 7 GPIO_ACTIVE_LOW>;
>> Do you have it working with a v5.8 kernel?
>>=20
>> I don't see any activity to detect the module or load firmware.
>>=20
>> Does it rely on some other patch?
>>=20
>> BR and thanks,
>> Nikolaus
>>=20
> Hi Nikolaus
>=20
>=20
> At this time the patch have been only "tested" for error will doing =
make:
>=20
> make ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu- olddefconfig &&  =
make
> ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu- -j8 && make ARCH=3Dmips
> CROSS_COMPILE=3Dmipsel-linux-gnu- -j8 uImage
>=20
>=20
> The .config come from creator-ci20 kernel 'config-3.18.3-ci20-1'
>=20
>=20
> Even with the right DT
> (Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt)
> it's need some config with brcm enabled I gess.
>=20
>=20
> I need to do some investigation will trying the uImage this week,
> unfortunaly kernel developpement is not my main work, it's a hobby.

No problem. For me, the CI20 is also a hobby project :)

Here is some information about the CI20 WiFi and firmware:

https://elinux.org/CI20_Hardware#WiFi.2FBT

https://elinux.org/CI20_upstream#WiFi_firmware

So to be it looks as if the

compatible =3D "brcm,bcm4330-fmac";

is correct. But the reg =3D <4> or <1> is something we have to find out.

BR,
Nikolaus

