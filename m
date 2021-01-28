Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F25B306DB1
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 07:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhA1GkB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 01:40:01 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17694 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhA1GkA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Jan 2021 01:40:00 -0500
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10S6d02a026741;
        Thu, 28 Jan 2021 15:39:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10S6d02a026741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611815941;
        bh=An1vXfAcY7/ecSuLNbnfLuPPKCg2HwdVoldfEosA3zQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UvnRLxTXThaF8IqKtnvHETuoq591e3926XXmHmCe0eUMPGuPKtICb/9vWDlECpKTP
         hoWrgRZeS5LVcYohwei5xdeUYXff5DgrOpUVlRRiIzz+zm/oOPdBevrlECNDiOBA/M
         p6fJYPdWRxnL0GpZ6UaAOv76jGFVtPUTXKT6/4k9O5lPmuvLzD4K8BLyqa4NGOhrc6
         cu/PVrw1DjAbUi1hHvG0CRz71IjPZOtERDw16YIcH85XwRwoco2e9Yveriov2kbto1
         u0YaEiMBqrcgdtwmxqnivUWfvcqmDEdwl7iXS3bqOemuNV7R00r17WBYTSJ5dmpWXp
         mRgNA9LkxuapQ==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id e9so2792515plh.3;
        Wed, 27 Jan 2021 22:39:01 -0800 (PST)
X-Gm-Message-State: AOAM533C9miNcHHTEYt0tLVVMmoyW4DcqEu0rcAViwhMycADWuyY4Aua
        ooP6Wb+trGNjjdd212Hj9XmYk6Kh57qXLmlPLqA=
X-Google-Smtp-Source: ABdhPJzIAAkdm7zrETkG4P8+F+BK0pldZ8Y8PLxZ3lAwKPD8rT6XXx3Hm+P5wBHG9v1+hIbpsGCLEBTEP79nb/5oFEo=
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr9713770pjp.87.1611815940370;
 Wed, 27 Jan 2021 22:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20201212165431.150750-1-masahiroy@kernel.org> <20201212165431.150750-2-masahiroy@kernel.org>
