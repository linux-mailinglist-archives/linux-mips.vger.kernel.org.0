Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E6A1A4D84
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2020 04:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgDKCcM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Apr 2020 22:32:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50172 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726648AbgDKCcM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 10 Apr 2020 22:32:12 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf2kiLJFegGsmAA--.15S3;
        Sat, 11 Apr 2020 10:32:04 +0800 (CST)
Subject: Re: [PATCH v2] MIPS: Limit check_bugs32() to affected platform
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1586488859-18715-1-git-send-email-yangtiezhu@loongson.cn>
 <c60f62cb-62e8-be13-f551-c9a13abc7f94@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <181cf95e-c5f6-3899-e8eb-3f8847ec86d9@loongson.cn>
Date:   Sat, 11 Apr 2020 10:32:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <c60f62cb-62e8-be13-f551-c9a13abc7f94@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxf2kiLJFegGsmAA--.15S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy5Xry3Cr43GrWftFy3XFb_yoWrWr1xpF
        4Dtw4kXF4DuFyktFWFyr1kGrWYq34DGrZ0kryjgay8AF45XFs8GFn3Kr45Ar17ZrySga4r
        ua9aqr1ftr42yaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUbYhF7UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 04/11/2020 12:25 AM, Florian Fainelli wrote:
>
> On 4/9/2020 8:20 PM, Tiezhu Yang wrote:
>> In the current code, check_bugs32() only handles MIPS32 CPU type CPU_34K,
>> it is better to build and call it on the affected platform.
>>
>> Move check_bugs32() to the new added 34k-bugs32.c to indicate the fact that
>> the code is specific to the 34k CPU, and also add CONFIG_CPU_34K_BUGS32 to
>> control whether or not check the bugs.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> This is not a whole lot of code, so moving this to a separate
> translation unit seems a bit heavy handed, also file renames, albeit
> tracked properly by git are always a challenge when doing back ports.

Hi Florian,

There exists the following three ways to do it, I'm fine either way,
maybe the first way looks better. Let us wait for the MIPS maintainer
to say what he prefer.

Hi Thomas,

What is your opinion?

1 just use CONFIG_CPU_MIPS32_R2

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


2 add CONFIG_CPU_34K_BUGS32

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 797d7f1..e936e3c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2605,6 +2605,10 @@ config CPU_R4X00_BUGS64
         bool
         default y if SYS_HAS_CPU_R4X00 && 64BIT && (TARGET_ISA_REV < 1)

+config CPU_34K_BUGS32
+       bool
+       default y if CPU_MIPS32_R2
+
  config MIPS_ASID_SHIFT
         int
         default 6 if CPU_R3000 || CPU_TX39XX
diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index d72dc6e..bbf843a 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -35,7 +35,9 @@ static inline void check_bugs(void)
         unsigned int cpu = smp_processor_id();

         cpu_data[cpu].udelay_val = loops_per_jiffy;
-       check_bugs32();
+
+       if (IS_ENABLED(CONFIG_CPU_34K_BUGS32))
+               check_bugs32();

         if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
                 check_bugs64();
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6ab6b03..670bc7c 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -461,7 +461,8 @@ static inline void cpu_set_mt_per_tc_perf(struct 
cpuinfo_mips *c)
                 c->options |= MIPS_CPU_MT_PER_TC_PERF_COUNTERS;
  }

-static inline void check_errata(void)
+#ifdef CONFIG_CPU_34K_BUGS32
+static inline void check_errata32(void)
  {
         struct cpuinfo_mips *c = &current_cpu_data;

@@ -482,8 +483,9 @@ static inline void check_errata(void)

  void __init check_bugs32(void)
  {
-       check_errata();
+       check_errata32();
  }
+#endif /* CONFIG_CPU_34K_BUGS32 */

  /*
   * Probe whether cpu has config register by trying to play with


3 add new 34k-bugs32.c and CONFIG_CPU_34K_BUGS32

just as this v2 patch:
https://lore.kernel.org/patchwork/patch/1222273/

Thanks,

Tiezhu Yang

