Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270062FE681
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 10:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbhAUJaA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 04:30:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:42868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728438AbhAUJ3Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 04:29:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1E362399A;
        Thu, 21 Jan 2021 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611221324;
        bh=HQrbdL46xbmrXqY5Sn9AuthJJHzeZplEaDeVBqkSS9s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PYAoAnYl/ogmB0L2v2av2+IJ+DNweurLMJGzGmiS1ATJo0e324yn9v4djWyEd0v94
         fYqE4UmevN8N/idAQuYe94u0NTJzfp//WTcMgEpeyiIEskaz9r+FBrftqpVRUAsTJs
         MnixBE67TvK/U3bLpIeKGiJAx2RYFJYlEp1RlZoOtsZ1j/FIVQUaw0SWjEy6pzZIU7
         MNbv4Rsuzz+kNfzDiENAXoqTJ5QTcR1sqAMBt66ntq5RROSDGgMelZd+ww5e/CaUbw
         2On5EmFyQZuJSRe9Cy8DpmyMccSO1tJxVOCsytu7TiGs2+jHBdGpmrEi/bXOmxMoMr
         eTs8NnSAb+XSQ==
Received: by mail-io1-f44.google.com with SMTP id h11so2630631ioh.11;
        Thu, 21 Jan 2021 01:28:43 -0800 (PST)
X-Gm-Message-State: AOAM533zTeNNiwyXzryAwCzxStDsaMzDQK1ko5uPuk8nPXSKzK66G1PX
        ilHOHJnrZ0ilfjXDRobQAU0Nae6Np7Gm9LxqJEk=
X-Google-Smtp-Source: ABdhPJxkmQnE9ksuZg96yY6jApvsmnRY012dtIpZ0KN4SFvG9MwmPSiiSxpFY6tNYykhwYwYgFXk2N4awTlZuAwOies=
X-Received: by 2002:a02:c76b:: with SMTP id k11mr7077843jao.57.1611221321317;
 Thu, 21 Jan 2021 01:28:41 -0800 (PST)
MIME-Version: 1.0
References: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn> <1611207098-11381-2-git-send-email-hejinyang@loongson.cn>
In-Reply-To: <1611207098-11381-2-git-send-email-hejinyang@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Thu, 21 Jan 2021 17:28:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6vvnMqW_xCgUDFiT2mpntY5SFT4M-6jZQ714FabbckQg@mail.gmail.com>
Message-ID: <CAAhV-H6vvnMqW_xCgUDFiT2mpntY5SFT4M-6jZQ714FabbckQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] MIPS: process: Remove unnecessary headers inclusion
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Thu, Jan 21, 2021 at 1:44 PM Jinyang He <hejinyang@loongson.cn> wrote:
>
> Some headers are not necessary, remove them and sort includes.
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
> v2:
> - Remove useless header inclusion.
>
>  arch/mips/kernel/process.c | 39 ++++++++++-----------------------------
>  1 file changed, 10 insertions(+), 29 deletions(-)
>
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index d7e288f..d737234 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -9,50 +9,31 @@
>   * Copyright (C) 2004 Thiemo Seufer
>   * Copyright (C) 2013  Imagination Technologies Ltd.
>   */
> +#include <linux/cpu.h>
>  #include <linux/errno.h>
> -#include <linux/sched.h>
> -#include <linux/sched/debug.h>
> -#include <linux/sched/task.h>
> -#include <linux/sched/task_stack.h>
> -#include <linux/tick.h>
> -#include <linux/kernel.h>
> -#include <linux/mm.h>
> -#include <linux/stddef.h>
> -#include <linux/unistd.h>
> -#include <linux/export.h>
> -#include <linux/ptrace.h>
> -#include <linux/mman.h>
> -#include <linux/personality.h>
> -#include <linux/sys.h>
>  #include <linux/init.h>
> -#include <linux/completion.h>
>  #include <linux/kallsyms.h>
> -#include <linux/random.h>
> -#include <linux/prctl.h>
> +#include <linux/kernel.h>
>  #include <linux/nmi.h>
> -#include <linux/cpu.h>
> +#include <linux/personality.h>
> +#include <linux/prctl.h>
> +#include <linux/sched.h>
> +#include <linux/sched/debug.h>
> +#include <linux/sched/task_stack.h>
>
>  #include <asm/abi.h>
>  #include <asm/asm.h>
> -#include <asm/bootinfo.h>
> -#include <asm/cpu.h>
>  #include <asm/dsemul.h>
>  #include <asm/dsp.h>
>  #include <asm/fpu.h>
> +#include <asm/inst.h>
>  #include <asm/irq.h>
> -#include <asm/mips-cps.h>
> +#include <asm/irq_regs.h>
> +#include <asm/isadep.h>
>  #include <asm/msa.h>
>  #include <asm/mipsregs.h>
>  #include <asm/processor.h>
>  #include <asm/reg.h>
> -#include <linux/uaccess.h>
> -#include <asm/io.h>
> -#include <asm/elf.h>
> -#include <asm/isadep.h>
> -#include <asm/inst.h>
> -#include <asm/stacktrace.h>
> -#include <asm/irq_regs.h>
> -#include <asm/exec.h>
>
>  #ifdef CONFIG_HOTPLUG_CPU
>  void arch_cpu_idle_dead(void)
> --
> 2.1.0
>
