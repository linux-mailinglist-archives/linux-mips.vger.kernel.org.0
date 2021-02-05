Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B03431027A
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 02:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhBEBzz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 20:55:55 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35620 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229618AbhBEBzw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 20:55:52 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb_N1pRxgVQAFAA--.6185S3;
        Fri, 05 Feb 2021 09:55:02 +0800 (CST)
Subject: Re: [PATCH v2 2/2] MIPS: relocatable: Use __kaslr_offset in
 show_kernel_relocation
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1612348510-29569-1-git-send-email-hejinyang@loongson.cn>
 <1612348510-29569-2-git-send-email-hejinyang@loongson.cn>
 <20210204153623.GA14818@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <a2f9868c-707c-6f63-e5e4-956354d241e4@loongson.cn>
Date:   Fri, 5 Feb 2021 09:55:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210204153623.GA14818@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxb_N1pRxgVQAFAA--.6185S3
X-Coremail-Antispam: 1UD129KBjvJXoW7try8Jry8uF4kWFy7Ar4DCFg_yoW8XF17pr
        srJ3WDtFsIgrWDGa9Fq34ku34UX3yqqrWfuFsFk3yrXasavF15Jayrur1rW3y2vFy09F4x
        ZF98XFW29w4vyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
        jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU59Z2DUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/04/2021 11:36 PM, Thomas Bogendoerfer wrote:

> On Wed, Feb 03, 2021 at 06:35:10PM +0800, Jinyang He wrote:
>> The type of the VMLINUX_LOAD_ADDRESS macro is the (unsigned long long)
>> in 32bits kernel but (unsigned long) in the 64-bit kernel. Although there
>> is no error here, avoid using it to calculate kaslr_offset. And here we
>> may need is that the address of __kaslr_offset rather than (void *)offset.
>>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>>   arch/mips/kernel/relocate.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
>> index 95abb9c..52018a3 100644
>> --- a/arch/mips/kernel/relocate.c
>> +++ b/arch/mips/kernel/relocate.c
>> @@ -430,13 +430,9 @@ void *__init relocate_kernel(void)
>>    */
>>   static void show_kernel_relocation(const char *level)
>>   {
>> -	unsigned long offset;
>> -
>> -	offset = __pa_symbol(_text) - __pa_symbol(VMLINUX_LOAD_ADDRESS);
>> -
>> -	if (IS_ENABLED(CONFIG_RELOCATABLE) && offset > 0) {
>> +	if (__kaslr_offset > 0) {
>>   		printk(level);
>> -		pr_cont("Kernel relocated by 0x%pK\n", (void *)offset);
>> +		pr_cont("Kernel relocated by 0x%pK\n", &__kaslr_offset);
> are you sure ? I would have expected (void *)__kaslr_offset here.
>
> Thomas.
>
It is my fault. I misunderstood the meaning of 'by' and '@' because of
my poor English. Thank you for pointing out my fault. I'll send v3 later.

Thanks,
Jinyang

