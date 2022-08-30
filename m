Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7C55A6D73
	for <lists+linux-mips@lfdr.de>; Tue, 30 Aug 2022 21:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbiH3ThJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Aug 2022 15:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbiH3ThI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Aug 2022 15:37:08 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD1761D94
        for <linux-mips@vger.kernel.org>; Tue, 30 Aug 2022 12:37:06 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id f12-20020a25b6cc000000b0069a9e36de26so492289ybm.16
        for <linux-mips@vger.kernel.org>; Tue, 30 Aug 2022 12:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc;
        bh=HzbcF/PG+Qawg6hoRF5n8gXT8jVmH+0bSMmdlpBSH5Q=;
        b=WpitjJHu8yxIzlhTDzfzTCcSOyFFbGrF9N7RrYOmSR07TVUgSws08DXXqfslj/EH5j
         IsYZqhJ5K8tAhqVApAq2q/WIC/++F5MDzikJlI38OBsGNSnjrVnezaJyqELJ24AWj9oY
         +7zvlA29KkLUGk9Uj43LWRMl4eQscf8yt8u3sVQKPxrcuFB3XdTu33eTM9AW7mrkzjHJ
         MWB68cpxlcvUtd5L6VGzqO0qLNv4Hgt9Va3PWgaVR9ZPp1c62DtJKo0xM30WTUSA53v6
         pG4vF6AJRUnrXSYmplq5oKz4I9od/3GkzCLSCofbWUy+mWFkhhKIj3T9xk09kAq1idXu
         8d5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc;
        bh=HzbcF/PG+Qawg6hoRF5n8gXT8jVmH+0bSMmdlpBSH5Q=;
        b=XAI4itddtGMc/MOuNeljpYE0XXBjtt23z+OqF8pZNfoTQPiEdkJJ0p8wC6ga8/ThMd
         lLNJ++OQi13zPiqoWe+kO0oUJNR5CZemhQSGcl5fzw92lR/rhRZ6TRnQtlC7ajsoHLIV
         6++lBihuqn4vIaJ1AA6r+ksypDXcHP+aT337Hr6Qm1WF5TBV4UfzqMscdasiVz5tUWjs
         VMdf6seKxNBvdXt/lI5Rq2+WgNOz8v1yH9hT+abnbixu+SCqaVlcBEVf3AbG5nUnqBNm
         lC52C68Ap16VLr0+fNCFyNgp9foXwxNeOIMiXwB3iUsczh59KWFtRP4ND6/Cg1+vKw0E
         RnCQ==
X-Gm-Message-State: ACgBeo2dIeP7GpFQBs/SdtTfLOK4W1z3BHgFlvuPkO186/qCUaz7Xb0a
        jCMM+6hnnvzu2142kQvlEHq2IN4R8xa5
X-Google-Smtp-Source: AA6agR7bVRyO8OFgpLGeXzgagUQGCk3zR5h8YG1Nini2V46NdLsYk5dAFhH/q7QqcX6WfjSFE1K09uH566NU
X-Received: from maskray1.svl.corp.google.com ([2620:15c:2ce:200:2c5:644c:c610:2bb9])
 (user=maskray job=sendgmr) by 2002:a0d:eb4f:0:b0:341:8004:8ebd with SMTP id
 u76-20020a0deb4f000000b0034180048ebdmr3573747ywe.396.1661888225675; Tue, 30
 Aug 2022 12:37:05 -0700 (PDT)
