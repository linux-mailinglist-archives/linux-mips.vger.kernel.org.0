Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47542457617
	for <lists+linux-mips@lfdr.de>; Fri, 19 Nov 2021 18:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhKSRyF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Nov 2021 12:54:05 -0500
Received: from aposti.net ([89.234.176.197]:51714 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231840AbhKSRyF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Nov 2021 12:54:05 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        list@opendingux.net, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: boot/compressed/: add __ashldi3 to target for ZSTD compression
Date:   Fri, 19 Nov 2021 17:50:52 +0000
Message-Id: <20211119175052.401771-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Just like before with __bswapdi2(), for MIPS pre-boot when
CONFIG_KERNEL_ZSTD=y the decompressor function will use __ashldi3(), so
the object file should be added to the target object file.

Fixes these build errors:

mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `FSE_buildDTable_internal':
decompress.c:(.text.FSE_buildDTable_internal+0x48): undefined reference to `__ashldi3'
mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `FSE_decompress_wksp_body_default':
decompress.c:(.text.FSE_decompress_wksp_body_default+0xa8): undefined reference to `__ashldi3'
mipsel-linux-ld: arch/mips/boot/compressed/decompress.o: in function `ZSTD_getFrameHeader_advanced':
decompress.c:(.text.ZSTD_getFrameHeader_advanced+0x134): undefined reference to `__ashldi3'

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 2861a05c2e0c..f27cf31b4140 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -52,7 +52,7 @@ endif
 
 vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
 
-vmlinuzobjs-$(CONFIG_KERNEL_ZSTD) += $(obj)/bswapdi.o
+vmlinuzobjs-$(CONFIG_KERNEL_ZSTD) += $(obj)/bswapdi.o $(obj)/ashldi3.o
 
 targets := $(notdir $(vmlinuzobjs-y))
 
-- 
2.33.0

