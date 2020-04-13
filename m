Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5B21A6C3B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 20:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733113AbgDMSwj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 14:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733112AbgDMSwh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Apr 2020 14:52:37 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA52EC0A3BDC;
        Mon, 13 Apr 2020 11:52:37 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id 103so10181773otv.0;
        Mon, 13 Apr 2020 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xC3x0yRcgUpqkBQhYGspeGLwB9d9vOWv+kQdwmDFIYk=;
        b=IgxuuZRwoOsuo5lS8HrLEy3dHrJ8MoK5xyRYnt9I1YdQ8MnuA3vJjpXRLYDJACtokz
         2BRT2ctu0wRwrbuPq+G/Nvno2QYLro6FeqP6aZ2JN9k6NBfmjtwNFwvbbWpe41rZV7Ct
         Bh3aJ/sJcCUZe7OoTrQzOV2Ez5z9+9jEdUzggJ1U6Zciz28QpxP4JeoadZCHcDY7ES7l
         LQWUR92cASEYS4r+YcT/6F3sofRQjDi34BOm88Gl3gI1jE6Z94gCCdl85lvVBUyYTOdE
         UpFzsvG0XhQEAtC0AqwUjSY2g+u/iwFTvG9DXe4pTXCs8J6svRaYYmc3UdP/NVO2OET8
         EsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xC3x0yRcgUpqkBQhYGspeGLwB9d9vOWv+kQdwmDFIYk=;
        b=pVnXTYy2A9pJ2JnCEuEnt7ncFaV3GzOVzuT0dvUEXqcyPDuqr1kjZRm7ABKuGZhYRq
         Eff/ix0eekPQw8f6akDhbPa6euz+ESEPDA/JU39CE4m8syW28tyDIgN3RwpWfs/y4F83
         ayxxgTINZMMI0vicEeKUDv3rfET4nA+OuhQtardZK1OvbuwRft5FkC6dMQUoNmcPJZMv
         MFf7QDaFiAchOzDXByzCPJbVYMe0VSZ+GOfVXor01a8As/AY0h2KB42ZYT/Cc6+J7pz/
         +NbFGWTBO719rYYy2Voo98S+sR6Wh44z/jAGh4BnQuDNdr6ChygwHt0NQ8YBcCw9KAcN
         s65w==
X-Gm-Message-State: AGi0PuZPuY67UcRWu3zvyii14WV5B+Do0TKCEf7PlY8XXNr9UEXNO/Lo
        5NDAMv7/tNjfWQ+ZTfHiBXM=
X-Google-Smtp-Source: APiQypIASkLqrCad3LTHgKfEnGZ92poqy7f3+DANLMdN/Fse/aVtD4kzlXdMBHfPe+6h3+/HEWN0wg==
X-Received: by 2002:a4a:9c41:: with SMTP id c1mr15471481ook.43.1586803956871;
        Mon, 13 Apr 2020 11:52:36 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id w19sm4948336otj.57.2020.04.13.11.52.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 11:52:36 -0700 (PDT)
Date:   Mon, 13 Apr 2020 11:52:34 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, macro@linux-mips.org,
        clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for 32bit
 kernel
