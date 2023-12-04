Return-Path: <linux-mips+bounces-482-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF9E8031D6
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0C341C209E9
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126D622F10;
	Mon,  4 Dec 2023 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="femcIS3o"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DAF14F9C
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6FCC433C7;
	Mon,  4 Dec 2023 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691041;
	bh=fRSxX8E7EKRIPQBydKhoEniyM3aLhKn+xL3XzYVaAk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=femcIS3omFfgXtyufGHVJom0uXomMX8jSMxADx9BQCYIjldQAsUEIf8MhP4M978r7
	 O7bai8L2nmJW3W8l56yzH9LN3RtLW8Y0TulhUd4noZ38Gr6atBE96UZ1N2ObjY1F4x
	 hqu3OmhDd2LYanShqrKOZDDRBLQzSn6unOCaFnNxVXTrlc4L252xz+J2q0/Qy+YIJs
	 GGlZ0H2R7AskDgd3KWUtZyW1Gz1LorE2/k+I9ur+2cTDTfYiYfQlt9kt3Li3WR+zJB
	 vXjedYrAzAKBdNoLauwN22lUVaZ67lAkiPv3lPxnW9flUNhK1V640WBFjIWiucJ455
	 rk+M1ei9P3PpQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 01/20] mips: decompress: fix add missing prototypes
Date: Mon,  4 Dec 2023 12:56:51 +0100
Message-Id: <20231204115710.2247097-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The mips decompressor has some string functions defined locally that are not
declared in the right place:

arch/mips/boot/compressed/dbg.c:12:13: error: no previous prototype for 'putc' [-Werror=missing-prototypes]
arch/mips/boot/compressed/dbg.c:16:6: error: no previous prototype for 'puts' [-Werror=missing-prototypes]
arch/mips/boot/compressed/dbg.c:26:6: error: no previous prototype for 'puthex' [-Werror=missing-prototypes]
arch/mips/boot/compressed/string.c:11:7: error: no previous prototype for 'memcpy' [-Werror=missing-prototypes]
arch/mips/boot/compressed/string.c:22:7: error: no previous prototype for 'memset' [-Werror=missing-prototypes]
arch/mips/boot/compressed/string.c:32:15: error: no previous prototype for 'memmove' [-Werror=missing-prototypes]
arch/mips/boot/compressed/decompress.c:43:6: error: no previous prototype for 'error' [-Werror=missing-prototypes]
arch/mips/boot/compressed/decompress.c:91:6: error: no previous prototype for 'decompress_kernel' [-Werror=missing-prototypes]

Include the string.h header where needed and add a decompress.h header to
have shared prototypes for the rest.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/boot/compressed/dbg.c        |  2 ++
 arch/mips/boot/compressed/decompress.c | 16 ++--------------
 arch/mips/boot/compressed/decompress.h | 24 ++++++++++++++++++++++++
 arch/mips/boot/compressed/string.c     |  1 +
 4 files changed, 29 insertions(+), 14 deletions(-)
 create mode 100644 arch/mips/boot/compressed/decompress.h

diff --git a/arch/mips/boot/compressed/dbg.c b/arch/mips/boot/compressed/dbg.c
index f6728a8fd1c3..2f1ac38fe1cc 100644
--- a/arch/mips/boot/compressed/dbg.c
+++ b/arch/mips/boot/compressed/dbg.c
@@ -9,6 +9,8 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
+#include "decompress.h"
+
 void __weak putc(char c)
 {
 }
diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index c5dd415254d3..adb6d5b0e6eb 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -19,6 +19,8 @@
 #include <asm/unaligned.h>
 #include <asm-generic/vmlinux.lds.h>
 
+#include "decompress.h"
+
 /*
  * These two variables specify the free mem region
  * that can be used for temporary malloc area
@@ -26,20 +28,6 @@
 unsigned long free_mem_ptr;
 unsigned long free_mem_end_ptr;
 
-/* The linker tells us where the image is. */
-extern unsigned char __image_begin[], __image_end[];
-
-/* debug interfaces  */
-#ifdef CONFIG_DEBUG_ZBOOT
-extern void puts(const char *s);
-extern void puthex(unsigned long long val);
-#else
-#define puts(s) do {} while (0)
-#define puthex(val) do {} while (0)
-#endif
-
-extern char __appended_dtb[];
-
 void error(char *x)
 {
 	puts("\n\n");
diff --git a/arch/mips/boot/compressed/decompress.h b/arch/mips/boot/compressed/decompress.h
new file mode 100644
index 000000000000..073b64593b3d
--- /dev/null
+++ b/arch/mips/boot/compressed/decompress.h
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+#ifndef _DECOMPRESSOR_H
+#define _DECOMPRESSOR_H
+
+/* The linker tells us where the image is. */
+extern unsigned char __image_begin[], __image_end[];
+
+/* debug interfaces  */
+#ifdef CONFIG_DEBUG_ZBOOT
+extern void putc(char c);
+extern void puts(const char *s);
+extern void puthex(unsigned long long val);
+#else
+#define putc(s) do {} while (0)
+#define puts(s) do {} while (0)
+#define puthex(val) do {} while (0)
+#endif
+
+extern char __appended_dtb[];
+
+void error(char *x);
+void decompress_kernel(unsigned long boot_heap_start);
+
+#endif
diff --git a/arch/mips/boot/compressed/string.c b/arch/mips/boot/compressed/string.c
index 0b593b709228..f0eb251e44e5 100644
--- a/arch/mips/boot/compressed/string.c
+++ b/arch/mips/boot/compressed/string.c
@@ -7,6 +7,7 @@
 
 #include <linux/compiler_attributes.h>
 #include <linux/types.h>
+#include <asm/string.h>
 
 void *memcpy(void *dest, const void *src, size_t n)
 {
-- 
2.39.2


