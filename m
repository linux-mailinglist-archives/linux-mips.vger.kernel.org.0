Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFE52191A69
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 21:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgCXT7k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 15:59:40 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40874 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgCXT7k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 15:59:40 -0400
Received: by mail-pg1-f196.google.com with SMTP id t24so9577437pgj.7
        for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2020 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CFODQb+bESW9heVsGiUcWplkZSwbJ9/VQmtkqJlkYxk=;
        b=eifOct9wJhIvlzuLcycxdfwyUmZj/CLpwq6xMbdRf+ATMbnJWbEt52jvPY2noEZ97I
         dRnplhSneRbczdiESICqTeYn3WNPtzJ3cIpwPKvvgqFIgOzesftIuRQnIhOcCcIyTwxD
         7tM2Q2cPP7ZCcGbYJZWUvKVovBmHbtntef7LniPb3Yej17+l8l6IJgoGBoVjNmtstaeA
         l1kjkicUkColXIPcD89TBPc8xGlWl9VPP7xIXHwvgQ9iKCIFw/CErnA94MwzhcPOoaWg
         A2rlJtm1Se4YQsZzIKJjWtnwn06dlqaLyEkzJ+1i529Q7wf/0Gkc6+gpxzAxocjNI0Yc
         LarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CFODQb+bESW9heVsGiUcWplkZSwbJ9/VQmtkqJlkYxk=;
        b=r/1NB4dOi0J+bxxZBmWGoIK2/dq+68B0C5RfmzzfCXIldVGsEEHi4abs3n16feZcI8
         bvMAxXhIq0YxMrXGlAJAMcUM2By4m2poEK7cpsyVFfUaiUwf+ukEYJOC1AtLCtgt5hVm
         UpFDo/XAHpI7bsT7cmHSwCdbOR+lEL4skkEVUIXdR3Pn0gmLcDLK9QSAGVV5Men0LzM8
         hTZdMWggOBqJJRhrnqJZc2Db6kbUh8scV2ofe0vTB6gJJQblIINoOrqiUU9jECNgWn2g
         brStVBfEaHDqyth6aMfZsby5Kd52rAhfW4TXOy4Py2ePjfQEuhkkdUF1Kjd7M293LyN/
         3uGg==
X-Gm-Message-State: ANhLgQ2TdSmB9zMh6ZQj4BlZukcxrDT/Di3cqTs31Gdw5lRllmz6DaFX
        1OKCy9292v0TOcpPyqvbA4TfYjOhMUz//S8aR7Ea7lux
X-Google-Smtp-Source: ADFU+vsGOvC9GS62MuC2VA48Y+xZYjYMDsXPB80Vf65NYw+qWkpowS4qoYyys/hlrP9RM+qgjcM/Hp368KbHaMQMk44=
X-Received: by 2002:a63:4453:: with SMTP id t19mr27492096pgk.381.1585079978625;
 Tue, 24 Mar 2020 12:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200324164005.8259-1-masahiroy@kernel.org>
