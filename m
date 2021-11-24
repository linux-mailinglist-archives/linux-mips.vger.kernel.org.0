Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFA745CA5C
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 17:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241782AbhKXQvf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 11:51:35 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:26100 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238391AbhKXQve (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637772497;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=icc13YC5mHwE0XQvAD6VEy3MsLwt9uSPlxq+Nx/D1H4=;
    b=YUnGh4OjkMKYt7K5BhVP0dlBbNqMmnci+MORTJkKXQ6y7MlxZrjR9JjuoNqdipnaK9
    nqemSaP1pvW/Cbw77TFiM5LPFoHXE7mjs2/b9LwrH565ebcmWMWr2qMaGNVKvE1w711S
    cL0LYlqGbUhunijvOfMhhcxgDtGnHHThxXQvMzVvT98VN5f+NZHBB7AUtRvzOwOWp4oB
    ewEBmbOCTaJ9iwRyirRd5Ep0V7+ry1cEVl8jZJ3sohImjJw/q5zY+RXR3SG2ErxXD1cR
    Fj9jVhE6K0ntaf4UqxEVEloyda/mdLwW6rk1XJmmlScC+kDdWtsj2u+sfZiOtVts4pl/
    8InQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
    with ESMTPSA id e05ed8xAOGmG3vt
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 24 Nov 2021 17:48:16 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 0/8] MIPS: JZ4780 and CI20 HDMI
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <B6B358E8-4395-442F-A353-396D8DC54C66@goldelico.com>
Date:   Wed, 24 Nov 2021 17:48:16 +0100
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
Message-Id: <A0913ACC-5803-4FF7-AF96-CE8CB3F9F323@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <J4K13R.CGVJ0IY95LC51@crapouillou.net>
 <B6B358E8-4395-442F-A353-396D8DC54C66@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 23.11.2021 um 21:44 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Paul,
>=20
>> Am 23.11.2021 um 21:12 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>> Hi Nikolaus,
>>=20
>> I think if you can fix the last few things I commented on, and I get =
an ACK from Rob for the Device Tree related patches, then it will be =
ready to merge.
>=20
> Fine! Especially for finding the NULL regulator risk.
>=20
> Will do in the next days.
> For the unwedge pinmux I have to check if we need it at all.

No. It is only needed by the driver to take care of for a special =
potential hardware hickup.
The current code does nothing and I have removed it and everything still =
works as
before.

There remains only one question for a v9: can we store the (single) =
regulator reference
in a static variable or should we define a struct and allocate memory in =
patch 4/8?

BR and thanks,
Nikolaus

