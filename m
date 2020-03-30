Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABE5198149
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 18:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbgC3QdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 12:33:20 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:15212 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbgC3QdU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Mar 2020 12:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585585998;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=m5OQurJ34G52si3xIHL2HoNqFTlRdT/1c2JFQwVStnA=;
        b=sevkwHAFC4Ku8T1/SpAy6r9w/mgj+9cMf79C4S7fF5p3ftt94frkFzwZZVRXXC4IyV
        x9vhs8r6njYIIcOJmA9iyPDeF9SujHi8UmeFibidIAGmYkcWpDngfWP71hkEwU/PpQIa
        QJp3nJyfoP9vamSPRVe6B8IPSzHowitCS/+cLu6DIzLdwwH7XHQuFtMhbdgm+1grWUUd
        2631FiAqiXfhDGl+wf4pYYu+7undCxQ3rMJ/DLhrLhZHr+iMsHTjVj3xMrBYIGI9PtGO
        Dw7jxmt59OV6QE+b31BPyPZMXkbe66+XtQC6nIo0VqWen1u5ozqU3lV4oZaNH5Ezy4Oc
        r1Ew==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw43oE44="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2UGXBGiV
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 30 Mar 2020 18:33:11 +0200 (CEST)
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic,lcd.txt to ingenic,lcd.yaml
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200330154202.GA23233@bogus>
Date:   Mon, 30 Mar 2020 18:33:10 +0200
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Rob Herring <robh@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <02E5EC5D-1FBB-45E4-907E-10450B449726@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com> <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com> <20200330154202.GA23233@bogus>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 30.03.2020 um 17:42 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Sun, 29 Mar 2020 19:35:47 +0200, "H. Nikolaus Schaller" wrote:
>> and add compatible: jz4780-lcd, including an example how to
>> configure both lcd controllers.
>>=20
>> Also fix the clock names and examples.
>>=20
>> Based on work by Paul Cercueil <paul@crapouillou.net> and
>> Sam Ravnborg <sam@ravnborg.org>
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/display/ingenic,lcd.txt          |  45 ------
>> .../bindings/display/ingenic,lcd.yaml         | 128 =
++++++++++++++++++
>> 2 files changed, 128 insertions(+), 45 deletions(-)
>> delete mode 100644 =
Documentation/devicetree/bindings/display/ingenic,lcd.txt
>> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic,lcd.yaml
>>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/ingenic,lcd.example.dt.yaml: lcd-controller@13050000: clocks: =
[[4294967295, 9]] is too short
>=20
> See https://patchwork.ozlabs.org/patch/1263508

If I read the message correctly, I think there should be 2 clocks =
specified in
the jz4725b-lcd example and not just

	clocks =3D <&cgu JZ4725B_CLK_LCD>;

Unfortunately the jz4725b.dtsi does not seem to be upstream or in =
linux-next so
I don't know if it works without lcd_pclk or not.

If there is really just one clock, we need to modify the clocks and =
clock-names
schema and add minItems: 1 and maxItems: 2 to allow for this =
flexibility.

Otherwise we have to fix the example. Do you have some git with an =
up-to-date
jz4725b.dtsi to look at?

>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>=20
> pip3 install =
git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

+++ :)

>=20
> Please check and re-submit.

Sure, since it is a RFC.

BR and thanks,
Nikolaus