Message-ID: <20200413185234.GA12413@ubuntu-s3-xlarge-x86>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Mon, Apr 13, 2020 at 02:26:49PM +0800, Jiaxun Yang wrote:
> LLD failed to link vmlinux with 64bit load address for 32bit ELF
> while bfd will strip 64bit address into 32bit silently.
> To fix LLD build, we should truncate load address provided by platform
> into 32bit for 32bit kernel.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/786
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=25784
> Cc: Fangrui Song <maskray@google.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> --
> V2: Take MaskRay's shell magic.
> 
> V3: After spent an hour on dealing with special character issue in
> Makefile, I gave up to do shell hacks and write a util in C instead.
> Thanks Maciej for pointing out Makefile variable problem.
> 
> v4: Finally we managed to find a Makefile method to do it properly
> thanks to Kees. As it's too far from the initial version, I removed
> Review & Test tag from Nick and Fangrui and Cc instead.
> ---
>  arch/mips/Makefile             | 12 +++++++++++-
>  arch/mips/kernel/vmlinux.lds.S |  2 +-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index e1c44aed8156..18495568f03e 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -288,9 +288,19 @@ ifdef CONFIG_64BIT
>    endif
>  endif
>  
> +# When linking a 32-bit executable the LLVM linker cannot cope with a
> +# 32-bit load address that has been sign-extended to 64 bits.  Simply
> +# remove the upper 32 bits then, as it is safe to do so with other
> +# linkers.
> +ifdef CONFIG_64BIT
> +	load-ld			= $(load-y)
> +else
> +	load-ld			= $(subst 0xffffffff,0x,$(load-y))
> +endif
> +
>  KBUILD_AFLAGS	+= $(cflags-y)
>  KBUILD_CFLAGS	+= $(cflags-y)
> -KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y)
> +KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y) -DVMLINUX_LINK_ADDRESS=$(load-ld)
>  KBUILD_CPPFLAGS += -DDATAOFFSET=$(if $(dataoffset-y),$(dataoffset-y),0)
>  
>  bootvars-y	= VMLINUX_LOAD_ADDRESS=$(load-y) \
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index a5f00ec73ea6..5226cd8e4bee 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -55,7 +55,7 @@ SECTIONS
>  	/* . = 0xa800000000300000; */
>  	. = 0xffffffff80300000;
>  #endif
> -	. = VMLINUX_LOAD_ADDRESS;
> +	. = VMLINUX_LINK_ADDRESS;
>  	/* read-only */
>  	_text = .;	/* Text and read-only data */
>  	.text : {
> -- 
> 2.26.0.rc2
> 

This version does not quite work:

ld.lld: error: section .text at 0xFFFFFFFF80990000 of size 0x388C exceeds available address space
ld.lld: error: section .MIPS.abiflags at 0xFFFFFFFF80993890 of size 0x18 exceeds available address space
ld.lld: error: section .rodata.str1.1 at 0xFFFFFFFF809938A8 of size 0x164 exceeds available address space
ld.lld: error: section .eh_frame at 0xFFFFFFFF80993A0C of size 0x2C exceeds available address space
ld.lld: error: section .data at 0xFFFFFFFF80993A40 of size 0x38EFD0 exceeds available address space
ld.lld: error: section .got at 0xFFFFFFFF80D22A10 of size 0x8 exceeds available address space
ld.lld: error: section .bss at 0xFFFFFFFF80E22A20 of size 0x402010 exceeds available address space
ld.lld: error: section .sbss at 0xFFFFFFFF81224A30 of size 0x8 exceeds available address space
make[2]: *** [/home/nathan/src/linux/arch/mips/boot/compressed/Makefile:104: vmlinuz] Error 1

I think something like this is needed but I do not know if it is proper.

Cheers,
Nathan

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 18495568f03e..68c0f22fefc0 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -304,6 +304,7 @@ KBUILD_CPPFLAGS += -DVMLINUX_LOAD_ADDRESS=$(load-y) -DVMLINUX_LINK_ADDRESS=$(loa
 KBUILD_CPPFLAGS += -DDATAOFFSET=$(if $(dataoffset-y),$(dataoffset-y),0)
 
 bootvars-y	= VMLINUX_LOAD_ADDRESS=$(load-y) \
+		  VMLINUX_LINK_ADDRESS=$(load-ld) \
 		  VMLINUX_ENTRY_ADDRESS=$(entry-y) \
 		  PLATFORM="$(platform-y)" \
 		  ITS_INPUTS="$(its-y)"
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 0df0ee8a298d..3d391256ab7e 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -90,7 +90,7 @@ ifneq ($(zload-y),)
 VMLINUZ_LOAD_ADDRESS := $(zload-y)
 else
 VMLINUZ_LOAD_ADDRESS = $(shell $(obj)/calc_vmlinuz_load_addr \
-		$(obj)/vmlinux.bin $(VMLINUX_LOAD_ADDRESS))
+		$(obj)/vmlinux.bin $(VMLINUX_LINK_ADDRESS))
 endif
 UIMAGE_LOADADDR = $(VMLINUZ_LOAD_ADDRESS)
 
