Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA0309EAB9
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 16:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbfH0OTJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 10:19:09 -0400
Received: from forward101o.mail.yandex.net ([37.140.190.181]:47185 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726054AbfH0OTJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 10:19:09 -0400
Received: from mxback29g.mail.yandex.net (mxback29g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:329])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id AFAD63C010BE;
        Tue, 27 Aug 2019 17:19:04 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback29g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id MavhNij79l-J4AWWKPG;
        Tue, 27 Aug 2019 17:19:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566915544;
        bh=Q9pUCEdPyR1430MwOUuTZfxYBhNGyX+eoOaRoswXA8U=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=WAmmy3rYCrQeeIhuTgCHLsoK+q9wGCJXwCyDVMUs0VexG4C610/ecc3VCjOirXaNL
         NYAUB82oxslNihFOv8WF8bo6oDDy6Bp8S8/CchdRQkvSTQWOyT/PTUzy/UiP914n/B
         AnUtcMUHfM04St28sfS0qHZRTuP27L7CAqCe6Rsg=
Authentication-Results: mxback29g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id AzkE6b5uHe-Ivt4wcrM;
        Tue, 27 Aug 2019 17:19:02 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
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
 <20190827085302.5197-12-jiaxun.yang@flygoat.com>
 <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d94eff2b-76ec-5cd2-512d-5ee0406a1bb9@flygoat.com>
Date:   Tue, 27 Aug 2019 22:18:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL6htVye-LSBWw1WwRy9xH=zwuH6gurscwoCWj9Te_hAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/27 下午8:45, Rob Herring wrote:
> On Tue, Aug 27, 2019 at 3:55 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> Prepare for later dts.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   .../bindings/mips/loongson/cpus.yaml          | 38 +++++++++++
>>   .../bindings/mips/loongson/devices.yaml       | 64 +++++++++++++++++++
>>   2 files changed, 102 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>>   create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mips/loongson/cpus.yaml b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>> new file mode 100644
>> index 000000000000..410d896a0078
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0
> Dual license for new bindings please:
>
> (GPL-2.0-only OR BSD-2-Clause)
>
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mips/loongson/cpus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Loongson CPUs bindings
>> +
>> +maintainers:
>> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
>> +
>> +description: |+
>> +  The device tree allows to describe the layout of CPUs in a system through
>> +  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
>> +  defining properties for every cpu.
>> +
>> +  Bindings for CPU nodes follow the Devicetree Specification, available from:
>> +
>> +  https://www.devicetree.org/specifications/
>> +
>> +properties:
>> +  reg:
>> +    maxItems: 1
>> +    description: |
>> +      Physical ID of a CPU, Can be read from CP0 EBase.CPUNum.
> Is this definition specific to Loongson CPUs or all MIPS?

Currently it's specific to Loongson CPU only, as other processors may 
using different method to express CPU map.

Different from Arm, MIPS family of processors seems less uniform and 
have their own designs.

For this point, we'd better ask Paul's opinion.

--

Jiaxun Yang

