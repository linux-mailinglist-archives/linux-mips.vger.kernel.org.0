Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B7532814F
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 15:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhCAOuf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 09:50:35 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:32351 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbhCAOub (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 09:50:31 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 121EmRrM009779;
        Mon, 1 Mar 2021 23:48:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 121EmRrM009779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614610109;
        bh=eKC0qwYvqS7pU2tESC4xzFMM7xtaO2OUylqm5XqDwq4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DtB8nQibxe+YFdpZVaca14mcr41Jbakw67dfIARmLjAxQiBOFZW5NPDQLoxpU3Rvs
         iZLPw9/XY4Rq9N1WLxUao9YiHYaXpwC47EdrXLur4f6U8JhCi2cwsDWPKjYgIQZ81q
         K3HNUV2JeQZARcQLj9ZDJ/9MZWoL30Wt4fOnMmIC10qWIcjSCAvKUUjZc8D16U/l/H
         VfHrso73/9F/032zEGIB8Xly5yIM018IjRfsoDBjXbBC/3gMwk6l1ViHQRcESJ4STy
         tBhi3B8uKuFf/O5vApABsiJd4qywiZETi6rgJxmKeJyvOGFIWrG7A7MMLs4fVhjmUy
         Hbj3xhzrXA+kQ==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Stefan Asserhall <stefan.asserhall@xilinx.com>
Subject: [PATCH 2/2] mips: syscalls: switch to generic syscallhdr.sh
Date:   Mon,  1 Mar 2021 23:48:25 +0900
Message-Id: <20210301144825.357922-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301144825.357922-1-masahiroy@kernel.org>
References: <20210301144825.357922-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Many architectures duplicate similar shell scripts.

This commit converts mips to use scripts/syscallhdr.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/kernel/syscalls/Makefile      | 10 ++-----
 arch/mips/kernel/syscalls/syscallhdr.sh | 36 -------------------------
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 arch/mips/kernel/syscalls/syscallhdr.sh

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 2bbea47caf7e..904452992992 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -8,15 +8,12 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 syscalln32 := $(src)/syscall_n32.tbl
 syscalln64 := $(src)/syscall_n64.tbl
 syscallo32 := $(src)/syscall_o32.tbl
-syshdr := $(srctree)/$(src)/syscallhdr.sh
+syshdr := $(srctree)/scripts/syscallhdr.sh
 sysnr := $(srctree)/$(src)/syscallnr.sh
 systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
-      cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
-		   '$(syshdr_abis_$(basetarget))'		\
-		   '$(syshdr_pfx_$(basetarget))'		\
-		   '$(syshdr_offset_$(basetarget))'
+      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux $< $@
 
 quiet_cmd_sysnr = SYSNR   $@
       cmd_sysnr = $(CONFIG_SHELL) '$(sysnr)' '$<' '$@'		\
@@ -27,15 +24,12 @@ quiet_cmd_sysnr = SYSNR   $@
 quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
-syshdr_offset_unistd_n32 := __NR_Linux
 $(uapi)/unistd_n32.h: $(syscalln32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-syshdr_offset_unistd_n64 := __NR_Linux
 $(uapi)/unistd_n64.h: $(syscalln64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-syshdr_offset_unistd_o32 := __NR_Linux
 $(uapi)/unistd_o32.h: $(syscallo32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
diff --git a/arch/mips/kernel/syscalls/syscallhdr.sh b/arch/mips/kernel/syscalls/syscallhdr.sh
deleted file mode 100644
index 2e241e713a7d..000000000000
--- a/arch/mips/kernel/syscalls/syscallhdr.sh
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-prefix="$4"
-offset="$5"
-
-fileguard=_UAPI_ASM_MIPS_`basename "$out" | sed \
-	-e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/' \
-	-e 's/[^A-Z0-9_]/_/g' -e 's/__/_/g'`
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	printf "#ifndef %s\n" "${fileguard}"
-	printf "#define %s\n" "${fileguard}"
-	printf "\n"
-
-	nxt=0
-	while read nr abi name entry compat ; do
-		if [ -z "$offset" ]; then
-			printf "#define __NR_%s%s\t%s\n" \
-				"${prefix}" "${name}" "${nr}"
-		else
-			printf "#define __NR_%s%s\t(%s + %s)\n" \
-				"${prefix}" "${name}" "${offset}" "${nr}"
-		fi
-		nxt=$((nr+1))
-	done
-
-	printf "\n"
-	printf "#ifdef __KERNEL__\n"
-	printf "#define __NR_syscalls\t%s\n" "${nxt}"
-	printf "#endif\n"
-	printf "\n"
-	printf "#endif /* %s */\n" "${fileguard}"
-) > "$out"
-- 
2.27.0

