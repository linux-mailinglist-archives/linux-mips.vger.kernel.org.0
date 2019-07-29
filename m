Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997B879B9E
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 23:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389025AbfG2Vzw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 17:55:52 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:25616 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388999AbfG2Vzw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jul 2019 17:55:52 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id 819584FE24;
        Mon, 29 Jul 2019 23:55:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id M9fiuzZeSl3c; Mon, 29 Jul 2019 23:55:41 +0200 (CEST)
Subject: Re: [PATCH 5/5] MIPS: dts: lantiq: danube: easy50712: route the
 PCI_INTA IRQ through EBU
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
 <20190727175315.28834-6-martin.blumenstingl@googlemail.com>
 <86wog2mq6k.wl-marc.zyngier@arm.com>
From:   Hauke Mehrtens <hauke@hauke-m.de>
Openpgp: preference=signencrypt
Autocrypt: addr=hauke@hauke-m.de; keydata=
 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
Message-ID: <ac4418f3-a77d-f450-f99b-1f789ff6b42d@hauke-m.de>
Date:   Mon, 29 Jul 2019 23:55:21 +0200
MIME-Version: 1.0
In-Reply-To: <86wog2mq6k.wl-marc.zyngier@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O
Content-Type: multipart/mixed; boundary="htERSnPkQ3DxdowN4hcOQtazMTOdElH98";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: Marc Zyngier <marc.zyngier@arm.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org,
 paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, john@phrozen.org
Message-ID: <ac4418f3-a77d-f450-f99b-1f789ff6b42d@hauke-m.de>
Subject: Re: [PATCH 5/5] MIPS: dts: lantiq: danube: easy50712: route the
 PCI_INTA IRQ through EBU
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
 <20190727175315.28834-6-martin.blumenstingl@googlemail.com>
 <86wog2mq6k.wl-marc.zyngier@arm.com>
In-Reply-To: <86wog2mq6k.wl-marc.zyngier@arm.com>

--htERSnPkQ3DxdowN4hcOQtazMTOdElH98
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/28/19 12:03 PM, Marc Zyngier wrote:
> On Sat, 27 Jul 2019 18:53:15 +0100,
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> EBU provides an interrupt line for the PCI_INTA interrupt. Route
>> easy50712's PCI interrupt to EBU so the interrupt line is configured
>> correctly (using IRQ_TYPE_LEVEL_LOW, this was previously hardcoded in
>> the PCI driver) and ACKed properly.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com=
>

Acked-by: Hauke Mehrtens <hauke@hauke-m.de>

>> ---
>>  arch/mips/boot/dts/lantiq/easy50712.dts | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/boot/dts/lantiq/easy50712.dts b/arch/mips/boot/=
dts/lantiq/easy50712.dts
>> index 1ce20b7d05cb..33c26b93cfc9 100644
>> --- a/arch/mips/boot/dts/lantiq/easy50712.dts
>> +++ b/arch/mips/boot/dts/lantiq/easy50712.dts
>> @@ -1,6 +1,8 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /dts-v1/;
>> =20
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +
>>  /include/ "danube.dtsi"
>> =20
>>  / {
>> @@ -105,7 +107,7 @@
>>  			lantiq,bus-clock =3D <33333333>;
>>  			interrupt-map-mask =3D <0xf800 0x0 0x0 0x7>;
>>  			interrupt-map =3D <
>> -				0x7000 0 0 1 &icu0 29 1 // slot 14, irq 29
>> +				0x7000 0 0 1 &ebu0 0 IRQ_TYPE_LEVEL_LOW // slot 14
>>  			>;
>>  			gpios-reset =3D <&gpio 21 0>;
>>  			req-mask =3D <0x1>;		/* GNT1 */
>> --=20
>> 2.22.0
>>
>=20
> Are you OK with breaking compatibility between kernel and DT? It
> usually isn't very nice for users...

I am fine with such changes. I am not aware of any board using this SoC
which ships the kernel and the device tree file as different binaries,
it is always either attached or patched into the kernel and never in the
boot loader.

Hauke


--htERSnPkQ3DxdowN4hcOQtazMTOdElH98--

--GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAl0/a0kACgkQ8bdnhZyy
68e1NggAgRDL6+YwQE+/JLxd/uSBbb2lO/H8N8osnESY6PFBNa31k2aSFiJuFrcQ
/jSKs3U/Af2J7B/ctdWWGh/mEPgKvBFIwZKgynYRDy6NYhRmYN+WZO5Zg2k1mr7C
retwFDYdads6oPDM07v7ERUQDL/s9WlW39PR1m3XSKTmZlb26uf048kV8lGVM25S
MXS7j+xFrZ/1ZbH62iqJ8b1+eoQCV1Rt8QlF9pmeTAHTjoo2Vr1XRWaPciPv+l5o
ULzRhq5qzCdlV8rsG7FPOs/M4cABG3CsfVjMsWS/S/Oh0JGsS3a86s8wRdcBgiS7
R8ZnF93K8jE5gZ2yHG4TexUxyV0PJQ==
=AG2t
-----END PGP SIGNATURE-----

--GhTQbiR8HPIsGB7nOslHAJNUom91Snh2O--
