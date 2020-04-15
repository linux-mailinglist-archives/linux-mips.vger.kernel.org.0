Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4921A909E
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 03:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387789AbgDOBsk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Apr 2020 21:48:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44796 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387766AbgDOBsi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Apr 2020 21:48:38 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv97uZ5ZehAIoAA--.9S3;
        Wed, 15 Apr 2020 09:48:32 +0800 (CST)
Subject: Re: [PATCH v2] MIPS: Limit check_bugs32() to affected platform
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1586488859-18715-1-git-send-email-yangtiezhu@loongson.cn>
 <c60f62cb-62e8-be13-f551-c9a13abc7f94@gmail.com>
 <181cf95e-c5f6-3899-e8eb-3f8847ec86d9@loongson.cn>
 <20200414173208.GA22802@alpha.franken.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5e575f15-4efc-7bf7-e266-d01aca094bbc@loongson.cn>
Date:   Wed, 15 Apr 2020 09:48:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200414173208.GA22802@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxv97uZ5ZehAIoAA--.9S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWw4rGw1xKr17Zw4fGrWkXrb_yoW5Xr1fpF
        Wqga1vqF4kCFyjyFySyw4kXryrt34DGrs8WryjgFW8AF1YqFn8GFn5Kr45CF97XFySqa4I
        9FZ2qFySvr42yaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5W
        lkUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/15/2020 01:32 AM, Thomas Bogendoerfer wrote:
> On Sat, Apr 11, 2020 at 10:32:02AM +0800, Tiezhu Yang wrote:
>> On 04/11/2020 12:25 AM, Florian Fainelli wrote:
>>> On 4/9/2020 8:20 PM, Tiezhu Yang wrote:
>>>> In the current code, check_bugs32() only handles MIPS32 CPU type CPU_34K,
>>>> it is better to build and call it on the affected platform.
>>>>
>>>> Move check_bugs32() to the new added 34k-bugs32.c to indicate the fact that
>>>> the code is specific to the 34k CPU, and also add CONFIG_CPU_34K_BUGS32 to
>>>> control whether or not check the bugs.
>>>>
>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>> This is not a whole lot of code, so moving this to a separate
>>> translation unit seems a bit heavy handed, also file renames, albeit
>>> tracked properly by git are always a challenge when doing back ports.
>> Hi Florian,
>>
>> There exists the following three ways to do it, I'm fine either way,
>> maybe the first way looks better. Let us wait for the MIPS maintainer
>> to say what he prefer.
>>
>> Hi Thomas,
>>
>> What is your opinion?
> I don't see a reason for doing that at all. The 34K workaround is only
> compiled in if CONFIG_SYS_HAS_CPU_MIPS32_R2 is defined.

Hi Thomas,

Thanks for your reply. My initial thought is to build and call check_bugs32() only for 34K CPU,
because it is useless for other CPU types.

Do you mean to use the following modification?

diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index d72dc6e..743604f 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -35,7 +35,9 @@ static inline void check_bugs(void)
          unsigned int cpu = smp_processor_id();

          cpu_data[cpu].udelay_val = loops_per_jiffy;
-       check_bugs32();
+
+       if (IS_ENABLED(CONFIG_CPU_MIPS32_R2))
+               check_bugs32();

          if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
                  check_bugs64();
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6ab6b03..383500b 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -461,7 +461,8 @@ static inline void cpu_set_mt_per_tc_perf(struct
cpuinfo_mips *c)
                  c->options |= MIPS_CPU_MT_PER_TC_PERF_COUNTERS;
   }

-static inline void check_errata(void)
+#ifdef CONFIG_CPU_MIPS32_R2
+static inline void check_errata32(void)
   {
          struct cpuinfo_mips *c = &current_cpu_data;

@@ -482,8 +483,9 @@ static inline void check_errata(void)

   void __init check_bugs32(void)
   {
-       check_errata();
+       check_errata32();
   }
+#endif /* CONFIG_CPU_MIPS32_R2 */

   /*
    * Probe whether cpu has config register by trying to play with


Thanks,

Tiezhu Yang


>
> Thomas.
>

