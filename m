Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CEE1BCFAA
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 00:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgD1WOv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 18:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726898AbgD1WOr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:47 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4999EC03C1AD;
        Tue, 28 Apr 2020 15:14:47 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id z17so35708450oto.4;
        Tue, 28 Apr 2020 15:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5MojLeIiS5IJ/f4OVpVWsw3ucrS28qn0/t/fHk4cEKI=;
        b=b/C9LOZ0PhFIybMMzacd5jkAEASReFP1A6oZuZTQSOyUW3Rmvy9DQHjLXwFZeuCXnk
         0BJ0VMqjzl9Xk5f2oxAjSrdEmTLnBq+ALBBSt2BVxDo7VBQg0s8rXXuVlE0AXpsfV2MB
         ho5HS+pfA3QlVD78R+8yFZCqYlDzjmFcyfdGzy6wuTY5Qy6P8H/xkYC/5dy1OlhImz4t
         sGgzeAzDB4LL3pEj2Er8/yymkukWJ+sPhJATj8Glt3etrKDxrLemxrR1GAyytutqhUHc
         RrOwosNmI0y8reCfHdOJjFudRuAYIlnETabEKhOUWXXu0l7jAcLUoDnVUdH7C4GFxJQz
         VbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5MojLeIiS5IJ/f4OVpVWsw3ucrS28qn0/t/fHk4cEKI=;
        b=X+py0a72r73bLk0wFBnpN3Cd9kUeC1VjC9uRCOXzWwZEq8eV2aSUxBkrYF2S/7VAIa
         Hq5IEF9h/WG1aNDxTyjLSqgGyYFOktgLn3F4AWZFrhKKl0gQwuDl7uhJdiT2pdfntwZm
         twsuBRU+JG2pEbahEGzp1P2OXbVoKMHTVCKcKXeAo4CtZMlK4USySsocRTJdX30dvkqV
         X2EjuthS6qMZ1N/dmL3xobBq2yHSxe1s8mCMpJ6cWDQqbHvLN2e/ux60QSyauXQ/lS57
         dgxHhA/9XWtu5pbqD6afbGCgP7VvIFpmzI24zAii944ExusyTQQnj/5GiGcLBzoa9pb4
         tIog==
X-Gm-Message-State: AGi0Pub3UzTf+QeEtzOxZvdEuuYLcIE230L2ZSEwBk3gXvs7w6OP7cYW
        C6ZymaWUw632wY2yqLggjHU=
X-Google-Smtp-Source: APiQypJfyklPMFQQYQL1OuANyjySeCQPdGYH7TjSCjrF2emF6AGXFPjeHCraQdzzIrRauzMdS8QFpQ==
X-Received: by 2002:a9d:d06:: with SMTP id 6mr25675586oti.188.1588112086606;
        Tue, 28 Apr 2020 15:14:46 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 186sm5267476ooi.30.2020.04.28.15.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 15:14:45 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link VDSO
Date:   Tue, 28 Apr 2020 15:14:18 -0700
Message-Id: <20200428221419.2530697-5-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200428221419.2530697-1-natechancellor@gmail.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, the VDSO is being linked through $(CC). This does not match
how the rest of the kernel links objects, which is through the $(LD)
variable.

When clang is built in a default configuration, it first attempts to use
the target triple's default linker then the system's default linker,
unless told otherwise through -fuse-ld=... We do not use -fuse-ld=
because it can be brittle and we have support for invoking $(LD)
directly. See commit fe00e50b2db8c ("ARM: 8858/1: vdso: use $(LD)
instead of $(CC) to link VDSO") and commit 691efbedc60d2 ("arm64: vdso:
use $(LD) instead of $(CC) to link VDSO") for examples of doing this in
the VDSO.

Do the same thing here. Replace the custom linking logic with $(cmd_ld)
and ldflags-y so that $(LD) is respected. We need to explicitly add two
flags to the linker that were implicitly passed by the compiler:
-G 0 (which comes from ccflags-vdso) and --eh-frame-hdr.

Before this patch (generated by adding '-v' to VDSO_LDFLAGS):

<gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/collect2 \
-plugin <gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/liblto_plugin.so \
-plugin-opt=<gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/lto-wrapper \
-plugin-opt=-fresolution=/tmp/ccGEi5Ka.res \
--eh-frame-hdr \
-G 0 \
-EB \
-mips64r2 \
-shared \
-melf64btsmip \
-o arch/mips/vdso/vdso.so.dbg.raw \
-L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0/64 \
-L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0 \
-L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0/../../../../mips64-linux/lib \
-Bsymbolic \
--no-undefined \
-soname=linux-vdso.so.1 \
-EB \
--hash-style=sysv \
--build-id \
-T arch/mips/vdso/vdso.lds \
arch/mips/vdso/elf.o \
arch/mips/vdso/vgettimeofday.o \
arch/mips/vdso/sigreturn.o

After this patch:

<gcc_prefix>/bin/mips64-linux-ld \
-m elf64btsmip \
-Bsymbolic \
--no-undefined \
-soname=linux-vdso.so.1 \
-EB \
-nostdlib \
-shared \
-G 0 \
--eh-frame-hdr \
--hash-style=sysv \
--build-id \
-T  arch/mips/vdso/vdso.lds \
arch/mips/vdso/elf.o \
arch/mips/vdso/vgettimeofday.o
arch/mips/vdso/sigreturn.o \
-o arch/mips/vdso/vdso.so.dbg.raw

Note that we leave behind -mips64r2. Turns out that ld ignores it (see
get_emulation in ld/ldmain.c). This is true of current trunk and 2.23,
which is the minimum supported version for the kernel:

https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=ld/ldmain.c;hb=aa4209e7b679afd74a3860ce25659e71cc4847d5#l593
https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=ld/ldmain.c;hb=a55e30b51bc6227d8d41f707654d0a5620978dcf#l641

Before this patch, LD=ld.lld did nothing:

$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
String dump of section '.comment':
[     0] ClangBuiltLinux clang version 11.0.0

After this patch, it does:

$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
String dump of section '.comment':
[     0] Linker: LLD 11.0.0
[    62] ClangBuiltLinux clang version 11.0.0

Link: https://github.com/ClangBuiltLinux/linux/issues/785
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v3 -> v4:

* Improve commit message to show that ld command is effectively the
  same as the one generated by GCC.

* Add '-G 0' and '--eh-frame-hdr' because they were added by GCC.

v2 -> v3:

* New patch.

 arch/mips/vdso/Makefile | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 92b53d1df42c3..2e64c7600eead 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -60,10 +60,9 @@ ifdef CONFIG_MIPS_DISABLE_VDSO
 endif
 
 # VDSO linker flags.
-VDSO_LDFLAGS := \
-	-Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1 \
-	$(addprefix -Wl$(comma),$(filter -E%,$(KBUILD_CFLAGS))) \
-	-nostdlib -shared -Wl,--hash-style=sysv -Wl,--build-id
+ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
+	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
+	-G 0 --eh-frame-hdr --hash-style=sysv --build-id -T
 
 CFLAGS_REMOVE_vdso.o = -pg
 
@@ -82,11 +81,7 @@ quiet_cmd_vdso_mips_check = VDSOCHK $@
 #
 
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check); $(cmd_vdso_mips_check)
-
-quiet_cmd_vdsold = VDSO    $@
-      cmd_vdsold = $(CC) $(c_flags) $(VDSO_LDFLAGS) \
-                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
+      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check); $(cmd_vdso_mips_check)
 
 quiet_cmd_vdsoas_o_S = AS      $@
       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
-- 
2.26.2

