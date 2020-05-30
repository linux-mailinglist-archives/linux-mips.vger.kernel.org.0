Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E431E9089
	for <lists+linux-mips@lfdr.de>; Sat, 30 May 2020 12:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgE3K1d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 May 2020 06:27:33 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44998 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgE3K1d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 May 2020 06:27:33 -0400
Received: by mail-io1-f66.google.com with SMTP id p20so1981924iop.11
        for <linux-mips@vger.kernel.org>; Sat, 30 May 2020 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FOhSYCnZ7/K9q6ZwCbYbLFhjl4/k4mHNTsmeiZHe29U=;
        b=DR3CsrL5Mf0gN4v/jVzkYkEjFz8AJ+zEWjuHBKNfAKcS9etDV6+Cv3pGBk+1qETmpv
         kjtY8bokNurVpsQKSJnsfdb1dLCASBVx4dkZU5iKC9GVLJ8osujOdYwpUy4Lbtk13OMh
         qFN39CadJU6Hnwvhv8XVaThk+64V2cM+rJig8K+9uuXa32KDI0+57OUgfOk6s2kIH7Ug
         1WH+uzAQHjZ/2P32Gkt0w3K4GY+85rNExYXeI9jYfoNeq9jbNEb2TtIFYYIIvwMpX8KN
         w8NAxjAblXwkGy1onILjvFvkkGYRzY2f+6cqY8KDo0wQZiE1ApFQ+FIOOzO3bOksOrkr
         5tLQ==
X-Gm-Message-State: AOAM530Hzch3j9kdNNYxakzdc/81CqWxR8/PT5AKqA8hiSc4PbOe5p3q
        cd25+sUElE8rlyGp5o0YPz5CCtYTwnituZAdlMo=
X-Google-Smtp-Source: ABdhPJy7+1IviDBtjg0InXblI65LXKoUTCZLoJW2mJhiF69vPdMjZeyQDnmOCEA9M83g83PQwGcJ8usAQCx0g3cY+H0=
X-Received: by 2002:a05:6602:13c6:: with SMTP id o6mr10152005iov.84.1590834451071;
 Sat, 30 May 2020 03:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200530073243.16411-1-git@xen0n.name> <20200530073243.16411-3-git@xen0n.name>
In-Reply-To: <20200530073243.16411-3-git@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 30 May 2020 18:27:20 +0800
Message-ID: <CAAhV-H5mLOSkTEu_28rhuRbpOkX8s=UYouBQNQZuJVuv734fQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: Expose Loongson CPUCFG availability via HWCAP
To:     WANG Xuerui <git@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reviewed-by: Huacai Chen <chenhc@lemote.com>

On Sat, May 30, 2020 at 3:34 PM WANG Xuerui <git@xen0n.name> wrote:
>
> The point is to allow userspace to probe for CPUCFG without possibly
> triggering invalid instructions. In addition to that, future Loongson
> feature bits could all be stuffed into CPUCFG bit fields (or "leaves"
> in x86-speak) if Loongson does not make mistakes, so ELF HWCAP bits are
> conserved.
>
> Userspace can determine native CPUCFG availability by checking the LCSRP
> (Loongson CSR Present) bit in CPUCFG output after seeing CPUCFG bit in
> HWCAP. Native CPUCFG always sets the LCSRP bit, as CPUCFG is part of the
> Loongson CSR ASE, while the emulation intentionally leaves this bit
> clear.
>
> The other existing Loongson-specific HWCAP bits are, to my best
> knowledge, unused, as
>
> (1) they are fairly recent additions,
> (2) Loongson never back-ported the patch into their kernel fork, and
> (3) Loongson's existing installed base rarely upgrade, if ever;
>
> However, they are still considered userspace ABI, hence unfortunately
> unremovable. But hopefully at least we could stop adding new Loongson
> HWCAP bits in the future.
>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>
> v2: tweaked commit message.
>
>  arch/mips/include/uapi/asm/hwcap.h | 1 +
>  arch/mips/loongson64/cpucfg-emul.c | 9 ++++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/uapi/asm/hwcap.h b/arch/mips/include/uapi/asm/hwcap.h
> index 1ade1daa4921..b7e02bdc1985 100644
> --- a/arch/mips/include/uapi/asm/hwcap.h
> +++ b/arch/mips/include/uapi/asm/hwcap.h
> @@ -17,5 +17,6 @@
>  #define HWCAP_LOONGSON_MMI  (1 << 11)
>  #define HWCAP_LOONGSON_EXT  (1 << 12)
>  #define HWCAP_LOONGSON_EXT2 (1 << 13)
> +#define HWCAP_LOONGSON_CPUCFG (1 << 14)
>
>  #endif /* _UAPI_ASM_HWCAP_H */
> diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
> index c16023a13379..ca75f07252df 100644
> --- a/arch/mips/loongson64/cpucfg-emul.c
> +++ b/arch/mips/loongson64/cpucfg-emul.c
> @@ -4,6 +4,7 @@
>  #include <linux/types.h>
>  #include <asm/cpu.h>
>  #include <asm/cpu-info.h>
> +#include <asm/elf.h>
>
>  #include <loongson_regs.h>
>  #include <cpucfg-emul.h>
> @@ -128,7 +129,7 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>
>         /* CPUs with CPUCFG support don't need to synthesize anything. */
>         if (cpu_has_cfg())
> -               return;
> +               goto have_cpucfg_now;
>
>         c->loongson3_cpucfg_data[0] = 0;
>         c->loongson3_cpucfg_data[1] = 0;
> @@ -217,4 +218,10 @@ void loongson3_cpucfg_synthesize_data(struct cpuinfo_mips *c)
>         patch_cpucfg_sel1(c);
>         patch_cpucfg_sel2(c);
>         patch_cpucfg_sel3(c);
> +
> +have_cpucfg_now:
> +       /* We have usable CPUCFG now, emulated or not.
> +        * Announce CPUCFG availability to userspace via hwcap.
> +        */
> +       elf_hwcap |= HWCAP_LOONGSON_CPUCFG;
>  }
> --
> 2.26.2
>
