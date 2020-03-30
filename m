Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3919B198213
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 19:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgC3RSO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 13:18:14 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:25552 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgC3RSO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Mar 2020 13:18:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585588692;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Lj0shjy1lwrth8NbjfDq3DhsDbd8+u+75vDycllxf+E=;
        b=sgT69fwJ8C/bZKHKOzgK/gzxC3F7tWKeemx9xLlc/JupZKC2pSqHMa0Seuvfj2HXmD
        zl/9kqNFk9XtFVijiFEMpmOv0YEUc+CP+L3Xs/+/BE+HrZCNnFC7MlMKwBT+kC+vmlG8
        Mit0VoxJhB9xqzkTY5htirF+d9jE0TF1LqCo3dTDS5w51VxwjLrXyGTDmVwPF72LUcCB
        D4QY6HYmYP8At8ArzaxeoMrJDufWwIw1oc01fQ0VQmuPocKHKozcsNsEui0xK9b0vy10
        kNGxVUxDhtxdRiSgU7zyggKKOk2DwBYYrkXbgfZyTSSOAe39XXLD+ceVnm3nsRNSubSH
        wK7A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw43oE44="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2UHI4GqH
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 30 Mar 2020 19:18:04 +0200 (CEST)
Subject: Re: [RFC v3 1/8] dt-bindings: display: convert ingenic,lcd.txt to ingenic,lcd.yaml
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9LN08Q.J1LY4QL3MG9B3@crapouillou.net>
Date:   Mon, 30 Mar 2020 19:18:03 +0200
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <559EE241-7725-4D2E-864E-AF7CB5356912@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com> <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com> <20200330154202.GA23233@bogus> <02E5EC5D-1FBB-45E4-907E-10450B449726@goldelico.com> <PGM08Q.HSFQKBTIA4ZJ1@crapouillou.net> <9F25715B-3C06-4302-9393-3440E9D54470@goldelico.com> <9LN08Q.J1LY4QL3MG9B3@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 30.03.2020 um 19:07 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>=20
>=20
> Le lun. 30 mars 2020 =E0 18:48, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>>> Am 30.03.2020 um 18:43 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi Nikolaus,
>>> Le lun. 30 mars 2020 =E0 18:33, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>>>> Hi Paul,
>>>>> Am 30.03.2020 um 17:42 schrieb Rob Herring <robh@kernel.org>:
>>>>> On Sun, 29 Mar 2020 19:35:47 +0200, "H. Nikolaus Schaller" wrote:
>>>>>> and add compatible: jz4780-lcd, including an example how to
>>>>>> configure both lcd controllers.
>>>>>> Also fix the clock names and examples.
>>>>>> Based on work by Paul Cercueil <paul@crapouillou.net> and
>>>>>> Sam Ravnborg <sam@ravnborg.org>
>>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>> Cc: devicetree@vger.kernel.org
>>>>>> ---
>>>>>> .../bindings/display/ingenic,lcd.txt          |  45 ------
>>>>>> .../bindings/display/ingenic,lcd.yaml         | 128 =
++++++++++++++++++
>>>>>> 2 files changed, 128 insertions(+), 45 deletions(-)
>>>>>> delete mode 100644 =
Documentation/devicetree/bindings/display/ingenic,lcd.txt
>>>>>> create mode 100644 =
Documentation/devicetree/bindings/display/ingenic,lcd.yaml
>>>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>>> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/ingenic,lcd.example.dt.yaml: lcd-controller@13050000: clocks: =
[[4294967295, 9]] is too short
>>>>> See https://patchwork.ozlabs.org/patch/1263508
>>>> If I read the message correctly, I think there should be 2 clocks =
specified in
>>>> the jz4725b-lcd example and not just
>>>> 	clocks =3D <&cgu JZ4725B_CLK_LCD>;
>>> You get this message because that's what the YAML says. There is =
only one clock on JZ4725B so the yaml should reflect that.
>> That was the missing piece of information that there is only one =
clock on the jz4780.
>> Anyways, is there some example? Does some jz4725b.dtsi exist =
somewhere?
>> It is difficult to write correct yaml for a device that is not =
upstream.
>=20
> =
https://github.com/OpenDingux/linux/blob/jz-5.5-rs90/arch/mips/boot/dts/in=
genic/jz4725b.dtsi#L331

Great!

Ah, it only requires the "lcd_pclk" (and not the "lcd" clock) which
means the original ingenic,lcd.txt wasn't perfect in this case either.

I'll queue it for the next RFC version.

So the next important thing for this series is that we find help for =
making
the CI20 HDMI work...

BR and thanks,
Nikolaus

>=20
> -Paul
>=20
>> Otherwise I'd propose to drop the jz4725b and use the jz4740 as =
example.
>> BR and thanks,
>> Nikolaus
>>> -Paul
>>>> Unfortunately the jz4725b.dtsi does not seem to be upstream or in =
linux-next so
>>>> I don't know if it works without lcd_pclk or not.
>>>> If there is really just one clock, we need to modify the clocks and =
clock-names
>>>> schema and add minItems: 1 and maxItems: 2 to allow for this =
flexibility.
>>>> Otherwise we have to fix the example. Do you have some git with an =
up-to-date
>>>> jz4725b.dtsi to look at?
>>>>> If you already ran 'make dt_binding_check' and didn't see the =
above
>>>>> error(s), then make sure dt-schema is up to date:
>>>>> pip3 install =
git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>>>> +++ :)
>>>>> Please check and re-submit.
>>>> Sure, since it is a RFC.
>>>> BR and thanks,
>>>> Nikolaus

