Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD9A2FEFCF
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 17:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731633AbhAUQIN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 11:08:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:52910 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731852AbhAUQFO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 11:05:14 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6DD20AB7A;
        Thu, 21 Jan 2021 16:04:22 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] MIPS: mm: abort uaccess retries upon fatal signal
Date:   Thu, 21 Jan 2021 17:04:16 +0100
Message-Id: <20210121160416.111298-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When there's a fatal signal pending, MIPS's do_page_fault()
implementation returns. The intent is that we'll return to the
faulting userspace instruction, delivering the signal on the way.

However, if we take a fatal signal during fixing up a uaccess, this
results in a return to the faulting kernel instruction, which will be
instantly retried, resulting in the same fault being taken forever. As
the task never reaches userspace, the signal is not delivered, and the
task is left unkillable. While the task is stuck in this state, it can
inhibit the forward progress of the system.

To avoid this, we must ensure that when a fatal signal is pending, we
apply any necessary fixup for a faulting kernel instruction. Thus we
will return to an error path, and it is up to that code to make forward
progress towards delivering the fatal signal.

[ Description taken from commit 746a272e4414 ("ARM: 8692/1: mm: abort
   uaccess retries upon fatal signal") ]

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/mm/fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 7c871b14e74a..e7abda9c013f 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -156,8 +156,11 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 	 */
 	fault = handle_mm_fault(vma, address, flags, regs);
 
-	if (fault_signal_pending(fault, regs))
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			goto no_context;
 		return;
+	}
 
 	if (unlikely(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_OOM)
-- 
2.29.2

