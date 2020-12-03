Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C992CE119
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 22:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502076AbgLCVrc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Dec 2020 16:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502065AbgLCVrb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Dec 2020 16:47:31 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BD1C08E85F;
        Thu,  3 Dec 2020 13:46:46 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkwR0-00GJSq-Nw; Thu, 03 Dec 2020 21:46:42 +0000
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 10/10] Kconfig: regularize selection of CONFIG_BINFMT_ELF
Date:   Thu,  3 Dec 2020 21:46:41 +0000
Message-Id: <20201203214641.3887979-10-viro@ZenIV.linux.org.uk>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
References: <20201203214529.GB3579531@ZenIV.linux.org.uk>
 <20201203214641.3887979-1-viro@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Al Viro <viro@zeniv.linux.org.uk>

with mips converted to use of fs/config_binfmt_elf.c, there's no
need to keep selects of that thing all over arch/* - we can simply
turn into def_bool y if COMPAT && BINFMT_ELF (in fs/Kconfig.binfmt)
and get rid of all selects.

Several architectures got those selects wrong (e.g. you could
end up with sparc64 sans BINFMT_ELF, with select violating
dependencies, or with amd64 with X32 and BINFMT_ELF enabled,
but unable to exec any X32 binaries), etc.

Randy Dunlap has spotted some of those; IMO this is simpler than
his fix, but it depends upon the stuff that would need to be
backported, so we might end up using his variant for -stable.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/arm64/Kconfig   | 1 -
 arch/mips/Kconfig    | 2 --
 arch/parisc/Kconfig  | 1 -
 arch/powerpc/Kconfig | 1 -
 arch/s390/Kconfig    | 1 -
 arch/sparc/Kconfig   | 1 -
 arch/x86/Kconfig     | 1 -
 fs/Kconfig.binfmt    | 2 +-
 8 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f858c352f72a..84a0af4ba8d7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1196,7 +1196,6 @@ config ARM64_TAGGED_ADDR_ABI
 menuconfig COMPAT
 	bool "Kernel support for 32-bit EL0"
 	depends on ARM64_4K_PAGES || EXPERT
-	select COMPAT_BINFMT_ELF if BINFMT_ELF
 	select HAVE_UID16
 	select OLD_SIGSUSPEND3
 	select COMPAT_OLD_SIGACTION
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index f14731aee182..df35ce61aa81 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3271,7 +3271,6 @@ config MIPS32_O32
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT
 	select MIPS32_COMPAT
-	select COMPAT_BINFMT_ELF
 	select SYSVIPC_COMPAT if SYSVIPC
 	help
 	  Select this option if you want to run o32 binaries.  These are pure
@@ -3285,7 +3284,6 @@ config MIPS32_N32
 	depends on 64BIT
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
 	select COMPAT
-	select COMPAT_BINFMT_ELF
 	select MIPS32_COMPAT
 	select SYSVIPC_COMPAT if SYSVIPC
 	help
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b234e8154cbd..97c233a7445c 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -336,7 +336,6 @@ source "kernel/Kconfig.hz"
 config COMPAT
 	def_bool y
 	depends on 64BIT
-	select COMPAT_BINFMT_ELF if BINFMT_ELF
 
 config SYSVIPC_COMPAT
 	def_bool y
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..d27469a024a5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -278,7 +278,6 @@ config COMPAT
 	bool "Enable support for 32bit binaries"
 	depends on PPC64
 	default y if !CPU_LITTLE_ENDIAN
-	select COMPAT_BINFMT_ELF
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 4a2a12be04c9..55d140044f32 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -426,7 +426,6 @@ config 64BIT
 config COMPAT
 	def_bool y
 	prompt "Kernel support for 31 bit emulation"
-	select COMPAT_BINFMT_ELF if BINFMT_ELF
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 	select HAVE_UID16
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index a6ca135442f9..12943d94fcd0 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -496,7 +496,6 @@ config COMPAT
 	bool
 	depends on SPARC64
 	default y
-	select COMPAT_BINFMT_ELF
 	select HAVE_UID16
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 8eea77cf53a7..638fdf3e6578 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2844,7 +2844,6 @@ config IA32_EMULATION
 	depends on X86_64
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select BINFMT_ELF
-	select COMPAT_BINFMT_ELF
 	select COMPAT_OLD_SIGACTION
 	help
 	  Include code to run legacy 32-bit programs under a
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index 885da6d983b4..b32f5df68ae9 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -29,7 +29,7 @@ config BINFMT_ELF
 	  latest version).
 
 config COMPAT_BINFMT_ELF
-	bool
+	def_bool y
 	depends on COMPAT && BINFMT_ELF
 	select ELFCORE
 
-- 
2.11.0

