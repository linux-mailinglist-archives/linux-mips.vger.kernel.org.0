Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70BF31690A9
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 18:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgBVRRz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 12:17:55 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100]:28049 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgBVRRz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 12:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582391872;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=HPDPreE9UVNTnqFOXyZ+31E5RMMnmqZ+gBEpi7rZ8nc=;
        b=Rwa2EDXBldQIyrPctsvJkCD6CCcc9Ek1rfSnIOjSmJETwYWBa41HSBzt9SXFGPPoFZ
        U+kIDOMp4tASADrJDozIWucu4l5aeGLHPXYfErP21S5+Tp4oabcu4CLHoMlam/BoZLQv
        V43sRP2r+8ZzuE5YrnfSjGjvSH0sJO2XCCwC2DKEctHCKiVKAVq9xj1XPAjJaPZEDegh
        Gv2zv6DxqKZIGlyC1suepv9uFCdfQX2PyPyRF4pLQhlGZEY66wNucC1zc1KXGMhrrPrI
        HRfO+OFAFNDLl6VVNgd5FjhHBVQLqOJFAhA+nVVMJJtVkkWTMTeXFD7DD45vX1xY+8ds
        XPUA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAiw43swGE="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1MHHjk3G
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 22 Feb 2020 18:17:45 +0100 (CET)
Subject: Re: [PATCH v5 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200222174408.10588e32@kemnade.info>
Date:   Sat, 22 Feb 2020 18:17:44 +0100
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
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
Message-Id: <7EA5C99C-094E-43FC-BF04-A9056C8BB2B6@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com> <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com> <20200222165738.61cde2a0@kemnade.info> <D59DC84C-837E-4856-8FED-580381F748FF@goldelico.com> <20200222174408.10588e32@kemnade.info>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 22.02.2020 um 17:46 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Sat, 22 Feb 2020 17:34:06 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>>> Am 22.02.2020 um 16:57 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>>=20
>>> On Sat, 22 Feb 2020 11:25:37 +0100
>>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>>=20
>>>> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>>>=20
>>>> This patch brings support for the JZ4780 efuse. Currently it only =
exposes
>>>> a read only access to the entire 8K bits efuse memory.
>>>>=20
>>>> Tested-by: Mathieu Malaterre <malat@debian.org>
>>>> Signed-off-by: PrasannaKumar Muralidharan =
<prasannatsmkumar@gmail.com>
>>>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> [converted to yaml]
>>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>>> ---
>>>> .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 50 =
+++++++++++++++++++
>>>> 1 file changed, 50 insertions(+)
>>>> create mode 100644 =
Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>>>>=20
>>>> diff --git =
a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>>>> new file mode 100644
>>>> index 000000000000..09a8ef937750
>>>> --- /dev/null
>>>> +++ =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>>>> @@ -0,0 +1,50 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: =
http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Ingenic JZ EFUSE driver bindings
>>>> +
>>>> +maintainers:
>>>> +  - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: "nvmem.yaml#"
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - ingenic,jz4780-efuse
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    # Handle for the ahb for the efuse.
>>>> +    maxItems: 1
>>>> +
>>>> +  clock-names:
>>>> +   items:
>>>> +     - const:  ahb2 =20
>>> as Rob said: probably not needed, since it is a single
>>> clock, and the driver uses devm_clk_get(dev, NULL), so it should be =
prepared
>>> for that without any extra work. =20
>>=20
>> The question is if a specific driver implementation should determine
>> what the DT requires or the other way round. I don't know...
>>=20
>> I did interpret Rob's comment differently: there was
>>=20
>>> - "clock-names"		Must be "bus_clk" =20
>>=20
>> and he did say:=20
>>=20
>> 	'clk' is redundant. How about 'ahb'?
>>=20
>> So I thought he refers to the _clk suffix?
>>=20
>=20
> and he said to my first try:
> ---
>> +  clock-names:
>> +   items:
>> +     - const:  bus_clk =20
>=20
> My prior comment still applies.
>=20
> Also, for a single clock, you don't really need a name.

Ah, ok. I may have missed that.

BR and thanks,
Nikolaus

