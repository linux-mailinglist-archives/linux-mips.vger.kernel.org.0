Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49871447E4B
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 11:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238772AbhKHKzQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 05:55:16 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:22113 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238707AbhKHKzP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 05:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636368743;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=f/r1eAU7KrXxztQXZTXHCi0ApvqFCqBOCfYtrmaL1xY=;
    b=gUx3dm5ooAMb8mpK2BYmZ1D/Xx/Kr68W0ZyIxRU3Bu57OWOFSJYrTR4sXnH8oVcUVg
    WxtwvZXZWeOvkqKpPRlzwivKorKgAd+PJvmoqo2tnWHbZYqngpjNq8CL61HT3rdyHDqd
    dJ9eejg05X50GVv0CbQoy29+bkPil7ilDjep8GaT7xczllJ+hQXf57xPp0Ul970mc8T1
    pB36IYsn67s2+b/NW81/1WWbL96pwp0bD5oJxiDpPRIQmrr3edPEb4G34D2jUATizhJe
    9o3ULt4duFoaOAFo5/q46zerHy30M+hx63d0zfKcmkffcHjp+mqEjOva3dyQ25XCNxpz
    kO2A==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3gMZ+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id 902c63xA8AqLIYt
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 8 Nov 2021 11:52:21 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI
 output
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <HQY82R.69JHJIC64HDO1@crapouillou.net>
Date:   Mon, 8 Nov 2021 11:52:20 +0100
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

>> Am 08.11.2021 um 10:37 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>> Well, it was atomic: "add jz4780+hdmi functionality" or not. Now we =
separate into "preparation for adding jz4780" and "really adding". Yes, =
you can split atoms into quarks...
>=20
> And that's how it should be done. Lots of small atomic patches are =
much easier to review than a few big patches.

I doubt that in this case especially as it has nothing to do with =
jz4780...

But I have a proposal for a better solution at the end of this mail.

>>> Note that you can do even better, set the .max_register field =
according to the memory resource you get from DTS. Have a look at the =
pinctrl driver which does exactly this.
>> That is an interesting idea. Although I don't see where
>> =
https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/pinctrl-ing=
enic.c#L4171
>> does make use of the memory resource from DTS. It just reads two =
values from the ingenic_chip_info instead of one I do read from =
soc_info.
>=20
> It overrides the .max_register from a static regmap_config instance.

To be precise: it overrides .max_register of a copy of a static =
regmap_config instance (which has .max_register =3D 0).

> You can do the same,

We already do the same...

> calculating the .max_register from the memory resource you get from =
DT.

I can't see any code in pinctrl-ingenic.c getting the memory resource =
that from DT. It calculates it from the ingenic_chip_info tables inside =
the driver code but not DT.

> I'm sure you guys can figure it out.

Ah, we have to figure out. You are not sure yourself how to do it? And =
it is *not* exactly like the pinctrl driver (already) does? Please give =
precise directions in reviews and not vague research homework. Our time =
is also valuable. Sorry if I review your reviews...

Anyways I think you roughly intend (untested):

	struct resource *r;

	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
	regmap_config.max_register =3D r.end - r.start;

But I wonder how that could work at all (despite adding code execution =
time) with:

e.g. jz4770.dtsi:

	lcd: lcd-controller@13050000 {
		compatible =3D "ingenic,jz4770-lcd";
		reg =3D <0x13050000 0x300>;

or jz4725b.dtsi:

	lcd: lcd-controller@13050000 {
		compatible =3D "ingenic,jz4725b-lcd";
		reg =3D <0x13050000 0x1000>;

So max_register becomes 0x300 or 0x1000 but not

#define JZ_REG_LCD_SIZE1	0x12c
	.max_reg =3D JZ_REG_LCD_SIZE1,

And therefore wastes a lot of regmap memory.

Do you want this? DTS should not be reduced (DTS should be kept as =
stable as possible), since the reg property describes address mapping - =
not how many bytes are really used by registers or how big a cache =
should be allocated (cache allocation size requirements are not hardware =
description).


But here are good news:

I have a simpler and less invasive proposal. We keep the =
devm_regmap_init_mmio code as is and just increase its .max_register =
from JZ_REG_LCD_SIZE1 to JZ_REG_LCD_PCFG when introducing the jz4780. =
This wastes a handful bytes for all non-jz4780 chips but less than using =
the DTS memory region size. And is less code (no entry in soc_info =
tables, no modifyable copy) and faster code execution than all other =
proposals.

This is then just a single-line change when introducing the jz4780. And =
no "preparation for adding jz4780" patch is needed at all. No patch to =
split out for separate review.

Let's go this way to get it eventually finalized. Ok?

BR and thanks,
Nikolaus

