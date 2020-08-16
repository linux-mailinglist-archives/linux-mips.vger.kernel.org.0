Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B6924573D
	for <lists+linux-mips@lfdr.de>; Sun, 16 Aug 2020 13:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgHPLAD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Aug 2020 07:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727908AbgHPK7o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Aug 2020 06:59:44 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BDBC061786;
        Sun, 16 Aug 2020 03:59:41 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BTvM51Km6zKmfP;
        Sun, 16 Aug 2020 12:59:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id WxugPsrJDQWV; Sun, 16 Aug 2020 12:59:25 +0200 (CEST)
Subject: Re: [PATCH 2/3] MIPS: DTS: img: marduk: Add Cascoda CA8210 6LoWPAN
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, james.hartley@sondrel.com,
        rahulbedarkar89@gmail.com, wigyori@uid0.hu
References: <20200815163514.11631-1-hauke@hauke-m.de>
 <20200815163514.11631-2-hauke@hauke-m.de>
 <b6267d62-af3b-4d29-51b0-3a61d0fd2679@gmail.com>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Autocrypt: addr=hauke@hauke-m.de; keydata=
 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
Message-ID: <b094bf63-dd4e-e5e0-812c-957b1f11805a@hauke-m.de>
Date:   Sun, 16 Aug 2020 12:59:15 +0200
MIME-Version: 1.0
In-Reply-To: <b6267d62-af3b-4d29-51b0-3a61d0fd2679@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ZWgb9ILDE85drLwTdVnyrYdOmo56WL8QU"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.83 / 15.00 / 15.00
X-Rspamd-Queue-Id: 84C4F17F1
X-Rspamd-UID: 5ee452
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZWgb9ILDE85drLwTdVnyrYdOmo56WL8QU
Content-Type: multipart/mixed; boundary="JY7rZ1FhK7Z0YmxLtbHPbeeNO5Oysx1sa"

--JY7rZ1FhK7Z0YmxLtbHPbeeNO5Oysx1sa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/16/20 11:14 AM, Sergei Shtylyov wrote:
> Hello!

Thank you for the review Sergei.

> On 15.08.2020 19:35, Hauke Mehrtens wrote:
>=20
>> Add Cascoda CA8210 6LoWPAN controller to device tree.
>>
>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>> ---
>> =C2=A0 arch/mips/boot/dts/img/pistachio_marduk.dts | 22 ++++++++++++++=
+++++++
>> =C2=A0 1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts
>> b/arch/mips/boot/dts/img/pistachio_marduk.dts
>> index ea11a21b133b..633a41954cc0 100644
>> --- a/arch/mips/boot/dts/img/pistachio_marduk.dts
>> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
>> @@ -75,6 +75,28 @@
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VDD-supply =3D <&internal_dac_supply>;
>> =C2=A0 };
>> =C2=A0 +&spfi0 {
>> +=C2=A0=C2=A0=C2=A0 status =3D "okay";
>> +=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&spim0_pins>, <&spim0_cs0_alt_pin>,=

>> <&spim0_cs2_alt_pin>, <&spim0_cs3_alt_pin>, <&spim0_cs4_alt_pin>;
>> +=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default";
>> +
>> +=C2=A0=C2=A0=C2=A0 cs-gpios =3D <&gpio1 14 GPIO_ACTIVE_HIGH>, <&gpio0=
 2
>> GPIO_ACTIVE_HIGH>,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <&=
gpio1 12 GPIO_ACTIVE_HIGH>, <&gpio1 13 GPIO_ACTIVE_HIGH>;
>> +
>> +=C2=A0=C2=A0=C2=A0 ca8210: ca8210@0 {
>=20
> =C2=A0=C2=A0 The device nodes are supposed to have the generic names...=


I am not referencing this, so I can also remove it:
	ca8210@0 {

Otherwise, would this be ok:
	ieee802154: ca8210@0 {

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";

This status =3D "okay"; can be removed.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "cascoda,ca=
8210";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spi-max-frequency =3D <400=
0000>;
>=20
> =C2=A0=C2=A0 Only 4MHz?

The vendor device tree also use 4MHz:
https://github.com/CreatorDev/openwrt/blob/ci40/target/linux/pistachio/dt=
s/pistachio/pistachio_marduk.dts#L34

The device tree binding says "Maximum clock speed, should be *less than*
4000000", it could even make sense to switch this to 3MHz.
https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ieee8021=
54/ca8210.txt

I do not have the datasheet for the cascoda,ca8210.

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spi-cpol;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-gpio =3D <&gpio0 12 =
GPIO_ACTIVE_HIGH>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq-gpio =3D <&gpio2 12 GP=
IO_ACTIVE_HIGH>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extclock-enable;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extclock-freq =3D <1600000=
0>;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extclock-gpio =3D <2>;
>=20
> =C2=A0=C2=A0 Hm, strange spec for a GPIO prop, shouldn't they all be al=
ike?

I am also getting this compile warning:
arch/mips/boot/dts/img/pistachio_marduk.dts:135.3-23: Warning
(gpios_property): /spi@18100f00/ca8210@0:extclock-gpio: cell 0 is not a
phandle reference

arch/mips/boot/dts/img/pistachio_marduk.dts:126.19-136.4: Warning
(gpios_property): /spi@18100f00/ca8210@0: Missing property '#gpio-cells'
in node /clk@18144000 or bad phandle (referred from extclock-gpio[0])

I do not know how to fix this.

The binding is defined here:
https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ieee8021=
54/ca8210.txt

Hauke


--JY7rZ1FhK7Z0YmxLtbHPbeeNO5Oysx1sa--

--ZWgb9ILDE85drLwTdVnyrYdOmo56WL8QU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl85EYMACgkQ8bdnhZyy
68d9Pwf/az1OuO6jPsgftOHpxdeb2IqDi3v0ivMXAn/c4mkN95sp9omYQa5hkjUu
I+Krg3WHHbHGYkijkrWDUFoNKTOqCJEVjk4K8QP7WxKaFcgP73tB0Oc6oMPK3nrA
03N1hF26lAzo+GGFWTdIwv1IaXwInGN+5yeXGkLLDT+fjm4vFfF2JxCHSY4pKy6N
mln0ijavGNWoRjf+FihHFK/Ca0inULYK/lnN6wsZdCbgIFvbVEvsZ6dplF1htfW5
cTf2CqIqykqiwHffSbA3mrjMMgrPLL+NHSU5mQ5Tz1+1HszO7Z9RwU6LSyVToSaj
+tIMsGOtyhe+z3imJOjv8whyS5IbHQ==
=/YlK
-----END PGP SIGNATURE-----

--ZWgb9ILDE85drLwTdVnyrYdOmo56WL8QU--
