Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96B31BD155
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 02:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2Ao3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 20:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726345AbgD2Ao2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 20:44:28 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617C1C03C1AC;
        Tue, 28 Apr 2020 17:44:28 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id z17so276779oto.4;
        Tue, 28 Apr 2020 17:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q3a/OwcJUClTFtdPkCJMChDN+Npv5Ve7snk/X+FSfAA=;
        b=REhMSSyjG8wb15bjdHxEvRYplh24v39LwCdYc4kI5UpNC3BSSHzSv5ZWJiaOqTEUbl
         ng02y4I1B8dNsr7CG2Ur7UrxdE3IiUgRyTiONLF2rUJzCbO2X2Za1Gw8J+KmBd9LA3cj
         sqIfg3dn4LCFXZbeOphct4A3Blma8eDHFlXd0Ej13A9wXoaBsD28R4Ni8C6wd5pyTrLJ
         FNa/yYK0FmmjwTMuaRJzjNE14JoKPdy7dCbZjm4yrzjN5Jlmg5RlfvvBX9/DGIWumvDu
         z0nxVTeNPYv2BrKQXkwS/0NBUbuvQHXxpid0WmB2qZx/cQduiJjOj/fTLUig8oz2fxdV
         Iu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q3a/OwcJUClTFtdPkCJMChDN+Npv5Ve7snk/X+FSfAA=;
        b=NirONBsz5sqAkNZfotzNW8Tq7Ao0cAVesoLPGRgaR5HNFirzLDD5kVTjtcNLEU83s6
         tg5TN4xcOcr5ZH5QPvux0EoBaPRMC3ll+/prhRqyw0H2uTl4rI/+GUlTkYEB3AnZbdzm
         X7lrXYX0gKTfVB7wWrI76Zd6wDDE/8dJry4jFD+gWgU6sZTXmkXeLtJfGxSEN1tzNPW9
         YMXV3lpWT1lbqhiuPXjBJA4Wk7yj7Kv1HEsvFXJuPlhdWffb+y0JQl8B12jddO3QCtk6
         ebRF5H40mA81OFGCrlhJoEeWfb2FLonPm5CposE2pkfb+XKxmJfxUzFoXwt4OhtBHWTr
         q4Ug==
X-Gm-Message-State: AGi0PuYSWsSrETtUzQM2BQV6RtVKNaqkmL1gEmAuQVru5ygCD4bwNwAL
        TTcswPC42P0G0tebs/kxUuE=
X-Google-Smtp-Source: APiQypJS+s0gDSqIr8tG4LXXlT4D8UfulsuigAaov5kCTjS4xUTHVdr4xAfyjlyvLrWdUKjHGTXMOw==
X-Received: by 2002:a05:6830:14d6:: with SMTP id t22mr25527253otq.323.1588121067634;
        Tue, 28 Apr 2020 17:44:27 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t20sm5249007ott.51.2020.04.28.17.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 17:44:27 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:44:25 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Fangrui Song <maskray@google.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200429004425.GA566019@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200428221419.2530697-5-natechancellor@gmail.com>
 <20200428225401.7yrld7u2xr67t4xf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428225401.7yrld7u2xr67t4xf@google.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 28, 2020 at 03:54:01PM -0700, Fangrui Song wrote:
