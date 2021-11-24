Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5978945CEE7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 22:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245211AbhKXVcS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 16:32:18 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:36243 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbhKXVcR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 16:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637789325;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=xop8XlZAoTl1OV6De+uWk96yVRTl49IvEavBZ+QQ5D8=;
    b=Uwz7zEyjAeqLxi9rLNp+UFq4MsyxKzi7QkPnpc2pGHFiO8JhKtRdo8wp2o13YFoKBq
    37cJ53heBEu6lWTok97mTx4G+cBK+wHHGw3hS+PPlLrVO3bhsdz/optzLemsZ/xE83PL
    RzKZpdRE8vk+pLu38IQmJnMSq91MI0SPjo7nYUF1R/j8IFzFYyP888YYfszhH1l3RvRk
    hlxOx+fKSDd0SNhm9hVh0oz7OaniTAEvrGV2nHXPcnenkd9F+S9U6eRy1Ug93Y0c/J4z
    1bPDa4+oO/3jLqTDVIsIy+pFwodt/Q7ob47mCdqYN1NC+Ew9J4+EoZ7TdIoqRy5F5+t6
    6Euw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
    with ESMTPSA id e05ed8xAOLSi5Al
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 24 Nov 2021 22:28:44 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 4/8] drm/ingenic: Add dw-hdmi driver for jz4780
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DIA33R.QE29K7RKLI2C1@crapouillou.net>
Date:   Wed, 24 Nov 2021 22:28:43 +0100
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
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5272A7B-8943-4AB9-8705-1EC4E9891C1D@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <64c6ab288d4d7159f633c860f1b23b3395491ae1.1637691240.git.hns@goldelico.com>
 <GTJ13R.RSQAWZX83DUZ2@crapouillou.net>
 <016973B0-B7F0-4E63-BF4F-2643611A6351@goldelico.com>
 <DIA33R.QE29K7RKLI2C1@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,


>>> You probably should disable the regulator (if not NULL) here.
>> Indeed. Would it be ok to make struct regulator *regulator static
>> or do we need dynamically allocated memory?
>=20
> static non-const is almost always a bad idea, so avoid it.

Well some years ago it was a perfectly simple solution that still =
works...
But I asked because I had a lot of doubt.

>=20
> You can either:
>=20
> - create a "ingenic_dw_hdmi" struct that will contain a pointer to =
dw_hdmi and a pointer to the regulator. Instanciate it in the probe with =
devm_kzalloc() and set the pointers, then set it as the driver data =
(platform_set_drvdata). In the remove function you can then obtain the =
pointer to your ingenic_dw_hdmi struct with platform_get_drvdata(), and =
you can remove the dw_hdmi and unregister the regulator.
>=20
> - register cleanup functions, using devm_add_action_or_reset(dev, f, =
priv). When it's time to cleanup, the kernel core will call f(priv) =
automatically. So you can add a small wrapper around dw_hdmi_remove() =
and another one around regulator_disable(), and those will be called =
automatically if your probe function fails, or when the driver is =
removed. Then you can completely remove the ".remove" callback. There =
are a few examples of these in the ingenic-drm-drv.c if you want to take =
a look.

The second one turned out to be cleaner to handle special cases like if =
there is no regulator. We just register the disabler only if there is a =
regulator and enable succeeds.

So v9 is coming now.

BR and thanks,
Nikolaus

