Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1491D312236
	for <lists+linux-mips@lfdr.de>; Sun,  7 Feb 2021 08:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBGHZa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Feb 2021 02:25:30 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45106 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229445AbhBGHZ1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Feb 2021 02:25:27 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxedWblR9gvKgHAA--.10087S2;
        Sun, 07 Feb 2021 15:24:12 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        tangyouling@loongson.cn
Subject: [PATCH v2] MIPS: crash_dump.c: Simplify copy_oldmem_page()
Date:   Sun,  7 Feb 2021 15:24:09 +0800
Message-Id: <1612682649-3389-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxedWblR9gvKgHAA--.10087S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4fAryfuw17Cw43CF4kWFg_yoW5JFWxpw
        sxC3sFkr4rK3W5JwsFvwnFka4rtw1kC3W8GrZFk3W8Z3WI9rn2va4kJFn2qrWUtry5KF4r
        AFW5Gr45CF4UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0OJeDUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace kmap_atomic_pfn() with kmap_local_pfn() which is preemptible and
can take page faults.

Remove the indirection of the dump page and the related cruft which is not
longer required.

Remove unused or redundant header files.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---

v2:
 - Keep the crash_dump.h header file included to avoid the
   "no previous prototype for function" warning.

 arch/mips/kernel/crash_dump.c | 41 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/arch/mips/kernel/crash_dump.c b/arch/mips/kernel/crash_dump.c
index 01b2bd9..2e50f551 100644
--- a/arch/mips/kernel/crash_dump.c
+++ b/arch/mips/kernel/crash_dump.c
@@ -1,11 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/highmem.h>
-#include <linux/memblock.h>
 #include <linux/crash_dump.h>
-#include <linux/uaccess.h>
-#include <linux/slab.h>
-
-static void *kdump_buf_page;
 
 /**
  * copy_oldmem_page - copy one page from "oldmem"
@@ -19,10 +14,6 @@ static void *kdump_buf_page;
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
@@ -32,36 +23,16 @@ ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
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

