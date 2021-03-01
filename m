Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E214328153
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 15:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbhCAOus (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 09:50:48 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:32759 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbhCAOur (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 09:50:47 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 121EmRrL009779;
        Mon, 1 Mar 2021 23:48:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 121EmRrL009779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614610108;
        bh=S7MHxBqH9XXYFURSiKpT+jR1eciuVgT78h0Cv/IdHZk=;
        h=From:To:Cc:Subject:Date:From;
        b=A4+5vhX89DYFXlfmV1XFu7PyJEOrn6BiDUZY0zWnUjInd+ENDyS8ISCE/nbFuGPuB
         lsGLmjXp003wxIfdB9st4ExIq5yeS5+0lFZoGo2ejTncRlQWEnNsl3gK/8fBkjilbv
         z3d1r1GM0ffIIFY1/MSx9oPCc5J20IyF+0GsjJ0zDbnaHFlGZ3o56GDs7Tyi85qSP+
         qPt+0B3aDGtJLeCraj0++NCB+7w2SN1HZjXuXn7FA7NmanW8c3gBCYWaebi2NjNkPN
         rZvnJokrFsYNU37xSO+9FpXY6kRyezQ5oL17Xp1VYC90LhVHkzNNYWjYCG9QsMwmqJ
         lVxuCBcYoWbKQ==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexander Lobakin <alobakin@pm.me>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sean Christopherson <seanjc@google.com>
Subject: [PATCH 1/2] mips: syscalls: switch to generic syscalltbl.sh
Date:   Mon,  1 Mar 2021 23:48:24 +0900
Message-Id: <20210301144825.357922-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Many architectures duplicate similar shell scripts.

This commit converts mips to use scripts/syscalltbl.sh. This also
unifies syscall_table_32_o32.h and syscall_table_64_o32.h into
syscall_table_o32.h.

The offset parameters are unneeded here; __SYSCALL(nr, entry) is defined
as 'PTR entry', so the parameter 'nr' is not used in the first place.

With this commit, syscall tables and generated files are straight
mapped,  which makes things easier to understand.

  syscall_n32.tbl  -->  syscall_table_n32.h
  syscall_n64.tbl  -->  syscall_table_n64.h
  syscall_o32.tbl  -->  syscall_table_o32.h

Then, the abi parameters are also unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/include/asm/Kbuild            |  7 +++--
 arch/mips/kernel/scall32-o32.S          |  4 +--
 arch/mips/kernel/scall64-n32.S          |  3 +--
 arch/mips/kernel/scall64-n64.S          |  3 +--
 arch/mips/kernel/scall64-o32.S          |  4 +--
 arch/mips/kernel/syscalls/Makefile      | 31 ++++++---------------
 arch/mips/kernel/syscalls/syscalltbl.sh | 36 -------------------------
 7 files changed, 17 insertions(+), 71 deletions(-)
 delete mode 100644 arch/mips/kernel/syscalls/syscalltbl.sh

diff --git a/arch/mips/include/asm/Kbuild b/arch/mips/include/asm/Kbuild
index 8f6fe69674b7..dee172716581 100644
--- a/arch/mips/include/asm/Kbuild
+++ b/arch/mips/include/asm/Kbuild
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # MIPS headers
-generated-y += syscall_table_32_o32.h
-generated-y += syscall_table_64_n32.h
-generated-y += syscall_table_64_n64.h
-generated-y += syscall_table_64_o32.h
+generated-y += syscall_table_n32.h
+generated-y += syscall_table_n64.h
+generated-y += syscall_table_o32.h
 generated-y += unistd_nr_n32.h
 generated-y += unistd_nr_n64.h
 generated-y += unistd_nr_o32.h
diff --git a/arch/mips/kernel/scall32-o32.S b/arch/mips/kernel/scall32-o32.S
index b449b68662a9..84e8624e83a2 100644
--- a/arch/mips/kernel/scall32-o32.S
+++ b/arch/mips/kernel/scall32-o32.S
@@ -217,9 +217,9 @@ einval: li	v0, -ENOSYS
 #define sys_sched_getaffinity	mipsmt_sys_sched_getaffinity
 #endif /* CONFIG_MIPS_MT_FPAFF */
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 #define __SYSCALL(nr, entry) 	PTR entry
 	.align	2
 	.type	sys_call_table, @object
 EXPORT(sys_call_table)
-#include <asm/syscall_table_32_o32.h>
-#undef __SYSCALL
+#include <asm/syscall_table_o32.h>
diff --git a/arch/mips/kernel/scall64-n32.S b/arch/mips/kernel/scall64-n32.S
index 35d8c86b160e..f650c55a17dc 100644
--- a/arch/mips/kernel/scall64-n32.S
+++ b/arch/mips/kernel/scall64-n32.S
@@ -104,5 +104,4 @@ not_n32_scall:
 #define __SYSCALL(nr, entry)	PTR entry
 	.type	sysn32_call_table, @object
 EXPORT(sysn32_call_table)
-#include <asm/syscall_table_64_n32.h>
-#undef __SYSCALL
+#include <asm/syscall_table_n32.h>
diff --git a/arch/mips/kernel/scall64-n64.S b/arch/mips/kernel/scall64-n64.S
index 5e9c497ce099..5d7bfc65e4d0 100644
--- a/arch/mips/kernel/scall64-n64.S
+++ b/arch/mips/kernel/scall64-n64.S
@@ -113,5 +113,4 @@ illegal_syscall:
 	.align	3
 	.type	sys_call_table, @object
 EXPORT(sys_call_table)
-#include <asm/syscall_table_64_n64.h>
-#undef __SYSCALL
+#include <asm/syscall_table_n64.h>
diff --git a/arch/mips/kernel/scall64-o32.S b/arch/mips/kernel/scall64-o32.S
index 50c9a57e0d3a..cedc8bd88804 100644
--- a/arch/mips/kernel/scall64-o32.S
+++ b/arch/mips/kernel/scall64-o32.S
@@ -213,9 +213,9 @@ einval: li	v0, -ENOSYS
 	jr	ra
 	END(sys32_syscall)
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
 #define __SYSCALL(nr, entry)	PTR entry
 	.align	3
 	.type	sys32_call_table,@object
 EXPORT(sys32_call_table)
-#include <asm/syscall_table_64_o32.h>
-#undef __SYSCALL
+#include <asm/syscall_table_o32.h>
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 51f8b805f2ed..2bbea47caf7e 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -10,7 +10,7 @@ syscalln64 := $(src)/syscall_n64.tbl
 syscallo32 := $(src)/syscall_o32.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 sysnr := $(srctree)/$(src)/syscallnr.sh
-systbl := $(srctree)/$(src)/syscalltbl.sh
+systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
@@ -25,10 +25,7 @@ quiet_cmd_sysnr = SYSNR   $@
 		  '$(sysnr_offset_$(basetarget))'
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
-		   '$(systbl_abis_$(basetarget))'		\
-		   '$(systbl_abi_$(basetarget))'		\
-		   '$(systbl_offset_$(basetarget))'
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
 syshdr_offset_unistd_n32 := __NR_Linux
 $(uapi)/unistd_n32.h: $(syscalln32) $(syshdr) FORCE
@@ -57,33 +54,21 @@ sysnr_offset_unistd_nr_o32 := 4000
 $(kapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
-systbl_abi_syscall_table_32_o32 := 32_o32
-systbl_offset_syscall_table_32_o32 := 4000
-$(kapi)/syscall_table_32_o32.h: $(syscallo32) $(systbl) FORCE
+$(kapi)/syscall_table_n32.h: $(syscalln32) $(systbl) FORCE
 	$(call if_changed,systbl)
 
-systbl_abi_syscall_table_64_n32 := 64_n32
-systbl_offset_syscall_table_64_n32 := 6000
-$(kapi)/syscall_table_64_n32.h: $(syscalln32) $(systbl) FORCE
+$(kapi)/syscall_table_n64.h: $(syscalln64) $(systbl) FORCE
 	$(call if_changed,systbl)
 
-systbl_abi_syscall_table_64_n64 := 64_n64
-systbl_offset_syscall_table_64_n64 := 5000
-$(kapi)/syscall_table_64_n64.h: $(syscalln64) $(systbl) FORCE
-	$(call if_changed,systbl)
-
-systbl_abi_syscall_table_64_o32 := 64_o32
-systbl_offset_syscall_table_64_o32 := 4000
-$(kapi)/syscall_table_64_o32.h: $(syscallo32) $(systbl) FORCE
+$(kapi)/syscall_table_o32.h: $(syscallo32) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_n32.h			\
 			   unistd_n64.h			\
 			   unistd_o32.h
-kapisyshdr-y		+= syscall_table_32_o32.h	\
-			   syscall_table_64_n32.h	\
-			   syscall_table_64_n64.h	\
-			   syscall_table_64_o32.h	\
+kapisyshdr-y		+= syscall_table_n32.h		\
+			   syscall_table_n64.h		\
+			   syscall_table_o32.h		\
 			   unistd_nr_n32.h		\
 			   unistd_nr_n64.h		\
 			   unistd_nr_o32.h
diff --git a/arch/mips/kernel/syscalls/syscalltbl.sh b/arch/mips/kernel/syscalls/syscalltbl.sh
deleted file mode 100644
index 1e2570740c20..000000000000
--- a/arch/mips/kernel/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-my_abi="$4"
-offset="$5"
-
-emit() {
-	t_nxt="$1"
-	t_nr="$2"
-	t_entry="$3"
-
-	while [ $t_nxt -lt $t_nr ]; do
-		printf "__SYSCALL(%s,sys_ni_syscall)\n" "${t_nxt}"
-		t_nxt=$((t_nxt+1))
-	done
-	printf "__SYSCALL(%s,%s)\n" "${t_nxt}" "${t_entry}"
-}
-
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	nxt=0
-	if [ -z "$offset" ]; then
-		offset=0
-	fi
-
-	while read nr abi name entry compat ; do
-		if [ "$my_abi" = "64_o32" ] && [ ! -z "$compat" ]; then
-			emit $((nxt+offset)) $((nr+offset)) $compat
-		else
-			emit $((nxt+offset)) $((nr+offset)) $entry
-		fi
-		nxt=$((nr+1))
-	done
-) > "$out"
-- 
2.27.0

