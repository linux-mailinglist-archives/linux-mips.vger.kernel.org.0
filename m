Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3891A17223A
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 16:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgB0P1K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 10:27:10 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:16051 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbgB0P1K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 10:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582817227;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bAd1P0HjpFgcq6KsUCB5hFZ1I7O7iOETD2tSpW+p9YI=;
        b=M2CKpjb2day0QN23APkgSSOEl9reY8K+nTlrFhsHLvwrjc0FP3+SKQ/fAKYiAJ5l22
        15B8431Pzcco/nlX0DJBp68m7slGb13g0Ivw0Gy547z4ZCbnV19fDqlMAbjMMXxlqTax
        nFcqX9Z6clEmTnJKw/+TKCKb/eID1qVCLGPHsTkEMxgRbvw4Tq/OfjDntnQ9o+jbPW9z
        cll6pUnkMecs8CQ4xkjvwCW7Ct18UOoUxtGgR2s/n6n08RKTStSwe1gNX8vFNZRx2XmX
        zxrLgmYl6yjAxuvVB2/tjPfs86n5IgcRMh33u5QhLhnuMNuEAf7jTVOVUsrGWzEjFwv1
        Sy8Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMhw47o15Y="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1RFQqBuJ
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 27 Feb 2020 16:26:52 +0100 (CET)
Subject: Re: [PATCH v6 5/6] MIPS: DTS: JZ4780: define node for JZ4780 efuse
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1582815472.3.4@crapouillou.net>
Date:   Thu, 27 Feb 2020 16:26:51 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <8CEAF117-8667-4616-B08D-211E2705B67B@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com> <c6177ff663b6f8e16dc41169a76ba5dac091e7bd.1582715761.git.hns@goldelico.com> <1582815472.3.4@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 27.02.2020 um 15:57 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le mer., f=E9vr. 26, 2020 at 12:16, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> This patch brings support for the JZ4780 efuse. Currently it only =
exposes
>> a read only access to the entire 8K bits efuse memory and the
>> ethernet mac address for the davicom dm9000 chip on the CI20 board.
>> It also changes the nemc reg range to avoid overlap.
>> Tested-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: PrasannaKumar Muralidharan =
<prasannatsmkumar@gmail.com>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> arch/mips/boot/dts/ingenic/jz4780.dtsi | 17 ++++++++++++++++-
>> 1 file changed, 16 insertions(+), 1 deletion(-)
>> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi =
b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> index f928329b034b..1e266be28096 100644
>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> @@ -358,7 +358,7 @@
>> 	nemc: nemc@13410000 {
>> 		compatible =3D "ingenic,jz4780-nemc";
>> -		reg =3D <0x13410000 0x10000>;
>> +		reg =3D <0x13410000 0x4c>;
>=20
> This is wrong, the real size of the register area is 1x15c.

It should not overlap with the efuse reg range which is:

<0x134100d0 0x2c>

If I look at JZ4780 Mobile Application Processor Programming Manual
section 16.4.1 Register Description Table 16-4 Static Memory Interface =
Registers,
I see

SMCR1 at 0x13410014 and
SACR6 at 0x13410048 and all 32 bits wide. I.e. a total size of 0x4c.

Ah, now I see. There is also Table 16-5 NAND Flash Interface Registers
starting with NFCSR at 0x13410050 and ending with TGHH register at =
0x13410154.

Hm. With this we are probably at "go back and start over"...

Either nemc must be separated into two drivers for Static Memory and one
for NAND Flash. Or must become able to handle two register ranges.

Or the e-fuse driver must become a part of the nemc driver.

Well, another assumption is that there is no NAND driver. AFAIR it
was even removed from the kernel because the maintainer did say
it is not fixable (if I really remember correctly).

>=20
>> 		#address-cells =3D <2>;
>> 		#size-cells =3D <1>;
>> 		ranges =3D <1 0 0x1b000000 0x1000000
>> @@ -373,6 +373,21 @@
>> 		status =3D "disabled";
>> 	};
>> +	efuse: efuse@134100d0 {
>> +		compatible =3D "ingenic,jz4780-efuse";
>> +		reg =3D <0x134100d0 0x2c>;
>> +
>> +		clocks =3D <&cgu JZ4780_CLK_AHB2>;
>> +		clock-names =3D "ahb2";
>=20
> As explained in my response to the other patch, 'clock-names' can go =
away.

Yes.

BR,
Nikolaus

