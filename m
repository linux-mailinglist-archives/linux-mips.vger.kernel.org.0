Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F51361C3E
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 11:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241183AbhDPIsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 04:48:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42236 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240851AbhDPIr6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Apr 2021 04:47:58 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxbcgiT3lg36UIAA--.12141S3;
        Fri, 16 Apr 2021 16:47:30 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: kdump: Provide arch_kexec_protect(unprotect)_crashkres()
Date:   Fri, 16 Apr 2021 16:47:22 +0800
Message-Id: <1618562842-20915-2-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1618562842-20915-1-git-send-email-tangyouling@loongson.cn>
References: <1618562842-20915-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID: AQAAf9AxbcgiT3lg36UIAA--.12141S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur48Aw4xJFykJw1xKw15urg_yoW8tw1fpF
        4DC345KrWUZFnIyr93Ars7u34rX3Z5Xay5K3s7Cr95ZasrXry5Xr97WF10qry8tryfKF1x
        ZFs8XFs8uwsrAaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
        6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S
        6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8ZwCF04k20xvY0x
        0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
        7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
        C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
        04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bYrchUUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 9b492cf58077 ("kexec: introduce a protection mechanism for the
crashkernel reserved memory") , provides a mechanism to protect the
memory reserved by the crashed kernel.

1) After each crash kexec loading, it simply marks the reserved memory
regions readonly since we no longer access it after that. When someone
stamps the region, the first kernel will panic and trigger the kdump.
This arch_kexec_protect_crashkres() will actually protect the reserved
memory.

2) To allow multiple loading, once 1) was done we also need to remark
the reserved memory to readwrite each time a system call related to
kdump is made. This arch_kexec_unprotect_crashkres() will undo the
protection of the reserved memory.

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/kernel/machine_kexec.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/mips/kernel/machine_kexec.c b/arch/mips/kernel/machine_kexec.c
index 432bfd3..379c2c3 100644
--- a/arch/mips/kernel/machine_kexec.c
+++ b/arch/mips/kernel/machine_kexec.c
@@ -11,6 +11,7 @@
 
 #include <asm/cacheflush.h>
 #include <asm/page.h>
+#include <asm/set_memory.h>
 
 extern const unsigned char relocate_new_kernel[];
 extern const size_t relocate_new_kernel_size;
@@ -205,6 +206,45 @@ void kexec_reboot(void)
 	do_kexec();
 }
 
+static int
+kexec_mark_range(unsigned long start, unsigned long end, bool protect)
+{
+	struct page *page;
+	unsigned int nr_pages;
+
+	/*
+	 * For physical range: [start, end]. We must skip the unassigned
+	 * crashk resource with zero-valued "end" member.
+	 */
+	if (!end || start > end)
+		return 0;
+
+	page = pfn_to_page(start >> PAGE_SHIFT);
+	nr_pages = (end >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
+	if (protect)
+		return set_pages_ro(page, nr_pages);
+	else
+		return set_pages_rw(page, nr_pages);
+}
+
+static void
+kexec_mark_crashkres(bool protect)
+{
+	kexec_mark_range(crashk_res.start, crashk_res.end, protect);
+}
+
+void
+arch_kexec_protect_crashkres(void)
+{
+	kexec_mark_crashkres(true);
+}
+
+void
+arch_kexec_unprotect_crashkres(void)
+{
+	kexec_mark_crashkres(false);
+}
+
 void
 machine_kexec(struct kimage *image)
 {
-- 
2.1.0

