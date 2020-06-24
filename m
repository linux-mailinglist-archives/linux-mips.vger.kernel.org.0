Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FAE206FA7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387926AbgFXJFa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:05:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57736 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728857AbgFXJFa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:05:30 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn95JF_NevS9JAA--.726S3;
        Wed, 24 Jun 2020 17:05:13 +0800 (CST)
Subject: Re: [PATCH v2 7/7 RESEND] dt-bindings: interrupt-controller: Fix
 typos in loongson,liointc.yaml
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <1592981136-3572-1-git-send-email-yangtiezhu@loongson.cn>
 <1592981136-3572-8-git-send-email-yangtiezhu@loongson.cn>
 <0b20ab00-2809-1770-c7c0-114260b2a571@cogentembedded.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <3ae468e7-505e-dbac-8255-8803dd6e2f64@loongson.cn>
Date:   Wed, 24 Jun 2020 17:05:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <0b20ab00-2809-1770-c7c0-114260b2a571@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxn95JF_NevS9JAA--.726S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr13CFy7Kr4xtr4xKw45Wrg_yoW8WFW7pa
        yDC3ZrKF4Utr13Ca97t3WvkF13ZrsxArnrGFZxZrW8JFZrWr1Fqr4agF95J3Z8Kr4Iq3Wj
        qryrWay0gFWUAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
        wI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I
        0E14v26rxl6s0DYxBIdaVFxhVjvjDU0xZFpf9x0JUSsjbUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/24/2020 04:42 PM, Sergei Shtylyov wrote:
> Hello!
>
> On 24.06.2020 9:45, Tiezhu Yang wrote:
>
>> Fix the following two typos in loongson,liointc.yaml:
>> fron -> from
>> it's -> its
>>
>> Fixes: b6280c8bb6f5 ("dt-bindings: interrupt-controller: Add Loongson 
>> LIOINTC")
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>> .../devicetree/bindings/interrupt-controller/loongson,liointc.yaml | 
>> 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml 
>> b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml 
>>
>> index b1db21e..13908ca 100644
>> --- 
>> a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
>> @@ -51,8 +51,8 @@ properties:
>>       description: |
>>         This property points how the children interrupts will be 
>> mapped into CPU
>>         interrupt lines. Each cell refers to a parent interrupt line 
>> from 0 to 3
>> -      and each bit in the cell refers to a children interrupt fron 0 
>> to 31.
>> -      If a CPU interrupt line didn't connected with liointc, then 
>> keep it's
>> +      and each bit in the cell refers to a children interrupt from 0 
>> to 31.
>> +      If a CPU interrupt line didn't connected with liointc, then 
>> keep its
>
>    "Connect", while you're at it?

OK, thank you.
I will do it in the next version, maybe some days later.

>
>>         cell with zero.
>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>       minItems: 4
>
> MBR, Sergei

