Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224CF3B6BE6
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 03:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhF2BGo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 21:06:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42376 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230090AbhF2BGo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 21:06:44 -0400
Received: from [10.130.0.191] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxQOKKcdpgcgUaAA--.33112S3;
        Tue, 29 Jun 2021 09:04:11 +0800 (CST)
Subject: Re: [PATCH v4 2/2] MIPS: Loongson64: Add pm block node for
 Loongson-2K1000
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>
References: <20210628151330.11952-1-zhangqing@loongson.cn>
 <20210628151330.11952-2-zhangqing@loongson.cn>
 <697cd16e-7131-95d6-6e0b-1034d493b3ce@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <b268ab7f-09d7-2a72-07e0-f497ae0c6ad1@loongson.cn>
Date:   Tue, 29 Jun 2021 09:04:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <697cd16e-7131-95d6-6e0b-1034d493b3ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9BxQOKKcdpgcgUaAA--.33112S3
X-Coremail-Antispam: 1UD129KBjvJXoWrtrW3Xr4fKw1kKFW8Ww45Jrb_yoW8Jr4xpr
        nIka1UKF4rury3uFn3tryUXr43ZFZ3AFnFgFsxXryUX3sxZa17KryrJFn3KayxZr43Aay0
        9ry0grWUGF15Ca7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
        uYvjxU7tkuUUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/29/2021 12:03 AM, Sergei Shtylyov wrote:
> Hello!
>
> On 6/28/21 6:13 PM, Qing Zhang wrote:
>
>> The module is now supported, enable it.
>>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>> ---
>>
>> v3-v4:
>> No change
>>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>> ---
>>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> index 569e814def83..e31176ac0ac2 100644
>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> @@ -101,6 +101,15 @@ uart0: serial@1fe00000 {
>>   			no-loopback-test;
>>   		};
>>   
>> +		pm: power-controller {
>> +			device_type = "power management";
>> +			compatible = "loongson, reset-controller";
>     No spaces allowed here, AFAIK.
>
>> +			reg = <0 0x1fe0700c 0 0x8>,
>> +				<0 0x1fe07014 0 0x8>,
>> +				<0 0x1fe07030 0 0x8>;
>     Better keep those aligned...
Hi Sergei :-)

enm...

Will fix in next reversion.

Thanks.

-Qing
>
>> +			reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
>> +		};
>> +
> [...]
>
> MBR, Sergei

