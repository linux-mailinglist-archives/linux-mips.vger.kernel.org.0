Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8792C1AFE0A
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 22:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgDSUVw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 16:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgDSUVv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 16:21:51 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B248CC061A0C;
        Sun, 19 Apr 2020 13:21:51 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id r14so3923364pfg.2;
        Sun, 19 Apr 2020 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HrfHo3gwGIOtAf36S+sgbFqzxxgJQCzD86LmLZ5F4KY=;
        b=mnAdHYHtVbPwh95LrWoCAHkezV92Rpj8aT5HWhrXAE0At/B2ugr6R34oNQetPPTOe8
         pZhcF3dBjq8ixAj4OveCnNjNE/Jau5UEfkpIwUuMWfjEbF7vahauc25AMRyF4JIeQAyg
         snhn6U2AVl524MCdmeqhiyAgzQHR6bMcjJGBfzILLNkkZyV4q8DXMzOXs8o/mgh4tAN6
         DhWz2MI2iBUUiY3CqUoY7YjFbwHTvsF1EaXk5V0+Wga8jAtGDg8vyBQm3QGrylkdN4Bn
         NR2d+HAH4ci/NRMDrUyx2r45IDA/IJDKk8MLmS10P6bbpTnk4+Ysj80QRdl5ZUQelxwv
         F+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HrfHo3gwGIOtAf36S+sgbFqzxxgJQCzD86LmLZ5F4KY=;
        b=BzCgI2ojLIlPuvjB9hROhwg3s2v6HpanKBSGWWfHsIcUleHWjIDAJ33abVuBVutaGM
         pCOPAOXF2/idpo37P6Q5W4p02YPhQ3wf9o08SO0KJ61U3kgA3ki9aT2irZ0e1d4pvOL6
         xKfpR33ZbV5J8JWH1ttuoeNpz+3f65hHha0dbZca/291Hfltxm+w5rmMXHHuZEZZBJBf
         jitDWQPJUdlrLYYcKuv1kQXjV8a4x5mUpWKtKp9BNGPxtu0nA/0LLmhAWqwjPWEy54um
         CzetKrZrxeWXR9AGFKxn0Kou7E0HwPUx2l+QcjlebrFK2r7BoNCDXGJTEQoYAO2+UpzB
         Ihxw==
X-Gm-Message-State: AGi0PubnJj1hvToemYuKWTHy+wKJOT8M9+we4ISWlrM+91qeY5FG7hTi
        3XMwjG7u3Sua3DRuc7a86lo=
X-Google-Smtp-Source: APiQypJoaWrd3LmC0rVtZw0OJi/EdE0iPELykqTaptq+/XZ611nc/Ib2kDxcc0vAelDsBiYwFiySTQ==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr13072001pfa.15.1587327711147;
        Sun, 19 Apr 2020 13:21:51 -0700 (PDT)
Received: from Ryzen-7-3700X.localdomain ([82.102.31.53])
        by smtp.gmail.com with ESMTPSA id s66sm10881010pgb.84.2020.04.19.13.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 13:21:50 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v2 2/3] MIPS: VDSO: Move disabling the VDSO logic to Kconfig
Date:   Sun, 19 Apr 2020 13:21:27 -0700
Message-Id: <20200419202128.20571-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200419202128.20571-1-natechancellor@gmail.com>
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419202128.20571-1-natechancellor@gmail.com>
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

v1 -> v2:

* New patch.

 arch/mips/Kconfig         |  2 ++
 arch/mips/vdso/Kconfig    | 18 ++++++++++++++++++
 arch/mips/vdso/Makefile   | 30 ++----------------------------
 arch/mips/vdso/vdso.lds.S |  2 +-
 4 files changed, 23 insertions(+), 29 deletions(-)
 create mode 100644 arch/mips/vdso/Kconfig

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 690718b3701a..45220e4b8a65 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3275,3 +3275,5 @@ endmenu
 source "drivers/firmware/Kconfig"
 
 source "arch/mips/kvm/Kconfig"
+
+source "arch/mips/vdso/Kconfig"
diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
new file mode 100644
index 000000000000..36a52158d849
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
index d7fe8408603e..92b53d1df42c 100644
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
index da4627430aba..ffcb5fc12708 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -91,7 +91,7 @@ PHDRS
 VERSION
 {
 	LINUX_2.6 {
-#ifndef DISABLE_MIPS_VDSO
+#ifndef CONFIG_DISABLE_MIPS_VDSO
 	global:
 		__vdso_clock_gettime;
 		__vdso_gettimeofday;
-- 
2.26.1

