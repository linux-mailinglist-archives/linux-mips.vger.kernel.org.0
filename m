Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1419351E0C
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 20:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238009AbhDASeB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 14:34:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:53806 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235200AbhDASXj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 14:23:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A9280B1E0;
        Thu,  1 Apr 2021 12:56:45 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: [PATCH v3 2/4] MIPS: uaccess: Added __get/__put_kernel_nofault
Date:   Thu,  1 Apr 2021 14:56:35 +0200
Message-Id: <20210401125639.42963-3-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401125639.42963-1-tsbogend@alpha.franken.de>
References: <20210401125639.42963-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Added __get/__put_kernel_nofault as preparation for removing
get/set_fs.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/uaccess.h | 24 ++++++++++++++++++++++++
 arch/mips/mm/Makefile           |  4 ++++
 arch/mips/mm/maccess.c          | 10 ++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 arch/mips/mm/maccess.c

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index d273a3857809..c5cab0b8f902 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -355,6 +355,18 @@ do {									\
 	(val) = __gu_tmp.t;						\
 }
 
+#define HAVE_GET_KERNEL_NOFAULT
+
+#define __get_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	int __gu_err;							\
+									\
+	__get_kernel_common(*((type *)(dst)), sizeof(type),		\
+			    (__force type *)(src));			\
+	if (unlikely(__gu_err))						\
+		goto err_label;						\
+} while (0)
+
 #ifndef CONFIG_EVA
 #define __put_kernel_common(ptr, size) __put_user_common(ptr, size)
 #else
@@ -483,6 +495,18 @@ do {									\
 
 extern void __put_user_unknown(void);
 
+#define __put_kernel_nofault(dst, src, type, err_label)			\
+do {									\
+	type __pu_val;					\
+	int __pu_err = 0;						\
+									\
+	__pu_val = *(__force type *)(src);				\
+	__put_kernel_common(((type *)(dst)), sizeof(type));		\
+	if (unlikely(__pu_err))						\
+		goto err_label;						\
+} while (0)
+
+
 /*
  * We're generating jump to subroutines which will be outside the range of
  * jump instructions
diff --git a/arch/mips/mm/Makefile b/arch/mips/mm/Makefile
index 865926a37775..76e3ee8882fa 100644
--- a/arch/mips/mm/Makefile
+++ b/arch/mips/mm/Makefile
@@ -22,6 +22,10 @@ else
 obj-y				+= uasm-mips.o
 endif
 
+ifndef CONFIG_EVA
+obj-y				+= maccess.o
+endif
+
 obj-$(CONFIG_32BIT)		+= ioremap.o pgtable-32.o
 obj-$(CONFIG_64BIT)		+= ioremap64.o pgtable-64.o
 obj-$(CONFIG_HIGHMEM)		+= highmem.o
diff --git a/arch/mips/mm/maccess.c b/arch/mips/mm/maccess.c
new file mode 100644
index 000000000000..58173842c6be
--- /dev/null
+++ b/arch/mips/mm/maccess.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/uaccess.h>
+#include <linux/kernel.h>
+
+bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
+{
+	/* highest bit set means kernel space */
+	return (unsigned long)unsafe_src >> (BITS_PER_LONG - 1);
+}
-- 
2.29.2

