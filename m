Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396872BA0A1
	for <lists+linux-mips@lfdr.de>; Fri, 20 Nov 2020 03:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgKTCsM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 21:48:12 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33682 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725937AbgKTCsM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 21:48:12 -0500
Received: from [10.130.0.170] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxitBnLrdfHlMTAA--.30966S3;
        Fri, 20 Nov 2020 10:48:07 +0800 (CST)
Subject: Re: [PATCH 1/3] MIPS: KASLR: Correcte valid bits in
 apply_r_mips_26_rel
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
 <20201119123636.GA4936@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <0fbbdce0-1449-fb40-0a11-2cded0c3472b@loongson.cn>
Date:   Fri, 20 Nov 2020 10:48:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20201119123636.GA4936@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxitBnLrdfHlMTAA--.30966S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF1rurW3Jry8urWkZF4xZwb_yoW8WrW3pr
        9rJFyxGr4UJFyUKFyUJF15Jr1UJa1DXF17GF1kt34Ivwn8ZryDGF18Gr1xX3y0gr10kF17
        XFyqgr1UAr4UAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG
        8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
        uYvjxUqR6zDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 11/19/2020 08:36 PM, Thomas Bogendoerfer wrote:
> On Thu, Nov 19, 2020 at 10:29:12AM +0800, Jinyang He wrote:
>> Apply_r_mips_26_rel() relocates instructions like j, jal and etc. These
>> instructions consist of 6bits function field and 26bits address field.
>> The value of target_addr as follows,
>> =================================================================
>> |     high 4bits           |            low 28bits              |
>> =================================================================
>> |the high 4bits of this PC | the low 26bits of instructions << 2|
>> =================================================================
>> Thus, loc_orig and log_new both need high 4bits ranther than high 6bits.
> 						  rather
>
>> Replace 0x3ffffff with 0xfffffff.
>>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>>   arch/mips/kernel/relocate.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
>> index 3d80a51..709cfa0 100644
>> --- a/arch/mips/kernel/relocate.c
>> +++ b/arch/mips/kernel/relocate.c
>> @@ -95,7 +95,7 @@ static int __init apply_r_mips_26_rel(u32 *loc_orig, u32 *loc_new, long offset)
>>   
>>   	/* Original target address */
>>   	target_addr <<= 2;
>> -	target_addr += (unsigned long)loc_orig & ~0x03ffffff;
>> +	target_addr += (unsigned long)loc_orig & ~0x0fffffff;
> how about using
>
> 	target_addr += (unsigned long)log_orig & 0xf0000000;
>
> which makes it IMHO even clearer what this does ?
That sounds good. I'll send v2 later.

Thanks,
Jinyang.

> Thomas.
>

