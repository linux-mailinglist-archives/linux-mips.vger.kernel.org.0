Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D22D1B3B6B
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 11:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDVJci (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 05:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725912AbgDVJci (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 05:32:38 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351EDC03C1A8
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2020 02:32:38 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e6so680352pjt.4
        for <linux-mips@vger.kernel.org>; Wed, 22 Apr 2020 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XEEsCtAYbKR+pYwJm+o5/IDb4vN9ZLQcBvFQgqngBig=;
        b=apntUYrk/SXPfD2ExWuE2pvoQVTwdJqb6aX4VaUDeQDlC5xpaSfIjdfsKIke7alvkf
         T++axvQDZypD04Q0CD4sDzXXl+OUM6jJat85e32hkkwg64IvqipGu61gegCfBsp8t5Rx
         LIAk0wXRDn1WLqRuaCMxzl3256PPmCVBI0sFuDkIJ52MYBw89AmDDzo0Fz32eT1OoUQ0
         8QdYphnFD2R76nMF3CtLvYVd5OppFJbtrPQJFmLMZ23TcMboNuKdfwojlkKR9pYvBq1j
         rC2PhLZaNQC75WnUmdrH08JNT9xT93VlGnc9pTklWyJV1vKXm3Zkf+ocvZrQFBvKCXdN
         2XVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XEEsCtAYbKR+pYwJm+o5/IDb4vN9ZLQcBvFQgqngBig=;
        b=kUjr4tV0k3nLUNY8EleWmSaT56edGPSIb62JspjI5lWxKI3DuB/SfG3UubnVngy1O3
         gNgb77ZoQJs8YHtIKvKJpoFfSB3jznBeqev2BH9JY1lxOJKdey8U8ojMrohI8Z0pfoku
         dwM1BQ3i7EG3SpdAySIWJcq6d3LXcxIZNY3iA/LQqf9X49N40wJzDfe8JyHmCNbWNZEW
         +KD1SFGIdzKdupXUMGWgYgZOJux9pfe/l9xD2oQMGGW4gziiHB6XNu8h0mxGK+Klv5wO
         rphxPFoMNhZ91UqOyOTmcVm+Yws5BhFZQBPwT2uFZEA0DaUlAZ4/thjZgwXyphp+60AH
         ylIg==
X-Gm-Message-State: AGi0PuZj808YcS7qrH7z1cqsaGJJs4pSZped2T4UDilSoMpg5gxts2YN
        7f0Mneo7COmh8ekmtY0LvKjCBXd8130=
X-Google-Smtp-Source: APiQypIsovUQ7Ms7gnNJrEVdQeCgo9QQR10HZbPuBSX2H8yQJT2U3EcyH3kt2ECv832QOAPC+mKfUw==
X-Received: by 2002:a17:90a:22e9:: with SMTP id s96mr10483017pjc.46.1587547957749;
        Wed, 22 Apr 2020 02:32:37 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id n69sm4957772pjc.8.2020.04.22.02.32.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 02:32:37 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: [PATCH V2 3/3] MIPS: Loongson-3: Add some unaligned instructions emulation
Date:   Wed, 22 Apr 2020 17:40:22 +0800
Message-Id: <1587548422-10707-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1587548422-10707-1-git-send-email-chenhc@lemote.com>
References: <1587548422-10707-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1, Add unaligned gslq, gssq, gslqc1, gssqc1 emulation;
2, Add unaligned gsl{h, w, d}x, gss{h, w, d}x emulation;
3, Add unaligned gslwxc1, gsswxc1, gsldxc1, gssdxc1 emulation.

Signed-off-by: Pei Huang <huangpei@loongson.cn>
Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/uapi/asm/inst.h |  26 ++++
 arch/mips/loongson64/cop2-ex.c    | 274 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 299 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/uapi/asm/inst.h b/arch/mips/include/uapi/asm/inst.h
index eaa3a80..98f97c8 100644
--- a/arch/mips/include/uapi/asm/inst.h
+++ b/arch/mips/include/uapi/asm/inst.h
@@ -989,6 +989,30 @@ struct mm16_r5_format {		/* Load/store from stack pointer format */
 };
 
 /*
+ * Loongson-3 overridden COP2 instruction formats (32-bit length)
+ */
+struct loongson3_lswc2_format {	/* Loongson-3 overridden lwc2/swc2 Load/Store format */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(unsigned int base : 5,
+	__BITFIELD_FIELD(unsigned int rt : 5,
+	__BITFIELD_FIELD(unsigned int fr : 1,
+	__BITFIELD_FIELD(unsigned int offset : 9,
+	__BITFIELD_FIELD(unsigned int ls : 1,
+	__BITFIELD_FIELD(unsigned int rq : 5,
+	;)))))))
+};
+
+struct loongson3_lsdc2_format {	/* Loongson-3 overridden ldc2/sdc2 Load/Store format */
+	__BITFIELD_FIELD(unsigned int opcode : 6,
+	__BITFIELD_FIELD(unsigned int base : 5,
+	__BITFIELD_FIELD(unsigned int rt : 5,
+	__BITFIELD_FIELD(unsigned int index : 5,
+	__BITFIELD_FIELD(unsigned int offset : 8,
+	__BITFIELD_FIELD(unsigned int opcode1 : 3,
+	;))))))
+};
+
+/*
  * MIPS16e instruction formats (16-bit length)
  */
 struct m16e_rr {
@@ -1088,6 +1112,8 @@ union mips_instruction {
 	struct mm16_rb_format mm16_rb_format;
 	struct mm16_r3_format mm16_r3_format;
 	struct mm16_r5_format mm16_r5_format;
+	struct loongson3_lswc2_format loongson3_lswc2_format;
+	struct loongson3_lsdc2_format loongson3_lsdc2_format;
 };
 
 union mips16e_instruction {
diff --git a/arch/mips/loongson64/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
index 9efdfe4..2269dc5 100644
--- a/arch/mips/loongson64/cop2-ex.c
+++ b/arch/mips/loongson64/cop2-ex.c
@@ -14,17 +14,29 @@
 #include <linux/sched.h>
 #include <linux/notifier.h>
 #include <linux/ptrace.h>
+#include <linux/uaccess.h>
+#include <linux/sched/signal.h>
 
 #include <asm/fpu.h>
 #include <asm/cop2.h>
+#include <asm/inst.h>
+#include <asm/branch.h>
 #include <asm/current.h>
 #include <asm/mipsregs.h>
 
 static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 	void *data)
 {
-	int fpu_owned;
+	unsigned int res, fpu_owned;
+	unsigned long ra, value, value_next;
+	union mips_instruction insn;
 	int fr = !test_thread_flag(TIF_32BIT_FPREGS);
+	struct pt_regs *regs = (struct pt_regs *)data;
+	void __user *addr = (void __user *)regs->cp0_badvaddr;
+	unsigned int __user *pc = (unsigned int __user *)exception_epc(regs);
+
+	ra = regs->regs[31];
+	__get_user(insn.word, pc);
 
 	switch (action) {
 	case CU2_EXCEPTION:
@@ -49,9 +61,269 @@ static int loongson_cu2_call(struct notifier_block *nfb, unsigned long action,
 		preempt_enable();
 
 		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_LWC2_OP:
+		if(insn.loongson3_lswc2_format.ls == 0)
+			goto sigbus;
+
+		if (insn.loongson3_lswc2_format.fr == 0) {	/* gslq */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+
+			LoadDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			regs->regs[insn.loongson3_lswc2_format.rt] = value;
+			regs->regs[insn.loongson3_lswc2_format.rq] = value_next;
+			compute_return_epc(regs);
+		} else {					/* gslqc1 */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+			LoadDW(addr+8, value_next, res);
+			if (res)
+				goto fault;
+
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rt, value);
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rq, value_next);
+			compute_return_epc(regs);
+			own_fpu(1);
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_SWC2_OP:
+		if(insn.loongson3_lswc2_format.ls == 0)
+			goto sigbus;
+
+		if (insn.loongson3_lswc2_format.fr == 0) {	/* gssq */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			/* write upper 8 bytes first */
+			value_next = regs->regs[insn.loongson3_lswc2_format.rq];
+
+			StoreDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			value = regs->regs[insn.loongson3_lswc2_format.rt];
+
+			StoreDW(addr, value, res);
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+		} else {					/* gssqc1 */
+			if (!access_ok(addr, 16))
+				goto sigbus;
+
+			lose_fpu(1);
+			value_next = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rq);
+
+			StoreDW(addr + 8, value_next, res);
+			if (res)
+				goto fault;
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lswc2_format.rt);
+
+			StoreDW(addr, value, res);
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_LDC2_OP:
+		switch (insn.loongson3_lsdc2_format.opcode1) {
+		/*
+		 * Loongson-3 overridden ldc2 instructions.
+		 * opcode1              instruction
+		 *   0x1          gslhx: load 2 bytes to GPR
+		 *   0x2          gslwx: load 4 bytes to GPR
+		 *   0x3          gsldx: load 8 bytes to GPR
+		 *   0x6	  gslwxc1: load 4 bytes to FPR
+		 *   0x7	  gsldxc1: load 8 bytes to FPR
+		 */
+		case 0x1:
+			if (!access_ok(addr, 2))
+				goto sigbus;
+
+			LoadHW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x2:
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			LoadW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x3:
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			LoadDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			regs->regs[insn.loongson3_lsdc2_format.rt] = value;
+			break;
+		case 0x6:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadW(addr, value, res);
+			if (res)
+				goto fault;
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt, value);
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		case 0x7:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			lose_fpu(1);
+			LoadDW(addr, value, res);
+			if (res)
+				goto fault;
+			set_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt, value);
+			compute_return_epc(regs);
+			own_fpu(1);
+			break;
+
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	case CU2_SDC2_OP:
+		switch (insn.loongson3_lsdc2_format.opcode1) {
+		/*
+		 * Loongson-3 overridden sdc2 instructions.
+		 * opcode1              instruction
+		 *   0x1          gsshx: store 2 bytes from GPR
+		 *   0x2          gsswx: store 4 bytes from GPR
+		 *   0x3          gssdx: store 8 bytes from GPR
+		 *   0x6          gsswxc1: store 4 bytes from FPR
+		 *   0x7          gssdxc1: store 8 bytes from FPR
+		 */
+		case 0x1:
+			if (!access_ok(addr, 2))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreHW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+		case 0x2:
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+		case 0x3:
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			compute_return_epc(regs);
+			value = regs->regs[insn.loongson3_lsdc2_format.rt];
+
+			StoreDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			break;
+
+		case 0x6:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+
+			if (!access_ok(addr, 4))
+				goto sigbus;
+
+			lose_fpu(1);
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt);
+
+			StoreW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		case 0x7:
+			die_if_kernel("Unaligned FP access in kernel code", regs);
+			BUG_ON(!used_math());
+
+			if (!access_ok(addr, 8))
+				goto sigbus;
+
+			lose_fpu(1);
+			value = get_fpr64(current->thread.fpu.fpr, insn.loongson3_lsdc2_format.rt);
+
+			StoreDW(addr, value, res);
+
+			if (res)
+				goto fault;
+			compute_return_epc(regs);
+			own_fpu(1);
+
+			break;
+		}
+		return NOTIFY_STOP;	/* Don't call default notifier */
 	}
 
 	return NOTIFY_OK;		/* Let default notifier send signals */
+
+fault:
+	/* roll back jump/branch */
+	regs->regs[31] = ra;
+	regs->cp0_epc = (unsigned long)pc;
+	/* Did we have an exception handler installed? */
+	if (fixup_exception(regs))
+		return NOTIFY_STOP;	/* Don't call default notifier */
+
+	die_if_kernel("Unhandled kernel unaligned access", regs);
+	force_sig(SIGSEGV);
+
+	return NOTIFY_STOP;	/* Don't call default notifier */
+
+sigbus:
+	die_if_kernel("Unhandled kernel unaligned access", regs);
+	force_sig(SIGBUS);
+
+	return NOTIFY_STOP;	/* Don't call default notifier */
 }
 
 static int __init loongson_cu2_setup(void)
-- 
2.7.0

