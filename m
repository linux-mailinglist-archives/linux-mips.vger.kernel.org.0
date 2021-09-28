Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A621F41AE20
	for <lists+linux-mips@lfdr.de>; Tue, 28 Sep 2021 13:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240442AbhI1LwP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Sep 2021 07:52:15 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:9000 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240368AbhI1LwM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Sep 2021 07:52:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632829815;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=YTEFE85q1lzsLsryEhw+wFNrRWWN7xnJQaSGDFtVJl4=;
    b=llHwgcd407FNOA8AI2maCSIaPdmB4dmrx3OYc5rQeFsr8JLh2WHuQbu1l/+DuXGD9+
    kKgAtpjFCnHHlW3P9HZiJZDCoKEv2n+4XeCmFLaZrkWjl0UJkEHVEX0E6DZWV8Kw3r+O
    oDm5VRBtTrbpP5lOvY7nQjrsjTiN55EFZvTMMcjzkn/mEf+0lLg0ndOmP27ZnYTgcOCd
    2t/zEEhU0utFqfubdLFGh2dn4KnGw85xVUBuiWAmynQPDAHeuEq3cP/Lqn1ld5dukkTP
    ubiIJuvYqWFXVeHMK39M1A3zmZ4m/XjWwvhIWO3BPEPgt0Dfz1+Xbpgx1TiVZ/Sl5ZQh
    7wsw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43sT7Q="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x8SBoDe6N
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 13:50:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v4 10/10] drm/ingenic: add some jz4780 specific features
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <E40D4D33-536F-4218-BEDD-C64539F15D40@goldelico.com>
Date:   Tue, 28 Sep 2021 13:50:13 +0200
Cc:     Rob Herring <robh+dt@kernel.org>,
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
Message-Id: <5A763511-72C8-4CDE-AF1F-8F1A04390BAE@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <8cbfba68ce45e10106eb322d622cb7ac64c0e4d4.1632761068.git.hns@goldelico.com>
 <AE250R.2UXAKOURL8O52@crapouillou.net>
 <E40D4D33-536F-4218-BEDD-C64539F15D40@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> Am 28.09.2021 um 12:06 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>>>=20
>>> +
>>> +	/* RGB output control may be superfluous. */
>>> +	if (soc_info->has_rgbc)
>>> +		regmap_write(priv->map, JZ_REG_LCD_RGBC,
>>> +			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
>>> +			     JZ_LCD_RGBC_ODD_RGB |
>>> +			     JZ_LCD_RGBC_EVEN_RGB);
>>=20
>> ingenic-drm only supports RGB output right now, so I guess the =
RGB_FORMAT_ENABLE bit needs to be set in patch [2/10], otherwise patch =
[2/10] cannot state that it adds support for the JZ4780, if it doesn't =
actually work.

interestingly it works without setting anything in this register.

>>=20
>> The other two bits can be dropped, they are already set in =
ingenic_drm_encoder_atomic_mode_set().
>=20
> Ok.

Setting it manually doesn't change anything visible:

root@letux:~# devmem2 0x13050090
/dev/mem opened.
Memory mapped at address 0x77e14000.
Value at address 0x13050090 (0x77e14090): 0x0
root@letux:~# devmem2 0x13050090 w 0x80
/dev/mem opened.
Memory mapped at address 0x77e38000.
Value at address 0x13050090 (0x77e38090): 0x0
Written 0x80; readback 0x80
root@letux:~#=20

Same for 0x130A0090. Maybe this lcdc register
is not used at all - at least for HDMI?

So I'd suggest to drop this whole patch from v5.

BR and thanks,
Nikolaus

