Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3FA3E1964
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 18:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhHEQXQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 12:23:16 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104]:9440 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhHEQXQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Aug 2021 12:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628180562;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=1Dt5UDwqFkl+TcejJTVjL9OsBeIhp1y2QdfLef1WZwk=;
    b=K0+bYSh4/X2Kjca0TE+3SA86Kv4CLrnkiQCEcec2q9Jo/3xOAwKJvhCKnZpYl4ooXM
    conQltKDH9/f4lKj8X3DDDfDmqHdL3/yFMqjYBZPJkcN8CFanTpkW/Yfr8bA6w6aYT9w
    x6CdAVCZuUduyD8YlJkFPpW/Zx9Dmv6DVPMP3nEYTKdvwaQX6iunvxv2Ad3oSXLvimT9
    fYGrg43IlpyuYuBMB4bezLW39Np9ky4k9Sok7PKDUzsUz16Fh8qmgiDWKBsJUG667CuN
    KI1TfgOQD31eg5M1u9NxBquJ2NTX3bD2p+dxAkSYYcaoh066aokcpZNHkw78n1yWJ5O2
    1sbQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4rovw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
    with ESMTPSA id Q02727x75GMf7Yg
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 5 Aug 2021 18:22:41 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2 8/8] [RFC] drm/ingenic: convert to component framework
 for jz4780 hdmi
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <8XJDXQ.X70C5WOD0QB7@crapouillou.net>
Date:   Thu, 5 Aug 2021 18:22:40 +0200
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        Robert Foss <robert.foss@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <15453A89-17E2-4B8B-A131-9B77C42DC1F4@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
 <YQv+DC5yTEGlJYuD@pendragon.ideasonboard.com>
 <BDF501D1-BA1D-4866-8EAF-3862F6CEC6F4@goldelico.com>
 <8XJDXQ.X70C5WOD0QB7@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 05.08.2021 um 18:17 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus and Laurent,
>=20
> Le jeu., ao=C3=BBt 5 2021 at 18:07:20 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Laurent,
>>> Am 05.08.2021 um 17:04 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>>> Hi Nikolaus,
>>> Thank you for the patch.
>>> On Thu, Aug 05, 2021 at 04:07:57PM +0200, H. Nikolaus Schaller =
wrote:
>>>> This patch attempts to convert the ingenic-dw-hdmi driver
>>>> into a version that uses the component framework.
>>> Why ? What problem would this solve ?
>> Well, it was suggested in a v1 we did post several months ago. I have =
not
>> looked up by whom and do not exactly remember the reasons.
>> We now simply thought that it is common style since dome dw-hdmi =
drivers
>> make use of it but some others don't. And we got it working without.
>> If it is not needed/requested by anyone, we can drop it from v3 (or =
add later).
>=20
> I don't remember exactly TBH - the only reason to use a component is =
to have access to the main driver's "drm_device" structure. The IPU =
needs it for instance, to register planes; but I don't think this HDMI =
driver needs it as it registers a bridge.
>=20
> Cheers,
> -Paul

Ok, fine! We'll drop it and don't waste time.

BR and thanks,
NIkolaus

