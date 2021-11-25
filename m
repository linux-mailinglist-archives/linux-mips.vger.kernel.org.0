Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E985845D94E
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 12:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236316AbhKYLh4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 06:37:56 -0500
Received: from mail.loongson.cn ([114.242.206.163]:43842 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234012AbhKYLfx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 06:35:53 -0500
Received: from [10.130.0.135] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKNJXdJ9h2lkBAA--.3371S3;
        Thu, 25 Nov 2021 19:32:40 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix using smp_processor_id() in preemptible in
 show_cpuinfo()
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1637576257-11590-1-git-send-email-yangtiezhu@loongson.cn>
 <20211125093420.GB6537@alpha.franken.de>
Cc:     Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a1e676b3-ed43-9886-7803-9733653fb685@loongson.cn>
Date:   Thu, 25 Nov 2021 19:32:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20211125093420.GB6537@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxKNJXdJ9h2lkBAA--.3371S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur13CF47GrWfurWrZF15XFb_yoW8KF15pa
        ykAa1rKw4jgw1UXayftrsagryrXFs8Za4IkFWxt3yfZ3WjkF1kXrn2qr4fWFyqqr4UK3WI
        gF9rXFs0q348AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUsZ2-UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/25/2021 05:34 PM, Thomas Bogendoerfer wrote:
> On Mon, Nov 22, 2021 at 06:17:37PM +0800, Tiezhu Yang wrote:
>> There exists the following issue under DEBUG_PREEMPT:
>>
>>  BUG: using smp_processor_id() in preemptible [00000000] code: systemd/1
>>  caller is show_cpuinfo+0x460/0xea0
>>  ...
>>  Call Trace:
>>  [<ffffffff8020f0dc>] show_stack+0x94/0x128
>>  [<ffffffff80e6cab4>] dump_stack_lvl+0x94/0xd8
>>  [<ffffffff80e74c5c>] check_preemption_disabled+0x104/0x110
>>  [<ffffffff802209c8>] show_cpuinfo+0x460/0xea0
>>  [<ffffffff80539d54>] seq_read_iter+0xfc/0x4f8
>>  [<ffffffff804fcc10>] new_sync_read+0x110/0x1b8
>>  [<ffffffff804ff57c>] vfs_read+0x1b4/0x1d0
>>  [<ffffffff804ffb18>] ksys_read+0xd0/0x110
>>  [<ffffffff8021c090>] syscall_common+0x34/0x58
>>
>> We can see the following call trace:
>>  show_cpuinfo()
>>    cpu_has_fpu
>>      current_cpu_data
>>        smp_processor_id()
>>
>>  $ addr2line -f -e vmlinux 0xffffffff802209c8
>>  show_cpuinfo
>>  arch/mips/kernel/proc.c:188
>>
>>  $ head -188 arch/mips/kernel/proc.c | tail -1
>> 	 if (cpu_has_fpu)
>>
>>  arch/mips/include/asm/cpu-features.h
>>  #  define cpu_has_fpu		(current_cpu_data.options & MIPS_CPU_FPU)
>>
>>  arch/mips/include/asm/cpu-info.h
>>  #define current_cpu_data cpu_data[smp_processor_id()]
>>
>> Based on the above analysis, fix the issue by disabling preemption
>> around cpu_has_fpu in show_cpuinfo().
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>
> missing
>
> Fixes: 626bfa037299 ("MIPS: kernel: proc: add CPU option reporting")

Thank you, will add in v2.

>
>> ---
>>  arch/mips/kernel/proc.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
>> index 376a6e2..c6c2661 100644
>> --- a/arch/mips/kernel/proc.c
>> +++ b/arch/mips/kernel/proc.c
>> @@ -185,8 +185,10 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>>  		seq_puts(m, " tx39_cache");
>>  	if (cpu_has_octeon_cache)
>>  		seq_puts(m, " octeon_cache");
>> +	preempt_disable();
>>  	if (cpu_has_fpu)
>>  		seq_puts(m, " fpu");
>> +	preempt_enable();
>
> what about using raw_cpu_has_fpu() instead ?

OK, no problem, using raw_cpu_has_fpu can also fix the issue and looks 
better, I will send v2 soon.

Thanks,
Tiezhu

>
> Thomas.
>

