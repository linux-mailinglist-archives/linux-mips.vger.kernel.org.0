Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB315447316
	for <lists+linux-mips@lfdr.de>; Sun,  7 Nov 2021 14:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbhKGNqh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Nov 2021 08:46:37 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:35022 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhKGNqg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Nov 2021 08:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636292614;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=79hC0l2s6WO9Mv6jwtdx8V5lNoZ0vuIrVGBldC3amTE=;
    b=GpFLSPBJHHaKr/oD8UMsijKF9i/1KY40pfy/qputjd/4CkMo3vzuHDKmxbRlOdjyjK
    fYC4g+JgRj6qnrd43Xsq4OePQeMlSZ8pcBGxsUUfDXLOuMCjV/wwde7D/YU3fc1a2XXu
    BKRZDT4NVBvp/d6lLCNeZdsHJWQZwDzDwO54KKwcvknDtpRQOOmKV2B50xs5fr5pdaSE
    5yOunl6AAk+frFHe7J0is3har7yuDLvT4PAaNi26HhBpf9TyKdKyQ9jxpbzlK2iW4cac
    J9Ao298nyLGg2yFN/HvfphYEzMP5WyqY9ZMrh/0mmxfzKFU9k2DY3XfKqT7Q4q7Ta32j
    hzYQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id 902c63xA7DhXFoA
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Sun, 7 Nov 2021 14:43:33 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v5 3/7] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <8XUI0R.KDQ64KIMI9BU@crapouillou.net>
Date:   Sun, 7 Nov 2021 14:43:33 +0100
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
        Paul Boddie <paul@boddie.org.uk>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D45DF9B7-8175-43EE-9D55-DA131DCB4FA4@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
 <8XUI0R.KDQ64KIMI9BU@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

> Am 05.10.2021 um 22:43 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le mar., oct. 5 2021 at 14:29:15 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> From: Sam Ravnborg <sam@ravnborg.org>
>> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>> Based on .txt binding from Zubair Lutfullah Kakakhel
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic-jz4780-hdmi.yaml | 79 =
+++++++++++++++++++
>> 1 file changed, 79 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>> diff --git =
a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>> new file mode 100644
>> index 000000000000..5bcb342da86f
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
>> @@ -0,0 +1,79 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Ingenic JZ4780 HDMI Transmitter
>> +
>> +maintainers:
>> +  - H. Nikolaus Schaller <hns@goldelico.com>
>> +
>> +description: |
>> +  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys =
DesignWare HDMI 1.4
>> +  TX controller IP with accompanying PHY IP.
>=20
> My dmesg disagrees:
> dw-hdmi-ingenic 10180000.hdmi: Detected HDMI TX controller v1.31a with =
HDCP (DWC HDMI 3D TX PHY)

mine as well.

>=20
> Or am I comparing apples to oranges?

There is a document called "JZ4780 High Efficiency Engine for Mobile =
Device"
(JZ4780_PB.pdf) which says

"24-bit parallel/serial TFT interface, HDMI 1.4a interface, LVDS =
interface"

And the data sheet ("JZ4780 Mobile Application Processor Data Sheet ") =
says: "Support HDMI 1.4a Interface"

Finally, the programming manual also says "Support HDMI 1.4a Interface".

So what is correct?

dmesg may return something else. E.g. silicon revision 1.31a
while the interface is HDMI protocol revision 1.4a compatible?

Trying to find something about "hdmi 1.31a" did only lead to some
"Synopsys' HAPS-51 eval platform" [1].

Looking at HDMI standards [2] I can only find HDMI 1.3 and 1.3a but no =
HDMI 1.31a.

[1] =
https://www.digital-cp.com/hdcp-products/haps51-hdmi-tx-platform-dwc-hdmi-=
tx-controller-131a-ea-hdmi-3d-tx-phy-tsmc40g-ip
[2] https://en.wikipedia.org/wiki/HDMI#Version_1.3

Well it may also be some Synopsys-internal designation 1.31a referring =
so something
newer than HDMI 1.3a which became the HDMI 1.4 standard (released June =
2009)...

Whom should we believe? What the chip tells or what the data sheet and =
programming
manual says?

I tend to keep confusion low and stay with "HDMI 1.4" in the bindings =
because
there is no offical "HDMI 1.31a" standard. And HDMI 1.4 was already some =
years old
when the jz4780 was released. So it is likely that the chip =
identification just
returns 1.31a (maybe Ingenic licenced an interim release VHDL) although =
the standard
was later officially named 1.4a.

>=20
>> +
>> +allOf:
>> +  - $ref: bridge/synopsys,dw-hdmi.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: ingenic,jz4780-dw-hdmi
>> +
>> +  reg-io-width:
>> +    const: 4
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  hdmi-5v-supply:
>> +    description: Optional regulator to provide +5V at the connector
>> +
>> +  ddc-i2c-bus:
>> +    description: An I2C interface if the internal DDC I2C driver is =
not to be used
>=20
> This property is used within =
(drivers/gpu/drm/bridge/synopsys/dw-hdmi.c); I think it would make sense =
to move it to bridge/synopsys,dw-hdmi.yaml.

It is indeed more general and not jz4780 specific. I'll move it for v6.

BR and thanks,
Nikolaus

