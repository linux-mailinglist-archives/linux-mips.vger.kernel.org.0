Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54BFB4ECD0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 18:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbfFUQJb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 12:09:31 -0400
Received: from foss.arm.com ([217.140.110.172]:35520 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726032AbfFUQJb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Jun 2019 12:09:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A63C344;
        Fri, 21 Jun 2019 09:09:30 -0700 (PDT)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com [10.162.42.140])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 076A83F575;
        Fri, 21 Jun 2019 09:09:27 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org
Subject: [PATCH] mips/kprobes: Export kprobe_fault_handler()
Date:   Fri, 21 Jun 2019 21:39:18 +0530
Message-Id: <1561133358-8876-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Generic kprobe_page_fault() calls into kprobe_fault_handler() which must be
available with and without CONFIG_KPROBES. There is one stub implementation
for !CONFIG_KPROBES. For CONFIG_KPROBES all subscribing archs must provide
a kprobe_fault_handler() definition. Currently mips has an implementation
which is defined as 'static inline'. Make it available for generic kprobes
to comply with the above new requirement.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-mm@kvack.org

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/mips/include/asm/kprobes.h | 1 +
 arch/mips/kernel/kprobes.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/kprobes.h b/arch/mips/include/asm/kprobes.h
index 3cf8e4d..68b1e5d 100644
--- a/arch/mips/include/asm/kprobes.h
+++ b/arch/mips/include/asm/kprobes.h
@@ -41,6 +41,7 @@ do {									\
 #define kretprobe_blacklist_size 0
 
 void arch_remove_kprobe(struct kprobe *p);
+int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 
 /* Architecture specific copy of original instruction*/
 struct arch_specific_insn {
diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
index 81ba1d3..6cfae24 100644
--- a/arch/mips/kernel/kprobes.c
+++ b/arch/mips/kernel/kprobes.c
@@ -398,7 +398,7 @@ static inline int post_kprobe_handler(struct pt_regs *regs)
 	return 1;
 }
 
-static inline int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
+int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 {
 	struct kprobe *cur = kprobe_running();
 	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
-- 
2.7.4

