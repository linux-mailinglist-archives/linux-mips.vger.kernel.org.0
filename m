Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495F33BA231
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jul 2021 16:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhGBOb5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jul 2021 10:31:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:58056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232677AbhGBOb5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Jul 2021 10:31:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FF3B61427;
        Fri,  2 Jul 2021 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625236164;
        bh=64CD+XV1kvpA4iaQPcx3V6TJ1lbYAzNmgJWPg7WUcEQ=;
        h=From:To:Cc:Subject:Date:From;
        b=lvG/vlIQkzIN2V9lY0ULCj7rz6y42uTmJJiwmt+L5kvDaqJKDoiiNPXCpl1U/SfS8
         0x0mvs0qrkeAN5Q2xwNdAOlUpnHG9GGKrJ331VqGoewBY9RPj+e3FZLIsmvLO1lTj/
         viaqDRj7K2na73LtjyVGryVyj6lpd1tcX2LfwfflAdL5QCyDi120lNNnfYY+jPX3tG
         VMnPdz7NS4u/3zTtgRL78/FEP12YlKqd4ii8zJ/aLg4SoggJQvmtPOfRIHz13a5lYX
         IsTr6iHY0gAsfLhSMvyfeWAJv6ICWtLfojRhr+hRcPAWE+/rD+hVTYmsfvEI8xcSHU
         EBgRQAL1ZJPNg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Alexander Lobakin <alobakin@pm.me>,
        Xingxing Su <suxingxing@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alban Bedel <albeu@free.fr>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mips: always link byteswap helpers into decompressor
Date:   Fri,  2 Jul 2021 16:28:37 +0200
Message-Id: <20210702142919.392532-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

My series to clean up the unaligned access implementation
across architectures caused some mips randconfig builds to
fail with:

   mips64-linux-ld: arch/mips/boot/compressed/decompress.o: in function `decompress_kernel':
   decompress.c:(.text.decompress_kernel+0x54): undefined reference to `__bswapsi2'

It turns out that this problem has already been fixed for the XZ
decompressor but now it also shows up in (at least) LZO and LZ4.  From my
analysis I concluded that the compiler could always have emitted those
calls, but the different implementation allowed it to make otherwise
better decisions about not inlining the byteswap, which results in the
link error when the out-of-line code is missing.

While it could be addressed by adding it to the two decompressor
implementations that are known to be affected, but as this only adds
112 bytes to the kernel, the safer choice is to always add them.

Fixes: c50ec6787536 ("MIPS: zboot: Fix the build with XZ compression on older GCC versions")
Fixes: 0652035a5794 ("asm-generic: unaligned: remove byteshift helpers")
Link: https://lore.kernel.org/linux-mm/202106301304.gz2wVY9w-lkp@intel.com/
Link: https://lore.kernel.org/linux-mm/202106260659.TyMe8mjr-lkp@intel.com/
Link: https://lore.kernel.org/linux-mm/202106172016.onWT6Tza-lkp@intel.com/
Link: https://lore.kernel.org/linux-mm/202105231743.JJcALnhS-lkp@intel.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/boot/compressed/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index e4b7839293e1..3548b3b45269 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -40,7 +40,7 @@ GCOV_PROFILE := n
 UBSAN_SANITIZE := n
 
 # decompressor objects (linked with vmlinuz)
-vmlinuzobjs-y := $(obj)/head.o $(obj)/decompress.o $(obj)/string.o
+vmlinuzobjs-y := $(obj)/head.o $(obj)/decompress.o $(obj)/string.o $(obj)/bswapsi.o
 
 ifdef CONFIG_DEBUG_ZBOOT
 vmlinuzobjs-$(CONFIG_DEBUG_ZBOOT)		   += $(obj)/dbg.o
@@ -54,7 +54,7 @@ extra-y += uart-ath79.c
 $(obj)/uart-ath79.c: $(srctree)/arch/mips/ath79/early_printk.c
 	$(call cmd,shipped)
 
-vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o $(obj)/bswapsi.o
+vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
 
 extra-y += ashldi3.c
 $(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
-- 
2.29.2

