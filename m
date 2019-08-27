Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1CF69EA6B
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 16:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfH0OJJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 10:09:09 -0400
Received: from forward102o.mail.yandex.net ([37.140.190.182]:50612 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726134AbfH0OJJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 10:09:09 -0400
Received: from mxback22j.mail.yandex.net (mxback22j.mail.yandex.net [IPv6:2a02:6b8:0:1619::222])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 0F4BC6680117;
        Tue, 27 Aug 2019 17:09:04 +0300 (MSK)
Received: from smtp1j.mail.yandex.net (smtp1j.mail.yandex.net [2a02:6b8:0:801::ab])
        by mxback22j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 1AzA1SgxCi-93GqxJxh;
        Tue, 27 Aug 2019 17:09:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566914944;
        bh=D5uwWM4YJ43JikPE4fZ2mEzTipIE6Wedo0MPqc73Jp8=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=wyppnKUDmPRVIbYEv5JOM3jldINRCO7EeZ2clN1IFck8WDLZdWG8raUmOGlBruakG
         Bl36sAycqbgXeVPCZHHk+whbLGkzTdXCFOk3pgwHCLoixQhSHZZ74L+Rqd4G2KhfUp
         O0jrrJU8Bb+Sc5RCWtrzMj+PZIXbI83JzuSWS8sw=
Authentication-Results: mxback22j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id u2heOhXOSl-8tACFLiI;
        Tue, 27 Aug 2019 17:09:01 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 07/13] dt-bindings: interrupt-controller: Add Loongson-3
 HTINTC
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.co>, devicetree@vger.kernel.org
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-8-jiaxun.yang@flygoat.com>
 <CAL_JsqJzkKDVm_DBpp4_w5YZQkg0yo9TJtvxzN5beTf45gtohw@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e4b0c346-928e-380c-02f7-11c9d4e7864b@flygoat.com>
Date:   Tue, 27 Aug 2019 22:08:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJzkKDVm_DBpp4_w5YZQkg0yo9TJtvxzN5beTf45gtohw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/27 下午8:49, Rob Herring wrote:
> On Tue, Aug 27, 2019 at 3:59 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> Document Loongson-3 HyperTransport Interrupt controller.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   .../loongson,ls3-htintc.yaml                  | 53 +++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>> new file mode 100644
>> index 000000000000..c1bc0faca656
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-htintc.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-htintc.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Loongson-3 HyperTransport Interrupt Controller
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +description: |
>> +  This interrupt controller is found in the Loongson-3 family of chips to transfer
>> +  interrupts from PCH connected on HyperTransport bus.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +        - loongson,ls3-htintc
> Can be simplified to:
>
> compatible
>    const: loongson,ls3-htintc
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 4
> Need to list out what each of the 4 are.

Hi Rob

These 4 interrupts a just delivered randomly, So it's hard to give out a 
name.

Should I add a description for this?

Thanks,

--

Jiaxun Yang

