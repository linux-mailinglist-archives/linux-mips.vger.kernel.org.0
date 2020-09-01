Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 877A6259060
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 16:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgIAO2T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 10:28:19 -0400
Received: from crapouillou.net ([89.234.176.41]:45394 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728289AbgIAO1r (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Sep 2020 10:27:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598970419; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yU+G5wm9UV0/Lr0JJrsdPUDzSeYzX6a4lcXqh4c6G+0=;
        b=HhHU3Nc6W8OyBdfECWVhQHZrKsN6YU67y7ugf5zT0hdIOTsbRpIry/YTQJY4IHt7pyqlgm
        u3XKVUQJRz67Ja9q01KpglQXo9i7er1TVwlHD/6zvqAvba2zwPnjfuKNohZBYBw9pEU9jp
        G9nm5SGShMU9AI9MOC87A5L/Rrrvr1A=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Terrell <terrelln@fb.com>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 2/2] MIPS: Add support for ZSTD-compressed kernels
Date:   Tue,  1 Sep 2020 16:26:51 +0200
Message-Id: <20200901142651.1165237-3-paul@crapouillou.net>
In-Reply-To: <20200901142651.1165237-1-paul@crapouillou.net>
References: <20200901142651.1165237-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for self-extracting kernels with a ZSTD compression.

Tested on a kernel for the GCW-Zero, it allows to reduce the size of the
kernel file from 4.1 MiB with gzip to 3.5 MiB with ZSTD, and boots just
as fast.

Compressed kernels are now also compiled with -D__DISABLE_EXPORTS in
order to disable the EXPORT_SYMBOL() macros inside of
lib/zstd/decompress.c.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Add -D__DISABLE_EXPORTS to CFLAGS and use zstd22
    
    v3: Make memmove __weak, since it is provided for other compression
        schemes

 arch/mips/Kconfig                      |  1 +
 arch/mips/boot/compressed/Makefile     |  3 ++-
 arch/mips/boot/compressed/decompress.c |  4 ++++
 arch/mips/boot/compressed/string.c     | 17 +++++++++++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484c..b9d7c4249dc9 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1890,6 +1890,7 @@ config SYS_SUPPORTS_ZBOOT
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 
 config SYS_SUPPORTS_ZBOOT_UART16550
 	bool
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 6e56caef69f0..9a9ba77b745e 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -22,7 +22,7 @@ KBUILD_CFLAGS := $(filter-out -pg, $(KBUILD_CFLAGS))
 
 KBUILD_CFLAGS := $(filter-out -fstack-protector, $(KBUILD_CFLAGS))
 
-KBUILD_CFLAGS := $(KBUILD_CFLAGS) -D__KERNEL__ \
+KBUILD_CFLAGS := $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
 
 KBUILD_AFLAGS := $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
@@ -70,6 +70,7 @@ tool_$(CONFIG_KERNEL_LZ4)     = lz4
 tool_$(CONFIG_KERNEL_LZMA)    = lzma
 tool_$(CONFIG_KERNEL_LZO)     = lzo
 tool_$(CONFIG_KERNEL_XZ)      = xzkern
+tool_$(CONFIG_KERNEL_ZSTD)    = zstd22
 
 targets += vmlinux.bin.z
 $(obj)/vmlinux.bin.z: $(obj)/vmlinux.bin FORCE
diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index 88f5d637b1c4..c61c641674e6 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -72,6 +72,10 @@ void error(char *x)
 #include "../../../../lib/decompress_unxz.c"
 #endif
 
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
+
 const unsigned long __stack_chk_guard = 0x000a0dff;
 
 void __stack_chk_fail(void)
diff --git a/arch/mips/boot/compressed/string.c b/arch/mips/boot/compressed/string.c
index 43beecc3587c..0b593b709228 100644
--- a/arch/mips/boot/compressed/string.c
+++ b/arch/mips/boot/compressed/string.c
@@ -5,6 +5,7 @@
  * Very small subset of simple string routines
  */
 
+#include <linux/compiler_attributes.h>
 #include <linux/types.h>
 
 void *memcpy(void *dest, const void *src, size_t n)
@@ -27,3 +28,19 @@ void *memset(void *s, int c, size_t n)
 		ss[i] = c;
 	return s;
 }
+
+void * __weak memmove(void *dest, const void *src, size_t n)
+{
+	unsigned int i;
+	const char *s = src;
+	char *d = dest;
+
+	if ((uintptr_t)dest < (uintptr_t)src) {
+		for (i = 0; i < n; i++)
+			d[i] = s[i];
+	} else {
+		for (i = n; i > 0; i--)
+			d[i - 1] = s[i - 1];
+	}
+	return dest;
+}
-- 
2.28.0

