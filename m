Return-Path: <linux-mips+bounces-8872-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A33AA414F
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 05:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24F0A3ABE7E
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 03:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C0D156677;
	Wed, 30 Apr 2025 03:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpdJW4BF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588F313EFF3;
	Wed, 30 Apr 2025 03:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983270; cv=none; b=UwunrHL7ElzUlifj5jqwvfxABHH9WBtgs/me+6otPIvk0ouHr3iOJXyWFbEKbTOBLPL/Y/HRJdlG3QVqPGszUQ47QVUoFJY1u8RipMDu4jlGBAWjI+Cvuoq+4Vrjft8WsJpsImDmLcsGJ5I+LCwiM87IO2At+s8uULXd9MCcQ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983270; c=relaxed/simple;
	bh=fqtpLIfaSV68+Z4bZeGLwDBw2IlzZLrBnUX5Dy7nWEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMlgsh3M5PFGGvQuuKHREWs+mhO9uuVE7KduujjQ+1eBttbzGZX4RqUJc3aWtJiUvOscH2ucumtCCQPM30fnS/wIYnpXcRfvNpiFyHaoPVaVUj7BDz86bgaAPztgiGP66cRUh2K68/oV19mmzo4fqoucVQ3jcGvYDH5kDswDYow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpdJW4BF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCB3C4CEE9;
	Wed, 30 Apr 2025 03:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745983269;
	bh=fqtpLIfaSV68+Z4bZeGLwDBw2IlzZLrBnUX5Dy7nWEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WpdJW4BFewfo0SSV54c0oM7iT6O54l1uOL8W/y5QLV7EqW6kdeXWooAPQ9d9sqTKA
	 B8iD8qj/tZB3qW/hv07cWR/Y5v0eYXWHA46XcWSU4aGZZ9qMCoNuSJfIvUte1X/CtO
	 M1W/Xz3tanNaoyYe1Qbv9StOUV2vyQ3bqpONZZPTbUGoFiZhQxPYhdPchFO/LAAORe
	 RypJ5Y5CzFZZf2mEutRTxFhP5M48VnZbVapFuGfZN3ttpKSk3m9pmZ1IP2X+rSlZ3P
	 dcgcQFUtIpN48Fz6TJW+zmI7NaizyOrysnqxUM/Mxysm6t8EZSL+gbGyCKB+3RsZu4
	 axYeRcOzTAKJA==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2963dc379so1009949166b.2;
        Tue, 29 Apr 2025 20:21:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUba99hhDNY8TtRjTCK/uL4DDBCFgLqw8kx//itIXSdAhkh8rU5XX82wBpgTqcg9/507V1JfgW2FA236A==@vger.kernel.org, AJvYcCX4zJO3PLg1TTz4nLaER89JCHgvUEYK/Ln3vdCtCQBSWAwOFJ+I/u5eZzUC+hKpq1I4rGGGUiJi/FSdkrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAh6TjVl0ioQdF1cS9pu1uMAD+TibQMAOdnWa18vk6eT5SSgkR
	Lb8N1MJKr3uRGKCn9S3JEQEc+d40zKlD6nVyEkEHdxWJDUbYc4fwD1ouzkdGxqvWkWjXkxc3cmb
	Xh83R1zuMtg6Q6/4ztPEz8/bVQ8o=
X-Google-Smtp-Source: AGHT+IEDZJBGA8vgLOmB8IWPNSDfQhRf9lrgz50BhraB3zK1L9SO7z+pu8ZUd4hEgCfKUCKcwwQyTYVq5WIC2B6eHTU=
X-Received: by 2002:a17:907:9706:b0:ac4:3d8:2e90 with SMTP id
 a640c23a62f3a-acee21ac4f1mr79158066b.13.1745983268405; Tue, 29 Apr 2025
 20:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413-parallel-cpu-bringup-v1-1-a19d36ec229b@bootlin.com> <CAAhV-H6JSKwWvLwPSK7Bu6jZixRn4U+xtpxGL4KBtsmjhc3PVA@mail.gmail.com>
In-Reply-To: <CAAhV-H6JSKwWvLwPSK7Bu6jZixRn4U+xtpxGL4KBtsmjhc3PVA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Apr 2025 11:20:57 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6iOwoYCCob6TmFf1boKQHb0=Mim2bWFvZCMfi9Rw5FPQ@mail.gmail.com>
X-Gm-Features: ATxdqUHGmYHVFJsJa47tXPnjoJn-eb_GoIbtt1Pdpz9-0G0xB1AV7f02J5b0YB4
Message-ID: <CAAhV-H6iOwoYCCob6TmFf1boKQHb0=Mim2bWFvZCMfi9Rw5FPQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: SMP: Implement parallel CPU bring up for EyeQ
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Gregory,

