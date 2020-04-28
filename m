Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5CD1BB3D8
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 04:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgD1CRk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 22:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726251AbgD1CRk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 22:17:40 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AF5C03C1A8;
        Mon, 27 Apr 2020 19:17:40 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m13so29986120otf.6;
        Mon, 27 Apr 2020 19:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BmzYkSZJw46ftci/MHsN8rVkPDSOUgE2j3h7GJ0Fks8=;
        b=vL04rXfQvKWKLOTmVx/y0ZnFLyIr3DQU6JUfJOSqTvsndS6+AFufohM4uec944uyPL
         87eKP4+rBqtjfgt3neo65jO22FHXXefw0knhQmmGfGa9N3glF2HAewE7xv6/N2RXQ7xc
         Ssr5PuE+wTE0tF/GSxJkp12TOP8Wphz8Q1+JZbjQ72GDZhrhdYpxWNtTnn/0plgKIo14
         RkdYiNBPFeyEsBn8UZHkfzl5JLHmghvdRCPxypBNQ3RxezbTaUOjPUzUepk+usGSVZzU
         mnePF7rtEifBhcrEDoac68/cmtKBkkfVRgJHeao3HkaxV5GSJgAKVoSet3F2iwe3Rdsc
         IwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BmzYkSZJw46ftci/MHsN8rVkPDSOUgE2j3h7GJ0Fks8=;
        b=EaBMiKZuiE9fCO39FBTMi49gjs1w/8+JoqasI8zT8U4Tk1buYV/PeZdBLLU4baVJWR
         Szyvz8tmew56Qn++2nkz2dyD7Zf/JEsQLqCFbdK4CvGY+9Yv89aK9RvZVSIuGk7Jlq9Q
         2PXlAO433ahEil4dmiWsVAmgNNJOuuNpcx/bVobfFX05sAZW+My3veHNbYmkidcCJZCv
         xxiELBm3XFDOEwiM0MSSv9OSNOWlzQke8CfLaDpvyoXuoAKuFjDrsU8WXLfhPAswwJwN
         4pr7xyped2ElBJ2lrDmM07fEKsrhGDfL9jIm/rAmNoIqPkNsm6A64ZTFRsY/BcBs683M
         QSOg==
X-Gm-Message-State: AGi0PuZo/r+W+3HQJcI+SFPRq0MFfAZ9KcaTHO5ydVbZwwHWV0UmcW3B
        XQ2eorZ8Xoa0synJbYhZSF8=
X-Google-Smtp-Source: APiQypIF98fCtl8pK8X9bVVrY45B4dnvdX4mnerURMhU5UO8rq60S4DZw3BTGckjpYyCEDKgn60pxg==
X-Received: by 2002:aca:5716:: with SMTP id l22mr1348964oib.43.1588040259308;
        Mon, 27 Apr 2020 19:17:39 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id d61sm1580656otb.58.2020.04.27.19.17.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 19:17:38 -0700 (PDT)
Date:   Mon, 27 Apr 2020 19:17:37 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200428021737.GA7351@ubuntu-s3-xlarge-x86>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
 <20200423171807.29713-3-natechancellor@gmail.com>
 <20200426162737.GA9322@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426162737.GA9322@alpha.franken.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 06:27:37PM +0200, Thomas Bogendoerfer wrote:
> On Thu, Apr 23, 2020 at 10:18:06AM -0700, Nathan Chancellor wrote:
> > Currently, the VDSO is being linked through $(CC). This does not match
> > how the rest of the kernel links objects, which is through the $(LD)
> > variable.
> 
> this causes build errors for me when (cross) compiling a big endian target:
> 
> target is little endian
> mips64-linux-gnu-ld: arch/mips/vdso/elf.o: endianness incompatible with that of the selected emulation
> mips64-linux-gnu-ld: failed to merge target specific data of file arch/mips/vdso/elf.o
> 
> Thomas.
> 