> 
> On 2020-04-28, Nathan Chancellor wrote:
> > Currently, the VDSO is being linked through $(CC). This does not match
> > how the rest of the kernel links objects, which is through the $(LD)
> > variable.
> > 
> > When clang is built in a default configuration, it first attempts to use
> > the target triple's default linker then the system's default linker,
> > unless told otherwise through -fuse-ld=... We do not use -fuse-ld=
> > because it can be brittle and we have support for invoking $(LD)
> > directly. See commit fe00e50b2db8c ("ARM: 8858/1: vdso: use $(LD)
> > instead of $(CC) to link VDSO") and commit 691efbedc60d2 ("arm64: vdso:
> > use $(LD) instead of $(CC) to link VDSO") for examples of doing this in
> > the VDSO.
> > 
> > Do the same thing here. Replace the custom linking logic with $(cmd_ld)
> > and ldflags-y so that $(LD) is respected. We need to explicitly add two
> > flags to the linker that were implicitly passed by the compiler:
> > -G 0 (which comes from ccflags-vdso) and --eh-frame-hdr.
> > 
> > Before this patch (generated by adding '-v' to VDSO_LDFLAGS):
> > 
> > <gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/collect2 \
> > -plugin <gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/liblto_plugin.so \
> > -plugin-opt=<gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/lto-wrapper \
> > -plugin-opt=-fresolution=/tmp/ccGEi5Ka.res \
> > --eh-frame-hdr \
> > -G 0 \
> > -EB \
> > -mips64r2 \
> > -shared \
> > -melf64btsmip \
> > -o arch/mips/vdso/vdso.so.dbg.raw \
> > -L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0/64 \
> > -L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0 \
> > -L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0/../../../../mips64-linux/lib \
> > -Bsymbolic \
> > --no-undefined \
> > -soname=linux-vdso.so.1 \
> > -EB \
> > --hash-style=sysv \
> > --build-id \
> > -T arch/mips/vdso/vdso.lds \
> > arch/mips/vdso/elf.o \
> > arch/mips/vdso/vgettimeofday.o \
> > arch/mips/vdso/sigreturn.o
> > 
> > After this patch:
> > 
> > <gcc_prefix>/bin/mips64-linux-ld \
> > -m elf64btsmip \
> > -Bsymbolic \
> > --no-undefined \
> > -soname=linux-vdso.so.1 \
> > -EB \
> > -nostdlib \
> > -shared \
> > -G 0 \
> > --eh-frame-hdr \
> > --hash-style=sysv \
> > --build-id \
> > -T  arch/mips/vdso/vdso.lds \
> > arch/mips/vdso/elf.o \
> > arch/mips/vdso/vgettimeofday.o
> > arch/mips/vdso/sigreturn.o \
> > -o arch/mips/vdso/vdso.so.dbg.raw
> > 
> > Note that we leave behind -mips64r2. Turns out that ld ignores it (see
> > get_emulation in ld/ldmain.c). This is true of current trunk and 2.23,
> > which is the minimum supported version for the kernel:
> > 
> > https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=ld/ldmain.c;hb=aa4209e7b679afd74a3860ce25659e71cc4847d5#l593
> > https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=ld/ldmain.c;hb=a55e30b51bc6227d8d41f707654d0a5620978dcf#l641
> > 
> > Before this patch, LD=ld.lld did nothing:
> > 
> > $ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
> > String dump of section '.comment':
> > [     0] ClangBuiltLinux clang version 11.0.0
> > 
> > After this patch, it does:
> > 
> > $ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
> > String dump of section '.comment':
> > [     0] Linker: LLD 11.0.0
> > [    62] ClangBuiltLinux clang version 11.0.0
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/785
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> > 
> > v3 -> v4:
> > 
> > * Improve commit message to show that ld command is effectively the
> >  same as the one generated by GCC.
> > 
> > * Add '-G 0' and '--eh-frame-hdr' because they were added by GCC.
> 
> My understanding is that we start to use more -fasynchronous-unwind-tables to eliminate .eh_frame in object files.
> Without .eh_frame, LD --eh-frame-hdr is really not useful.

Ah, I was not paying attention; I figured that this was necessary
because the x86 VDSO broke without it:

cd01544a268ad ("x86/vdso: Pass --eh-frame-hdr to the linker")

However, they explicitly add -fasynchronous-unwind-tables so it seems
like this indeed can be removed. Kind of odd that GCC passes it along
even with -fno-asynchronous-unwind-tables. I will do that in v5 once I
get some feedback on whether or not anything else breaks.

Cheers,
Nathan

> Sigh...  -G 0. This is an option ignored by LLD. GCC devs probably should
> have used the long option --gpsize rather than take the short option -G.
> Even better, -z gpsize= or similar if this option is specific to ELF.
> > v2 -> v3:
> > 
> > * New patch.
> > 
> > arch/mips/vdso/Makefile | 13 ++++---------
> > 1 file changed, 4 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
> > index 92b53d1df42c3..2e64c7600eead 100644
> > --- a/arch/mips/vdso/Makefile
> > +++ b/arch/mips/vdso/Makefile
> > @@ -60,10 +60,9 @@ ifdef CONFIG_MIPS_DISABLE_VDSO
> > endif
> > 
> > # VDSO linker flags.
> > -VDSO_LDFLAGS := \
> > -	-Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1 \
> > -	$(addprefix -Wl$(comma),$(filter -E%,$(KBUILD_CFLAGS))) \
> > -	-nostdlib -shared -Wl,--hash-style=sysv -Wl,--build-id
> > +ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
> > +	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
> > +	-G 0 --eh-frame-hdr --hash-style=sysv --build-id -T
> > 
> > CFLAGS_REMOVE_vdso.o = -pg
> > 
> > @@ -82,11 +81,7 @@ quiet_cmd_vdso_mips_check = VDSOCHK $@
> > #
> > 
> > quiet_cmd_vdsold_and_vdso_check = LD      $@
> > -      cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check); $(cmd_vdso_mips_check)
> > -
> > -quiet_cmd_vdsold = VDSO    $@
> > -      cmd_vdsold = $(CC) $(c_flags) $(VDSO_LDFLAGS) \
> > -                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
> > +      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check); $(cmd_vdso_mips_check)
> > 
> > quiet_cmd_vdsoas_o_S = AS      $@
> >       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
> > -- 
> > 2.26.2
> > 
