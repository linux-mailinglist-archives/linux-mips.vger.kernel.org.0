Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20BF3E172D
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 16:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241283AbhHEOpm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 10:45:42 -0400
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:16053 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242043AbhHEOpe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 10:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628174703;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=CwTGY3tyiTggufhRZZc5PzbzDRbM+7takEiiMkRCKhk=;
    b=elT9VPKWNBWzSvkelUN0gWixQmUlXXcWO7AmpcOBD3rKdjd1tidT/v1U7xKBz2BqUv
    db1DutcLhpQ17stiaAOWSQhgtCHCCDkDXSPVs1lnoUfifFNpkeNqM+LcxxR5lCma9QGB
    2fHpKTZw4onCNbaguC/7bS2jvumxXGo4xkvDpEMY1xG+50BNNdlGKULbF/uxAIvJJwrZ
    ruKbf6y0BmX6hlQUM3Pc5d10hKMEShI2HQsA53QfcBqyogUhpW7+/3Bicf9jgGMlBsix
    1iwNCP0uK4My6YFMqoXQkfrMWEPUrqmssmQ4plgju9GFnEHSh/KyQs1llzrj1weFP0i1
    SmbQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4rovw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x75Ej27Hh
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 5 Aug 2021 16:45:02 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 1/8] drm/bridge: synopsis: Add mode_fixup and bridge
 timings support
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAG3jFyu50h2oLW0U6hJSpxiKp3Hb5Ow8Ujvg2qdKRuy+uhaahw@mail.gmail.com>
Date:   Thu, 5 Aug 2021 16:45:01 +0200
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
Message-Id: <8F63582D-08E9-4B9D-B2E2-B862830C57D1@goldelico.com>
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

Thanks for this link!

I have found some patches which convert mode_fixup -> atomic_check (e.g. =
3afb2a28fa2404)
and atomic_check was apparently introduced by b86d895524ab72

That should be sufficient information that we can modify it.

BR and thanks,
Nikolaus

