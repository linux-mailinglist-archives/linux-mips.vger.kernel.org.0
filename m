Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1F7449BB1
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 19:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235670AbhKHSgo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 13:36:44 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:26331 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbhKHSgn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 13:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636396431;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=V9Iis9hGWtZOgUPU1mqg1irQSYLApnWnzQFHO9gUfwI=;
    b=D9aOeIJ1Ym/PITlBZv2L+vSVbh9zw/E080wuh9vTMvTh9wmswt66zbcUOlmdBLNLk6
    fj3VraebsAAPkBFkGmd6F6xmARMCZVrsXHvqlCTFNhDi1NqAjATz5cevLLLtF1ipPd+F
    c78Q1vM5EtEkQOJwwArjsYEtV7hIxwZ/ERKOt526VSm8aLnrmw8M9YRTUwDvOTdD7cP9
    REICA5IcDu/oUTNE2vLiw/sbaxWDQgUuRUMeSdaYNWk/LIN+9lkh6sHTrkXC51DsCrHU
    VajNNoLLmKZoJRiYuC2g9vhMlleoIBlhRj3p513oRFqvO+B5G5gTBSmX9vIje1J78IpA
    B7oQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3gMZ+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id 902c63xA8IXnMN2
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 8 Nov 2021 19:33:49 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI
 output
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <RIL92R.MLAZ6CTO865E1@crapouillou.net>
Date:   Mon, 8 Nov 2021 19:33:48 +0100
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
Message-Id: <ACEFD0BB-1FCF-4EEB-A40F-1F2543A05BF4@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
 <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
 <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
 <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
 <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
 <HQY82R.69JHJIC64HDO1@crapouillou.net>
 <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
 <ZA692R.GHQL6RBCLFB12@crapouillou.net>
 <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
 <BVH92R.0VU3IKPQTLX9@crapouillou.net>
 <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
 <RIL92R.MLAZ6CTO865E1@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 08.11.2021 um 18:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>>> Variant 4: the variant #2 without the changes to the DTSI files.
>> Hm. If there is no cache and we can safely remove tight boundary =
checking (by JZ_REG_LCD_SIZE1) for jz4725/40/70 (by not fixing DTSI) why =
do we still need the max_register calculation from DTSI specifically for =
jz4780 and at all?
>=20
> It's better to have the .max_register actually set to the proper =
value. Then reading the registers from debugfs =
(/sys/kernel/debug/regmap/) will print the actual list of registers =
without bogus values. If .max_register is set too high, it will end up =
reading outside the registers area.

Ok, that is a good reason to convince me.

> On Ingenic SoCs such reads just return 0, but on some other SoCs it =
can lock up the system.

Yes, I know some of these...

> So the best way forward is to have .max_register computed from the =
register area's size, and fix the DTSI with the proper sizes. Since your =
JZ4780 code needs to update .max_register anyway it's a good moment to =
add this patch, and the DTSI files can be fixed later (by me or whoever =
is up to the task).

Well, it would already be part of my Variant #2 (untested). So I could =
simply split it up further and you can test the pure dtsi changes and =
apply them later or modify if that makes problems. Saves you a little =
work. BTW: the jz4740 seems to have even less registers (last register =
seems to be LCDCMD1 @ 0x1305005C).

>=20
> Fixing the DTS is not a problem in any way, btw. We just need to =
ensure that the drivers still work with old DTB files, which will be the =
case here.

Yes, that is right since the new values are smaller than the originals.

Ok, then let's do it that way.

BR and thanks,
Nikolaus=
