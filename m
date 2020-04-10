Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D412E1A4434
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2020 11:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgDJJGt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Apr 2020 05:06:49 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:54510 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgDJJGs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Apr 2020 05:06:48 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 87CF12022B;
        Fri, 10 Apr 2020 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1586509609; bh=YG+nx11gNJTjjlaYzycx3RqwGwY+EHpSqBmBtv2jB0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=drnb/M7bS1Eio+05eLmmuqLyuZWQFJIToLpamLgeatCl3yUfO1oOEYsRTed+08JMf
         yyZmD694g3xCquT4sXtbvoyfJhHRl8q3gMT6dBq4iQEsRQd0+4+uB0IRUUZ8edxnLz
         4EMeNJdPUpyBiwm6CezIbsYKHHN26RRYUQj+Y2GqEu6vf3bUDMu5mRcxxfOJvrbuRj
         erArh4LUucuhswpIU9S8nRwMou7JCHnBsXcCserLHBYPNaRl+qK8JZc+RclvjGdaTY
         HyEZbd64HhNFXvGPoSN81dwu1AcLivt5jkw6pN66b17XVbCAqF0C4qAxmMxFbNhwfy
         iQNP84J15M/Hw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     macro@linux-mips.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH v3] MIPS: Truncate link address into 32bit for 32bit kernel
Date:   Fri, 10 Apr 2020 17:06:23 +0800
Message-Id: <20200410090634.3513101-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200407080611.859256-1-jiaxun.yang@flygoat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLD failed to link vmlinux with 64bit load address for 32bit ELF
while bfd will strip 64bit address into 32bit silently.
To fix LLD build, we should truncate load address provided by platform
into 32bit for 32bit kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Fangrui Song <maskray@google.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

--
V2: Take MaskRay's shell magic.

V3: After spent an hour on dealing with special character issue in
Makefile, I gave up to do shell hacks and write a util in C instead.
Thanks Maciej for pointing out Makefile variable problem.
---
 arch/mips/Makefile             |  2 ++
 arch/mips/kernel/Makefile      | 11 ++++++++++-
 arch/mips/kernel/vmlinux.lds.S |  2 +-
 arch/mips/tools/.gitignore     |  1 +
 arch/mips/tools/Makefile       |  5 +++++
 arch/mips/tools/truncate32.c   | 29 +++++++++++++++++++++++++++++
 6 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/tools/truncate32.c

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed8156..633e9de4d262 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -14,6 +14,7 @@
 
 archscripts: scripts_basic
 	$(Q)$(MAKE) $(build)=arch/mips/tools elf-entry
+	$(Q)$(MAKE) $(build)=arch/mips/tools truncate32
 ifeq ($(CONFIG_CPU_LOONGSON3_WORKAROUNDS),y)
 	$(Q)$(MAKE) $(build)=arch/mips/tools loongson3-llsc-check
 endif
@@ -261,6 +262,7 @@ include arch/mips/Kbuild.platforms
 ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
 endif
+export VMLINUX_LOAD_ADDRESS		:= $(load-y)
 
 entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
 cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index d6e97df51cfb..0178f7085317 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -112,4 +112,13 @@ obj-$(CONFIG_MIPS_CPC)		+= mips-cpc.o
 obj-$(CONFIG_CPU_PM)		+= pm.o
 obj-$(CONFIG_MIPS_CPS_PM)	+= pm-cps.o
 
-CPPFLAGS_vmlinux.lds		:= $(KBUILD_CFLAGS)
+# When linking a 32-bit executable the LLVM linker cannot cope with a
+# 32-bit load address that has been sign-extended to 64 bits.  Simply
+# remove the upper 32 bits then, as it is safe to do so with other
+# linkers.
+ifdef CONFIG_64BIT
+	load-ld			= $(VMLINUX_LOAD_ADDRESS)
+else
+	load-ld			= $(shell $(objtree)/arch/mips/tools/truncate32 $(VMLINUX_LOAD_ADDRESS))
+endif
+CPPFLAGS_vmlinux.lds		:= $(KBUILD_CFLAGS) -DVMLINUX_LINK_ADDRESS=$(load-ld)
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index a5f00ec73ea6..5226cd8e4bee 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -55,7 +55,7 @@ SECTIONS
 	/* . = 0xa800000000300000; */
 	. = 0xffffffff80300000;
 #endif
-	. = VMLINUX_LOAD_ADDRESS;
+	. = VMLINUX_LINK_ADDRESS;
 	/* read-only */
 	_text = .;	/* Text and read-only data */
 	.text : {
diff --git a/arch/mips/tools/.gitignore b/arch/mips/tools/.gitignore
index 794817dfb389..58ead412c8d3 100644
--- a/arch/mips/tools/.gitignore
+++ b/arch/mips/tools/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 elf-entry
 loongson3-llsc-check
+truncate32
diff --git a/arch/mips/tools/Makefile b/arch/mips/tools/Makefile
index b851e5dcc65a..69debb18bbb4 100644
--- a/arch/mips/tools/Makefile
+++ b/arch/mips/tools/Makefile
@@ -8,3 +8,8 @@ hostprogs += loongson3-llsc-check
 PHONY += loongson3-llsc-check
 loongson3-llsc-check: $(obj)/loongson3-llsc-check
 	@:
+
+hostprogs += truncate32
+PHONY += truncate32
+truncate32: $(obj)/truncate32
+	@:
diff --git a/arch/mips/tools/truncate32.c b/arch/mips/tools/truncate32.c
new file mode 100644
index 000000000000..82c19b4c32da
--- /dev/null
+++ b/arch/mips/tools/truncate32.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+__attribute__((noreturn))
+static void die(const char *msg)
+{
+	fputs(msg, stderr);
+	exit(EXIT_FAILURE);
+}
+
+int main(int argc, const char *argv[])
+{
+	unsigned long long val;
+
+	if (argc != 2)
+		die("Usage: truncate32 <address>\n");
+
+	val = strtoull(argv[1], NULL, 0);
+
+	if ((val & 0xffffffff00000000) != 0xffffffff00000000)
+		die("Invalid input\n");
+
+	val = val & 0xffffffff;
+	printf("0x%08llx\n", val);
+
+	return EXIT_SUCCESS;
+}
-- 
2.26.0.rc2

