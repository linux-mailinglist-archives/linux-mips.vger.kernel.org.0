Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D324E1ADD34
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 14:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgDQMQO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 08:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728532AbgDQMQM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 08:16:12 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A30BC061A0C;
        Fri, 17 Apr 2020 05:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587125769;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rWgceOhSWa758bgT+X6qKMY760KerwI9IfGOuR55b2U=;
        b=CL0GwOmCMNCuvCM0Y6VO/knP3Fi6R5W0w3hhsct5AJOBBjzpwDCZpNzWxxq0e8K02Z
        e8dwH6AER/jpCp8ipvc3iIKBOfGtAsNthWLQ+JNOtRLFbdDZaMRo7NCCh9GWFc1tmBu5
        rrbdKtJyb/Kfyf9DAyLGnvj9LD7MFXP3JT3F0fNdoWrXqVFBJ37fMUZVq1COmh6q+6UI
        cNb21uGOt/NBc+XALSvlxhu2suPjYIpiC21rkdW97STaBpAmtGvoleo0E4Kz/wOjtixR
        ssZI1TbWkG94isZNysOslXOzi/rHjYwKsn9/HC0T+N9O3N21wQGRDdu1WG+Rm9GTMUC6
        boUQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PgwDWjbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.5.0 DYNA|AUTH)
        with ESMTPSA id g06d2dw3HCFa1c0
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 17 Apr 2020 14:15:36 +0200 (CEST)
Subject: Re: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Fri, 17 Apr 2020 14:15:36 +0200
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
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
        <linux-samsung-soc@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D44C023E-C8B3-4974-B800-1DBEC7B4F82C@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com> <CAJKOXPcb9KWNAem-CAx_zCS+sZoEHYc0J8x0nk1xjY9hD4-M4w@mail.gmail.com> <AB9B8741-CFF7-414D-9489-D381B539538D@goldelico.com> <BN6PR04MB0660640B15550F75C8CCD4DEA3DB0@BN6PR04MB0660.namprd04.prod.outlook.com>
To:     Jonathan Bakker <xc-racer2@live.ca>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jonathan,

> Am 15.04.2020 um 20:17 schrieb Jonathan Bakker <xc-racer2@live.ca>:
>=20
> Hi Nikolaus,
>=20
> On 2020-04-15 5:50 a.m., H. Nikolaus Schaller wrote:
>>=20
>>> Am 15.04.2020 um 13:49 schrieb Krzysztof Kozlowski =
<krzk@kernel.org>:
>>>=20
>>> On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>>=20
>>>> From: Jonathan Bakker <xc-racer2@live.ca>
>>>>=20
>>>> to add support for SGX540 GPU.
>>>=20
>>> Do not continue the subject in commit msg like it is one sentence.
>>> These are two separate sentences, so commit msg starts with capital
>>> letter and it is sentence by itself.
>>>=20
>=20
> Sorry, that's my fault, I should know better.

Mine as well...

>=20
> Nikolaus took this from my testing tree and I apparently didn't have =
it in
> as good as state as I should have.
>=20
>>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> ---
>>>> arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
>>>> 1 file changed, 15 insertions(+)
>>>>=20
>>>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi =
b/arch/arm/boot/dts/s5pv210.dtsi
>>>> index 2ad642f51fd9..e7fc709c0cca 100644
>>>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>>>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>>>> @@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
>>>>                       #interrupt-cells =3D <1>;
>>>>               };
>>>>=20
>>>> +               g3d: g3d@f3000000 {
>>>> +                       compatible =3D =
"samsung,s5pv210-sgx540-120";
>>>> +                       reg =3D <0xf3000000 0x10000>;
>>>> +                       interrupt-parent =3D <&vic2>;
>>>> +                       interrupts =3D <10>;
>>>> +                       clock-names =3D "sclk";
>>>> +                       clocks =3D <&clocks CLK_G3D>;
>>>=20
>>> Not part of bindings, please remove or add to the bindings.
>>=20
>> Well, the bindings should describe what is common for all SoC
>> and they are quite different in what they need in addition.
>>=20
>> Thererfore we have no "additionalProperties: false" in the
>> bindings [PATCH v6 01/12].
>>=20
>>>=20
>>>> +
>>>> +                       power-domains =3D <&pd S5PV210_PD_G3D>;
>>>=20
>>> Ditto
>>=20
>> In this case it might be possible to add the clock/power-domains
>> etc. to a wrapper node compatible to "simple-pm-bus" or similar
>> and make the gpu a child of it.
>>=20
>> @Jontahan: can you please give it a try?
>>=20
>>=20
>=20
> The power-domains comes from a (so far) non-upstreamed power domain =
driver
> for s5pv210 that I've been playing around with.  It's not necessary =
for proper
> operation as it's on by default.
>=20
> Looking at simple-pm-bus, I don't really understand its purpose.  Is =
it a way of separating
> out a power domain from a main device's node?  Or is it designed for =
when you have multiple
> devices under the same power domain?
>=20
> Nikolaus, I can regenerate a proper patch for you if you want that's =
not based on my testing tree.

Yes, please.

>=20
>>>=20
>>>> +
>>>> +                       assigned-clocks =3D <&clocks MOUT_G3D>, =
<&clocks DOUT_G3D>;
>>>> +                       assigned-clock-rates =3D <0>, <66700000>;
>>>> +                       assigned-clock-parents =3D <&clocks =
MOUT_MPLL>;
>>>=20
>>> Probably this should have status disabled because you do not set
>>> regulator supply.
>=20
> I don't believe there is a regulator on s5pv210, if there is, then it =
is a
> fixed regulator with no control on both s5pv210 devices that I have.
>=20
> The vendor driver did use the regulator framework for its power domain
> implementation, but that definitely shouldn't be upstreamed.

Ok, this means there is no need for regulators in the bindings.

BR,
Nikolaus

