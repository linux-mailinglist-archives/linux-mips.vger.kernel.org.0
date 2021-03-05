Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635FB32E593
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 11:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCEKCS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 05:02:18 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:40020 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhCEKCB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 05:02:01 -0500
Received: by mail-ot1-f54.google.com with SMTP id b8so1244765oti.7;
        Fri, 05 Mar 2021 02:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKCewYQJvMbPerPRkRf9I5tEdNTeXU0qbT+16Snt2Nc=;
        b=neFDCsrxlqQQL46DIue4SWDA9v7BBpud6txGoXnfaOWxRbE225Toqg7cLxrVPCC80M
         u1/V7brE5QP4eO+RlgttRas0v7sGTPnyAe/82xN6joa+gjwIHCWTmRmqtBD2xBZM6jQo
         81d5Mk6352f1mC0Hh81MV1/3YJBVtGOcQ0iK1zrYneSObaccgBgNJ4WQVeGMUBjAS4jj
         D73Pb6scRJf5aawTv3m9NmN08MKdVg8covdapvElwgr6SthDlP14QIlzCzAb9rm0QMQf
         RARL7THBtFEJtMkoruRzbevB5/Rbrr9vncWXMHDkQapDKO7o0uJB9mOojShneVyHl87o
         N/OA==
X-Gm-Message-State: AOAM5328yI4GMeO+5whH7tQhL8SVSfN5ZIp+l4yEiQG05MdFPbOMbkJe
        kE5N+Rz8n8/AlhDekXI1vA0yBD+7GzxGr92BKRA=
X-Google-Smtp-Source: ABdhPJzG3yT1mT7d18zhGjsd+eH1orCoPyrGsDUdNVtcFvmTZQwPtYk2JByvXe4N+5oBPifp9krAVXolQYC+z1hM+8Y=
X-Received: by 2002:a9d:4a8e:: with SMTP id i14mr7340068otf.37.1614938520646;
 Fri, 05 Mar 2021 02:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20210304110057.22144-1-zhangqing@loongson.cn> <20210304110057.22144-3-zhangqing@loongson.cn>
In-Reply-To: <20210304110057.22144-3-zhangqing@loongson.cn>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Fri, 5 Mar 2021 11:01:49 +0100
Message-ID: <CAAdtpL6xDyYgDdHFkZPjtbbX4tV4K=7YehEoeGSgHdw-rXtURw@mail.gmail.com>
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Mar 4, 2021 at 5:35 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> The purpose of separating loongson_system_configuration from boot_param.h
> is to keep the other structure consistent with the firmware.

This is supposed to be a trivial patch, but the description actually
confuses me.

Why is the move out of "boot_param.h" keeping it consistent with fw?

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  .../include/asm/mach-loongson64/boot_param.h   | 18 ------------------
>  .../include/asm/mach-loongson64/loongson.h     | 18 ++++++++++++++++++
>  drivers/irqchip/irq-loongson-liointc.c         |  2 +-
>  3 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
> index 1c1cdf57137e..035b1a69e2d0 100644
> --- a/arch/mips/include/asm/mach-loongson64/boot_param.h
> +++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
> @@ -198,24 +198,6 @@ enum loongson_bridge_type {
>         VIRTUAL = 3
>  };
>
> -struct loongson_system_configuration {
> -       u32 nr_cpus;
> -       u32 nr_nodes;
> -       int cores_per_node;
> -       int cores_per_package;
> -       u16 boot_cpu_id;
> -       u16 reserved_cpus_mask;
> -       enum loongson_cpu_type cputype;
> -       enum loongson_bridge_type bridgetype;
> -       u64 restart_addr;
> -       u64 poweroff_addr;
> -       u64 suspend_addr;
> -       u64 vgabios_addr;
> -       u32 dma_mask_bits;
> -       u64 workarounds;
> -       void (*early_config)(void);
> -};
> -
>  extern struct efi_memory_map_loongson *loongson_memmap;
>  extern struct loongson_system_configuration loongson_sysconf;
>
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson64/loongson.h
> index ac1c20e172a2..6189deb188cf 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson.h
> @@ -12,6 +12,24 @@
>  #include <linux/irq.h>
>  #include <boot_param.h>
>
> +/* machine-specific boot configuration */
> +struct loongson_system_configuration {
> +       u32 nr_cpus;
> +       u32 nr_nodes;
> +       int cores_per_node;
> +       int cores_per_package;
> +       u16 boot_cpu_id;
> +       u16 reserved_cpus_mask;
> +       enum loongson_cpu_type cputype;
> +       enum loongson_bridge_type bridgetype;
> +       u64 restart_addr;
> +       u64 poweroff_addr;
> +       u64 suspend_addr;
> +       u64 vgabios_addr;
> +       u32 dma_mask_bits;
> +       u64 workarounds;
> +       void (*early_config)(void);
> +};
>
>  /* machine-specific reboot/halt operation */
>  extern void mach_prepare_reboot(void);
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index 09b91b81851c..249566a23cc4 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -16,7 +16,7 @@
>  #include <linux/smp.h>
>  #include <linux/irqchip/chained_irq.h>
>
> -#include <boot_param.h>
> +#include <loongson.h>
>
>  #define LIOINTC_CHIP_IRQ       32
>  #define LIOINTC_NUM_PARENT 4
> --
> 2.20.1
>