On Sun, Apr 27, 2025 at 6:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Gregory and Thomas,
>
> I'm sorry I'm late, but I have some questions about this patch.
>
> On Mon, Apr 14, 2025 at 3:12=E2=80=AFAM Gregory CLEMENT
> <gregory.clement@bootlin.com> wrote:
> >
> > Added support for starting CPUs in parallel on EyeQ to speed up boot ti=
me.
> >
> > On EyeQ5, booting 8 CPUs is now ~90ms faster.
> > On EyeQ6, booting 32 CPUs is now ~650ms faster.
> >
> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> > ---
> > Hello,
> >
> > This patch allows CPUs to start in parallel. It has been tested on
> > EyeQ5 and EyeQ6, which are both MIPS64 and use the I6500 design. These
> > systems use CPS to support SMP.
> >
> > As noted in the commit log, on EyeQ6, booting 32 CPUs is now ~650ms
> > faster.
> >
> > Currently, this support is only for EyeQ SoC. However, it should also
> > work for other CPUs using CPS. I am less sure about MT ASE support,
> > but this patch can be a good starting point. If anyone wants to add
> > support for other systems, I can share some ideas, especially for the
> > MIPS_GENERIC setup that needs to handle both types of SMP setups.
> >
> > Gregory
> > ---
> >  arch/mips/Kconfig                |  2 ++
> >  arch/mips/include/asm/topology.h |  3 +++
> >  arch/mips/kernel/smp-cps.c       |  2 ++
> >  arch/mips/kernel/smp.c           | 18 ++++++++++++++++++
> >  4 files changed, 25 insertions(+)
> >
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index fc0772c1bad4ab736d440a18b972faf66a610783..e0e6ce2592b4168facf337b=
60fd889d76e81a407 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -617,6 +617,7 @@ config EYEQ
> >         select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
> >         select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
> >         select USE_OF
> > +       select HOTPLUG_PARALLEL if SMP
> >         help
> >           Select this to build a kernel supporting EyeQ SoC from Mobile=
ye.
> >
> > @@ -2287,6 +2288,7 @@ config MIPS_CPS
> >         select MIPS_CM
> >         select MIPS_CPS_PM if HOTPLUG_CPU
> >         select SMP
> > +       select HOTPLUG_SMT if HOTPLUG_PARALLEL
> >         select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
> >         select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
> >         select SYS_SUPPORTS_HOTPLUG_CPU
> > diff --git a/arch/mips/include/asm/topology.h b/arch/mips/include/asm/t=
opology.h
> > index 0673d2d0f2e6dd02ed14d650e5af7b8a3c162b6f..5158c802eb6574d292f6ad2=
512cc7772fece4aae 100644
> > --- a/arch/mips/include/asm/topology.h
> > +++ b/arch/mips/include/asm/topology.h
> > @@ -16,6 +16,9 @@
> >  #define topology_core_id(cpu)                  (cpu_core(&cpu_data[cpu=
]))
> >  #define topology_core_cpumask(cpu)             (&cpu_core_map[cpu])
> >  #define topology_sibling_cpumask(cpu)          (&cpu_sibling_map[cpu])
> > +
> > +extern struct cpumask __cpu_primary_thread_mask;
> > +#define cpu_primary_thread_mask ((const struct cpumask *)&__cpu_primar=
y_thread_mask)
> >  #endif
> >
> >  #endif /* __ASM_TOPOLOGY_H */
> > diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> > index e85bd087467e8caf0640ad247ee5f8eb65107591..02bbd7ecd1b9557003186b9=
d3d98ae17eac5eb9f 100644
> > --- a/arch/mips/kernel/smp-cps.c
> > +++ b/arch/mips/kernel/smp-cps.c
> > @@ -236,6 +236,7 @@ static void __init cps_smp_setup(void)
> >                         /* Use the number of VPEs in cluster 0 core 0 f=
or smp_num_siblings */
> >                         if (!cl && !c)
> >                                 smp_num_siblings =3D core_vpes;
> > +                       cpumask_set_cpu(nvpes, &__cpu_primary_thread_ma=
sk);
> >
> >                         for (v =3D 0; v < min_t(int, core_vpes, NR_CPUS=
 - nvpes); v++) {
> >                                 cpu_set_cluster(&cpu_data[nvpes + v], c=
l);
> > @@ -364,6 +365,7 @@ static void __init cps_prepare_cpus(unsigned int ma=
x_cpus)
> >         cl =3D cpu_cluster(&current_cpu_data);
> >         c =3D cpu_core(&current_cpu_data);
> >         cluster_bootcfg =3D &mips_cps_cluster_bootcfg[cl];
> > +       cpu_smt_set_num_threads(core_vpes, core_vpes);
> >         core_bootcfg =3D &cluster_bootcfg->core_config[c];
> >         bitmap_set(cluster_bootcfg->core_power, cpu_core(&current_cpu_d=
ata), 1);
> >         atomic_set(&core_bootcfg->vpe_mask, 1 << cpu_vpe_id(&current_cp=
u_data));
> > diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> > index 39e193cad2b9e4f877e920b71bbbb210e52607d0..1726744f2b2ec10a44420a7=
b9b9cd04f06c4d2f6 100644
> > --- a/arch/mips/kernel/smp.c
> > +++ b/arch/mips/kernel/smp.c
> > @@ -56,8 +56,10 @@ EXPORT_SYMBOL(cpu_sibling_map);
> >  cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
> >  EXPORT_SYMBOL(cpu_core_map);
> >
> > +#ifndef CONFIG_HOTPLUG_PARALLEL
> >  static DECLARE_COMPLETION(cpu_starting);
> >  static DECLARE_COMPLETION(cpu_running);
> > +#endif
> >
> >  /*
> >   * A logical cpu mask containing only one VPE per core to
> > @@ -74,6 +76,8 @@ static cpumask_t cpu_core_setup_map;
> >
> >  cpumask_t cpu_coherent_mask;
> >
> > +struct cpumask __cpu_primary_thread_mask __read_mostly;
> > +
> >  unsigned int smp_max_threads __initdata =3D UINT_MAX;
> >
> >  static int __init early_nosmt(char *s)
> > @@ -374,10 +378,15 @@ asmlinkage void start_secondary(void)
> >         set_cpu_core_map(cpu);
> >
> >         cpumask_set_cpu(cpu, &cpu_coherent_mask);
> > +#ifdef CONFIG_HOTPLUG_PARALLEL
> > +       cpuhp_ap_sync_alive();
> This is a "synchronization point" due to the description from commit
> 9244724fbf8ab394a7210e8e93bf037abc, which means things are parallel
> before this point and serialized after this point.
>
> But unfortunately, set_cpu_sibling_map() and set_cpu_core_map() cannot
> be executed in parallel. Maybe you haven't observed problems, but in
> theory it's not correct.
I don't know whether you have done reboot tests (for ~1000 times),
Jiaxun Yang submitted similar patches for LoongArch [1], but during
reboot tests we encountered problems that I have described in my
previous reply.

[1] https://lore.kernel.org/loongarch/20240716-loongarch-hotplug-v3-0-af59b=
3bb35c8@flygoat.com/

Huacai

>
> Huacai
>
> > +#endif
> >         notify_cpu_starting(cpu);
> >
> > +#ifndef CONFIG_HOTPLUG_PARALLEL
> >         /* Notify boot CPU that we're starting & ready to sync counters=
 */
> >         complete(&cpu_starting);
> > +#endif
> >
> >         synchronise_count_slave(cpu);
> >
> > @@ -386,11 +395,13 @@ asmlinkage void start_secondary(void)
> >
> >         calculate_cpu_foreign_map();
> >
> > +#ifndef CONFIG_HOTPLUG_PARALLEL
> >         /*
> >          * Notify boot CPU that we're up & online and it can safely ret=
urn
> >          * from __cpu_up
> >          */
> >         complete(&cpu_running);
> > +#endif
> >
> >         /*
> >          * irq will be enabled in ->smp_finish(), enabling it too early
> > @@ -447,6 +458,12 @@ void __init smp_prepare_boot_cpu(void)
> >         set_cpu_online(0, true);
> >  }
> >
> > +#ifdef CONFIG_HOTPLUG_PARALLEL
> > +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tid=
le)
> > +{
> > +       return mp_ops->boot_secondary(cpu, tidle);
> > +}
> > +#else
> >  int __cpu_up(unsigned int cpu, struct task_struct *tidle)
> >  {
> >         int err;
> > @@ -466,6 +483,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *=
tidle)
> >         wait_for_completion(&cpu_running);
> >         return 0;
> >  }
> > +#endif
> >
> >  #ifdef CONFIG_PROFILING
> >  /* Not really SMP stuff ... */
> >
> > ---
> > base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> > change-id: 20250411-parallel-cpu-bringup-78999a9235ea
> >
> > Best regards,
> > --
> > Gr=C3=A9gory CLEMENT, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >

