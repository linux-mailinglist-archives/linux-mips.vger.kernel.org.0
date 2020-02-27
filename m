Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 993B417225F
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 16:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgB0Pjl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 10:39:41 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:50486 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgB0Pjl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 10:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1582817978; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3eSJUdHUOebLRYmbf4KgJLlfHEkgSJDeAo7KzMcKMN0=;
        b=TGKvqL+3KLRGn2YYCLBOUiPc2R6eNx4XAagPUwJ7ukLTCUDLBjuh1L3mLfljBk0IT5XjtE
        EKHapTe+v/XgnwKQ2lIxeIjjnLCQnWnp00yUjSs18GUA4ITcKp9ojUSXlVdV2/RNT2kMFV
        OwIw7HUCZsyMTtXTnEqaJR9w3Cmkor8=
Date:   Thu, 27 Feb 2020 12:39:14 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v6 5/6] MIPS: DTS: JZ4780: define node for JZ4780 efuse
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1582817954.3.5@crapouillou.net>
In-Reply-To: <8CEAF117-8667-4616-B08D-211E2705B67B@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com>
        <c6177ff663b6f8e16dc41169a76ba5dac091e7bd.1582715761.git.hns@goldelico.com>
        <1582815472.3.4@crapouillou.net>
        <8CEAF117-8667-4616-B08D-211E2705B67B@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le jeu., f=E9vr. 27, 2020 at 16:26, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 27.02.2020 um 15:57 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>=20
>>  Le mer., f=E9vr. 26, 2020 at 12:16, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>>  This patch brings support for the JZ4780 efuse. Currently it only=20
>>> exposes
>>>  a read only access to the entire 8K bits efuse memory and the
>>>  ethernet mac address for the davicom dm9000 chip on the CI20 board.
>>>  It also changes the nemc reg range to avoid overlap.
>>>  Tested-by: Mathieu Malaterre <malat@debian.org>
>>>  Signed-off-by: PrasannaKumar Muralidharan=20
>>> <prasannatsmkumar@gmail.com>
>>>  Signed-off-by: Mathieu Malaterre <malat@debian.org>
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 ++++++++++++++++-
>>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>>  diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi=20
>>> b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>  index f928329b034b..1e266be28096 100644
>>>  --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>  +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>>>  @@ -358,7 +358,7 @@
>>>  	nemc: nemc@13410000 {
>>>  		compatible =3D "ingenic,jz4780-nemc";
>>>  -		reg =3D <0x13410000 0x10000>;
>>>  +		reg =3D <0x13410000 0x4c>;
>>=20
>>  This is wrong, the real size of the register area is 1x15c.
>=20
> It should not overlap with the efuse reg range which is:
>=20
> <0x134100d0 0x2c>
>=20
> If I look at JZ4780 Mobile Application Processor Programming Manual
> section 16.4.1 Register Description Table 16-4 Static Memory=20
> Interface Registers,
> I see
>=20
> SMCR1 at 0x13410014 and
> SACR6 at 0x13410048 and all 32 bits wide. I.e. a total size of 0x4c.
>=20
> Ah, now I see. There is also Table 16-5 NAND Flash Interface Registers
> starting with NFCSR at 0x13410050 and ending with TGHH register at=20
> 0x13410154.
>=20
> Hm. With this we are probably at "go back and start over"...
>=20
> Either nemc must be separated into two drivers for Static Memory and=20
> one
> for NAND Flash. Or must become able to handle two register ranges.
>=20
> Or the e-fuse driver must become a part of the nemc driver.

Nothing that bad. I'll make the NEMC driver request only the area it=20
needs, out of the 0x10000 register space.

Then, you can move the efuse node *inside* the nemc node (with proper=20
#address-cells/#size-cells/ranges and "simple-mfd" compatible string)=20
and everything will work.

> Well, another assumption is that there is no NAND driver. AFAIR it
> was even removed from the kernel because the maintainer did say
> it is not fixable (if I really remember correctly).

It's still there:
drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c

What was dropped from the kernel is MLC NAND support in UBI.

Cheers,
-Paul

>>=20
>>>  		#address-cells =3D <2>;
>>>  		#size-cells =3D <1>;
>>>  		ranges =3D <1 0 0x1b000000 0x1000000
>>>  @@ -373,6 +373,21 @@
>>>  		status =3D "disabled";
>>>  	};
>>>  +	efuse: efuse@134100d0 {
>>>  +		compatible =3D "ingenic,jz4780-efuse";
>>>  +		reg =3D <0x134100d0 0x2c>;
>>>  +
>>>  +		clocks =3D <&cgu JZ4780_CLK_AHB2>;
>>>  +		clock-names =3D "ahb2";
>>=20
>>  As explained in my response to the other patch, 'clock-names' can=20
>> go away.
>=20
> Yes.
>=20
> BR,
> Nikolaus
>=20

=