Thanks for reporting this, I figured it out. This is the solution that I
came up with, I'll send out a v4 tomorrow once I do some more testing.

Cheers,
Nathan

From 256e3b6c8fff7a66aa29961ebefc0fe653ec34b6 Mon Sep 17 00:00:00 2001
From: Nathan Chancellor <natechancellor@gmail.com>
Date: Mon, 27 Apr 2020 17:02:55 -0700
Subject: [PATCH] MIPS: Unconditionally specify '-EL' or '-EB'

This was all done to work around a GCC bug that has been fixed after
4.2. The kernel requires GCC 4.6 or newer so remove all of these hacks
and just use the traditional flags.

 $ mips64-linux-gcc --version | head -n1
 mips64-linux-gcc (GCC) 4.6.3

 $ mips64-linux-gcc -EB -dM -E -C -x c /dev/null | grep MIPSE
 #define MIPSEB 1
 #define __MIPSEB__ 1
 #define _MIPSEB 1
 #define __MIPSEB 1

 $ mips64-linux-gcc -EL -dM -E -C -x c /dev/null | grep MIPSE
 #define __MIPSEL__ 1
 #define MIPSEL 1
 #define _MIPSEL 1
 #define __MIPSEL 1

This is necessary when converting the MIPS VDSO to use $(LD) instead of
$(CC) to link because the OUTPUT_FORMAT is defaulted to little endian
and only flips to big endian when -EB is set on the command line, which
is inherited from KBUILD_CFLAGS. Without this, we will see the following
error when compiling for big endian (64r2_defconfig):

$ make -j$(nproc) ARCH=mips CROSS_COMPILE=mips64-linux- \
  64r2el_defconfig arch/mips/vdso/
...
mips64-linux-ld: arch/mips/vdso/elf.o: compiled for a big endian system
and target is little endian
mips64-linux-ld: arch/mips/vdso/elf.o: endianness incompatible with that
of the selected emulation
mips64-linux-ld: failed to merge target specific data of file
arch/mips/vdso/elf.o
...

Reported-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/Makefile | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed81565..301efb90b51ed 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -116,33 +116,8 @@ endif
 
 cflags-y += -ffreestanding
 
-#
-# We explicitly add the endianness specifier if needed, this allows
-# to compile kernels with a toolchain for the other endianness. We
-# carefully avoid to add it redundantly because gcc 3.3/3.4 complains
-# when fed the toolchain default!
-#
-# Certain gcc versions up to gcc 4.1.1 (probably 4.2-subversion as of
-# 2006-10-10 don't properly change the predefined symbols if -EB / -EL
-# are used, so we kludge that here.  A bug has been filed at
-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=29413.
-#
-# clang doesn't suffer from these issues and our checks against -dumpmachine
-# don't work so well when cross compiling, since without providing --target
-# clang's output will be based upon the build machine. So for clang we simply
-# unconditionally specify -EB or -EL as appropriate.
-#
-ifdef CONFIG_CC_IS_CLANG
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -EB
 cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -EL
-else
-undef-all += -UMIPSEB -U_MIPSEB -U__MIPSEB -U__MIPSEB__
-undef-all += -UMIPSEL -U_MIPSEL -U__MIPSEL -U__MIPSEL__
-predef-be += -DMIPSEB -D_MIPSEB -D__MIPSEB -D__MIPSEB__
-predef-le += -DMIPSEL -D_MIPSEL -D__MIPSEL -D__MIPSEL__
-cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(shell $(CC) -dumpmachine |grep -q 'mips.*el-.*' && echo -EB $(undef-all) $(predef-be))
-cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= $(shell $(CC) -dumpmachine |grep -q 'mips.*el-.*' || echo -EL $(undef-all) $(predef-le))
-endif
 
 cflags-$(CONFIG_SB1XXX_CORELIS)	+= $(call cc-option,-mno-sched-prolog) \
 				   -fno-omit-frame-pointer
-- 
2.26.2

