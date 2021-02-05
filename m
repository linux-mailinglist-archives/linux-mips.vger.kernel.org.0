Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7800310803
	for <lists+linux-mips@lfdr.de>; Fri,  5 Feb 2021 10:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhBEJgm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Feb 2021 04:36:42 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57206 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230202AbhBEJeY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Feb 2021 04:34:24 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT_MjDh1gETYFAA--.6719S2;
        Fri, 05 Feb 2021 17:21:40 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        tangyouling@loongson.cn
Subject: [PATCH] MIPS: crash_dump.c: Simplify copy_oldmem_page()
Date:   Fri,  5 Feb 2021 17:21:39 +0800
Message-Id: <1612516899-31285-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxT_MjDh1gETYFAA--.6719S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4fAryfuFWrWr1DZrWDurg_yoW8KF1rpr
        sIk39Fkr45K3WUJwsFvwnFka4rJwn7Ca18GrZrC3W8uw1S9rnFvFykJ3Z2qrWUtry5KF4r
        AFZ8Gr45Cr4UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUgJ5OUUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace kmap_atomic_pfn() with kmap_local_pfn() which is preemptible and
can take page faults.

Remove the indirection of the dump page and the related cruft which is not
longer required.

Remove unused or redundant header files.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/kernel/crash_dump.c | 42 ++++++------------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/arch/mips/kernel/crash_dump.c b/arch/mips/kernel/crash_dump.c
index 01b2bd9..f2eb91c 100644
--- a/arch/mips/kernel/crash_dump.c
+++ b/arch/mips/kernel/crash_dump.c
@@ -1,11 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/highmem.h>
-#include <linux/memblock.h>
-#include <linux/crash_dump.h>
-#include <linux/uaccess.h>
-#include <linux/slab.h>
-
-static void *kdump_buf_page;
 
 /**
  * copy_oldmem_page - copy one page from "oldmem"
@@ -19,10 +13,6 @@ static void *kdump_buf_page;
  *
  * Copy a page from "oldmem". For this page, there is no pte mapped
  * in the current kernel.
- *
- * Calling copy_to_user() in atomic context is not desirable. Hence first
- * copying the data to a pre-allocated kernel page and then copying to user
- * space in non-atomic context.
  */
 ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
 			 size_t csize, unsigned long offset, int userbuf)
@@ -32,36 +22,16 @@ ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
 	if (!csize)
 		return 0;
 
-	vaddr = kmap_atomic_pfn(pfn);
+	vaddr = kmap_local_pfn(pfn);
 
 	if (!userbuf) {
-		memcpy(buf, (vaddr + offset), csize);
-		kunmap_atomic(vaddr);
+		memcpy(buf, vaddr + offset, csize);
 	} else {
-		if (!kdump_buf_page) {
-			pr_warn("Kdump: Kdump buffer page not allocated\n");
-
-			return -EFAULT;
-		}
-		copy_page(kdump_buf_page, vaddr);
-		kunmap_atomic(vaddr);
-		if (copy_to_user(buf, (kdump_buf_page + offset), csize))
-			return -EFAULT;
+		if (copy_to_user(buf, vaddr + offset, csize))
+			csize = -EFAULT;
 	}
 
-	return csize;
-}
-
-static int __init kdump_buf_page_init(void)
-{
-	int ret = 0;
+	kunmap_local(vaddr);
 
-	kdump_buf_page = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!kdump_buf_page) {
-		pr_warn("Kdump: Failed to allocate kdump buffer page\n");
-		ret = -ENOMEM;
-	}
-
-	return ret;
+	return csize;
 }
-arch_initcall(kdump_buf_page_init);
-- 
2.1.0

