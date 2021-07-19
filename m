Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497983CF276
	for <lists+linux-mips@lfdr.de>; Tue, 20 Jul 2021 05:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346299AbhGTCfM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jul 2021 22:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389004AbhGSVKt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jul 2021 17:10:49 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68965C0610D2
        for <linux-mips@vger.kernel.org>; Mon, 19 Jul 2021 14:43:58 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id t20so12619872ljd.2
        for <linux-mips@vger.kernel.org>; Mon, 19 Jul 2021 14:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LhpKABJHUow2srH9GfaYy39azWQBaJdfnjtlxYmSvEU=;
        b=Jwfy0sZd6bc/FzmLnJhjR/Oo6i0vAvUpymzINkQ8ySF4pQagn/dfZB0q7SjtLDrXvd
         gSaJxukn2ldi1EE5vdxkHHY8fO8JoXRThOPsgac4dKcfS1T0QJKejygmFsJdkAmpW2vB
         c/BkIsbWvs/IMpNgXcN3V+snJR4uhvNI4pMGEpTL0r/flFhF/2VhSeEKAlm/+ngLrd1R
         0PBxA9JAD56z5nOmCu3sXw/LG3m+jmspE4GnVdTt2wh+sZhYWSKq2gagZ1tLCTKKEkkd
         ziWlzi4L6jcl6auWj/FmUjw/oH8TbRtjQB4HohQte+LVlmWhWDH9YGpR9qwGCCKMnWEg
         hLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LhpKABJHUow2srH9GfaYy39azWQBaJdfnjtlxYmSvEU=;
        b=eDqDonog+EUOq0BfdCkv9loSOraRRt98jp8h4FrB7NdkUcjELIzMxOqL2rSwVD0iEs
         AuaVFg8H72KseHYPliDsheP7MLPQYUGTvq5mjnJNjXc23ChFXBftBQ+9gHT3VnP0GrnC
         8FB+xhfwyM3ZFRN/8T6avVBFS2jN1u0dykoJtJkfBlURbcs1v4FkguNTaE+HTEfOx7Iw
         9WqBySGKP7cEg3ZNWZzt4MKEzWav+pCCj5pIVPcjwVmG5SLQK/WMF/APhKuLIsj9jqEU
         jou6fxupeWc2Nvu8PlYexIW1UlXqWyjWcaIfn4xTOYtruGko8Xa4vAHb2121eSNEaDlG
         Oe+g==
X-Gm-Message-State: AOAM5334PI51kDGo4CaAHt7P4LEi8NyE+9wS+yA2ODojHCn12j/Gaa8V
        +eakxIEsknImsa1mbyQpVMDUEp8cIS9KY1Yv0KhAVw==
X-Google-Smtp-Source: ABdhPJxbIuo9ItQF9jhYwQOpm4RfAWvBMd21I2fhSPjJM2vzFwOwd0TF+96+FLPHG4wfgc9LwJgC1Avb4S2Ki1TWeLc=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr23758670ljq.341.1626731036403;
 Mon, 19 Jul 2021 14:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210718130748.230758-1-paul@crapouillou.net>
In-Reply-To: <20210718130748.230758-1-paul@crapouillou.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Jul 2021 14:43:46 -0700
Message-ID: <CAKwvOdkVEa-CxbVschn5Tnh7-Ynvzcz+zChhP3LL3Q745wE7_A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Avoid macro redefinitions
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net, Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 18, 2021 at 6:07 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> To be able to compile the kernel with LTO, the assembler macros cannot
> be declared in the global scope, or the compiler will complain about
> redefined macros.

Thanks for the patch! Minor comments below, so untested yet by me.
Please cc clang-built-linux@googlegroups.com for any follow ups.

If this is towards supporting LTO, consider sending as part of a
series enabling LTO for MIPS. That would be cool to see.

