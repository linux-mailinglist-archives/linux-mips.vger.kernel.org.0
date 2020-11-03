Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB6D2A3CB7
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 07:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgKCGSE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 01:18:04 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53550 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbgKCGSE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 01:18:04 -0500
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxmtAS9qBfy5YEAA--.4195S3;
        Tue, 03 Nov 2020 14:17:55 +0800 (CST)
Subject: Re: [PATCH v2 5/6] MIPS: Loongson64: Make sure the PC address is
 correct when 3A4000+ CPU hotplug
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
 <1604373306-3599-6-git-send-email-yangtiezhu@loongson.cn>
 <b67e3a4b-2f2f-37c5-88fa-24e11ac21cac@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Lu Zeng <zenglu@loongson.cn>, Jun Yi <yijun@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <f9ca25c7-dc3b-6f2d-9011-166851d1a62a@loongson.cn>
Date:   Tue, 3 Nov 2020 14:17:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b67e3a4b-2f2f-37c5-88fa-24e11ac21cac@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxmtAS9qBfy5YEAA--.4195S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGF13AFy5Xw17CF1DXFW5ZFb_yoW5XFyDp3
        4DA3ZFkFs8WFyUCF1ktw18XFyUJFZ3tFykZry2qw48u3s0gw1a9FyfKryFga4xuFn5Ka4j
        qryUCFykCFZ8uFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JU-J5rUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/03/2020 01:28 PM, Jiaxun Yang wrote:
>
>
> 在 2020/11/3 11:15, Tiezhu Yang 写道:
>> In loongson3_type3_play_dead(), in order to make sure the PC address is
>> correct, use lw to read the low 32 bits first, if the result is not 
>> zero,
>> then use ld to read the whole 64 bits, otherwise there maybe exists 
>> atomic
>> problem due to write high 32 bits first and then low 32 bits, like this:
>>
>> high 32 bits (write done)
>>                                    -- only read high 32-bits which is 
>> wrong
>> low 32 bits (not yet write done)
>>
>> This problem is especially for Loongson 3A4000+ CPU due to using 
>> Mail_Send
>> register which can only send 32 bits data one time. Although it is 
>> hard to
>> reproduce, we can do something at the software level to avoid the 
>> risks for
>> 3A4000+ CPU, this change has no influence on the other Loongson CPUs.
>>
>> Signed-off-by: Lu Zeng <zenglu@loongson.cn>
>> Signed-off-by: Jun Yi <yijun@loongson.cn>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> Hi Tiezhu,
>
> Sorry that I didn't look this patch carefully in previous rev, here's 
> my comments,
>
> Firstly the commit message and code comment looks bogus...
>
> I'd prefer

Hi Jiaxun,

Thanks for your detail review, it looks better.
Let me update it and then send v3.

Thanks,
Tiezhu

>
> ---
> MIPS: Loongson64: SMP: Fix up play_dead jump indicator
>
> In play_dead function, the whole 64-bit PC mailbox was used as a 
> indicator
> to determine if the master core had written boot jump information.
>
> However, after we introduced CSR mailsend, the 64-bit PC mailbox won't be
> written atomicly. Thus we have to use the lower 32-bit, which will be 
> written at
> the last, as the jump indicator instead.
> -- 
>
> Thanks.
>
>> ---
>>
>> v2: No changes
>>
>>   arch/mips/loongson64/smp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
>> index 736e98d..e32b46e 100644
>> --- a/arch/mips/loongson64/smp.c
>> +++ b/arch/mips/loongson64/smp.c
>> @@ -764,9 +764,10 @@ static void loongson3_type3_play_dead(int 
>> *state_addr)
>>           "1: li    %[count], 0x100             \n" /* wait for init 
>> loop */
>>           "2: bnez  %[count], 2b                \n" /* limit mailbox 
>> access */
>>           "   addiu %[count], -1                \n"
>> -        "   ld    %[initfunc], 0x20(%[base])  \n" /* get PC via 
>> mailbox */
>> +        "   lw    %[initfunc], 0x20(%[base])  \n" /* get PC (low 32 
>> bits) via mailbox */
>
> Here you can comment as "Check jump indicator (lower 32-bit of PC 
> mailbox)"
>
> Thanks.
>
> - Jiaxun
>>           "   beqz  %[initfunc], 1b             \n"
>>           "   nop                               \n"
>> +        "   ld    %[initfunc], 0x20(%[base])  \n" /* get PC (whole 
>> 64 bits) via mailbox */
>>           "   ld    $sp, 0x28(%[base])          \n" /* get SP via 
>> mailbox */
>>           "   ld    $gp, 0x30(%[base])          \n" /* get GP via 
>> mailbox */
>>           "   ld    $a1, 0x38(%[base])          \n"

