Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58CBF18112A
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 07:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgCKGxf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 02:53:35 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17815 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726672AbgCKGxf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 02:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1583909583;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=MHiJLCTzz50LY8BgWXKkGI2BE/uVvyjTTnm31cqUylc=;
        b=JaYyyX85+xdgot20QrMd+s71+6syAGX3Iife7d92F2iUShP5wwFh3JioD8j/3KHE
        d9BsTxEJfXCqED1qGoZwklvzyxrzqnFY0CfyXEHmFX6dyQ4jv7A/6+x1YhDuSi7AzgN
        GsY3pbaoYj5U5eMhtefG9rT2QsTxaPCCtO2Pfy+I=
Received: from mail.baihui.com by mx.zoho.com.cn
        with SMTP id 1583909581810586.3916092202463; Wed, 11 Mar 2020 14:53:01 +0800 (CST)
Date:   Wed, 11 Mar 2020 14:53:01 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     "Tiezhu Yang" <yangtiezhu@loongson.cn>
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Huacai Chen" <chenhc@lemote.com>,
        "linux-mips" <linux-mips@vger.kernel.org>,
        "linux-kernel" <linux-kernel@vger.kernel.org>,
        "Xuefeng Li" <lixuefeng@loongson.cn>
Message-ID: <170c85e33ef.10e7ed4c64871.7120630740497911364@flygoat.com>
In-Reply-To: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
References: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
Subject: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:[PATCH]_MIPS:_Loongson:_Ad?=
 =?UTF-8?Q?d_model_name_to_/proc/cpuinfo?=
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Priority: Medium
User-Agent: ZohoCN Mail
X-Mailer: ZohoCN Mail
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



 ---- =E5=9C=A8 =E6=98=9F=E6=9C=9F=E4=B8=89, 2020-03-11 14:33:34 Tiezhu Yan=
g <yangtiezhu@loongson.cn> =E6=92=B0=E5=86=99 ----
 > In the current code, when execute command "cat /proc/cpuinfo" or "lscpu"=
,
 > it can not get cpu type and frequency directly because the model name is
 > not exist, so add it.
 >=20
 > E.g. without this patch:
 >=20
 > [loongson@localhost ~]$ lscpu
 > Architecture:          mips64
 > Byte Order:            Little Endian
 > CPU(s):                4
 > On-line CPU(s) list:   0-3
 > Thread(s) per core:    1
 > Core(s) per socket:    4
 > Socket(s):             1
 > NUMA node(s):          1
 > L1d cache:             64K
 > L1i cache:             64K
 > L2 cache:              2048K
 > NUMA node0 CPU(s):     0-3
 >=20
 > With this patch:
 >=20
 > [loongson@localhost ~]$ lscpu
 > Architecture:          mips64
 > Byte Order:            Little Endian
 > CPU(s):                4
 > On-line CPU(s) list:   0-3
 > Thread(s) per core:    1
 > Core(s) per socket:    4
 > Socket(s):             1
 > NUMA node(s):          1
 > Model name:            Loongson-3A R3 (Loongson-3A3000) @ 1449MHz
 > L1d cache:             64K
 > L1i cache:             64K
 > L2 cache:              2048K
 > NUMA node0 CPU(s):     0-3

Hi Tiezhu,

Thanks for your patch, you're the successor of Huacai:

https://www.linux-mips.org/archives/linux-mips/2018-09/msg00113.html

I think it's worthy to have this string in cpuinfo as many userspace
program is parsing it beacuse x86 have it.=20

See my review comments below:

 >=20
 > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
 > ---
 >  arch/mips/include/asm/cpu-info.h |  1 +
 >  arch/mips/kernel/cpu-probe.c     | 27 +++++++++++++++++++++++----
 >  arch/mips/kernel/proc.c          |  4 ++++
 >  3 files changed, 28 insertions(+), 4 deletions(-)
 >=20
 > diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cp=
u-info.h
 > index ed7ffe4..50e924e 100644
 > --- a/arch/mips/include/asm/cpu-info.h
 > +++ b/arch/mips/include/asm/cpu-info.h
 > @@ -115,6 +115,7 @@ extern struct cpuinfo_mips cpu_data[];
 >  extern void cpu_probe(void);
 >  extern void cpu_report(void);
 > =20
 > +extern const char *__model_name[];
 >  extern const char *__cpu_name[];
 >  #define cpu_name_string()    __cpu_name[raw_smp_processor_id()]
 > =20
 > diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
 > index 6ab6b03..3ae40cc 100644
 > --- a/arch/mips/kernel/cpu-probe.c
 > +++ b/arch/mips/kernel/cpu-probe.c
 > @@ -1548,6 +1548,7 @@ static inline void cpu_probe_legacy(struct cpuinfo=
_mips *c, unsigned int cpu)
 >              set_elf_platform(cpu, "loongson2e");
 >              set_isa(c, MIPS_CPU_ISA_III);
 >              c->fpu_msk31 |=3D FPU_CSR_CONDX;
 > +            __model_name[cpu] =3D "Loongson-2E";
 >              break;
 >          case PRID_REV_LOONGSON2F:
 >              c->cputype =3D CPU_LOONGSON2EF;
 > @@ -1555,23 +1556,37 @@ static inline void cpu_probe_legacy(struct cpuin=
fo_mips *c, unsigned int cpu)
 >              set_elf_platform(cpu, "loongson2f");
 >              set_isa(c, MIPS_CPU_ISA_III);
 >              c->fpu_msk31 |=3D FPU_CSR_CONDX;
 > +            __model_name[cpu] =3D "Loongson-2F";
 >              break;
 >          case PRID_REV_LOONGSON3A_R1:
 >              c->cputype =3D CPU_LOONGSON64;
 >              __cpu_name[cpu] =3D "ICT Loongson-3";
 >              set_elf_platform(cpu, "loongson3a");
 >              set_isa(c, MIPS_CPU_ISA_M64R1);
 > -            c->ases |=3D (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM=
 |
 > -                MIPS_ASE_LOONGSON_EXT);
 > +            c->ases |=3D (MIPS_ASE_LOONGSON_MMI |
 > +                    MIPS_ASE_LOONGSON_CAM |
 > +                    MIPS_ASE_LOONGSON_EXT);

