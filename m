Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B283069CF
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 02:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhA1BKk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 20:10:40 -0500
Received: from condef-01.nifty.com ([202.248.20.66]:34430 "EHLO
        condef-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbhA1BHO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Jan 2021 20:07:14 -0500
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-01.nifty.com with ESMTP id 10S0sqFj004487;
        Thu, 28 Jan 2021 09:54:52 +0900
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 10S0pjIW024172;
        Thu, 28 Jan 2021 09:51:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIW024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611795107;
        bh=+LHKocVMPkqNI8nA/KMwgoTAuLK2mYDwPDh+InjbTfo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gnVSo7RttKVpWy/OFRjtxlRUpAz4rpUuh8Hp14KLPFuz/PjuXDhEhOy3HtnaFIJsR
         j5NBAZg+jrqrZrrlDgaAqwzVC7P2ScCE8ymBUm5U9CKdV5r0lCQ5of/51L3sMDvV7n
         NjnJU6xx2uq4zSArMWwvxVXcZOJxxMz8AZ5EFGzQ//012J78lTFBFP1yIEqq0OKtsz
         P1eWUzCTS5nh+DSg/DWCQdQ4LjUUKbuIvQClxoZ0e3BC6Bn9y3dGBPxlz2OL7J+a3V
         7VhZpfsut52FsOgAGN9aAM1apP54hrWYdjHv5xY7iwApZQgViBB9EFaJeZflmO8v+/
         tNI7K+0w9KYrQ==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-arch@vger.kernel.org, x86@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 01/27] scripts: add generic syscalltbl.sh
Date:   Thu, 28 Jan 2021 09:50:43 +0900
Message-Id: <20210128005110.2613902-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210128005110.2613902-1-masahiroy@kernel.org>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Most of architectures generate syscall headers at the compile time
in the almost same way.

The syscall table has the same format for all architectures. Each line
has 3, 4 or 5 fields; syscall number, ABI, syscall name, native entry
point, and compat entry point. The syscall table is processed by
syscalltbl.sh script into header files.

Despite the same pattern, scripts are maintained per architecture,
which results in code duplication and bad maintainability.

As of v5.11-rc1, 12 architectures duplicate similar shell scripts:

  $ find arch -name syscalltbl.sh | sort
  arch/alpha/kernel/syscalls/syscalltbl.sh
  arch/arm/tools/syscalltbl.sh
  arch/ia64/kernel/syscalls/syscalltbl.sh
  arch/m68k/kernel/syscalls/syscalltbl.sh
  arch/microblaze/kernel/syscalls/syscalltbl.sh
  arch/mips/kernel/syscalls/syscalltbl.sh
  arch/parisc/kernel/syscalls/syscalltbl.sh
  arch/powerpc/kernel/syscalls/syscalltbl.sh
  arch/sh/kernel/syscalls/syscalltbl.sh
  arch/sparc/kernel/syscalls/syscalltbl.sh
  arch/x86/entry/syscalls/syscalltbl.sh
  arch/xtensa/kernel/syscalls/syscalltbl.sh

My goal is to unify them into a single file, scripts/syscalltbl.sh.

For example, the i386 syscall table looks like this:

  0  i386  restart_syscall  sys_restart_syscall
  1  i386  exit             sys_exit
  2  i386  fork             sys_fork
  3  i386  read             sys_read
  4  i386  write            sys_write
  5  i386  open             sys_open              compat_sys_open
  ...

scripts/syscalltbl.sh generates the following code:

  __SYSCALL(0, sys_restart_syscall)
  __SYSCALL(1, sys_exit)
  __SYSCALL(2, sys_fork)
  __SYSCALL(3, sys_read)
  __SYSCALL(4, sys_write)
  __SYSCALL_WITH_COMPAT(5, sys_open, compat_sys_open)
  ...

Then, the i386 kernel will do:

  #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)

and the x86_64 kernel will do:

  #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, compat)

I noticed all 32/64 bit architectures can be covered by the same
pattern. Having an arch-specific script is fine if there is a good
reason to do so, but a single generic script should work for this case.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/syscalltbl.sh | 52 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 scripts/syscalltbl.sh

diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
new file mode 100644
index 000000000000..15bf4e09f88c
--- /dev/null
+++ b/scripts/syscalltbl.sh
@@ -0,0 +1,52 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Usage:
+#  scripts/syscalltbl.sh INFILE OUTFILE [ABIS] [OFFSET]
+#
+# INFILE: input syscall table
+# OUTFILE: output file
+# ABIS (optional): specify the ABIs to handle.
+#                  If omitted, all lines are handled.
+# OFFSET (optinal): spefify the offset of the syscall numbers.
+#                   If omitted, the offset is zero.
+#
+# The syscall table format:
+# nr abi name native [compat]
+#
+# nr: syscall number
+# abi: ABI name
+# name: syscall name
+# native: native entry point
+# compat (optional): compat entry point
+
+set -e
+
+in="$1"
+out="$2"
+abis=$(echo "($3)" | tr ',' '|')
+offset="${4:-0}"
+
+nxt=$offset
+
+grep -E "^[0-9]+[[:space:]]+${abis}" "$in" | sort -n | {
+
+	while read nr abi name native compat ; do
+
+		nr=$((nr + $offset))
+
+		while [ $nxt -lt $nr ]; do
+			echo "__SYSCALL($nxt, sys_ni_syscall)"
+			nxt=$((nxt + 1))
+		done
+
+		if [ -n "$compat" ]; then
+			echo "__SYSCALL_WITH_COMPAT($nr, $native, $compat)"
+		elif [ -n "$native" ]; then
+			echo "__SYSCALL($nr, $native)"
+		else
+			echo "__SYSCALL($nr, sys_ni_syscall)"
+		fi
+		nxt=$((nr + 1))
+	done
+} > "$out"
-- 
2.27.0

