Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEDB1721A6
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 15:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729715AbgB0Ozf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 09:55:35 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:29987 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729417AbgB0Oze (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 09:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582815330;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6MaUNnuMF9ZzIkw9Sg6aeNx2guh8YptOPnOMLqWfXkQ=;
        b=CXaicGmYbo1aGBee6wD+cbXxGwb7F74DiM3TkV+omEtwXbKe3gqqwrgWHZGa0yGVKW
        xDbMzu02fzWRKOM0qN7ZJYMf0owt9h1/N6FcGfkhTm9FvDNd+88hn5GAgDNEfjt/G/ZW
        GRDVnL3GIE2I0vy6qqIFYVGY4cFu0Lm0fHKLrXv9NOeV7C9hUz0W7s3cfQkdk6hCwNqb
        nbT0XrwJ7izVT6bGtYNo9QgYxFffGmMl41ni4+UVU/SJOdYfmw/1fVi6G5hCleIVG/aY
        EgR2fd/A+Z8lVUnpTUTkX7rP0MRdubZuLk1wz94qsnmCYl2kH5qnUUuNMS9K+6yO5Vi4
        0KmA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMhw47o15Y="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1REtJBkm
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 27 Feb 2020 15:55:19 +0100 (CET)
Subject: Re: [PATCH v6 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1582814957.3.3@crapouillou.net>
Date:   Thu, 27 Feb 2020 15:55:19 +0100
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
Message-Id: <288EB071-1369-46ED-89F9-0A067FED0948@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com> <4b243cc120ca6f9a23e217d070e7f6a42f11f8b4.1582715761.git.hns@goldelico.com> <1582814957.3.3@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 27.02.2020 um 15:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le mer., f=E9vr. 26, 2020 at 12:15, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> This patch brings support for the JZ4780 efuse. Currently it only =
exposes
>> a read only access to the entire 8K bits efuse memory.
>> Tested-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: PrasannaKumar Muralidharan =
<prasannatsmkumar@gmail.com>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> [converted to yaml]
>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>> ---
>> .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 50 =
+++++++++++++++++++
>> 1 file changed, 50 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>> diff --git =
a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>> new file mode 100644
>> index 000000000000..b9c0ea09b335
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>> @@ -0,0 +1,50 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Ingenic JZ EFUSE driver bindings
>> +
>> +maintainers:
>> +  - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> +
>> +allOf:
>> +  - $ref: "nvmem.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ingenic,jz4780-efuse
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    # Handle for the ahb for the efuse.
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ahb2
>=20
> Your driver does not actually require the clock to be 'ahb2', it will =
take the first clock independently of its name. So 'clock-names' can be =
dropped.
>=20
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/jz4780-cgu.h>
>> +
>> +    efuse@134100d0 {
>> +        compatible =3D "ingenic,jz4780-efuse";
>> +        reg =3D <0x134100d0 0x2c>;
>> +
>> +        clocks =3D <&cgu JZ4780_CLK_AHB2>;
>> +        clock-names =3D "ahb2";
>=20
> Same here.

Ok! Will also update in the real .dts.

BR and thanks,
Nikolaus

