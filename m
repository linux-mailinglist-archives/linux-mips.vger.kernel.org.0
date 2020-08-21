Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01A624DAE4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 18:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgHUQaU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 12:30:20 -0400
Received: from crapouillou.net ([89.234.176.41]:35796 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728425AbgHUQaO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 12:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598027396; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RifMBFx/nbpWkzeRqw74bJXtPQaC6IDxv1pTPqH3vrg=;
        b=j6JJwQUJOxWjIC98gubKgK0Gs4nJ8aMpVKCOaGGmhfVUVAYdkb+T8RwfQziCxKbPWqwGFQ
        9+tbXgYyTQSMZ7CVeDSnyx7NULyydui6SZLUA9Xj9MMEmKCjlChv6k2twhcPMGu76iaz15
        D9AsOsVTdWGxY4CIxwO2vjcNOSF0DR0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Nick Terrell <terrelln@fb.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] MIPS: Add support for ZSTD-compressed kernels
Date:   Fri, 21 Aug 2020 18:29:48 +0200
Message-Id: <20200821162948.146947-2-paul@crapouillou.net>
In-Reply-To: <20200821162948.146947-1-paul@crapouillou.net>
References: <20200821162948.146947-1-paul@crapouillou.net>
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

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/Kconfig                      |  1 +
 arch/mips/boot/compressed/Makefile     |  1 +
 arch/mips/boot/compressed/decompress.c |  4 ++++
 arch/mips/boot/compressed/string.c     | 16 ++++++++++++++++
 4 files changed, 22 insertions(+)

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
index 6e56caef69f0..86ddc6fc16f4 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -70,6 +70,7 @@ tool_$(CONFIG_KERNEL_LZ4)     = lz4
 tool_$(CONFIG_KERNEL_LZMA)    = lzma
 tool_$(CONFIG_KERNEL_LZO)     = lzo
 tool_$(CONFIG_KERNEL_XZ)      = xzkern
+tool_$(CONFIG_KERNEL_ZSTD)    = zstd
 
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
index 43beecc3587c..ab95722ec0c9 100644
--- a/arch/mips/boot/compressed/string.c
+++ b/arch/mips/boot/compressed/string.c
@@ -27,3 +27,19 @@ void *memset(void *s, int c, size_t n)
 		ss[i] = c;
 	return s;
 }
+
+void *memmove(void *dest, const void *src, size_t n)
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

