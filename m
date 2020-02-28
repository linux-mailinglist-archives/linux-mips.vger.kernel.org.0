Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD38173A35
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 15:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgB1Ors (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 09:47:48 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.120]:16014 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgB1Ors (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 09:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582901266;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=qqf0pjro2BO53k2Y7GVfbuwFuheFtgoTpJWiEKvgrfU=;
        b=DuXnIaxvDxvKje5KSNOFNgz0Whd19uiAhPLuChjOmTj/iXgpkBJPmWCAZPT82wg4nD
        RH2utvfp3seqQ62deuRCGKIxjmsQVnpYhYVXD3eQYK3JRa1/pTDIoeZvsUNNQ5yhOGVc
        vNlhpWUCEdxmzXGoJoh5dFnJ4dZCZvA2VF9LVNKMFPiGBP6Ns5hKNIM6gtq2tLHe3PWe
        YNymJYgBP/NhcuTgIHSdHT3cKPzzhn/X7hqYHMRLDu8osfoFF08f/zMHzJXGO4ZpUE6J
        lbgo6Kv9v4EZfh74yrt0nQG/d3mTV9JQ1wS5jk3l8dBcgYIkDd0Meec+1/l7dZY9UhHv
        tMlw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaYXAcKqg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SEla1Lw
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 15:47:36 +0100 (CET)
Subject: Re: [PATCH v7 3/7] Bindings: nvmem: add bindings for JZ4780 efuse
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1582900837.3.3@crapouillou.net>
Date:   Fri, 28 Feb 2020 15:47:36 +0100
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
Message-Id: <9B96463B-CEDE-46EF-87C4-395EB919C78F@goldelico.com>
References: <cover.1582898302.git.hns@goldelico.com> <ebd523e39aac31b087affcfa984738204fa8b542.1582898302.git.hns@goldelico.com> <1582900837.3.3@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.02.2020 um 15:40 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le ven., f=E9vr. 28, 2020 at 14:58, H. Nikolaus Schaller =
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
>> .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 49 =
+++++++++++++++++++
>> 1 file changed, 49 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>> diff --git =
a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>> new file mode 100644
>> index 000000000000..ce6690c50a34
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>> @@ -0,0 +1,49 @@
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
> You still have clock-names here. You can remove it completely.

I have just removed them from required: and the examples: because
I think they are optional. Or are they forbidden?

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
>> +    };
>> +
>> +...
>> --
>> 2.23.0

BR,
Nikolaus

