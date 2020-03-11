Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E5918197C
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 14:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgCKNUV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 09:20:21 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:35792 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729103AbgCKNUV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 09:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583932818; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VBz3FZ3ocy9Q4rzBgIHqJzobg61gP/HChhqdayvs+kk=;
        b=yGNmzbLo0S1R24n1OGPsGlftaQ2Z9STV+IYFchtu/eOrKBQs99T+Sg0QfS0jjJiM7iPlvB
        fCXv+Kd2EdwpQ7DhAMRKSbOYjLnORPIaX8ySm/AoXTBk1KYarlZRCzenNsMs2lIS3yfGGO
        mUxsbYR1ib0OtfKdfzzID+aaqdyuqWM=
Date:   Wed, 11 Mar 2020 14:20:09 +0100
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
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
Message-Id: <1583932809.3.0@crapouillou.net>
In-Reply-To: <F29E9DCC-29BC-4B88-9288-3E53BF8423C6@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
        <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com>
        <1583177253.3.5@crapouillou.net>
        <F29E9DCC-29BC-4B88-9288-3E53BF8423C6@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le mer., mars 11, 2020 at 13:43, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 02.03.2020 um 20:27 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>=20
>>  Le ven., f=E9vr. 28, 2020 at 19:19, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>  A specialisation of the generic Synopsys HDMI driver is employed=20
>>> for JZ4780
>>>  HDMI support. This requires a new driver, plus device tree and=20
>>> configuration
>>>  modifications.
>>>  Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 32=20
>>> ++++++++++++++++++++++++++
>>>  1 file changed, 32 insertions(+)
>>>  diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
>>> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>  index f928329b034b..391d4e1efd35 100644
>>>  --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>  +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>  @@ -433,4 +433,36 @@
>>>  		status =3D "disabled";
>>>  	};
>>>  +
>>>  +	hdmi: hdmi@10180000 {
>>>  +		compatible =3D "ingenic,jz4780-dw-hdmi";
>>>  +		reg =3D <0x10180000 0x8000>;
>>>  +		reg-io-width =3D <4>;
>>>  +
>>>  +		clocks =3D <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
>>>  +		clock-names =3D "isfr" , "iahb";
>>>  +
>>>  +		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
>>>  +		assigned-clock-rates =3D <27000000>;
>>=20
>>  I *think* this should go to the board file.
>>=20
>>>  +
>>>  +		interrupt-parent =3D <&intc>;
>>>  +		interrupts =3D <3>;
>>>  +
>>>  +		/* ddc-i2c-bus =3D <&i2c4>; */
>>>  +
>>>  +		status =3D "disabled";
>>>  +	};
>>>  +
>>>  +	lcd: lcd@13050000 {
>>=20
>>  The node name should be 'lcd-controller'.
>>=20
>>>  +		compatible =3D "ingenic,jz4740-lcd";
>>=20
>>  The JZ4780's LCD controller is much newer than the JZ4740 one, so=20
>> even if it works with the "ingenic,jz4740-lcd" compatible string,=20
>> you want it as a fallback.
>>  So this should be: compatible =3D "ingenic,jz4780-lcd",=20
>> "ingenic,jz4740-lcd".
>>=20
>>  That means the YAML should be updated too.
>=20
> I have started to look into jz4780 HDMI setup again.
>=20
> Well, there is no driver compatible to "ingenic,jz4780-lcd" so far
> and it is questionalbe if we need a different one.
>=20
> I think we should rather make the driver also compatible
> than adding a fallback to ingenic,jz4740-lcdto the DTS.
>=20
> The reason why this is better even if both LCDC are almost
> compatible is that the jz4780 allows for much bigger displays
> and therefore should have its own jz_soc_info with 4k x 2k
> as maximum.

Sure, feel free to extend the driver.

> Next I tried to find out if the LCDC are really compatible.
>=20
> Well the jz4780 has two lcdc instances but they are separated
> by the reg addr. Next, there are unique features (like picture in
> picture with alpha blending) but those are probably disabled
> if not programmed from reset state. This may become a reason
> to separate or augment the driver for the jz4780 but at the
> moment we can ignore that.

Two LCDC instances -> two lcd-controller@... nodes. It's that simple.

The other features you listed are outside the LCDC, so outside the=20
scope of this driver.

> There are also subtly different bit definitions and register
> widths (e.g. 24 bit in addition to 16/18 bit modes or more bits
> for the sync position) but it looks as if the ingenic_drm
> driver already handles this.
>=20
> Then I tried to read back the registers. Strangely they
> are all 0x00000000. So there is no programming of the
> lcd-controller in our DT setup with HDMI at all!

How did you read them?
Do it from the regmap: should be "cat=20
/sys/kernel/debug/regmap/13050000.lcd-controller/registers" (not sure=20
about the path)

> I also checked that ingenic_drm_probe() is called and
> returns successfully 0. It also reports that a /dev/fb
> has been created:
>=20
> [    7.908830] ingenic-drm 13050000.lcd-controller: fb0:=20
> ingenic-drmdrmf frame buffer device
>=20
> But for example ingenic_drm_encoder_atomic_mode_set() is
> never called which should write some registers of the LCDC.
>=20
> I only did see some calls to ingenic_drm_encoder_atomic_check().
>=20
> This of course explains why we have no HDMI signals despite
> proper HPD and a /dev/fb0. Because the LCDC is not being
> programmed.

It won't be called until the HDMI driver says that the cable is=20
plugged, and there's a client application (e.g. fbdev emulation)=20
running. So the problem is most likely within the HDMI driver.

Cheers,
-Paul

> Any ideas / hints how to check or improve?
>=20
> BR and thanks,
> Nikolaus
>=20

=

