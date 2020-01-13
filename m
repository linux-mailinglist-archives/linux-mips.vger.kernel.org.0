Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA711389CF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 04:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387415AbgAMDkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 22:40:47 -0500
Received: from forward102p.mail.yandex.net ([77.88.28.102]:34717 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387408AbgAMDkr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 22:40:47 -0500
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 2DE241D41191;
        Mon, 13 Jan 2020 06:40:44 +0300 (MSK)
Received: from mxback7q.mail.yandex.net (mxback7q.mail.yandex.net [IPv6:2a02:6b8:c0e:41:0:640:cbbf:d618])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id 27C3761E0004;
        Mon, 13 Jan 2020 06:40:44 +0300 (MSK)
Received: from vla5-47b3f4751bc4.qloud-c.yandex.net (vla5-47b3f4751bc4.qloud-c.yandex.net [2a02:6b8:c18:3508:0:640:47b3:f475])
        by mxback7q.mail.yandex.net (mxback/Yandex) with ESMTP id eBxis5ah4J-ehSefItE;
        Mon, 13 Jan 2020 06:40:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578886844;
        bh=44qXZE00bfOAzHr6HCwPSflD+ETsMCf5II/h32qV0Sk=;
        h=From:To:Subject:CC:References:Date:In-Reply-To:Message-ID;
        b=nrfqXjiNXbRxFy7Y6/zPEhLUliTZFCcy6UTt621r/9R+OggBduSG5ugUiQbWL4L58
         2lrT10tXEh1of6yOa1srtrXu5n27OG1xFYbToc5kQGFas9wNHbH8m43HK2CHc6FodI
         uHiYM7pwPn+lj3NkCq4McHXi/rz64l43VCcIrEoM=
Authentication-Results: mxback7q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla5-47b3f4751bc4.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id RSwfDGmNtE-efZavaIZ;
        Mon, 13 Jan 2020 06:40:41 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client certificate not present)
Date:   Mon, 13 Jan 2020 11:40:30 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAhV-H5QpJcC-iwjmY0Xgdeugsf8FK+ZxgpU=TkcJttW30=mew@mail.gmail.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com> <20200112081416.722218-4-jiaxun.yang@flygoat.com> <CAAhV-H5QpJcC-iwjmY0Xgdeugsf8FK+ZxgpU=TkcJttW30=mew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 03/10] dt-bindings: interrupt-controller: Add Loongson IOINTC
To:     Huacai Chen <chenhc@lemote.com>
CC:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <516A456F-29BA-4DA2-B22B-574AC4044249@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B41=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
1:44:10, Huacai Chen <chenhc@lemote=2Ecom> =E5=86=99=E5=88=B0:
>Hi, Jiaxun,
>
>On Sun, Jan 12, 2020 at 4:21 PM Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>wrote:
>>
>> Document Loongson I/O Interrupt controller=2E
>>
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> Reviewed-by: Rob Herring <robh@kernel=2Eorg>
>> ---
>>  =2E=2E=2E/interrupt-controller/loongson,iointc=2Eyaml | 92
>+++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>  create mode 100644
>Documentation/devicetree/bindings/interrupt-controller/loongson,iointc=2E=
yaml
>>
>> diff --git
>a/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc=
=2Eyaml
>b/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc=
=2Eyaml
>> new file mode 100644
>> index 000000000000=2E=2Eb0fe6c551362
>> --- /dev/null
>> +++
>b/Documentation/devicetree/bindings/interrupt-controller/loongson,iointc=
=2Eyaml
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: (GPL-2=2E0-only OR BSD-2-Clause)
>> +%YAML 1=2E2
>> +---
>> +$id:
>"http://devicetree=2Eorg/schemas/interrupt-controller/loongson,iointc=2Ey=
aml#"
>> +$schema: "http://devicetree=2Eorg/meta-schemas/core=2Eyaml#"
>> +
>> +title: Loongson I/O Interrupt Controller
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> +
>> +description: |
>> +  This interrupt controller is found in the Loongson-3 family of
>chips as the primary
>> +  package interrupt source which can route interrupt to interrupt
>line of cores=2E
>> +
>> +allOf:
>> +  - $ref: /schemas/interrupt-controller=2Eyaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: loongson,iointc-1=2E0
>> +      - const: loongson,iointc-1=2E0a
>As our early discussion, we should use liointc for the legacy Loongson
>irq-controller ans use eiointc for the new irq-controller in

Will do, thanks=2E

>Loongson-3A4000=2E Moreover, could you please describe the difference
>between 1=2E0 and 1=2E0a?

1=2E0a appears in Loongson-3A4000 doesn't have LPC spurious interrupt issu=
e=2E

>
>Huacai
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupt-controller: true
>> +
>> +  interrupts:
>> +    description:
>> +      Interrupt source of the CPU interrupts=2E
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  interrupt-names:
>> +    description: List of names for the parent interrupts=2E
>> +    oneOf:
>> +      - items:
>> +          - const: int0
>> +          - const: int1
>> +          - const: int2
>> +          - const: int3
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  '#interrupt-cells':
>> +    const: 2
>> +
>> +  'loongson,parent_int_map':
>> +    description: |
>> +      This property points the accept range of children interrupts
>> +      that parents will recieve=2E Each cell refers to a parent
>interrupt line
>> +      and each bit in the cell refers to a children interrupt=2E If a
>parent
>> +      did not connected, than keep it's cell with zero=2E
>> +    allOf:
>> +      - $ref: /schemas/types=2Eyaml#/definitions/uint32-array
>> +      - items:
>> +          minItems: 4
>> +          maxItems: 4
>> +
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-controller
>> +  - '#interrupt-cells'
>> +  - 'loongson,parent_int_map'
>> +
>> +
>> +examples:
>> +  - |
>> +    iointc: interrupt-controller@3ff01400 {
>> +      compatible =3D "loongson,iointc-1=2E0";
>> +      reg =3D <0 0x3ff01400 0x64>;
>> +
>> +      interrupt-controller;
>> +      #interrupt-cells =3D <2>;
>> +
>> +      interrupt-parent =3D <&cpuintc>;
>> +      interrupts =3D <2>, <3>;
>> +      interrupt-names =3D "int0", "int1";
>> +
>> +      loongson,parent_int_map =3D <0xf0ffffff>, /* int0 */
>> +                                <0x0f000000>, /* int1 */
>> +                                <0x00000000>, /* int2 */
>> +                                <0x00000000>; /* int3 */
>> +
>> +    };
>> +
>> +=2E=2E=2E
>> --
>> 2=2E24=2E1
>>

--=20
Jiaxun Yang
