Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505FB2F402E
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 01:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437975AbhAMAnQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jan 2021 19:43:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:48578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392371AbhAMA2r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 Jan 2021 19:28:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C41E23131;
        Wed, 13 Jan 2021 00:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610497686;
        bh=l4bVjGN9qa62D6wIsCNthuTsg43yfh9U+sM3Nr9Q01A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NsYNsfscXOjB992DWmXvmkKLILvNkU5uOiJF3LFcW4ab7paVBPn2tk7DKrM86ZjHL
         WosGC6EhT6ddPy7DX7aRmuGKVrjZv/1JYoEjZeb+9bsGw4EhC1ImJPjV++jZLD6Zts
         EHhNL4Ioc0wiY/VyGMdzfy05bwsvHwxjiPerMtSrCyf68iC+WvQ0+0Mi4Tq4D9kIdF
         3N/FPEIFLbf6aJ5UZXv4G39dkVrCgkD8mfReuK6MZiR4UcAYTbH/86mnfHnlUw66aX
         /3hG2GNTYd0dVdWLkd4bpk4Yo1NE/1Y0uNO5HiLPLebe8QQpQzoaOoM+sXDw6xsO2B
         8JjkEQyPrJ/JA==
Received: by mail-io1-f52.google.com with SMTP id u26so659938iof.3;
        Tue, 12 Jan 2021 16:28:06 -0800 (PST)
X-Gm-Message-State: AOAM533kJwieoez16PHYrUOVRPmgsA0E6EBQWHXQmEzBgxCeA+iQ4C1T
        TA2KoJdsasCKP4JKMAsz1I4eUHPQDYDJ4b5i8Gc=
X-Google-Smtp-Source: ABdhPJyGl93Rw4UJu1ToLzTJj1orHdU7rEc+4tfveQ2c9YxPJzAvtJO+VytyGstWVWin0EBD6hfxhs65LZX7Q9WSNEo=
X-Received: by 2002:a92:870b:: with SMTP id m11mr1714638ild.134.1610497685872;
 Tue, 12 Jan 2021 16:28:05 -0800 (PST)
MIME-Version: 1.0
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn> <1610454557-25867-2-git-send-email-hejinyang@loongson.cn>
In-Reply-To: <1610454557-25867-2-git-send-email-hejinyang@loongson.cn>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Wed, 13 Jan 2021 08:27:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Y_iBpr8t-RKghLf=1mb0Z4djxnwfKg8QBnUXgB=+SRQ@mail.gmail.com>
Message-ID: <CAAhV-H7Y_iBpr8t-RKghLf=1mb0Z4djxnwfKg8QBnUXgB=+SRQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] MIPS: process: Reorder header files
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Jan 12, 2021 at 9:07 PM Jinyang He <hejinyang@loongson.cn> wrote:
>
> Just reorder the header files.
>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/process.c | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index d7e288f..361bd28 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -9,28 +9,29 @@
>   * Copyright (C) 2004 Thiemo Seufer
>   * Copyright (C) 2013  Imagination Technologies Ltd.
>   */
> +#include <linux/completion.h>
> +#include <linux/cpu.h>
>  #include <linux/errno.h>
> +#include <linux/export.h>
> +#include <linux/init.h>
> +#include <linux/kallsyms.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/mman.h>
> +#include <linux/nmi.h>
> +#include <linux/personality.h>
> +#include <linux/ptrace.h>
> +#include <linux/prctl.h>
> +#include <linux/random.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/task.h>
>  #include <linux/sched/task_stack.h>
> -#include <linux/tick.h>
> -#include <linux/kernel.h>
> -#include <linux/mm.h>
>  #include <linux/stddef.h>
> -#include <linux/unistd.h>
> -#include <linux/export.h>
> -#include <linux/ptrace.h>
> -#include <linux/mman.h>
> -#include <linux/personality.h>
>  #include <linux/sys.h>
> -#include <linux/init.h>
> -#include <linux/completion.h>
> -#include <linux/kallsyms.h>
> -#include <linux/random.h>
> -#include <linux/prctl.h>
> -#include <linux/nmi.h>
> -#include <linux/cpu.h>
> +#include <linux/tick.h>
> +#include <linux/uaccess.h>
> +#include <linux/unistd.h>
>
>  #include <asm/abi.h>
>  #include <asm/asm.h>
> @@ -38,21 +39,20 @@
>  #include <asm/cpu.h>
>  #include <asm/dsemul.h>
>  #include <asm/dsp.h>
> +#include <asm/elf.h>
> +#include <asm/exec.h>
>  #include <asm/fpu.h>
> +#include <asm/inst.h>
> +#include <asm/io.h>
>  #include <asm/irq.h>
> +#include <asm/irq_regs.h>
> +#include <asm/isadep.h>
>  #include <asm/mips-cps.h>
>  #include <asm/msa.h>
>  #include <asm/mipsregs.h>
>  #include <asm/processor.h>
>  #include <asm/reg.h>
> -#include <linux/uaccess.h>
> -#include <asm/io.h>
> -#include <asm/elf.h>
> -#include <asm/isadep.h>
> -#include <asm/inst.h>
>  #include <asm/stacktrace.h>
> -#include <asm/irq_regs.h>
> -#include <asm/exec.h>
>
>  #ifdef CONFIG_HOTPLUG_CPU
>  void arch_cpu_idle_dead(void)
> --
> 2.1.0
>
