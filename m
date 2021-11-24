Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4026145C9ED
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 17:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348630AbhKXQ1n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 11:27:43 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:34094 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348560AbhKXQ1m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 11:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637771012;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=WkeyxDnipm2IfCekZmCiKiqZRWn6Vu+Xvk0lvgOQOOQ=;
    b=hy6ONITjwRwVgJTLrrZp34JxqWMaA09oCd9b7IkvSXvUktenVsJ3wKZBIMnqPSrBmg
    HcXbOQRrcMegCsdY1PznzlE/hW9KH5FySessqqDSytYraMlMOVFK16NH4+qzjI7CzL7O
    ohraAk5wSvwNbmZRO1IPYCgOE0ecZbjOusqtcM2CJa35pdnNQZhc6bB5F0f8OGh792j7
    9qzJqsHv/rtwvg3WLjSkDRDa2Gw9jvh5oeakSsG70woZaurWej1AjP2FYLeglE5c75Gp
    FyPRzRVOpTcJW60Bx2LXWgXJr4ykpidVMO1nX2OnEWiXNzz2BZulUYyJE6NC6V7eCA/G
    Sj4w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
    with ESMTPSA id e05ed8xAOGNV3mf
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 24 Nov 2021 17:23:31 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1637722761.010276.888168.nullmailer@robh.at.kernel.org>
Date:   Wed, 24 Nov 2021 17:23:30 +0100
Cc:     linux-mips <linux-mips@vger.kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        letux-kernel@openphoenux.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kees Cook <keescook@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Harry Wentland <harry.wentland@amd.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <08D49974-2C22-404C-913C-11EB1C53A96A@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
 <1637722761.010276.888168.nullmailer@robh.at.kernel.org>
To:     Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> Am 24.11.2021 um 03:59 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Tue, 23 Nov 2021 19:13:56 +0100, H. Nikolaus Schaller wrote:
>> From: Sam Ravnborg <sam@ravnborg.org>
>>=20
>> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>> Based on .txt binding from Zubair Lutfullah Kakakhel
>>=20
>> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
>>=20
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 =
+++++++++++++++++++
>> .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>> 2 files changed, 79 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
>>=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m =
dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
> =
./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l:36:5: [warning] wrong indentation: expected 2 but found 4 =
(indentation)

ok, fixed.

>=20
> dtschema/dtc warnings/errors:
> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/bridge/ingenic,jz4780-hdmi.yaml: 'unevaluatedPropertes' is not one of =
['$id', '$schema', 'title', 'description', 'examples',

ah, that is a typo (missing i in ...ties).

> 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', =
'additionalProperties', 'dependencies', 'dependentRequired', =
'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', =
'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/bridge/ingenic,jz4780-hdmi.yaml: 'oneOf' conditional failed, one must =
be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: A schema with a "$ref" to another schema either can define =
all properties used and use "additionalProperties" or can use =
"unevaluatedProperties"
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> Unknown file referenced: [Errno 2] No such file or directory: =
'/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/syn=
opsys,dw-hdmi.yaml'
> xargs: dt-doc-validate: exited with status 255; aborting
> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/bridge/ingenic,jz4780-hdmi.yaml: ignoring, error in schema:=20
> warning: no schema found in file: =
./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l
> =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.examp=
le.dts:19:18: fatal error: dt-bindings/clock/jz4780-cgu.h: No such file =
or directory
>   19 |         #include <dt-bindings/clock/jz4780-cgu.h>
>      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:373: =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.examp=
le.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1413: dt_binding_check] Error 2
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/patch/1558736
>=20
> This check can fail if there are any dependencies. The base for a =
patch
> series is generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up =
to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.
>=20

