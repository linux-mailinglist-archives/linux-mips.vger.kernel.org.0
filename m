Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBA11814CC
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 10:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgCKJ2N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 05:28:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38804 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726934AbgCKJ2M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 05:28:12 -0400
Received: from [10.130.0.70] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj2ggr2he_3sZAA--.31S3;
        Wed, 11 Mar 2020 17:28:01 +0800 (CST)
Subject: =?UTF-8?Q?Re:_=e5=9b=9e=e5=a4=8d:[PATCH]_MIPS:_Loongson:_Add_model_?=
 =?UTF-8?Q?name_to_/proc/cpuinfo?=
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
 <170c85e33ef.10e7ed4c64871.7120630740497911364@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <73820857-a9dd-0e5e-c3ee-fd63f4e5f10b@loongson.cn>
Date:   Wed, 11 Mar 2020 17:28:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <170c85e33ef.10e7ed4c64871.7120630740497911364@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj2ggr2he_3sZAA--.31S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtw4UZrWkWFW8GrWxJFWrXwb_yoWxtF45p3
        ykAan3Gr4xKryDGa4fJFyj9rWYvr13JFyv9ay5tFWUXasaq3W5J3s7tF15ArsFvF1qkw1f
        ZFZ29rsI9FWUZ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
        AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j
        6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUq38
        nUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/11/2020 02:53 PM, Jiaxun Yang wrote:
>
>   ---- 在 星期三, 2020-03-11 14:33:34 Tiezhu Yang <yangtiezhu@loongson.cn> 撰写 ----
>   > In the current code, when execute command "cat /proc/cpuinfo" or "lscpu",
>   > it can not get cpu type and frequency directly because the model name is
>   > not exist, so add it.
>   >
>   > E.g. without this patch:
>   >
>   > [loongson@localhost ~]$ lscpu
>   > Architecture:          mips64
>   > Byte Order:            Little Endian
>   > CPU(s):                4
>   > On-line CPU(s) list:   0-3
>   > Thread(s) per core:    1
>   > Core(s) per socket:    4
>   > Socket(s):             1
>   > NUMA node(s):          1
>   > L1d cache:             64K
>   > L1i cache:             64K
>   > L2 cache:              2048K
>   > NUMA node0 CPU(s):     0-3
>   >
>   > With this patch:
>   >
>   > [loongson@localhost ~]$ lscpu
>   > Architecture:          mips64
>   > Byte Order:            Little Endian
>   > CPU(s):                4
>   > On-line CPU(s) list:   0-3
>   > Thread(s) per core:    1
>   > Core(s) per socket:    4
>   > Socket(s):             1
>   > NUMA node(s):          1
>   > Model name:            Loongson-3A R3 (Loongson-3A3000) @ 1449MHz
>   > L1d cache:             64K
>   > L1i cache:             64K
>   > L2 cache:              2048K
>   > NUMA node0 CPU(s):     0-3
>
> Hi Tiezhu,
>
> Thanks for your patch, you're the successor of Huacai:
>
> https://www.linux-mips.org/archives/linux-mips/2018-09/msg00113.html
Hi Jiaxun,

Thanks for your notice.

>
> I think it's worthy to have this string in cpuinfo as many userspace
> program is parsing it beacuse x86 have it.
>
> See my review comments below:
>
>   >
>   > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>   > ---
>   >  arch/mips/include/asm/cpu-info.h |  1 +
>   >  arch/mips/kernel/cpu-probe.c     | 27 +++++++++++++++++++++++----
>   >  arch/mips/kernel/proc.c          |  4 ++++
>   >  3 files changed, 28 insertions(+), 4 deletions(-)
>   >
>   > diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
>   > index ed7ffe4..50e924e 100644
>   > --- a/arch/mips/include/asm/cpu-info.h
>   > +++ b/arch/mips/include/asm/cpu-info.h
>   > @@ -115,6 +115,7 @@ extern struct cpuinfo_mips cpu_data[];
>   >  extern void cpu_probe(void);
>   >  extern void cpu_report(void);
>   >
>   > +extern const char *__model_name[];
>   >  extern const char *__cpu_name[];
>   >  #define cpu_name_string()    __cpu_name[raw_smp_processor_id()]
>   >
>   > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
>   > index 6ab6b03..3ae40cc 100644
>   > --- a/arch/mips/kernel/cpu-probe.c
>   > +++ b/arch/mips/kernel/cpu-probe.c
>   > @@ -1548,6 +1548,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>   >              set_elf_platform(cpu, "loongson2e");
>   >              set_isa(c, MIPS_CPU_ISA_III);
>   >              c->fpu_msk31 |= FPU_CSR_CONDX;
>   > +            __model_name[cpu] = "Loongson-2E";
>   >              break;
>   >          case PRID_REV_LOONGSON2F:
>   >              c->cputype = CPU_LOONGSON2EF;
>   > @@ -1555,23 +1556,37 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
>   >              set_elf_platform(cpu, "loongson2f");
>   >              set_isa(c, MIPS_CPU_ISA_III);
>   >              c->fpu_msk31 |= FPU_CSR_CONDX;
>   > +            __model_name[cpu] = "Loongson-2F";
>   >              break;
>   >          case PRID_REV_LOONGSON3A_R1:
>   >              c->cputype = CPU_LOONGSON64;
>   >              __cpu_name[cpu] = "ICT Loongson-3";
>   >              set_elf_platform(cpu, "loongson3a");
>   >              set_isa(c, MIPS_CPU_ISA_M64R1);
>   > -            c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>   > -                MIPS_ASE_LOONGSON_EXT);
>   > +            c->ases |= (MIPS_ASE_LOONGSON_MMI |
>   > +                    MIPS_ASE_LOONGSON_CAM |
>   > +                    MIPS_ASE_LOONGSON_EXT);
>
> Is the newline intentional?
> Also applied to code below.

