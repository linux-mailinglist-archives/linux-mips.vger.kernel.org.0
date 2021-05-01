Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552F2370836
	for <lists+linux-mips@lfdr.de>; Sat,  1 May 2021 19:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhEAR1G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 May 2021 13:27:06 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:47042 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhEAR1F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 May 2021 13:27:05 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 141HOcsb024068;
        Sun, 2 May 2021 02:24:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 141HOcsb024068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619889880;
        bh=DKpAtplaQKg143e+7vSq9Fg8LaAV0UcKHDXnRDpAwB8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rVe0kBlYfm5mf5koQK5x+ddei74+pKW5XvZOKTZeHAioqHrhu/gxXy4Wza0fypF4B
         6A1jxXt017YrDWOVESl/9VuszooqpsI28jl6gV7TRLeGYGPsGLcQOgqE0Tq4OiXesC
         L9sAqcSXi1L4D7sKx2RKh5qDREK2YFAIpJFLZDXWG836PKolgRSHLsP6nlFAlwV605
         6um1B5NFGu24WHxuldifXj9iM5UOKPI9FNtnLn4H2XrPWaOI+XL2Bf4mUXHrtWBALg
         w3csdIFGgvhJNmVMLs3YCk07ePvz8SG5G3Axq4pMvmomGu3dVX6N6g5EappzZG97xm
         NZQtfKTdIhfYA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: [PATCH 2/2] arch: use cross_compiling to check whether it is a cross build or not
Date:   Sun,  2 May 2021 02:24:36 +0900
Message-Id: <20210501172437.156926-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210501172437.156926-1-masahiroy@kernel.org>
References: <20210501172437.156926-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

'cross_compiling' is defined by the top Makefile and available for
arch Makefiles to check whether it is a cross build or not. A good
thing is the variable name 'cross_compiling' is self-documenting.

This is a simple replacement for m68k, mips, sh, for which $(ARCH)
and $(SRCARCH) always match.

No functional change is intended for xtensa, either.

This is rather a fix for parisc because arch/parisc/Makefile defines
UTS_MATCHINE depending on CONFIG_64BIT, therefore cc-cross-prefix
is not working in Kconfig time.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/m68k/Makefile   | 2 +-
 arch/mips/Makefile   | 2 +-
 arch/parisc/Makefile | 2 +-
 arch/sh/Makefile     | 2 +-
 arch/xtensa/Makefile | 6 +-----
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index ea14f2046fb4..82620f14124d 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -16,7 +16,7 @@
 
 KBUILD_DEFCONFIG := multi_defconfig
 
-ifneq ($(SUBARCH),$(ARCH))
+ifdef cross_compiling
 	ifeq ($(CROSS_COMPILE),)
 		CROSS_COMPILE := $(call cc-cross-prefix, \
 			m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e71d587af49c..258234c35a09 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -50,7 +50,7 @@ tool-archpref		= $(64bit-tool-archpref)
 UTS_MACHINE		:= mips64
 endif
 
-ifneq ($(SUBARCH),$(ARCH))
+ifdef cross_compiling
   ifeq ($(CROSS_COMPILE),)
     CROSS_COMPILE := $(call cc-cross-prefix, $(tool-archpref)-linux-  $(tool-archpref)-linux-gnu-  $(tool-archpref)-unknown-linux-gnu-)
   endif
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 7d9f71aa829a..aed8ea29268b 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -41,7 +41,7 @@ endif
 
 export LD_BFD
 
-ifneq ($(SUBARCH),$(UTS_MACHINE))
+ifdef cross_compiling
 	ifeq ($(CROSS_COMPILE),)
 		CC_SUFFIXES = linux linux-gnu unknown-linux-gnu
 		CROSS_COMPILE := $(call cc-cross-prefix, \
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 3bcbf52fb30e..44bcb80e791a 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -9,7 +9,7 @@
 # License.  See the file "COPYING" in the main directory of this archive
 # for more details.
 #
-ifneq ($(SUBARCH),$(ARCH))
+ifdef cross_compiling
   ifeq ($(CROSS_COMPILE),)
     CROSS_COMPILE := $(call cc-cross-prefix, sh-linux- sh-linux-gnu- sh-unknown-linux-gnu-)
   endif
diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
index ba9fee75e675..e9c8f064c44d 100644
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@ -19,12 +19,8 @@ variant-y := $(patsubst "%",%,$(CONFIG_XTENSA_VARIANT_NAME))
 VARIANT = $(variant-y)
 export VARIANT
 
-# Test for cross compiling
-
 ifneq ($(VARIANT),)
-  COMPILE_ARCH = $(shell uname -m)
-
-  ifneq ($(COMPILE_ARCH), xtensa)
+  ifdef cross_compiling
     ifndef CROSS_COMPILE
       CROSS_COMPILE = xtensa_$(VARIANT)-
     endif
-- 
2.27.0

