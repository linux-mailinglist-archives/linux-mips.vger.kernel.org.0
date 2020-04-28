Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F402C1BCF9A
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 00:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgD1WOo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 18:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726884AbgD1WOn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:43 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336C8C03C1AC;
        Tue, 28 Apr 2020 15:14:43 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id a2so4549747oia.11;
        Tue, 28 Apr 2020 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zb1r7udqkPpghcAA099YBR0r79TnU7CL/+l6zX2FrtY=;
        b=l27izJS8OBRWIRDCtgzoOfsf44WXDIr+bbAE+m2Td4/0V1MoS1gixfeA8Oh99cr5Y3
         x8CPHcfkAzXrpZAfBFS5heTG3I0/YvVpnR06h6RHzS+yT4gDAs5DTtSar1MJ7MMjoDxT
         zNLVsZ7FeQnjNQ1tYSg5H+UdmUSVKGmvfaocdilZjwuZv+dLBZUjZvbQoWOYySbBzI16
         0LHLiZmT7pA5PyT592U63KzACQAyo32kPUJzxPMFhMZvHI1JbNFn9f+rlbN2qGJoDF21
         zZ0y8Ajr2+hxJj7st2x+WQtcKqcUQC4RwYBtJc5HXWQbMx/ac2qwDIR4mvoAoC2idmfZ
         KSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zb1r7udqkPpghcAA099YBR0r79TnU7CL/+l6zX2FrtY=;
        b=RjXZjK4UHJRsgqDYs8RCYu3n2d9SvBtPX3iZxgPS9dS/3RVbuIUESVb6qMmZEr/iis
         d71Y4Wb1xi5ZapQrVTqPFsByX2eWXcoBUv8Jvw3Bbi4yhFMdU4IRy/aDyR7nQ3HHtQAx
         OdkS+ZntNes9yrzo4zn92H+mMndT4S5LZpClJ5MfowFfzIWmI75kw2Buxo+YN3VILcgo
         hknHYn9xSMDZ0Naw9QJGsonaacZakLKRX0wtu0fZsUqVBlCYXwLMENA015CR3BtGSxjk
         E5dmhz5hzf6uU0bkg2k1rKVCCoM7FvKJwUGSYWSIIIlzYpoznHOpsFYb+XXgULvZvZAP
         srEQ==
X-Gm-Message-State: AGi0PuYHJ2bwBJByvBbdXo75A7YIMzx1Dsu3yj1HfzCkd8rGY+DGfA/i
        sc6L13mer9vpwQasyw+w6ml2tQCEb7s=
X-Google-Smtp-Source: APiQypIX6wAdCIUfNT1DTBfD1vHWMIOvDzIFzcWFGd4o0rt0yf0/tRDn8udG2XDVwZ2ByYagld2Vbw==
X-Received: by 2002:aca:5e41:: with SMTP id s62mr4503048oib.53.1588112082531;
        Tue, 28 Apr 2020 15:14:42 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 186sm5267476ooi.30.2020.04.28.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 15:14:41 -0700 (PDT)
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
Subject: [PATCH v4 2/5] MIPS: VDSO: Move disabling the VDSO logic to Kconfig
Date:   Tue, 28 Apr 2020 15:14:16 -0700
Message-Id: <20200428221419.2530697-3-natechancellor@gmail.com>
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

After commit 9553d16fa671 ("init/kconfig: Add LD_VERSION Kconfig"), we
have access to GNU ld's version at configuration time. As a result, we
can make it clearer under what configuration circumstances the MIPS VDSO
needs to be disabled.

This is a prerequisite for getting rid of the MIPS VDSO binutils
warning and linking the VDSO when LD is ld.lld. Wrapping the call to
ld-ifversion with CONFIG_LD_IS_LLD does not work because the config
values are wiped away during 'make clean'.

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v3 -> v4:

* No changes.

v2 -> v3:

* Fix CONFIG macro in arch/mips/vdso/vdso.lds.S, thanks to Sedat for
  catching it.

v1 -> v2:

* New patch.

 arch/mips/Kconfig         |  2 ++
 arch/mips/vdso/Kconfig    | 18 ++++++++++++++++++
 arch/mips/vdso/Makefile   | 30 ++----------------------------
 arch/mips/vdso/vdso.lds.S |  2 +-
 4 files changed, 23 insertions(+), 29 deletions(-)
 create mode 100644 arch/mips/vdso/Kconfig

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 690718b3701af..45220e4b8a653 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3275,3 +3275,5 @@ endmenu
 source "drivers/firmware/Kconfig"
 
 source "arch/mips/kvm/Kconfig"
+
+source "arch/mips/vdso/Kconfig"
diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
new file mode 100644
index 0000000000000..36a52158d849b
--- /dev/null
+++ b/arch/mips/vdso/Kconfig
@@ -0,0 +1,18 @@
+# For the pre-R6 code in arch/mips/vdso/vdso.h for locating
+# the base address of VDSO, the linker will emit a R_MIPS_PC32
+# relocation in binutils > 2.25 but it will fail with older versions
+# because that relocation is not supported for that symbol. As a result
+# of which we are forced to disable the VDSO symbols when building
+# with < 2.25 binutils on pre-R6 kernels. For more references on why we
+# can't use other methods to get the base address of VDSO please refer to
+# the comments on that file.
+#
+# GCC (at least up to version 9.2) appears to emit function calls that make use
+# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
+# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
+
+config MIPS_LD_CAN_LINK_VDSO
+	def_bool LD_VERSION >= 225000000
+
+config MIPS_DISABLE_VDSO
+	def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index d7fe8408603e8..92b53d1df42c3 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -52,37 +52,11 @@ endif
 
 CFLAGS_REMOVE_vgettimeofday.o = -pg
 
-DISABLE_VDSO := n
-
-#
-# For the pre-R6 code in arch/mips/vdso/vdso.h for locating
-# the base address of VDSO, the linker will emit a R_MIPS_PC32
-# relocation in binutils > 2.25 but it will fail with older versions
-# because that relocation is not supported for that symbol. As a result
-# of which we are forced to disable the VDSO symbols when building
-# with < 2.25 binutils on pre-R6 kernels. For more references on why we
-# can't use other methods to get the base address of VDSO please refer to
-# the comments on that file.
-#
-ifndef CONFIG_CPU_MIPSR6
-  ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
+ifdef CONFIG_MIPS_DISABLE_VDSO
+  ifndef CONFIG_MIPS_LD_CAN_LINK_VDSO
     $(warning MIPS VDSO requires binutils >= 2.25)
-    DISABLE_VDSO := y
   endif
-endif
-
-#
-# GCC (at least up to version 9.2) appears to emit function calls that make use
-# of the GOT when targeting microMIPS, which we can't use in the VDSO due to
-# the lack of relocations. As such, we disable the VDSO for microMIPS builds.
-#
-ifdef CONFIG_CPU_MICROMIPS
-  DISABLE_VDSO := y
-endif
-
-ifeq ($(DISABLE_VDSO),y)
   obj-vdso-y := $(filter-out vgettimeofday.o, $(obj-vdso-y))
-  ccflags-vdso += -DDISABLE_MIPS_VDSO
 endif
 
 # VDSO linker flags.
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index da4627430aba4..d90b65724d78e 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -91,7 +91,7 @@ PHDRS
 VERSION
 {
 	LINUX_2.6 {
-#ifndef DISABLE_MIPS_VDSO
+#ifndef CONFIG_MIPS_DISABLE_VDSO
 	global:
 		__vdso_clock_gettime;
 		__vdso_gettimeofday;
-- 
2.26.2