In-Reply-To: <20200324164005.8259-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 12:59:28 -0700
Message-ID: <CAKwvOd=YJeEBvHJiOgoUjfuDFY9sa8ge061eOafzccbECkQhrA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: mark some functions as weak to avoid conflict with
 Octeon ones
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Paul Burton <paulburton@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 24, 2020 at 9:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> MIPS provides multiple definitions for the following functions:
>
>   fw_init_cmdline
>   __delay
>   __udelay
>   __ndelay
>   memmove
>   __rmemcpy
>   memcpy
>   __copy_user
>
> The generic ones are defined in lib-y objects, which are overridden by
> the Octeon ones when CONFIG_CAVIUM_OCTEON_SOC is enabled.
>
> The use of EXPORT_SYMBOL in static libraries potentially causes a
> problem for the llvm linker [1]. So, I want to forcibly link lib-y
> objects to vmlinux when CONFIG_MODULES=y.
>
> As a groundwork, we must fix multiple definitions that have been
> hidden by lib-y.
>
> In this case, the generic implementations in arch/mips/lib/ are
> weaker than the ones in arch/mips/cavium-octen/, so annotating __weak
> is a straight-forward solution.
>
> I also removed EXPORT_SYMBOL from the Octeon files to avoid the
> 'exported twice' warnings from modpost.
>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/515
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/mips/cavium-octeon/csrc-octeon.c   | 4 ----
>  arch/mips/cavium-octeon/octeon-memcpy.S | 3 ---
>  arch/mips/fw/lib/cmdline.c              | 2 +-
>  arch/mips/lib/delay.c                   | 6 +++---
>  arch/mips/lib/memcpy.S                  | 5 +++++
>  5 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/arch/mips/cavium-octeon/csrc-octeon.c b/arch/mips/cavium-octeon/csrc-octeon.c
> index 124817609ce0..fdc28fb5eda4 100644
> --- a/arch/mips/cavium-octeon/csrc-octeon.c
> +++ b/arch/mips/cavium-octeon/csrc-octeon.c
> @@ -153,7 +153,6 @@ void __udelay(unsigned long us)
>         while (end > cur)
>                 cur = read_c0_cvmcount();
>  }
> -EXPORT_SYMBOL(__udelay);
>
>  void __ndelay(unsigned long ns)
>  {
> @@ -167,7 +166,6 @@ void __ndelay(unsigned long ns)
>         while (end > cur)
>                 cur = read_c0_cvmcount();
>  }
> -EXPORT_SYMBOL(__ndelay);
>
>  void __delay(unsigned long loops)
>  {
> @@ -179,8 +177,6 @@ void __delay(unsigned long loops)
>         while (end > cur)
>                 cur = read_c0_cvmcount();
>  }
> -EXPORT_SYMBOL(__delay);
> -
>
>  /**
>   * octeon_io_clk_delay - wait for a given number of io clock cycles to pass.
> diff --git a/arch/mips/cavium-octeon/octeon-memcpy.S b/arch/mips/cavium-octeon/octeon-memcpy.S
> index 0a7c9834b81c..3eb8d1a72d7f 100644
> --- a/arch/mips/cavium-octeon/octeon-memcpy.S
> +++ b/arch/mips/cavium-octeon/octeon-memcpy.S
> @@ -147,11 +147,9 @@
>   */
>         .align  5
>  LEAF(memcpy)                                   /* a0=dst a1=src a2=len */
> -EXPORT_SYMBOL(memcpy)
>         move    v0, dst                         /* return value */
>  __memcpy:
>  FEXPORT(__copy_user)
> -EXPORT_SYMBOL(__copy_user)
>         /*
>          * Note: dst & src may be unaligned, len may be 0
>          * Temps
> @@ -438,7 +436,6 @@ s_exc:
>
>         .align  5
>  LEAF(memmove)
> -EXPORT_SYMBOL(memmove)
>         ADD     t0, a0, a2
>         ADD     t1, a1, a2
>         sltu    t0, a1, t0                      # dst + len <= src -> memcpy
> diff --git a/arch/mips/fw/lib/cmdline.c b/arch/mips/fw/lib/cmdline.c
> index 6ecda64ad184..e1f9a0c23005 100644
> --- a/arch/mips/fw/lib/cmdline.c
> +++ b/arch/mips/fw/lib/cmdline.c
> @@ -16,7 +16,7 @@ int fw_argc;
>  int *_fw_argv;
>  int *_fw_envp;
>
> -void __init fw_init_cmdline(void)
> +void __init __weak fw_init_cmdline(void)
>  {
>         int i;
>
> diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
> index 68c495ed71e3..ba0ae7da5ced 100644
> --- a/arch/mips/lib/delay.c
> +++ b/arch/mips/lib/delay.c
> @@ -24,7 +24,7 @@
>  #define GCC_DADDI_IMM_ASM() "r"
>  #endif
>
> -void __delay(unsigned long loops)
> +void __weak __delay(unsigned long loops)
>  {
>         __asm__ __volatile__ (
>         "       .set    noreorder                               \n"
> @@ -48,7 +48,7 @@ EXPORT_SYMBOL(__delay);
>   * a constant)
>   */
>
> -void __udelay(unsigned long us)
> +void __weak __udelay(unsigned long us)
>  {
>         unsigned int lpj = raw_current_cpu_data.udelay_val;
>
> @@ -56,7 +56,7 @@ void __udelay(unsigned long us)
>  }
>  EXPORT_SYMBOL(__udelay);
>
> -void __ndelay(unsigned long ns)
> +void __weak __ndelay(unsigned long ns)
>  {
>         unsigned int lpj = raw_current_cpu_data.udelay_val;
>
> diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
> index f7994d936505..f2f58326b927 100644
> --- a/arch/mips/lib/memcpy.S
> +++ b/arch/mips/lib/memcpy.S
> @@ -598,6 +598,9 @@ SEXC(1)
>          nop
>         .endm
>
> +       .weak memmove
> +       .weak __rmemcpy
> +
>         .align  5
>  LEAF(memmove)
>  EXPORT_SYMBOL(memmove)
> @@ -655,6 +658,8 @@ LEAF(__rmemcpy)                                     /* a0=dst a1=src a2=len */
>   * the number of uncopied bytes.
>   * memcpy sets v0 to dst.
>   */
> +       .weak memcpy
> +       .weak __copy_user

I think it would be better to use SYM_FUNC_START_WEAK from
include/linux/linkage.h rather than LEAF, but it looks like LEAF uses
a different value for ALIGN, and sets up call frame information CFI.
So in that case, no complaints.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch!


>         .align  5
>  LEAF(memcpy)                                   /* a0=dst a1=src a2=len */
>  EXPORT_SYMBOL(memcpy)
> --
> 2.17.1
>
> --
--
Thanks,
~Nick Desaulniers
