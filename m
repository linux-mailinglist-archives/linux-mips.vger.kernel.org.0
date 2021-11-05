Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0083445E06
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 03:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhKECpC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Nov 2021 22:45:02 -0400
Received: from condef-08.nifty.com ([202.248.20.73]:23154 "EHLO
        condef-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhKECpC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Nov 2021 22:45:02 -0400
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-08.nifty.com with ESMTP id 1A52dRu1005979
        for <linux-mips@vger.kernel.org>; Fri, 5 Nov 2021 11:39:27 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 1A52cTY8003626;
        Fri, 5 Nov 2021 11:38:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 1A52cTY8003626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636079910;
        bh=IeUZt4PsBFceCGs3eJLrGGs8MODnWGqCocnHEkQlICA=;
        h=From:To:Cc:Subject:Date:From;
        b=bRjA7etrT/McFMTQ7a3R9J31CzaeQWZ3qGtMr1hEuNoTelMJ+XB1noDBpfor3Ya6Z
         D8dtEk8eTDfvBccU1a6R41gs9NqUU7GOp57wEUDNZdDZRusOofOfBKcdB0x0xBHV7W
         5XncPglldZdSMF61sj4k4MutqFyIa5DCzE2YpLVleCcknrEU9mP/5s9vfaiPIO9+pE
         eaDZi3QC7Ua/Fu2vpcqUWl493tiMTYHdO1upkXmiLjFrGSZkXYmyO+AoNa8hi1NAVa
         vwXjPHym+H2p4g9pqQuBW1TydH6FfY4KvtrB+3U/h4PeChGdIACzimZ+6sEqgbyUQU
         PyIen3hkf0prA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Xingxing Su <suxingxing@loongson.cn>,
        linux-kernel@vger.kernel.org, zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] mips: decompressor: do not copy source files while building
Date:   Fri,  5 Nov 2021 11:38:14 +0900
Message-Id: <20211105023815.85784-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
builds") stated, copying source files during the build time may not
end up with as clean code as expected.

Do similar for mips to clean up the Makefile and .gitignore.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/boot/compressed/.gitignore   |  3 ---
 arch/mips/boot/compressed/Makefile     | 12 ------------
 arch/mips/boot/compressed/ashldi3.c    |  2 ++
 arch/mips/boot/compressed/bswapsi.c    |  2 ++
 arch/mips/boot/compressed/uart-ath79.c |  2 ++
 scripts/remove-stale-files             |  5 +++++
 6 files changed, 11 insertions(+), 15 deletions(-)
 delete mode 100644 arch/mips/boot/compressed/.gitignore
 create mode 100644 arch/mips/boot/compressed/ashldi3.c
 create mode 100644 arch/mips/boot/compressed/bswapsi.c
 create mode 100644 arch/mips/boot/compressed/uart-ath79.c

diff --git a/arch/mips/boot/compressed/.gitignore b/arch/mips/boot/compressed/.gitignore
deleted file mode 100644
index d358395614c9..000000000000
--- a/arch/mips/boot/compressed/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-ashldi3.c
-bswapsi.c
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 3548b3b45269..e6584dab2360 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -50,20 +50,8 @@ vmlinuzobjs-$(CONFIG_MIPS_ALCHEMY)		   += $(obj)/uart-alchemy.o
 vmlinuzobjs-$(CONFIG_ATH79)			   += $(obj)/uart-ath79.o
 endif
 
-extra-y += uart-ath79.c
-$(obj)/uart-ath79.c: $(srctree)/arch/mips/ath79/early_printk.c
-	$(call cmd,shipped)
-
 vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
 
-extra-y += ashldi3.c
-$(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
-	$(call if_changed,shipped)
-
-extra-y += bswapsi.c
-$(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
-	$(call if_changed,shipped)
-
 targets := $(notdir $(vmlinuzobjs-y))
 
 targets += vmlinux.bin
diff --git a/arch/mips/boot/compressed/ashldi3.c b/arch/mips/boot/compressed/ashldi3.c
new file mode 100644
index 000000000000..f7bf6a7aae31
--- /dev/null
+++ b/arch/mips/boot/compressed/ashldi3.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../../../lib/ashldi3.c"
diff --git a/arch/mips/boot/compressed/bswapsi.c b/arch/mips/boot/compressed/bswapsi.c
new file mode 100644
index 000000000000..fdb9c6476904
--- /dev/null
+++ b/arch/mips/boot/compressed/bswapsi.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../lib/bswapsi.c"
diff --git a/arch/mips/boot/compressed/uart-ath79.c b/arch/mips/boot/compressed/uart-ath79.c
new file mode 100644
index 000000000000..d686820921be
--- /dev/null
+++ b/arch/mips/boot/compressed/uart-ath79.c
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "../../ath79/early_printk.c"
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index eb630ee287c3..c534fe1eac16 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -28,4 +28,9 @@ if [ -n "${building_out_of_srctree}" ]; then
 	do
 		rm -f arch/arm/boot/compressed/${f}
 	done
+
+	for f in uart-ath79.c ashldi3.c bswapsi.c
+	do
+		rm -f arch/mips/boot/compressed/${f}
+	done
 fi
-- 
2.30.2

