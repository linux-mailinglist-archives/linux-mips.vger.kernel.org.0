Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C865E3E38B6
	for <lists+linux-mips@lfdr.de>; Sun,  8 Aug 2021 06:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhHHEvE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Aug 2021 00:51:04 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:21105 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhHHEvE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Aug 2021 00:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628398216;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=tqf6PlETAOXRJpPIr/nXcD0P8wQYQiHI4vR4nGLYXTg=;
    b=N85pf2/ocz0fkNh9TirmrPfOWEs2FxQbQKE7UUaB7dMm4YJHcRuUJfUFX/yEhotLtO
    ayy3Bj93gP6xkn+fgoTCnUWMaomYwx6vHn39xs6oo7tHlzzXoL1nBVpkY3jGBhhklm/B
    kXubmqe6CGMKPuZu0cdfolbZp6EtFXibCuBlZK6XjT5p3HXi2iAijQ2kq0L5BZ25JgZ3
    qp+V274lhDYt24P5Ifnze6JRALG8jTYlernmDtkOXzNqdP9Ubd6srXSiTHge2HEcWoCL
    dr+nztDZyVTV6p4vF2JJAvOPYX1CorOT0E3k1pvtHaftXDVG2I5wVoNIOJ/1HRwZDIO1
    vv5w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u3mM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x784oDExT
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Sun, 8 Aug 2021 06:50:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 1/8] drm/bridge: synopsis: Add mode_fixup and bridge
 timings support
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAG3jFyu50h2oLW0U6hJSpxiKp3Hb5Ow8Ujvg2qdKRuy+uhaahw@mail.gmail.com>
Date:   Sun, 8 Aug 2021 06:50:13 +0200
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        letux-kernel@openphoenux.org, Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <79C56341-BB3E-4AFC-A595-6EE2ED603FC2@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <15187eccabf39561de226acd8be40b93503cac49.1628172477.git.hns@goldelico.com>
 <CAG3jFyu50h2oLW0U6hJSpxiKp3Hb5Ow8Ujvg2qdKRuy+uhaahw@mail.gmail.com>
To:     Robert Foss <robert.foss@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Robert,


> Am 05.08.2021 um 16:32 schrieb Robert Foss <robert.foss@linaro.org>:
>=20
> Hey Nikolaus,
>=20
> Thanks for submitting this series.
>=20
> On Thu, 5 Aug 2021 at 16:08, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
>>=20
>> From: Paul Boddie <paul@boddie.org.uk>
>>=20
>> static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>>                                    const struct drm_display_mode =
*orig_mode,
>>                                    const struct drm_display_mode =
*mode)
>> @@ -2883,6 +2896,7 @@ static const struct drm_bridge_funcs =
dw_hdmi_bridge_funcs =3D {
>>        .atomic_disable =3D dw_hdmi_bridge_atomic_disable,
>>        .mode_set =3D dw_hdmi_bridge_mode_set,
>>        .mode_valid =3D dw_hdmi_bridge_mode_valid,
>> +       .mode_fixup =3D dw_hdmi_bridge_mode_fixup,
>=20
> mode_fixup() has been deprecated[1] in favor of atomic_check(), care
> has to be taken when switching to atomic_check() as it has access to
> the full atomic commit.
>=20
> Looking at this driver, it's using mode_set as well, which should be =
fixed.
>=20
> [1] =
https://lore.kernel.org/dri-devel/20210722062246.2512666-8-sam@ravnborg.or=
g/

We have moved code from mode_fixup() to atomic_check().
Was not difficult.

v3 will come soon.

BR and thanks,
Nikolaus Schaller

