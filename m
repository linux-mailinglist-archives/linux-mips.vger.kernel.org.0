Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFCE44B3D6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 21:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhKIUWa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 15:22:30 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:24398 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbhKIUWa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 15:22:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636489159;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=JxqM8I/z35C5+6J2ZygkF2pjyw7aqUpyOwISg707hYI=;
    b=P4Q/O7R+6NMMrAlpZFc7SF8DTNcYUMrpfKvHu32CezOknO1/Yo3Iu2tZJRnS+B6797
    76Ib13MWNlnm3EMFJNL6+52AE4zRb0dQk3vI7FuUH7PpE4G/5iJKdR1zgUmly5toHPYt
    WpTZh+y/F854ldxMHS1w1pphUwbZrRs7lxq5KjUdeBq9uoS8gv6VuMH1QzTQ0Up9B/tb
    LsO+WBhZEYSz7IMIuHEkewh4vZVYNysaKyWP3OB4cZtp84qHRbfXjv1lFEbB4oTyP37T
    dpbgYNVlCNj/DN1H9+nsVOQ4piaKfjU+96mmNhQLO4J9q35XkcpvMewwjw4HOZjPA5LZ
    EzEQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8cT6Q=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xA9KJI0YI
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 9 Nov 2021 21:19:18 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 5/7] MIPS: DTS: jz4780: Account for Synopsys HDMI
 driver and LCD controllers
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
Date:   Tue, 9 Nov 2021 21:19:17 +0100
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
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
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Jon as Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF6CBFFA-E8AA-4CCE-A587-4D5D647DEC64@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
 <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
 <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
 <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 07.11.2021 um 20:05 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>> 6. Therefore I think it *may* work overclocked with 48MHz
>> but is not guaranteed or reliable above 27 MHz.
>> So everything is ok here.
>=20
> One thing though - the "assigned-clocks" and "assigned-clock-rates", =
while it works here, should be moved to the CGU node, to respect the =
YAML schemas.

Trying to do this seems to break boot.

I can boot up to=20

[    8.312926] dw-hdmi-ingenic 10180000.hdmi: registered DesignWare HDMI =
I2C bus driver

and

[   11.366899] [drm] Initialized ingenic-drm 1.1.0 20200716 for =
13050000.lcdc0 on minor 0

but then the boot process becomes slow and hangs. Last sign of activity =
is

[   19.347659] hub 1-0:1.0: USB hub found
[   19.353478] hub 1-0:1.0: 1 port detected
[   32.321760] wlan0_power: disabling

What I did was to just move

		assigned-clocks =3D <&cgu JZ4780_CLK_HDMI>;
		assigned-clock-rates =3D <27000000>;

from

	hdmi: hdmi@10180000 {

to

	cgu: jz4780-cgu@10000000 {

Does this mean the clock is assigned too early or too late?

Do you have any suggestions since I don't know the details of CGU.

BR and thanks,
Nikolaus

