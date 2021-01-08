Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1CAD2EF070
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 11:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbhAHKIl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 05:08:41 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44520 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726795AbhAHKIl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 05:08:41 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx6L3rLvhf5S4BAA--.2716S3;
        Fri, 08 Jan 2021 18:07:40 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
 <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn>
 <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
 <20210107172620.GA13201@alpha.franken.de>
Cc:     Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>
Message-ID: <1085845b-2c5a-dbb6-62b7-28b55aeacb4c@loongson.cn>
Date:   Fri, 8 Jan 2021 18:07:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210107172620.GA13201@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx6L3rLvhf5S4BAA--.2716S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr47Ar1UtryftryrGrW5GFg_yoW8uF18pa
        15Ca15AF4kCF12yw1qywsrAayFv345WrW5KFyDKr98X3s0qF1Ygr4jvF1I9rn7AFWFgw42
        vrWjqa1a93yYvFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr4
        1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
        67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
        8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
        wI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On 01/08/2021 01:26 AM, Thomas Bogendoerfer wrote:
>>>> --- a/arch/mips/kernel/relocate_kernel.S
>>>> +++ b/arch/mips/kernel/relocate_kernel.S
>>>> @@ -6,6 +6,7 @@
>>>>
>>>>    #include <asm/asm.h>
>>>>    #include <asm/asmmacro.h>
>>>> +#include <asm/cpu.h>
>>>>    #include <asm/regdef.h>
>>>>    #include <asm/mipsregs.h>
>>>>    #include <asm/stackframe.h>
>>>> @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
>>>>    #else
>>>>        sync
>>>>    #endif
>>>> +
>>>> +#ifdef CONFIG_CPU_LOONGSON64
> Is there a reason why you can't use the already existing infrastructure
> the way cavium-octeon is doing it ? If you can't please explain why
> so we can find a way to extend it. But having some sort of poking
> loongson registers in generic MIPS code is a non starter.
>
> Thomas.
>

Unlike the cavium-octeon platform, the Loongson64 platform needs some 
changes. Before the kernel starts, (before entering the kernel_entry), 
each CPU has its own state (the SMP system). For Loongson64, only the 
boot CPU will enter the kernel_entry, and other CPUs will query their 
mailbox value in a loop. This is what the BIOS does for the CPU. Here is 
different from cavium-octeon. All CPUs will enter the kernel_entry on 
cavium-octeon platform. Then the kernel_entry_setup, the co-CPUs will 
enter the query loop. I saw the kernel_entry_setup of other platforms, 
such as ip27, malta, and generic. They are not like cavium-octeon and 
the co-CPUs entering the loop may be earlier than entering kernel_entry. 
So I have reason to guess that most SMP system platform CPUs are similar 
to Loongson64.

relocate_kernel.S is like BIOS doing s omething for the CPU. It allows 
the boot CPU to start from the new kernel_entry and makes the co-CPUs 
enter a loop. The already existing infrastructure may be more suitable 
for non-smp platforms. Although we can do something with 
plat_smp_ops.kexec_nonboot_cpu, more new problems will arise in that 
case. The kexec process actually runs on a copy of relocate_kernel.S, 
which will bring a lot of problems...

Above all just my personal thoughts.

Thanks,
Jinyang

