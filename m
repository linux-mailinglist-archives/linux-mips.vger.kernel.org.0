Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F211811BB
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 08:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgCKHTP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 03:19:15 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:35031 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbgCKHTM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 03:19:12 -0400
Received: by mail-qt1-f194.google.com with SMTP id v15so847295qto.2;
        Wed, 11 Mar 2020 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fv93g6bLZJ9hcIjj8KHilftGqa92u3FGGi90fgaWyFg=;
        b=jc6Cgd+vSI20O0LC/SHZw2RNb519+zDYkF0tiJHxUHlMad6r5V7jbTs9FBhgktEsji
         m1Jl5aBkHvO5mSop6LFSrK4XoJRKwVbd9ABtYwyEzc7+lip+jJP6CV2U0wRHrFLKM6Rv
         t0WWIsh8ysv1DzOGxObXmGqW6s6AbQ9DlqRUsZ6F3vCG9mWtQ7daAUaBAGqck7XZs9c6
         lE81Ncl1C7hZh+WivnhCUxYmrL5EPRnHHnm9FOvqJ66o++V7E/rrHrQ6Isfv6dchIdjT
         /4BtZZze2nHj5jpcqU150gCPeR3w/IFUp09t5xjUi1qlQFdtBIWVo1V28Tg3yuXOs9/O
         f6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fv93g6bLZJ9hcIjj8KHilftGqa92u3FGGi90fgaWyFg=;
        b=iVduetHM/Ir1rY4BQFPOSQwuAFPvXEf7i3+sfa7OakLQ5wSexlctC3HiOL6S1hfdBI
         MmPRkIXxE5Krlx/ilRMbjiPv5gXPHpjvYNZIrWQZQ+LiXtcl65FgbN8Q7H6BxGcPn5nd
         tbPTWb8Gig/HNZsvRFS863U4VrrXqtdXWk2t7zOZcq8ycIg3mJwPDdWrctGd4PYzYhYx
         UFcJTNxYPaTk8vroQN5AtVSOQ66dBhQU8cLBFmYykmfVi9iBUGWqbEkVCDdozr+yy5OU
         yT+7KDtAfhTV5q4N6Dj6sL5ZlXl5MytEq1rp0gXSe0ZD5rEg/iJnmb2dsC8LL0ztmVIT
         TmWA==
X-Gm-Message-State: ANhLgQ1yd/7TpSScoFBoIaTo0FjgNIbOGkOm3g2JgI98g2GUhR6skt97
        0LknVmEWeX8NW1hqMJPssjlIpOFzS9TDhCMaTpinqw==
X-Google-Smtp-Source: ADFU+vuEhU337Xo+/6npCg/hVG3gkrjsffcGtWlh2AikO6ogoeRqZkNQZhgOYtFg+dOcUSIfKACH+QN7Sk/Y0xGG+Cs=
X-Received: by 2002:ac8:348f:: with SMTP id w15mr1431384qtb.219.1583911150210;
 Wed, 11 Mar 2020 00:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Wed, 11 Mar 2020 15:18:59 +0800
Message-ID: <CAKcpw6VBiFddr=QsB_HDYStX8Mh7=tf3B_onFDViAq8s_G0gbQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson: Add model name to /proc/cpuinfo
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tiezhu Yang <yangtiezhu@loongson.cn> =E4=BA=8E2020=E5=B9=B43=E6=9C=8811=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=882:33=E5=86=99=E9=81=93=EF=BC=9A
>
> In the current code, when execute command "cat /proc/cpuinfo" or "lscpu",
> it can not get cpu type and frequency directly because the model name is
> not exist, so add it.

You patch is almost the same with the previous Huacai's.
How do you think about the copyright issue?

FYI: GPL is copyleft instead of no-copyright-exists-at-all.
I have no idea about whether Loongson has any consideration about copyright=
,
while it is really quite important.

