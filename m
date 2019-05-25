Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D98B12A6BF
	for <lists+linux-mips@lfdr.de>; Sat, 25 May 2019 21:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfEYTNb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 May 2019 15:13:31 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:48590 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfEYTNb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 May 2019 15:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558811606; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vnk800G1JVnIKGZ4wjv2ZwB3JURC8YSA1aiWxwD8qPY=;
        b=AH5if3JPmyCbQgwcfuJeUGYe6Pj4ZsMs3TLhc1G/Jx0jb4IMDepAHoFWjclTE168W2rvzu
        mSbk8Qdcc68fs/w9N8TkKHbSmp0licq6b0R55TSdQc+0Zbit4TVFzMBzqx2rwgRYjjggzj
        5Mwz2vff2kCChadmRWi0X2pm358VaP8=
Date:   Sat, 25 May 2019 21:13:16 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v12 03/13] dt-bindings: Add doc for the Ingenic TCU
 drivers
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mathieu Malaterre <malat@debian.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me
Message-Id: <1558811596.2016.1@crapouillou.net>
In-Reply-To: <20190524202103.GA15650@bogus>
References: <20190521145141.9813-1-paul@crapouillou.net>
        <20190521145141.9813-4-paul@crapouillou.net> <20190524202103.GA15650@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le ven. 24 mai 2019 =E0 22:21, Rob Herring <robh@kernel.org> a =E9crit :
> On Tue, May 21, 2019 at 04:51:31PM +0200, Paul Cercueil wrote:
>>  Add documentation about how to properly use the Ingenic TCU
>>  (Timer/Counter Unit) drivers from devicetree.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>=20
>>  Notes:
>>      v4: New patch in this series. Corresponds to V2 patches 3-4-5=20
>> with
>>       added content.
>>=20
>>      v5: - Edited PWM/watchdog DT bindings documentation to point to=20
>> the new
>>         document.
>>       - Moved main document to
>>         Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>       - Updated documentation to reflect the new devicetree bindings.
>>=20
>>      v6: - Removed PWM/watchdog documentation files as asked by=20
>> upstream
>>       - Removed doc about properties that should be implicit
>>       - Removed doc about ingenic,timer-channel /
>>         ingenic,clocksource-channel as they are gone
>>       - Fix WDT clock name in the binding doc
>>       - Fix lengths of register areas in watchdog/pwm nodes
>>=20
>>      v7: No change
>>=20
>>      v8: - Fix address of the PWM node
>>       - Added doc about system timer and clocksource children nodes
>>=20
>>      v9: - Remove doc about system timer and clocksource children
>>         nodes...
>>      - Add doc about ingenic,pwm-channels-mask property
>>=20
>>      v10: No change
>>=20
>>      v11: Fix info about default value of ingenic,pwm-channels-mask
>>=20
>>      v12: Drop sub-nodes for now; they will be introduced in a=20
>> follow-up
>>      	 patchset.
>=20
> Why? I believe I acked them.

The patchset was too big, and I've already been trying to get it=20
upstream for
more than one year now. So I cut it in half in hope that it'll be=20
easier to
upstream it that way.

>>=20
>>   .../devicetree/bindings/timer/ingenic,tcu.txt | 59=20
>> +++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt=20
>> b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>  new file mode 100644
>>  index 000000000000..d101cd72c9b0
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>>  @@ -0,0 +1,59 @@
>>  +Ingenic JZ47xx SoCs Timer/Counter Unit devicetree bindings
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +For a description of the TCU hardware and drivers, have a look at
>>  +Documentation/mips/ingenic-tcu.txt.
>>  +
>>  +Required properties:
>>  +
>>  +- compatible: Must be one of:
>>  +  * "ingenic,jz4740-tcu"
>>  +  * "ingenic,jz4725b-tcu"
>>  +  * "ingenic,jz4770-tcu"
>>  +- reg: Should be the offset/length value corresponding to the TCU=20
>> registers
>>  +- clocks: List of phandle & clock specifiers for clocks external=20
>> to the TCU.
>>  +  The "pclk", "rtc" and "ext" clocks should be provided. The "tcu"=20
>> clock
>>  +  should be provided if the SoC has it.
>>  +- clock-names: List of name strings for the external clocks.
>>  +- #clock-cells: Should be <1>;
>>  +  Clock consumers specify this argument to identify a clock. The=20
>> valid values
>>  +  may be found in <dt-bindings/clock/ingenic,tcu.h>.
>>  +- interrupt-controller : Identifies the node as an interrupt=20
>> controller
>>  +- #interrupt-cells : Specifies the number of cells needed to=20
>> encode an
>>  +  interrupt source. The value should be 1.
>>  +- interrupt-parent : phandle of the interrupt controller.
>=20
> Drop this 'interrupt-parent' is implied and could be in a parent node.
>=20
>>  +- interrupts : Specifies the interrupt the controller is connected=20
>> to.
>>  +
>>  +Optional properties:
>>  +
>>  +- ingenic,pwm-channels-mask: Bitmask of TCU channels reserved for=20
>> PWM use.
>>  +  Default value is 0xfc.
>>  +
>>  +
>>  +Example
>>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  +
>>  +#include <dt-bindings/clock/jz4770-cgu.h>
>>  +
>>  +/ {
>>  +	tcu: timer@10002000 {
>>  +		compatible =3D "ingenic,jz4770-tcu";
>>  +		reg =3D <0x10002000 0x1000>;
>>  +		#address-cells =3D <1>;
>>  +		#size-cells =3D <1>;
>>  +		ranges =3D <0x0 0x10002000 0x1000>;
>>  +
>>  +		#clock-cells =3D <1>;
>>  +
>>  +		clocks =3D <&cgu JZ4770_CLK_RTC
>>  +			  &cgu JZ4770_CLK_EXT
>>  +			  &cgu JZ4770_CLK_PCLK>;
>>  +		clock-names =3D "rtc", "ext", "pclk";
>>  +
>>  +		interrupt-controller;
>>  +		#interrupt-cells =3D <1>;
>>  +
>>  +		interrupt-parent =3D <&intc>;
>>  +		interrupts =3D <27 26 25>;
>>  +	};
>>  +};
>>  --
>>  2.21.0.593.g511ec345e18
>>=20

=

