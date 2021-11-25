Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF80B45D634
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 09:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351164AbhKYIeY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 03:34:24 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:15011 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236816AbhKYIcY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 Nov 2021 03:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637828944;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=hNupkB5Ycrs2ep+wM+k9JG7Vx2CZhHli9LlBG3B/zR4=;
    b=VyZQoxLc3nRIMAK86FuSrQjTZaLeXU8W7jLtfsq5foieszx0qglMxuGCYbPiXRz9r/
    LYBxc/cvzwJTzX3f0uOL2Zl2o3mE2WfIkpDjBilzpv66DKWeb7iRMuBJDeK/z/AZiDsa
    6GKnLe4NYfCJ4HKSR2AoNWZUCwfrEX/s5r9tHKxIsNyxZ6K2fSOzKV8CQeSat/oOqirG
    IfRYTXgzkVqqx8/j8nF1JmrXO94rmxZp9YzWHs9Vp3tY8vSfGAwN0ARYExMCS8rAdn8c
    wvtZZu6kCKg/K9yu5NmBlj8FEXu+K/sYL9dHp9WsRmF86fhvp9vU9mB4NgzniK/3cT+L
    n05g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMMUrw=="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
    by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
    with ESMTPSA id e05ed8xAP8T26En
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 25 Nov 2021 09:29:02 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 6/8] MIPS: DTS: CI20: Add DT nodes for HDMI setup
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAMuHMdV5sjVg6BEm3zgvvsJDHJwKP1A8rh-sama8suCG5SYQyA@mail.gmail.com>
Date:   Thu, 25 Nov 2021 09:29:02 +0100
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
        Paul Boddie <paul@boddie.org.uk>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD6EFFDC-EB04-4C39-8A63-3825C3A9C64D@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <d62023e0872e9b393db736f4a0ecf04b3fc1c91b.1637691240.git.hns@goldelico.com>
 <O0K13R.TIL3JBQ5L8TO1@crapouillou.net>
 <04F0ED7C-3D18-4CCF-8F10-E0A36B0E4F4B@goldelico.com>
 <CAMuHMdWO3yosf5eyTPpydVuT3pwvuw9Q=2BUxq+rxPjE3iSnrw@mail.gmail.com>
 <B622D2B5-D631-43F3-9D50-2B41681C78AB@goldelico.com>
 <CAMuHMdV5sjVg6BEm3zgvvsJDHJwKP1A8rh-sama8suCG5SYQyA@mail.gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Gert,

> Am 25.11.2021 um 08:58 schrieb Geert Uytterhoeven =
<geert@linux-m68k.org>:
>=20
> Hi Nikolaus,
>=20
> On Wed, Nov 24, 2021 at 5:31 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>> Am 24.11.2021 um 17:21 schrieb Geert Uytterhoeven =
<geert@linux-m68k.org>:
>>> On Wed, Nov 24, 2021 at 5:19 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>>> Am 23.11.2021 um 21:10 schrieb Paul Cercueil =
<paul@crapouillou.net>:
>>>>> Le mar., nov. 23 2021 at 19:13:59 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>>>> +    assigned-clock-rates =3D <48000000>, <0>, <54000000>, <0>, =
<27000000>;
>>>>>> };
>>>>>> &tcu {
>>>>>> @@ -509,6 +534,19 @@ pins_i2c4: i2c4 {
>>>>>>            bias-disable;
>>>>>>    };
>>>>>> +    pins_hdmi_ddc: hdmi_ddc {
>>>>>> +            function =3D "hdmi-ddc";
>>>>>> +            groups =3D "hdmi-ddc";
>>>>>> +            bias-disable;
>>>>>> +    };
>>>>>> +
>>>>>> +    /* switch to PF25 as gpio driving DDC_SDA low */
>>>>>> +    pins_hdmi_ddc_unwedge: hdmi_ddc {
>>>>>> +            function =3D "hdmi-ddc";
>>>>>> +            groups =3D "hdmi-ddc";
>>>>>> +            bias-disable;
>>>>>> +    };
>>>>>=20
>>>>> Your pins_hdmi_ddc and pins_hdmi_ddc_unwedge are the exact same? =
You could just use the former and pass it to both pinctrl-0 and =
pinctrl-1.
>>>>=20
>>>> This was forgotten to remove. We do not make use of the unwedge =
feature because I could not find out how to use pinctrl to switch this =
to gpio25 and drive it low.
>>>=20
>>> Using gpio-hog?
>>=20
>> well, AFAIR it activates the gpio permanently and is a propery of the =
gpio controller and not of pinmux.
>=20
> Yes, hogs are permanently (ignoring DT overlay tricks).
>=20
>> The driver assumes it can use pinmux state switching to drive the =
DDC_SDA line low on demand.
>=20
> Add an optional wedge-gpios property for switching?

That would touch the synopsys driver core and does not appear to be =
required for jz4780 operation.
We just add a separate driver specialisation for some parameters and set =
up the device tree.

So it is beyond the scope of our work (neither needed, nor can we test =
it).
If you want to add that, please go ahead.

BR and thanks,
Nikolaus

