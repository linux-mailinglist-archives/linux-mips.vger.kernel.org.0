Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECA03D493B
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 20:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhGXSH1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 14:07:27 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:28801 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhGXSH1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 14:07:27 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Sat, 24 Jul 2021 14:07:27 EDT
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-02.nifty.com with ESMTP id 16OIcI4t004960
        for <linux-mips@vger.kernel.org>; Sun, 25 Jul 2021 03:38:33 +0900
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 16OIa5fW011807;
        Sun, 25 Jul 2021 03:36:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 16OIa5fW011807
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627151766;
        bh=adPHQfj4dkdvDSuI2P8Sk/NYpUO6MJy1Eba1ZmTwIqQ=;
        h=From:To:Cc:Subject:Date:From;
        b=mwy+A+WoxA23v7DCIpvZqa01h//pg2w0vRfZRtk8hESAyrN042xstnK84DPzcoea0
         Beda2yGgKgQ8ezrhrsTt1sXbPOJVN3u+19AnZEZNSpg+BoT1oOKRYZ24GdaREpBSCn
         fD9NIOGpMZKN8TG7PKW0m/idNM80eGkYUAGzJa+tKDxXaQWP4Zzm9qib1DY3lLHfHW
         GHHMdqyJ78F6lyNZaPnF16HDyOdcyDxrft1d5WodjnFot7HDAPGwEAIWBQ2c4IBBcU
         OwFO3HimmyMXY2tYJBWOsoT2f9X+/B9V6bemsoVMOgCLlVzfQnqiuT3+B1bA7FQbAi
         +/wU2T2agkHoA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
        Richard Weinberger <richard@nod.at>,
        Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: [PATCH] kbuild: do not require sub-make for separate output tree builds
Date:   Sun, 25 Jul 2021 03:35:56 +0900
Message-Id: <20210724183556.76680-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As explained in commit 3204a7fb98a3 ("kbuild: prefix $(srctree)/ to some
included Makefiles"), I want to stop using --include-dir some day.

I already fixed up the top Makefile, but some arch Makefiles (mips, um,
x86) still include check-in Makefiles without $(srctree)/.

Fix them up so 'need-sub-make := 1' can go away for this case.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile           | 5 ++---
 arch/mips/Makefile | 2 +-
 arch/um/Makefile   | 6 +++---
 arch/x86/Makefile  | 2 +-
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index e4f5895badb5..bb10a93edf5c 100644
--- a/Makefile
+++ b/Makefile
@@ -191,10 +191,9 @@ endif
 ifneq ($(abs_srctree),$(abs_objtree))
 # Look for make include files relative to root of kernel src
 #
-# This does not become effective immediately because MAKEFLAGS is re-parsed
-# once after the Makefile is read. We need to invoke sub-make.
+# --included-dir is added for backward compatibility, but you should not rely on
+# it. Please add $(srctree)/ prefix to include Makefiles in the source tree.
 MAKEFLAGS += --include-dir=$(abs_srctree)
-need-sub-make := 1
 endif
 
 ifneq ($(filter 3.%,$(MAKE_VERSION)),)
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 4e942b7ef022..bc2e1857d8ce 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -254,7 +254,7 @@ endif
 #
 # Board-dependent options and extra files
 #
-include arch/mips/Kbuild.platforms
+include $(srctree)/arch/mips/Kbuild.platforms
 
 ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 12a7acef0357..f2fe63bfd819 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -41,8 +41,8 @@ endif
 
 HOST_DIR := arch/$(HEADER_ARCH)
 
-include $(ARCH_DIR)/Makefile-skas
-include $(HOST_DIR)/Makefile.um
+include $(srctree)/$(ARCH_DIR)/Makefile-skas
+include $(srctree)/$(HOST_DIR)/Makefile.um
 
 core-y += $(HOST_DIR)/um/
 
@@ -76,7 +76,7 @@ USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__
 
 #This will adjust *FLAGS accordingly to the platform.
-include $(ARCH_DIR)/Makefile-os-$(OS)
+include $(srctree)/$(ARCH_DIR)/Makefile-os-$(OS)
 
 KBUILD_CPPFLAGS += -I$(srctree)/$(HOST_DIR)/include \
 		   -I$(srctree)/$(HOST_DIR)/include/uapi \
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 307fd0000a83..0fa7dc73b5d8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -75,7 +75,7 @@ ifeq ($(CONFIG_X86_32),y)
         KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align4))
 
         # CPU-specific tuning. Anything which can be shared with UML should go here.
-        include arch/x86/Makefile_32.cpu
+        include $(srctree)/arch/x86/Makefile_32.cpu
         KBUILD_CFLAGS += $(cflags-y)
 
         # temporary until string.h is fixed
-- 
2.27.0

