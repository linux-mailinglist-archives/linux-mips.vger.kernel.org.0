Return-Path: <linux-mips+bounces-4317-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE75093085C
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46251C2098B
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4686CD52E;
	Sun, 14 Jul 2024 02:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeALjdfe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9DBD51D;
	Sun, 14 Jul 2024 02:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720925679; cv=none; b=EV5Rs3wMkauZrJNd/QCsPX+pbYysGpTfoZYa2nMS7gDY5pPhWClGKhuvNTUC8Yo3d17FE7t9J5UsiQl0hdWebJ0qUBRPA4dX0ox9cXoNBOsmJEqxwmjxVSoDV4T7b+YBnjKtuCfOLaDzDJf69f1yRxSCkwvmi4n8j+396G695vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720925679; c=relaxed/simple;
	bh=mQ7NiCdiSYVG4rq6703lv+psEh3chvVr+4FQl3/nKBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3FzFNwLhOL1mbCpvi9RNU6iY1C3zWrS5kQSRTeWedzO8gGQdK5r+XrjRWPg3DVv+ND1Dxc8LeQRLIhyXBGHmNdybug528XKfV7mHLv0dTfldnicwvV0lPoqA9aZB7k98SHL+quwY5aY7jzmLiMyDbdIDASPkQAVw2I6cbYzIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeALjdfe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96143C32786;
	Sun, 14 Jul 2024 02:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720925678;
	bh=mQ7NiCdiSYVG4rq6703lv+psEh3chvVr+4FQl3/nKBI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BeALjdfeFd/UXrW02qzSwlDU7sQ+ngngMBfUfvEUGML3IO+2duE/4nj2zuhiTd0Oo
	 +SSdCopNes50T21MBUEk9MEyI3yrLnFAmIAjmK6jHu4nIERPTcRM/GMbAT1+TLXZA9
	 hiyioix2HMAFm4CRbHZigPiztOCLu9xhJ6GTTafJyGANAqIA0dS8/Tg3VzugvRFo2w
	 LqSLP1CH1y3HG5o3JPycmSCoNHdMfa1OzAo0TvmAF6NqT2CZ6icyd0CqVpc3uFPj8y
	 zUCg0f9mny8f8TwBYEmRB0EDPnyVKskVJLRa9C0+bb97pekOXgIjVFOsFnsvsa3Lwx
	 8Xuysii37H1Qw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eebc76119aso36474051fa.2;
        Sat, 13 Jul 2024 19:54:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULuB2ybSytcbYrp+gB7P/WvLEvtlRW+N6B7CBigfiRpOv9c03AUFYpKa+W2Ml/xaj/vglcnjIUP2IGzoQoCydpT8E1Xit8gIpTMZ4rQ4GSpKDhd5Q/u+kwzFAzrAagct1EQgbf+8x+Mg==
X-Gm-Message-State: AOJu0YytNXTguhy4M8IuULgl28zXewGKWTkZmxiPi2rjpj2girxoeBJ0
	4+OJ+pnexx0jxfVuIxBA6OGJOnaKxmw3U54pA+w0J+leUJO5Rnh2wy+W6iLCyflb4NTr0aTzByu
	f7tmibo4SZvSsOY8nxjRxL0cYkcA=
X-Google-Smtp-Source: AGHT+IGK8nwvsia26Sbhz8545j6PD1zbyal+Va6EYejpFEX72B/e3p5hCiaAoiCeVnQ33dsWmPmMPJ403PxvWrLcKqM=
X-Received: by 2002:a2e:bc1a:0:b0:2ee:8637:c2a8 with SMTP id
 38308e7fff4ca-2eeb3103444mr128250151fa.27.1720925676887; Sat, 13 Jul 2024
 19:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
In-Reply-To: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 14 Jul 2024 10:54:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7_QjjemjFYMGRBQck5gKRWhTMqvjXF=prcAGNam-MKGg@mail.gmail.com>
Message-ID: <CAAhV-H7_QjjemjFYMGRBQck5gKRWhTMqvjXF=prcAGNam-MKGg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson64: Switch to SYNC_R4K
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 10:41=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
>
> Nowadays SYNC_R4K is performing better than Loongson64's
> custom sync mechanism.
Loongson64's preciseness is significantly better than SYNC_R4K.

Huacai

