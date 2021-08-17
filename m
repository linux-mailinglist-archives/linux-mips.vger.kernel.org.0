Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DCA3EE4A0
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 04:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbhHQCz5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 22:55:57 -0400
Received: from smtpbg128.qq.com ([106.55.201.39]:26685 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233634AbhHQCz5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Aug 2021 22:55:57 -0400
X-QQ-mid: bizesmtp46t1629168851t8n9yung
Received: from localhost.localdomain (unknown [182.148.12.53])
        by esmtp6.qq.com (ESMTP) with 
        id ; Tue, 17 Aug 2021 10:54:08 +0800 (CST)
X-QQ-SSF: 0100000000200080B000B00A0000000
X-QQ-FEAT: E4g7lKGTFIA4x5jhveGo8SRp7qCU/eN5I3W6cw7KVN1q3rjUlTdibvkFuE9os
        5X4ZXCdnUnBoedEyf+T0sGQhpRxHyS4md7j93R6c77aSD/oONxUI7WF/tVl7gqyFYjJkSI7
        2AgZN6tHQ7qH1JgSN+PoV8KHzx4FGcBdF3WOD99zrCv45vPMsvyngGnrAcx8vW8jQJbfstM
        e33ck8opyV+k45NrZpH+02r/JxgkkmpF2WxmudEtguCPrdo4bYBcBSeUJ1DqLbAlbEV/RrJ
        9ME+iDmkAbzqvpfpWudKIQ42Y6tKCXd9v7obK4kBGlAk4kEVQ5/iYaihNS97Af5Wx+2A==
X-QQ-GoodBg: 0
From:   Huilong Deng <denghuilong@cdjrlc.com>
To:     tsbogend@alpha.franken.de, chenhuacai@kernel.org,
        aleksandar.qemu.devel@gmail.com
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huilong Deng <denghuilong@cdjrlc.com>
Subject: [PATCH] MIPS: Return true/false (not 1/0) from bool functions
Date:   Tue, 17 Aug 2021 10:53:38 +0800
Message-Id: <20210817025338.3552-1-denghuilong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam5
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

./arch/mips/kernel/uprobes.c:261:8-9: WARNING: return of 0/1 in function
'arch_uprobe_skip_sstep' with return type bool
./arch/mips/kernel/uprobes.c:78:10-11: WARNING: return of 0/1 in
function 'is_trap_insn' with return type bool
./arch/mips/kvm/mmu.c:489:9-10: WARNING: return of 0/1 in function
'kvm_test_age_gfn' with return type bool
./arch/mips/kvm/mmu.c:445:8-9: WARNING: return of 0/1 in function
'kvm_unmap_gfn_range' with return type bool

Signed-off-by: Huilong Deng <denghuilong@cdjrlc.com>
---
 arch/mips/kernel/uprobes.c | 10 +++++-----
 arch/mips/kvm/mmu.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/uprobes.c b/arch/mips/kernel/uprobes.c
index 6dbe4eab0a0e..9db2a6db5f62 100644
--- a/arch/mips/kernel/uprobes.c
+++ b/arch/mips/kernel/uprobes.c
@@ -75,7 +75,7 @@ bool is_trap_insn(uprobe_opcode_t *insn)
 		case tlt_op:
 		case tltu_op:
 		case tne_op:
-			return 1;
+			return true;
 		}
 		break;
 
@@ -87,12 +87,12 @@ bool is_trap_insn(uprobe_opcode_t *insn)
 		case tlti_op:
 		case tltiu_op:
 		case tnei_op:
-			return 1;
+			return true;
 		}
 		break;
 	}
 
-	return 0;
+	return false;
 }
 
 #define UPROBE_TRAP_NR	ULONG_MAX
@@ -254,9 +254,9 @@ unsigned long uprobe_get_swbp_addr(struct pt_regs *regs)
  * See if the instruction can be emulated.
  * Returns true if instruction was emulated, false otherwise.
  *
- * For now we always emulate so this function just returns 0.
+ * For now we always emulate so this function just returns false.
  */
 bool arch_uprobe_skip_sstep(struct arch_uprobe *auprobe, struct pt_regs *regs)
 {
-	return 0;
+	return false;
 }
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 6d1f68cf4edf..1bfd1b501d82 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -442,7 +442,7 @@ static int kvm_mips_mkold_gpa_pt(struct kvm *kvm, gfn_t start_gfn,
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	kvm_mips_flush_gpa_pt(kvm, range->start, range->end);
-	return 1;
+	return true;
 }
 
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -486,7 +486,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	pte_t *gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
 
 	if (!gpa_pte)
-		return 0;
+		return false;
 	return pte_young(*gpa_pte);
 }
 
-- 
2.32.0

