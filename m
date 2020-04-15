Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDC11AA21E
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 14:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370446AbgDOMu4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 08:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370440AbgDOMux (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 08:50:53 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16CD6C061A0C;
        Wed, 15 Apr 2020 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586955050;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ZWPeQuNZym8qIi2cOZDzlHwaDAs+LcskJtN8sCgQ/rk=;
        b=gGbsDyohBd13qIMXzzowNNR9YtVfQZBRB6oeIhs3SNPyi9FVwYzbYeh1+AFY2NamuV
        QtyXfz2bviGYNw1Wg5cAPWSSsYdp2u+x2AwmbKZcNNMedXx7IoAaUOV7mfdHrbBdPRD2
        tZDao3W7Jpb08vKwlIVDi1KI4VG0ubRyXx11EwfWEXUbVlmXmmIlAYjMjB4ABMtDxop8
        u4JH3igeM6AMK/dJLiHta7bzLWfGMwTUVdeKCacvdxrxYeyD1KUeOprm4/Va4537vUnv
        aF73KY4sOIBFN9AM4JouZo+RQ8fzZQaMQ9PAmkXp2m1cJiEIOgFANtEAI+g72aR09rnW
        OV/Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3FCoV1xp
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 14:50:31 +0200 (CEST)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
Date:   Wed, 15 Apr 2020 14:50:31 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, openpvrsgx-devgroup@letux.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com> <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 15.04.2020 um 13:49 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
>>=20
>> From: Jonathan Bakker <xc-racer2@live.ca>
>>=20
>> to add support for SGX540 GPU.
>=20
> Do not continue the subject in commit msg like it is one sentence.
> These are two separate sentences, so commit msg starts with capital
> letter and it is sentence by itself.
>=20
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>> 1 file changed, 15 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi =
b/arch/arm/boot/dts/s5pv210.dtsi
>> index 2ad642f51fd9..e7fc709c0cca 100644
>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>>                        #interrupt-cells =3D <1>;
>>                };
>>=20
>> +               g3d: g3d@f3000000 {
>> +                       compatible =3D "samsung,s5pv210-sgx540-120";
>> +                       reg =3D <0xf3000000 0x10000>;
>> +                       interrupt-parent =3D <&vic2>;
>> +                       interrupts =3D <10>;
>> +                       clock-names =3D "sclk";
>> +                       clocks =3D <&clocks CLK_G3D>;
>=20
> Not part of bindings, please remove or add to the bindings.

Well, the bindings should describe what is common for all SoC
and they are quite different in what they need in addition.

Thererfore we have no "additionalProperties: false" in the
bindings [PATCH v6 01/12].

>=20
>> +
>> +                       power-domains =3D <&pd S5PV210_PD_G3D>;
>=20
> Ditto

In this case it might be possible to add the clock/power-domains
etc. to a wrapper node compatible to "simple-pm-bus" or similar
and make the gpu a child of it.

@Jontahan: can you please give it a try?


>=20
>> +
>> +                       assigned-clocks =3D <&clocks MOUT_G3D>, =
<&clocks DOUT_G3D>;
>> +                       assigned-clock-rates =3D <0>, <66700000>;
>> +                       assigned-clock-parents =3D <&clocks =
MOUT_MPLL>;
>=20
> Probably this should have status disabled because you do not set
> regulator supply.
>=20
> Best regards,
> Krzysztof

BR and thanks,
Nikolaus

