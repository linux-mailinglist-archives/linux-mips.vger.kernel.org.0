Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474D93369DA
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 02:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbhCKBnm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 20:43:42 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33562 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229468AbhCKBnZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 20:43:25 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD_KzdUlgUuoXAA--.13819S3;
        Thu, 11 Mar 2021 09:43:15 +0800 (CST)
Subject: Re: [PATCH v4 6/7] dt-bindings: interrupt-controller: Add
 Loongson-2K1000 LIOINTC
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
References: <20210310075639.20372-1-zhangqing@loongson.cn>
 <20210310075639.20372-7-zhangqing@loongson.cn>
 <da399bdd-9454-4d63-a549-546c049c1a29@www.fastmail.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ming Wang <wangming01@loongson.cn>
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <8bd4f6c3-f2cf-4f36-879b-9755117cdac7@loongson.cn>
Date:   Thu, 11 Mar 2021 09:43:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <da399bdd-9454-4d63-a549-546c049c1a29@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxD_KzdUlgUuoXAA--.13819S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4rXw47KF1UXr13tr45GFg_yoW8Zw15pr
        ZrCanFgF48tr13Cayxta40ka15Zr98AwnrKrsFv3y7GFnrKw1UXr1a9F1rZFZ5uFWIqF4j
        vF1F9a4UWasIyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
        73UjIFyTuYvjfUFVyIUUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/10/2021 08:04 PM, Jiaxun Yang wrote:
>
> On Wed, Mar 10, 2021, at 3:56 PM, Qing Zhang wrote:
>> Add liointc-2.0 properties support, so update the maxItems and description.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ^ I have nothing todo with this patch so please drop me for this one :-)
>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>> Tested-by: Ming Wang <wangming01@loongson.cn>
>> ---
>>
>> v3-v4: Standard submission of information
> ^ It's called commit message.
>
>>   .../bindings/interrupt-controller/loongson,liointc.yaml    | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
>> index f38e0113f360..5280cf60a9a7 100644
>> ---
>> a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
>> +++
>> b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
>> @@ -10,9 +10,9 @@ maintainers:
>>     - Jiaxun Yang <jiaxun.yang@flygoat.com>
>>   
>>   description: |
>> -  This interrupt controller is found in the Loongson-3 family of chips
>> as the primary
>> -  package interrupt controller which can route local I/O interrupt to
>> interrupt lines
>> -  of cores.
>> +  This interrupt controller is found in the Loongson-3 family of chips
>> and
>> +  Loongson-2K1000 chip, as the primary package interrupt controller
>> which
>> +  can route local I/O interrupt to interrupt lines of cores.
>>   
>>   allOf:
>>     - $ref: /schemas/interrupt-controller.yaml#
>> @@ -22,6 +22,7 @@ properties:
>>       oneOf:
>>         - const: loongson,liointc-1.0
>>         - const: loongson,liointc-1.0a
>> +      - const: loongson,liointc-2.0
>>   
>>     reg:
>>       maxItems: 1
> ^ Please document multiple reg prop change as well.
   Hi, Jiaxun

   Thank you for your reply,

   I will do it and send v5.

   Thanks,
   -Qing
>
> Thanks.
>
> - Jiaxun
>
>> -- 
>> 2.20.1
>>
>>