Yes, just fix the checkpatch.pl warning:

WARNING: line over 80 characters
#78: FILE: arch/mips/kernel/cpu-probe.c:1575:
+            c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |

>
>   > +            __model_name[cpu] = "Loongson-3A R1 (Loongson-3A1000)";
>   >              break;
>   >          case PRID_REV_LOONGSON3B_R1:
>   > +            c->cputype = CPU_LOONGSON64;
>   > +            __cpu_name[cpu] = "ICT Loongson-3";
>   > +            set_elf_platform(cpu, "loongson3b");
>   > +            set_isa(c, MIPS_CPU_ISA_M64R1);
>   > +            c->ases |= (MIPS_ASE_LOONGSON_MMI |
>   > +                    MIPS_ASE_LOONGSON_CAM |
>   > +                    MIPS_ASE_LOONGSON_EXT);
>   > +            __model_name[cpu] = "Loongson-3B R1 (Loongson-3B1000)";
>   > +            break;
>   >          case PRID_REV_LOONGSON3B_R2:
>   >              c->cputype = CPU_LOONGSON64;
>   >              __cpu_name[cpu] = "ICT Loongson-3";
>   >              set_elf_platform(cpu, "loongson3b");
>   >              set_isa(c, MIPS_CPU_ISA_M64R1);
>   > -            c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>   > -                MIPS_ASE_LOONGSON_EXT);
>   > +            c->ases |= (MIPS_ASE_LOONGSON_MMI |
>   > +                    MIPS_ASE_LOONGSON_CAM |
>   > +                    MIPS_ASE_LOONGSON_EXT);
>   > +            __model_name[cpu] = "Loongson-3B R2 (Loongson-3B1500)";
>   >              break;
>   >          }
>   >
>   > @@ -1926,6 +1941,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   >              __cpu_name[cpu] = "ICT Loongson-3";
>   >              set_elf_platform(cpu, "loongson3a");
>   >              set_isa(c, MIPS_CPU_ISA_M64R2);
>   > +            __model_name[cpu] = "Loongson-3A R2 (Loongson-3A2000)";
>   >              break;
>   >          case PRID_REV_LOONGSON3A_R3_0:
>   >          case PRID_REV_LOONGSON3A_R3_1:
>   > @@ -1933,6 +1949,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   >              __cpu_name[cpu] = "ICT Loongson-3";
>   >              set_elf_platform(cpu, "loongson3a");
>   >              set_isa(c, MIPS_CPU_ISA_M64R2);
>   > +            __model_name[cpu] = "Loongson-3A R3 (Loongson-3A3000)";
>   >              break;
>   >          }
>   >
>   > @@ -1952,6 +1969,7 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
>   >          c->writecombine = _CACHE_UNCACHED_ACCELERATED;
>   >          c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
>   >              MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
>   > +        __model_name[cpu] = "Loongson-3A R4 (Loongson-3A4000)";
>   >          break;
>   >      default:
>   >          panic("Unknown Loongson Processor ID!");
>   > @@ -2111,6 +2129,7 @@ u64 __ua_limit;
>   >  EXPORT_SYMBOL(__ua_limit);
>   >  #endif
>   >
>   > +const char *__model_name[NR_CPUS];
>   >  const char *__cpu_name[NR_CPUS];
>   >  const char *__elf_platform;
>   >
>   > diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
>   > index f8d3671..5fc74e6 100644
>   > --- a/arch/mips/kernel/proc.c
>   > +++ b/arch/mips/kernel/proc.c
>   > @@ -15,6 +15,7 @@
>   >  #include <asm/mipsregs.h>
>   >  #include <asm/processor.h>
>   >  #include <asm/prom.h>
>   > +#include <asm/time.h>
>   >
>   >  unsigned int vced_count, vcei_count;
>   >
>   > @@ -63,6 +64,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>   >      seq_printf(m, fmt, __cpu_name[n],
>   >                (version >> 4) & 0x0f, version & 0x0f,
>   >                (fp_vers >> 4) & 0x0f, fp_vers & 0x0f);
>   > +    if (__model_name[n])
>   > +        seq_printf(m, "model name\t\t: %s @ %uMHz\n",
>   > +              __model_name[n], mips_hpt_frequency / 500000);
>   >      seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",
>
> Actually I don't think take mips_hpt_frequency here is a good option. mips_hpt_frequency
> is used by cevt-r4k. Processors like Ingenic don't use cevt-r4k don't have it.
>
> Probably you can do as what Huacai did, append the frequency part in platform code.

OK, I will do it.

Thanks,

Tiezhu Yang

>   
>>                 cpu_data[n].udelay_val / (500000/HZ),
>   >                (cpu_data[n].udelay_val / (5000/HZ)) % 100);
>   > --
>   > 2.1.0
>   >
>   >
>
> Thanks.
>
> --
> Jiaxun Yang