Is the newline intentional?
Also applied to code below.

 > +            __model_name[cpu] =3D "Loongson-3A R1 (Loongson-3A1000)";
 >              break;
 >          case PRID_REV_LOONGSON3B_R1:
 > +            c->cputype =3D CPU_LOONGSON64;
 > +            __cpu_name[cpu] =3D "ICT Loongson-3";
 > +            set_elf_platform(cpu, "loongson3b");
 > +            set_isa(c, MIPS_CPU_ISA_M64R1);
 > +            c->ases |=3D (MIPS_ASE_LOONGSON_MMI |
 > +                    MIPS_ASE_LOONGSON_CAM |
 > +                    MIPS_ASE_LOONGSON_EXT);
 > +            __model_name[cpu] =3D "Loongson-3B R1 (Loongson-3B1000)";
 > +            break;
 >          case PRID_REV_LOONGSON3B_R2:
 >              c->cputype =3D CPU_LOONGSON64;
 >              __cpu_name[cpu] =3D "ICT Loongson-3";
 >              set_elf_platform(cpu, "loongson3b");
 >              set_isa(c, MIPS_CPU_ISA_M64R1);
 > -            c->ases |=3D (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM=
 |
 > -                MIPS_ASE_LOONGSON_EXT);
 > +            c->ases |=3D (MIPS_ASE_LOONGSON_MMI |
 > +                    MIPS_ASE_LOONGSON_CAM |
 > +                    MIPS_ASE_LOONGSON_EXT);
 > +            __model_name[cpu] =3D "Loongson-3B R2 (Loongson-3B1500)";
 >              break;
 >          }
 > =20
 > @@ -1926,6 +1941,7 @@ static inline void cpu_probe_loongson(struct cpuin=
fo_mips *c, unsigned int cpu)
 >              __cpu_name[cpu] =3D "ICT Loongson-3";
 >              set_elf_platform(cpu, "loongson3a");
 >              set_isa(c, MIPS_CPU_ISA_M64R2);
 > +            __model_name[cpu] =3D "Loongson-3A R2 (Loongson-3A2000)";
 >              break;
 >          case PRID_REV_LOONGSON3A_R3_0:
 >          case PRID_REV_LOONGSON3A_R3_1:
 > @@ -1933,6 +1949,7 @@ static inline void cpu_probe_loongson(struct cpuin=
fo_mips *c, unsigned int cpu)
 >              __cpu_name[cpu] =3D "ICT Loongson-3";
 >              set_elf_platform(cpu, "loongson3a");
 >              set_isa(c, MIPS_CPU_ISA_M64R2);
 > +            __model_name[cpu] =3D "Loongson-3A R3 (Loongson-3A3000)";
 >              break;
 >          }
 > =20
 > @@ -1952,6 +1969,7 @@ static inline void cpu_probe_loongson(struct cpuin=
fo_mips *c, unsigned int cpu)
 >          c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
 >          c->ases |=3D (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 >              MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
 > +        __model_name[cpu] =3D "Loongson-3A R4 (Loongson-3A4000)";
 >          break;
 >      default:
 >          panic("Unknown Loongson Processor ID!");
 > @@ -2111,6 +2129,7 @@ u64 __ua_limit;
 >  EXPORT_SYMBOL(__ua_limit);
 >  #endif
 > =20
 > +const char *__model_name[NR_CPUS];
 >  const char *__cpu_name[NR_CPUS];
 >  const char *__elf_platform;
 > =20
 > diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
 > index f8d3671..5fc74e6 100644
 > --- a/arch/mips/kernel/proc.c
 > +++ b/arch/mips/kernel/proc.c
 > @@ -15,6 +15,7 @@
 >  #include <asm/mipsregs.h>
 >  #include <asm/processor.h>
 >  #include <asm/prom.h>
 > +#include <asm/time.h>
 > =20
 >  unsigned int vced_count, vcei_count;
 > =20
 > @@ -63,6 +64,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 >      seq_printf(m, fmt, __cpu_name[n],
 >                (version >> 4) & 0x0f, version & 0x0f,
 >                (fp_vers >> 4) & 0x0f, fp_vers & 0x0f);
 > +    if (__model_name[n])
 > +        seq_printf(m, "model name\t\t: %s @ %uMHz\n",
 > +              __model_name[n], mips_hpt_frequency / 500000);
 >      seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",

Actually I don't think take mips_hpt_frequency here is a good option. mips_=
hpt_frequency
is used by cevt-r4k. Processors like Ingenic don't use cevt-r4k don't have =
it.

Probably you can do as what Huacai did, append the frequency part in platfo=
rm code.=20
=20
>                cpu_data[n].udelay_val / (500000/HZ),
 >                (cpu_data[n].udelay_val / (5000/HZ)) % 100);
 > --=20
 > 2.1.0
 >=20
 >=20

Thanks.

--
Jiaxun Yang
