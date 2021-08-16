Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5D53ECEDF
	for <lists+linux-mips@lfdr.de>; Mon, 16 Aug 2021 08:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhHPGzU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 02:55:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233459AbhHPGzU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Aug 2021 02:55:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7748761A6E;
        Mon, 16 Aug 2021 06:54:46 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Subject: [PATCH] futex: Fix fault_in_user_writeable()
Date:   Mon, 16 Aug 2021 14:54:17 +0800
Message-Id: <20210816065417.3987596-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

fault_in_user_writeable() should verify R/W access but only verify W. In
most archs W implies R, but not true in MIPS and LoongArch, so fix it.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
---
 kernel/futex.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/futex.c b/kernel/futex.c
index 2ecb07575055..c3b68be31bf3 100644
--- a/kernel/futex.c
+++ b/kernel/futex.c
@@ -672,10 +672,15 @@ static int get_futex_key(u32 __user *uaddr, bool fshared, union futex_key *key,
  */
 static int fault_in_user_writeable(u32 __user *uaddr)
 {
-	struct mm_struct *mm = current->mm;
 	int ret;
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma;
 
 	mmap_read_lock(mm);
+	vma = find_vma(mm, (unsigned long)uaddr);
+	if (!(vma->vm_flags & VM_READ))
+		ret = -EFAULT;
+
 	ret = fixup_user_fault(mm, (unsigned long)uaddr,
 			       FAULT_FLAG_WRITE, NULL);
 	mmap_read_unlock(mm);
-- 
2.27.0

