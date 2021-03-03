Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EAC32C892
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239893AbhCDAut (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:49 -0500
Received: from aposti.net ([89.234.176.197]:37442 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1387802AbhCCTea (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 14:34:30 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh@kernel.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
Date:   Wed,  3 Mar 2021 19:33:05 +0000
Message-Id: <20210303193305.924384-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since 5.12-rc1, the Device Tree blob must now be properly aligned.

Therefore, the decompress routine must be careful to copy the blob at
the next aligned address after the kernel image.

This commit fixes the kernel sometimes not booting with a Device Tree
blob appended to it.

Fixes: c4d5e638d6e9 ("scripts/dtc: Update to upstream version v1.6.0-51-g183df9e9c2b9")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/compressed/decompress.c | 8 ++++++++
 arch/mips/kernel/vmlinux.lds.S         | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index e3946b06e840..3d70d15ada28 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -14,6 +14,7 @@
 
 #include <asm/addrspace.h>
 #include <asm/unaligned.h>
+#include <asm-generic/vmlinux.lds.h>
 
 /*
  * These two variables specify the free mem region
@@ -120,6 +121,13 @@ void decompress_kernel(unsigned long boot_heap_start)
 		/* last four bytes is always image size in little endian */
 		image_size = get_unaligned_le32((void *)&__image_end - 4);
 
+		/* The device tree's address must be properly aligned  */
+		image_size = ALIGN(image_size, STRUCT_ALIGNMENT);
+
+		puts("Copy device tree to address  ");
+		puthex(VMLINUX_LOAD_ADDRESS_ULL + image_size);
+		puts("\n");
+
 		/* copy dtb to where the booted kernel will expect it */
 		memcpy((void *)VMLINUX_LOAD_ADDRESS_ULL + image_size,
 		       __appended_dtb, dtb_size);
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index c1c345be04ff..4b4e39b7c79b 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -145,6 +145,7 @@ SECTIONS
 	}
 
 #ifdef CONFIG_MIPS_ELF_APPENDED_DTB
+	STRUCT_ALIGN();
 	.appended_dtb : AT(ADDR(.appended_dtb) - LOAD_OFFSET) {
 		*(.appended_dtb)
 		KEEP(*(.appended_dtb))
@@ -172,6 +173,7 @@ SECTIONS
 #endif
 
 #ifdef CONFIG_MIPS_RAW_APPENDED_DTB
+	STRUCT_ALIGN();
 	__appended_dtb = .;
 	/* leave space for appended DTB */
 	. += 0x100000;
-- 
2.30.1