>
> E.g. without this patch:
>
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
>
> With this patch:
>
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
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/cpu-info.h |  1 +
>  arch/mips/kernel/cpu-probe.c     | 27 +++++++++++++++++++++++----
>  arch/mips/kernel/proc.c          |  4 ++++
>  3 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu=
-info.h
> index ed7ffe4..50e924e 100644
> --- a/arch/mips/include/asm/cpu-info.h
> +++ b/arch/mips/include/asm/cpu-info.h
> @@ -115,6 +115,7 @@ extern struct cpuinfo_mips cpu_data[];
>  extern void cpu_probe(void);
>  extern void cpu_report(void);
>
> +extern const char *__model_name[];
>  extern const char *__cpu_name[];
>  #define cpu_name_string()      __cpu_name[raw_smp_processor_id()]
>
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index 6ab6b03..3ae40cc 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1548,6 +1548,7 @@ static inline void cpu_probe_legacy(struct cpuinfo_=
mips *c, unsigned int cpu)
>                         set_elf_platform(cpu, "loongson2e");
>                         set_isa(c, MIPS_CPU_ISA_III);
>                         c->fpu_msk31 |=3D FPU_CSR_CONDX;
> +                       __model_name[cpu] =3D "Loongson-2E";
>                         break;
>                 case PRID_REV_LOONGSON2F:
>                         c->cputype =3D CPU_LOONGSON2EF;
> @@ -1555,23 +1556,37 @@ static inline void cpu_probe_legacy(struct cpuinf=
o_mips *c, unsigned int cpu)
>                         set_elf_platform(cpu, "loongson2f");
>                         set_isa(c, MIPS_CPU_ISA_III);
>                         c->fpu_msk31 |=3D FPU_CSR_CONDX;
> +                       __model_name[cpu] =3D "Loongson-2F";
>                         break;
>                 case PRID_REV_LOONGSON3A_R1:
>                         c->cputype =3D CPU_LOONGSON64;
>                         __cpu_name[cpu] =3D "ICT Loongson-3";
>                         set_elf_platform(cpu, "loongson3a");
>                         set_isa(c, MIPS_CPU_ISA_M64R1);
> -                       c->ases |=3D (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LO=
ONGSON_CAM |
> -                               MIPS_ASE_LOONGSON_EXT);
> +                       c->ases |=3D (MIPS_ASE_LOONGSON_MMI |
> +                                   MIPS_ASE_LOONGSON_CAM |
> +                                   MIPS_ASE_LOONGSON_EXT);
> +                       __model_name[cpu] =3D "Loongson-3A R1 (Loongson-3=
A1000)";
>                         break;
>                 case PRID_REV_LOONGSON3B_R1:
> +                       c->cputype =3D CPU_LOONGSON64;
> +                       __cpu_name[cpu] =3D "ICT Loongson-3";
> +                       set_elf_platform(cpu, "loongson3b");
> +                       set_isa(c, MIPS_CPU_ISA_M64R1);
> +                       c->ases |=3D (MIPS_ASE_LOONGSON_MMI |
> +                                   MIPS_ASE_LOONGSON_CAM |
> +                                   MIPS_ASE_LOONGSON_EXT);
> +                       __model_name[cpu] =3D "Loongson-3B R1 (Loongson-3=
B1000)";
> +                       break;
>                 case PRID_REV_LOONGSON3B_R2:
>                         c->cputype =3D CPU_LOONGSON64;
>                         __cpu_name[cpu] =3D "ICT Loongson-3";
>                         set_elf_platform(cpu, "loongson3b");
>                         set_isa(c, MIPS_CPU_ISA_M64R1);
> -                       c->ases |=3D (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LO=
ONGSON_CAM |
> -                               MIPS_ASE_LOONGSON_EXT);
> +                       c->ases |=3D (MIPS_ASE_LOONGSON_MMI |
> +                                   MIPS_ASE_LOONGSON_CAM |
> +                                   MIPS_ASE_LOONGSON_EXT);
> +                       __model_name[cpu] =3D "Loongson-3B R2 (Loongson-3=
B1500)";
>                         break;
>                 }
>
> @@ -1926,6 +1941,7 @@ static inline void cpu_probe_loongson(struct cpuinf=
o_mips *c, unsigned int cpu)
>                         __cpu_name[cpu] =3D "ICT Loongson-3";
>                         set_elf_platform(cpu, "loongson3a");
>                         set_isa(c, MIPS_CPU_ISA_M64R2);
> +                       __model_name[cpu] =3D "Loongson-3A R2 (Loongson-3=
A2000)";
>                         break;
>                 case PRID_REV_LOONGSON3A_R3_0:
>                 case PRID_REV_LOONGSON3A_R3_1:
> @@ -1933,6 +1949,7 @@ static inline void cpu_probe_loongson(struct cpuinf=
o_mips *c, unsigned int cpu)
>                         __cpu_name[cpu] =3D "ICT Loongson-3";
>                         set_elf_platform(cpu, "loongson3a");
>                         set_isa(c, MIPS_CPU_ISA_M64R2);
> +                       __model_name[cpu] =3D "Loongson-3A R3 (Loongson-3=
A3000)";
>                         break;
>                 }
>
> @@ -1952,6 +1969,7 @@ static inline void cpu_probe_loongson(struct cpuinf=
o_mips *c, unsigned int cpu)
>                 c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>                 c->ases |=3D (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_C=
AM |
>                         MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
> +               __model_name[cpu] =3D "Loongson-3A R4 (Loongson-3A4000)";
>                 break;
>         default:
>                 panic("Unknown Loongson Processor ID!");
> @@ -2111,6 +2129,7 @@ u64 __ua_limit;
>  EXPORT_SYMBOL(__ua_limit);
>  #endif
>
> +const char *__model_name[NR_CPUS];
>  const char *__cpu_name[NR_CPUS];
>  const char *__elf_platform;
>
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index f8d3671..5fc74e6 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -15,6 +15,7 @@
>  #include <asm/mipsregs.h>
>  #include <asm/processor.h>
>  #include <asm/prom.h>
> +#include <asm/time.h>
>
>  unsigned int vced_count, vcei_count;
>
> @@ -63,6 +64,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>         seq_printf(m, fmt, __cpu_name[n],
>                       (version >> 4) & 0x0f, version & 0x0f,
>                       (fp_vers >> 4) & 0x0f, fp_vers & 0x0f);
> +       if (__model_name[n])
> +               seq_printf(m, "model name\t\t: %s @ %uMHz\n",
> +                     __model_name[n], mips_hpt_frequency / 500000);
>         seq_printf(m, "BogoMIPS\t\t: %u.%02u\n",
>                       cpu_data[n].udelay_val / (500000/HZ),
>                       (cpu_data[n].udelay_val / (5000/HZ)) % 100);
> --
> 2.1.0
>


--=20
YunQiang Su