In-Reply-To: <20201212165431.150750-2-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 28 Jan 2021 15:38:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvhazuyNyY4QgfWR9=FaYRq_yZc1u4znb=26eg+C0aNg@mail.gmail.com>
Message-ID: <CAK7LNASvhazuyNyY4QgfWR9=FaYRq_yZc1u4znb=26eg+C0aNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: LD_VERSION redenomination
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Dominique Martinet <asmadeus@codewreck.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Dec 13, 2020 at 1:54 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit ccbef1674a15 ("Kbuild, lto: add ld-version and ld-ifversion
> macros") introduced scripts/ld-version.sh for GCC LTO.
>
> At that time, this script handled 5 version fields because GCC LTO
> needed the downstream binutils. (https://lkml.org/lkml/2014/4/8/272)
>
> The code snippet from the submitted patch was as follows:
>
>     # We need HJ Lu's Linux binutils because mainline binutils does not
>     # support mixing assembler and LTO code in the same ld -r object.
>     # XXX check if the gcc plugin ld is the expected one too
>     # XXX some Fedora binutils should also support it. How to check for that?
>     ifeq ($(call ld-ifversion,-ge,22710001,y),y)
>         ...
>
> However, GCC LTO was not merged into the mainline after all.
> (https://lkml.org/lkml/2014/4/8/272)
>
> So, the 4th and 5th fields were never used, and finally removed by
> commit 0d61ed17dd30 ("ld-version: Drop the 4th and 5th version
> components").
>
> Since then, the last 4-digits returned by this script is always zeros.
>
> Remove the meaningless last 4-digits. This makes the version format
> consistent with GCC_VERSION, CLANG_VERSION, LLD_VERSION.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Applied to linux-kbuild.


>  arch/arm64/Kconfig            | 2 +-
>  arch/mips/loongson64/Platform | 2 +-
>  arch/mips/vdso/Kconfig        | 2 +-
>  arch/powerpc/Makefile         | 2 +-
>  arch/powerpc/lib/Makefile     | 2 +-
>  scripts/ld-version.sh         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a6b5b7ef40ae..69d56b21a6ec 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1499,7 +1499,7 @@ config ARM64_PTR_AUTH
>         depends on (CC_HAS_SIGN_RETURN_ADDRESS || CC_HAS_BRANCH_PROT_PAC_RET) && AS_HAS_PAC
>         # Modern compilers insert a .note.gnu.property section note for PAC
>         # which is only understood by binutils starting with version 2.33.1.
> -       depends on LD_IS_LLD || LD_VERSION >= 233010000 || (CC_IS_GCC && GCC_VERSION < 90100)
> +       depends on LD_IS_LLD || LD_VERSION >= 23301 || (CC_IS_GCC && GCC_VERSION < 90100)
>         depends on !CC_IS_CLANG || AS_HAS_CFI_NEGATE_RA_STATE
>         depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_REGS)
>         help
> diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
> index ec42c5085905..cc0b9c87f9ad 100644
> --- a/arch/mips/loongson64/Platform
> +++ b/arch/mips/loongson64/Platform
> @@ -35,7 +35,7 @@ cflags-$(CONFIG_CPU_LOONGSON64)       += $(call as-option,-Wa$(comma)-mno-fix-loongson
>  # can't easily be used safely within the kbuild framework.
>  #
>  ifeq ($(call cc-ifversion, -ge, 0409, y), y)
> -  ifeq ($(call ld-ifversion, -ge, 225000000, y), y)
> +  ifeq ($(call ld-ifversion, -ge, 22500, y), y)
>      cflags-$(CONFIG_CPU_LOONGSON64)  += \
>        $(call cc-option,-march=loongson3a -U_MIPS_ISA -D_MIPS_ISA=_MIPS_ISA_MIPS64)
>    else
> diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
> index 7aec721398d5..a665f6108cb5 100644
> --- a/arch/mips/vdso/Kconfig
> +++ b/arch/mips/vdso/Kconfig
> @@ -12,7 +12,7 @@
>  # the lack of relocations. As such, we disable the VDSO for microMIPS builds.
>
>  config MIPS_LD_CAN_LINK_VDSO
> -       def_bool LD_VERSION >= 225000000 || LD_IS_LLD
> +       def_bool LD_VERSION >= 22500 || LD_IS_LLD
>
>  config MIPS_DISABLE_VDSO
>         def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 5c8c06215dd4..6a9a852c3d56 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -65,7 +65,7 @@ UTS_MACHINE := $(subst $(space),,$(machine-y))
>  ifdef CONFIG_PPC32
>  KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>  else
> -ifeq ($(call ld-ifversion, -ge, 225000000, y),y)
> +ifeq ($(call ld-ifversion, -ge, 22500, y),y)
>  # Have the linker provide sfpr if possible.
>  # There is a corresponding test in arch/powerpc/lib/Makefile
>  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 69a91b571845..d4efc182662a 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -31,7 +31,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)        += error-inject.o
>  # 64-bit linker creates .sfpr on demand for final link (vmlinux),
>  # so it is only needed for modules, and only for older linkers which
>  # do not support --save-restore-funcs
> -ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
> +ifeq ($(call ld-ifversion, -lt, 22500, y),y)
>  extra-$(CONFIG_PPC64)  += crtsavres.o
>  endif
>
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index f2be0ff9a738..0f8a2c0f9502 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -6,6 +6,6 @@
>         gsub(".*version ", "");
>         gsub("-.*", "");
>         split($1,a, ".");
> -       print a[1]*100000000 + a[2]*1000000 + a[3]*10000;
> +       print a[1]*10000 + a[2]*100 + a[3];
>         exit
>         }
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
