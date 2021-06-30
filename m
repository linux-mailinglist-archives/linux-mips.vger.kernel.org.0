Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFFE3B8238
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jun 2021 14:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbhF3Mh1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Jun 2021 08:37:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36314 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234510AbhF3Mh0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Jun 2021 08:37:26 -0400
Received: from [10.130.0.191] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0HWZNxgmtEaAA--.10408S3;
        Wed, 30 Jun 2021 20:34:51 +0800 (CST)
Subject: Re: [PATCH v6 2/2] MIPS: Loongson64: DTS: Add pm block node for
 Loongson-2K1000
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
References: <20210630065103.23665-1-zhangqing@loongson.cn>
 <20210630065103.23665-2-zhangqing@loongson.cn>
 <a69323fd-c770-89e2-d3a7-a0807ad831af@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <cf8a7dae-53cc-3911-6e65-eafe61b92ad6@loongson.cn>
Date:   Wed, 30 Jun 2021 20:34:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a69323fd-c770-89e2-d3a7-a0807ad831af@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0HWZNxgmtEaAA--.10408S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWfur4fGF4kWr18tFWfuFg_yoWkArX_t3
        W2kF1kGFWfJF1xJ34UWr1UJry3urW7Z3WrCF18Zr1YqasIywn8JayUA395Gry3GFyY9rs3
        Xr4rXFn7ArWIgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbI8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
        80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
        zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx
        8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xS
        Y4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
        twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        xUcfHUDUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 06/30/2021 04:20 PM, Jiaxun Yang wrote:
>
> 在 2021/6/30 14:51, Qing Zhang 写道:
>> The module is now supported, enable it.
>
> Oh, you forgot binding document.

     oh, I forgot a patch... :
     I'll send it make RESEND.

     Thanks,

     -Qing

>
> Thanks.
>
> - Jiaxun
>
>>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
>> ---
>>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi 
>> b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> index 569e814def83..8f469b623740 100644
>> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>> @@ -52,6 +52,11 @@ package0: bus@10000000 {
>>               0 0x40000000 0 0x40000000 0 0x40000000
>>               0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
>>   +        pm: power-controller@1fe07000 {
>> +            compatible = "loongson,ls2k-pm";
>> +            reg = <0 0x1fe07000 0 0x422>;
>> +        };
>> +
>>           liointc0: interrupt-controller@1fe11400 {
>>               compatible = "loongson,liointc-2.0";
>>               reg = <0 0x1fe11400 0 0x40>,

