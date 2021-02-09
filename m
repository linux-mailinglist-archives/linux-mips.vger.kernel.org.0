Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC52314FD1
	for <lists+linux-mips@lfdr.de>; Tue,  9 Feb 2021 14:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhBINKp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Feb 2021 08:10:45 -0500
Received: from mail.loongson.cn ([114.242.206.163]:48238 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230288AbhBINKn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Feb 2021 08:10:43 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOdagiSJgu5wIAA--.12292S3;
        Tue, 09 Feb 2021 21:09:53 +0800 (CST)
Subject: Re: [PATCH v2] MIPS: Make check condition for SDBBP consistent with
 EJTAG spec
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1612847125-3141-1-git-send-email-yangtiezhu@loongson.cn>
 <20210209121124.GA11134@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <03fcfc00-acdd-a949-046c-3002195d6024@loongson.cn>
Date:   Tue, 9 Feb 2021 21:09:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210209121124.GA11134@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxOdagiSJgu5wIAA--.12292S3
X-Coremail-Antispam: 1UD129KBjvJXoW7urWrKFWfXw1UXFW3Cr4Uurg_yoW8Zr1fpw
        4DC3WkCF40gryUZayjyws5ur13Xws8KrWa9FyDK3yIva4jgF1rKr4kKry5Kry0gF4qka10
        gFWYgr1DZr4IvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUnF4_UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02/09/2021 08:11 PM, Thomas Bogendoerfer wrote:
> On Tue, Feb 09, 2021 at 01:05:25PM +0800, Tiezhu Yang wrote:
>> According to MIPS EJTAG Specification [1], a Debug Breakpoint
>> exception occurs when an SDBBP instruction is executed, the
>> CP0_DEBUG bit DBp indicates that a Debug Breakpoint exception
>> occurred, just check bit DBp for SDBBP is more accurate.
>>
>> [1] http://www.t-es-t.hu/download/mips/md00047f.pdf
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
>> v2: add MIPS_DEBUG_DBP definition
>>
>>   arch/mips/include/asm/mipsregs.h | 4 ++++
>>   arch/mips/kernel/genex.S         | 4 ++--
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
>> index a0e8ae5..9c8099a 100644
>> --- a/arch/mips/include/asm/mipsregs.h
>> +++ b/arch/mips/include/asm/mipsregs.h
>> @@ -1085,6 +1085,10 @@
>>   #define CVMVMCONF_RMMUSIZEM1_S	0
>>   #define CVMVMCONF_RMMUSIZEM1	(_U64CAST_(0xff) << CVMVMCONF_RMMUSIZEM1_S)
>>   
>> +/* Debug register field definitions */
>> +#define MIPS_DEBUG_DBP_SHIFT	1
>> +#define MIPS_DEBUG_DBP		(_ULCAST_(1) << MIPS_DEBUG_DBP_SHIFT)
>> +
>>   /*
>>    * Coprocessor 1 (FPU) register names
>>    */
>> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
>> index bcce32a..743d759 100644
>> --- a/arch/mips/kernel/genex.S
>> +++ b/arch/mips/kernel/genex.S
>> @@ -349,8 +349,8 @@ NESTED(ejtag_debug_handler, PT_SIZE, sp)
>>   	MTC0	k0, CP0_DESAVE
>>   	mfc0	k0, CP0_DEBUG
>>   
>> -	sll	k0, k0, 30	# Check for SDBBP.
>> -	bgez	k0, ejtag_return
>> +	andi	k0, k0, MIPS_DEBUG_DBP	# Check for SDBBP.
>> +	beqz	k0, ejtag_return
> IMHO both implementations are doing the same thing.

When I read the original code, it looks a little confusing
at first glance, the initial aim of this patch is to make the code
more readable and easier to understand.

>
> Thomas.
>

