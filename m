Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101ED1CBC6E
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2020 04:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgEICYB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 May 2020 22:24:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53710 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728158AbgEICYA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 May 2020 22:24:00 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx72ozFLZe5F8yAA--.25S3;
        Sat, 09 May 2020 10:23:48 +0800 (CST)
Subject: Re: [PATCH 2/3] MIPS: Loongson: Add hwmon support for generic CPU
To:     WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1588938904-924-1-git-send-email-yangtiezhu@loongson.cn>
 <1588938904-924-3-git-send-email-yangtiezhu@loongson.cn>
 <f7184121-c044-6e79-78ab-dcc9103b27c2@xen0n.name>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <234fe99b-44db-46b9-76fb-6426598f4448@loongson.cn>
Date:   Sat, 9 May 2020 10:23:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <f7184121-c044-6e79-78ab-dcc9103b27c2@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx72ozFLZe5F8yAA--.25S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw48tr48uF18Gr47tw4fKrg_yoW8WF13pF
        Z5Kay3ur1jqr1jkanrJw4Uur45Za15KrZ7CFWDA34UZas8Wwnxua4IqFnIyrnrZr4fua12
        yF4vqa4ruF43ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
        VjvjDU0xZFpf9x0JUHWlkUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/08/2020 08:51 PM, WANG Xuerui wrote:
> On 2020/5/8 19:55, Tiezhu Yang wrote:
>
>> Add PRID_IMP_LOONGSON_64G case to enable hwmon support for Loongson
>> generic CPU such as 3A4000 and newer CPU.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   drivers/platform/mips/cpu_hwmon.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/mips/cpu_hwmon.c 
>> b/drivers/platform/mips/cpu_hwmon.c
>> index add5f52..7b4bde1 100644
>> --- a/drivers/platform/mips/cpu_hwmon.c
>> +++ b/drivers/platform/mips/cpu_hwmon.c
>> @@ -43,6 +43,7 @@ int loongson3_cpu_temp(int cpu)
>>           break;
>>       case PRID_REV_LOONGSON3A_R3_0:
>>       case PRID_REV_LOONGSON3A_R3_1:
>> +    case PRID_IMP_LOONGSON_64G:
>>       default:
>>           reg = (reg & 0xffff)*731/0x4000 - 273;
>>           break;
>
> Hi,
>
> This is obviously wrong, as the value being matched is a PRID_REV. You 
> can tell from the neighboring match arms.
>
> Also, the LOONGSON_64G cores are 3A4000 and newer, that have CSR 
> support. The csr_temp_enable flag is probed in loongson_hwmon_init, 
> then the switch is simply never entered for these.

Hi Xuerui,

Thanks for your review. You are right.

I notice that this feature has been done in the commit 7507445b1993
("MIPS: Loongson: Add Loongson-3A R4 basic support"). My initial aim
is to get CPU temperature for the Loongson generic CPU when the flag
csr_temp_enable is false, but this is just the default case. So this
patch is meaningless, please ignore it.

Because patch 3/3 depends on this patch 2/3, I will remake and send v2
patch series without this patch.

Thanks,
Tiezhu Yang

