Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B250E1B61C4
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 19:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbgDWRSc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 13:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729873AbgDWRSb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 13:18:31 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE557C09B042;
        Thu, 23 Apr 2020 10:18:31 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e26so7429179otr.2;
        Thu, 23 Apr 2020 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HTHjP+xa7tR8VrtaPBa2UF2GKJnEOq+tUvqQYj54eMQ=;
        b=tjYeQYK8VvbiOPzo8TUxhzj31UiEnUjECsKYPg8mn5f3pCU6P3dt3+oCtTjdQZewcz
         17m69DZH8rMnShig9IdmepYlZwDtpBhzBplY3CMc79ihrC7LNS4m8BDjj08bDreDLhRH
         d3nxrDs7H62FtNQDPxAKa5PWbEojZQvt4UdDYed1nVEGVorLrksg8Aus2lZ1NMOxMGsl
         +YcuM+B0UlxA8CLrRZrUrTVnulZmafszmH0oaRe7W7DIDDi+4BJuGqlx+hSwF8igluGG
         xW/PytbBIHoMM7efqzBvjL2Rplh7c3T0M+SuvOZdE49pBtITVuipzKgk75IxwN3ttV2h
         3sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HTHjP+xa7tR8VrtaPBa2UF2GKJnEOq+tUvqQYj54eMQ=;
        b=Z7uqbmhMtSg1kY6GSJHknn4FKnCFMvXNwURodm/r1NFC0FT/+MdPCHtIgEjEXxRaJU
         hfnM+SxHclIAWrHYGsa8W7sb1+FXPOsphMUo6tKyf4l7m7Nx3xccUcu52p7QJoBpe+TQ
         FEoyp/kNP0MJeJ36Rz1aimkRdsdlrXfJlyzbaexDKWed6KI6fTzDqqh2NIBjX24hks/a
         nPK+exFjUGYtHhJ8NA9LnAd0lLYQB+5yzwXiMdQ8jD/x9wXmSJss6tjR78eX/u5WwF+x
         EpgqAbgavGY2HvM5aK0DK30MYDo/mThNLGs8LRsx1Lj8M1zuG0iewTA1sBG7fQJ1wFVB
         my5g==
X-Gm-Message-State: AGi0PubYfvHEMvsmnFkTac3p3o4313uqVXmijROmZXzZZxXwN5ttH11f
        7XUtlgGo81xX2pn7366/lb0QX7x7uQo=
X-Google-Smtp-Source: APiQypKPRZpH7thOf4NzXz8RnEP35p9xmtvNx19TRvFX7ugLPZAfE2nSg5h0DwmglietxPfEx+VTlQ==
X-Received: by 2002:aca:53cd:: with SMTP id h196mr3919944oib.104.1587662311195;
        Thu, 23 Apr 2020 10:18:31 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id y5sm746726otq.38.2020.04.23.10.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 10:18:30 -0700 (PDT)
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
Subject: [PATCH v3 2/4] MIPS: VDSO: Move disabling the VDSO logic to Kconfig
Date:   Thu, 23 Apr 2020 10:18:05 -0700
Message-Id: <20200423171807.29713-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200423171807.29713-1-natechancellor@gmail.com>
References: <20200419202128.20571-1-natechancellor@gmail.com>
 <20200423171807.29713-1-natechancellor@gmail.com>
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

