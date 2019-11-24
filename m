Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D42F10846D
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2019 18:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfKXR7X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Nov 2019 12:59:23 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:13949 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbfKXR7X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 Nov 2019 12:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574618358;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4Mtvhb9VEGOidBuJ+//uKm9nDMQCGArvHFXBCr1aqTg=;
        b=cacKqSscy/SDcpWMhbpC2iHiXKLWbGnsbKxz7Db58VYLhExeVAfVsUTkpDVx1yqe7G
        SqBLDplCfX6X3M1XjpcTEUHk0wKvsB54owNAUZs8eDBxwhaVb0FH98N2O+9rBhc5PUls
        KLHgfP4Ea6s0zQRAHfTCs+exLC03Sy6MkzNWmEVKQkta7g20fuFnCN6jBeoQM2KZMGla
        TeljN5VREAdTgJxaSOng25srljyXt5vHcJBu3Uiz/eodlopYLwJViOxt0E3A+gksj3wh
        EE4jXZh6HHWFAg7cKencCdX4V/99u5GBDb67uC1ErAm0x/Y4b+FLsmAuS6ayHQb7IOQ1
        JG/g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA4NgJM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAOHx8wih
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sun, 24 Nov 2019 18:59:08 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 8/8] MIPS: DTS: jz4780: add sgx gpu node
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191124174837.GX35479@atomide.com>
Date:   Sun, 24 Nov 2019 18:59:07 +0100
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FA810F13-BF2A-4849-9BAA-01FA2F768976@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com> <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com> <1574600246.3.0@crapouillou.net> <20191124174837.GX35479@atomide.com>
To:     Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul, Tony,

> Am 24.11.2019 um 18:48 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Paul Cercueil <paul@crapouillou.net> [191124 12:58]:
>> Le dim., nov. 24, 2019 at 12:40, H. Nikolaus Schaller =
<hns@goldelico.com> a
>> =C3=A9crit :
>>> and add interrupt and clocks.
> ...
>>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>> @@ -46,6 +46,17 @@
>>> 		#clock-cells =3D <1>;
>>> 	};
>>>=20
>>> +	gpu: gpu@13040000 {
>>=20
>> We try to keep the nodes ordered by address, could you move this node =
where
>> it belongs?
> ...

Yes, I have noted.

>=20
>>> +		compatible =3D "ingenic,jz4780-sgx540-120", =
"img,sgx540-120",
>>> "img,sgx540", "img,sgx5";
>>> +		reg =3D <0x13040000 0x4000>;
>>> +
>>> +		clocks =3D <&cgu JZ4780_CLK_GPU>;
>>> +		clock-names =3D "gpu";
>=20
> Just checking.. Is there something else to configure here
> potentially in addition to the clocks?

It doesn't look so. Unfortuantely there isn't much information
except a v3.18 kernel supported by the vendor and that one also
just has a gpu node with clock control.

> That is, do we need to do some interconnect specific
> configuration etc in addition to the clocks to have
> runtime PM work for enabling and disabling sgx on
> jz4780?

I think we have to leave that open for further study.

BR,
Nikolaus

