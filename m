Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA791BDC15
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 14:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgD2M1J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 08:27:09 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:35684 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgD2M1I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Apr 2020 08:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1588163225; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UB85kJRWkAnE/ldP2rd2WB1otm7LsPHBG/QdCMbeTtw=;
        b=Y7SJJo7sZnaAuNIPATy0AiHIaWVsd2iyJrs83ZKmUFLR4e0sPDVaCrXhPJh3FdwWeKj5+B
        ymuqI/fKXp9dnLKIal7QsfsqkUT5AoaSpooZL4M9yoymur1N6pMByU7yw/6mHtmHFpYRn4
        m+cKuE3cU7bSMeleVwTgsV9u39AqbSE=
Date:   Wed, 29 Apr 2020 14:26:46 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Message-Id: <MKUJ9Q.OQG3OJ6IYGUE3@crapouillou.net>
In-Reply-To: <BN6PR04MB0660044B5B1D45BE4CBCD2AAA3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
References: <cover.1587760454.git.hns@goldelico.com>
        <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
        <NYBE9Q.YH08US7A7DC3@crapouillou.net>
        <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
        <20200427154617.GA1798@pi3>
        <BN6PR04MB06605F014024061C894AFBA4A3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
        <BN6PR04MB0660044B5B1D45BE4CBCD2AAA3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jonathan,

Le mar. 28 avril 2020 =E0 15:58, Jonathan Bakker <xc-racer2@live.ca> a=20
=E9crit :
> Hi all,
>=20
> On 2020-04-28 2:39 p.m., Jonathan Bakker wrote:
>>  Hi Krzysztof,
>>=20
>>  On 2020-04-27 8:46 a.m., Krzysztof Kozlowski wrote:
>>>  On Sun, Apr 26, 2020 at 07:57:12AM -0700, Jonathan Bakker wrote:
>>>>  Hi Paul,
>>>>=20
>>>>  On 2020-04-26 5:56 a.m., Paul Cercueil wrote:
>>>>>=20
>>>>>=20
>>>>>  Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller=20
>>>>> <hns@goldelico.com> a =E9crit :
>>>>>>  From: Jonathan Bakker <xc-racer2@live.ca>
>>>>>>=20
>>>>>>  All s5pv210 devices have a PowerVR SGX 540 (revision 120)=20
>>>>>> attached.
>>>>>>=20
>>>>>>  There is no external regulator for it so it can be enabled by=20
>>>>>> default.
>>>>>>=20
>>>>>>  Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>>>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>>>  ---
>>>>>>   arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
>>>>>>   1 file changed, 13 insertions(+)
>>>>>>=20
>>>>>>  diff --git a/arch/arm/boot/dts/s5pv210.dtsi=20
>>>>>> b/arch/arm/boot/dts/s5pv210.dtsi
>>>>>>  index 2ad642f51fd9..abbdda205c1b 100644
>>>>>>  --- a/arch/arm/boot/dts/s5pv210.dtsi
>>>>>>  +++ b/arch/arm/boot/dts/s5pv210.dtsi
>>>>>>  @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
>>>>>>               #interrupt-cells =3D <1>;
>>>>>>           };
>>>>>>=20
>>>>>>  +        gpu: gpu@f3000000 {
>>>>>>  +            compatible =3D "samsung,s5pv210-sgx540-120";
>>>=20
>>>  This should not pass the bindings check because you missed last
>>>  compatibles.
>>>=20
>>=20
>>  Thanks for pointing that out, I'll add it and make sure it passes=20
>> the bindings check.
>>=20
>>>>>>  +            reg =3D <0xf3000000 0x10000>;
>>>>>>  +            interrupt-parent =3D <&vic2>;
>>>>>>  +            interrupts =3D <10>;
>>>>>>  +            clock-names =3D "core";
>>>>>>  +            clocks =3D <&clocks CLK_G3D>;
>>>>>>  +
>>>>>>  +            assigned-clocks =3D <&clocks MOUT_G3D>, <&clocks=20
>>>>>> DOUT_G3D>;
>>>>>>  +            assigned-clock-rates =3D <0>, <66700000>;
>>>>>>  +            assigned-clock-parents =3D <&clocks MOUT_MPLL>;
>>>>>=20
>>>>>  What are these clocks for, and why are they reparented /=20
>>>>> reclocked?
>>>>>=20
>>>>>  Shouldn't they be passed to 'clocks' as well?
>>>>>=20
>>>>>  -Paul
>>>>>=20
>>>>=20
>>>>  The G3D clock system can have multiple parents, and for stable=20
>>>> operation
>>>>  it's recommended to use the MPLL clock as the parent (which in=20
>>>> turn
>>>>  is actually a mux as well).  MOUT_G3D is simply the mux for=20
>>>> CLK_G3D
>>>>  (SGX core clock), DOUT_G3D is the divider.  DOUT_G3D could=20
>>>> equally be CLK_G3D
>>>>  (and probably should be, for readability) as CLK_G3D is simply=20
>>>> the gate and
>>>>  DOUT_G3D is the divider for it.
>>>=20
>>>  Good point, it should be CLK_G3D instead of DOUT.  Can you fix=20
>>> this as
>>>  well?
>>=20
>>  Yep, will do.  Nikolaus, I'll send you an updated patch to include.
>>=20
>=20
> How are assigned-clocks handled in the yaml DT schema?  When running=20
> make dtbs_check,
> I end up with messages such as
>=20
> arch/arm/boot/dts/s5pv210-aquila.dt.yaml: gpu@f3000000:=20
> 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks'=20
> do not match any of the regexes: 'pinctrl-[0-9]+'
>=20
> Do they need to explicitly be listed as valid entries?

The assigned-* can also be moved inside the node of the clocks=20
provider. I would say it makes more sense to have them there.

-Paul