Date:   Tue, 30 Aug 2022 12:37:01 -0700
Mime-Version: 1.0
Message-ID: <20220830193701.1702962-1-maskray@google.com>
Subject: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
From:   Fangrui Song <maskray@google.com>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Cc:     Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The actual intention is that no dynamic relocation exists. However, some
GNU ld ports produce unneeded R_*_NONE. (If a port is not care enough to
determine the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
relocations. E.g. powerpc64le ld as of 2.38 has the issue with
defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So just
ignore them.

With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
not called "absolute relocations". (The patch is motivated by the arm64
port missing R_AARCH64_RELATIVE.)

While here, replace "egrep" with "grep" as "egrep" is deprecated in GNU
grep 3.7.

Signed-off-by: Fangrui Song <maskray@google.com>
---
 arch/arm/vdso/Makefile            |  3 ---
 arch/arm64/kernel/vdso/Makefile   |  3 ---
 arch/arm64/kernel/vdso32/Makefile |  3 ---
 arch/csky/kernel/vdso/Makefile    |  3 ---
 arch/loongarch/vdso/Makefile      |  3 ---
 arch/mips/vdso/Makefile           |  3 ---
 arch/powerpc/kernel/vdso/Makefile |  1 -
 arch/riscv/kernel/vdso/Makefile   |  3 ---
 arch/s390/kernel/vdso32/Makefile  |  2 --
 arch/s390/kernel/vdso64/Makefile  |  2 --
 arch/x86/entry/vdso/Makefile      |  4 ----
 lib/vdso/Makefile                 | 13 ++++---------
 12 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 8ca1c9f262a2..5ebd2e6f7d46 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
 include $(srctree)/lib/vdso/Makefile
 
 hostprogs := vdsomunge
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index bafbf78fab77..66dc4f338a86 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -6,9 +6,6 @@
 # Heavily based on the vDSO Makefiles for other archs.
 #
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_AARCH64_JUMP_SLOT|R_AARCH64_GLOB_DAT|R_AARCH64_ABS64
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso := vgettimeofday.o note.o sigreturn.o
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 36c8f66cad25..48d713d59ef2 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -3,9 +3,6 @@
 # Makefile for vdso32
 #
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_ARM_JUMP_SLOT|R_ARM_GLOB_DAT|R_ARM_ABS32
 include $(srctree)/lib/vdso/Makefile
 
 # Same as cc-*option, but using CC_COMPAT instead of CC
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 0b6909f10667..86c8c4de1b0f 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_CKCORE_ADDR32|R_CKCORE_JUMP_SLOT
 include $(srctree)/lib/vdso/Makefile
 
 # Symbols present in the vdso
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index d89e2ac75f7b..1b2e0f149f55 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Objects to go into the VDSO.
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_LARCH_32|R_LARCH_64|R_LARCH_MARK_LA|R_LARCH_JUMP_SLOT
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso-y := elf.o vgetcpu.o vgettimeofday.o sigreturn.o
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index f72658b3a53f..cea97abffc03 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -4,9 +4,6 @@
 # Sanitizer runtimes are unavailable and cannot be linked here.
  KCSAN_SANITIZE			:= n
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_MIPS_JUMP_SLOT|R_MIPS_GLOB_DAT
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 096b0bf1335f..d3c5be32034d 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -2,7 +2,6 @@
 
 # List of files in the vdso, has to be asm only for now
 
-ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN|R_PPC_REL24
 include $(srctree)/lib/vdso/Makefile
 
 obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o note-32.o getcpu-32.o
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f2e065671e4d..77d6bed3a700 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Copied from arch/tile/kernel/vdso/Makefile
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
 include $(srctree)/lib/vdso/Makefile
 # Symbols present in the vdso
 vdso-syms  = rt_sigreturn
diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
index 245bddfe9bc0..e795fdbbf484 100644
--- a/arch/s390/kernel/vdso32/Makefile
+++ b/arch/s390/kernel/vdso32/Makefile
@@ -2,8 +2,6 @@
 # List of files in the vdso
 
 KCOV_INSTRUMENT := n
-ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
-ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
 
 include $(srctree)/lib/vdso/Makefile
 obj-vdso32 = vdso_user_wrapper-32.o note-32.o
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index 9e2b95a222a9..47dbbfdfad68 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -2,8 +2,6 @@
 # List of files in the vdso
 
 KCOV_INSTRUMENT := n
-ARCH_REL_TYPE_ABS := R_390_COPY|R_390_GLOB_DAT|R_390_JMP_SLOT|R_390_RELATIVE
-ARCH_REL_TYPE_ABS += R_390_GOT|R_390_PLT
 
 include $(srctree)/lib/vdso/Makefile
 obj-vdso64 = vdso_user_wrapper.o note.o
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index 12f6c4d714cd..a97f3630ca20 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -3,10 +3,6 @@
 # Building vDSO images for x86.
 #
 
-# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
-# the inclusion of generic Makefile.
-ARCH_REL_TYPE_ABS := R_X86_64_JUMP_SLOT|R_X86_64_GLOB_DAT|R_X86_64_RELATIVE|
-ARCH_REL_TYPE_ABS += R_386_GLOB_DAT|R_386_JMP_SLOT|R_386_RELATIVE
 include $(srctree)/lib/vdso/Makefile
 
 # Sanitizer runtimes are unavailable and cannot be linked here.
diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile
index c415a685d61b..9f031eafc465 100644
--- a/lib/vdso/Makefile
+++ b/lib/vdso/Makefile
@@ -5,18 +5,13 @@ GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
 
 c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix $(GENERIC_VDSO_DIR), gettimeofday.c)
 
-# This cmd checks that the vdso library does not contain absolute relocation
+# This cmd checks that the vdso library does not contain dynamic relocations.
 # It has to be called after the linking of the vdso library and requires it
 # as a parameter.
 #
-# $(ARCH_REL_TYPE_ABS) is defined in the arch specific makefile and corresponds
-# to the absolute relocation types printed by "objdump -R" and accepted by the
-# dynamic linker.
-ifndef ARCH_REL_TYPE_ABS
-$(error ARCH_REL_TYPE_ABS is not set)
-endif
-
+# As a workaround for some GNU ld ports which produce unneeded R_*_NONE
+# dynamic relocations, ignore R_*_NONE.
 quiet_cmd_vdso_check = VDSOCHK $@
-      cmd_vdso_check = if $(OBJDUMP) -R $@ | egrep -h "$(ARCH_REL_TYPE_ABS)"; \
+      cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
 		       then (echo >&2 "$@: dynamic relocations are not supported"; \
 			     rm -f $@; /bin/false); fi
-- 
2.37.2.672.g94769d06f0-goog