>
> Update the code so that macros are defined then undefined when they are
> used.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/include/asm/ginvt.h                 |  11 +-
>  .../asm/mach-loongson64/loongson_regs.h       |  12 ++
>  arch/mips/include/asm/mipsregs.h              | 192 +++++++++++-------
>  arch/mips/include/asm/msa.h                   |  34 +++-
>  4 files changed, 157 insertions(+), 92 deletions(-)
>
> diff --git a/arch/mips/include/asm/ginvt.h b/arch/mips/include/asm/ginvt.h
> index 6eb7c2b94dc7..87b2974ffc53 100644
> --- a/arch/mips/include/asm/ginvt.h
> +++ b/arch/mips/include/asm/ginvt.h
> @@ -12,11 +12,13 @@ enum ginvt_type {
>
>  #ifdef TOOLCHAIN_SUPPORTS_GINV
>  # define _ASM_SET_GINV ".set   ginv\n"
> +# define _ASM_UNSET_GINV
>  #else
> -_ASM_MACRO_1R1I(ginvt, rs, type,
> -               _ASM_INSN_IF_MIPS(0x7c0000bd | (__rs << 21) | (\\type << 8))
> -               _ASM_INSN32_IF_MM(0x0000717c | (__rs << 16) | (\\type << 9)));
> -# define _ASM_SET_GINV
> +# define _ASM_SET_GINV                                                 \
> +       _ASM_MACRO_1R1I(ginvt, rs, type,                                \
> +                       _ASM_INSN_IF_MIPS(0x7c0000bd | (__rs << 21) | (\\type << 8))    \
> +                       _ASM_INSN32_IF_MM(0x0000717c | (__rs << 16) | (\\type << 9)))
> +# define _ASM_UNSET_GINV ".purgem ginvt\n"
>  #endif
>
>  static __always_inline void ginvt(unsigned long addr, enum ginvt_type type)
> @@ -25,6 +27,7 @@ static __always_inline void ginvt(unsigned long addr, enum ginvt_type type)
>                 ".set   push\n"
>                 _ASM_SET_GINV
>                 "       ginvt   %0, %1\n"
> +               _ASM_UNSET_GINV
>                 ".set   pop"
>                 : /* no outputs */
>                 : "r"(addr), "i"(type)
> diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> index 165993514762..b5be7511f6cd 100644
> --- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> +++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
> @@ -21,8 +21,10 @@ static inline u32 read_cpucfg(u32 reg)
>         u32 __res;
>
>         __asm__ __volatile__(
> +               _ASM_SET_PARSE_R
>                 "parse_r __res,%0\n\t"
>                 "parse_r reg,%1\n\t"
> +               _ASM_UNSET_PARSE_R
>                 ".insn \n\t"
>                 ".word (0xc8080118 | (reg << 21) | (__res << 11))\n\t"
>                 :"=r"(__res)
> @@ -143,8 +145,10 @@ static inline u32 csr_readl(u32 reg)
>
>         /* RDCSR reg, val */
>         __asm__ __volatile__(
> +               _ASM_SET_PARSE_R
>                 "parse_r __res,%0\n\t"
>                 "parse_r reg,%1\n\t"
> +               _ASM_UNSET_PARSE_R
>                 ".insn \n\t"
>                 ".word (0xc8000118 | (reg << 21) | (__res << 11))\n\t"
>                 :"=r"(__res)
> @@ -160,8 +164,10 @@ static inline u64 csr_readq(u32 reg)
>
>         /* DRDCSR reg, val */
>         __asm__ __volatile__(
> +               _ASM_SET_PARSE_R
>                 "parse_r __res,%0\n\t"
>                 "parse_r reg,%1\n\t"
> +               _ASM_UNSET_PARSE_R
>                 ".insn \n\t"
>                 ".word (0xc8020118 | (reg << 21) | (__res << 11))\n\t"
>                 :"=r"(__res)
> @@ -175,8 +181,10 @@ static inline void csr_writel(u32 val, u32 reg)
>  {
>         /* WRCSR reg, val */
>         __asm__ __volatile__(
> +               _ASM_SET_PARSE_R
>                 "parse_r reg,%0\n\t"
>                 "parse_r val,%1\n\t"
> +               _ASM_UNSET_PARSE_R
>                 ".insn \n\t"
>                 ".word (0xc8010118 | (reg << 21) | (val << 11))\n\t"
>                 :
> @@ -189,8 +197,10 @@ static inline void csr_writeq(u64 val, u32 reg)
>  {
>         /* DWRCSR reg, val */
>         __asm__ __volatile__(
> +               _ASM_SET_PARSE_R
>                 "parse_r reg,%0\n\t"
>                 "parse_r val,%1\n\t"
> +               _ASM_UNSET_PARSE_R
>                 ".insn \n\t"
>                 ".word (0xc8030118 | (reg << 21) | (val << 11))\n\t"
>                 :
> @@ -243,8 +253,10 @@ static inline u64 drdtime(void)
>         u64 val = 0;
>
>         __asm__ __volatile__(
> +               _ASM_SET_PARSE_R
>                 "parse_r rID,%0\n\t"
>                 "parse_r val,%1\n\t"
> +               _ASM_UNSET_PARSE_R
>                 ".insn \n\t"
>                 ".word (0xc8090118 | (rID << 21) | (val << 11))\n\t"
>                 :"=r"(rID),"=r"(val)
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index acdf8c69220b..f44f041e24de 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -1297,22 +1297,24 @@ static inline int mm_insn_16bit(u16 insn)
>         "\\var  = " #n "\n\t"                   \
>         ".endif\n\t"
>
> -__asm__(".macro        parse_r var r\n\t"
> -       "\\var  = -1\n\t"
> -       _IFC_REG(0)  _IFC_REG(1)  _IFC_REG(2)  _IFC_REG(3)
> -       _IFC_REG(4)  _IFC_REG(5)  _IFC_REG(6)  _IFC_REG(7)
> -       _IFC_REG(8)  _IFC_REG(9)  _IFC_REG(10) _IFC_REG(11)
> -       _IFC_REG(12) _IFC_REG(13) _IFC_REG(14) _IFC_REG(15)
> -       _IFC_REG(16) _IFC_REG(17) _IFC_REG(18) _IFC_REG(19)
> -       _IFC_REG(20) _IFC_REG(21) _IFC_REG(22) _IFC_REG(23)
> -       _IFC_REG(24) _IFC_REG(25) _IFC_REG(26) _IFC_REG(27)
> -       _IFC_REG(28) _IFC_REG(29) _IFC_REG(30) _IFC_REG(31)
> -       ".iflt  \\var\n\t"
> -       ".error \"Unable to parse register name \\r\"\n\t"
> -       ".endif\n\t"
> -       ".endm");
> -
> -#undef _IFC_REG
> +#define _ASM_SET_PARSE_R                                               \
> +       ".macro parse_r var r\n\t"                                      \
> +       "\\var  = -1\n\t"                                               \
> +       _IFC_REG(0)  _IFC_REG(1)  _IFC_REG(2)  _IFC_REG(3)              \
> +       _IFC_REG(4)  _IFC_REG(5)  _IFC_REG(6)  _IFC_REG(7)              \
> +       _IFC_REG(8)  _IFC_REG(9)  _IFC_REG(10) _IFC_REG(11)             \
> +       _IFC_REG(12) _IFC_REG(13) _IFC_REG(14) _IFC_REG(15)             \
> +       _IFC_REG(16) _IFC_REG(17) _IFC_REG(18) _IFC_REG(19)             \
> +       _IFC_REG(20) _IFC_REG(21) _IFC_REG(22) _IFC_REG(23)             \
> +       _IFC_REG(24) _IFC_REG(25) _IFC_REG(26) _IFC_REG(27)             \
> +       _IFC_REG(28) _IFC_REG(29) _IFC_REG(30) _IFC_REG(31)             \
> +       ".iflt  \\var\n\t"                                              \
> +       ".error \"Unable to parse register name \\r\"\n\t"              \
> +       ".endif\n\t"                                                    \
> +       ".endm\n\t"
> +#define _ASM_UNSET_PARSE_R ".purgem parse_r\n\t"
> +
> +//#undef _IFC_REG

^ did you mean to commit that commented-out #undef?

>
>  /*
>   * C macros for generating assembler macros for common instruction formats.
> @@ -1322,43 +1324,45 @@ __asm__(".macro parse_r var r\n\t"
>   * the ENC encodings.
>   */
>
> -/* Instructions with no operands */
> -#define _ASM_MACRO_0(OP, ENC)                                          \
> -       __asm__(".macro " #OP "\n\t"                                    \
> -               ENC                                                     \
> -               ".endm")
> -
>  /* Instructions with 1 register operand & 1 immediate operand */
>  #define _ASM_MACRO_1R1I(OP, R1, I2, ENC)                               \
> -       __asm__(".macro " #OP " " #R1 ", " #I2 "\n\t"                   \
> +               ".macro " #OP " " #R1 ", " #I2 "\n\t"                   \
> +               _ASM_SET_PARSE_R                                        \
>                 "parse_r __" #R1 ", \\" #R1 "\n\t"                      \
>                 ENC                                                     \
> -               ".endm")
> +               _ASM_UNSET_PARSE_R                                      \
> +               ".endm\n\t"
>
>  /* Instructions with 2 register operands */
>  #define _ASM_MACRO_2R(OP, R1, R2, ENC)                                 \
> -       __asm__(".macro " #OP " " #R1 ", " #R2 "\n\t"                   \
> +               ".macro " #OP " " #R1 ", " #R2 "\n\t"                   \
> +               _ASM_SET_PARSE_R                                        \
>                 "parse_r __" #R1 ", \\" #R1 "\n\t"                      \
>                 "parse_r __" #R2 ", \\" #R2 "\n\t"                      \
>                 ENC                                                     \
> -               ".endm")
> +               _ASM_UNSET_PARSE_R                                      \
> +               ".endm\n\t"
>
>  /* Instructions with 3 register operands */
>  #define _ASM_MACRO_3R(OP, R1, R2, R3, ENC)                             \
> -       __asm__(".macro " #OP " " #R1 ", " #R2 ", " #R3 "\n\t"          \
> +               ".macro " #OP " " #R1 ", " #R2 ", " #R3 "\n\t"          \
> +               _ASM_SET_PARSE_R                                        \
>                 "parse_r __" #R1 ", \\" #R1 "\n\t"                      \
>                 "parse_r __" #R2 ", \\" #R2 "\n\t"                      \
>                 "parse_r __" #R3 ", \\" #R3 "\n\t"                      \
>                 ENC                                                     \
> -               ".endm")
> +               _ASM_UNSET_PARSE_R                                      \
> +               ".endm\n\t"
>
>  /* Instructions with 2 register operands and 1 optional select operand */
>  #define _ASM_MACRO_2R_1S(OP, R1, R2, SEL3, ENC)                                \
> -       __asm__(".macro " #OP " " #R1 ", " #R2 ", " #SEL3 " = 0\n\t"    \
> +               ".macro " #OP " " #R1 ", " #R2 ", " #SEL3 " = 0\n\t"    \
> +               _ASM_SET_PARSE_R                                        \
>                 "parse_r __" #R1 ", \\" #R1 "\n\t"                      \
>                 "parse_r __" #R2 ", \\" #R2 "\n\t"                      \
>                 ENC                                                     \
> -               ".endm")
> +               _ASM_UNSET_PARSE_R                                      \
> +               ".endm\n\t"
>
>  /*
>   * TLB Invalidate Flush
> @@ -1618,15 +1622,21 @@ do {                                                                    \
>  } while (0)
>
>  #ifndef TOOLCHAIN_SUPPORTS_XPA

When did GAS gain support for XPA? Do we still need to support
!TOOLCHAIN_SUPPORTS_XPA? (though that's orthogonal to this patch, such
a cleanup first might simplify this patch).

> -_ASM_MACRO_2R_1S(mfhc0, rt, rs, sel,
> -       _ASM_INSN_IF_MIPS(0x40400000 | __rt << 16 | __rs << 11 | \\sel)
> -       _ASM_INSN32_IF_MM(0x000000f4 | __rt << 21 | __rs << 16 | \\sel << 11));
> -_ASM_MACRO_2R_1S(mthc0, rt, rd, sel,
> -       _ASM_INSN_IF_MIPS(0x40c00000 | __rt << 16 | __rd << 11 | \\sel)
> -       _ASM_INSN32_IF_MM(0x000002f4 | __rt << 21 | __rd << 16 | \\sel << 11));
> -#define _ASM_SET_XPA ""
> +#define _ASM_SET_MFHC0                                                 \
> +       _ASM_MACRO_2R_1S(mfhc0, rt, rs, sel,                            \
> +                        _ASM_INSN_IF_MIPS(0x40400000 | __rt << 16 | __rs << 11 | \\sel)        \
> +                        _ASM_INSN32_IF_MM(0x000000f4 | __rt << 21 | __rs << 16 | \\sel << 11))
> +#define _ASM_UNSET_MFHC0 ".purgem mfhc0\n\t"
> +#define _ASM_SET_MTHC0                                                 \
> +       _ASM_MACRO_2R_1S(mthc0, rt, rd, sel,                            \
> +                        _ASM_INSN_IF_MIPS(0x40c00000 | __rt << 16 | __rd << 11 | \\sel)        \
> +                        _ASM_INSN32_IF_MM(0x000002f4 | __rt << 21 | __rd << 16 | \\sel << 11))
> +#define _ASM_UNSET_MTHC0 ".purgem mthc0\n\t"
>  #else  /* !TOOLCHAIN_SUPPORTS_XPA */
> -#define _ASM_SET_XPA ".set\txpa\n\t"
> +#define _ASM_SET_MFHC0 ".set\txpa\n\t"
> +#define _ASM_SET_MTHC0 ".set\txpa\n\t"
> +#define _ASM_UNSET_MFHC0
> +#define _ASM_UNSET_MTHC0
>  #endif
>
>  #define __readx_32bit_c0_register(source, sel)                         \
> @@ -1636,8 +1646,9 @@ _ASM_MACRO_2R_1S(mthc0, rt, rd, sel,
>         __asm__ __volatile__(                                           \
>         "       .set    push                                    \n"     \
>         "       .set    mips32r2                                \n"     \
> -       _ASM_SET_XPA                                                    \
> +       _ASM_SET_MFHC0                                                  \
>         "       mfhc0   %0, " #source ", %1                     \n"     \
> +       _ASM_UNSET_MFHC0                                                \
>         "       .set    pop                                     \n"     \
>         : "=r" (__res)                                                  \
>         : "i" (sel));                                                   \
> @@ -1649,8 +1660,9 @@ do {                                                                      \
>         __asm__ __volatile__(                                           \
>         "       .set    push                                    \n"     \
>         "       .set    mips32r2                                \n"     \
> -       _ASM_SET_XPA                                                    \
> +       _ASM_SET_MTHC0                                                  \
>         "       mthc0   %z0, " #register ", %1                  \n"     \
> +       _ASM_UNSET_MTHC0                                                \
>         "       .set    pop                                     \n"     \
>         :                                                               \
>         : "Jr" (value), "i" (sel));                                     \
> @@ -2046,31 +2058,58 @@ do {                                                                    \
>   */
>
>  #ifndef TOOLCHAIN_SUPPORTS_VIRT

Same question for GAS version support for virt?
Documentation/process/changes.rst
says GNU binutils 2.23+ is required for building the kernel.
If we still need to support, have you tested this change on such an
older version of GNU binutils?

> -_ASM_MACRO_2R_1S(mfgc0, rt, rs, sel,
> -       _ASM_INSN_IF_MIPS(0x40600000 | __rt << 16 | __rs << 11 | \\sel)
> -       _ASM_INSN32_IF_MM(0x000004fc | __rt << 21 | __rs << 16 | \\sel << 11));
> -_ASM_MACRO_2R_1S(dmfgc0, rt, rs, sel,
> -       _ASM_INSN_IF_MIPS(0x40600100 | __rt << 16 | __rs << 11 | \\sel)
> -       _ASM_INSN32_IF_MM(0x580004fc | __rt << 21 | __rs << 16 | \\sel << 11));
> -_ASM_MACRO_2R_1S(mtgc0, rt, rd, sel,
> -       _ASM_INSN_IF_MIPS(0x40600200 | __rt << 16 | __rd << 11 | \\sel)
> -       _ASM_INSN32_IF_MM(0x000006fc | __rt << 21 | __rd << 16 | \\sel << 11));
> -_ASM_MACRO_2R_1S(dmtgc0, rt, rd, sel,
> -       _ASM_INSN_IF_MIPS(0x40600300 | __rt << 16 | __rd << 11 | \\sel)
> -       _ASM_INSN32_IF_MM(0x580006fc | __rt << 21 | __rd << 16 | \\sel << 11));
> -_ASM_MACRO_0(tlbgp,    _ASM_INSN_IF_MIPS(0x42000010)
> -                      _ASM_INSN32_IF_MM(0x0000017c));
> -_ASM_MACRO_0(tlbgr,    _ASM_INSN_IF_MIPS(0x42000009)
> -                      _ASM_INSN32_IF_MM(0x0000117c));
> -_ASM_MACRO_0(tlbgwi,   _ASM_INSN_IF_MIPS(0x4200000a)
> -                      _ASM_INSN32_IF_MM(0x0000217c));
> -_ASM_MACRO_0(tlbgwr,   _ASM_INSN_IF_MIPS(0x4200000e)
> -                      _ASM_INSN32_IF_MM(0x0000317c));
> -_ASM_MACRO_0(tlbginvf, _ASM_INSN_IF_MIPS(0x4200000c)
> -                      _ASM_INSN32_IF_MM(0x0000517c));
> -#define _ASM_SET_VIRT ""
> +#define _ASM_SET_MFGC0                                                 \
> +       _ASM_MACRO_2R_1S(mfgc0, rt, rs, sel,                            \
> +                        _ASM_INSN_IF_MIPS(0x40600000 | __rt << 16 | __rs << 11 | \\sel)        \
> +                        _ASM_INSN32_IF_MM(0x000004fc | __rt << 21 | __rs << 16 | \\sel << 11))
> +#define _ASM_UNSET_MFGC0 ".purgem mfgc0\n\t"
> +#define _ASM_SET_DMFGC0                                                        \
> +       _ASM_MACRO_2R_1S(dmfgc0, rt, rs, sel,                           \
> +                        _ASM_INSN_IF_MIPS(0x40600100 | __rt << 16 | __rs << 11 | \\sel)        \
> +                        _ASM_INSN32_IF_MM(0x580004fc | __rt << 21 | __rs << 16 | \\sel << 11))
> +#define _ASM_UNSET_DMFGC0 ".purgem dmfgc0\n\t"
> +#define _ASM_SET_MTGC0                                                 \
> +       _ASM_MACRO_2R_1S(mtgc0, rt, rd, sel,                            \
> +                        _ASM_INSN_IF_MIPS(0x40600200 | __rt << 16 | __rd << 11 | \\sel)        \
> +                        _ASM_INSN32_IF_MM(0x000006fc | __rt << 21 | __rd << 16 | \\sel << 11))
> +#define _ASM_UNSET_MTGC0 ".purgem mtgc0\n\t"
> +#define _ASM_SET_DMTGC0                                                        \
> +       _ASM_MACRO_2R_1S(dmtgc0, rt, rd, sel,                           \
> +                        _ASM_INSN_IF_MIPS(0x40600300 | __rt << 16 | __rd << 11 | \\sel)        \
> +                        _ASM_INSN32_IF_MM(0x580006fc | __rt << 21 | __rd << 16 | \\sel << 11))
> +#define _ASM_UNSET_DMTGC0 ".purgem dmtgc0\n\t"
> +
> +#define __tlbgp()                                                      \
> +               _ASM_INSN_IF_MIPS(0x42000010)                           \
> +               _ASM_INSN32_IF_MM(0x0000017c)
> +#define __tlbgr()                                                      \
> +               _ASM_INSN_IF_MIPS(0x42000009)                           \
> +               _ASM_INSN32_IF_MM(0x0000117c)
> +#define __tlbgwi()                                                     \
> +               _ASM_INSN_IF_MIPS(0x4200000a)                           \
> +               _ASM_INSN32_IF_MM(0x0000217c)
> +#define __tlbgwr()                                                     \
> +               _ASM_INSN_IF_MIPS(0x4200000e)                           \
> +               _ASM_INSN32_IF_MM(0x0000317c)
> +#define __tlbginvf()                                                   \
> +               _ASM_INSN_IF_MIPS(0x4200000c)                           \
> +               _ASM_INSN32_IF_MM(0x0000517c)
>  #else  /* !TOOLCHAIN_SUPPORTS_VIRT */
>  #define _ASM_SET_VIRT ".set\tvirt\n\t"
> +#define _ASM_SET_MFGC0 _ASM_SET_VIRT
> +#define _ASM_SET_DMFGC0        _ASM_SET_VIRT
> +#define _ASM_SET_MTGC0 _ASM_SET_VIRT
> +#define _ASM_SET_DMTGC0        _ASM_SET_VIRT
> +#define _ASM_UNSET_MFGC0
> +#define _ASM_UNSET_DMFGC0
> +#define _ASM_UNSET_MTGC0
> +#define _ASM_UNSET_DMTGC0
> +
> +#define __tlbgp()      _ASM_SET_VIRT "tlbgp\n\t"
> +#define __tlbgr()      _ASM_SET_VIRT "tlbgr\n\t"
> +#define __tlbgwi()     _ASM_SET_VIRT "tlbgwi\n\t"
> +#define __tlbgwr()     _ASM_SET_VIRT "tlbgwr\n\t"
> +#define __tlbginvf()   _ASM_SET_VIRT "tlbginvf\n\t"
>  #endif
>
>  #define __read_32bit_gc0_register(source, sel)                         \
> @@ -2078,8 +2117,9 @@ _ASM_MACRO_0(tlbginvf, _ASM_INSN_IF_MIPS(0x4200000c)
>         __asm__ __volatile__(                                           \
>                 ".set\tpush\n\t"                                        \
>                 ".set\tmips32r5\n\t"                                    \
> -               _ASM_SET_VIRT                                           \
> +               _ASM_SET_MFGC0                                          \
>                 "mfgc0\t%0, " #source ", %1\n\t"                        \
> +               _ASM_UNSET_MFGC0                                        \
>                 ".set\tpop"                                             \
>                 : "=r" (__res)                                          \
>                 : "i" (sel));                                           \
> @@ -2091,8 +2131,9 @@ _ASM_MACRO_0(tlbginvf, _ASM_INSN_IF_MIPS(0x4200000c)
>         __asm__ __volatile__(                                           \
>                 ".set\tpush\n\t"                                        \
>                 ".set\tmips64r5\n\t"                                    \
> -               _ASM_SET_VIRT                                           \
> +               _ASM_SET_DMFGC0                                         \
>                 "dmfgc0\t%0, " #source ", %1\n\t"                       \
> +               _ASM_UNSET_DMFGC0                                       \
>                 ".set\tpop"                                             \
>                 : "=r" (__res)                                          \
>                 : "i" (sel));                                           \
> @@ -2104,8 +2145,9 @@ do {                                                                      \
>         __asm__ __volatile__(                                           \
>                 ".set\tpush\n\t"                                        \
>                 ".set\tmips32r5\n\t"                                    \
> -               _ASM_SET_VIRT                                           \
> +               _ASM_SET_MTGC0                                          \
>                 "mtgc0\t%z0, " #register ", %1\n\t"                     \
> +               _ASM_UNSET_MTGC0                                        \
>                 ".set\tpop"                                             \
>                 : : "Jr" ((unsigned int)(value)),                       \
>                     "i" (sel));                                         \
> @@ -2116,8 +2158,9 @@ do {                                                                      \
>         __asm__ __volatile__(                                           \
>                 ".set\tpush\n\t"                                        \
>                 ".set\tmips64r5\n\t"                                    \
> -               _ASM_SET_VIRT                                           \
> +               _ASM_SET_DMTGC0                                         \
>                 "dmtgc0\t%z0, " #register ", %1\n\t"                    \
> +               _ASM_UNSET_DMTGC0                                       \
>                 ".set\tpop"                                             \
>                 : : "Jr" (value),                                       \
>                     "i" (sel));                                         \
> @@ -2788,8 +2831,7 @@ static inline void guest_tlb_probe(void)
>         __asm__ __volatile__(
>                 ".set push\n\t"
>                 ".set noreorder\n\t"
> -               _ASM_SET_VIRT
> -               "tlbgp\n\t"
> +               __tlbgp()
>                 ".set pop");
>  }
>
> @@ -2798,8 +2840,7 @@ static inline void guest_tlb_read(void)
>         __asm__ __volatile__(
>                 ".set push\n\t"
>                 ".set noreorder\n\t"
> -               _ASM_SET_VIRT
> -               "tlbgr\n\t"
> +               __tlbgr()
>                 ".set pop");
>  }
>
> @@ -2808,8 +2849,7 @@ static inline void guest_tlb_write_indexed(void)
>         __asm__ __volatile__(
>                 ".set push\n\t"
>                 ".set noreorder\n\t"
> -               _ASM_SET_VIRT
> -               "tlbgwi\n\t"
> +               __tlbgwi()
>                 ".set pop");
>  }
>
> @@ -2818,8 +2858,7 @@ static inline void guest_tlb_write_random(void)
>         __asm__ __volatile__(
>                 ".set push\n\t"
>                 ".set noreorder\n\t"
> -               _ASM_SET_VIRT
> -               "tlbgwr\n\t"
> +               __tlbgwr()
>                 ".set pop");
>  }
>
> @@ -2831,8 +2870,7 @@ static inline void guest_tlbinvf(void)
>         __asm__ __volatile__(
>                 ".set push\n\t"
>                 ".set noreorder\n\t"
> -               _ASM_SET_VIRT
> -               "tlbginvf\n\t"
> +               __tlbginvf()
>                 ".set pop");
>  }
>
> diff --git a/arch/mips/include/asm/msa.h b/arch/mips/include/asm/msa.h
> index e0a3dd52334d..236a49ee2e3e 100644
> --- a/arch/mips/include/asm/msa.h
> +++ b/arch/mips/include/asm/msa.h
> @@ -162,16 +162,26 @@ static inline void init_msa_upper(void)
>   * to allow compilation with toolchains that do not support MSA. Once all
>   * toolchains in use support MSA these can be removed.
>   */
> -_ASM_MACRO_2R(cfcmsa, rd, cs,
> -       _ASM_INSN_IF_MIPS(0x787e0019 | __cs << 11 | __rd << 6)
> -       _ASM_INSN32_IF_MM(0x587e0016 | __cs << 11 | __rd << 6));
> -_ASM_MACRO_2R(ctcmsa, cd, rs,
> -       _ASM_INSN_IF_MIPS(0x783e0019 | __rs << 11 | __cd << 6)
> -       _ASM_INSN32_IF_MM(0x583e0016 | __rs << 11 | __cd << 6));
> -#define _ASM_SET_MSA ""
> +
> +#define _ASM_SET_CFCMSA                                                        \
> +       _ASM_MACRO_2R(cfcmsa, rd, cs,                                   \
> +                     _ASM_INSN_IF_MIPS(0x787e0019 | __cs << 11 | __rd << 6)    \
> +                     _ASM_INSN32_IF_MM(0x587e0016 | __cs << 11 | __rd << 6))
> +#define _ASM_UNSET_CFCMSA ".purgem cfcmsa\n\t"
> +#define _ASM_SET_CTCMSA                                                        \
> +       _ASM_MACRO_2R(ctcmsa, cd, rs,                                   \
> +                     _ASM_INSN_IF_MIPS(0x783e0019 | __rs << 11 | __cd << 6)    \
> +                     _ASM_INSN32_IF_MM(0x583e0016 | __rs << 11 | __cd << 6))
> +#define _ASM_UNSET_CTCMSA ".purgem ctcmsa\n\t"
>  #else /* TOOLCHAIN_SUPPORTS_MSA */
> -#define _ASM_SET_MSA ".set\tfp=64\n\t"                         \
> -                    ".set\tmsa\n\t"
> +#define _ASM_SET_CFCMSA                                                \
> +               ".set\tfp=64\n\t"                               \
> +               ".set\tmsa\n\t"
> +#define _ASM_UNSET_CFCMSA
> +#define _ASM_SET_CTCMSA                                                \
> +               ".set\tfp=64\n\t"                               \
> +               ".set\tmsa\n\t"
> +#define _ASM_UNSET_CTCMSA
>  #endif
>
>  #define __BUILD_MSA_CTL_REG(name, cs)                          \
> @@ -180,8 +190,9 @@ static inline unsigned int read_msa_##name(void)            \
>         unsigned int reg;                                       \
>         __asm__ __volatile__(                                   \
>         "       .set    push\n"                                 \
> -       _ASM_SET_MSA                                            \
> +       _ASM_SET_CFCMSA                                         \
>         "       cfcmsa  %0, $" #cs "\n"                         \
> +       _ASM_UNSET_CFCMSA                                       \
>         "       .set    pop\n"                                  \
>         : "=r"(reg));                                           \
>         return reg;                                             \
> @@ -191,8 +202,9 @@ static inline void write_msa_##name(unsigned int val)               \
>  {                                                              \
>         __asm__ __volatile__(                                   \
>         "       .set    push\n"                                 \
> -       _ASM_SET_MSA                                            \
> +       _ASM_SET_CTCMSA                                         \
>         "       ctcmsa  $" #cs ", %0\n"                         \
> +       _ASM_UNSET_CTCMSA                                       \
>         "       .set    pop\n"                                  \
>         : : "r"(val));                                          \
>  }
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
