Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419BB1BB851
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 10:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgD1IAZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 04:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgD1IAZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Apr 2020 04:00:25 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106A6C03C1A9;
        Tue, 28 Apr 2020 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1588060821;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=K6NDm2J1xaVXm6jF6KgArlrb/oodSBZNUiS/2yF1Wro=;
        b=Wh7ByIbW7f0sKZSoIKSed2lAfEjXzMQouYRdNkXbygYgMNJW5c5g6xGPV1ZHgIwILH
        OhjSJJjex6iKMOTUAMT9UfryNBwHpp52M3R7s16P60OVSxUpD6/oS3X6UJTmQuVbhDe/
        mob28NottWUtO+3oweK66bOpb21Z/tMNs3I3q/nLpnZRe9mF2n36UaQA3gkPyT9Ozb7b
        J0eUdaZQCdRTzElVcuhJkG4Rtqm4YZ/9rKhqvfzcfjNAmPEMHlPObVPVbDAomkHTC6nA
        /PwWQn55jbOLaNvD14dP1t5ZnlmcabOVprph9UJTaaBgkpvXFDsYL+HwfxCcrAF9OedG
        wtIQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PuwDas9g=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3S7xnNsG
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 28 Apr 2020 09:59:49 +0200 (CEST)
Subject: Re: [PATCH v7 06/12] ARM: DTS: omap4: add sgx gpu child node
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DOBE9Q.00IRKFIW0JMG@crapouillou.net>
Date:   Tue, 28 Apr 2020 09:59:22 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <98FA6E7D-0DC7-4C70-A228-038BB9799290@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <5f493a50fedef45c3cacd91cbf999092d9c05164.1587760454.git.hns@goldelico.com> <DOBE9Q.00IRKFIW0JMG@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 26.04.2020 um 14:50 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le ven. 24 avril 2020 =E0 22:34, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> Add SGX GPU node with interrupt. Tested on PandaBoard ES.
>> Since omap4420/30/60 and omap4470 come with different SGX variants
>> we need to introduce a new omap4470.dtsi. If an omap4470 board
>> does not want to use SGX it is no problem to still include
>> omap4460.dtsi.
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/arm/boot/dts/omap4.dtsi   | 11 ++++++-----
>> arch/arm/boot/dts/omap4470.dts | 15 +++++++++++++++
>> 2 files changed, 21 insertions(+), 5 deletions(-)
>> create mode 100644 arch/arm/boot/dts/omap4470.dts
>> diff --git a/arch/arm/boot/dts/omap4.dtsi =
b/arch/arm/boot/dts/omap4.dtsi
>> index 763bdea8c829..15ff3d7146af 100644
>> --- a/arch/arm/boot/dts/omap4.dtsi
>> +++ b/arch/arm/boot/dts/omap4.dtsi
>> @@ -389,7 +389,7 @@ abb_iva: regulator-abb-iva {
>> 			status =3D "disabled";
>> 		};
>> -		target-module@56000000 {
>> +		sgx_module: target-module@56000000 {
>> 			compatible =3D "ti,sysc-omap4", "ti,sysc";
>> 			reg =3D <0x5600fe00 0x4>,
>> 			      <0x5600fe10 0x4>;
>> @@ -408,10 +408,11 @@ target-module@56000000 {
>> 			#size-cells =3D <1>;
>> 			ranges =3D <0 0x56000000 0x2000000>;
>> -			/*
>> -			 * Closed source PowerVR driver, no child device
>> -			 * binding or driver in mainline
>> -			 */
>> +			gpu: gpu@0 {
>> +				compatible =3D "ti,omap4-sgx540-120", =
"img,sgx540-120", "img,sgx540";
>> +				reg =3D <0x0 0x2000000>;	/* 32MB =
*/
>> +				interrupts =3D <GIC_SPI 21 =
IRQ_TYPE_LEVEL_HIGH>;
>> +			};
>> 		};
>> 		/*
>> diff --git a/arch/arm/boot/dts/omap4470.dts =
b/arch/arm/boot/dts/omap4470.dts
>> new file mode 100644
>> index 000000000000..f29c581300bf
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/omap4470.dts

^^^ there is also a missing "i" in the file name

>> @@ -0,0 +1,15 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Device Tree Source for OMAP4470 SoC
>> + *
>> + * Copyright (C) 2012 Texas Instruments Incorporated - =
http://www.ti.com/
>> + *
>> + * This file is licensed under the terms of the GNU General Public =
License
>> + * version 2.  This program is licensed "as is" without any warranty =
of any
>> + * kind, whether express or implied.
>> + */
>> +#include "omap4460.dtsi"
>> +
>> +&sgx {
>=20
> Does this even compile?

Good question.

So far there is no well known eval board in mainline that #includes this =
.dtsi (because it is new) and therefore it passes any compile tests.

  DTC     arch/arm/boot/dts/omap4470-test.dtb - due to target missing
Error: arch/arm/boot/dts/omap4470.dtsi:13.1-5 Label or path sgx not =
found

I have now added a dummy board (not to be mainlined) for my own compile =
test...

>=20
> The node's handle is named sgx_module, not sgx.

Indeed. A fix is queued for v8.

BR and thanks,
Nikolaus