>
> Switch to SYNC_R4K to improve performance and reduce code
> duplication.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Last minute for 6.11 :-)
> ---
>  arch/mips/Kconfig           |  1 +
>  arch/mips/include/asm/smp.h |  1 -
>  arch/mips/loongson64/smp.c  | 35 ++---------------------------------
>  3 files changed, 3 insertions(+), 34 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 1236ea122061..e163059dd4d3 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -478,6 +478,7 @@ config MACH_LOONGSON64
>         select BOARD_SCACHE
>         select CSRC_R4K
>         select CEVT_R4K
> +       select SYNC_R4K
>         select FORCE_PCI
>         select ISA
>         select I8259
> diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
> index bc2c240f414b..2427d76f953f 100644
> --- a/arch/mips/include/asm/smp.h
> +++ b/arch/mips/include/asm/smp.h
> @@ -50,7 +50,6 @@ extern int __cpu_logical_map[NR_CPUS];
>  #define SMP_CALL_FUNCTION      0x2
>  /* Octeon - Tell another core to flush its icache */
>  #define SMP_ICACHE_FLUSH       0x4
> -#define SMP_ASK_C0COUNT                0x8
>
>  /* Mask of CPUs which are currently definitely operating coherently */
>  extern cpumask_t cpu_coherent_mask;
> diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
> index 66d049cdcf14..147acd972a07 100644
> --- a/arch/mips/loongson64/smp.c
> +++ b/arch/mips/loongson64/smp.c
> @@ -33,7 +33,6 @@ static void __iomem *ipi_clear0_regs[16];
>  static void __iomem *ipi_status0_regs[16];
>  static void __iomem *ipi_en0_regs[16];
>  static void __iomem *ipi_mailbox_buf[16];
> -static uint32_t core0_c0count[NR_CPUS];
>
>  static u32 (*ipi_read_clear)(int cpu);
>  static void (*ipi_write_action)(int cpu, u32 action);
> @@ -382,11 +381,10 @@ loongson3_send_ipi_mask(const struct cpumask *mask,=
 unsigned int action)
>                 ipi_write_action(cpu_logical_map(i), (u32)action);
>  }
>
> -
>  static irqreturn_t loongson3_ipi_interrupt(int irq, void *dev_id)
>  {
> -       int i, cpu =3D smp_processor_id();
> -       unsigned int action, c0count;
> +       int cpu =3D smp_processor_id();
> +       unsigned int action;
>
>         action =3D ipi_read_clear(cpu);
>
> @@ -399,26 +397,14 @@ static irqreturn_t loongson3_ipi_interrupt(int irq,=
 void *dev_id)
>                 irq_exit();
>         }
>
> -       if (action & SMP_ASK_C0COUNT) {
> -               BUG_ON(cpu !=3D 0);
> -               c0count =3D read_c0_count();
> -               c0count =3D c0count ? c0count : 1;
> -               for (i =3D 1; i < nr_cpu_ids; i++)
> -                       core0_c0count[i] =3D c0count;
> -               nudge_writes(); /* Let others see the result ASAP */
> -       }
> -
>         return IRQ_HANDLED;
>  }
>
> -#define MAX_LOOPS 800
>  /*
>   * SMP init and finish on secondary CPUs
>   */
>  static void loongson3_init_secondary(void)
>  {
> -       int i;
> -       uint32_t initcount;
>         unsigned int cpu =3D smp_processor_id();
>         unsigned int imask =3D STATUSF_IP7 | STATUSF_IP6 |
>                              STATUSF_IP3 | STATUSF_IP2;
> @@ -432,23 +418,6 @@ static void loongson3_init_secondary(void)
>                      cpu_logical_map(cpu) % loongson_sysconf.cores_per_pa=
ckage);
>         cpu_data[cpu].package =3D
>                 cpu_logical_map(cpu) / loongson_sysconf.cores_per_package=
;
> -
> -       i =3D 0;
> -       core0_c0count[cpu] =3D 0;
> -       loongson3_send_ipi_single(0, SMP_ASK_C0COUNT);
> -       while (!core0_c0count[cpu]) {
> -               i++;
> -               cpu_relax();
> -       }
> -
> -       if (i > MAX_LOOPS)
> -               i =3D MAX_LOOPS;
> -       if (cpu_data[cpu].package)
> -               initcount =3D core0_c0count[cpu] + i;
> -       else /* Local access is faster for loops */
> -               initcount =3D core0_c0count[cpu] + i/2;
> -
> -       write_c0_count(initcount);
>  }
>
>  static void loongson3_smp_finish(void)
>
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240714-loongson64-cevt-r4k-eb74d4ad984c
>
> Best regards,
> --
> Jiaxun Yang <jiaxun.yang@flygoat.com>
>

